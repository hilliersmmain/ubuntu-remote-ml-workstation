# Ubuntu Remote ML Workstation

[![Status](https://img.shields.io/badge/Status-v1.0%20Production-success?style=for-the-badge)](.)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04%20LTS-E95420?style=for-the-badge&logo=ubuntu)](https://ubuntu.com)
[![NVIDIA](https://img.shields.io/badge/GPU-RTX%203060%2012GB-76B900?style=for-the-badge&logo=nvidia)](https://nvidia.com)
[![NordVPN](https://img.shields.io/badge/VPN-Meshnet%20%2B%20Dedicated%20IP-4687FF?style=for-the-badge&logo=nordvpn)](https://nordvpn.com)
[![GCP](https://img.shields.io/badge/Cloud-Vertex%20AI-4285F4?style=for-the-badge&logo=googlecloud)](https://cloud.google.com/vertex-ai)

**Ubuntu Remote ML Workstation** is a production-ready hybrid machine learning infrastructure that enables seamless, secure development across a high-performance GPU desktop and a lightweight laptop—accessible from anywhere in the world via encrypted mesh networking.

### ♻️ The Story Behind the Build
This project started with a decision to stop letting good hardware go to waste. **This desktop used to be my dedicated gaming PC.** But as my focus shifted from gaming to Artificial Intelligence, I didn't want to just toss it or let it gather dust.

Instead, I **wiped the Windows partition entirely**, re-architected the machine from the ground up, and configured it as a dedicated, headless Linux ML server. Now, it serves as my personal compute cluster, allowing me to train models on an RTX 3060 without burning up my laptop, all while sitting in a coffee shop miles away.

---

## 🏗️ System Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    ENCRYPTED MESH NETWORK (NordVPN)                          │
│                     Dedicated IP + Peer-to-Peer Encryption                   │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│   ┌──────────────────┐         SSH / KDE Connect        ┌────────────────┐  │
│   │   🖥️ DESKTOP     │◄───────────────────────────────►│   💻 LAPTOP    │  │
│   │   (GPU Hub)       │                                  │   (Client)     │  │
│   │                   │                                  │                │  │
│   │  RTX 3060 12GB   │                                  │  HP Envy i7    │  │
│   │  i7-12700F       │                                  │  Thin Client   │  │
│   │  Ubuntu 24.04    │                                  │  Ubuntu 24.04  │  │
│   └────────┬─────────┘                                  └────────────────┘  │
│            │                                                                 │
│            │ Vertex AI API (Large Models)                                    │
│            ▼                                                                 │
│   ┌──────────────────┐                                                       │
│   │  ☁️ Google Cloud  │                                                       │
│   │   Vertex AI       │                                                       │
│   │  (Overflow GPU)   │                                                       │
│   └──────────────────┘                                                       │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 💪 Hardware Specifications

### Desktop — Primary Compute Hub (Repurposed Gaming Rig)
| Component | Specification | Purpose |
|-----------|---------------|---------|
| **CPU** | Intel Core i7-12700F (12 cores, 20 threads) | Parallel processing, data preprocessing |
| **GPU** | NVIDIA GeForce RTX 3060 (12GB VRAM) | Deep learning training, CUDA acceleration |
| **RAM** | 16GB DDR4 | Large dataset handling |
| **Storage** | 1TB NVMe SSD | Fast model loading, dataset storage |
| **OS** | Ubuntu 24.04.03 LTS (Hardened) | Stability, security, ML library support |

### Laptop — Portable Development Client
| Component | Specification | Purpose |
|-----------|---------------|---------|
| **Model** | **HP Envy x360 2-in-1 Laptop** | Portability & Flexibility |
| **CPU** | Intel Core i7-1355U | Code editing, lightweight inference |
| **RAM** | 16GB | Local development |
| **OS** | Ubuntu 24.04.03 LTS + Windows 11 (Dual-boot) | Flexibility |

---

## 🔐 Secure Global Connectivity

The core innovation enabling location-independent GPU access:

### NordVPN Meshnet + Dedicated IP
| Feature | Implementation | Benefit |
|---------|----------------|---------|
| **Meshnet Enabled** | Direct P2P encrypted tunnel | No exposed public ports, NAT traversal |
| **Dedicated IP** | Static IP for desktop | Reliable SSH, consistent endpoint |
| **KDE Connect** | File sharing, clipboard sync, notifications | Seamless workflow integration |
| **SSH over Meshnet** | `ssh user@desktop.nord` | Secure shell from anywhere |

```bash
# Connect to GPU workstation from any location
ssh user@desktop.nord.meshnet

# KDE Connect auto-discovers over mesh — no config needed
kdeconnect-cli --pair
```

### Security Hardening Stack
| Layer | Implementation | Protection |
|-------|----------------|------------|
| **Firewall** | UFW (ports 22, 1714-1764, Meshnet only) | Attack surface minimization |
| **Intrusion Prevention** | Fail2Ban (5 attempts → 24hr ban) | Brute force protection |
| **Authentication** | SSH key-only (RSA 4096-bit) | Password attacks eliminated |
| **Patching** | Unattended upgrades (security-only) | Zero-day mitigation |

---

## ✅ Implementation Status
| Feature | Status | Details |
|---------|--------|---------|
| **NordVPN Meshnet + Dedicated IP** | ✅ Complete | Global SSH/KDE Connect access |
| **GPU Drivers & CUDA** | ✅ Complete | NVIDIA 535+, CUDA 12.x, cuDNN 8.9 |
| **PyTorch/TensorFlow** | ✅ Complete | GPU-accelerated with CUDA backend |
| **Docker + NVIDIA Toolkit** | ✅ Complete | Containerized ML workflows |
| **Security Hardening** | ✅ Complete | UFW, Fail2Ban, SSH keys, auto-updates |
| **Automated Provisioning** | ✅ Complete | Full machine setup in <15 minutes |
| **KDE Connect Integration** | ✅ Complete | Cross-device file/clipboard/notification sync |
| **GCP Vertex AI** | ✅ Configured | API-ready for workload overflow |

---

## 🛠️ Technology Stack
| Category | Technologies |
|----------|--------------|
| **Operating System** | Ubuntu 24.04 LTS, systemd, GNOME |
| **Networking** | NordVPN Meshnet, Dedicated IP, KDE Connect, UFW, Fail2Ban |
| **GPU Compute** | NVIDIA Driver 535+, CUDA 12.x, cuDNN, NVIDIA Container Toolkit |
| **ML Frameworks** | PyTorch 2.x, TensorFlow 2.x, Hugging Face Transformers |
| **DevOps** | Docker, Git, Bash scripting, SSH |
| **Cloud** | Google Cloud Platform, Vertex AI |

---

## 🎯 Project Outcomes & Impact
| Outcome | Metric |
|---------|--------|
| **Cost Savings** | ~$500/month vs. cloud GPU instances |
| **Accessibility** | 100% uptime access from any location |
| **Security** | Zero successful intrusions (Fail2Ban logs) |
| **Setup Time** | New machine → production in <15 minutes |
| **Latency** | <50ms SSH over Meshnet (same continent) |

---

## 📁 Repository Structure
```
ubuntu-remote-ml-workstation/
├── scripts/
│   ├── desktop_setup.sh       # Complete desktop provisioning
│   ├── laptop_setup.sh        # Client machine setup
│   └── verify_setup.sh        # Installation verification
├── docs/
│   ├── SETUP.md               # Step-by-step installation guide
│   ├── NETWORKING.md          # Meshnet and SSH configuration
│   └── SECURITY.md            # Hardening checklist
└── README.md
```

---

## 🎯 Skills & Competencies Demonstrated
**Infrastructure & DevOps**
- Linux system administration and hardening
- Network security design (VPN, firewall, intrusion detection)
- Automated provisioning and configuration management
- Docker containerization and GPU passthrough

**Machine Learning Engineering**
- GPU driver optimization and CUDA configuration
- Hybrid local/cloud ML architecture design
- Production deployment of ML infrastructure

**Problem Solving**
- Cost optimization through existing hardware utilization
- Secure remote access without exposing services publicly
- Cross-device workflow integration

---

## 👤 About the Developer
**Sam Hillier** — Undergraduate researcher with an interdisciplinary background bridging life sciences and artificial intelligence.

- 🎓 **Current:** B.S. Data Science, UNC Charlotte (Transitioning to B.S. Artificial Intelligence, Fall 2026)
- 🧠 **Minor:** Cognitive Science
- 🔬 **Background:** B.S. Biology (Cellular/Molecular concentration), Appalachian State University (2024-2025)
- 📚 **Spring 2026 Coursework:** Human-Centered Computing (ITIS 3130), Computer Science II (ITSC 1213), Mathematics for Computer Science (MATH 2112)

*Passionate about AI applications in neuroscience, human-computer interaction, and building the infrastructure that powers intelligent systems.*

---

## 📄 License
MIT License
