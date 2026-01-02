# ubuntu-remote-ml-workstation

Documentation for my specific Ubuntu ML workstation setup, featuring an RTX 3060 for local compute and integration with GCP Vertex AI for scalable workloads. Designed for dual-mode operation: direct GUI usage at the desk and SSH remote access from a laptop.

## Hardware Specs

| Component | Specification |
| :--- | :--- |
| **Model** | 2023 CyberPower Prebuilt |
| **CPU** | Intel Core i7-12700F |
| **GPU** | NVIDIA RTX 3060 (12GB) |
| **RAM** | 16GB |
| **Storage** | 1TB NVMe SSD |
| **OS** | Ubuntu 24.04 LTS |

**Laptop Client:** HP Envy (i7-1355U, Intel Iris Xe, Windows 11)

## Architecture

This workstation operates in two primary modes:

1.  **GUI Mode:** Standard desktop usage for interactive development, visualization, and general productivity.
2.  **Headless/SSH Mode:** Remote access from the Windows 11 laptop for submitting training jobs, monitoring processes, and managing files without being physically at the desk.

## Tech Stack

![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04_LTS-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![NVIDIA](https://img.shields.io/badge/NVIDIA-CUDA-76B900?style=for-the-badge&logo=nvidia&logoColor=white)
![Python](https://img.shields.io/badge/Python-3.12-3776AB?style=for-the-badge&logo=python&logoColor=white)
![GCP](https://img.shields.io/badge/GCP-Vertex_AI-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED?style=for-the-badge&logo=docker&logoColor=white)

## Project Status

- **Status:** 🚧 In Progress
- **Current Focus:** Infrastructure setup and security hardening.

## Setup Roadmap

- [x] OS Installation (Ubuntu 24.04)
- [x] MCP Server Configuration
- [ ] Network Security (UFW & SSH Hardening)
- [ ] NVIDIA Drivers & CUDA Install
- [ ] Docker & Container Runtime
- [ ] GCP Vertex AI SDK Integration
