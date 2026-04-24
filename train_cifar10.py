import torch
import torch.nn as nn
import torch.optim as optim
import torchvision
import torchvision.transforms as transforms
import numpy as np
import struct
import sys

device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
print(f'Using device: {device}')

# CIFAR-10 Dataset
transform = transforms.Compose([
    transforms.ToTensor(),
    transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5)) # Normalize to [-1, 1]
])

print("Downloading and loading CIFAR-10 data...")
trainset = torchvision.datasets.CIFAR10(root='./data', train=True, download=True, transform=transform)
trainloader = torch.utils.data.DataLoader(trainset, batch_size=128, shuffle=True)

testset = torchvision.datasets.CIFAR10(root='./data', train=False, download=True, transform=transform)
testloader = torch.utils.data.DataLoader(testset, batch_size=128, shuffle=False)

class SimpleCNN(nn.Module):
    def __init__(self):
        super(SimpleCNN, self).__init__()
        # Input: 3x32x32
        self.conv1 = nn.Conv2d(3, 16, kernel_size=3, padding=1)  # 16x32x32
        self.pool1 = nn.MaxPool2d(2, 2)                          # 16x16x16
        self.conv2 = nn.Conv2d(16, 32, kernel_size=3, padding=1) # 32x16x16
        self.pool2 = nn.MaxPool2d(2, 2)                          # 32x8x8
        self.fc = nn.Linear(32 * 8 * 8, 10)

    def forward(self, x):
        x = self.pool1(torch.relu(self.conv1(x)))
        x = self.pool2(torch.relu(self.conv2(x)))
        x = x.view(-1, 32 * 8 * 8)
        x = self.fc(x)
        return x

model = SimpleCNN().to(device)
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=0.001)

# Training Loop
epochs = 5 # Reduced slightly for speed since we're running locally
print("Starting training on CIFAR-10...")
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

# Evaluation
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
print(f'Accuracy on test images: {100 * correct / total:.2f}%')

# Export weights to binary for FPGA
SCALE_FACTOR = 1 << 10

def to_fixed(tensor):
    arr = tensor.cpu().detach().numpy().flatten()
    arr = np.round(arr * SCALE_FACTOR)
    arr = np.clip(arr, -32768, 32767).astype(np.int16)
    return arr

W1 = to_fixed(model.conv1.weight)
B1 = to_fixed(model.conv1.bias)
W2 = to_fixed(model.conv2.weight)
B2 = to_fixed(model.conv2.bias)
W3 = to_fixed(model.fc.weight)
B3 = to_fixed(model.fc.bias)

all_weights = np.concatenate([W1, B1, W2, B2, W3, B3])
print(f'Total weights exported: {len(all_weights)}')
all_weights.tofile('cnn_cifar10_weights.bin')
print('Exported to cnn_cifar10_weights.bin successfully.')
