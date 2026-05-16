import torch
import numpy as np

pth_path = r"c:\Users\Chappidi Sai Sudheer\Downloads\major_project_repo 3\major_project_repo\model_outputs\models\cnn_weights.pth"
npy_path = r"c:\Users\Chappidi Sai Sudheer\Downloads\major_project_repo 3\major_project_repo\pynq\fc_weights.npz"

print("Loading weights...")
state_dict = torch.load(pth_path, map_location=torch.device('cpu'))

fc1_w = state_dict['fc1.weight'].numpy()
fc1_b = state_dict['fc1.bias'].numpy()
fc2_w = state_dict['fc2.weight'].numpy()
fc2_b = state_dict['fc2.bias'].numpy()

np.savez(npy_path, fc1_w=fc1_w, fc1_b=fc1_b, fc2_w=fc2_w, fc2_b=fc2_b)
print(f"Saved FC weights to {npy_path}")
