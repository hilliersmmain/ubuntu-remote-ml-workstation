# Ubuntu Remote ML Workstation

![Status](https://img.shields.io/badge/Status-v1.0%20Stable-success?style=for-the-badge) ![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04%20LTS-E95420?style=for-the-badge&logo=ubuntu) ![NVIDIA](https://img.shields.io/badge/GPU-RTX%203060-76B900?style=for-the-badge&logo=nvidia) ![GCP](https://img.shields.io/badge/Cloud-Google%20Vertex%20AI-4285F4?style=for-the-badge&logo=googlecloud)

**Ubuntu Remote ML Workstation** is a hybrid machine learning infrastructure project designed to bridge the gap between high-performance local compute and portable development. It establishes a seamless, secure, and scalable development environment across a dedicated GPU desktop and a lightweight mobile client.

## 🏗️ Architecture & Infrastructure

This project implements a professional "Hub-and-Spoke" development topology:

### 1. The Compute Hub (Desktop)
*   **OS:** Ubuntu 24.04.03 LTS (Hardened w/ UFW & Fail2Ban)
*   **Hardware:** Intel Core i7-12700F | 16GB DDR4 | **NVIDIA RTX 3060 (12GB VRAM)**
*   **Role:** Heavy lifting—Deep Learning training, CUDA workloads, Docker container orchestration.
*   **Access:** Headless remote access server via SSH & Remote Desktop (RDP/VNC).

### 2. The Portable Client (Laptop)
*   **OS:** Ubuntu 24.04.03 LTS
*   **Role:** Thin client for coding, lightweight inference, and connecting to the Hub.
*   **Integration:** Full syncing of dotfiles, VS Code extensions, and development environments via Ansible scripts.

### 3. Cloud Extension (Hybrid Cloud)
*   **Vertex AI Integration:** Seamless handoff of massive workloads to Google Cloud Platform when local VRAM is exceeded.
*   **Unified Environment:** Consistent tooling across Local, Remote, and Cloud contexts.

## 🚀 Key Implementations

*   **Secure Remote Access:** Configured SSH keys, disabled root login, and set up a custom firewall (UFW) to allow secure remote development from anywhere.
*   **GPU Passthrough & Drivers:** Optimized NVIDIA 535+ drivers for CUDA 12.x support, enabling PyTorch/TensorFlow acceleration.
*   **Automated Provisioning:** Development of bash scripts to "bootstrap" a new machine from zero to fully-configured ML workstation in <15 minutes.
*   **Containerized Workflows:** Docker & NVIDIA Container Toolkit setup for reproducible research environments.

## 🔧 Technical Stack

*   **Infrastructure:** Linux (Ubuntu), Bash Scripting, SSH
*   **DevOps:** Docker, Git, Ansible (planned)
*   **Machine Learning:** CUDA, PyTorch, TensorFlow, Google Cloud Vertex AI

## 🎯 Project Outcomes

*   **Cost-Efficiency:** Leverages sunk hardware costs (Gaming PC) to avoid expensive cloud GPU instances for small-to-medium models.
*   **Flexibility:** Provides the power of a desktop workstation with the portability of a laptop.
*   **Security:** Implements enterprise-grade security practices for remote access and network hardening.

---
*Designed and implemented by **Sam Hillier** as a scalable infrastructure for Data Science research.*
