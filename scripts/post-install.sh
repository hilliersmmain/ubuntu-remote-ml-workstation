#!/bin/bash
set -e

# ==========================================
# Ubuntu 24.04 LTS Post-Install Setup Script
# ==========================================

LOG_FILE="post-install.log"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "Starting post-install setup for Ubuntu 24.04 LTS..."
echo "Log file: $LOG_FILE"

# 1. Update System
echo "--- Updating System ---"
sudo apt update && sudo apt upgrade -y

# 2. Install Essential Tools
echo "--- Installing Essentials ---"
sudo apt install -y build-essential curl git wget vim htop unzip tree software-properties-common

# 3. Configure Firewall (UFW)
echo "--- Configuring Firewall (LAN Only) ---"
sudo ufw default deny incoming
sudo ufw default allow outgoing
# Allow SSH from LAN (adjust 192.168.1.0/24 to your actual subnet if different)
sudo ufw allow from 192.168.1.0/24 to any port 22 proto tcp
# Allow KDE Connect (1714-1764)
sudo ufw allow from 192.168.1.0/24 to any port 1714:1764 proto udp
sudo ufw allow from 192.168.1.0/24 to any port 1714:1764 proto tcp
sudo ufw enable
sudo ufw status verbose

# 4. Install NVIDIA Drivers & CUDA
echo "--- Installing NVIDIA Drivers ---"
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update
sudo apt install -y nvidia-driver-535 nvidia-utils-535
# Verify installation later with nvidia-smi

# 5. Install Docker & NVIDIA Container Toolkit
echo "--- Installing Docker ---"
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Configure Docker for non-root user
sudo usermod -aG docker $USER

# Install NVIDIA Container Toolkit
echo "--- Installing NVIDIA Container Toolkit ---"
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#' | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

# 6. Setup SSH
echo "--- Configuring SSH ---"
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh

echo "=========================================="
echo "Setup Complete! Please reboot your system."
echo "=========================================="
