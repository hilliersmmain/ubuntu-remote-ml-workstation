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
3. **Allow SSH:** `sudo ufw allow ssh` (Limit to specific IPs later for hardening)
4. **Allow Jupyter/VS Code Tunnels:**
   - Jupyter usually runs on 8888. Tunneling over SSH is preferred over opening ports directly.
   - If direct access needed: `sudo ufw allow from 192.168.1.0/24 to any port 8888`

## Status Check
Checking status: `sudo ufw status verbose`
