# UFW Firewall Configuration

## Strategy

Default deny incoming, allow outgoing. Whitelist specific ports for SSH and development tools only from local network subnets where possible.

## Rules

1. **Enable UFW:** `sudo ufw enable`
2. **Default Policies:**
   ```bash
   sudo ufw default deny incoming
   sudo ufw default allow outgoing
   ```
3. **LAN Access Only (Strict):**
   - **KDE Connect**: `sudo ufw allow from 192.168.1.0/24 to any port 1714:1764 proto udp` and `tcp`
   - **SSH/RDP**: `sudo ufw allow from 192.168.1.0/24 to any port 22` (and 3389 if needed)
   - _Note: "Allow from Anywhere" rules have been removed._

## Status Check

Checking status: `sudo ufw status verbose`
