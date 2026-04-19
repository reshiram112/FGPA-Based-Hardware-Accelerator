/*
 * mlp_top.h  —  MNIST MLP HLS Top-Level Header
 * Target : Xilinx Zynq XC7Z020 (PYNQ-Z2), Vivado 2025.1
 * Clock  : 100 MHz (10 ns period)
 * Precision: ap_fixed<16,6>  (6 integer bits, 10 fractional bits, scale=1024)
 *
 * Architecture (all weights read from PS DDR via AXI4-HP0):
 *   AXI-Stream(784) → L1:784→512 ReLU → L2:512→256 ReLU
 *                   → L3:256→128 ReLU → L4:128→10 → AXI-Stream(10)
 */
#ifndef MLP_TOP_H
#define MLP_TOP_H

#include "ap_fixed.h"
#include "ap_int.h"
#include "hls_stream.h"

// ── Precision types ───────────────────────────────────────────────────────────
// ap_fixed<W, I> : W total bits, I integer bits, W-I fractional bits
typedef ap_fixed<16, 6, AP_RND_ZERO, AP_SAT>  data_t;    // activations & weights
typedef ap_fixed<32,12, AP_RND_ZERO, AP_SAT>  accum_t;   // accumulator (no overflow)

// ── Layer dimensions ─────────────────────────────────────────────────────────
#define L0   784    // input
#define L1   512    // hidden 1
#define L2   256    // hidden 2
#define L3   128    // hidden 3
#define L4    10    // output (classes)

// Weight buffer sizes (flattened row-major: W[out][in])
#define W1_SIZE  (L1 * L0)   // 401,408
#define B1_SIZE  L1           // 512
#define W2_SIZE  (L2 * L1)   // 131,072
#define B2_SIZE  L2
#define W3_SIZE  (L3 * L2)   // 32,768
#define B3_SIZE  L3
#define W4_SIZE  (L4 * L3)   // 1,280
#define B4_SIZE  L4

// ── AXI-Stream packet ─────────────────────────────────────────────────────────
struct pkt_t {
    data_t      data;
    ap_uint<1>  last;   // TLAST — marks end of frame
};

// ── Top-level function declaration ────────────────────────────────────────────
// All weight pointers use m_axi (read from PS DDR via AXI4-HP0).
// Input / output use AXI4-Stream.
// Control uses AXI4-Lite (ap_ctrl_hs auto-generated).
void mlp_top(
    // AXI4-Stream: 784 input pixels, 10 output logits
    hls::stream<pkt_t>& s_axis_input,
    hls::stream<pkt_t>& m_axis_output,

    // Layer weights & biases — stored in PS DDR, read via AXI4-HP0
    const data_t* w1, const data_t* b1,
    const data_t* w2, const data_t* b2,
    const data_t* w3, const data_t* b3,
    const data_t* w4, const data_t* b4
);

#endif /* MLP_TOP_H */
