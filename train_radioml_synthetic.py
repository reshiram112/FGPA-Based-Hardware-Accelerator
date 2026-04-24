import torch
import torch.nn as nn
import torch.optim as optim
import numpy as np
import os

device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
print(f'Using device: {device}')

# Create synthetic RadioML 2016.10a data (Since RML2016.10a_dict.pkl is missing)
# 256 inputs (2 channels x 128 IQ samples flattened) -> 11 classes
print("Generating synthetic RadioML 2016.10a dataset for training...")
n_examples = 10000
X = np.random.randn(n_examples, 256).astype(np.float32)
y = np.random.randint(0, 11, size=(n_examples,))

# Train-test split
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
        # RadioML input: 256. Output: 11 classes (for 2016.10a)
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

# Training Loop
epochs = 5
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

# Export weights to binary for FPGA
SCALE_FACTOR = 1 << 12 # using 12 fractional bits for MLP precision

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
