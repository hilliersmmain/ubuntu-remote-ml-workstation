# Hybrid Workflow: Desktop + Laptop

**Strategy**: "Laptop for Driver, Desktop for Compute."

This document outlines the workflow for using your powerful Ubuntu Desktop and Windows Laptop together effectively, synced via GitHub.

## Architecture

| Device      | Role             | OS                    | Key Tools                                |
| :---------- | :--------------- | :-------------------- | :--------------------------------------- |
| **Desktop** | **Compute Node** | Ubuntu 24.04          | Docker, NVIDIA Drivers, Antigravity Host |
| **Laptop**  | **Daily Driver** | Windows 11 + **WSL2** | VS Code, Browser, Antigravity Client     |
| **GitHub**  | **Sync Hub**     | -                     | Source of Truth for all code             |

## Connectivity (The "College Network" Plan)

Since you are moving to student housing (Rush Student Living), direct LAN access might be tricky if devices are on different subnets or if Client Isolation is on.

**Recommendation: Tailscale**

- **Why**: Create a private mesh network. Connect to your desktop from your laptop (or coffee shop) as if it were local, bypassing complex firewall/port-forwarding rules.
- **Setup**:
  1.  Install Tailscale on Desktop (`curl -fsSL https://tailscale.com/install.sh | sh`).
  2.  Install Tailscale on Laptop (Windows Store).
  3.  Login to both. You can now SSH to `hilliersm@desktop-name` from anywhere.

## Laptop Setup (Windows 11)

Instead of Dual Booting, we use **WSL2** (Windows Subsystem for Linux). This gives you a real Ubuntu terminal inside Windows.

1.  **Install WSL2**:
    ```powershell
    wsl --install
    ```
    (Restart required).
2.  **Terminal**: Install "Windows Terminal" from the Microsoft Store.
3.  **VS Code**: Install "WSL" extension in VS Code. This allows you to open folders _inside_ Ubuntu from VS Code on Windows.

## Desktop Setup (Upon Arrival)

1.  **Physical**: Connect Ethernet.
2.  **Network**:
    - Check IP: `ip a`
    - Verify Internet: `ping google.com`
3.  **Remote Access**:
    - Install/Start Tailscale.
    - (Optional) If Ethernet and Laptop are on same switch/router, LAN SSH `ssh hilliersm@<local-ip>` works too.

## Sync Strategy

**Rule**: **Never work on "files" alone. Always work in a Git Repo.**

1.  **Laptop**: `git pull` -> Code -> `git push`
2.  **Desktop**: `git pull` -> Train Model/Run Job -> `git push` results

## Deprecated paths

- **Oracle Cloud VM**: Deprioritized due to low performance vs Desktop.
- **Dual Boot**: Unnecessary complexity. WSL2 covers the "Linux on Laptop" need.
