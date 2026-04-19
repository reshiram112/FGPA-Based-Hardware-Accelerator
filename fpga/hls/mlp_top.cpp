/*
 * mlp_top.cpp — MNIST MLP HLS Implementation
 * Target : Zynq XC7Z020 (PYNQ-Z2), Vivado/Vitis HLS 2025.1, 100 MHz
 *
 * Interface summary:
 *   s_axis_input  — AXI4-Stream, 784 × data_t (16-bit fixed-point)
 *   m_axis_output — AXI4-Stream, 10  × data_t
 *   w1..b4        — AXI4-HP0 master (m_axi), reads from PS DDR
 *   ap_ctrl_hs    — start/done/idle handshaking (AXI4-Lite slot 0)
 *
 * Computation:
 *   act1[L1] = ReLU(W1[L1][L0] * input[L0] + B1[L1])
 *   act2[L2] = ReLU(W2[L2][L1] * act1[L1]  + B2[L2])
 *   act3[L3] = ReLU(W3[L3][L2] * act2[L2]  + B3[L3])
 *   out [L4] =      W4[L4][L3] * act3[L3]  + B4[L4]
 */

#include "mlp_top.h"

// ── Helper: dense layer with optional ReLU ────────────────────────────────────
template<int IN, int OUT>
static void dense_relu(
    const data_t  in_act[IN],
    data_t        out_act[OUT],
    const data_t* W,            // W[OUT][IN] row-major in DDR
    const data_t* B,
    bool          relu)
{
    // Read bias vector first (contiguous, small burst)
    data_t bias[OUT];
    BIAS_LOAD: for (int o = 0; o < OUT; o++) {
#pragma HLS PIPELINE II=1
        bias[o] = B[o];
    }

    // Matrix-vector multiply: for each output neuron, accumulate over inputs
    OUTER: for (int o = 0; o < OUT; o++) {
        accum_t acc = (accum_t)bias[o];
        const data_t* row = W + o * IN;     // pointer to row o of weight matrix

        INNER: for (int i = 0; i < IN; i++) {
#pragma HLS PIPELINE II=1
            acc += (accum_t)row[i] * (accum_t)in_act[i];
        }

        // ReLU and saturate back to data_t
        accum_t result = relu ? (acc > 0 ? acc : (accum_t)0) : acc;
        out_act[o] = (data_t)result;
    }
}

// ── Top-level function ────────────────────────────────────────────────────────
void mlp_top(
    hls::stream<pkt_t>& s_axis_input,
    hls::stream<pkt_t>& m_axis_output,
    const data_t* w1, const data_t* b1,
    const data_t* w2, const data_t* b2,
    const data_t* w3, const data_t* b3,
    const data_t* w4, const data_t* b4)
{
// ── AXI Interface Pragmas ─────────────────────────────────────────────────────
// Input / output streams — AXI4-Stream
#pragma HLS INTERFACE axis port=s_axis_input  register
#pragma HLS INTERFACE axis port=m_axis_output register

// Weight / bias pointers — AXI4-HP0 master, single shared bundle
// offset=slave so the PS can pass physical addresses via AXI4-Lite
#pragma HLS INTERFACE m_axi port=w1 bundle=weights offset=slave depth=W1_SIZE
#pragma HLS INTERFACE m_axi port=b1 bundle=weights offset=slave depth=B1_SIZE
#pragma HLS INTERFACE m_axi port=w2 bundle=weights offset=slave depth=W2_SIZE
#pragma HLS INTERFACE m_axi port=b2 bundle=weights offset=slave depth=B2_SIZE
#pragma HLS INTERFACE m_axi port=w3 bundle=weights offset=slave depth=W3_SIZE
#pragma HLS INTERFACE m_axi port=b3 bundle=weights offset=slave depth=B3_SIZE
#pragma HLS INTERFACE m_axi port=w4 bundle=weights offset=slave depth=W4_SIZE
#pragma HLS INTERFACE m_axi port=b4 bundle=weights offset=slave depth=B4_SIZE

// Control — AXI4-Lite (generates start/done/idle registers at base+0x00)
#pragma HLS INTERFACE s_axilite port=w1 bundle=ctrl
#pragma HLS INTERFACE s_axilite port=b1 bundle=ctrl
#pragma HLS INTERFACE s_axilite port=w2 bundle=ctrl
#pragma HLS INTERFACE s_axilite port=b2 bundle=ctrl
#pragma HLS INTERFACE s_axilite port=w3 bundle=ctrl
#pragma HLS INTERFACE s_axilite port=b3 bundle=ctrl
#pragma HLS INTERFACE s_axilite port=w4 bundle=ctrl
#pragma HLS INTERFACE s_axilite port=b4 bundle=ctrl
#pragma HLS INTERFACE s_axilite port=return bundle=ctrl

// Local activation buffers — stored in BRAM
    data_t act1[L1];
    data_t act2[L2];
    data_t act3[L3];
    data_t act4[L4];
#pragma HLS ARRAY_PARTITION variable=act1 cyclic factor=8 dim=1
#pragma HLS ARRAY_PARTITION variable=act2 cyclic factor=8 dim=1
#pragma HLS ARRAY_PARTITION variable=act3 cyclic factor=8 dim=1

// ── Step 1: Read 784 pixels from AXI-Stream into local buffer ────────────────
    data_t input[L0];
#pragma HLS ARRAY_PARTITION variable=input cyclic factor=8 dim=1

    READ_INPUT: for (int i = 0; i < L0; i++) {
#pragma HLS PIPELINE II=1
        pkt_t p = s_axis_input.read();
        input[i] = p.data;
    }

// ── Step 2: Forward pass through 4 layers ────────────────────────────────────
    dense_relu<L0, L1>(input, act1, w1, b1, true);   // 784→512 ReLU
    dense_relu<L1, L2>(act1,  act2, w2, b2, true);   // 512→256 ReLU
    dense_relu<L2, L3>(act2,  act3, w3, b3, true);   // 256→128 ReLU
    dense_relu<L3, L4>(act3,  act4, w4, b4, false);  // 128→10  (no ReLU)

// ── Step 3: Write 10 logits to AXI-Stream output ─────────────────────────────
    WRITE_OUTPUT: for (int o = 0; o < L4; o++) {
#pragma HLS PIPELINE II=1
        pkt_t p;
        p.data = act4[o];
        p.last = (o == L4 - 1) ? 1 : 0;
        m_axis_output.write(p);
    }
}
