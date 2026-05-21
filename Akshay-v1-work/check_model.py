import torch

model_path = r'C:\Users\Akshay\Downloads\CNN\major_project\model_outputs\best_model.pth'
try:
    ckpt = torch.load(model_path, weights_only=False, map_location='cpu')
    print('Type of ckpt:', type(ckpt))
    
    state_dict = ckpt
    if isinstance(ckpt, dict) and 'model_state_dict' in ckpt:
        print('Found model_state_dict')
        state_dict = ckpt['model_state_dict']
        print('Other keys:', [k for k in ckpt.keys() if k != 'model_state_dict'])
    elif hasattr(ckpt, 'state_dict'):
        print('Loaded a full model object')
        state_dict = ckpt.state_dict()
    
    print('\nState Dict Keys and Shapes:')
    for k, v in state_dict.items():
        if isinstance(v, torch.Tensor):
            print(f"{k}: {list(v.shape)}")
        else:
            print(f"{k}: {type(v)}")
            
except Exception as e:
    print('Error loading model:', e)
