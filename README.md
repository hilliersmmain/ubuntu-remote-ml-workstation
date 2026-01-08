# Ubuntu Remote ML Workstation

A professionally configured hybrid cloud infrastructure for machine learning development, demonstrating practical DevOps skills, cloud architecture, and security best practices.

## Project Overview

This repository documents the setup and configuration of a hybrid ML development environment that combines:
- **Local compute resources** (Ubuntu workstation with NVIDIA GPU)
- **Cloud development environments** (Oracle Cloud VM)
- **Production ML platform** (GCP Vertex AI)

This architecture demonstrates real-world experience with multi-cloud environments, network security, and infrastructure optimization—skills directly applicable to modern ML engineering roles.

## Architecture

This setup demonstrates a cost-effective hybrid cloud strategy commonly used in production environments:

### 1. Development Environment (Oracle Cloud)

**Purpose:** Remote development workspace accessible from anywhere

**Key Features:**
- VS Code Server for remote development
- Always-on availability
- Leverages Oracle Cloud's free tier for cost optimization
- SSH-based secure access

### 2. Local Compute Node (Ubuntu Workstation)

**Purpose:** GPU-accelerated ML training and inference

**Key Features:**
- NVIDIA RTX 3060 (12GB VRAM) for model training
- Network-isolated security configuration (UFW firewall)
- Headless operation with remote management
- Local data storage and processing

**Security:** Implements defense-in-depth with LAN-only access and strict firewall rules.

### 3. Production ML Platform (GCP Vertex AI)

**Purpose:** Scalable production ML pipelines and managed services

**Key Features:**
- Integration with managed ML services
- Scalable training infrastructure
- Production-ready deployment capabilities

## Hardware Specifications

| Component     | Specification               |
| ------------- | --------------------------- |
| **Case**      | CyberPower Prebuilt         |
| **Processor** | Intel i7-12700F (12 cores)  |
| **Graphics**  | NVIDIA RTX 3060 (12GB VRAM) |
| **Memory**    | 16GB RAM                    |
| **Storage**   | 1TB NVMe SSD                |
| **OS**        | Ubuntu 24.04 LTS            |

## Technology Stack

![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04_LTS-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![NVIDIA](https://img.shields.io/badge/NVIDIA-CUDA-76B900?style=for-the-badge&logo=nvidia&logoColor=white)
![Oracle](https://img.shields.io/badge/Oracle-Cloud-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![GCP](https://img.shields.io/badge/GCP-Vertex_AI-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED?style=for-the-badge&logo=docker&logoColor=white)

## Key Skills Demonstrated

- **Cloud Infrastructure:** Multi-cloud setup (Oracle Cloud, GCP) with cost optimization strategies
- **Network Security:** Firewall configuration (UFW), SSH hardening, VPN integration
- **DevOps:** Infrastructure as code, automated provisioning, remote development workflows
- **Containerization:** Docker setup for reproducible ML environments
- **Linux Administration:** Headless server management, system hardening
- **ML Operations:** GPU configuration, CUDA toolkit setup, model training infrastructure

## Documentation

Detailed documentation is organized in the [`docs/`](docs/) directory:

- [**Architecture Overview**](docs/ARCHITECTURE.md) - System design and component interactions
- [**Hybrid Workflow**](docs/HYBRID_WORKFLOW.md) - Development workflow across devices
- [**GPU Setup**](docs/GPU-SETUP.md) - NVIDIA drivers and CUDA configuration
- [**GCP Vertex AI**](docs/GCP-VERTEX-AI.md) - Cloud ML platform integration
- [**UFW Firewall**](docs/UFW-FIREWALL.md) - Security configuration
- [**Remote SSH**](docs/REMOTE-SSH.md) - Secure remote access setup
- [**Recommended Tools**](docs/RECOMMENDED-TOOLS.md) - Development tools and extensions

## Implementation Status

### Completed
- ✅ Ubuntu 24.04 LTS installation and configuration
- ✅ Network security (UFW firewall, LAN-only access)
- ✅ SSH access configuration
- ✅ Oracle Cloud CLI and API authentication
- ✅ Automated VM provisioning scripts
- ✅ MCP server integration for AI-assisted development

### In Progress
- 🔄 Oracle Cloud VM capacity allocation
- 🔄 Desktop relocation and network setup

### Planned
- 📋 NVIDIA driver and CUDA toolkit installation
- 📋 Docker and NVIDIA Container Toolkit setup
- 📋 GCP Vertex AI integration
- 📋 Tailscale VPN configuration

## Learning Outcomes

This project provides hands-on experience with:
- Designing and implementing hybrid cloud architectures
- Securing infrastructure with defense-in-depth strategies
- Managing remote development workflows
- Optimizing costs through strategic cloud provider selection
- Integrating multiple cloud platforms (multi-cloud strategy)

---

For setup instructions and detailed configuration guides, see the [documentation](docs/) directory.
