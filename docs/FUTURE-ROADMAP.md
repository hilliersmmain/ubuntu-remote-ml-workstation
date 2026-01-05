# Future Roadmap

This document outlines technical strategies and plans for future enhancements to the ML Workstation ecosystem, specifically focusing on the laptop (`HP Envy x360`) setup.

## 1. Laptop Dual-Boot Strategy (Deferred)

**Goal:** Configure the HP Envy x360 as a dual-boot machine (Windows 11 / Ubuntu 24.04 LTS) for a consistent Linux development environment.

### Recommended Specs

- **OS:** Ubuntu 24.04 LTS (Matches Desktop)
- **Partitioning Strategy:**
  - **Ubuntu:** ~60% (600GB) - Primary dev environment.
  - **Windows 11:** ~35% (350GB) - For lockdown browsers, firmware updates, occasional Windows-only tools.
  - **Shared Data:** ~5% (50GB) - NTFS partition for quick file sharing between OSs.

### Optimization Note

The i7-1355U + 16GB RAM is well-suited for a daily driver dev machine. Expect ~8-9% more available RAM on Linux compared to Windows, with faster file system operations for dev tools (git, npm).

---

## 2. Configuration Sync Strategy (Dotfiles)

**Goal:** Automate the synchronization of development environments between the Desktop (Primary) and Laptop (Secondary).

### Approach: "Dotfiles + Setup Script"

Instead of syncing the entire OS, sync the _configuration_ to a GitHub repository.

#### Step 1: Capture State (Run on Desktop)

Create a backup of crucial configs:

```bash
# 1. Package list
dpkg --get-selections > package-list.txt

# 2. VS Code Extensions
code --list-extensions > vscode-extensions.txt

# 3. Config Files (Bash, specialized tool configs)
# Copy ~/.bashrc, ~/.profile, ~/.config/ to a repo folder
```

#### Step 2: Restore State (Run on Laptop)

Execute a script to replicate the environment:

```bash
# 1. Install packages
sudo apt install $(cat package-list.txt)

# 2. Restore configs
cp -r dotfiles-config/ ~/

# 3. Install Extensions
cat vscode-extensions.txt | xargs -n 1 code --install-extension
```

### Exclusions (Don't Sync)

- **Antigravity:** Settings sync via cloud account automatically.
- **Browsers:** Use built-in browser sync (Chrome/Brave Sync).
- **Secrets:** Never commit API keys or SSH private keys to the repo. Use a password manager or secure transfer (like Meshnet/KDE Connect) for those.
