`timescale 1ns / 1ps

// CNN Accelerator AXI-Stream Wrapper (Hardware/Software Co-Design)
// Computes Conv1 -> Pool1 -> Conv2 -> Pool2
// FC layers are computed on the Python side.

(* control_set_opt_threshold = "0" *)
module cnn_accelerator (
    input wire aclk,
    input wire aresetn,
    
    // AXI-Stream Slave (Data In from DMA/PS)
    input wire [31:0] s_axis_tdata,
    input wire s_axis_tvalid,
    output wire s_axis_tready,
    input wire s_axis_tlast,
    
    // AXI-Stream Master (Data Out to DMA/PS)
    output wire [31:0] m_axis_tdata,
    output wire m_axis_tvalid,
    input wire m_axis_tready,
    output wire m_axis_tlast
);

    // -------------------------------------------------------------------------
    // BRAM Memories (Inferred)
    // -------------------------------------------------------------------------
    (* rom_style = "block" *) reg signed [15:0] bram_wgt [0:5087];
    (* ram_style = "block" *) reg signed [15:0] bram_img [0:3071];
    (* ram_style = "block" *) reg signed [15:0] bram_conv1 [0:16383];
    (* ram_style = "block" *) reg signed [15:0] bram_pool1 [0:4095];
    (* ram_style = "block" *) reg signed [15:0] bram_conv2 [0:8191];
    (* ram_style = "block" *) reg signed [15:0] bram_pool2 [0:2047];

    initial begin
        $readmemh("conv_weights.mem", bram_wgt);
    end

    // -------------------------------------------------------------------------
    // State Machine
    // -------------------------------------------------------------------------
    localparam IDLE         = 0;
    localparam RECV_IMG     = 1;
    localparam CONV1_START  = 2;
    localparam CONV1_READ   = 3;
    localparam CONV1_WAIT   = 4;
    localparam CONV1_MAC    = 5;
    localparam CONV1_WRITE  = 6;
    localparam POOL1_START  = 7;
    localparam POOL1_READ   = 8;
    localparam POOL1_WAIT   = 9;
    localparam POOL1_MAX    = 10;
    localparam POOL1_WRITE  = 11;
    localparam CONV2_START  = 12;
    localparam CONV2_READ   = 13;
    localparam CONV2_WAIT   = 14;
    localparam CONV2_MAC    = 15;
    localparam CONV2_WRITE  = 16;
    localparam POOL2_START  = 17;
    localparam POOL2_READ   = 18;
    localparam POOL2_WAIT   = 19;
    localparam POOL2_MAX    = 20;
    localparam POOL2_WRITE  = 21;
    localparam SEND_PREP    = 22;
    localparam SEND_RES     = 23;
    localparam CONV1_BIAS_WAIT = 24;
    localparam CONV2_BIAS_WAIT = 25;

    reg [4:0] state;

    // Loop Counters
    reg [4:0] oc, ic;
    reg signed [5:0] y, x;
    reg signed [3:0] ky, kx;
    reg [4:0] py, px;
    reg [1:0] dy, dx;
    reg [11:0] pixel_count;
    reg [11:0] send_count;

    // Computation Registers
    reg signed [31:0] sum;
    reg signed [15:0] img_val, wgt_val;
    reg signed [15:0] max_val;

    assign s_axis_tready = (state == RECV_IMG);
    assign m_axis_tdata  = {16'd0, bram_pool2[send_count]};
    assign m_axis_tvalid = (state == SEND_RES);
    assign m_axis_tlast  = (state == SEND_RES && send_count == 2047);

    // Helpers
    wire signed [5:0] cy1 = y + ky;
    wire signed [5:0] cx1 = x + kx;
    wire valid_pixel1 = (cy1 >= 0 && cy1 < 32 && cx1 >= 0 && cx1 < 32);
    
    wire signed [5:0] cy2 = y + ky;
    wire signed [5:0] cx2 = x + kx;
    wire valid_pixel2 = (cy2 >= 0 && cy2 < 16 && cx2 >= 0 && cx2 < 16);

    // Q8.8 Activation (ReLU)
    function signed [15:0] relu;
        input signed [31:0] val;
        begin
            if (val < 0) relu = 0;
            else if (val > 32767) relu = 32767;
            else relu = val[15:0];
        end
    endfunction

    always @(posedge aclk) begin
        if (!aresetn) begin
            state <= IDLE;
        end else begin
            case (state)
                // -------------------------------------
                // IDLE & RECV_IMG
                // -------------------------------------
                IDLE: begin
                    pixel_count <= 0;
                    if (s_axis_tvalid) begin
                        state <= RECV_IMG;
                    end
                end
                
                RECV_IMG: begin
                    if (s_axis_tvalid) begin
                        bram_img[pixel_count] <= s_axis_tdata[15:0];
                        if (pixel_count == 3071) begin
                            state <= CONV1_START;
                            oc <= 0; y <= 0; x <= 0;
                        end else begin
                            pixel_count <= pixel_count + 1;
                        end
                    end
                end

                // -------------------------------------
                // CONV1 (3x32x32 -> 16x32x32)
                // -------------------------------------
                CONV1_START: begin
                    ic <= 0; ky <= -1; kx <= -1;
                    state <= CONV1_BIAS_WAIT;
                end
                
                CONV1_BIAS_WAIT: begin
                    sum <= bram_wgt[432 + oc] <<< 8; // Load Bias (shift to align with MAC)
                    state <= CONV1_READ;
                end
                
                CONV1_READ: begin
                    state <= CONV1_WAIT;
                end

                CONV1_WAIT: begin
                    if (valid_pixel1) img_val <= bram_img[ic * 1024 + cy1 * 32 + cx1];
                    else img_val <= 0;
                    wgt_val <= bram_wgt[oc * 27 + ic * 9 + (ky+1) * 3 + (kx+1)];
                    state <= CONV1_MAC;
                end
                
                CONV1_MAC: begin
                    sum <= sum + (img_val * wgt_val); // MAC
                    
                    if (kx == 1) begin
                        kx <= -1;
                        if (ky == 1) begin
                            ky <= -1;
                            if (ic == 2) begin
                                state <= CONV1_WRITE;
                            end else begin ic <= ic + 1; state <= CONV1_READ; end
                        end else begin ky <= ky + 1; state <= CONV1_READ; end
                    end else begin kx <= kx + 1; state <= CONV1_READ; end
                end
                
                CONV1_WRITE: begin
                    bram_conv1[oc * 1024 + y * 32 + x] <= relu(sum >>> 8);
                    if (x == 31) begin
                        x <= 0;
                        if (y == 31) begin
                            y <= 0;
                            if (oc == 15) begin
                                state <= POOL1_START;
                                oc <= 0; py <= 0; px <= 0;
                            end else begin oc <= oc + 1; state <= CONV1_START; end
                        end else begin y <= y + 1; state <= CONV1_START; end
                    end else begin x <= x + 1; state <= CONV1_START; end
                end

                // -------------------------------------
                // POOL1 (16x32x32 -> 16x16x16)
                // -------------------------------------
                POOL1_START: begin
                    dy <= 0; dx <= 0; max_val <= -32768;
                    state <= POOL1_READ;
                end
                
                POOL1_READ: begin
                    state <= POOL1_WAIT;
                end

                POOL1_WAIT: begin
                    img_val <= bram_conv1[oc * 1024 + (py*2 + dy) * 32 + (px*2 + dx)];
                    state <= POOL1_MAX;
                end
                
                POOL1_MAX: begin
                    if (img_val > max_val) max_val <= img_val;
                    if (dx == 1) begin
                        dx <= 0;
                        if (dy == 1) state <= POOL1_WRITE;
                        else begin dy <= 1; state <= POOL1_READ; end
                    end else begin dx <= 1; state <= POOL1_READ; end
                end
                
                POOL1_WRITE: begin
                    bram_pool1[oc * 256 + py * 16 + px] <= max_val;
                    if (px == 15) begin
                        px <= 0;
                        if (py == 15) begin
                            py <= 0;
                            if (oc == 15) begin
                                state <= CONV2_START;
                                oc <= 0; y <= 0; x <= 0;
                            end else begin oc <= oc + 1; state <= POOL1_START; end
                        end else begin py <= py + 1; state <= POOL1_START; end
                    end else begin px <= px + 1; state <= POOL1_START; end
                end

                // -------------------------------------
                // CONV2 (16x16x16 -> 32x16x16)
                // -------------------------------------
                CONV2_START: begin
                    ic <= 0; ky <= -1; kx <= -1;
                    state <= CONV2_BIAS_WAIT;
                end
                
                CONV2_BIAS_WAIT: begin
                    sum <= bram_wgt[5056 + oc] <<< 8; // Load Bias
                    state <= CONV2_READ;
                end
                
                CONV2_READ: begin
                    state <= CONV2_WAIT;
                end

                CONV2_WAIT: begin
                    if (valid_pixel2) img_val <= bram_pool1[ic * 256 + cy2 * 16 + cx2];
                    else img_val <= 0;
                    wgt_val <= bram_wgt[448 + oc * 144 + ic * 9 + (ky+1) * 3 + (kx+1)];
                    state <= CONV2_MAC;
                end
                
                CONV2_MAC: begin
                    sum <= sum + (img_val * wgt_val); // MAC
                    
                    if (kx == 1) begin
                        kx <= -1;
                        if (ky == 1) begin
                            ky <= -1;
                            if (ic == 15) begin
                                state <= CONV2_WRITE;
                            end else begin ic <= ic + 1; state <= CONV2_READ; end
                        end else begin ky <= ky + 1; state <= CONV2_READ; end
                    end else begin kx <= kx + 1; state <= CONV2_READ; end
                end
                
                CONV2_WRITE: begin
                    bram_conv2[oc * 256 + y * 16 + x] <= relu(sum >>> 8);
                    if (x == 15) begin
                        x <= 0;
                        if (y == 15) begin
                            y <= 0;
                            if (oc == 31) begin
                                state <= POOL2_START;
                                oc <= 0; py <= 0; px <= 0;
                            end else begin oc <= oc + 1; state <= CONV2_START; end
                        end else begin y <= y + 1; state <= CONV2_START; end
                    end else begin x <= x + 1; state <= CONV2_START; end
                end

                // -------------------------------------
                // POOL2 (32x16x16 -> 32x8x8)
                // -------------------------------------
                POOL2_START: begin
                    dy <= 0; dx <= 0; max_val <= -32768;
                    state <= POOL2_READ;
                end
                
                POOL2_READ: begin
                    state <= POOL2_WAIT;
                end

                POOL2_WAIT: begin
                    img_val <= bram_conv2[oc * 256 + (py*2 + dy) * 16 + (px*2 + dx)];
                    state <= POOL2_MAX;
                end
                
                POOL2_MAX: begin
                    if (img_val > max_val) max_val <= img_val;
                    if (dx == 1) begin
                        dx <= 0;
                        if (dy == 1) state <= POOL2_WRITE;
                        else begin dy <= 1; state <= POOL2_READ; end
                    end else begin dx <= 1; state <= POOL2_READ; end
                end
                
                // -------------------------------------
                // SEND_PREP & SEND_RES 
                // -------------------------------------
                POOL2_WRITE: begin
                    bram_pool2[oc * 64 + py * 8 + px] <= max_val;
                    if (px == 7) begin
                        px <= 0;
                        if (py == 7) begin
                            py <= 0;
                            if (oc == 31) begin
                                state <= SEND_PREP;
                                send_count <= 0;
                            end else begin oc <= oc + 1; state <= POOL2_START; end
                        end else begin py <= py + 1; state <= POOL2_START; end
                    end else begin px <= px + 1; state <= POOL2_START; end
                end

                // -------------------------------------
                // SEND_PREP & SEND_RES 
                // -------------------------------------
                SEND_PREP: begin
                    // Wait 1 cycle for bram_pool2[send_count] to be read
                    state <= SEND_RES;
                end
                
                SEND_RES: begin
                    if (m_axis_tready) begin
                        if (send_count == 2047) begin
                            state <= IDLE;
                        end else begin
                            send_count <= send_count + 1;
                            state <= SEND_PREP;
                        end
                    end
                end
            endcase
        end
    end
endmodule

