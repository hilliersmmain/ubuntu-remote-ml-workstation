# Remote Access (SSH) Setup

## Objectives
- Enable secure remote access from Windows 11 laptop.
- Disable password authentication (Key-based only).
- Configure convenient aliases.

## Server Setup (Ubuntu)
1. Install OpenSSH server: `sudo apt install openssh-server`
2. Configure `/etc/ssh/sshd_config`:
   ```ssh
   PasswordAuthentication no
   PermitRootLogin no
   PubkeyAuthentication yes
   ```
3. Restart service: `sudo systemctl restart ssh`

## Client Setup (Windows)
1. Generate Keypair (if needed): `ssh-keygen -t ed25519`
2. Install Public Key:
   ```powershell
   type $env:USERPROFILE\.ssh\id_ed25519.pub | ssh user@workstation_ip "cat >> .ssh/authorized_keys"
   ```
3. SSH Config (`~/.ssh/config`):
   ```ssh
   Host ml-workstation
       HostName <STATIC_IP_OR_HOSTNAME>
       User hilliersm
       IdentityFile ~/.ssh/id_ed25519
   ```

## Workflow
Connect via Terminal: `ssh ml-workstation`
Connect via VS Code: Use "Remote - SSH" extension and select `ml-workstation`.
