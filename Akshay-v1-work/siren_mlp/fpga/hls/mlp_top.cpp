// mlp_top.cpp -- AXI-Stream MLP accelerator kernel for Vitis HLS
//
// Architecture : 2-layer MLP  41->4->2  (Siren: ambulance vs firetruck)
// Fixed-point  : Q4.12  (ap_fixed<16,4>)
//
// Weights stored in on-chip LUTRAM via static const arrays in mlp_weights_data.h
// (generated once by: python generate_weights.py)
//
// Stream IN  : 41 int16 words -- one feature per 32-bit AXI-Stream word
//              Q4.12 encoded  (standardised float * 4096, clipped, int16)
// Stream OUT : 1 uint32 word  -- argmax class index (0=ambulance, 1=firetruck)
//              TLAST=1 on the single output word.
//
// ap_ctrl_none: free-running streaming pipeline, no AXI-Lite control port.
// Host: dma.sendchannel -> dma.recvchannel -> wait x2
// ---------------------------------------------------------------------------
#include "mlp_top.h"
#include "mlp_weights_data.h"   // static const int16_t siren_W1/b1/W2/b2

// -- Read one int16 Q4.12 value from a 32-bit AXI-Stream word (bits[15:0]) --
static inline data_t s_read(hls::stream<axis_t>& s)
{
#pragma HLS INLINE
    axis_t word = s.read();
    data_t v;
    v.range() = word.data.range(15, 0);
    return v;
}

// -- Write single uint32 with TLAST=1 (argmax class index) ------------------
static inline void s_write_u32(hls::stream<axis_t>& s, ap_uint<32> val)
{
#pragma HLS INLINE
    axis_t pkt;
    pkt.data = val;
    pkt.keep = 0xF;
    pkt.strb = 0xF;
    pkt.last = 1;
    s.write(pkt);
}

// -- Reinterpret stored int16 bits as a Q4.12 fixed-point data_t value ------
static inline data_t w_to_fixed(int16_t raw)
{
#pragma HLS INLINE
    data_t v;
    v.range() = (ap_uint<16>)(uint16_t)raw;
    return v;
}

// -- Top-level function ------------------------------------------------------

void mlp_top(
    hls::stream<axis_t>& s_axis_input,
    hls::stream<axis_t>& m_axis_output)
{
#pragma HLS INTERFACE axis         port=s_axis_input  register
#pragma HLS INTERFACE axis         port=m_axis_output register
#pragma HLS INTERFACE ap_ctrl_none port=return

// 178 total parameters -- small enough for LUTRAM
#pragma HLS BIND_STORAGE variable=siren_W1 type=rom_1p impl=lutram latency=1
#pragma HLS BIND_STORAGE variable=siren_b1 type=rom_1p impl=lutram latency=1
#pragma HLS BIND_STORAGE variable=siren_W2 type=rom_1p impl=lutram latency=1
#pragma HLS BIND_STORAGE variable=siren_b2 type=rom_1p impl=lutram latency=1

    data_t act0[N_IN];      // input features (41)
    data_t act1[L1_SIZE];   // post-layer-1 ReLU (4)

    // Read 41 input features from AXI-Stream
    READ_INPUT:
    for (int i = 0; i < N_IN; i++) {
#pragma HLS PIPELINE II=1
        act0[i] = s_read(s_axis_input);
    }

    // Layer 1: 41 -> 4, ReLU
    {
        accum_t partial[L1_SIZE];
        L1_W: for (int o = 0; o < L1_SIZE; o++) {
            accum_t acc = 0;
            L1_MAC: for (int i = 0; i < N_IN; i++) {
#pragma HLS PIPELINE II=1
                acc += act0[i] * w_to_fixed(siren_W1[o][i]);
            }
            partial[o] = acc;
        }
        L1_B: for (int o = 0; o < L1_SIZE; o++) {
#pragma HLS PIPELINE II=1
            accum_t sum = partial[o] + w_to_fixed(siren_b1[o]);
            act1[o] = (sum > (accum_t)0) ? (data_t)sum : (data_t)0;
        }
    }

    // Layer 2: 4 -> 2, compute argmax and output single uint32
    {
        accum_t logits[N_OUT];
        L2_W: for (int o = 0; o < N_OUT; o++) {
            accum_t acc = 0;
            L2_MAC: for (int i = 0; i < L1_SIZE; i++) {
#pragma HLS PIPELINE II=1
                acc += act1[i] * w_to_fixed(siren_W2[o][i]);
            }
            logits[o] = acc + w_to_fixed(siren_b2[o]);
        }

        // On-chip argmax -- output 0 (ambulance) or 1 (firetruck)
        ap_uint<1> best = (logits[1] > logits[0]) ? ap_uint<1>(1) : ap_uint<1>(0);
        s_write_u32(m_axis_output, (ap_uint<32>)best);
    }
}
