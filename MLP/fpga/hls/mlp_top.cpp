#include "mlp_top.h"
#include "mlp_weights.h"

template<int IN, int OUT>
static void dense_relu(
    const data_t  in_act[IN],
    data_t        out_act[OUT],
    const int16_t* W,
    const int16_t* B,
    bool          relu)
{
    data_t bias[OUT];
    BIAS_LOAD: for (int o = 0; o < OUT; o++) {
#pragma HLS PIPELINE II=1
        data_t val; val.range() = B[o];
        bias[o] = val;
    }

    OUTER: for (int o = 0; o < OUT; o++) {
        accum_t acc = (accum_t)bias[o];
        const int16_t* row = W + o * IN;

        INNER: for (int i = 0; i < IN; i++) {
#pragma HLS PIPELINE II=1
            data_t weight; weight.range() = row[i];
            acc += (accum_t)weight * (accum_t)in_act[i];
        }

        accum_t result = relu ? (acc > 0 ? acc : (accum_t)0) : acc;
        out_act[o] = (data_t)result;
    }
}

void mlp_top(
    hls::stream<axis_t>& s_axis_input,
    hls::stream<axis_t>& m_axis_output)
{
#pragma HLS INTERFACE axis port=s_axis_input  register
#pragma HLS INTERFACE axis port=m_axis_output register
#pragma HLS INTERFACE s_axilite port=return bundle=ctrl

    data_t act1[L1];
    data_t act2[L2];
    data_t act3[L3];
    data_t act4[L4];

    data_t input[L0];

    READ_INPUT: for (int i = 0; i < L0; i++) {
#pragma HLS PIPELINE II=1
        axis_t pkt = s_axis_input.read();
        ap_int<16> raw = pkt.data(15,0);
        data_t val;
        val.range() = raw;
        input[i] = val;
    }

    dense_relu<L0, L1>(input, act1, w1, b1, true);
    dense_relu<L1, L2>(act1,  act2, w2, b2, true);
    dense_relu<L2, L3>(act2,  act3, w3, b3, true);
    dense_relu<L3, L4>(act3,  act4, w4, b4, false);

    WRITE_OUTPUT: for (int o = 0; o < L4; o++) {
#pragma HLS PIPELINE II=1
        axis_t pkt;
        ap_int<16> raw = act4[o].range();
        pkt.data(15,0) = raw;
        pkt.data(31,16) = 0;
        pkt.last = (o == L4 - 1) ? 1 : 0;
        pkt.keep = -1;
        m_axis_output.write(pkt);
    }
}
