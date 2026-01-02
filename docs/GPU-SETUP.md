# GPU Setup (NVIDIA + CUDA)

## Hardware
- **GPU:** NVIDIA GeForce RTX 3060
- **VRAM:** 12 GB
- **Driver Info:** `ubuntu-drivers devices`

## Installation Steps
1. **Drivers:**
   Use the restricted proprietary drivers.
   ```bash
   sudo ubuntu-drivers autoinstall
   ```
   *Reboot required.*

2. **Verification:**
   - `nvidia-smi` should return driver version and GPU info.

3. **CUDA Toolkit:**
   Install via Apt (Network Repo) or local runfile. Ensure compatibility with PyTorch/TensorFlow versions.

4. **NVIDIA Container Toolkit:**
   Required for Docker to access GPU.
   ```bash
   sudo apt-get install -y nvidia-container-toolkit
   sudo nvidia-ctk runtime configure --runtime=docker
   sudo systemctl restart docker
   ```
