// cnn_top.cpp -- AXI-Stream CNN accelerator kernel for Vitis HLS
//
// Architecture : 5-layer GTSRB CNN backbone
//                PL: Conv1-5 + MaxPool1-3   (this kernel)
//                PS: FC head                 (cnn_inference_pynq.ipynb)
//
// Weights stored in on-chip BRAM/LUTRAM ROMs via cnn_weights_data.h
// (generated once by: python generate_weights.py)
//
// Stream IN  : 3*32*32 = 3072 Q6.10 int16 words (one pixel per 32-bit word)
// Stream OUT : 128*4*4 = 2048 Q6.10 int16 words (TLAST on last word)
//
// Interface  : AXI-Stream data  +  AXI-Lite control (ap_ctrl_hs)
// ---------------------------------------------------------------------------

#include "cnn_top.h"
#include "cnn_weights_data.h"   // static const int16_t cnn_w1..5, cnn_b1..5

// ------------- Architecture constants -------------------------------------
#define IMG_CH    3
#define IMG_H    32
#define IMG_W    32

#define CONV1_CH  32
#define CONV2_CH  32
#define CONV3_CH  64
#define CONV4_CH  64
#define CONV5_CH 128

#define K       3
#define PAD     1       // same-padding for all conv layers
#define POOL_K  2

#define P1_H  (IMG_H  / POOL_K)   // 16
#define P1_W  (IMG_W  / POOL_K)   // 16
#define P2_H  (P1_H   / POOL_K)   //  8
#define P2_W  (P1_W   / POOL_K)   //  8
#define P3_H  (P2_H   / POOL_K)   //  4
#define P3_W  (P2_W   / POOL_K)   //  4

#define N_OUT (CONV5_CH * P3_H * P3_W)  // 2048

// ------------- Helpers (same pattern as mlp_top.cpp) ---------------------

// Read one Q6.10 int16 pixel from bits[15:0] of a 32-bit AXI-Stream word
static inline data_t s_read(hls::stream<axis_t>& s)
{
#pragma HLS INLINE
    data_t v;
    v.range() = s.read().data.range(15, 0);
    return v;
}

// Reinterpret stored int16 bits as a Q6.10 ap_fixed<16,6> value
static inline data_t w_to_fixed(int16_t raw)
{
#pragma HLS INLINE
    data_t v;
    v.range() = (ap_uint<16>)(uint16_t)raw;
    return v;
}

// ------------- Top-level function ----------------------------------------

void cnn_top(
    hls::stream<axis_t>& s_axis_input,
    hls::stream<axis_t>& m_axis_output)
{
#pragma HLS INTERFACE axis         port=s_axis_input  register
#pragma HLS INTERFACE axis         port=m_axis_output register
#pragma HLS INTERFACE ap_ctrl_none port=return

    // -- Weight ROM bindings (static const arrays from cnn_weights_data.h) --
    // Small arrays -> LUTRAM ROM (saves BRAM for feature maps)
#pragma HLS BIND_STORAGE variable=cnn_w1 type=rom_1p impl=lutram latency=1
#pragma HLS BIND_STORAGE variable=cnn_b1 type=rom_1p impl=lutram latency=1
#pragma HLS BIND_STORAGE variable=cnn_b2 type=rom_1p impl=lutram latency=1
#pragma HLS BIND_STORAGE variable=cnn_b3 type=rom_1p impl=lutram latency=1
#pragma HLS BIND_STORAGE variable=cnn_b4 type=rom_1p impl=lutram latency=1
#pragma HLS BIND_STORAGE variable=cnn_b5 type=rom_1p impl=lutram latency=1
    // Large arrays -> BRAM ROM (single read-port, most efficient)
#pragma HLS BIND_STORAGE variable=cnn_w2 type=rom_1p impl=bram latency=1
#pragma HLS BIND_STORAGE variable=cnn_w3 type=rom_1p impl=bram latency=1
#pragma HLS BIND_STORAGE variable=cnn_w4 type=rom_1p impl=bram latency=1
#pragma HLS BIND_STORAGE variable=cnn_w5 type=rom_1p impl=bram latency=1

    // ── 1. Read input image from AXI-Stream ──────────────────────────
    data_t img_buf[IMG_CH][IMG_H][IMG_W];
#pragma HLS ARRAY_PARTITION variable=img_buf complete dim=1
    L1: for (int ch = 0; ch < IMG_CH; ch++) {
        L2: for (int r = 0; r < IMG_H; r++) {
        L3: for (int c = 0; c < IMG_W; c++) {
#pragma HLS PIPELINE II=1
                img_buf[ch][r][c] = s_read(s_axis_input);
            }
        }
    }

    // ── 2. Conv1 + ReLU  (3 in → 32 out, 3×3, same-pad) ─────────────
    data_t conv1_buf[CONV1_CH][IMG_H][IMG_W];
    #pragma HLS BIND_STORAGE variable=conv1_buf type=ram_1p impl=bram

    L4: for (int oc = 0; oc < CONV1_CH; oc++) {
        L5: for (int r = 0; r < IMG_H; r++) {
            L6: for (int c = 0; c < IMG_W; c++) {
                accum_t sum = (accum_t)w_to_fixed(cnn_b1[oc]);
                L7: for (int ic = 0; ic < IMG_CH; ic++) {
        L8: for (int kr = 0; kr < K; kr++) {
        L9: for (int kc = 0; kc < K; kc++) {
#pragma HLS PIPELINE II=1
                            int rr = r + kr - PAD;
                            int cc = c + kc - PAD;
                            data_t px = (rr >= 0 && rr < IMG_H && cc >= 0 && cc < IMG_W)
                                        ? img_buf[ic][rr][cc] : (data_t)0;
                            int widx = oc * (IMG_CH * K * K) + ic * (K * K) + kr * K + kc;
                            sum += (accum_t)px * (accum_t)w_to_fixed(cnn_w1[widx]);
                        }
                    }
                }
                conv1_buf[oc][r][c] = (sum > (accum_t)0) ? (data_t)sum : (data_t)0;
            }
        }
    }

    // ── 3. Conv2 + ReLU  (32 in → 32 out, 3×3, same-pad) ────────────
    data_t conv2_buf[CONV2_CH][IMG_H][IMG_W];
    #pragma HLS BIND_STORAGE variable=conv2_buf type=ram_1p impl=bram
    L10: for (int oc = 0; oc < CONV2_CH; oc++) {
        L11: for (int r = 0; r < IMG_H; r++) {
        L12: for (int c = 0; c < IMG_W; c++) {
                accum_t sum = (accum_t)w_to_fixed(cnn_b2[oc]);
                L13: for (int ic = 0; ic < CONV1_CH; ic++) {
        L14: for (int kr = 0; kr < K; kr++) {
        L15: for (int kc = 0; kc < K; kc++) {
#pragma HLS PIPELINE II=1
                            int rr = r + kr - PAD;
                            int cc = c + kc - PAD;
                            data_t px = (rr >= 0 && rr < IMG_H && cc >= 0 && cc < IMG_W)
                                        ? conv1_buf[ic][rr][cc] : (data_t)0;
                            int widx = oc * (CONV1_CH * K * K) + ic * (K * K) + kr * K + kc;
                            sum += (accum_t)px * (accum_t)w_to_fixed(cnn_w2[widx]);
                        }
                    }
                }
                conv2_buf[oc][r][c] = (sum > (accum_t)0) ? (data_t)sum : (data_t)0;
            }
        }
    }

    // ── 4. MaxPool1  (32ch, 32×32 → 32ch, 16×16) ─────────────────────
    data_t pool1_buf[CONV2_CH][P1_H][P1_W];
#pragma HLS ARRAY_PARTITION variable=pool1_buf complete dim=1
#pragma HLS BIND_STORAGE variable=pool1_buf type=ram_1p impl=lutram
    L16: for (int ch = 0; ch < CONV2_CH; ch++) {
        L17: for (int r = 0; r < P1_H; r++) {
        L18: for (int c = 0; c < P1_W; c++) {
#pragma HLS PIPELINE II=1
                data_t mx = conv2_buf[ch][r*2][c*2];
                if (conv2_buf[ch][r*2  ][c*2+1] > mx) mx = conv2_buf[ch][r*2  ][c*2+1];
                if (conv2_buf[ch][r*2+1][c*2  ] > mx) mx = conv2_buf[ch][r*2+1][c*2  ];
                if (conv2_buf[ch][r*2+1][c*2+1] > mx) mx = conv2_buf[ch][r*2+1][c*2+1];
                pool1_buf[ch][r][c] = mx;
            }
        }
    }

    // ── 5. Conv3 + ReLU  (32 in → 64 out, 3×3, same-pad) ────────────
    data_t conv3_buf[CONV3_CH][P1_H][P1_W];
#pragma HLS BIND_STORAGE variable=conv3_buf type=ram_1p impl=bram
    L19: for (int oc = 0; oc < CONV3_CH; oc++) {
        L20: for (int r = 0; r < P1_H; r++) {
        L21: for (int c = 0; c < P1_W; c++) {
                accum_t sum = (accum_t)w_to_fixed(cnn_b3[oc]);
                L22: for (int ic = 0; ic < CONV2_CH; ic++) {
        L23: for (int kr = 0; kr < K; kr++) {
        L24: for (int kc = 0; kc < K; kc++) {
#pragma HLS PIPELINE II=1
                            int rr = r + kr - PAD;
                            int cc = c + kc - PAD;
                            data_t px = (rr >= 0 && rr < P1_H && cc >= 0 && cc < P1_W)
                                        ? pool1_buf[ic][rr][cc] : (data_t)0;
                            int widx = oc * (CONV2_CH * K * K) + ic * (K * K) + kr * K + kc;
                            sum += (accum_t)px * (accum_t)w_to_fixed(cnn_w3[widx]);
                        }
                    }
                }
                conv3_buf[oc][r][c] = (sum > (accum_t)0) ? (data_t)sum : (data_t)0;
            }
        }
    }

    // ── 6. Conv4 + ReLU  (64 in → 64 out, 3×3, same-pad) ────────────
    data_t conv4_buf[CONV4_CH][P1_H][P1_W];
#pragma HLS BIND_STORAGE variable=conv4_buf type=ram_1p impl=bram
    L25: for (int oc = 0; oc < CONV4_CH; oc++) {
        L26: for (int r = 0; r < P1_H; r++) {
        L27: for (int c = 0; c < P1_W; c++) {
                accum_t sum = (accum_t)w_to_fixed(cnn_b4[oc]);
                L28: for (int ic = 0; ic < CONV3_CH; ic++) {
        L29: for (int kr = 0; kr < K; kr++) {
        L30: for (int kc = 0; kc < K; kc++) {
#pragma HLS PIPELINE II=1
                            int rr = r + kr - PAD;
                            int cc = c + kc - PAD;
                            data_t px = (rr >= 0 && rr < P1_H && cc >= 0 && cc < P1_W)
                                        ? conv3_buf[ic][rr][cc] : (data_t)0;
                            int widx = oc * (CONV3_CH * K * K) + ic * (K * K) + kr * K + kc;
                            sum += (accum_t)px * (accum_t)w_to_fixed(cnn_w4[widx]);
                        }
                    }
                }
                conv4_buf[oc][r][c] = (sum > (accum_t)0) ? (data_t)sum : (data_t)0;
            }
        }
    }

    // ── 7. MaxPool2  (64ch, 16×16 → 64ch, 8×8) ───────────────────────
    data_t pool2_buf[CONV4_CH][P2_H][P2_W];
#pragma HLS ARRAY_PARTITION variable=pool2_buf complete dim=1
#pragma HLS BIND_STORAGE variable=pool2_buf type=ram_1p impl=lutram
    L31: for (int ch = 0; ch < CONV4_CH; ch++) {
        L32: for (int r = 0; r < P2_H; r++) {
        L33: for (int c = 0; c < P2_W; c++) {
#pragma HLS PIPELINE II=1
                data_t mx = conv4_buf[ch][r*2][c*2];
                if (conv4_buf[ch][r*2  ][c*2+1] > mx) mx = conv4_buf[ch][r*2  ][c*2+1];
                if (conv4_buf[ch][r*2+1][c*2  ] > mx) mx = conv4_buf[ch][r*2+1][c*2  ];
                if (conv4_buf[ch][r*2+1][c*2+1] > mx) mx = conv4_buf[ch][r*2+1][c*2+1];
                pool2_buf[ch][r][c] = mx;
            }
        }
    }

    // ── 8. Conv5 + ReLU  (64 in → 128 out, 3×3, same-pad) ───────────
    data_t conv5_buf[CONV5_CH][P2_H][P2_W];
#pragma HLS BIND_STORAGE variable=conv5_buf type=ram_1p impl=bram
    L34: for (int oc = 0; oc < CONV5_CH; oc++) {
        L35: for (int r = 0; r < P2_H; r++) {
        L36: for (int c = 0; c < P2_W; c++) {
                accum_t sum = (accum_t)w_to_fixed(cnn_b5[oc]);
                L37: for (int ic = 0; ic < CONV4_CH; ic++) {
        L38: for (int kr = 0; kr < K; kr++) {
        L39: for (int kc = 0; kc < K; kc++) {
#pragma HLS PIPELINE II=1
                            int rr = r + kr - PAD;
                            int cc = c + kc - PAD;
                            data_t px = (rr >= 0 && rr < P2_H && cc >= 0 && cc < P2_W)
                                        ? pool2_buf[ic][rr][cc] : (data_t)0;
                            int widx = oc * (CONV4_CH * K * K) + ic * (K * K) + kr * K + kc;
                            sum += (accum_t)px * (accum_t)w_to_fixed(cnn_w5[widx]);
                        }
                    }
                }
                conv5_buf[oc][r][c] = (sum > (accum_t)0) ? (data_t)sum : (data_t)0;
            }
        }
    }

    // ── 9. MaxPool3  (128ch, 8×8 → 128ch, 4×4) ───────────────────────
    data_t pool3_buf[CONV5_CH][P3_H][P3_W];
#pragma HLS ARRAY_PARTITION variable=pool3_buf complete dim=1
#pragma HLS BIND_STORAGE variable=pool3_buf type=ram_1p impl=lutram
    L40: for (int ch = 0; ch < CONV5_CH; ch++) {
        L41: for (int r = 0; r < P3_H; r++) {
        L42: for (int c = 0; c < P3_W; c++) {
#pragma HLS PIPELINE II=1
                data_t mx = conv5_buf[ch][r*2][c*2];
                if (conv5_buf[ch][r*2  ][c*2+1] > mx) mx = conv5_buf[ch][r*2  ][c*2+1];
                if (conv5_buf[ch][r*2+1][c*2  ] > mx) mx = conv5_buf[ch][r*2+1][c*2  ];
                if (conv5_buf[ch][r*2+1][c*2+1] > mx) mx = conv5_buf[ch][r*2+1][c*2+1];
                pool3_buf[ch][r][c] = mx;
            }
        }
    }

    // ── 10. Stream out pool3 features (128×4×4 = 2048 words) ─────────
    int cnt = 0;
    L43: for (int ch = 0; ch < CONV5_CH; ch++) {
        L44: for (int r = 0; r < P3_H; r++) {
        L45: for (int c = 0; c < P3_W; c++) {
#pragma HLS PIPELINE II=1
                axis_t pkt;
                pkt.data(15, 0) = pool3_buf[ch][r][c].range();
                pkt.data(31, 16) = 0;
                pkt.keep = 0xF;
                pkt.strb = 0xF;
                cnt++;
                pkt.last = (cnt == N_OUT) ? 1 : 0;
                m_axis_output.write(pkt);
            }
        }
    }
}
