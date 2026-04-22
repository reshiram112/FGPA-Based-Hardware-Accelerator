#include "cnn_top.h"

// Parameters
#define IMG_CH 1
#define IMG_H 28
#define IMG_W 28

#define CONV1_CH 8
#define CONV1_K 3
#define POOL1_K 2

#define CONV2_CH 16
#define CONV2_K 3
#define POOL2_K 2

#define P1_H (IMG_H/POOL1_K)
#define P1_W (IMG_W/POOL1_K)
#define P2_H (P1_H/POOL2_K)
#define P2_W (P1_W/POOL2_K)

#define FC_IN (CONV2_CH * P2_H * P2_W) // 16*7*7 = 784
#define FC_OUT 10

// Weight counts
#define N_W1  (CONV1_CH * IMG_CH * CONV1_K * CONV1_K)  // 72
#define N_B1  (CONV1_CH)                                // 8
#define N_W2  (CONV2_CH * CONV1_CH * CONV2_K * CONV2_K)// 1152
#define N_B2  (CONV2_CH)                                // 16
#define N_WFC (FC_OUT * FC_IN)                          // 7840
#define N_BFC (FC_OUT)                                  // 10

void cnn_top(
    hls::stream<axis_t>& s_axis_input,
    hls::stream<axis_t>& m_axis_output
) {
    #pragma HLS INTERFACE axis      port=s_axis_input
    #pragma HLS INTERFACE axis      port=m_axis_output
    #pragma HLS INTERFACE s_axilite port=return bundle=ctrl

    // ── 1. Read weights from stream ─────────────────────────────
    int16_t w_conv1[N_W1], b_conv1[N_B1];
    int16_t w_conv2[N_W2], b_conv2[N_B2];
    int16_t w_fc[N_WFC],   b_fc[N_BFC];

    #pragma HLS ARRAY_PARTITION variable=b_conv1 complete dim=1
    #pragma HLS ARRAY_PARTITION variable=b_conv2 complete dim=1
    #pragma HLS ARRAY_PARTITION variable=b_fc    complete dim=1

    RD_W1: for (int i = 0; i < N_W1; i++) {
        #pragma HLS PIPELINE II=1
        w_conv1[i] = (int16_t)s_axis_input.read().data(15, 0);
    }
    RD_B1: for (int i = 0; i < N_B1; i++) {
        #pragma HLS PIPELINE II=1
        b_conv1[i] = (int16_t)s_axis_input.read().data(15, 0);
    }
    RD_W2: for (int i = 0; i < N_W2; i++) {
        #pragma HLS PIPELINE II=1
        w_conv2[i] = (int16_t)s_axis_input.read().data(15, 0);
    }
    RD_B2: for (int i = 0; i < N_B2; i++) {
        #pragma HLS PIPELINE II=1
        b_conv2[i] = (int16_t)s_axis_input.read().data(15, 0);
    }
    RD_WFC: for (int i = 0; i < N_WFC; i++) {
        #pragma HLS PIPELINE II=1
        w_fc[i] = (int16_t)s_axis_input.read().data(15, 0);
    }
    RD_BFC: for (int i = 0; i < N_BFC; i++) {
        #pragma HLS PIPELINE II=1
        b_fc[i] = (int16_t)s_axis_input.read().data(15, 0);
    }

    // ── 2. Read input image ──────────────────────────────────────
    data_t img_buf[IMG_CH][IMG_H][IMG_W];
    READ_IMG: for (int r = 0; r < IMG_H; r++) {
        for (int c = 0; c < IMG_W; c++) {
            #pragma HLS PIPELINE
            ap_int<16> raw = s_axis_input.read().data(15, 0);
            data_t val; val.range() = raw;
            img_buf[0][r][c] = val;
        }
    }

    // ── 3. Conv1 + ReLU ─────────────────────────────────────────
    data_t conv1_buf[CONV1_CH][IMG_H][IMG_W];
    CONV1_R: for (int r = 0; r < IMG_H; r++) {
        CONV1_C: for (int c = 0; c < IMG_W; c++) {
            CONV1_CH_L: for (int ch = 0; ch < CONV1_CH; ch++) {
                #pragma HLS PIPELINE
                data_t sum = 0;
                for (int kr = 0; kr < CONV1_K; kr++)
                    for (int kc = 0; kc < CONV1_K; kc++) {
                        int rr = r+kr-1, cc = c+kc-1;
                        data_t px = (rr>=0 && rr<IMG_H && cc>=0 && cc<IMG_W)
                                    ? img_buf[0][rr][cc] : (data_t)0;
                        data_t wv; wv.range() = w_conv1[ch*CONV1_K*CONV1_K + kr*CONV1_K + kc];
                        sum += px * wv;
                    }
                data_t bv; bv.range() = b_conv1[ch];
                sum += bv;
                conv1_buf[ch][r][c] = (sum > 0) ? sum : (data_t)0;
            }
        }
    }

    // ── 4. Pool1 (max 2x2) ──────────────────────────────────────
    data_t pool1_buf[CONV1_CH][P1_H][P1_W];
    POOL1_CH: for (int ch = 0; ch < CONV1_CH; ch++) {
        POOL1_R: for (int r = 0; r < P1_H; r++) {
            POOL1_C: for (int c = 0; c < P1_W; c++) {
                #pragma HLS PIPELINE
                data_t mx = conv1_buf[ch][r*2][c*2];
                if (conv1_buf[ch][r*2  ][c*2+1] > mx) mx = conv1_buf[ch][r*2  ][c*2+1];
                if (conv1_buf[ch][r*2+1][c*2  ] > mx) mx = conv1_buf[ch][r*2+1][c*2  ];
                if (conv1_buf[ch][r*2+1][c*2+1] > mx) mx = conv1_buf[ch][r*2+1][c*2+1];
                pool1_buf[ch][r][c] = mx;
            }
        }
    }

    // ── 5. Conv2 + ReLU ─────────────────────────────────────────
    data_t conv2_buf[CONV2_CH][P1_H][P1_W];
    CONV2_R: for (int r = 0; r < P1_H; r++) {
        CONV2_C: for (int c = 0; c < P1_W; c++) {
            CONV2_CH_L: for (int ch = 0; ch < CONV2_CH; ch++) {
                #pragma HLS PIPELINE
                data_t sum = 0;
                for (int ic = 0; ic < CONV1_CH; ic++)
                    for (int kr = 0; kr < CONV2_K; kr++)
                        for (int kc = 0; kc < CONV2_K; kc++) {
                            int rr = r+kr-1, cc = c+kc-1;
                            data_t px = (rr>=0 && rr<P1_H && cc>=0 && cc<P1_W)
                                        ? pool1_buf[ic][rr][cc] : (data_t)0;
                            int widx = ch*CONV1_CH*CONV2_K*CONV2_K
                                     + ic*CONV2_K*CONV2_K + kr*CONV2_K + kc;
                            data_t wv; wv.range() = w_conv2[widx];
                            sum += px * wv;
                        }
                data_t bv; bv.range() = b_conv2[ch];
                sum += bv;
                conv2_buf[ch][r][c] = (sum > 0) ? sum : (data_t)0;
            }
        }
    }

    // ── 6. Pool2 (max 2x2) ──────────────────────────────────────
    data_t pool2_buf[CONV2_CH][P2_H][P2_W];
    POOL2_CH: for (int ch = 0; ch < CONV2_CH; ch++) {
        POOL2_R: for (int r = 0; r < P2_H; r++) {
            POOL2_C: for (int c = 0; c < P2_W; c++) {
                #pragma HLS PIPELINE
                data_t mx = conv2_buf[ch][r*2][c*2];
                if (conv2_buf[ch][r*2  ][c*2+1] > mx) mx = conv2_buf[ch][r*2  ][c*2+1];
                if (conv2_buf[ch][r*2+1][c*2  ] > mx) mx = conv2_buf[ch][r*2+1][c*2  ];
                if (conv2_buf[ch][r*2+1][c*2+1] > mx) mx = conv2_buf[ch][r*2+1][c*2+1];
                pool2_buf[ch][r][c] = mx;
            }
        }
    }

    // ── 7. FC layer ──────────────────────────────────────────────
    data_t fc_buf[FC_OUT];
    FC_OUT_LOOP: for (int o = 0; o < FC_OUT; o++) {
        data_t bv; bv.range() = b_fc[o];
        accum_t acc = (accum_t)bv;
        FC_IN_CH: for (int ch = 0; ch < CONV2_CH; ch++) {
            FC_IN_R: for (int r = 0; r < P2_H; r++) {
                FC_IN_C: for (int c = 0; c < P2_W; c++) {
                    #pragma HLS PIPELINE
                    int idx = o*FC_IN + ch*P2_H*P2_W + r*P2_W + c;
                    data_t wv; wv.range() = w_fc[idx];
                    acc += (accum_t)pool2_buf[ch][r][c] * (accum_t)wv;
                }
            }
        }
        fc_buf[o] = (data_t)acc;
    }

    // ── 8. Write output ──────────────────────────────────────────
    WRITE_OUT: for (int o = 0; o < FC_OUT; o++) {
        #pragma HLS PIPELINE
        axis_t pkt;
        pkt.data(15, 0) = fc_buf[o].range();
        pkt.data(31,16) = 0;
        pkt.last = (o == FC_OUT-1) ? 1 : 0;
        pkt.keep = -1;
        m_axis_output.write(pkt);
    }
}
