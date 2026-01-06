# Oracle Cloud VM Setup

This document describes the Oracle Cloud "Always Free" ARM VM used as a portable development environment.

## Why Oracle Cloud?

Due to an upcoming move (2026-01-10), the desktop workstation will be unavailable for several months. Oracle Cloud's Always Free tier provides a capable development VM that can be accessed from anywhere:

- **Free forever** after the $300 trial credit expires (until 2026-01-28)
- **Low latency from Charlotte, NC** (~400 miles to Ashburn, VA data center)
- **Portable** accessible from laptop anywhere with internet

## VM Specifications

| Resource    | Value                               |
| ----------- | ----------------------------------- |
| **Shape**   | VM.Standard.A1.Flex (ARM/Ampere A1) |
| **OCPUs**   | 4 (max free tier)                   |
| **RAM**     | 24 GB (max free tier)               |
| **Storage** | 50-100 GB Boot Volume               |
| **OS**      | Ubuntu 24.04 LTS (Aarch64)          |
| **Region**  | us-ashburn-1                        |
| **Network** | 4 Gbps (1 Gbps per OCPU)            |

## Provisioning Status

**Status**: Waiting for capacity (automated retry script running)

Oracle's free ARM instances are in high demand. The `oracle_create_vm.py` script automatically retries every 30 seconds until capacity becomes available.

### Retry Script

Location: `~/antigravity-and-claude-code/oracle_create_vm.py`

**To run:**

```bash
cd ~/antigravity-and-claude-code
~/antigravity-and-claude-code/oci_venv/bin/python3 oracle_create_vm.py
```

**Expected success output:**

```
============================================================
VM SUCCESSFULLY CREATED!
Public IP: X.X.X.X
To connect via SSH, run:
  ssh -i ~/.ssh/oracle-cloud/oracle_vm_key ubuntu@X.X.X.X
============================================================
```

## SSH Access

**Keys location:** `~/.ssh/oracle-cloud/`

- Private key: `oracle_vm_key` (permissions: 600)
- Public key: `oracle_vm_key.pub` (permissions: 644)

**Connect:**

```bash
ssh -i ~/.ssh/oracle-cloud/oracle_vm_key ubuntu@<PUBLIC_IP>
```

## Post-Provisioning Setup

Once the VM is running:

### 1. System Update

```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Configure Swap (8GB for ML builds)

```bash
sudo fallocate -l 8G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

### 3. Install Tailscale (Secure Remote Access)

```bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
```

### 4. Install Desktop Environment (Optional)

```bash
sudo apt install -y xfce4 xfce4-goodies xrdp
sudo systemctl enable xrdp
sudo systemctl start xrdp
```

### 5. Install Docker

```bash
sudo apt install -y docker.io
sudo usermod -aG docker ubuntu
```

## OCI CLI Configuration

The Oracle Cloud CLI is installed and configured:

- Config location: `~/.oci/config`
- API key: `~/.oci/oci_api_key.pem`

**Verify configuration:**

```bash
~/bin/oci iam region list --output table
```

## Security Notes

- SSH keys and OCI API keys are stored outside the git repo
- All sensitive files are in `.gitignore`
- The VM's security list should restrict RDP (3389) to your IP only
- Tailscale is recommended over exposing ports publicly

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        Your Laptop                          │
│                     (HP Envy x360)                          │
└─────────────────────┬───────────────┬───────────────────────┘
                      │               │
                      │ SSH/Tailscale │ LAN (when home)
                      │               │
                      ▼               ▼
┌─────────────────────────┐   ┌─────────────────────────────┐
│    Oracle Cloud VM      │   │     Desktop Workstation     │
│    (dev-vm)             │   │     (when available)        │
│    ─────────────────    │   │     ─────────────────────   │
│    ARM A1, 4 CPU, 24GB  │   │     i7-12700F, RTX 3060     │
│    Ubuntu 24.04 ARM     │   │     Ubuntu 24.04 x86        │
│    Always accessible    │   │     Heavy compute/GPU       │
└─────────────────────────┘   └─────────────────────────────┘
```
