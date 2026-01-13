#!/bin/bash
################################################################################
# laptop_setup.sh
# 
# Purpose: Automate setup of a fresh Ubuntu 24.04 LTS installation on a laptop,
#          replicating the security hardening and application environment of
#          the user's desktop.
#
# Usage:   chmod +x laptop_setup.sh && sudo ./laptop_setup.sh
#
# Notes:
#   - Run this script immediately after a fresh Ubuntu 24.04 install.
#   - Requires root privileges (sudo).
#   - After completion, manually:
#       1. Attach to Ubuntu Pro: `sudo pro attach`
#       2. Login to NordVPN: `nordvpn login`
################################################################################

set -e  # Exit immediately if a command exits with a non-zero status

# ==============================================================================
# 1. SYSTEM UPDATES
# ==============================================================================
echo "=========================================="
echo "[1/5] Running system updates..."
echo "=========================================="
apt update && apt upgrade -y
echo "[✓] System updates complete."

# ==============================================================================
# 2. SECURITY HARDENING
# ==============================================================================
echo ""
echo "=========================================="
echo "[2/5] Configuring security hardening..."
echo "=========================================="

# --- Firewall (UFW) ---
echo "[*] Installing and configuring UFW..."
apt install -y ufw
ufw --force reset
ufw default deny incoming
ufw default allow outgoing
ufw --force enable
echo "[✓] UFW configured: deny incoming, allow outgoing."

# --- Unattended Upgrades ---
echo "[*] Installing unattended-upgrades..."
apt install -y unattended-upgrades
dpkg-reconfigure -f noninteractive unattended-upgrades
echo "[✓] Unattended upgrades enabled."

# --- Disable Unnecessary Services ---
echo "[*] Disabling unnecessary services (xrdp, cups)..."

# Disable xrdp if installed
if systemctl list-unit-files | grep -q xrdp; then
    systemctl stop xrdp || true
    systemctl disable xrdp || true
    echo "[✓] xrdp disabled."
else
    echo "[i] xrdp not installed, skipping."
fi

# Disable cups (printing service)
if systemctl list-unit-files | grep -q cups; then
    systemctl stop cups || true
    systemctl disable cups || true
    echo "[✓] cups disabled."
else
    echo "[i] cups not installed, skipping."
fi

echo "[✓] Security hardening complete."

# ==============================================================================
# 3. APPLICATION INSTALLATION (SNAP)
# ==============================================================================
echo ""
echo "=========================================="
echo "[3/5] Installing Snap applications..."
echo "=========================================="

echo "[*] Installing NordVPN..."
snap install nordvpn
echo "[✓] NordVPN installed. Remember to run 'nordvpn login' after this script."

echo "[*] Installing Brave Browser..."
snap install brave
echo "[✓] Brave Browser installed."

echo "[✓] Snap applications complete."

# ==============================================================================
# 4. APPLICATION INSTALLATION (APT)
# ==============================================================================
echo ""
echo "=========================================="
echo "[4/5] Installing APT applications..."
echo "=========================================="

# --- Essential Tools ---
echo "[*] Installing git, curl, wget, build-essential..."
apt install -y git curl wget build-essential
echo "[✓] Essential tools installed."

# --- Google Chrome ---
echo "[*] Adding Google Chrome repository..."
# Add Google's signing key
wget -qO - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg
# Add the repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
apt update
echo "[*] Installing Google Chrome..."
apt install -y google-chrome-stable
echo "[✓] Google Chrome installed."

echo "[✓] APT applications complete."

# ==============================================================================
# 5. SUMMARY & NEXT STEPS
# ==============================================================================
echo ""
echo "=========================================="
echo "[5/5] Setup Complete!"
echo "=========================================="
echo ""
echo "Manual steps remaining:"
echo "  1. Attach to Ubuntu Pro:  sudo pro attach"
echo "  2. Login to NordVPN:      nordvpn login"
echo "  3. (Optional) Install VS Code manually"
echo ""
echo "Your laptop is now configured to match your desktop security profile."
echo "=========================================="

################################################################################
# OPTIONAL: FILE SYNC STRATEGY
################################################################################
# Uncomment the section below if you decide to use Syncthing for peer-to-peer
# file synchronization between your desktop and laptop.
#
# --- Syncthing Installation ---
# echo "[*] Installing Syncthing..."
# apt install -y syncthing
# systemctl enable syncthing@$SUDO_USER
# systemctl start syncthing@$SUDO_USER
# echo "[✓] Syncthing installed. Access the web UI at http://localhost:8384"
# echo "[i] Remember to configure Syncthing on both desktop and laptop."
#
# --- Alternative: Cloud Sync ---
# If you prefer cloud sync (e.g., Dropbox, Google Drive), install the
# appropriate client instead. Popular options:
#   - Dropbox:      https://www.dropbox.com/install-linux
#   - rclone:       apt install -y rclone  (supports many cloud providers)
#   - Insync:       https://www.insynchq.com/ (paid, supports GDrive/OneDrive)
################################################################################

################################################################################
# OPTIONAL: BASHRC CUSTOMIZATIONS
################################################################################
# Uncomment and modify below to add custom aliases and prompt to your .bashrc
#
# BASHRC_FILE="/home/$SUDO_USER/.bashrc"
# cat >> "$BASHRC_FILE" << 'EOF'
#
# # --- Custom Aliases ---
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'
# alias update='sudo apt update && sudo apt upgrade -y'
# alias cls='clear'
#
# # --- Custom Prompt (optional) ---
# # PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#
# EOF
# echo "[✓] Bashrc customizations added."
################################################################################
