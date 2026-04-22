#include "mlp_top.h"

// MLP on-the-fly computation
// The weights stream in dynamically so no BRAM is wasted.
// Order of stream: Image (784), W1(512x784), b1(512), W2(256x512), b2(256), W3(128x256), b3(128), W4(10x128), b4(10)

void mlp_top(
    hls::stream<axis_t>& s_axis_input,
    hls::stream<axis_t>& m_axis_output
) {
    #pragma HLS INTERFACE axis      port=s_axis_input  register
    #pragma HLS INTERFACE axis      port=m_axis_output register
    #pragma HLS INTERFACE s_axilite port=return bundle=ctrl

    // ── 1. Read input image ──────────────────────────────────────
    data_t input[L0];
    RD_IN: for (int i = 0; i < L0; i++) {
        #pragma HLS PIPELINE II=1
        ap_int<16> raw = s_axis_input.read().data(15, 0);
        data_t val; val.range() = raw;
        input[i] = val;
    }

    // ── 2. Layer 1: dense + ReLU ────────────────────────────────
    data_t act1[L1];
    L1_W: for (int o = 0; o < L1; o++) {
        accum_t acc = 0;
        L1_IN: for (int i = 0; i < L0; i++) {
            #pragma HLS PIPELINE II=1
            data_t wv; wv.range() = (int16_t)s_axis_input.read().data(15, 0);
            acc += (accum_t)wv * (accum_t)input[i];
        }
        act1[o] = (data_t)acc;
    }
    L1_B: for (int o = 0; o < L1; o++) {
        #pragma HLS PIPELINE II=1
        data_t bv; bv.range() = (int16_t)s_axis_input.read().data(15, 0);
        accum_t acc = (accum_t)act1[o] + (accum_t)bv;
        act1[o] = (acc > 0) ? (data_t)acc : (data_t)0;
    }

    // ── 3. Layer 2: dense + ReLU ────────────────────────────────
    data_t act2[L2];
    L2_W: for (int o = 0; o < L2; o++) {
        accum_t acc = 0;
        L2_IN: for (int i = 0; i < L1; i++) {
            #pragma HLS PIPELINE II=1
            data_t wv; wv.range() = (int16_t)s_axis_input.read().data(15, 0);
            acc += (accum_t)wv * (accum_t)act1[i];
        }
        act2[o] = (data_t)acc;
    }
    L2_B: for (int o = 0; o < L2; o++) {
        #pragma HLS PIPELINE II=1
        data_t bv; bv.range() = (int16_t)s_axis_input.read().data(15, 0);
        accum_t acc = (accum_t)act2[o] + (accum_t)bv;
        act2[o] = (acc > 0) ? (data_t)acc : (data_t)0;
    }

    // ── 4. Layer 3: dense + ReLU ────────────────────────────────
    data_t act3[L3];
    L3_W: for (int o = 0; o < L3; o++) {
        accum_t acc = 0;
        L3_IN: for (int i = 0; i < L2; i++) {
            #pragma HLS PIPELINE II=1
            data_t wv; wv.range() = (int16_t)s_axis_input.read().data(15, 0);
            acc += (accum_t)wv * (accum_t)act2[i];
        }
        act3[o] = (data_t)acc;
    }
    L3_B: for (int o = 0; o < L3; o++) {
        #pragma HLS PIPELINE II=1
        data_t bv; bv.range() = (int16_t)s_axis_input.read().data(15, 0);
        accum_t acc = (accum_t)act3[o] + (accum_t)bv;
        act3[o] = (acc > 0) ? (data_t)acc : (data_t)0;
    }

    // ── 5. Layer 4: dense (no ReLU, logits) ─────────────────────
    data_t act4[L4];
    L4_W: for (int o = 0; o < L4; o++) {
        accum_t acc = 0;
        L4_IN: for (int i = 0; i < L3; i++) {
            #pragma HLS PIPELINE II=1
            data_t wv; wv.range() = (int16_t)s_axis_input.read().data(15, 0);
            acc += (accum_t)wv * (accum_t)act3[i];
        }
        act4[o] = (data_t)acc;
    }
    L4_B: for (int o = 0; o < L4; o++) {
        #pragma HLS PIPELINE II=1
        data_t bv; bv.range() = (int16_t)s_axis_input.read().data(15, 0);
        accum_t acc = (accum_t)act4[o] + (accum_t)bv;
        act4[o] = (data_t)acc;
    }

    // ── 6. Write output logits ───────────────────────────────────
    WR_OUT: for (int o = 0; o < L4; o++) {
        #pragma HLS PIPELINE II=1
        axis_t pkt;
        pkt.data(15, 0) = act4[o].range();
        pkt.data(31,16) = 0;
        pkt.last  = (o == L4 - 1) ? 1 : 0;
        pkt.keep  = -1;
        m_axis_output.write(pkt);
    }
}
