import torch
import torch.nn as nn
import torch.optim as optim
import torchvision
import torchvision.transforms as transforms
import numpy as np

device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
print(f'Using device: {device}')

# Fashion-MNIST Dataset for MLP
transform = transforms.Compose([
    transforms.ToTensor(),
    transforms.Normalize((0.5,), (0.5,))
])

trainset = torchvision.datasets.FashionMNIST(root='./data', train=True, download=True, transform=transform)
trainloader = torch.utils.data.DataLoader(trainset, batch_size=128, shuffle=True)

testset = torchvision.datasets.FashionMNIST(root='./data', train=False, download=True, transform=transform)
testloader = torch.utils.data.DataLoader(testset, batch_size=128, shuffle=False)

class MLP(nn.Module):
    def __init__(self):
        super(MLP, self).__init__()
        # Input 28*28 = 784, output 10
        self.fc1 = nn.Linear(784, 512)
        self.fc2 = nn.Linear(512, 256)
        self.fc3 = nn.Linear(256, 128)
        self.fc4 = nn.Linear(128, 10)

    def forward(self, x):
        x = x.view(-1, 784)
        x = torch.relu(self.fc1(x))
        x = torch.relu(self.fc2(x))
        x = torch.relu(self.fc3(x))
        x = self.fc4(x)
        return x

model = MLP().to(device)
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=0.001)

# Training Loop
epochs = 5
print("Starting training on Fashion-MNIST for MLP...")
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
acc = 100 * correct / total
print(f'Accuracy on Fashion-MNIST test images: {acc:.2f}%')

# Write to file
with open('mlp_accuracy.txt', 'w') as f:
    f.write(f"{acc:.2f}")

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
all_weights.tofile('mlp_fashion_mnist_weights.bin')
print('Exported to mlp_fashion_mnist_weights.bin')
