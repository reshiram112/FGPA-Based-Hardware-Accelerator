#ifndef MLP_TOP_H
#define MLP_TOP_H

#include "ap_fixed.h"
#include "ap_int.h"
#include "hls_stream.h"
#include <ap_axi_sdata.h>

typedef ap_fixed<16, 6, AP_RND_ZERO, AP_SAT>  data_t;
typedef ap_fixed<32,12, AP_RND_ZERO, AP_SAT>  accum_t;

#define L0   784
#define L1   512
#define L2   256
#define L3   128
#define L4    10

typedef ap_axiu<32, 1, 1, 1> axis_t;

void mlp_top(
    hls::stream<axis_t>& s_axis_input,
    hls::stream<axis_t>& m_axis_output
);

#endif
