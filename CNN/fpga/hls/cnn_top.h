#ifndef CNN_TOP_H
#define CNN_TOP_H

#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

// Fixed-point precision
typedef ap_fixed<16,6> data_t;

// AXI-Stream packet type
typedef ap_axiu<32, 1, 1, 1> axis_t;

void cnn_top(
    hls::stream<axis_t>& s_axis_input,
    hls::stream<axis_t>& m_axis_output,
    const data_t* m_axi_w_conv1,
    const data_t* m_axi_b_conv1,
    const data_t* m_axi_w_conv2,
    const data_t* m_axi_b_conv2,
    const data_t* m_axi_w_fc,
    const data_t* m_axi_b_fc
);

#endif
