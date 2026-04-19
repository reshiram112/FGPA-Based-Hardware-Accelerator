`timescale 1ns / 1ps

`include "svm_weights.vh"

module svm_top (
    // AXI4-Lite slave interface (control from ARM)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK" *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI:S_AXIS, ASSOCIATED_RESET S_AXI_ARESETN" *)
    input  wire        S_AXI_ACLK,
    input  wire        S_AXI_ARESETN,
    
    // AXI-Lite Write
    input  wire [3:0]  S_AXI_AWADDR,
    input  wire [2:0]  S_AXI_AWPROT,
    input  wire        S_AXI_AWVALID,
    output wire        S_AXI_AWREADY,
    input  wire [31:0] S_AXI_WDATA,
    input  wire [3:0]  S_AXI_WSTRB,
    input  wire        S_AXI_WVALID,
    output wire        S_AXI_WREADY,
    output wire [1:0]  S_AXI_BRESP,
    output wire        S_AXI_BVALID,
    input  wire        S_AXI_BREADY,
    
    // AXI-Lite Read
    input  wire [3:0]  S_AXI_ARADDR,
    input  wire [2:0]  S_AXI_ARPROT,
    input  wire        S_AXI_ARVALID,
    output wire        S_AXI_ARREADY,
    output reg  [31:0] S_AXI_RDATA,
    output wire [1:0]  S_AXI_RRESP,
    output reg         S_AXI_RVALID,
    input  wire        S_AXI_RREADY,
    
    // AXI4-Stream slave (features from DMA)
    input  wire [31:0] S_AXIS_TDATA,
    input  wire        S_AXIS_TVALID,
    output wire        S_AXIS_TREADY,
    input  wire        S_AXIS_TLAST,
    
    // Interrupt to PS when done
    output wire        irq
);

// ── Control Registers ──────────────────────────────────────
reg [31:0] reg_ctrl;    // 0x00: bit0=start, bit1=reset
reg [31:0] reg_status;  // 0x04: bit0=done, bit1=busy
reg [31:0] reg_result;  // 0x08: 1=Malignant, 0=Benign
reg [31:0] reg_cycles;  // 0x0C: Inference cycle count

wire start = reg_ctrl[0];
assign irq = reg_status[0];

// ── AXI-Lite Write Logic ───────────────────────────────────
reg axi_awready;
reg axi_wready;
reg axi_bvalid;

assign S_AXI_AWREADY = axi_awready;
assign S_AXI_WREADY  = axi_wready;
assign S_AXI_BRESP   = 2'b00;
assign S_AXI_BVALID  = axi_bvalid;

always @(posedge S_AXI_ACLK) begin
    if (~S_AXI_ARESETN) begin
        axi_awready <= 0;
        axi_wready <= 0;
        axi_bvalid <= 0;
        reg_ctrl <= 0;
    end else begin
        // AWREADY
        if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID) begin
            axi_awready <= 1;
        end else begin
            axi_awready <= 0;
        end
        
        // WREADY
        if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID) begin
            axi_wready <= 1;
            if (S_AXI_AWADDR == 4'h0) reg_ctrl <= S_AXI_WDATA;
        end else begin
            axi_wready <= 0;
        end
        
        // BVALID
        if (axi_awready && S_AXI_AWVALID && axi_wready && S_AXI_WVALID && ~axi_bvalid) begin
            axi_bvalid <= 1;
        end else if (axi_bvalid && S_AXI_BREADY) begin
            axi_bvalid <= 0;
        end
    end
end

// ── AXI-Lite Read Logic ────────────────────────────────────
assign S_AXI_ARREADY = ~S_AXI_RVALID;
assign S_AXI_RRESP   = 2'b00;

always @(posedge S_AXI_ACLK) begin
    if (~S_AXI_ARESETN) begin
        S_AXI_RVALID <= 1'b0;
    end else if (S_AXI_ARVALID && ~S_AXI_RVALID) begin
        S_AXI_RVALID <= 1'b1;
        case (S_AXI_ARADDR)
            4'h0: S_AXI_RDATA <= reg_ctrl;
            4'h4: S_AXI_RDATA <= reg_status;
            4'h8: S_AXI_RDATA <= reg_result;
            4'hC: S_AXI_RDATA <= reg_cycles;
            default: S_AXI_RDATA <= 32'd0;
        endcase
    end else if (S_AXI_RREADY) begin
        S_AXI_RVALID <= 1'b0;
    end
end

// ── Input Buffer (30 features, 8-bit each) ──────────────────
reg [7:0] features [0:29];
reg [4:0] load_cnt;
reg       buf_full;

assign S_AXIS_TREADY = ~buf_full;

always @(posedge S_AXI_ACLK) begin
    if (~S_AXI_ARESETN || reg_ctrl[1]) begin
        load_cnt <= 0;
        buf_full <= 0;
    end else if (S_AXIS_TVALID && S_AXIS_TREADY) begin
        features[load_cnt] <= S_AXIS_TDATA[7:0];
        if (load_cnt == 29 || S_AXIS_TLAST) begin
            buf_full <= 1;
        end else begin
            load_cnt <= load_cnt + 1;
        end
    end
end

// ── SVM Inference Logic (1 Clock Cycle Unrolled MAC!) ───────
reg [1:0] state;
reg [31:0] cycles;

// We use a 32-bit signed accumulator for safety against overflow
wire signed [31:0] dot_product;

assign dot_product = 
    ($signed({1'b0, features[0]})  * `SVM_WEIGHT_00) +
    ($signed({1'b0, features[1]})  * `SVM_WEIGHT_01) +
    ($signed({1'b0, features[2]})  * `SVM_WEIGHT_02) +
    ($signed({1'b0, features[3]})  * `SVM_WEIGHT_03) +
    ($signed({1'b0, features[4]})  * `SVM_WEIGHT_04) +
    ($signed({1'b0, features[5]})  * `SVM_WEIGHT_05) +
    ($signed({1'b0, features[6]})  * `SVM_WEIGHT_06) +
    ($signed({1'b0, features[7]})  * `SVM_WEIGHT_07) +
    ($signed({1'b0, features[8]})  * `SVM_WEIGHT_08) +
    ($signed({1'b0, features[9]})  * `SVM_WEIGHT_09) +
    ($signed({1'b0, features[10]}) * `SVM_WEIGHT_10) +
    ($signed({1'b0, features[11]}) * `SVM_WEIGHT_11) +
    ($signed({1'b0, features[12]}) * `SVM_WEIGHT_12) +
    ($signed({1'b0, features[13]}) * `SVM_WEIGHT_13) +
    ($signed({1'b0, features[14]}) * `SVM_WEIGHT_14) +
    ($signed({1'b0, features[15]}) * `SVM_WEIGHT_15) +
    ($signed({1'b0, features[16]}) * `SVM_WEIGHT_16) +
    ($signed({1'b0, features[17]}) * `SVM_WEIGHT_17) +
    ($signed({1'b0, features[18]}) * `SVM_WEIGHT_18) +
    ($signed({1'b0, features[19]}) * `SVM_WEIGHT_19) +
    ($signed({1'b0, features[20]}) * `SVM_WEIGHT_20) +
    ($signed({1'b0, features[21]}) * `SVM_WEIGHT_21) +
    ($signed({1'b0, features[22]}) * `SVM_WEIGHT_22) +
    ($signed({1'b0, features[23]}) * `SVM_WEIGHT_23) +
    ($signed({1'b0, features[24]}) * `SVM_WEIGHT_24) +
    ($signed({1'b0, features[25]}) * `SVM_WEIGHT_25) +
    ($signed({1'b0, features[26]}) * `SVM_WEIGHT_26) +
    ($signed({1'b0, features[27]}) * `SVM_WEIGHT_27) +
    ($signed({1'b0, features[28]}) * `SVM_WEIGHT_28) +
    ($signed({1'b0, features[29]}) * `SVM_WEIGHT_29) +
    `SVM_BIAS;

always @(posedge S_AXI_ACLK) begin
    if (~S_AXI_ARESETN || reg_ctrl[1]) begin
        state <= 0;
        cycles <= 0;
        reg_status <= 0;
        reg_result <= 0;
        reg_cycles <= 0;
    end else begin
        case (state)
            0: begin // WAIT FOR START
                if (start && buf_full) begin
                    state <= 1;
                    cycles <= 0;
                    reg_status <= 2; // BUSY
                end
            end
            1: begin // COMPUTE (1 cycle!)
                cycles <= cycles + 1;
                // If dot product > 0, it is Malignant (Class 1)
                reg_result <= (dot_product > 0) ? 32'd1 : 32'd0;
                state <= 2;
            end
            2: begin // DONE
                reg_status <= 1; // DONE
                reg_cycles <= cycles;
                if (~start) begin
                    state <= 0;
                    reg_status <= 0;
                end
            end
        endcase
    end
end

endmodule
