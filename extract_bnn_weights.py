import torch
import numpy as np
import struct
import os

model_path = r'C:\Users\Akshay\Downloads\bnn_fixed_py.pt'
state = torch.load(model_path, map_location='cpu', weights_only=True)['state']

def to_fixed16(val):
    scaled = int(round(val * (2**10)))
    scaled = max(-32768, min(32767, scaled))
    return scaled if scaled >= 0 else (65536 + scaled)

output_data = bytearray()

def append_fixed16(val):
    output_data.extend(struct.pack('<H', to_fixed16(val)))

def fold_and_append(w, b, bn_w, bn_b, bn_rm, bn_rv, eps=1e-5):
    # w: (out, in), b: (out,)
    # bn_w: gamma, bn_b: beta, bn_rm: mean, bn_rv: var
    w_bin = torch.sign(w)
    w_bin[w_bin == 0] = 1.0
    
    scale = bn_w / torch.sqrt(bn_rv + eps)
    
    # Fold bias
    # orig_out = x @ w^T + b
    # bn_out = (orig_out - rm) * scale + beta
    #        = x @ (w^T * scale) + (b - rm) * scale + beta
    
    w_folded = w_bin * scale.unsqueeze(1)
    b_folded = (b - bn_rm) * scale + bn_b
    
    for val in w_folded.flatten().tolist():
        append_fixed16(val)
    for val in b_folded.flatten().tolist():
        append_fixed16(val)

# Layer 1 (64 -> 256)
fold_and_append(
    state['net.0.w'], state['net.0.b'],
    state['net.1.weight'], state['net.1.bias'],
    state['net.1.running_mean'], state['net.1.running_var']
)

# Layer 2 (256 -> 256)
fold_and_append(
    state['net.4.w'], state['net.4.b'],
    state['net.5.weight'], state['net.5.bias'],
    state['net.5.running_mean'], state['net.5.running_var']
)

# Layer 3 (256 -> 256)
fold_and_append(
    state['net.8.w'], state['net.8.b'],
    state['net.9.weight'], state['net.9.bias'],
    state['net.9.running_mean'], state['net.9.running_var']
)

# Head (256 -> 2)
# No BN
for val in state['head.weight'].flatten().tolist():
    append_fixed16(val)
for val in state['head.bias'].flatten().tolist():
    append_fixed16(val)

os.makedirs('BNN/fpga/pynq', exist_ok=True)
with open('BNN/fpga/pynq/bnn_weights.bin', 'wb') as f:
    f.write(output_data)

print(f"Exported folded BNN weights successfully: {len(output_data)} bytes")
