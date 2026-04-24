import torch
import torch.nn as nn
import torch.optim as optim
import numpy as np
import pickle
import os
import sys

device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
print(f'Using device: {device}')

pkl_path = 'RML2016.10a_dict.pkl'
if not os.path.exists(pkl_path):
    print(f"Error: {pkl_path} not found.")
    print("Please download it from https://www.deepsig.ai/datasets and place it in this folder.")
    sys.exit(1)

print("Loading RadioML 2016.10a dataset...")
with open(pkl_path, 'rb') as f:
    Xd = pickle.load(f, encoding='latin1')
    
snrs, mods = map(lambda j: sorted(list(set(map(lambda x: x[j], Xd.keys())))), [1, 0])
X = [] 
lbl = []
for mod in mods:
    for snr in snrs:
        X.append(Xd[(mod, snr)])
        for i in range(Xd[(mod, snr)].shape[0]):
            lbl.append((mod, snr))
X = np.vstack(X)
X = X.reshape((X.shape[0], -1))

mods_dict = {mod: i for i, mod in enumerate(mods)}
y = np.array([mods_dict[mod] for mod, snr in lbl])

np.random.seed(42)
n_examples = X.shape[0]
n_train = int(n_examples * 0.8)
train_idx = np.random.choice(range(0, n_examples), size=n_train, replace=False)
test_idx = list(set(range(0, n_examples)) - set(train_idx))

X_train = torch.FloatTensor(X[train_idx])
y_train = torch.LongTensor(y[train_idx])
X_test = torch.FloatTensor(X[test_idx])
y_test = torch.LongTensor(y[test_idx])

trainloader = torch.utils.data.DataLoader(torch.utils.data.TensorDataset(X_train, y_train), batch_size=128, shuffle=True)
testloader = torch.utils.data.DataLoader(torch.utils.data.TensorDataset(X_test, y_test), batch_size=128, shuffle=False)
print("Data loaded successfully.")

class RadioMLP(nn.Module):
    def __init__(self):
        super(RadioMLP, self).__init__()
        self.fc1 = nn.Linear(256, 512)
        self.fc2 = nn.Linear(512, 256)
        self.fc3 = nn.Linear(256, 128)
        self.fc4 = nn.Linear(128, 11)

    def forward(self, x):
        x = torch.relu(self.fc1(x))
        x = torch.relu(self.fc2(x))
        x = torch.relu(self.fc3(x))
        x = self.fc4(x)
        return x

model = RadioMLP().to(device)
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=0.001)

epochs = 15
print("Starting training on MLP...")
for epoch in range(epochs):
    model.train()
    running_loss = 0.0
    for i, data in enumerate(trainloader):
        inputs, labels = data[0].to(device), data[1].to(device)
        optimizer.zero_grad()
        outputs = model(inputs)
        loss = criterion(outputs, labels)
        loss.backward()
        optimizer.step()
        running_loss += loss.item()
    print(f'Epoch {epoch+1}, Loss: {running_loss/len(trainloader):.4f}')

model.eval()
correct = 0
total = 0
with torch.no_grad():
    for data in testloader:
        inputs, labels = data[0].to(device), data[1].to(device)
        outputs = model(inputs)
        _, predicted = torch.max(outputs.data, 1)
        total += labels.size(0)
        correct += (predicted == labels).sum().item()
print(f'Accuracy on test data: {100 * correct / total:.2f}%')

SCALE_FACTOR = 1 << 12

def to_fixed(tensor):
    arr = tensor.cpu().detach().numpy().flatten()
    arr = np.round(arr * SCALE_FACTOR)
    arr = np.clip(arr, -32768, 32767).astype(np.int16)
    return arr

W1 = to_fixed(model.fc1.weight)
B1 = to_fixed(model.fc1.bias)
W2 = to_fixed(model.fc2.weight)
B2 = to_fixed(model.fc2.bias)
W3 = to_fixed(model.fc3.weight)
B3 = to_fixed(model.fc3.bias)
W4 = to_fixed(model.fc4.weight)
B4 = to_fixed(model.fc4.bias)

all_weights = np.concatenate([W1, B1, W2, B2, W3, B3, W4, B4])

print(f'Total weights exported: {len(all_weights)}')
all_weights.tofile('mlp_radioml_weights.bin')
print('Exported to mlp_radioml_weights.bin successfully.')
