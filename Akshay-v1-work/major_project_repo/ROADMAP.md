# Autonomous Multi-Model System: Master Roadmap

Follow these steps in sequence to complete your project.

## Phase 1: Software Training & Data
1. **Install Dependencies**: Run `python3 -m pip install -r requirements.txt`.
2. **Preprocess NGSIM**: Run `python3 model_training/preprocess_ngsim.py`. This shrinks the 2GB file into a small `processed_lane_data.csv`.
3. **Train Models**: Run the scripts sequentially:
```bash
python3 model_training/train_cnn.py
python3 model_training/train_audio_mlp.py
python3 model_training/train_svm.py
python3 model_training/train_bnn_router.py
```
   - Ensure you see `Saved evaluation metrics to results/` after each run.
   - This creates `.pth` and `.pkl` files in `weight_extraction/saved_models/`.

## Phase 2: Hardware Weight Extraction
1. **Run Extraction**: Run `python3 weight_extraction/extract_weights_all.py`.
2. **Verify Headers**: Check `weight_extraction/verilog_headers/` for `.vh` files. These contain the `localparam` values that your Verilog code needs to perform inference.

## Phase 3: Vivado Hardware Design
1. **Create IP**: Package your Verilog modules (`cnn_accelerator.v`, etc.) as Vivado IP.
2. **Build Block Design**:
   - Add Zynq PS.
   - Add 4 DMAs (Direct Memory Access).
   - Connect DMAs to your IPs via AXI-Stream.
   - Refer to [block_design_guide.md](./vivado/block_design_guide.md) for connections.
3. **Generate Bitstream**: Export the resulting `.bit` and `.hwh` files.

## Phase 4: PYNQ Deployment
1. **Upload**: Copy `.bit`, `.hwh`, and `pynq/autonomous_inference.py` to your PYNQ-Z2 board.
2. **Execute**: Run the inference script in a Jupyter notebook on the board.
   - The BNN Router will categorize the input.
   - The DMAs will ship the data to the correct hardware accelerator.
   - You will see the accelerated output in your console.

### Core Scripts
* `train_cnn.py`: Trains the image classifier for traffic signs (GTSRB).
* `train_audio_mlp.py`: Trains the MLP to detect emergency sirens (UrbanSound8K).
* `train_svm.py`: Trains the SVM for lane changing detection (NGSIM).
* `train_bnn_router.py`: Trains the master hardware BNN to route packets to the correct hardware accelerator.
