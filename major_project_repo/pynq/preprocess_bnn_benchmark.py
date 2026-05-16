import os
import cv2
import numpy as np
import glob

print("==================================================")
print("  Pre-processing Images for PYNQ Batch Benchmark  ")
print("==================================================")

# 1. Define paths
image_dir = r"c:\Users\Chappidi Sai Sudheer\Downloads\major_project_repo 3\major_project_repo\datasets\pothole\images"
output_file = "bnn_benchmark_data.npy"

# Find all images
image_paths = glob.glob(os.path.join(image_dir, "*.png")) + glob.glob(os.path.join(image_dir, "*.jpg"))
print(f"Found {len(image_paths)} images in dataset.")

if len(image_paths) == 0:
    print("Error: No images found! Check your path.")
    exit()

def pack_image_to_words(img_bin):
    packed_words = []
    for row in range(64):
        word = 0
        for col in range(32):
            if img_bin[row, col] > 128:
                word |= (1 << col)
        packed_words.append(word)
    return np.array(packed_words, dtype=np.uint32)

all_packed_images = []

print("Processing and packing images...")
for i, path in enumerate(image_paths):
    img = cv2.imread(path, cv2.IMREAD_GRAYSCALE)
    if img is None: continue
        
    # Resize and binarize
    img_resized = cv2.resize(img, (32, 64))
    _, img_bin = cv2.threshold(img_resized, 127, 255, cv2.THRESH_BINARY)
    
    # Pack into 64 words
    packed = pack_image_to_words(img_bin)
    all_packed_images.append(packed)

# To ensure we hit exactly 1000 images for a nice round benchmark number,
# we will duplicate the dataset if necessary until we reach 1000.
while len(all_packed_images) < 1000:
    all_packed_images.extend(all_packed_images[:1000 - len(all_packed_images)])

# Convert to a single massive numpy array of shape (1000, 64) -> flattened to (64000,)
final_batch = np.array(all_packed_images[:1000]).flatten()

# Save to .npy
np.save(output_file, final_batch)

size_kb = os.path.getsize(output_file) / 1024
print("==================================================")
print(f"✅ Success! Packed 1000 images into a single file: {output_file}")
print(f"File size: {size_kb:.1f} KB")
print("==================================================")
print("Next steps:")
print(f"1. Upload '{output_file}' to your PYNQ board.")
print("2. Run Cell 4 in your Jupyter Notebook to perform the High-Speed Benchmark!")
