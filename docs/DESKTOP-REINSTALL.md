# Desktop Reinstall Guide

This guide covers the process of creating the installation media on your **Laptop (Host)** and installing Ubuntu 24.04 LTS on your **Desktop (Target)**.

## Prerequisites

- **Host Machine**: Laptop (used to create USB)
- **Target Machine**: CyberPower PC (Desktop to be wiped)
- **USB Drive**: At least 8GB (Warning: All data on USB will be erased)
- **Ubuntu ISO**: 24.04.3 LTS Desktop

## Phase 1: Create Installation Media (On Laptop)

> [!NOTE]
> Perform these steps on your **Laptop**.

1. **Download ISO**
   Ensure `ubuntu-24.04.3-desktop-amd64.iso` is in your current directory on the laptop.

2. **Identify USB Drive**
   Run `lsblk` to confirm your USB device path (e.g., `/dev/sda`).
   **CRITICAL**: Triple-check this path. Writing to the wrong device will destroy your laptop's data.

3. **Flash USB**
   ```bash
   sudo umount -l /dev/sda1  # Ensure unmounted
   sudo dd if=ubuntu-24.04.3-desktop-amd64.iso of=/dev/sda bs=4M status=progress conv=fsync
   ```

## Phase 2: Installation (On Desktop)

> [!IMPORTANT]
> Move the USB drive to the **Desktop** machine.

1. **Boot from USB**

   - Insert USB into the desktop.
   - Restart desktop and press **F12** (or Del/F2) to enter boot menu.
   - Select the USB drive (UEFI mode).

2. **Run Installer**

   - Choose language and keyboard.
   - **Connect to Network** (Important for updates).
   - **Installation Type**:
     - **Erase disk and install Ubuntu** (Since we are wiping everything).
     - **Manual Partitioning (Advanced)**: _Optional_ if you want to reserve space for Windows now.
       - Recommended: Create a 500GB EXT4 partition for Ubuntu, leave the rest unallocated.

3. **User Setup**
   - Set hostname: `ubuntu-ml-workstation`
   - Create your user account.

## Phase 3: Post-Install Setup (On Desktop)

1. **Copy Automation Script**
   After booting into the new Ubuntu installation, copy the `scripts/post-install.sh` from this repo (or your USB backup) to the machine.

2. **Run Script**

   ```bash
   chmod +x post-install.sh
   ./post-install.sh
   ```

   This will:

   - Update system
   - Install NVIDIA drivers & CUDA
   - Install Docker & NVIDIA Container Toolkit
   - Configure UFW Firewall
   - Enable SSH

3. **Verify Setup**
   - `nvidia-smi`: Should show GPU details.
   - `docker run --rm --gpus all nvidia/cuda:12.2.0-base-ubuntu22.04 nvidia-smi`: Verify Docker GPU access.

## Phase 4: Future Windows Dual-Boot

When you are ready to install Windows:

1. **Prepare Partition**

   - Boot into Ubuntu.
   - Open **GParted**.
   - Shrink the main Ubuntu partition to free up space (e.g., 500GB).
   - Leave the space unallocated.

2. **Install Windows**

   - Boot from Windows Installer USB.
   - Install to the unallocated space.
   - **Note**: This will overwrite the GRUB bootloader. Ubuntu will not be accessible temporarily.

3. **Restore GRUB**
   - Boot from **Ubuntu Live USB** (the one you made in Phase 1).
   - Install and run `boot-repair`:
     ```bash
     sudo add-apt-repository ppa:yannubuntu/boot-repair
     sudo apt update
     sudo apt install -y boot-repair
     boot-repair
     ```
   - Follow the prompts to restore GRUB.
   - Reboot. You should now see a menu to choose between Ubuntu and Windows.
