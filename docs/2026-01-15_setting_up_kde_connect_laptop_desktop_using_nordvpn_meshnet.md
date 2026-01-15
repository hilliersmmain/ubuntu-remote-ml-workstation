# KDE Connect Setup over NordVPN Meshnet (2026-01-15)

## Objective

Establish a secure, reliable connection between an Ubuntu Desktop (X11) and an Ubuntu Laptop (X11) for file sharing and integration, bypassing the client isolation on the "Rush Student Living" WiFi.

## Technical Accomplishments

### 1. Network Connectivity (NordVPN Meshnet)

- **Problem:** Student housing WiFi blocks direct device-to-device communication.
- **Solution:** Enabled **NordVPN Meshnet** on all devices.
- **Configuration:**
  - Desktop IP: `100.114.114.176`
  - Laptop IP: `100.96.16.203`
  - Used these internal Meshnet IPs to manually link devices, bypassing discovery failures.

### 2. Security & Firewall Hardening

- **NordVPN Firewall:** Disabled internal NordVPN firewall (`nordvpn set firewall off`) to allow P2P traffic within the Meshnet tunnel.
- **System Firewall (UFW):**
  - Removed "Allow Anywhere" rules for KDE Connect ports (1714:1764).
  - Restricted access strictly to the VPN interface:
    ```bash
    sudo ufw allow in on nordlynx to any port 1714:1764 proto udp
    sudo ufw allow in on nordlynx to any port 1714:1764 proto tcp
    ```
  - Result: The system is invisible to other users on the apartment WiFi while remaining fully accessible through the encrypted VPN.

### 3. Desktop/Laptop Integration

- **Manual Pairing:** Modified `~/.config/kdeconnect/config` on the Laptop to include the Desktop's Meshnet IP.
- **Stability Fix:** Disabled the **Clipboard Sync** plugin on the Desktop to resolve a crash loop that persisted even after switching both devices to X11.
- **Status:** File sharing, media control, and notifications are fully functional between Desktop and Laptop.

### 4. iOS / iPad Observations

- **Limitations:** Verified that iOS background restrictions prevent automatic clipboard sync.
- **Manual Push:** Clipboard sync from iOS to Linux is possible but requires a manual "Push Clipboard" action within the KDE Connect app.
- **Recommendation:** Use **Termius** (GitHub Student Pack) for remote SSH access and NordVPN's native **File Share** for mobile-to-desktop transfers.

## Maintenance Commands

- **Restart KDE Connect Service:**
  ```bash
  killall kdeconnectd; kdeconnectd &
  ```
- **Check Connections:**
  ```bash
  kdeconnect-cli -l
  ```
- **Verify Firewall:**
  ```bash
  sudo ufw status
  ```
