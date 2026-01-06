# Setup Tracker

Tracking the progress of configuring the ml-workstation.

## Completed

- [x] **Base OS**: Ubuntu 24.04 LTS fresh install.
- [x] **Agentic Tools**: Antigravity with GitHub and Perplexity MCP servers configured.
- [x] **Firewall**: UFW configured for strict LAN-only access (192.168.1.0/24).
- [x] **SSH Access**: Enabled via LAN.
- [x] **KDE Connect**: Paired and working for clipboard (LAN).

## In Progress

- [ ] **Oracle Cloud VM**: Waiting for ARM capacity. Retry script running. See [`docs/ORACLE-CLOUD-VM.md`](docs/ORACLE-CLOUD-VM.md).
- [ ] **File Sharing**: Troubleshooting KDE Connect file transfer issues.
- [ ] **Remote Access Strategy**: Prioritizing direct LAN/VPN-off workflow for now.

## Pending

- [ ] **GCP Vertex AI**: Authenticating SDK and testing job submission.
- [ ] **Containers**: Docker Engine and NVIDIA Container Toolkit.
- [ ] **GPU**: Proprietary NVIDIA drivers and CUDA toolkit installation.

## Future Goals & Roadmap

- [ ] **Laptop Dual Boot**: Planned future upgrade for HP Envy x360. See `docs/FUTURE-ROADMAP.md`.
- [ ] **Environment Sync**: "Dotfiles" implementation. See `docs/FUTURE-ROADMAP.md`.
