import pandas as pd
import numpy as np
import os

def preprocess_ngsim(input_file, output_file, chunksize=100000, max_events=5000):
    print(f"Starting preprocessing of {input_file}...")
    
    # We want to extract features: v_Vel, v_Acc, Space_Headway, Time_Headway, Local_Y
    features = ['v_Vel', 'v_Acc', 'Space_Headway', 'Time_Headway', 'Local_Y', 'label']
    
    extracted_data = []
    
    # Track the previous state of vehicles to detect lane changes
    # Dictionary: {Vehicle_ID: {'Lane_ID': id, 'features': [...]}}
    vehicle_tracker = {}
    
    pos_events = 0
    neg_events = 0

    # Read in chunks to avoid memory errors
    for chunk in pd.read_csv(input_file, chunksize=chunksize):
        for index, row in chunk.iterrows():
            vid = row['Vehicle_ID']
            current_lane = row['Lane_ID']
            
            # Extract current features
            try:
                vel = float(row['v_Vel'])
                acc = float(row['v_Acc'])
                space_hdwy = float(row['Space_Headway'])
                time_hdwy = float(row['Time_Headway'])
                local_y = float(row['Local_Y'])
                current_features = [vel, acc, space_hdwy, time_hdwy, local_y]
            except ValueError:
                continue # Skip bad rows
                
            if vid in vehicle_tracker:
                prev_lane = vehicle_tracker[vid]['Lane_ID']
                
                if current_lane != prev_lane:
                    # Lane change detected! Use the features from the PREVIOUS frame
                    if pos_events < max_events:
                        event = vehicle_tracker[vid]['features'] + [1] # Label 1 = Lane Change
                        extracted_data.append(event)
                        pos_events += 1
                else:
                    # No lane change. Sample as negative event (10% chance to avoid massive imbalance)
                    if neg_events < max_events and np.random.rand() < 0.1:
                        event = current_features + [0] # Label 0 = No Change
                        extracted_data.append(event)
                        neg_events += 1
            
            # Update tracker
            vehicle_tracker[vid] = {'Lane_ID': current_lane, 'features': current_features}
            
            # Stop early if we have enough data
            if pos_events >= max_events and neg_events >= max_events:
                break
                
        if pos_events >= max_events and neg_events >= max_events:
            break
            
        print(f"Processed chunk. Positive events: {pos_events}, Negative events: {neg_events}")

    df = pd.DataFrame(extracted_data, columns=features)
    
    # Shuffle the dataset
    df = df.sample(frac=1).reset_index(drop=True)
    
    os.makedirs(os.path.dirname(output_file), exist_ok=True)
    df.to_csv(output_file, index=False)
    print(f"Successfully saved {len(df)} rows to {output_file}")

if __name__ == "__main__":
    # The large 2.1 GB file
    # Check multiple possible locations depending on where the script is run from
    input_locations = ['training/69617', '../training/69617', '/Users/cssudheer/Documents/major_project_repo/autonomous_system/training/69617']
    input_file = None
    
    for loc in input_locations:
        if os.path.exists(loc):
            input_file = loc
            break
            
    output_file = 'data/processed_lane_data.csv'
    
    if input_file is None:
        print(f"Error: 69617 dataset not found! Searched in: {input_locations}")
    else:
        preprocess_ngsim(input_file, output_file)
