#include "cnn_top.h"
#include "cnn_weights.h"

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

#define FC_IN (CONV2_CH * P2_H * P2_W) // 16 * 7 * 7 = 784
#define FC_OUT 10

void cnn_top(
    hls::stream<axis_t>& s_axis_input,
    hls::stream<axis_t>& m_axis_output
) {
    #pragma HLS INTERFACE axis port=s_axis_input
    #pragma HLS INTERFACE axis port=m_axis_output
    #pragma HLS INTERFACE s_axilite port=return bundle=ctrl

    // Internal Buffers
    data_t img_buf[IMG_CH][IMG_H][IMG_W];
    data_t conv1_buf[CONV1_CH][IMG_H][IMG_W];
    data_t pool1_buf[CONV1_CH][P1_H][P1_W];
    data_t conv2_buf[CONV2_CH][P1_H][P1_W];
    data_t pool2_buf[CONV2_CH][P2_H][P2_W];
    data_t fc_buf[FC_OUT];

    // Array partitions for parallel bias lookup
    #pragma HLS ARRAY_PARTITION variable=b_conv1 complete dim=1
    #pragma HLS ARRAY_PARTITION variable=b_conv2 complete dim=1
    #pragma HLS ARRAY_PARTITION variable=b_fc complete dim=1

    // Read Input Image from AXI-Stream
    READ_IMG: for(int r=0; r<IMG_H; r++) {
        for(int c=0; c<IMG_W; c++) {
            #pragma HLS PIPELINE
            axis_t pkt = s_axis_input.read();
            ap_int<16> raw = pkt.data(15,0);
            data_t val;
            val.range() = raw;
            img_buf[0][r][c] = val;
        }
    }

    // Layer 1: Conv1 + ReLU
    CONV1_R: for(int r=0; r<IMG_H; r++) {
        CONV1_C: for(int c=0; c<IMG_W; c++) {
            CONV1_CH_L: for(int ch_out=0; ch_out<CONV1_CH; ch_out++) {
                #pragma HLS PIPELINE
                data_t sum; sum.range() = b_conv1[ch_out];
                CONV1_K_R: for(int kr=-1; kr<=1; kr++) {
                    CONV1_K_C: for(int kc=-1; kc<=1; kc++) {
                        int r_idx = r + kr;
                        int c_idx = c + kc;
                        if(r_idx >= 0 && r_idx < IMG_H && c_idx >= 0 && c_idx < IMG_W) {
                            int w_idx = ch_out*1*3*3 + 0*3*3 + (kr+1)*3 + (kc+1);
                            data_t weight; weight.range() = w_conv1[w_idx];
                            sum += img_buf[0][r_idx][c_idx] * weight;
                        }
                    }
                }
                if (sum < 0) sum = 0;
                conv1_buf[ch_out][r][c] = sum;
            }
        }
    }

    // Layer 2: MaxPool 1
    POOL1_CH: for(int ch=0; ch<CONV1_CH; ch++) {
        POOL1_R: for(int r=0; r<P1_H; r++) {
            POOL1_C: for(int c=0; c<P1_W; c++) {
                #pragma HLS PIPELINE
                data_t max_val = -9999;
                for(int pr=0; pr<POOL1_K; pr++) {
                    for(int pc=0; pc<POOL1_K; pc++) {
                        data_t val = conv1_buf[ch][r*POOL1_K + pr][c*POOL1_K + pc];
                        if(val > max_val) max_val = val;
                    }
                }
                pool1_buf[ch][r][c] = max_val;
            }
        }
    }

    // Layer 3: Conv2 + ReLU
    CONV2_R: for(int r=0; r<P1_H; r++) {
        CONV2_C: for(int c=0; c<P1_W; c++) {
            CONV2_CH_L: for(int ch_out=0; ch_out<CONV2_CH; ch_out++) {
                #pragma HLS PIPELINE
                data_t sum; sum.range() = b_conv2[ch_out];
                CONV2_CH_IN: for(int ch_in=0; ch_in<CONV1_CH; ch_in++) {
                    CONV2_K_R: for(int kr=-1; kr<=1; kr++) {
                        CONV2_K_C: for(int kc=-1; kc<=1; kc++) {
                            int r_idx = r + kr;
                            int c_idx = c + kc;
                            if(r_idx >= 0 && r_idx < P1_H && c_idx >= 0 && c_idx < P1_W) {
                                int w_idx = ch_out*8*3*3 + ch_in*3*3 + (kr+1)*3 + (kc+1);
                                data_t weight; weight.range() = w_conv2[w_idx];
                                sum += pool1_buf[ch_in][r_idx][c_idx] * weight;
                            }
                        }
                    }
                }
                if (sum < 0) sum = 0;
                conv2_buf[ch_out][r][c] = sum;
            }
        }
    }

    // Layer 4: MaxPool 2
    POOL2_CH: for(int ch=0; ch<CONV2_CH; ch++) {
        POOL2_R: for(int r=0; r<P2_H; r++) {
            POOL2_C: for(int c=0; c<P2_W; c++) {
                #pragma HLS PIPELINE
                data_t max_val = -9999;
                for(int pr=0; pr<POOL2_K; pr++) {
                    for(int pc=0; pc<POOL2_K; pc++) {
                        data_t val = conv2_buf[ch][r*POOL2_K + pr][c*POOL2_K + pc];
                        if(val > max_val) max_val = val;
                    }
                }
                pool2_buf[ch][r][c] = max_val;
            }
        }
    }

    // Layer 5: Fully Connected
    FC_OUT_LOOP: for(int o=0; o<FC_OUT; o++) {
        data_t sum; sum.range() = b_fc[o];
        int in_idx = 0;
        FC_IN_CH: for(int ch=0; ch<CONV2_CH; ch++) {
            FC_IN_R: for(int r=0; r<P2_H; r++) {
                FC_IN_C: for(int c=0; c<P2_W; c++) {
                    #pragma HLS PIPELINE
                    data_t weight; weight.range() = w_fc[o*FC_IN + in_idx];
                    sum += pool2_buf[ch][r][c] * weight;
                    in_idx++;
                }
            }
        }
        fc_buf[o] = sum;
    }

    // Write Output
    WRITE_OUT: for(int i=0; i<FC_OUT; i++) {
        #pragma HLS PIPELINE
        axis_t pkt;
        ap_int<16> raw = fc_buf[i].range();
        pkt.data(15,0) = raw;
        pkt.data(31,16) = 0;
        pkt.last = (i == FC_OUT - 1) ? 1 : 0;
        pkt.keep = -1;
        m_axis_output.write(pkt);
    }
}
