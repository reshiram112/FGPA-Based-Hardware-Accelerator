import torch
import torch.nn as nn
import torch.optim as optim
import torchvision
import torchvision.transforms as transforms
import os
import json
import ssl

# Fix SSL certificate issue on macOS for downloading datasets
ssl._create_default_https_context = ssl._create_unverified_context

# CNN for Image Classification (e.g., Traffic Signs)
class SimpleCNN(nn.Module):
    def __init__(self, num_classes=43):
        super(SimpleCNN, self).__init__()
        # Input: 3x32x32
        self.conv1 = nn.Conv2d(3, 16, kernel_size=3, padding=1)
        self.relu = nn.ReLU()
        self.pool = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(16, 32, kernel_size=3, padding=1)
        self.fc1 = nn.Linear(32 * 8 * 8, 128)
        self.fc2 = nn.Linear(128, num_classes)

    def forward(self, x):
        x = self.pool(self.relu(self.conv1(x)))
        x = self.pool(self.relu(self.conv2(x)))
        x = x.view(-1, 32 * 8 * 8)
        x = self.relu(self.fc1(x))
        x = self.fc2(x)
        return x

def main():
    print("--- Training CNN for Image Classification ---")
    transform = transforms.Compose([
        transforms.Resize((32, 32)),
        transforms.ToTensor(),
        transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))
    ])

    # Check multiple possible locations for the dataset
    gtsrb_locations = ['/Users/cssudheer/Documents/major_project_repo/datasets/gtsrb/Train']
    gtsrb_path = None
    
    for loc in gtsrb_locations:
        if os.path.exists(loc):
            gtsrb_path = loc
            break
            
    if gtsrb_path is None:
        print(f"Error: GTSRB dataset not found! Searched in: {gtsrb_locations}")
        return
        
    dataset = torchvision.datasets.ImageFolder(root=gtsrb_path, transform=transform)
    
    # Split into train and test (80/20)
    train_size = int(0.8 * len(dataset))
    test_size = len(dataset) - train_size
    trainset, testset = torch.utils.data.random_split(dataset, [train_size, test_size])
    
    trainloader = torch.utils.data.DataLoader(trainset, batch_size=64, shuffle=True)
    testloader = torch.utils.data.DataLoader(testset, batch_size=64, shuffle=False)

    model = SimpleCNN(num_classes=43)
    criterion = nn.CrossEntropyLoss()
    optimizer = optim.Adam(model.parameters(), lr=0.001)

    epochs = 2
    for epoch in range(epochs):
        model.train()
        running_loss = 0.0
        for i, data in enumerate(trainloader, 0):
            inputs, labels = data
            optimizer.zero_grad()
            outputs = model(inputs)
            loss = criterion(outputs, labels)
            loss.backward()
            optimizer.step()
            running_loss += loss.item()
            if i % 100 == 99:
                print(f'[Epoch {epoch + 1}, Batch {i + 1}] loss: {running_loss / 100:.3f}')
                running_loss = 0.0

    print("Finished Training CNN. Evaluating...")
    
    # Evaluation
    model.eval()
    correct = 0
    total = 0
    with torch.no_grad():
        for data in testloader:
            images, labels = data
            outputs = model(images)
            _, predicted = torch.max(outputs.data, 1)
            total += labels.size(0)
            correct += (predicted == labels).sum().item()

    accuracy = 100 * correct / total
    print(f'Accuracy of the network on the 10000 test images: {accuracy:.2f}%')
    
    # Save results
    output_dir = '/Users/cssudheer/Documents/major_project_repo/model_outputs'
    os.makedirs(f'{output_dir}/results', exist_ok=True)
    results = {
        "model": "CNN",
        "dataset": "GTSRB (Traffic Signs)",
        "epochs": epochs,
        "test_accuracy": accuracy
    }
    with open(f'{output_dir}/results/cnn_results.json', 'w') as f:
        json.dump(results, f, indent=4)
    print(f"Saved evaluation metrics to {output_dir}/results/cnn_results.json")

    # Save the model
    os.makedirs(f'{output_dir}/models', exist_ok=True)
    torch.save(model.state_dict(), f'{output_dir}/models/cnn_weights.pth')
    print(f"Model weights saved to {output_dir}/models/cnn_weights.pth")

if __name__ == "__main__":
    main()
