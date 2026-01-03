# My Home ML Workstation

This repo documents my personal Ubuntu machine—a 2023 gaming PC I'm repurposing as a secure compute node for machine learning projects. It's part of a bigger setup where I'm learning to work across multiple cloud providers while keeping my heavy compute and sensitive data at home.

## Why This Setup?

I'm building hands-on experience with real-world infrastructure by splitting my workflow across three environments:

### 1. Oracle Cloud (Development Environment)

**What it does:** This is where I actually write code and run my IDE.

**Why Oracle?** I have $300 in free credits (good until **January 28, 2026**), and even after those expire, Oracle Cloud offers one of the most generous always-free tiers in the industry. I can keep running a capable development VM indefinitely without paying a dime.

**How I use it:** SSH in from my laptop, run VS Code Server, and do all my day-to-day development work here.

### 2. This Ubuntu Machine (Heavy Compute & Storage)

**What it does:** Runs the heavy stuff—model training, local inference, and stores my datasets.

**Why keep it local?**

- I already own the hardware (RTX 3060 GPU)
- No cloud costs for storage or GPU time
- Complete control over my data
- Stays on my home network, so it's naturally isolated from the internet

**How I use it:** Mostly headless (no monitor). I connect to it from my laptop when I need to run something locally or grab files.

### 3. GCP Vertex AI (Production ML)

**What it does:** When I need serious scale or managed ML services, I use Google Cloud's AI platform.

**Why GCP?** I have $1,000 in Vertex AI credits to experiment with managed ML services and production-scale infrastructure.

## The Hardware

This is a gaming PC I bought in 2023. Here's what's inside:

| Part          | Spec                        |
| ------------- | --------------------------- |
| **Case**      | CyberPower Prebuilt         |
| **Processor** | Intel i7-12700F (12 cores)  |
| **Graphics**  | NVIDIA RTX 3060 (12GB VRAM) |
| **Memory**    | 16GB RAM                    |
| **Storage**   | 1TB NVMe SSD                |
| **OS**        | Ubuntu 24.04 LTS            |

**My Laptop:** HP Envy with an i7-1355U (this is what I carry around and use to connect to everything else)

## How It All Works Together

Think of it like this:

- **My laptop** is the remote control
- **Oracle Cloud VM** is my desk where I work
- **This Ubuntu machine** is my workshop with the power tools
- **GCP** is like renting a factory when I need to scale up

I can be at a coffee shop, SSH into my Oracle VM to write code, then kick off a training job on this machine at home—all without exposing my home network to the internet.

## Tech Stack

![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04_LTS-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![NVIDIA](https://img.shields.io/badge/NVIDIA-CUDA-76B900?style=for-the-badge&logo=nvidia&logoColor=white)
![Oracle](https://img.shields.io/badge/Oracle-Cloud-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![GCP](https://img.shields.io/badge/GCP-Vertex_AI-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED?style=for-the-badge&logo=docker&logoColor=white)

## Current Status

🚧 **Work in Progress** — Currently setting up the networking and security to make everything work together smoothly.

**What's Done:**

- [x] Installed Ubuntu 24.04
- [x] Set up MCP server for AI assistant integration

**What's Next:**

- [ ] Lock down the firewall (only allow local network access)
- [ ] Install NVIDIA drivers and CUDA toolkit
- [ ] Set up Docker for containerized workflows
- [ ] Connect to GCP Vertex AI
