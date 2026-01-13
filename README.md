# Ubuntu Remote ML Workstation

[![Status](https://img.shields.io/badge/Status-v1.0%20Stable-success?style=for-the-badge)](.)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04%20LTS-E95420?style=for-the-badge&logo=ubuntu)](https://ubuntu.com)
[![NVIDIA](https://img.shields.io/badge/GPU-RTX%203060-76B900?style=for-the-badge&logo=nvidia)](https://nvidia.com)
[![NordVPN](https://img.shields.io/badge/VPN-NordVPN%20Meshnet-4687FF?style=for-the-badge&logo=nordvpn)](https://nordvpn.com)

**Ubuntu Remote ML Workstation** is a hybrid machine learning infrastructure project designed to bridge the gap between high-performance local compute and portable development. It establishes a seamless, secure, and scalable development environment across a dedicated GPU desktop and a lightweight mobile client—accessible from anywhere via encrypted mesh networking.

---

## 🏗️ Architecture & Infrastructure

This project implements a professional **"Hub-and-Spoke"** development topology with secure remote connectivity:

```
┌─────────────────────────────────────────────────────────────────┐
│                     SECURE MESH NETWORK                         │
│                   (NordVPN Meshnet + Dedicated IP)              │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   ┌─────────────┐    SSH/KDE Connect    ┌─────────────┐        │
│   │   DESKTOP   │◄────────────────────►│   LAPTOP    │        │
│   │  (GPU Hub)  │                       │  (Client)   │        │
│   │  RTX 3060   │                       │  HP Envy    │        │
│   └──────┬──────┘                       └─────────────┘        │
│          │                                                      │
│          │ Vertex AI API                                        │
│          ▼                                                      │
│   ┌─────────────┐                                               │
│   │ Google Cloud│                                               │
│   │  Vertex AI  │                                               │
│   └─────────────┘                                               │
└─────────────────────────────────────────────────────────────────┘
```

### 1. The Compute Hub (Desktop)

| Component | Specification |
|-----------|---------------|
| **Case** | CyberPower Prebuilt (2023) |
| **Processor** | Intel Core i7-12700F (12 cores, 20 threads) |
| **Graphics** | NVIDIA RTX 3060 (12GB VRAM) |
| **Memory** | 16GB DDR4 |
| **Storage** | 1TB NVMe SSD |
| **OS** | Ubuntu 24.04.03 LTS |
| **Role** | Deep Learning training, CUDA workloads, Docker orchestration |

### 2. The Portable Client (Laptop)

| Component | Specification |
|-----------|---------------|
| **Model** | HP Envy |
| **Processor** | Intel Core i7-1355U |
| **Memory** | 16GB RAM |
| **Storage** | 512GB NVMe SSD |
| **OS** | Ubuntu 24.04.03 LTS (Primary) + Windows 11 (Dual-boot) |
| **Role** | Thin client for coding, lightweight inference, remote hub access |

### 3. Cloud Extension

- **Google Cloud Vertex AI:** Seamless handoff of massive workloads when local VRAM is exceeded
- **Unified Environment:** Consistent tooling across Local, Remote, and Cloud contexts

---

## 🔐 Secure Remote Connectivity

The core innovation of this project is **secure, location-independent access** to the GPU workstation:

### NordVPN Meshnet + Dedicated IP Configuration

- **Meshnet Enabled:** Direct encrypted peer-to-peer connection between desktop and laptop without exposing public ports
- **Dedicated IP:** Static IP address for reliable SSH access and service hosting
- **KDE Connect Integration:** Seamless file sharing, clipboard sync, and notifications across devices over the mesh network
- **SSH over Meshnet:** Secure shell access to the desktop from anywhere in the world without port forwarding

```bash
# Connect to desktop from laptop (anywhere)
ssh user@desktop.nord.meshnet

# KDE Connect automatically discovers devices on meshnet
# No manual IP configuration required
```

### Security Hardening

- **UFW Firewall:** Configured to allow only SSH (22), KDE Connect (1714-1764), and Meshnet traffic
- **Fail2Ban:** Intrusion prevention with automatic IP banning after failed login attempts
- **SSH Key Authentication:** Password login disabled, RSA 4096-bit keys only
- **Unattended Upgrades:** Automatic security patches

---

## 🚀 Key Implementations

| Feature | Status | Description |
|---------|--------|-------------|
| **Secure Remote Access** | ✅ Complete | SSH + Meshnet + Dedicated IP for global access |
| **GPU Passthrough** | ✅ Complete | NVIDIA 535+ drivers, CUDA 12.x, PyTorch/TensorFlow |
| **Automated Provisioning** | ✅ Complete | Bash scripts bootstrap new machine in <15 minutes |
| **Containerized Workflows** | ✅ Complete | Docker + NVIDIA Container Toolkit |
| **KDE Connect Sync** | ✅ Complete | File sharing, clipboard, notifications over Meshnet |
| **Security Hardening** | ✅ Complete | UFW, Fail2Ban, SSH keys, unattended upgrades |
| **Ansible Automation** | 🔄 In Progress | Full declarative machine configuration |

---

## 🛠️ Technology Stack

| Category | Technologies |
|----------|-------------|
| **Infrastructure** | Ubuntu 24.04 LTS, Bash, SSH, Systemd |
| **Networking** | NordVPN Meshnet, Dedicated IP, KDE Connect, UFW |
| **DevOps** | Docker, NVIDIA Container Toolkit, Git, Ansible |
| **Machine Learning** | CUDA 12.x, PyTorch, TensorFlow, Google Vertex AI |
| **Security** | Fail2Ban, SSH Key Auth, Unattended Upgrades |

---

## 🎯 Project Outcomes

- **Global Accessibility:** Access full GPU compute power from any location via encrypted mesh network
- **Cost-Efficiency:** Leverages existing gaming PC hardware to avoid expensive cloud GPU instances
- **Seamless Workflow:** KDE Connect + SSH enables laptop-to-desktop workflow as smooth as local development
- **Enterprise Security:** Production-grade security practices for remote access and network hardening
- **Portability:** Full desktop power available on a lightweight laptop anywhere with internet

---

## 📁 Repository Structure

```
ubuntu-remote-ml-workstation/
├── docs/                    # Setup guides and architecture docs
│   ├── SETUP.md             # Initial installation guide
│   ├── NETWORKING.md        # Meshnet and SSH configuration
│   └── SECURITY.md          # Hardening checklist
├── scripts/                 # Automation scripts
│   ├── desktop_setup.sh     # Desktop bootstrap script
│   ├── laptop_setup.sh      # Laptop bootstrap script
│   └── verify_setup.sh      # Installation verification
└── README.md
```

---

## 📄 License

MIT License

---

*Designed and implemented by **Sam Hillier** — Pursuing B.S. in Artificial Intelligence (Fall 2026) | UNC Charlotte | Minor: Cognitive Science*
