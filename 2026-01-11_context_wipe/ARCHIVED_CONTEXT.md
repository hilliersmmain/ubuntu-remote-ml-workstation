# Archived Project Context (2026-01-11)

**Reason for Archive:** User elected to wipe conversation history and "start fresh" to solidify the project's new trajectory. This document preserves the critical mental state and technical decisions made up to this point.

---

## 1. Project Trajectory Change

- **Original Goal:** Hybrid setup with Oracle Cloud VM (Dev) + Local Desktop (Compute).
- **Pivot:** Desktop-centric Heavy Compute.
- **Final Architecture (Current):** **Dual-Machine Ubuntu Setup**.
  - **Laptop (HP Envy):** Portable daily driver, running Ubuntu 24.04.03 LTS. Dual-boot with Windows (School only).
  - **Desktop (CyberPower):** Headless high-performance ML node, running Ubuntu 24.04.03 LTS.
  - **Sync:** Workflow relies on seamless syncing between these two Ubuntu environments.
  - **Cloud:** Oracle/GCP deprioritized to "as-needed" resources.

## 2. Current Status Snapshot

### Laptop (Host/Controller)

- **OS:** Ubuntu 24.04.03 LTS (Dual-boot with Windows 11).
- **Role:** Control station, media creator, light dev.
- **State:**
  - Antigravity & MCP servers configured.
  - Successfully created bootable Ubuntu USB for Desktop.
  - Created automation scripts (`post-install.sh`).

### Desktop (Target/Compute Node)

- **Hardware:** i7-12700F, RTX 3060 (12GB), 16GB RAM, 1TB NVMe.
- **OS:** In-progress reinstall to Ubuntu 24.04.03 LTS.
- **Role:** Headless compute, model training, Docker host.
- **State:**
  - Waiting for fresh install from USB.
  - Needs `post-install.sh` execution.
  - Needs UFW/SSH final config.

## 3. Key Technical Configurations

### Network & Security

- **Firewall (UFW):** Strict LAN-only policy.
  - `default deny incoming`, `default allow outgoing`
  - Allow SSH (22/tcp) from `192.168.1.0/24`
  - Allow KDE Connect (1714-1764) from `192.168.1.0/24`
- **SSH:** Key-based auth preferred. Password auth disabled eventually.
- **Terminal Security:** strict deny list active (no `rm -rf /`, etc).

### Automation (`scripts/post-install.sh`)

Script created to automate:

1. System Updates (`apt update && upgrade`)
2. Essentials (`build-essential`, `curl`, `git`, `vim`, `htop`)
3. **NVIDIA Stack:** Drivers (535+), CUDA Toolkit, NVIDIA Container Toolkit.
4. **Docker:** Engine, CLI, User group setup.
5. **UFW Rules:** Applied automatically.

## 4. Operational Knowledge

- **USB Creation:** Used `dd` with `umount -l` (lazy unmount) to bypass "target is busy" errors on the laptop.
- **Documentation:** Split into clear "Host (Laptop)" vs "Target (Desktop)" steps in `docs/DESKTOP-REINSTALL.md`.
- **Windows Strategy:** Windows is _only_ for school apps that don't run on Linux. It is isolated to a dual-boot partition.

## 5. Next Steps (To Resume After Wipe)

1. **Finish Desktop Install:** Boot desktop from USB, install Ubuntu.
2. **Run Post-Install:** Execute the script on the Desktop.
3. **Sync Strategy:** Decide on and implement file syncing (Syncthing? Git? Rsync?) between Laptop and Desktop.
4. **Dotfiles:** Unify zsh/vim/vscode configs across both machines.
