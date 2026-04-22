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

// Total weights: W1+b1+W2+b2+W3+b3+W4+b4
// 784*512+512 + 512*256+256 + 256*128+128 + 128*10+10
// = 401920+512 + 131072+256 + 32768+128 + 1280+10 = 567946
typedef ap_axiu<32, 1, 1, 1> axis_t;

void mlp_top(
    hls::stream<axis_t>& s_axis_input,
    hls::stream<axis_t>& m_axis_output
);

#endif
