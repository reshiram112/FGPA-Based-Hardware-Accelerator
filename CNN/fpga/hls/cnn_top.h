#ifndef CNN_TOP_H
#define CNN_TOP_H

#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

typedef ap_fixed<16,6> data_t;
typedef ap_fixed<32,12,AP_RND_ZERO,AP_SAT> accum_t;

// AXI-Stream packet type (32-bit data, 1-bit user/id/dest)
typedef ap_axiu<32, 1, 1, 1> axis_t;

// Stream layout per inference call:
//   [w_conv1(72), b_conv1(8), w_conv2(1152), b_conv2(16), w_fc(7840), b_fc(10), image(784)]
// Total: 9098 + 784 = 9882 int16 values

void cnn_top(
    hls::stream<axis_t>& s_axis_input,
    hls::stream<axis_t>& m_axis_output
);

#endif
