import torch
import torch.nn as nn
import torch.optim as optim
import os
import json
import pandas as pd
import librosa
import numpy as np

class UrbanSoundDataset(torch.utils.data.Dataset):
    def __init__(self, csv_path, data_dir, folds=[1]):
        self.data_dir = data_dir
        df = pd.read_csv(csv_path)
        df = df[df['fold'].isin(folds)]
        
        # Balance the dataset (50% Siren, 50% Non-Siren)
        sirens = df[df['classID'] == 8]
        non_sirens = df[df['classID'] != 8].sample(n=len(sirens), random_state=42)
        self.df = pd.concat([sirens, non_sirens]).sample(frac=1, random_state=42).reset_index(drop=True)
        
        self.target_sample_rate = 22050

    def __len__(self):
        return len(self.df)

    def __getitem__(self, idx):
        row = self.df.iloc[idx]
        file_path = os.path.join(self.data_dir, f"fold{row['fold']}", row['slice_file_name'])
        
        try:
            # Use librosa to reliably load the audio file
            y, sr = librosa.load(file_path, sr=self.target_sample_rate, mono=True)
            
            # Extract 40 MFCCs
            mfcc = librosa.feature.mfcc(y=y, sr=sr, n_mfcc=40)
            
            # Extract Translation-Invariant Statistical Features
            mfcc_mean = np.mean(mfcc, axis=1)
            mfcc_std = np.std(mfcc, axis=1)
            mfcc_max = np.max(mfcc, axis=1)
            mfcc_min = np.min(mfcc, axis=1)
            
            # Combine into 160 features
            features = np.concatenate([mfcc_mean, mfcc_std, mfcc_max, mfcc_min])
            mfcc_features = torch.tensor(features, dtype=torch.float32)
        except Exception as e:
            mfcc_features = torch.zeros(160, dtype=torch.float32)
            
        original_label = row['classID']
        label = 1 if original_label == 8 else 0
        
        return mfcc_features, label

class AudioMLP(nn.Module):
    def __init__(self, input_size=160, hidden_size=256, num_classes=2):
        super(AudioMLP, self).__init__()
        # Standard Multi-Layer Perceptron (Floating Point)
        self.fc1 = nn.Linear(input_size, hidden_size)
        self.relu1 = nn.ReLU()
        self.dropout1 = nn.Dropout(0.3)
        
        self.fc2 = nn.Linear(hidden_size, hidden_size)
        self.relu2 = nn.ReLU()
        self.dropout2 = nn.Dropout(0.3)
        
        self.fc3 = nn.Linear(hidden_size, num_classes)

    def forward(self, x):
        x = self.dropout1(self.relu1(self.fc1(x)))
        x = self.dropout2(self.relu2(self.fc2(x)))
        x = self.fc3(x)
        return x

def main():
    print("--- Training MLP for Audio Classification ---")
    
    csv_locations = ['/Users/cssudheer/Documents/major_project_repo/datasets/urbansound/UrbanSound8K.csv']
    dir_locations = ['/Users/cssudheer/Documents/major_project_repo/datasets/urbansound']
    
    csv_path = None
    data_dir = None
    
    for loc in csv_locations:
        if os.path.exists(loc):
            csv_path = loc
            break
            
    for loc in dir_locations:
        if os.path.exists(loc):
            data_dir = loc
            break
            
    if csv_path is None or data_dir is None:
        print(f"Error: UrbanSound8K dataset not found! Searched in: {csv_locations}")
        return

    print("Loading datasets... (Using Folds 1-8 for training, Fold 9 for testing)")
    trainset = UrbanSoundDataset(csv_path, data_dir, folds=[1, 2, 3, 4, 5, 6, 7, 8])
    testset = UrbanSoundDataset(csv_path, data_dir, folds=[9])

    trainloader = torch.utils.data.DataLoader(trainset, batch_size=128, shuffle=True)
    testloader = torch.utils.data.DataLoader(testset, batch_size=128, shuffle=False)

    model = AudioMLP(input_size=160, hidden_size=256, num_classes=2)
    criterion = nn.CrossEntropyLoss()
    optimizer = optim.Adam(model.parameters(), lr=0.001)

    epochs = 40
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
            
        print(f'[Epoch {epoch + 1}/{epochs}] loss: {running_loss / max(1, len(trainloader)):.3f}')

    print("Finished Training Audio MLP. Evaluating...")
    
    model.eval()
    correct = 0
    total = 0
    with torch.no_grad():
        for data in testloader:
            inputs, labels = data
            outputs = model(inputs)
            _, predicted = torch.max(outputs.data, 1)
            total += labels.size(0)
            correct += (predicted == labels).sum().item()

    accuracy = 100 * correct / max(1, total)
    print(f'Accuracy of Audio MLP on test set: {accuracy:.2f}%')

    output_dir = '/Users/cssudheer/Documents/major_project_repo/model_outputs'
    os.makedirs(f'{output_dir}/results', exist_ok=True)
    results = {
        "model": "Audio_MLP",
        "dataset": "UrbanSound8K (Siren vs Non-Siren)",
        "epochs": epochs,
        "test_accuracy": accuracy
    }
    with open(f'{output_dir}/results/audio_mlp_results.json', 'w') as f:
        json.dump(results, f, indent=4)
    print(f"Saved evaluation metrics to {output_dir}/results/audio_mlp_results.json")

    os.makedirs(f'{output_dir}/models', exist_ok=True)
    torch.save(model.state_dict(), f'{output_dir}/models/audio_mlp_weights.pth')
    print(f"Model weights saved to {output_dir}/models/audio_mlp_weights.pth")

if __name__ == "__main__":
    main()
