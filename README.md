# Ubuntu Dual-Machine ML Workstation

This repo documents my personal Ubuntu setup across two machines—a 2023 gaming PC (desktop) and an HP Envy laptop. Both run Ubuntu 24.04 LTS and sync seamlessly for development and ML work. I'm building hands-on experience with real-world infrastructure while maintaining flexibility between portable and high-performance computing.

## Why This Setup?

I'm building a practical, cost-effective development environment that leverages both local hardware and cloud resources:

### Primary Machines (Both Ubuntu 24.04.03 LTS)

#### 1. Desktop (Heavy Compute & Storage)

**What it does:** GPU-accelerated model training, local inference, dataset storage, and intensive development work.

**Why keep it local?**

- I already own the hardware (RTX 3060 GPU)
- No cloud costs for storage or GPU time
- Complete control over my data
- Stays on my home network, naturally isolated from the internet

**How I use it:** Primarily headless (no monitor). SSH access from laptop when at home, or remote access when away.

#### 2. Laptop (Portable Development)

**What it does:** Portable development, lighter workloads, and as the control station for my desktop.

**Why Ubuntu on laptop?**

- Consistent development environment across both machines
- Native Linux tooling and workflows
- Seamless syncing with desktop
- Dual-boot with Windows for school-specific needs only

**How I use it:** Daily driver for coding, writing, and lighter ML experiments. Windows partition reserved exclusively for school requirements.

### Cloud Resources

#### Oracle Cloud (Optional Development Environment)

**What it does:** Remote development environment accessible from anywhere.

**Why Oracle?** I have $300 in free credits (good until **January 28, 2026**), and Oracle Cloud offers generous always-free tiers.

**Status:** Currently deprioritized in favor of local dual-machine setup.

#### GCP Vertex AI (Production ML)

**What it does:** Managed ML services when I need serious scale.

**Why GCP?** I have $1,000 in Vertex AI credits to experiment with production-scale infrastructure.

## The Hardware

### Desktop (Primary Workstation)

| Part          | Spec                        |
| ------------- | --------------------------- |
| **Case**      | CyberPower Prebuilt         |
| **Processor** | Intel i7-12700F (12 cores)  |
| **Graphics**  | NVIDIA RTX 3060 (12GB VRAM) |
| **Memory**    | 16GB RAM                    |
| **Storage**   | 1TB NVMe SSD                |
| **OS**        | Ubuntu 24.04.03 LTS         |

### Laptop (Portable Machine)

| Part          | Spec                                         |
| ------------- | -------------------------------------------- |
| **Model**     | HP Envy                                      |
| **Processor** | Intel i7-1355U                               |
| **Memory**    | 16GB RAM (estimated)                         |
| **Storage**   | 512GB NVMe SSD (estimated)                   |
| **OS**        | Ubuntu 24.04.03 LTS + Windows 11 (Dual-boot) |

**Note:** Windows partition is used exclusively for school requirements.

## How It All Works Together

Think of it like this:

- **Laptop** is my daily driver and mobile workstation
- **Desktop** is my high-performance workshop with GPU acceleration
- **Syncing** keeps my development environment consistent across both
- **Oracle Cloud VM** (optional) extends my workspace to the cloud
- **GCP** is like renting a factory when I need massive scale

I can work on my laptop at a coffee shop, sync my changes, then SSH into my desktop at home to kick off GPU-intensive training jobs—all while maintaining a consistent Ubuntu environment.

## Tech Stack

![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04.03_LTS-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![NVIDIA](https://img.shields.io/badge/NVIDIA-CUDA-76B900?style=for-the-badge&logo=nvidia&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Oracle](https://img.shields.io/badge/Oracle-Cloud-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![GCP](https://img.shields.io/badge/GCP-Vertex_AI-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)

## Current Status

🚧 **Work in Progress** — Setting up dual-Ubuntu environment.

**Currently:** Creating bootable USB to reinstall Desktop with Ubuntu 24.04.03 LTS.

**Laptop Status:**

- [x] Running Ubuntu 24.04.03 LTS
- [x] Antigravity & MCP servers configured
- [x] Created Ubuntu bootable USB
- [x] Created post-install automation scripts

**Desktop Status:**

- [ ] Fresh Ubuntu 24.04.03 LTS installation (in progress)
- [ ] Post-install automation (NVIDIA, Docker, SSH)
- [ ] Environment sync with Laptop
- [ ] Optional Windows dual-boot for future needs

**What's Next:**

1. Install Ubuntu on Desktop using created USB
2. Run `scripts/post-install.sh` to configure Desktop
3. Set up syncing between Laptop and Desktop (dotfiles, projects)
4. Configure SSH/Tailscale for remote access
5. (Optional) Install Windows dual-boot on Desktop for school
6. (Optional) Set up Oracle Cloud VM if needed

## Documentation

- [`docs/DESKTOP-REINSTALL.md`](docs/DESKTOP-REINSTALL.md) - Step-by-step Desktop installation guide
- [`scripts/post-install.sh`](scripts/post-install.sh) - Automated post-installation setup
