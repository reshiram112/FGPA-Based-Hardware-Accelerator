`timescale 1ns / 1ps

// BNN Pothole Accelerator AXI-Stream Wrapper
// Implements the Binarized Neural Network (BNN) for pothole detection.
// Uses XNOR-Popcount logic for the fully connected layers.

module bnn_accelerator (
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

    // Include the generated weights (make sure path is correct during synthesis)
    `include "../weight_extraction/verilog_headers/bnn_pothole_weights.vh"
    `include "../weight_extraction/verilog_headers/bnn_pothole_bn_params.vh"

    // -------------------------------------------------------------------------
    // State Machine Definitions
    // -------------------------------------------------------------------------
    localparam IDLE         = 3'd0;
    localparam RECV_FEAT    = 3'd1; // Receiving 2048 binarized features (64 words)
    localparam COMPUTE_FC1  = 3'd2; // XNOR-Popcount for FC1 (256 output neurons)
    localparam COMPUTE_FC2  = 3'd3; // XNOR-Popcount for FC2 (2 output neurons)
    localparam SEND_RESULT  = 3'd4; // Send final classification

    reg [2:0] state, next_state;

    // Buffer for input binarized features (2048 bits = 64 * 32-bit words)
    reg [31:0] input_buffer [0:63];
    reg [6:0] word_count;

    // Output buffer for FC1 (256 bits = 8 * 32-bit words)
    reg [31:0] fc1_buffer [0:7];
    
    // Registers for AXI stream output
    reg [31:0] out_data;
    reg out_valid;
    reg out_last;

    assign s_axis_tready = (state == IDLE || state == RECV_FEAT);
    assign m_axis_tdata  = out_data;
    assign m_axis_tvalid = out_valid;
    assign m_axis_tlast  = out_last;

    // -------------------------------------------------------------------------
    // Sequential Logic
    // -------------------------------------------------------------------------
    always @(posedge aclk) begin
        if (!aresetn) begin
            state <= IDLE;
            word_count <= 0;
            out_valid <= 0;
            out_last <= 0;
        end else begin
            state <= next_state;
            
            case (state)
                IDLE: begin
                    out_valid <= 0;
                    out_last <= 0;
                    if (s_axis_tvalid) begin
                        input_buffer[0] <= s_axis_tdata;
                        word_count <= 1;
                    end else begin
                        word_count <= 0;
                    end
                end
                
                RECV_FEAT: begin
                    if (s_axis_tvalid && word_count < 64) begin
                        input_buffer[word_count] <= s_axis_tdata;
                        word_count <= word_count + 1;
                    end
                end
                
                COMPUTE_FC1: begin
                    // TODO: Implement highly parallel XNOR-popcount over the 64 words
                    // Example pseudocode:
                    // for (int n = 0; n < 256; n++) {
                    //    popcount = 0;
                    //    for (int w = 0; w < 64; w++) {
                    //        xnor_res = ~(input_buffer[w] ^ BNN_POTHOLE_fc1_r[n]_w[w]);
                    //        popcount += count_ones(xnor_res);
                    //    }
                    //    fc1_buffer[n/32][n%32] = (popcount > THRESHOLD) ? 1 : 0;
                    // }
                end
                
                COMPUTE_FC2: begin
                    // TODO: Implement XNOR-popcount for FC2 using fc1_buffer
                    // Output goes into out_data (e.g., class 0 or class 1)
                    out_data <= 32'd1; // Dummy result for pothole detected
                end
                
                SEND_RESULT: begin
                    out_valid <= 1;
                    out_last <= 1;
                    if (m_axis_tready && out_valid) begin
                        out_valid <= 0;
                        out_last <= 0;
                    end
                end
            endcase
        end
    end

    // -------------------------------------------------------------------------
    // Combinational State Transitions
    // -------------------------------------------------------------------------
    always @(*) begin
        next_state = state;
        case (state)
            IDLE:        if (s_axis_tvalid) next_state = RECV_FEAT;
            RECV_FEAT:   if (word_count == 64) next_state = COMPUTE_FC1;
            COMPUTE_FC1: next_state = COMPUTE_FC2; // Needs proper cycle timing based on parallelization
            COMPUTE_FC2: next_state = SEND_RESULT;
            SEND_RESULT: if (m_axis_tready) next_state = IDLE;
            default:     next_state = IDLE;
        endcase
    end

endmodule

