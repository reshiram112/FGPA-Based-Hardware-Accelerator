set SynModuleInfo {
  {SRCNAME bnn_top_Pipeline_RD_IN MODELNAME bnn_top_Pipeline_RD_IN RTLNAME bnn_top_bnn_top_Pipeline_RD_IN
    SUBMODULES {
      {MODELNAME bnn_top_flow_control_loop_pipe_sequential_init RTLNAME bnn_top_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME bnn_top_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME bnn_top_Pipeline_L1_W_L1_IN MODELNAME bnn_top_Pipeline_L1_W_L1_IN RTLNAME bnn_top_bnn_top_Pipeline_L1_W_L1_IN
    SUBMODULES {
      {MODELNAME bnn_top_mul_26s_26s_52_1_1 RTLNAME bnn_top_mul_26s_26s_52_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME bnn_top_Pipeline_L1_B MODELNAME bnn_top_Pipeline_L1_B RTLNAME bnn_top_bnn_top_Pipeline_L1_B}
  {SRCNAME bnn_top_Pipeline_L2_W_L2_IN MODELNAME bnn_top_Pipeline_L2_W_L2_IN RTLNAME bnn_top_bnn_top_Pipeline_L2_W_L2_IN}
  {SRCNAME bnn_top_Pipeline_L2_B MODELNAME bnn_top_Pipeline_L2_B RTLNAME bnn_top_bnn_top_Pipeline_L2_B}
  {SRCNAME bnn_top_Pipeline_L3_W_L3_IN MODELNAME bnn_top_Pipeline_L3_W_L3_IN RTLNAME bnn_top_bnn_top_Pipeline_L3_W_L3_IN}
  {SRCNAME bnn_top_Pipeline_L3_B MODELNAME bnn_top_Pipeline_L3_B RTLNAME bnn_top_bnn_top_Pipeline_L3_B}
  {SRCNAME bnn_top_Pipeline_L4_W_L4_IN MODELNAME bnn_top_Pipeline_L4_W_L4_IN RTLNAME bnn_top_bnn_top_Pipeline_L4_W_L4_IN}
  {SRCNAME bnn_top_Pipeline_L4_B MODELNAME bnn_top_Pipeline_L4_B RTLNAME bnn_top_bnn_top_Pipeline_L4_B}
  {SRCNAME bnn_top_Pipeline_WR_OUT MODELNAME bnn_top_Pipeline_WR_OUT RTLNAME bnn_top_bnn_top_Pipeline_WR_OUT}
  {SRCNAME bnn_top MODELNAME bnn_top RTLNAME bnn_top IS_TOP 1
    SUBMODULES {
      {MODELNAME bnn_top_input_RAM_AUTO_1R1W RTLNAME bnn_top_input_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME bnn_top_act1_RAM_AUTO_1R1W RTLNAME bnn_top_act1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME bnn_top_ctrl_s_axi RTLNAME bnn_top_ctrl_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME bnn_top_regslice_both RTLNAME bnn_top_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
