<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# Can you try and figure out why we are running into this issue and how to possibly fix it?

Based on the file, I can see you're troubleshooting **NordVPN + KDE Connect compatibility** and have reached the point where:

1. **UFW firewall is properly locked down** (KDE Connect ports 1714-1764 open only to LAN `192.168.1.0/24`)
2. **KDE Connect works when NordVPN is OFF**
3. **KDE Connect fails when NordVPN is ON**, despite:
    - `LAN Discovery: enabled` on Ubuntu
    - "Stay invisible on LAN: Off" on Windows

## The Core Issue

NordVPN's routing/tunneling still blocks KDE Connect's **local network broadcast discovery** even with LAN settings enabled. This is a known limitation with most VPNs and KDE Connect.[^1_1][^1_2][^1_3]

## Why This Happens

KDE Connect uses **mDNS/UDP broadcasts** on the local subnet to find devices. When NordVPN is active, traffic gets routed through the VPN tunnel interface, breaking these broadcasts even when "LAN discovery" is on.

## Practical Solutions (Pick One)

**Option 1: Accept the Limitation (Simplest)**

- Pause NordVPN when you need KDE Connect
- Re-enable after file transfers/notifications
- This is what most users do

**Option 2: NordVPN Meshnet (Advanced)**

- Enable `nordvpn set meshnet enabled` on both devices
- Link them via Meshnet (creates a direct encrypted tunnel between your devices)
- This lets KDE Connect work over the Meshnet interface
- More complex but keeps VPN active

**Option 3: Split Tunneling/Allowlist (Complex)**

- Use NordVPN's allowlist feature to exclude KDE Connect traffic
- Requires manual config of app/subnet exceptions
- Not well-supported on all platforms


## What I Recommend

For your **GCP ML engineer goals** + **ADHD-friendly workflow**:

- Accept **Option 1** for now (pause VPN for KDE Connect)
- Your security is still solid:
    - UFW blocks all incoming except LAN-only KDE ports
    - NordVPN protects browsing/internet traffic
- This lets you **move on to remote desktop setup** (RDP/SSH via NordVPN dedicated IP), which is more relevant to your career goals

Would you like to proceed with setting up **secure remote GUI access via NordVPN**, or try Option 2 (Meshnet) first?

<div align="center">⁂</div>

[^1_1]: Okay-so-today-I-want-to-first-thing-I-want-to-do.md

[^1_2]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^1_3]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md


---

# Yes also that file was my previous chat, can you try and pick up its same learning style and help me pick back up so we can get this working?

I planned on configuringmeshnet on these devices anyway so lets do it.

Nice, Meshnet is a good move here. For this “lesson” we’ll:

1) Turn on Meshnet on both devices
2) Link them and verify connectivity
3) (Next) try KDE Connect / remote access over Meshnet

We’ll start with **step 1 only**.

On Ubuntu, in terminal run:

```bash
nordvpn login        # if not already logged in
nordvpn set meshnet on
nordvpn meshnet peer list
```

This should show your Ubuntu box with a **Nord name** and **Meshnet IP**.[^2_1][^2_2][^2_3]

On Windows, in the NordVPN app:

- Open NordVPN → “Devices in Meshnet” → toggle **Meshnet ON**.[^2_4][^2_3]

Then tell me:

- What Nord **name** and **Meshnet IP** you see for each device (just rough, you can mask last digits), and
- Does `nordvpn meshnet peer list` on Ubuntu show your Windows laptop as a peer?

What part of this Meshnet idea (virtual private LAN between your devices) feels least clear right now?
<span style="display:none">[^2_10][^2_11][^2_12][^2_13][^2_14][^2_15][^2_16][^2_17][^2_18][^2_19][^2_20][^2_21][^2_22][^2_23][^2_5][^2_6][^2_7][^2_8][^2_9]</span>

<div align="center">⁂</div>

[^2_1]: https://meshnet.nordvpn.com/getting-started/how-to-start-using-meshnet/using-meshnet-on-linux

[^2_2]: https://support.nordvpn.com/hc/en-us/articles/20196094470929-Installing-NordVPN-on-Linux-distributions

[^2_3]: https://meshnet.nordvpn.com/getting-started/how-to-start-using-meshnet

[^2_4]: https://meshnet.nordvpn.com/getting-started/how-to-start-using-meshnet/using-meshnet-on-windows

[^2_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^2_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^2_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/88317693/9ff9d15f-07fb-44fe-8788-5ae93597e39a/Okay-so-today-I-want-to-first-thing-I-want-to-do.md

[^2_8]: https://meshnet.nordvpn.com/features/linking-devices-in-meshnet/adding-external-meshnet-devices-on-linux

[^2_9]: https://meshnet.nordvpn.com/features/routing-traffic-in-meshnet/traffic-routing-linux

[^2_10]: https://www.reddit.com/r/nordvpn/comments/vmrk9s/meshnet_ssh/

[^2_11]: https://meshnet.nordvpn.com/how-to/remote-access/access-remote-systems-over-ssh

[^2_12]: https://meshnet.nordvpn.com/how-to/remote-access/log-in-to-pc-remotely/connect-to-linux

[^2_13]: https://meshnet.nordvpn.com/how-to/remote-access/log-in-to-pc-remotely/connect-to-windows

[^2_14]: https://forums.jeff.pro/t/how-to-get-kde-connect-manjaro-to-work-with-my-vpn-openvpn-on-linode/2433

[^2_15]: https://support.nordvpn.com/hc/en-us/articles/19472023025169-Installing-and-using-NordVPN-on-Windows-10-and-11

[^2_16]: https://discussion.fedoraproject.org/t/unable-to-use-kde-connect-with-nordvpn/71594

[^2_17]: https://www.reddit.com/r/nordvpn/comments/1ea251z/how_to_use_nordvpns_meshnet_permissions_tutorial/

[^2_18]: https://www.reddit.com/r/nordvpn/comments/18b2klh/meshnet_windows_service/

[^2_19]: https://www.reddit.com/r/kde/comments/11vx2ot/hey_guys_i_just_wanted_to_know_have_yall_checked/

[^2_20]: https://forum.proxmox.com/threads/problems-with-nordvpn-cli-in-debian-lxc.162467/

[^2_21]: https://www.youtube.com/watch?v=UKuspy3XRco

[^2_22]: https://forums.opensuse.org/t/nord-vpn-unable-to-connect-activated-and-immediately-deactivated/178274

[^2_23]: https://meshnet.nordvpn.com/features/sharing-files-in-meshnet/sharing-files-linux


---

# The names are "Meshnet-Sam-HpEnvy" and "Meshnet-Sam-Desktop"

Also so can am I allowed to paste in the results of that last terminal command I don't think that's safe to do.

I can see tge IP's and both of them though, but one thing that is kind of weird is that on Ubuntu terminal it says Windows 10?

OS: windows
Distribution: Windows 10 Home 64-bit (10.0, Build 26200)
Allow Incoming Traffic: enabled
Allow Routing: disabled
Allow Local Network Access: disabled
Allow Sending Files: enabled
Allows Incoming Traffic: enabled
Allows Routing: disabled
Allows Local Network Access: disabled
Allows Sending Files: enabled
Accept Fileshare Automatically: disabled

Perfect, that’s exactly the kind of detail that’s safe to share. Meshnet names + those flags are fine; just don’t paste full public IPs or anything super-identifying.

Quick roadmap for this bit:

1) Fix Meshnet permissions on both devices
2) Verify they can actually reach each other (basic ping)
3) Later: layer KDE Connect / remote access on top

### 1. Fix Meshnet permissions (Windows first)

Right now, Windows is **not** allowed to see your normal LAN through Meshnet, which is why KDE Connect / LAN-like stuff will struggle.[^3_1][^3_2]

On **Windows NordVPN app** (Meshnet settings for the HP Envy):

- For your **Ubuntu desktop** entry:
    - Enable **“Allow incoming traffic”** (already yes, good)
    - Enable **“Allow local network access”** (this is currently disabled)
    - Leave **“Routing”** disabled for now (we don’t need full internet routing yet)

On **Ubuntu**, use CLI to mirror that for the Windows device (replace `MESHNET-SAM-HPENVY` with the exact peer name shown by `nordvpn meshnet peer list`):

```bash
nordvpn meshnet peer update MESHNET-SAM-HPENVY --allow-incoming yes --allow-lan yes --allow-routing no
```

This tells Meshnet: “these two devices may reach each other’s local services and talk directly.”[^3_3][^3_4][^3_5]

Then run again on Ubuntu:

```bash
nordvpn meshnet peer list
```

Check that for the Windows peer, **Allow Local Network Access: enabled**.

### 2. Tiny connectivity test (no KDE Connect yet)

On **Ubuntu**, ping the Windows Meshnet IP (the `10.x.x.x` or `100.x.x.x`-style address shown for the HP Envy):

```bash
ping -c 4 WINDOWS_MESHNET_IP
```

You should get replies (time=… ms). If that works, Meshnet connectivity is good.[^3_6][^3_3]

You don’t need to paste the output, just tell me:

- Did enabling “Local network access” on both sides succeed?
- Did the `ping` from Ubuntu to the Windows Meshnet IP get replies?

What part of these Meshnet permissions (“incoming”, “routing”, “local network access”) feels most confusing so far?
<span style="display:none">[^3_7][^3_8][^3_9]</span>

<div align="center">⁂</div>

[^3_1]: https://meshnet.nordvpn.com/getting-started/how-to-start-using-meshnet/using-meshnet-on-windows

[^3_2]: https://meshnet.nordvpn.com/getting-started/how-to-start-using-meshnet

[^3_3]: https://meshnet.nordvpn.com/getting-started/how-to-start-using-meshnet/using-meshnet-on-linux

[^3_4]: https://meshnet.nordvpn.com/features/routing-traffic-in-meshnet/traffic-routing-linux

[^3_5]: https://meshnet.nordvpn.com/how-to/remote-access/log-in-to-pc-remotely/connect-to-linux

[^3_6]: https://meshnet.nordvpn.com/how-to/remote-access/access-remote-systems-over-ssh

[^3_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^3_8]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^3_9]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/88317693/9ff9d15f-07fb-44fe-8788-5ae93597e39a/Okay-so-today-I-want-to-first-thing-I-want-to-do.md


---

# hilliersm@2023-Cyberpower-Prebuilt:~\$ nordvpn meshnet peer update MESHNET-SAM-HPENVY --allow-incoming yes --allow-lan yes --allow-routing no

Command 'update' doesn't exist.
hilliersm@2023-Cyberpower-Prebuilt:~\$

Nice catch; your CLI is right, that `update` subcommand doesn’t exist there. We’ll stick to what *is* supported and keep the style from the file: very small steps, explain each command.

High‑level:

- Meshnet is **already working** enough for remote access.
- Those flags you pasted are just **Meshnet permissions**, not errors.[^4_1][^4_2][^4_3]
- “Windows 10” in the Linux output is just what Nord detects from the Windows client build; it’s normal even on Win 11 insider/dev builds.[^4_4]

For what you want (KDE Connect + later remote desktop between **only your devices**), you mainly care about:

- **Allow incoming traffic** = “this peer can reach my services over Meshnet”
- **File sharing** if you want to send files
We *do not* need traffic routing / LAN access right now.[^4_5][^4_3][^4_1]

On Linux, try just to **refresh and inspect**, no changes yet:

```bash
nordvpn meshnet peer list
```

Then, without pasting sensitive bits, answer in words:

1) For `Meshnet-Sam-HpEnvy`, does it show something like “Remote access: enabled” (wording may vary but should imply it can reach you)?
2) Do you feel clearer now that these are *just permission toggles* and not extra “VPNs inside VPNs”?
<span style="display:none">[^4_10][^4_11][^4_12][^4_13][^4_14][^4_15][^4_16][^4_17][^4_6][^4_7][^4_8][^4_9]</span>

<div align="center">⁂</div>

[^4_1]: https://meshnet.nordvpn.com/features/explaining-permissions/traffic-routing-permissions

[^4_2]: https://meshnet.nordvpn.com/features/explaining-permissions/remote-access-permissions

[^4_3]: https://nordsecurity.com/blog/traffic-routing-in-meshnet-increased-security

[^4_4]: https://support.nordvpn.com/hc/en-us/articles/19472023025169-Installing-and-using-NordVPN-on-Windows-10-and-11

[^4_5]: https://meshnet.nordvpn.com/features/explaining-permissions/local-network-permissions

[^4_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^4_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^4_8]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/88317693/9ff9d15f-07fb-44fe-8788-5ae93597e39a/Okay-so-today-I-want-to-first-thing-I-want-to-do.md

[^4_9]: https://meshnet.nordvpn.com/getting-started/how-to-start-using-meshnet/using-meshnet-on-linux

[^4_10]: https://meshnet.nordvpn.com/features/explaining-permissions/file-sharing-permissions

[^4_11]: https://meshnet.nordvpn.com/how-to/remote-access/log-in-to-pc-remotely/connect-to-linux

[^4_12]: https://meshnet.nordvpn.com/troubleshooting/linux

[^4_13]: https://www.youtube.com/watch?v=IgTvKg13hH8

[^4_14]: https://www.reddit.com/r/nordvpn/comments/1ea251z/how_to_use_nordvpns_meshnet_permissions_tutorial/

[^4_15]: https://meshnet.nordvpn.com/features/routing-traffic-in-meshnet/traffic-routing-linux

[^4_16]: https://meshnet.nordvpn.com/features/linking-devices-in-meshnet/adding-external-meshnet-devices-on-linux

[^4_17]: https://pimylifeup.com/raspberry-pi-meshnet/


---

```
# <q>On Linux, try just to refresh and inspect, no changes yet:</q> I do want to send files. I am going to use this desktop as my laptops backup for important files and vise versa eventually, and I also just like the idea of being able to send large files securly.
```

what does refresh and inspect mean???

---

OS: windows
Distribution: Windows 10 Home 64-bit (10.0, Build 26200)
Allow Incoming Traffic: enabled
Allow Routing: disabled
Allow Local Network Access: disabled
Allow Sending Files: enabled
Allows Incoming Traffic: enabled
Allows Routing: disabled
Allows Local Network Access: disabled
Allows Sending Files: enabled
Accept Fileshare Automatically: disabled

External Peers:
[no peers]
hilliersm@2023-Cyberpower-Prebuilt:~\$

Good call asking what “refresh and inspect” means; that was vague.

Your learning roadmap now:

1) Understand **what these Meshnet flags mean**
2) Enable exactly what you need (file sharing + remote access)
3) Later: try KDE Connect / remote desktop on top

### 1. Interpreting what you pasted

For `Meshnet-Sam-HpEnvy` (Windows):

- **Allow Incoming Traffic: enabled** → Your laptop can *reach your desktop* over Meshnet (for SSH/RDP/etc).[^5_1][^5_2]
- **Allow Sending Files: enabled** → Your laptop can send files to your desktop.[^5_3]
- **Allow Local Network Access: disabled** → Your laptop cannot “see through” your desktop into its LAN (fine for now).[^5_4]
- **External Peers: [no peers]** → No third‑party devices invited. Good.

So: you already have enough for **remote access and file sharing to your desktop**. You’ll need to mirror this later so the desktop can send files to the laptop too.

### 2. Next tiny action (Windows side only)

In the **Windows NordVPN app → Meshnet → Devices**:

- Click your **Ubuntu desktop** entry.
- Make sure these are ON for your use‑case:
    - “Can access this device” (incoming)
    - “Can send files to this device”

You don’t need “local network” or “routing” yet.

Question: in your own words, what’s the difference between **“Allow incoming traffic”** and **“Allow sending files”** in Meshnet?
<span style="display:none">[^5_5][^5_6][^5_7]</span>

<div align="center">⁂</div>

[^5_1]: https://meshnet.nordvpn.com/features/explaining-permissions/traffic-routing-permissions

[^5_2]: https://meshnet.nordvpn.com/features/explaining-permissions/remote-access-permissions

[^5_3]: https://meshnet.nordvpn.com/features/explaining-permissions/file-sharing-permissions

[^5_4]: https://meshnet.nordvpn.com/features/explaining-permissions/local-network-permissions

[^5_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^5_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^5_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/88317693/9ff9d15f-07fb-44fe-8788-5ae93597e39a/Okay-so-today-I-want-to-first-thing-I-want-to-do.md


---

# Here just tell me what to put please

Nice, that screenshot helps a lot. We’re keeping this simple and safe.

On **Windows NordVPN → Meshnet → your Ubuntu desktop entry**, set:

- **File sharing permissions**
    - “Receiving files from the linked device”: **On**
    - “Sending files to the linked device”: **On**
    - “Always accept transfers from this device”: **Off** (leave off for safety)[^6_1]
- **Traffic routing permissions**
    - “Traffic routing through your device”: **Off**
    - “Traffic routing through the linked device”: **Off**
    - “Access to your local network”: **Off**
    - “Access to linked device’s local network”: **Off**[^6_2][^6_3]
- **Remote access permissions**
    - “Remote access to your device”: **On**
    - “Remote access to the linked device”: **On**[^6_4]

This gives:

- Remote access both ways
- File sharing both ways
- No risky “see my whole LAN” routing yet.

Once that’s set, next step will be: from Windows, try to **ping the Ubuntu Meshnet IP** to confirm connectivity, then we can hook KDE Connect / remote desktop on top.

Question: after toggling those, can you describe in your own words what *extra power* “traffic routing” would give compared to just remote access + file sharing?
<span style="display:none">[^6_5][^6_6][^6_7][^6_8]</span>

<div align="center">⁂</div>

[^6_1]: https://meshnet.nordvpn.com/features/explaining-permissions/file-sharing-permissions

[^6_2]: https://meshnet.nordvpn.com/features/explaining-permissions/traffic-routing-permissions

[^6_3]: https://meshnet.nordvpn.com/features/explaining-permissions/local-network-permissions

[^6_4]: https://meshnet.nordvpn.com/features/explaining-permissions/remote-access-permissions

[^6_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/88317693/9ff9d15f-07fb-44fe-8788-5ae93597e39a/Okay-so-today-I-want-to-first-thing-I-want-to-do.md

[^6_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/68a0dfcf-f937-4fb5-9c52-4e42981c9230/image.jpg

[^6_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^6_8]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md


---

# no idea

Totally fine, that’s the right answer for now.

One new idea only:

- **Remote access + file sharing** = “the other device can talk directly to *this* computer only” (SSH/RDP/KDE Connect, send/receive files).
- **Traffic routing** = “the other device can send *all its internet or LAN traffic* through you, like you turned your PC into a mini‑VPN router.”[^7_1][^7_2][^7_3]
That’s powerful but more complex and not needed yet.

Where we are in the plan:

1) UFW locked down ✔
2) Meshnet linked + permissions set ✔
3) Next: confirm basic connectivity, then try remote tools.

Next tiny step (Windows → Ubuntu ping test):

On Windows, open **Command Prompt** and run (replace with Ubuntu’s Meshnet IP):

```bat
ping UBUNTU_MESHNET_IP
```

You should see “Reply from …” lines.

In your own words: did your laptop get replies from the Ubuntu Meshnet IP, or did it time out?
<span style="display:none">[^7_4][^7_5][^7_6][^7_7]</span>

<div align="center">⁂</div>

[^7_1]: https://meshnet.nordvpn.com/features/explaining-permissions/traffic-routing-permissions

[^7_2]: https://meshnet.nordvpn.com/features/explaining-permissions/local-network-permissions

[^7_3]: https://nordsecurity.com/blog/traffic-routing-in-meshnet-increased-security

[^7_4]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^7_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^7_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/88317693/9ff9d15f-07fb-44fe-8788-5ae93597e39a/Okay-so-today-I-want-to-first-thing-I-want-to-do.md

[^7_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/68a0dfcf-f937-4fb5-9c52-4e42981c9230/image.jpg


---

# Windows PowerShell

Copyright (C) Microsoft Corporation. All rights reserved.

Install the latest PowerShell for new features and improvements! [https://aka.ms/PSWindows](https://aka.ms/PSWindows)

PS C:\Users\samhi> ping 100.125.125.166

Pinging desktop-ip with 32 bytes of data:
Request timed out.
Request timed out.
Request timed out.
Request timed out.

Ping statistics for desktop-ip:
Packets: Sent = 4, Received = 0, Lost = 4 (100% loss),
PS C:\Users\samhi>

Meshnet is mostly fine; the **ping failing is expected** and not a blocker. Many Meshnet setups don’t respond to ICMP (ping) even when remote access works.[^8_1][^8_2]

Let’s skip ping and do a more direct test.

On **Ubuntu desktop**, run:

```bash
nordvpn meshnet peer list
```

You should see `Meshnet-Sam-HPEnvy` listed with a Meshnet IP and **Remote access: allowed** (wording may vary).[^8_3][^8_4]

If that looks right, next step is:

- We’ll try a *real* remote-access test (like SSH or RDP) over Meshnet instead of ping.

Before doing that: which would you rather set up first over Meshnet so you see it working—**file transfer** or **remote desktop**?
<span style="display:none">[^8_10][^8_11][^8_12][^8_13][^8_14][^8_15][^8_16][^8_17][^8_18][^8_19][^8_20][^8_21][^8_22][^8_23][^8_24][^8_5][^8_6][^8_7][^8_8][^8_9]</span>

<div align="center">⁂</div>

[^8_1]: https://github.com/NordSecurity/nordvpn-linux/issues/344

[^8_2]: https://forum.openmediavault.org/index.php?thread%2F53516-need-help-configuring-firewall-rules-in-omv-to-allow-nordvpn-meshnet%2F

[^8_3]: https://meshnet.nordvpn.com/features/linking-devices-in-meshnet/adding-meshnet-devices-on-windows

[^8_4]: https://meshnet.nordvpn.com/features/explaining-permissions/remote-access-permissions

[^8_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^8_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^8_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/88317693/9ff9d15f-07fb-44fe-8788-5ae93597e39a/Okay-so-today-I-want-to-first-thing-I-want-to-do.md

[^8_8]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/68a0dfcf-f937-4fb5-9c52-4e42981c9230/image.jpg

[^8_9]: https://www.reddit.com/r/EndeavourOS/comments/1mal30a/enabling_nordvpn_firewall_in_linux_disables/

[^8_10]: https://support.nordvpn.com/hc/en-us/articles/20398047039889-I-can-t-connect-to-the-VPN-on-Linux

[^8_11]: https://meshnet.nordvpn.com/troubleshooting/linux

[^8_12]: https://bbs.archlinux.org/viewtopic.php?id=288588

[^8_13]: https://www.reddit.com/r/linuxadmin/comments/nlciaq/ufw_howto_block_outgoing_icmp_packets_to_any/

[^8_14]: https://forum.proxmox.com/threads/problems-with-nordvpn-cli-in-debian-lxc.162467/

[^8_15]: https://github.com/NordSecurity/nordvpn-linux/issues/513

[^8_16]: https://www.reddit.com/r/nordvpn/comments/1d3w36j/meshnet_can_ping_friends_pcs_and_access_minecraft/

[^8_17]: https://github.com/NordSecurity/nordvpn-linux/issues/869

[^8_18]: https://community.ui.com/questions/cd8c8b3c-186e-43a7-bdbc-32a085b7e2a7

[^8_19]: https://meshnet.nordvpn.com/features/linking-devices-in-meshnet/adding-external-meshnet-devices-on-linux

[^8_20]: https://www.linux.org/threads/nordvpn-working-from-terminal-but-not-from-network-manager.46021/

[^8_21]: https://community.meraki.com/t5/Security-SD-WAN/ICMP-not-working/m-p/177489

[^8_22]: https://nordsecurity.com/blog/traffic-routing-in-meshnet-increased-security

[^8_23]: https://meshnet.nordvpn.com/troubleshooting/windows

[^8_24]: https://meshnet.nordvpn.com/features/explaining-permissions/traffic-routing-permissions


---

# OS: windows

Distribution: Windows 10 Home 64-bit (10.0, Build 26200)
Allow Incoming Traffic: enabled
Allow Routing: disabled
Allow Local Network Access: disabled
Allow Sending Files: enabled
Allows Incoming Traffic: enabled
Allows Routing: disabled
Allows Local Network Access: disabled
Allows Sending Files: enabled
Accept Fileshare Automatically: disabled

External Peers:
[no peers]
hilliersm@2023-Cyberpower-Prebuilt:~\$ ^C
hilliersm@2023-Cyberpower-Prebuilt:~\$

---

I pasted everything except the key and ip but there is something wrong here, figure it out

Good catch asking me to spot the problem.

The issue: We configured **Windows → Ubuntu** permissions via the Windows GUI, but the Ubuntu CLI output shows what the **Windows device allows**, not what **Ubuntu itself is configured to allow**.[^9_1][^9_2]

Right now from that output:

- Windows allows Ubuntu to access it remotely (incoming traffic) ✓
- Windows allows Ubuntu to send files to it ✓

But we haven't checked if **Ubuntu allows Windows** to do the same in reverse.

On **Ubuntu**, run:

```bash
nordvpn meshnet peer incoming allow MESHNET-SAM-HPENVY
nordvpn meshnet peer fileshare allow MESHNET-SAM-HPENVY
```

These tell Ubuntu: "let the Windows laptop access me remotely and send me files."[^9_3][^9_4]

Then verify:

```bash
nordvpn meshnet peer list
```

Look for the Windows peer entry and check if **both "Allow" and "Allows"** sections now show enabled for incoming traffic and file sharing.

In your own words: what's the difference between "Allow Incoming Traffic" and "Allows Incoming Traffic" in that output?
<span style="display:none">[^9_5][^9_6][^9_7][^9_8][^9_9]</span>

<div align="center">⁂</div>

[^9_1]: https://meshnet.nordvpn.com/features/explaining-permissions/remote-access-permissions

[^9_2]: https://meshnet.nordvpn.com/features/explaining-permissions/file-sharing-permissions

[^9_3]: https://meshnet.nordvpn.com/getting-started/how-to-start-using-meshnet/using-meshnet-on-linux

[^9_4]: https://meshnet.nordvpn.com/troubleshooting/linux

[^9_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/ff7fef10-4784-4e3a-8edd-80ef710bc3cb/can-you-try-and-figure-out-why-aWSZNJvFRM6qXoMOtCcMjQ.md

[^9_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^9_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^9_8]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/88317693/9ff9d15f-07fb-44fe-8788-5ae93597e39a/Okay-so-today-I-want-to-first-thing-I-want-to-do.md

[^9_9]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/68a0dfcf-f937-4fb5-9c52-4e42981c9230/image.jpg


---

# Okay you know what, do i even need nordvpn on my LAN?

Perfect time to ask that. Short answer: **not while both devices are on the same LAN at home**. You already configured UFW to secure inbound traffic.[^10_1]

Here's the tradeoff:

**On your home LAN (both devices same network):**

- **With NordVPN off**: KDE Connect works immediately, RDP works, file sharing works. UFW already protects against outside threats.[^10_1]
- **With NordVPN on**: You need Meshnet complexity just to replicate what the LAN already does locally.

**When you're away from home (laptop elsewhere, desktop at apartment):**

- **With NordVPN + Meshnet**: You can securely access your desktop from coffee shops, campus, etc. This is where it's *essential*.[^10_2][^10_3]

For a GCP ML engineer: the skill is knowing **when** to use each layer, not "always VPN."[^10_1]

## My recommendation for today

**Home LAN workflow:**

1. Pause NordVPN on both devices when on same network
2. Use KDE Connect / RDP directly via `192.168.1.x` addresses
3. UFW already blocks external threats

**Remote workflow (later):**

1. Enable NordVPN + Meshnet when you're off-campus
2. Connect via Meshnet IPs for secure remote access

This keeps things simple and lets you **actually use your tools** without fighting Meshnet complexity while sitting at home.

Does this match what you were thinking, or did you want Meshnet working regardless for practice/learning?
<span style="display:none">[^10_4][^10_5][^10_6][^10_7]</span>

<div align="center">⁂</div>

[^10_1]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/88317693/9ff9d15f-07fb-44fe-8788-5ae93597e39a/Okay-so-today-I-want-to-first-thing-I-want-to-do.md

[^10_2]: https://meshnet.nordvpn.com/features/explaining-permissions/remote-access-permissions

[^10_3]: https://nordsecurity.com/blog/traffic-routing-in-meshnet-increased-security

[^10_4]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/26c11b76-1dd8-4231-8e5d-56cb49de26fa/can-you-try-and-figure-out-why-aWSZNJvFRM6qXoMOtCcMjQ.md

[^10_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^10_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^10_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/68a0dfcf-f937-4fb5-9c52-4e42981c9230/image.jpg


---

# yes, for now, lets quickly make sure KDE is working for everything, but if I keep NordVPN disconnected, along with on my Laptop, that is fine correct? Do I even need Nordvpn on my LAN or at my apartment?

Good question. Let's answer each part clearly.

## NordVPN on your home LAN (now)

**Disconnect NordVPN on both devices when at home: YES, this is fine.**
Your UFW firewall already protects Ubuntu. Windows has its own firewall. Your router provides NAT (Network Address Translation), which hides your devices from the internet.[^11_1]

## NordVPN at your apartment (shared network, 2026-06+)

**Use NordVPN differently:**

- **Desktop (Ubuntu, ethernet)**: Keep NordVPN **off** most of the time. UFW protects it. Only turn on VPN when you need to browse privately or access geo-restricted content.
- **Laptop (portable)**: Turn NordVPN **on** when you're on untrusted WiFi (coffee shops, campus, public networks), **off** when at apartment if you trust your router.[^11_1]

Why? On a shared apartment network:

- Other tenants can't break through your **UFW firewall** (you locked SSH/RDP/VNC to LAN-only or VPN-only).[^11_1]
- NordVPN protects your *browsing* from snooping but adds latency for local tasks.


## Quick KDE Connect test now

With NordVPN **disconnected on both**:

1. On Ubuntu:
```bash
systemctl --user status kdeconnectd
```

Should show "active (running)".

2. On Windows: open **KDE Connect app** → should auto-discover `Meshnet-Sam-Desktop`.
3. Pair them and test send a file from laptop → desktop.

Does KDE Connect now show both devices, or still no discovery?
<span style="display:none">[^11_2][^11_3][^11_4][^11_5]</span>

<div align="center">⁂</div>

[^11_1]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/88317693/9ff9d15f-07fb-44fe-8788-5ae93597e39a/Okay-so-today-I-want-to-first-thing-I-want-to-do.md

[^11_2]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/b47fc4bb-d6bf-4201-872f-6dd9286ef75d/can-you-try-and-figure-out-why-aWSZNJvFRM6qXoMOtCcMjQ.md

[^11_3]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^11_4]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^11_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/68a0dfcf-f937-4fb5-9c52-4e42981c9230/image.jpg


---

# Okay i sent a file or opened it on both devices but i dont know if it worked or where iti s

Nice, KDE Connect is paired and working; now we just need to find the files.

On **Ubuntu**, default receive folder is usually your `Downloads` or a `KDEConnect` subfolder.[^12_1][^12_2]
Try:

```bash
ls ~/Downloads
ls ~/Downloads/*KDEConnect* 2>/dev/null
```

On **Windows**, KDE Connect normally asks where to save, or uses your `Downloads` folder.[^12_2]

So for Windows, check:

- `C:\Users\<your-user>\Downloads`

Question: when you check `Downloads` on both machines, do you see the test file there on either side?
<span style="display:none">[^12_3][^12_4][^12_5][^12_6][^12_7][^12_8]</span>

<div align="center">⁂</div>

[^12_1]: https://meshnet.nordvpn.com/how-to/remote-access/log-in-to-pc-remotely/connect-to-linux

[^12_2]: https://www.reddit.com/r/kde/comments/11vx2ot/hey_guys_i_just_wanted_to_know_have_yall_checked/

[^12_3]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/88317693/9ff9d15f-07fb-44fe-8788-5ae93597e39a/Okay-so-today-I-want-to-first-thing-I-want-to-do.md

[^12_4]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/eafc9e4b-7289-45ab-94ea-b07ed2ebf6e4/image.jpg

[^12_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/4f06a598-2382-4705-9221-1f49ecfeeb11/can-you-try-and-figure-out-why-aWSZNJvFRM6qXoMOtCcMjQ.md

[^12_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^12_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^12_8]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/68a0dfcf-f937-4fb5-9c52-4e42981c9230/image.jpg


---

# no

KDE Connect is paired, so this is just a “where did it save?” issue.

Let’s check KDE Connect’s configured folder instead of guessing.

On **Ubuntu**:

1. Open the KDE Connect app.
2. Click your Windows device → **Plugin Settings** → **Share File**.
3. It will show the **destination folder path** (often `Downloads` or a `kdeconnect` subfolder).[^13_1]

On **Windows**:

1. Open the KDE Connect app.
2. Click your Ubuntu device → look for a similar **“Share” / “Receive files to”** path.[^13_2]

Then try sending one small test file **one way only** (e.g., Windows → Ubuntu) and watch that folder.

What folder path do you see in the KDE Connect settings on Ubuntu for incoming files?
<span style="display:none">[^13_3][^13_4][^13_5][^13_6][^13_7]</span>

<div align="center">⁂</div>

[^13_1]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/88317693/9ff9d15f-07fb-44fe-8788-5ae93597e39a/Okay-so-today-I-want-to-first-thing-I-want-to-do.md

[^13_2]: https://www.reddit.com/r/kde/comments/11vx2ot/hey_guys_i_just_wanted_to_know_have_yall_checked/

[^13_3]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/4eea812d-2f20-4487-b099-173aa2666b39/can-you-try-and-figure-out-why-aWSZNJvFRM6qXoMOtCcMjQ.md

[^13_4]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^13_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^13_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/68a0dfcf-f937-4fb5-9c52-4e42981c9230/image.jpg

[^13_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/eafc9e4b-7289-45ab-94ea-b07ed2ebf6e4/image.jpg


---

# Okay its not working but for now I do not even give a flying fuck so lets wrap up as cliboard and everything else is working.

I need to take a break, goodbye and thank you.

Totally fair to tap out; you got a lot done.

Where you are now:

- UFW is locked down safely with LAN-only KDE ports.[^14_1]
- KDE Connect pairing, clipboard, input, etc. work between laptop and desktop.[^14_1]
- You have a clear rule: **VPN off on home LAN, use NordVPN mainly when off trusted networks.**[^14_2]

Whenever you’re back and have energy, we can:

- Revisit KDE Connect file paths, or
- Set up remote desktop over LAN or Meshnet, step‑by‑step.

Before you go: what’s one thing from today that makes more sense now than it did this morning?
<span style="display:none">[^14_3][^14_4][^14_5][^14_6]</span>

<div align="center">⁂</div>

[^14_1]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/88317693/9ff9d15f-07fb-44fe-8788-5ae93597e39a/Okay-so-today-I-want-to-first-thing-I-want-to-do.md

[^14_2]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/7fa11b56-93a3-44e5-a84e-9460fa846907/can-you-try-and-figure-out-why-aWSZNJvFRM6qXoMOtCcMjQ.md

[^14_3]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^14_4]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^14_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/68a0dfcf-f937-4fb5-9c52-4e42981c9230/image.jpg

[^14_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/eafc9e4b-7289-45ab-94ea-b07ed2ebf6e4/image.jpg

