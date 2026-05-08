set ModuleHierarchy {[{
"Name" : "bnn_top", "RefName" : "bnn_top","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_bnn_top_Pipeline_RD_IN_fu_104", "RefName" : "bnn_top_Pipeline_RD_IN","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "RD_IN","RefName" : "RD_IN","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_bnn_top_Pipeline_L1_W_L1_IN_fu_123", "RefName" : "bnn_top_Pipeline_L1_W_L1_IN","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "L1_W_L1_IN","RefName" : "L1_W_L1_IN","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_bnn_top_Pipeline_L1_B_fu_143", "RefName" : "bnn_top_Pipeline_L1_B","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "L1_B","RefName" : "L1_B","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "grp_bnn_top_Pipeline_L2_W_L2_IN_fu_162", "RefName" : "bnn_top_Pipeline_L2_W_L2_IN","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "L2_W_L2_IN","RefName" : "L2_W_L2_IN","ID" : "8","Type" : "pipeline"},]},
	{"Name" : "grp_bnn_top_Pipeline_L2_B_fu_182", "RefName" : "bnn_top_Pipeline_L2_B","ID" : "9","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "L2_B","RefName" : "L2_B","ID" : "10","Type" : "pipeline"},]},
	{"Name" : "grp_bnn_top_Pipeline_L3_W_L3_IN_fu_201", "RefName" : "bnn_top_Pipeline_L3_W_L3_IN","ID" : "11","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "L3_W_L3_IN","RefName" : "L3_W_L3_IN","ID" : "12","Type" : "pipeline"},]},
	{"Name" : "grp_bnn_top_Pipeline_L3_B_fu_221", "RefName" : "bnn_top_Pipeline_L3_B","ID" : "13","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "L3_B","RefName" : "L3_B","ID" : "14","Type" : "pipeline"},]},
	{"Name" : "grp_bnn_top_Pipeline_L4_W_L4_IN_fu_240", "RefName" : "bnn_top_Pipeline_L4_W_L4_IN","ID" : "15","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "L4_W_L4_IN","RefName" : "L4_W_L4_IN","ID" : "16","Type" : "pipeline"},]},
	{"Name" : "grp_bnn_top_Pipeline_L4_B_fu_261", "RefName" : "bnn_top_Pipeline_L4_B","ID" : "17","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "L4_B","RefName" : "L4_B","ID" : "18","Type" : "pipeline"},]},
	{"Name" : "grp_bnn_top_Pipeline_WR_OUT_fu_281", "RefName" : "bnn_top_Pipeline_WR_OUT","ID" : "19","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "WR_OUT","RefName" : "WR_OUT","ID" : "20","Type" : "pipeline"},]},]
}]}