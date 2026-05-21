import torch
import numpy as np
import os

def fold_batchnorm(conv_w, conv_b, bn_rm, bn_rv, bn_w, bn_b, eps=1e-5):
    """Folds BatchNorm2d into the preceding Conv2d layer."""
    if conv_b is None:
        conv_b = torch.zeros(conv_w.shape[0], device=conv_w.device)
    scale    = bn_w / torch.sqrt(bn_rv + eps)
    folded_w = conv_w * scale.view(-1, 1, 1, 1)
    folded_b = (conv_b - bn_rm) * scale + bn_b
    return folded_w, folded_b

def to_q6_10(val):
    """Encode a float as Q6.10 fixed-point int16 (matches ap_fixed<16,6>)."""
    q = int(round(float(val) * 1024.0))
    return max(-32768, min(32767, q))

def array_to_c(name, data):
    """Return a C static const int16_t declaration for a flat/multidim array."""
    flat = data.flatten()
    vals = [str(to_q6_10(v)) for v in flat]
    lines = [f'static const int16_t {name}[{len(flat)}] = {{']
    # 16 values per row
    for i in range(0, len(vals), 16):
        chunk = ', '.join(vals[i:i+16])
        lines.append(f'    {chunk},')
    lines.append('};')
    return '\n'.join(lines)

def main():
    model_path = r'C:\Users\Akshay\Downloads\CNN\major_project\model_outputs\best_model.pth'
    hls_dir    = r'C:\Users\Akshay\Downloads\fpga_radioml_mlp\Akshay-v1-work\CNN\fpga\hls'
    pynq_dir   = r'C:\Users\Akshay\Downloads\fpga_radioml_mlp\Akshay-v1-work\CNN\fpga\pynq'

    out_h  = os.path.join(hls_dir,  'cnn_weights_data.h')
    out_fc = os.path.join(pynq_dir, 'cnn_fc_weights.npz')
    os.makedirs(pynq_dir, exist_ok=True)

    print(f'Loading {model_path} ...')
    ckpt = torch.load(model_path, weights_only=False, map_location='cpu')
    sd   = ckpt.get('model_state_dict', ckpt)

    # (conv_index, bn_index) pairs in the features Sequential
    layers = [
        (0, 1),   # Conv1, BN1
        (3, 4),   # Conv2, BN2
        (8, 9),   # Conv3, BN3
        (11, 12), # Conv4, BN4
        (16, 17), # Conv5, BN5
    ]

    with open(out_h, 'w') as f:
        f.write('// cnn_weights_data.h  --  Auto-generated CNN weights (Q6.10 = ap_fixed<16,6>)\n')
        f.write('// DO NOT EDIT.  Regenerate with:  python generate_weights.py\n')
        f.write('//\n')
        f.write('// Weights are BatchNorm-folded and quantised to Q6.10 (scale = 2^10 = 1024).\n')
        f.write('// Load into ap_fixed<16,6> via:  data_t v; v.range() = (ap_uint<16>)(uint16_t)raw;\n')
        f.write('\n')
        f.write('#ifndef CNN_WEIGHTS_DATA_H\n')
        f.write('#define CNN_WEIGHTS_DATA_H\n')
        f.write('#include <stdint.h>\n\n')

        total_w = 0
        total_b = 0
        for i, (conv_idx, bn_idx) in enumerate(layers, 1):
            cw   = sd[f'features.{conv_idx}.weight']
            cb   = sd.get(f'features.{conv_idx}.bias', None)
            bn_w = sd[f'features.{bn_idx}.weight']
            bn_b = sd[f'features.{bn_idx}.bias']
            bn_rm= sd[f'features.{bn_idx}.running_mean']
            bn_rv= sd[f'features.{bn_idx}.running_var']

            fw, fb = fold_batchnorm(cw, cb, bn_rm, bn_rv, bn_w, bn_b)
            fw_np  = fw.detach().numpy()
            fb_np  = fb.detach().numpy()

            f.write(f'// Conv{i}  shape={list(fw_np.shape)}  ({fw_np.size} weights)\n')
            f.write(array_to_c(f'cnn_w{i}', fw_np))
            f.write('\n\n')
            f.write(f'// Conv{i} biases  shape={list(fb_np.shape)}\n')
            f.write(array_to_c(f'cnn_b{i}', fb_np))
            f.write('\n\n')

            total_w += fw_np.size
            total_b += fb_np.size
            print(f'  conv{i}: {fw_np.size:6d} weights + {fb_np.size:3d} biases  '
                  f'(shape {list(fw_np.shape)})')

        f.write('#endif // CNN_WEIGHTS_DATA_H\n')

    print(f'\nWritten: {out_h}')
    print(f'Total weights: {total_w},  biases: {total_b}')
    print(f'Approx BRAM18: {(total_w*2)//2048 + 1} for weights')

    # FC layers stay on the PS (ARM) side
    fc1_w = sd['classifier.0.weight'].detach().numpy()
    fc1_b = sd['classifier.0.bias'].detach().numpy()
    fc2_w = sd['classifier.3.weight'].detach().numpy()
    fc2_b = sd['classifier.3.bias'].detach().numpy()
    np.savez(out_fc, fc1_w=fc1_w, fc1_b=fc1_b, fc2_w=fc2_w, fc2_b=fc2_b)
    print(f'Saved FC weights: {out_fc}')

if __name__ == '__main__':
    main()
