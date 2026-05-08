
wire kernel_monitor_reset;
wire kernel_monitor_clock;
wire kernel_monitor_report;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
assign kernel_monitor_report = 1'b0;
wire [9:0] axis_block_sigs;
wire [10:0] inst_idle_sigs;
wire [0:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~grp_bnn_top_Pipeline_RD_IN_fu_104.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[1] = ~grp_bnn_top_Pipeline_L1_W_L1_IN_fu_123.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[2] = ~grp_bnn_top_Pipeline_L1_B_fu_143.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[3] = ~grp_bnn_top_Pipeline_L2_W_L2_IN_fu_162.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[4] = ~grp_bnn_top_Pipeline_L2_B_fu_182.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[5] = ~grp_bnn_top_Pipeline_L3_W_L3_IN_fu_201.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[6] = ~grp_bnn_top_Pipeline_L3_B_fu_221.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[7] = ~grp_bnn_top_Pipeline_L4_W_L4_IN_fu_240.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[8] = ~grp_bnn_top_Pipeline_L4_B_fu_261.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[9] = ~grp_bnn_top_Pipeline_WR_OUT_fu_281.m_axis_output_TDATA_blk_n;

assign inst_block_sigs[0] = 1'b0;

assign inst_idle_sigs[0] = 1'b0;
assign inst_idle_sigs[1] = grp_bnn_top_Pipeline_RD_IN_fu_104.ap_idle;
assign inst_idle_sigs[2] = grp_bnn_top_Pipeline_L1_W_L1_IN_fu_123.ap_idle;
assign inst_idle_sigs[3] = grp_bnn_top_Pipeline_L1_B_fu_143.ap_idle;
assign inst_idle_sigs[4] = grp_bnn_top_Pipeline_L2_W_L2_IN_fu_162.ap_idle;
assign inst_idle_sigs[5] = grp_bnn_top_Pipeline_L2_B_fu_182.ap_idle;
assign inst_idle_sigs[6] = grp_bnn_top_Pipeline_L3_W_L3_IN_fu_201.ap_idle;
assign inst_idle_sigs[7] = grp_bnn_top_Pipeline_L3_B_fu_221.ap_idle;
assign inst_idle_sigs[8] = grp_bnn_top_Pipeline_L4_W_L4_IN_fu_240.ap_idle;
assign inst_idle_sigs[9] = grp_bnn_top_Pipeline_L4_B_fu_261.ap_idle;
assign inst_idle_sigs[10] = grp_bnn_top_Pipeline_WR_OUT_fu_281.ap_idle;

bnn_top_hls_deadlock_idx0_monitor bnn_top_hls_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);


always @ (kernel_block or kernel_monitor_reset) begin
    if (kernel_block == 1'b1 && kernel_monitor_reset == 1'b0) begin
        find_kernel_block = 1'b1;
    end
    else begin
        find_kernel_block = 1'b0;
    end
end
