import os
import random
import zipfile
import shutil
import pandas as pd

ROOT = os.path.dirname(os.path.abspath(__file__))
DATASETS_DIR = os.path.join(os.path.dirname(ROOT), 'datasets')

def create_gtsrb_burst():
    gtsrb_dir = os.path.join(DATASETS_DIR, 'gtsrb', 'Test') # Adjust if structure is different
    if not os.path.exists(gtsrb_dir):
        # Maybe it's in train?
        gtsrb_dir = os.path.join(DATASETS_DIR, 'gtsrb', 'Train')
        if not os.path.exists(gtsrb_dir):
            print("Could not find GTSRB dataset.")
            return

    # Find all images
    all_images = []
    for root, dirs, files in os.walk(gtsrb_dir):
        for f in files:
            if f.endswith('.png') or f.endswith('.jpg'):
                all_images.append(os.path.join(root, f))
    
    if not all_images:
        print("No GTSRB images found.")
        return

    # Sample 100
    sampled = random.sample(all_images, min(100, len(all_images)))
    
    out_zip = os.path.join(ROOT, 'images', 'gtsrb_burst_100.zip')
    os.makedirs(os.path.dirname(out_zip), exist_ok=True)
    
    with zipfile.ZipFile(out_zip, 'w') as z:
        for i, img_path in enumerate(sampled):
            # Flatten folder structure in zip for easy extraction
            z.write(img_path, f"image_{i}.png")
            
    print(f"Created {out_zip} with {len(sampled)} images.")

def create_urbansound_burst():
    audio_dir = os.path.join(DATASETS_DIR, 'urbansound')
    all_audio = []
    for root, dirs, files in os.walk(audio_dir):
        for f in files:
            if f.endswith('.wav'):
                all_audio.append(os.path.join(root, f))
                
    if not all_audio:
        print("No UrbanSound audio found.")
        return
        
    sampled = random.sample(all_audio, min(100, len(all_audio)))
    
    out_zip = os.path.join(ROOT, 'audio', 'urbansound_burst_100.zip')
    os.makedirs(os.path.dirname(out_zip), exist_ok=True)
    
    with zipfile.ZipFile(out_zip, 'w') as z:
        for i, aud_path in enumerate(sampled):
            z.write(aud_path, f"audio_{i}.wav")
            
    print(f"Created {out_zip} with {len(sampled)} audio files.")

def create_lane_burst():
    csv_path = os.path.join(DATASETS_DIR, 'lane_data', 'lane_change_data.csv')
    if not os.path.exists(csv_path):
        print("Could not find lane_change_data.csv.")
        return
        
    df = pd.read_csv(csv_path)
    sampled = df.sample(n=min(100, len(df)), random_state=42)
    
    out_csv = os.path.join(ROOT, 'csv', 'lane_burst_100.csv')
    os.makedirs(os.path.dirname(out_csv), exist_ok=True)
    
    sampled.to_csv(out_csv, index=False)
    print(f"Created {out_csv} with {len(sampled)} rows.")

if __name__ == "__main__":
    print("Generating Burst Datasets...")
    create_gtsrb_burst()
    create_urbansound_burst()
    create_lane_burst()
    print("Done!")
