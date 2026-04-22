
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

assign axis_block_sigs[0] = ~grp_mlp_top_Pipeline_RD_IN_fu_100.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[1] = ~grp_mlp_top_Pipeline_L1_W_L1_IN_fu_119.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[2] = ~grp_mlp_top_Pipeline_L1_B_fu_139.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[3] = ~grp_mlp_top_Pipeline_L2_W_L2_IN_fu_158.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[4] = ~grp_mlp_top_Pipeline_L2_B_fu_178.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[5] = ~grp_mlp_top_Pipeline_L3_W_L3_IN_fu_197.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[6] = ~grp_mlp_top_Pipeline_L3_B_fu_217.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[7] = ~grp_mlp_top_Pipeline_L4_W_L4_IN_fu_236.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[8] = ~grp_mlp_top_Pipeline_L4_B_fu_256.s_axis_input_TDATA_blk_n;
assign axis_block_sigs[9] = ~grp_mlp_top_Pipeline_WR_OUT_fu_275.m_axis_output_TDATA_blk_n;

assign inst_block_sigs[0] = 1'b0;

assign inst_idle_sigs[0] = 1'b0;
assign inst_idle_sigs[1] = grp_mlp_top_Pipeline_RD_IN_fu_100.ap_idle;
assign inst_idle_sigs[2] = grp_mlp_top_Pipeline_L1_W_L1_IN_fu_119.ap_idle;
assign inst_idle_sigs[3] = grp_mlp_top_Pipeline_L1_B_fu_139.ap_idle;
assign inst_idle_sigs[4] = grp_mlp_top_Pipeline_L2_W_L2_IN_fu_158.ap_idle;
assign inst_idle_sigs[5] = grp_mlp_top_Pipeline_L2_B_fu_178.ap_idle;
assign inst_idle_sigs[6] = grp_mlp_top_Pipeline_L3_W_L3_IN_fu_197.ap_idle;
assign inst_idle_sigs[7] = grp_mlp_top_Pipeline_L3_B_fu_217.ap_idle;
assign inst_idle_sigs[8] = grp_mlp_top_Pipeline_L4_W_L4_IN_fu_236.ap_idle;
assign inst_idle_sigs[9] = grp_mlp_top_Pipeline_L4_B_fu_256.ap_idle;
assign inst_idle_sigs[10] = grp_mlp_top_Pipeline_WR_OUT_fu_275.ap_idle;

mlp_top_hls_deadlock_idx0_monitor mlp_top_hls_deadlock_idx0_monitor_U (
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
