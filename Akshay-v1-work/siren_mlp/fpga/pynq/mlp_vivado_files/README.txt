Place mlp_accelerator.bit and mlp_accelerator.hwh here after the Vivado build.

Build steps:
  1. cd MLP/fpga/hls
     python generate_weights.py          # generates mlp_weights_data.h
     vitis_hls -f run_hls.tcl            # synthesises IP, writes ../hls_ip.zip

  2. cd MLP/fpga
     Expand-Archive hls_ip.zip -DestinationPath hls_ip   # (PowerShell)

  3. vivado -mode batch -source MLP/fpga/vivado/create_project.tcl
     # copies mlp_accelerator.bit to this folder automatically

  4. python MLP/fpga/pynq/extract_hwh.py \
         --xsa MLP/fpga/vivado/proj_mlp_accelerator/output/mlp_accelerator.xsa \
         --out-dir MLP/fpga/pynq/mlp_vivado_files
     # copies mlp_accelerator.hwh to this folder

  5. python MLP/fpga/pynq/deploy.py      # SCP files to PYNQ board
