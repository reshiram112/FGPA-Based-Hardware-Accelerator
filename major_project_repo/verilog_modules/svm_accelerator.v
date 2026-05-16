`timescale 1ns / 1ps

// SVM Accelerator AXI-Stream Wrapper
// Implements a Linear Support Vector Machine (SVM) inference.
// Uses Q8.8 fixed-point arithmetic for features and weights.

module svm_accelerator (
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

    // Include the generated linear weights
    `include "../weight_extraction/verilog_headers/svm_weights.vh"

    // -------------------------------------------------------------------------
    // State Machine Definitions
    // -------------------------------------------------------------------------
    localparam IDLE         = 0;
    localparam RECV_FEAT    = 1;
    localparam COMPUTE_MAC  = 2;
    localparam SEND_RESULT  = 3;

    reg [2:0] state;

    // Buffer for input features (10 features)
    reg signed [15:0] input_features [0:9];
    reg [3:0] feat_count;
    
    // Registers for processing
    reg signed [31:0] decision_sum; // Q16.16 format for accumulation
    reg [3:0] mac_idx;
    
    // AXI stream output registers
    reg [31:0] out_data;

    assign s_axis_tready = (state == IDLE || state == RECV_FEAT);
    assign m_axis_tdata  = out_data;
    assign m_axis_tvalid = (state == SEND_RESULT);
    assign m_axis_tlast  = (state == SEND_RESULT);

    // Weight Lookup
    reg signed [15:0] wgt_val;
    always @(*) begin
        case(mac_idx)
            0: wgt_val = SVM_W_0;
            1: wgt_val = SVM_W_1;
            2: wgt_val = SVM_W_2;
            3: wgt_val = SVM_W_3;
            4: wgt_val = SVM_W_4;
            5: wgt_val = SVM_W_5;
            6: wgt_val = SVM_W_6;
            7: wgt_val = SVM_W_7;
            8: wgt_val = SVM_W_8;
            9: wgt_val = SVM_W_9;
            default: wgt_val = 0;
        endcase
    end

    // -------------------------------------------------------------------------
    // Sequential Logic
    // -------------------------------------------------------------------------
    always @(posedge aclk) begin
        if (!aresetn) begin
            state <= IDLE;
            feat_count <= 0;
            mac_idx <= 0;
            decision_sum <= 0;
            out_data <= 0;
        end else begin
            case (state)
                IDLE: begin
                    feat_count <= 0;
                    mac_idx <= 0;
                    // Initialize decision_sum with Bias shifted to Q16.16 alignment
                    decision_sum <= $signed(SVM_BIAS) <<< 8;
                    if (s_axis_tvalid) begin
                        input_features[0] <= s_axis_tdata[15:0];
                        feat_count <= 1;
                        state <= RECV_FEAT;
                    end
                end
                
                RECV_FEAT: begin
                    if (s_axis_tvalid) begin
                        input_features[feat_count] <= s_axis_tdata[15:0];
                        if (feat_count == SVM_N_FEAT - 1) begin
                            state <= COMPUTE_MAC;
                        end else begin
                            feat_count <= feat_count + 1;
                        end
                    end
                end
                
                COMPUTE_MAC: begin
                    // Q8.8 * Q8.8 = Q16.16
                    decision_sum <= decision_sum + (input_features[mac_idx] * wgt_val);
                    
                    if (mac_idx == SVM_N_FEAT - 1) begin
                        state <= SEND_RESULT;
                    end else begin
                        mac_idx <= mac_idx + 1;
                    end
                end
                
                SEND_RESULT: begin
                    if (m_axis_tready) begin
                        // decision_sum > 0 -> Lane Change (1), else Lane Keep (0)
                        out_data <= (decision_sum > 0) ? 32'd1 : 32'd0;
                        state <= IDLE;
                    end
                end
                
                default: state <= IDLE;
            endcase
        end
    end

endmodule
