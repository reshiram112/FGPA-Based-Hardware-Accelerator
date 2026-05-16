`timescale 1ns / 1ps

// Master MLP Router AXI-Stream Wrapper
// Receives 160 Audio MFCC features, runs through a 3-layer MLP
// (160 -> 256 -> 256 -> 2) using Q8.8 fixed-point arithmetic.

module mlp_router (
    input wire aclk,
    input wire aresetn,
    
    // AXI-Stream Slave (Data In from PS)
    input wire [31:0] s_axis_tdata,
    input wire s_axis_tvalid,
    output wire s_axis_tready,
    input wire s_axis_tlast,
    
    // AXI-Stream Master (Data Out to PS - Route decision)
    output wire [31:0] m_axis_tdata,
    output wire m_axis_tvalid,
    input wire m_axis_tready,
    output wire m_axis_tlast
);

    // Include the generated weights for the Audio MLP
    `include "../weight_extraction/verilog_headers/audio_mlp_weights.vh"

    // -------------------------------------------------------------------------
    // State Machine Definitions
    // -------------------------------------------------------------------------
    localparam IDLE         = 3'd0;
    localparam RECV_FEAT    = 3'd1; // Receiving 160 audio features
    localparam COMPUTE_FC1  = 3'd2; // Matrix mult: 160 -> 256 + ReLU
    localparam COMPUTE_FC2  = 3'd3; // Matrix mult: 256 -> 256 + ReLU
    localparam COMPUTE_FC3  = 3'd4; // Matrix mult: 256 -> 2
    localparam SEND_RESULT  = 3'd5; // Send final classification

    reg [2:0] state, next_state;

    // Buffer for 160 input features
    reg [31:0] input_features [0:159];
    reg [7:0] feat_count;
    
    // Buffer for hidden layers
    reg signed [31:0] hidden1 [0:255];
    reg signed [31:0] hidden2 [0:255];
    reg signed [31:0] output_logits [0:1];
    
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
            feat_count <= 0;
            out_valid <= 0;
            out_last <= 0;
        end else begin
            state <= next_state;
            
            case (state)
                IDLE: begin
                    out_valid <= 0;
                    out_last <= 0;
                    if (s_axis_tvalid) begin
                        input_features[0] <= s_axis_tdata;
                        feat_count <= 1;
                    end else begin
                        feat_count <= 0;
                    end
                end
                
                RECV_FEAT: begin
                    if (s_axis_tvalid && feat_count < 160) begin
                        input_features[feat_count] <= s_axis_tdata;
                        feat_count <= feat_count + 1;
                    end
                end
                
                COMPUTE_FC1: begin
                    // TODO: Compute MAC operations using Q8.8 arithmetic
                    // hidden1[i] = max(0, sum(input_features[j] * AUDIO_MLP_fc1_weight...) + bias)
                end
                
                COMPUTE_FC2: begin
                    // TODO: Compute MAC operations for second hidden layer
                    // hidden2[i] = max(0, sum(hidden1[j] * AUDIO_MLP_fc2_weight...) + bias)
                end
                
                COMPUTE_FC3: begin
                    // TODO: Compute output logits
                    // output_logits[i] = sum(hidden2[j] * AUDIO_MLP_fc3_weight...) + bias
                end
                
                SEND_RESULT: begin
                    // out_data <= (output_logits[1] > output_logits[0]) ? 32'd1 : 32'd0;
                    out_data <= 32'd1; // Dummy decision
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
            RECV_FEAT:   if (feat_count == 160) next_state = COMPUTE_FC1;
            COMPUTE_FC1: next_state = COMPUTE_FC2;
            COMPUTE_FC2: next_state = COMPUTE_FC3;
            COMPUTE_FC3: next_state = SEND_RESULT;
            SEND_RESULT: if (m_axis_tready) next_state = IDLE;
            default:     next_state = IDLE;
        endcase
    end

endmodule
