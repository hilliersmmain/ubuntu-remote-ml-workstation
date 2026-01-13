<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# Okay, so today I want to first thing I want to do is get my cybersecurity, firewall, NordVPN, and KDE Connect working. I also ideally want to be able to remote connect with NordVPN, so we got to set up whatever that is. That's my main goal for today. How long is this going to take?

Remember that while I want to get this done quickly I also need to start learning while I work with you.

I already have NordVPN installed and KDE connect installed on both Linux and Windows, I do not want to set it up on Iphone or Ipad today.

Remember that I already have a dedicated IP in Nordvpn payed for until 2028 that I want to use.

We have also worked on this before, so somethings might already be enabled, so for now just tell me where to start and why.

Rough estimate: expect about 2–3 focused hours, split into small chunks with testing after each step.[^1_1][^1_2][^1_3]

Here’s the high‑level path for today (we’ll start at step 1):

1. **Firewall (UFW) baseline**
    - Check if UFW is enabled and what rules exist.
    - Goal: “default deny incoming, allow outgoing, plus SSH if needed.”[^1_4][^1_1]
2. **KDE Connect through firewall**
    - Add rules to open ports 1714–1764 TCP/UDP for your LAN so KDE Connect works with UFW on.[^1_2]
3. **NordVPN + dedicated IP on Linux**
    - Confirm CLI is logged in, then test `nordvpn connect` and your dedicated IP server (e.g., `usXXXX`).[^1_3][^1_5]
4. **Remote access over NordVPN**
    - Decide what “remote connect” means: SSH into desktop? KDE Connect? RDP to Windows?
    - Then add specific UFW and NordVPN settings to allow that safely.[^1_6][^1_1]

To **start and learn**, first step on Ubuntu terminal:

```bash
sudo ufw status verbose
```

This tells us if UFW is active and what your current defaults/rules are.[^1_1][^1_4]

What are your learning goals for this: more “follow a secure recipe” or “understand enough networking/firewall concepts to design rules yourself”?
<span style="display:none">[^1_10][^1_11][^1_12][^1_13][^1_14][^1_15][^1_16][^1_17][^1_18][^1_19][^1_20][^1_21][^1_22][^1_7][^1_8][^1_9]</span>

<div align="center">⁂</div>

[^1_1]: https://help.ubuntu.com/community/UFW

[^1_2]: https://userbase.kde.org/KDEConnect

[^1_3]: https://support.nordvpn.com/hc/en-us/articles/19684336200081-How-to-connect-to-your-dedicated-IP-on-Linux

[^1_4]: https://wiki.ubuntu.com/UncomplicatedFirewall

[^1_5]: https://support.nordvpn.com/hc/en-us/articles/32830477282449-How-to-start-using-NordVPN-dedicated-IP

[^1_6]: https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands

[^1_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^1_8]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^1_9]: https://blog.rtsp.us/ufw-uncomplicated-firewall-cheat-sheet-a9fe61933330

[^1_10]: https://documentation.ubuntu.com/server/how-to/security/firewalls/

[^1_11]: https://www.hostinger.com/tutorials/how-to-configure-firewall-on-ubuntu-using-ufw

[^1_12]: https://support.nordvpn.com/hc/en-us/articles/20595248071185-How-to-set-up-NordVPN-dedicated-IP

[^1_13]: https://discuss.cachyos.org/t/kde-connect-open-up-firewall-ports/3984

[^1_14]: https://hostman.com/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu/

[^1_15]: https://support.nordvpn.com/hc/en-us/articles/31386007399057-Manual-NordVPN-Dedicated-IP-server-setup

[^1_16]: https://www.youtube.com/watch?v=xQRf35FHyTE

[^1_17]: https://www.youtube.com/watch?v=suWzbIwrS9E

[^1_18]: https://www.youtube.com/watch?v=_8RbFsChZwM

[^1_19]: https://bbs.archlinux.org/viewtopic.php?id=205969

[^1_20]: https://www.itprotoday.com/linux-os/linux-ufw-uncomplicated-firewall-configuration-made-easy

[^1_21]: https://www.reddit.com/r/kde/comments/kgcauc/what_port_does_kde_connect_use/

[^1_22]: https://support.nordvpn.com/hc/en-us/articles/20196094470929-Installing-NordVPN-on-Linux-distributions


---

# I mean I want to be a GCP ML engineer so what level of this should I know, also I will paste output below.

hilliersm@2023-Cyberpower-Prebuilt:~\$ sudo ufw status verbose
[sudo] password for hilliersm:
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), deny (routed)
New profiles: skip

To                         Action      From
------------
22/tcp                     ALLOW IN    Anywhere
3389/tcp                   ALLOW IN    Anywhere
5900/tcp                   ALLOW IN    Anywhere
1714:1764/udp              ALLOW IN    Anywhere
1714:1764/tcp              ALLOW IN    Anywhere
22/tcp (v6)                ALLOW IN    Anywhere (v6)
3389/tcp (v6)              ALLOW IN    Anywhere (v6)
5900/tcp (v6)              ALLOW IN    Anywhere (v6)
1714:1764/udp (v6)         ALLOW IN    Anywhere (v6)
1714:1764/tcp (v6)         ALLOW IN    Anywhere (v6)

hilliersm@2023-Cyberpower-Prebuilt:~\$

For a GCP ML engineer, the right level is: “comfortable user and reviewer,” not “deep network engineer.” That means you should be able to:[^2_1][^2_2]

- Read firewall rules and quickly see if something is too open or missing.
- Design simple “default deny, allow only needed ports/IP ranges” policies (exactly what UFW is doing now).[^2_3][^2_1]
- Reason about SSH/RDP/VNC exposure and VPN vs. public IP.

Your current UFW status is already a solid baseline for that goal:

- Default deny incoming, allow outgoing, with explicit allows for SSH (22), RDP (3389), VNC (5900), and KDE Connect ports 1714–1764 TCP/UDP.[^2_4][^2_3]

Next **learning step** (no changes yet):
Can you walk through your rule list in your own words and say which services are exposed to “Anywhere” and what risk that might imply?
<span style="display:none">[^2_10][^2_11][^2_12][^2_13][^2_14][^2_15][^2_16][^2_17][^2_18][^2_19][^2_20][^2_21][^2_22][^2_5][^2_6][^2_7][^2_8][^2_9]</span>

<div align="center">⁂</div>

[^2_1]: https://docs.cloud.google.com/architecture/framework/perspectives/ai-ml/security

[^2_2]: https://www.certlibrary.com/blog/introduction-to-gcp-for-network-engineers-the-ultimate-guide/

[^2_3]: https://help.ubuntu.com/community/UFW

[^2_4]: https://userbase.kde.org/KDEConnect

[^2_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^2_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^2_7]: https://cloud.google.com/blog/products/gcp/use-firewall-insights-to-improve-security-posture

[^2_8]: https://www.youtube.com/watch?v=MoUeHQJQFFY

[^2_9]: https://www.wallarm.com/what/gcp-security

[^2_10]: https://bbs.archlinux.org/viewtopic.php?id=205969

[^2_11]: https://www.zenarmor.com/docs/network-security-tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu

[^2_12]: https://www.coursera.org/learn/gcp-professional-architect-gcp-security-and-networking

[^2_13]: https://github.com/NixOS/nixpkgs/issues/311448

[^2_14]: https://www.hostinger.com/tutorials/how-to-configure-firewall-on-ubuntu-using-ufw

[^2_15]: https://platform.qa.com/lab/securing-cloud-applications-with-google-cloud-armor-and-firewall-rules/

[^2_16]: https://forums.freebsd.org/threads/kdeconnect-pf-rules.94350/

[^2_17]: https://www.youtube.com/watch?v=SUFH39-bZXE

[^2_18]: https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands

[^2_19]: https://www.reddit.com/r/kde/comments/1lcob41/kde_connect/

[^2_20]: https://www.reddit.com/r/HomeNetworking/comments/g6mhba/ufw_help_allow_only_from_lan/

[^2_21]: https://forum.kde.org/viewtopic.php%3Ff=18\&t=177685.html

[^2_22]: https://tailscale.com/kb/1077/secure-server-ubuntu


---

# umm all of them say Anywhere?

Exactly: right now **22, 3389, 5900, and 1714–1764 (TCP/UDP) are open from anywhere on the internet**, both IPv4 and IPv6. That’s functional but riskier than needed for a home desktop.[^3_1][^3_2]

For a safer setup, those should normally be limited to your LAN (for KDE Connect) and maybe a specific IP (for remote admin) instead of “Anywhere.”[^3_3][^3_1]

Next concrete step (still learning, not changing yet):

- What device(s) do you actually want to be able to remote into this Ubuntu box from: only your home LAN machines, or also when you’re off‑campus/away?
<span style="display:none">[^3_4][^3_5]</span>

<div align="center">⁂</div>

[^3_1]: https://help.ubuntu.com/community/UFW

[^3_2]: https://www.hostinger.com/tutorials/how-to-configure-firewall-on-ubuntu-using-ufw

[^3_3]: https://www.reddit.com/r/HomeNetworking/comments/g6mhba/ufw_help_allow_only_from_lan/

[^3_4]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^3_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md


---

# Wait also, remember that once I move back to my apartment, if my mom lets me this pc is going to be connected on ethernet to the shared apartment network, so does knowing that change our plan in any way?

Yes, that matters a lot. On a shared apartment LAN, you should assume **other tenants’ devices might be hostile or infected**, not just “friendly neighbors.”[^4_1][^4_2]

With your current rules, anyone on that shared network (or even from the internet if your router forwards) could scan and try SSH/RDP/VNC against your box. As a future GCP ML engineer, the “right move” here is:[^4_3][^4_4][^4_1]

- Close SSH/RDP/VNC to the LAN by default.
- Only expose them via a VPN (like NordVPN dedicated IP) or from very specific trusted IPs/subnets.[^4_5][^4_6][^4_3]

So yes, our plan changes slightly:

- Use UFW to **lock down ports 22/3389/5900 to either your own LAN subnet or, better, only via your VPN path**.
- Keep KDE Connect ports open only to LAN, not “Anywhere.”[^4_7][^4_8][^4_3]

Next tiny step (hands-on):
Run this so we can see rule numbers for cleanup later:

```bash
sudo ufw status numbered
```

Then tell what you see for the first 5 rules and we’ll design safer “LAN-only + VPN” access together.
<span style="display:none">[^4_10][^4_11][^4_12][^4_13][^4_14][^4_15][^4_16][^4_17][^4_18][^4_19][^4_20][^4_21][^4_22][^4_23][^4_9]</span>

<div align="center">⁂</div>

[^4_1]: https://www.pentestpartners.com/security-blog/vnc-rdp-for-all-to-see/

[^4_2]: https://www.upguard.com/blog/remote-access

[^4_3]: https://help.ubuntu.com/community/UFW

[^4_4]: https://www.splashtop.com/blog/is-rdp-secure-exploring-remote-desktop-protocol-vulnerabilities

[^4_5]: https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands

[^4_6]: https://docs.cloud.google.com/architecture/framework/perspectives/ai-ml/security

[^4_7]: https://userbase.kde.org/KDEConnect

[^4_8]: https://www.zenarmor.com/docs/network-security-tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu

[^4_9]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^4_10]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^4_11]: https://www.digi.com/blog/post/rdp-security-don-t-leave-remote-access-wide-open

[^4_12]: https://www.reddit.com/r/selfhosted/comments/123stpl/security_risks_of_vnc/

[^4_13]: https://delinea.com/blog/rdp-security

[^4_14]: https://community.spiceworks.com/t/why-is-rdp-seen-to-be-a-security-risk-over-vpn/383252

[^4_15]: https://github.com/NixOS/nixpkgs/issues/311448

[^4_16]: https://blog.cloudsigma.com/the-basics-of-ufw-learning-the-essential-firewall-commands/

[^4_17]: https://www.reddit.com/r/kde/comments/1lcob41/kde_connect/

[^4_18]: https://www.crowdstrike.com/en-us/cybersecurity-101/identity-protection/remote-desk-protocol-rdp/

[^4_19]: https://answers.launchpad.net/gui-ufw/+question/295603

[^4_20]: https://maslosoft.com/kb/how-to-allow-connections-for-specific-ip-address-or-subnet-and-port-in-ufw/

[^4_21]: https://forum.kde.org/viewtopic.php%3Ff=18\&t=177685.html

[^4_22]: https://www.reddit.com/r/HomeNetworking/comments/g6mhba/ufw_help_allow_only_from_lan/

[^4_23]: https://forum.garudalinux.org/t/hi-folks-how-are-you-using-kdeconnect-with-port-blocking/28804


---

# hilliersm@2023-Cyberpower-Prebuilt:~\$ sudo ufw status numbered

Status: active

     To                         Action      From
     --                         ------      ----
    [ 1] 22/tcp                     ALLOW IN    Anywhere
[ 2] 3389/tcp                   ALLOW IN    Anywhere
[ 3] 5900/tcp                   ALLOW IN    Anywhere
[ 4] 1714:1764/udp              ALLOW IN    Anywhere
[ 5] 1714:1764/tcp              ALLOW IN    Anywhere
[ 6] 22/tcp (v6)                ALLOW IN    Anywhere (v6)
[ 7] 3389/tcp (v6)              ALLOW IN    Anywhere (v6)
[ 8] 5900/tcp (v6)              ALLOW IN    Anywhere (v6)
[ 9] 1714:1764/udp (v6)         ALLOW IN    Anywhere (v6)
[10] 1714:1764/tcp (v6)         ALLOW IN    Anywhere (v6)

hilliersm@2023-Cyberpower-Prebuilt:~\$

Nice, this is clear and tidy.

Given your future apartment/shared LAN and your GCP-ML-engineer goals, the **security-upgrade plan** is:

- Remove these “Anywhere” rules for 22/3389/5900 and KDE Connect.
- Re‑add:
    - 22/3389/5900 either locked to VPN path or to a very specific IP range.
    - 1714–1764 TCP/UDP allowed only from your LAN subnet (for KDE Connect).[^5_1][^5_2][^5_3][^5_4]

Next **hands-on step** (no re‑add yet, just cleanup prep):
Which of these do you actually use today: SSH (22), Windows RDP (3389), VNC (5900), KDE Connect, or only some of them?
<span style="display:none">[^5_5][^5_6]</span>

<div align="center">⁂</div>

[^5_1]: https://help.ubuntu.com/community/UFW

[^5_2]: https://userbase.kde.org/KDEConnect

[^5_3]: https://www.zenarmor.com/docs/network-security-tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu

[^5_4]: https://www.reddit.com/r/HomeNetworking/comments/g6mhba/ufw_help_allow_only_from_lan/

[^5_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^5_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md


---

# I dont know i do not even know what any of these even are or what thewy mean

Totally fine—that’s exactly the stuff you *should* be learning at your level.

Mini‑roadmap for today (we’re at step 1):

1. Learn what SSH, RDP, VNC, and KDE Connect *are* so the ports make sense.
2. Lock down UFW rules safely.
3. Get NordVPN (with dedicated IP) working.
4. (If time) Set up a safe remote‑access method.

One‑concept explanation (today’s step):

- **SSH (port 22)**: Secure command‑line remote login to a machine, mostly text‑only, commonly used by developers/admins.[^6_1][^6_2]

Quick check: based on that, can you see a situation where *you personally* might want SSH into this desktop (e.g., from your laptop), or does that sound like “not needed right now”?
<span style="display:none">[^6_3][^6_4]</span>

<div align="center">⁂</div>

[^6_1]: https://help.ubuntu.com/community/UFW

[^6_2]: https://www.crowdstrike.com/en-us/cybersecurity-101/identity-protection/remote-desk-protocol-rdp/

[^6_3]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^6_4]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md


---

# I mean yes I will, but that is not something I really know at all how to do, to start off I really was just planning on mostly using RDP to GUI instead as that was my main reason for getting this desktop on Linux in the first place, but currently it only works when I have NordVPN off on both devices, but that scares me not on windows laptop but Ubuntu, because currently Nordvpn and its additonal threat protection service is all I am aware of that is defending my ubuntu desktop currently.

Yes, this all changes how we should set things up, and your concern is valid.

Where we are in the plan:

1) Understand remote methods
2) Fix UFW rules
3) Fix NordVPN + remote access

One concept only:

- **RDP (3389) / VNC (5900)** give full GUI control to anyone who can reach those ports with a password prompt. On a shared network or the open internet, that’s a big attack surface, even if NordVPN is on.[^7_1][^7_2][^7_3]

For your situation, the safer direction is:

- Keep UFW as the main defense (it’s already on).
- Use NordVPN mainly for *outgoing* privacy, not as your only “firewall.”[^7_4][^7_5]
- Aim for: RDP/VNC reachable only from either your local subnet or (later) via a VPN path, not 0.0.0.0/0.

Next tiny step (hands-on, starts fixing risk but still simple):
Run these to close RDP/VNC/SSH from “Anywhere” without breaking your internet:

```bash
sudo ufw delete 1
sudo ufw delete 1
sudo ufw delete 1
```

Because the list is numbered, deleting rule 1 three times will remove 22, 3389, and 5900 for IPv4, leaving KDE Connect and the IPv6 rules for now.[^7_4]

After you run that, paste `sudo ufw status numbered` again. Then we’ll:

- Explain RDP vs VNC vs SSH in simple terms,
- Re‑open only what you actually need, the right way.

What part of this feels most confusing right now: “what RDP/VNC/SSH *are*” or “how UFW/NordVPN interact with them”?
<span style="display:none">[^7_10][^7_11][^7_12][^7_13][^7_14][^7_15][^7_16][^7_17][^7_18][^7_19][^7_20][^7_21][^7_22][^7_23][^7_24][^7_25][^7_26][^7_6][^7_7][^7_8][^7_9]</span>

<div align="center">⁂</div>

[^7_1]: https://www.digi.com/blog/post/rdp-security-don-t-leave-remote-access-wide-open

[^7_2]: https://www.pentestpartners.com/security-blog/vnc-rdp-for-all-to-see/

[^7_3]: https://www.splashtop.com/blog/is-rdp-secure-exploring-remote-desktop-protocol-vulnerabilities

[^7_4]: https://help.ubuntu.com/community/UFW

[^7_5]: https://support.nordvpn.com/hc/en-us/articles/19509682644369-NordVPN-Kill-Switch-how-does-it-work

[^7_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^7_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^7_8]: https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands

[^7_9]: https://www.reddit.com/r/Ubuntu/comments/1ghzw1j/ubuntu_24_rdp_access_control/

[^7_10]: https://serverstadium.com/knowledge-base/securing-ubuntu-with-ufw/

[^7_11]: https://www.krypt.com/knowledgebase/45/How-to-allow-firewall-UbuntuorDebian-based-systems-using-UFW.html

[^7_12]: https://99rdp.com/uncomplicated-firewall-simplified-how-to-set-up-and-control-your-firewall/

[^7_13]: https://www.techradar.com/vpn/how-to-enabledisable-the-nordvpn-kill-switch

[^7_14]: https://docs.cloud.google.com/compute/docs/connect/ssh-best-practices/network-access

[^7_15]: https://documentation.ubuntu.com/server/how-to/security/firewalls/

[^7_16]: https://miro.com/blog/gcp-security-best-practices/

[^7_17]: https://serverspace.io/support/help/basic-commands-ufw/

[^7_18]: https://www.reddit.com/r/nordvpn/comments/qf0umz/turn_off_actual_killswitch_on_linux/

[^7_19]: https://www.sysdig.com/learn-cloud-native/24-google-cloud-platform-gcp-security-best-practices

[^7_20]: https://www.cherryservers.com/blog/how-to-configure-ubuntu-firewall-with-ufw

[^7_21]: https://github.com/NordSecurity/nordvpn-linux/issues/406

[^7_22]: https://docs.cloud.google.com/compute/docs/connect/ssh-best-practices

[^7_23]: https://support.nordvpn.com/hc/en-us/articles/25202605194257-Invisibility-on-a-local-network-why-we-had-to-build-a-broken-feature

[^7_24]: https://cloud.google.com/security/best-practices

[^7_25]: https://support.nordvpn.com/hc/en-us/articles/20196094470929-Installing-NordVPN-on-Linux-distributions

[^7_26]: https://www.reddit.com/r/googlecloud/comments/17rdzbi/whats_the_most_secure_way_to_run_a_workload_in_gcp/


---

# hilliersm@2023-Cyberpower-Prebuilt:~\$ sudo ufw status numbered

Status: active

     To                         Action      From
     --                         ------      ----
    [ 1] 1714:1764/udp              ALLOW IN    Anywhere
[ 2] 1714:1764/tcp              ALLOW IN    Anywhere
[ 3] 22/tcp (v6)                ALLOW IN    Anywhere (v6)
[ 4] 3389/tcp (v6)              ALLOW IN    Anywhere (v6)
[ 5] 5900/tcp (v6)              ALLOW IN    Anywhere (v6)
[ 6] 1714:1764/udp (v6)         ALLOW IN    Anywhere (v6)
[ 7] 1714:1764/tcp (v6)         ALLOW IN    Anywhere (v6)

hilliersm@2023-Cyberpower-Prebuilt:~\$

Cybersecurity and firewalls in general, there are a lot of random numbers and I have no idea what they mean, or what the ALLOW IN or Anywhere and (v6) means

Great, that output is exactly what we need.

You’re right: it *looks* like random numbers. One concept at a time:

- A **port number** (e.g., 22, 3389, 5900, 1714–1764) is like an apartment number inside your computer; it tells incoming traffic *which service/app* it wants.[^8_1][^8_2]
- In UFW:
    - **ALLOW IN** = “let traffic *into* this machine on that port.”
    - **Anywhere** = “from any IP address (0.0.0.0/0).”
    - **(v6)** = the same rule but for IPv6 addresses instead of IPv4.[^8_3][^8_1]

So right now:

- KDE Connect ports (1714–1764) are open from anywhere (IPv4 + IPv6).
- SSH/RDP/VNC are still open on IPv6 only, which is *still* a risk.[^8_4][^8_1]

Next tiny, safe step (clean up the IPv6 rules the same way):

```bash
sudo ufw delete 3
sudo ufw delete 3
sudo ufw delete 3
```

That will remove the IPv6 rules for 22, 3389, 5900 (because each time, rule 3 becomes the next one).[^8_1]

After running those, paste `sudo ufw status numbered` again.

Question to check understanding:
In your own words, what does “ALLOW IN 1714:1764/udp from Anywhere” do on your machine?
<span style="display:none">[^8_5][^8_6]</span>

<div align="center">⁂</div>

[^8_1]: https://help.ubuntu.com/community/UFW

[^8_2]: https://documentation.ubuntu.com/server/how-to/security/firewalls/

[^8_3]: https://www.zenarmor.com/docs/network-security-tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu

[^8_4]: https://userbase.kde.org/KDEConnect

[^8_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^8_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md


---

# Okay well first before I run that command what is IPv4 and IPV6 and what is the difference?

Why do some have v6 while others dont?

Good pause, this is exactly the right question.

One concept only:

- **IP address** = your device’s “street address” on a network.
    - **IPv4**: old style, looks like `192.168.1.10` (4 numbers with dots). Limited number of addresses.[^9_1][^9_2]
    - **IPv6**: newer, much bigger space, looks like `2001:0db8::1` (hex with colons). Designed so the internet doesn’t run out of addresses and has better built‑in features.[^9_3][^9_2][^9_4]

Why some rules have `(v6)` and some don’t:

- UFW manages **both** IPv4 and IPv6.
- A rule without `(v6)` is for IPv4.
- A rule with `(v6)` is the IPv6 version of that same idea.[^9_5][^9_6][^9_7]
- When you originally allowed ports, UFW created both IPv4 and IPv6 rules, which is why you see duplicates with `(v6)`.[^9_6][^9_5]

For your box, you want **both** IPv4 and IPv6 locked down; otherwise someone could reach you via IPv6 even if IPv4 looks safe.[^9_8][^9_6]

Given that: are you okay now to remove the remaining IPv6 rules for 22/3389/5900 with:

```bash
sudo ufw delete 3
sudo ufw delete 3
sudo ufw delete 3
```

What part of the IPv4 vs IPv6 idea still feels fuzzy in your own words?
<span style="display:none">[^9_10][^9_11][^9_12][^9_13][^9_14][^9_15][^9_16][^9_17][^9_18][^9_19][^9_20][^9_21][^9_22][^9_23][^9_9]</span>

<div align="center">⁂</div>

[^9_1]: https://aws.amazon.com/compare/the-difference-between-ipv4-and-ipv6/

[^9_2]: https://www.siteground.com/kb/ipv4-vs-ipv6/

[^9_3]: https://www.geeksforgeeks.org/computer-networks/differences-between-ipv4-and-ipv6/

[^9_4]: https://www.thousandeyes.com/learning/techtorials/ipv4-vs-ipv6

[^9_5]: https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands

[^9_6]: https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu

[^9_7]: https://bluevps.com/blog/complete-ufw-firewall-guide-for-ubuntu

[^9_8]: https://mangohost.net/blog/ufw-essentials-common-linux-firewall-rules-and-commands/

[^9_9]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^9_10]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^9_11]: https://help.ubuntu.com/community/UFW

[^9_12]: https://www.reddit.com/r/HomeNetworking/comments/1jcfvfl/can_someone_explain_like_im_5_the_difference/

[^9_13]: https://www.youtube.com/watch?v=ThdO9beHhpA

[^9_14]: https://kinsta.com/blog/ipv4-vs-ipv6/

[^9_15]: http://jonasbn.github.io/til/ufw/disable_or_enable_ipv6.html

[^9_16]: https://www.hpe.com/us/en/what-is/ipv4-vs-ipv6.html

[^9_17]: https://austinsnerdythings.com/2021/09/13/ipv6/

[^9_18]: https://serverspace.io/support/help/basic-commands-ufw/

[^9_19]: https://www.youtube.com/watch?v=LMOcRYmV4Lc

[^9_20]: https://gist.github.com/reanim8ed/6fe1e880e9c8c5252a6e94112733171b

[^9_21]: https://linuxsecurity.com/news/firewall/audit-ufw-rules

[^9_22]: https://wiki.archlinux.org/title/Uncomplicated_Firewall

[^9_23]: https://www.simplilearn.com/tutorials/cyber-security-tutorial/difference-between-ipv4-and-ipv6


---

# Quick side note please ike cut your response lenghts in hyalf, these responses are way to long for me trying to learn everything lol.


---

No it makes sense now, should i learn about what improvements v6 has over ipv4 or thats something I will learn later?

Got it, will keep responses much shorter.

For your GCP ML / security goals **right now**:

- Knowing “IPv4 vs IPv6 = two address families; firewall must cover both” is enough.[^10_1][^10_2]
- Deep IPv6 improvements (header format, neighbor discovery, etc.) can come later when you do more networking or cloud security.[^10_2][^10_3]

So we can park IPv6 details for now and just treat it as “also needs rules.”

Next action step: are you ready to run the three `sudo ufw delete 3` commands and paste the new `sudo ufw status numbered`?
<span style="display:none">[^10_4][^10_5]</span>

<div align="center">⁂</div>

[^10_1]: https://aws.amazon.com/compare/the-difference-between-ipv4-and-ipv6/

[^10_2]: https://www.siteground.com/kb/ipv4-vs-ipv6/

[^10_3]: https://www.simplilearn.com/tutorials/cyber-security-tutorial/difference-between-ipv4-and-ipv6

[^10_4]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^10_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md


---

# hilliersm@2023-Cyberpower-Prebuilt:~\$ sudo ufw status numbered

Status: active

     To                         Action      From
     --                         ------      ----
    [ 1] 1714:1764/udp              ALLOW IN    Anywhere
[ 2] 1714:1764/tcp              ALLOW IN    Anywhere
[ 3] 1714:1764/udp (v6)         ALLOW IN    Anywhere (v6)
[ 4] 1714:1764/tcp (v6)         ALLOW IN    Anywhere (v6)

hilliersm@2023-Cyberpower-Prebuilt:~\$

Nice, SSH/RDP/VNC are closed now; only KDE Connect ports are open (still too wide, but we’ll tighten them).[^11_1][^11_2]

Roadmap status:

1) Basics of ports/IP/firewall ✔
2) UFW cleanup ✔
3) Lock KDE Connect to LAN
4) Then handle NordVPN + remote GUI.

Next small step: we want KDE Connect allowed **only from your LAN subnet**, not “Anywhere”.[^11_2][^11_3][^11_1]

On Ubuntu, run:

```bash
ip -4 addr show
```

Look for a line like `inet 192.168.X.Y/24` or `10.X.Y.Z/24` on your main interface.

What IPv4 line do you see there (mask `/24` or similar)?
<span style="display:none">[^11_4][^11_5]</span>

<div align="center">⁂</div>

[^11_1]: https://help.ubuntu.com/community/UFW

[^11_2]: https://userbase.kde.org/KDEConnect

[^11_3]: https://www.reddit.com/r/HomeNetworking/comments/g6mhba/ufw_help_allow_only_from_lan/

[^11_4]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^11_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md


---

# Okay you also need to start teaching me why these commands do what they do, like I really want to LEARN not just follow you blindly please.

Totally fair, thanks for calling that out. I’ll keep things much shorter and explain *every* command.

Where we are:

- UFW cleaned up; only KDE Connect ports open.
- Next: lock KDE Connect to LAN.

Why `ip -4 addr show`?

- `ip` = network info tool.
- `-4` = “show IPv4 only.”
- `addr show` = “show my interfaces + their IPs.”[^12_1][^12_2]
We need your **local subnet** (like `192.168.1.0/24`) so we can tell UFW “only allow KDE Connect from this network.”[^12_3][^12_4][^12_5]

Action:

1. Run:

```bash
ip -4 addr show
```

2. Copy the line that looks like: `inet 192.168.X.Y/24` or `10.X.Y.Z/24`.

Question: when you see that `inet` line, what do you think that `/24` part is telling the firewall?
<span style="display:none">[^12_10][^12_11][^12_12][^12_13][^12_14][^12_15][^12_16][^12_17][^12_18][^12_19][^12_20][^12_21][^12_22][^12_6][^12_7][^12_8][^12_9]</span>

<div align="center">⁂</div>

[^12_1]: https://www.geeksforgeeks.org/linux-unix/ip-command-in-linux-with-examples/

[^12_2]: https://phoenixnap.com/kb/linux-ip-command-examples

[^12_3]: https://help.ubuntu.com/community/UFW

[^12_4]: https://www.zenarmor.com/docs/network-security-tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu

[^12_5]: https://maslosoft.com/kb/how-to-allow-connections-for-specific-ip-address-or-subnet-and-port-in-ufw/

[^12_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^12_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^12_8]: https://blogs.cisco.com/learning/exploring-the-linux-ip-command

[^12_9]: https://www.reddit.com/r/linux4noobs/comments/xzal74/what_does_ip_addr_show_exactly/

[^12_10]: https://dev.to/pikotutorial/how-to-read-ip-addr-output-on-linux-fnj

[^12_11]: https://userbase.kde.org/KDEConnect

[^12_12]: https://www.youtube.com/watch?v=wHfIFZlDxtU

[^12_13]: https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands

[^12_14]: https://www.reddit.com/r/kde/comments/1lcob41/kde_connect/

[^12_15]: https://access.redhat.com/sites/default/files/attachments/rh_ip_command_cheatsheet_1214_jcs_print.pdf

[^12_16]: https://answers.launchpad.net/gui-ufw/+question/295603

[^12_17]: https://github.com/NixOS/nixpkgs/issues/311448

[^12_18]: https://serverspace.io/support/help/basic-commands-ufw/

[^12_19]: https://en.opensuse.org/SDB:KDE_Connect

[^12_20]: https://www.reddit.com/r/HomeNetworking/comments/g6mhba/ufw_help_allow_only_from_lan/

[^12_21]: https://forum.kde.org/viewtopic.php%3Ff=18\&t=177685.html

[^12_22]: https://www.liquidweb.com/blog/blocking-ip-or-whitelisting-ip-addresses-with-ufw/


---

# I really do not know what the "/24" means.

inet 192.168.1.246/24 brd 192.168.1.255 scope global dynamic noprefixroute eno2

Perfect, that’s exactly the line needed.

One concept only:

- `192.168.1.246/24` means:
    - Your PC’s IP is `192.168.1.246`.
    - `/24` = “the first 24 bits are the network,” i.e. the whole LAN is `192.168.1.0` to `192.168.1.255` (a /24 subnet).[^13_1][^13_2]
    - So your **LAN subnet** is `192.168.1.0/24`.

Goal: tell UFW “allow KDE Connect only from 192.168.1.0/24, not the whole internet.”[^13_3][^13_4][^13_5]

Commands (and what they *mean*):

1) Delete current “Anywhere” KDE rules (IPv4 + IPv6):
```bash
sudo ufw delete 1   # remove 1714:1764/udp from Anywhere (IPv4)
sudo ufw delete 1   # remove 1714:1764/tcp from Anywhere (IPv4)
sudo ufw delete 1   # remove 1714:1764/udp from Anywhere (v6)
sudo ufw delete 1   # remove 1714:1764/tcp from Anywhere (v6)
```

Each `delete 1` removes the current first rule; the rest shift up.[^13_6][^13_3]

2) Re‑add rules but **restricted to your LAN**:
```bash
sudo ufw allow from 192.168.1.0/24 to any port 1714:1764 proto udp
sudo ufw allow from 192.168.1.0/24 to any port 1714:1764 proto tcp
```

Meaning: “only devices in 192.168.1.0/24 can reach these ports; everyone else blocked.”[^13_7][^13_3]

Then check:

```bash
sudo ufw status numbered
```

Run those, paste the new status, and then: in your own words, how is this safer than “Anywhere”?
<span style="display:none">[^13_8][^13_9]</span>

<div align="center">⁂</div>

[^13_1]: https://kinsta.com/blog/ipv4-vs-ipv6/

[^13_2]: https://dev.to/pikotutorial/how-to-read-ip-addr-output-on-linux-fnj

[^13_3]: https://help.ubuntu.com/community/UFW

[^13_4]: https://www.zenarmor.com/docs/network-security-tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu

[^13_5]: https://www.reddit.com/r/HomeNetworking/comments/g6mhba/ufw_help_allow_only_from_lan/

[^13_6]: https://serverspace.io/support/help/basic-commands-ufw/

[^13_7]: https://maslosoft.com/kb/how-to-allow-connections-for-specific-ip-address-or-subnet-and-port-in-ufw/

[^13_8]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^13_9]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md


---

# hilliersm@2023-Cyberpower-Prebuilt:~\$ sudo ufw status numbered

Status: active
hilliersm@2023-Cyberpower-Prebuilt:~\$

---

only way to access this pc is now through my LAN, im not 100% sure what a LAN is and what that implies though.

Perfect, and nice catch on response length, will keep it tight.

One concept now:

- **LAN (Local Area Network)** = all devices inside one small physical place on the same router/switch: your desktop, laptop, printer, TV, etc., at home/apartment.[^14_1][^14_2][^14_3]
- Your UFW defaults are: **deny all incoming, allow all outgoing**, and you currently have **no “ALLOW IN” rules at all**, so *nothing* can start a connection into this PC from anywhere (LAN or internet) unless UFW has a rule.[^14_4][^14_5][^14_6]

This means right now:

- KDE Connect will likely *not* work until we re-add LAN-only rules.
- But you are in a **safe** state: inbound is blocked, outbound is free.[^14_5][^14_7][^14_4]

Next micro-step (teaching + doing):
To re-allow KDE Connect from your LAN only, we’ll add rules back in a controlled way. Each rule will say “from `192.168.1.0/24` only, to ports 1714–1764”.[^14_8][^14_9][^14_4]

Commands (and what they *mean*):

```bash
sudo ufw allow from 192.168.1.0/24 to any port 1714:1764 proto udp
sudo ufw allow from 192.168.1.0/24 to any port 1714:1764 proto tcp
```

- `allow from 192.168.1.0/24` = only devices on your home LAN.
- `to any port 1714:1764` = KDE Connect’s port range.
- `proto udp` / `proto tcp` = only that protocol.[^14_9][^14_4][^14_8]

Then check:

```bash
sudo ufw status numbered
```

Run those three commands and paste the output.

Quick understanding check: in your own words, what’s the security difference between “ALLOW from 192.168.1.0/24” and “ALLOW from Anywhere”?
<span style="display:none">[^14_10][^14_11][^14_12][^14_13][^14_14][^14_15][^14_16][^14_17][^14_18][^14_19][^14_20][^14_21][^14_22][^14_23]</span>

<div align="center">⁂</div>

[^14_1]: https://www.cisco.com/site/us/en/learn/topics/networking/what-is-a-lan-local-area-network.html

[^14_2]: https://www.cloudflare.com/learning/network-layer/what-is-a-lan/

[^14_3]: https://www.cbtnuggets.com/blog/technology/networking/what-is-local-area-network

[^14_4]: https://help.ubuntu.com/community/UFW

[^14_5]: https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands

[^14_6]: https://www.cherryservers.com/blog/how-to-configure-ubuntu-firewall-with-ufw

[^14_7]: https://www.zenarmor.com/docs/network-security-tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu

[^14_8]: https://userbase.kde.org/KDEConnect

[^14_9]: https://maslosoft.com/kb/how-to-allow-connections-for-specific-ip-address-or-subnet-and-port-in-ufw/

[^14_10]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^14_11]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^14_12]: https://en.wikipedia.org/wiki/Local_area_network

[^14_13]: https://www.geeksforgeeks.org/computer-networks/lan-full-form/

[^14_14]: https://nilesecure.com/network-design/local-network

[^14_15]: https://www.cisco.com/c/en_uk/products/switches/what-is-a-lan-local-area-network.html

[^14_16]: https://en.opensuse.org/SDB:KDE_Connect

[^14_17]: https://discuss.kde.org/t/kde-connect-devices-on-same-network-not-visible/14444/2

[^14_18]: https://www.sophos.com/en-us/cybersecurity-explained/local-area-network-lan

[^14_19]: https://www.reddit.com/r/linuxquestions/comments/jvly0c/understanding_firewall_ufw_incoming_and_outgoing/

[^14_20]: https://www.reddit.com/r/kde/comments/1p4aimk/why_does_kdeconnect_require_both_devices_to_be_on/

[^14_21]: https://www.infoblox.com/glossary/lan-local-area-network/

[^14_22]: https://discuss.kde.org/t/my-devices-cant-see-each-other-on-kde-connect-any-idea-why/13432

[^14_23]: https://www.enterprisenetworkingplanet.com/standards-protocols/local-area-network-definition/


---

# hilliersm@2023-Cyberpower-Prebuilt:~\$ sudo ufw status numbered

Status: active

     To                         Action      From
     --                         ------      ----
    [ 1] 1714:1764/udp              ALLOW IN    192.168.1.0/24
[ 2] 1714:1764/tcp              ALLOW IN    192.168.1.0/24

hilliersm@2023-Cyberpower-Prebuilt:~\$

Nice, that’s exactly what we want.

What this means now:

- Only devices on `192.168.1.x` can talk to KDE Connect ports on this PC.
- Nothing else (internet, other networks) can start connections in, because defaults are deny incoming.[^15_1][^15_2][^15_3]

Roadmap check:

1) Ports/IP basics ✔
2) UFW locked down ✔
3) KDE Connect LAN-only ✔
4) Next: NordVPN + remote GUI (RDP-like) in a safer way.

Before we touch NordVPN/remote desktop: what part of UFW + LAN rules do you still feel shaky about, if any?
<span style="display:none">[^15_4][^15_5]</span>

<div align="center">⁂</div>

[^15_1]: https://help.ubuntu.com/community/UFW

[^15_2]: https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands

[^15_3]: https://www.zenarmor.com/docs/network-security-tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu

[^15_4]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^15_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md


---

# i do not know what ufw stands ofr or why we keep on using it.

does KDE have a name either?

Do we need to change anything on my laptop?

Great questions, this is exactly the “foundations” you want.

- **UFW** = *Uncomplicated FireWall*. It’s Ubuntu’s simple front-end for the kernel firewall (iptables/nftables). We use it because:
    - It’s already installed on Ubuntu.
    - It gives human-readable rules like `allow from 192.168.1.0/24` instead of low-level syntax.[^16_1][^16_2][^16_3]
- **KDE Connect** is just the app name; KDE originally stood for “K Desktop Environment,” now just “KDE.” It lets your devices on the same network talk (file share, clipboard, notifications), using ports 1714–1764.[^16_4][^16_5][^16_6]

Laptop side:

- If your laptop is **also on 192.168.1.x** and running KDE Connect, it should now be able to see the desktop (because we allowed that subnet).[^16_6][^16_4]
- You **don’t** need to change firewall rules on the laptop *unless* it has its own firewall blocking KDE Connect. Windows Defender Firewall often auto-opens rules when you allow KDE Connect on first run.[^16_5][^16_4]

Quick test you can do now:

- Make sure **both** laptop and desktop are on the same Wi‑Fi/ethernet.
- Open KDE Connect on both.
- See if the devices show up and can pair.

Question: when you read “UFW = Uncomplicated FireWall, front-end to the kernel firewall,” how would you describe its job in one short sentence?
<span style="display:none">[^16_7][^16_8]</span>

<div align="center">⁂</div>

[^16_1]: https://help.ubuntu.com/community/UFW

[^16_2]: https://www.zenarmor.com/docs/network-security-tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu

[^16_3]: https://www.cherryservers.com/blog/how-to-configure-ubuntu-firewall-with-ufw

[^16_4]: https://userbase.kde.org/KDEConnect

[^16_5]: https://en.opensuse.org/SDB:KDE_Connect

[^16_6]: https://discuss.kde.org/t/kde-connect-devices-on-same-network-not-visible/14444/2

[^16_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^16_8]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md


---

# do i need to diable nordvpn? both devices are currently on Dedicated ip right now or does that not affect it?

still cant see anything

Short answer for KDE Connect: **yes, NordVPN can absolutely break it.**

One concept:

- KDE Connect finds devices by sending “who’s around?” broadcasts on the **local network**.[^17_1][^17_2][^17_3]
- NordVPN can:
    - Route traffic through the VPN so local broadcasts don’t reach other devices.
    - Enable “invisibility on LAN” / local network blocking so other devices can’t see you at all.[^17_4][^17_5][^17_6]

So if both devices are on NordVPN, they may **not** see each other even though UFW is correct.

Fast test (learning + doing):

1. On **both** desktop and laptop, temporarily:
    - Disconnect NordVPN.
2. Make sure both are on the same router (same `192.168.1.x` network).
3. Open KDE Connect on both and check if they see each other.[^17_7][^17_1]

If that works with VPN off, then the next step will be:

- Turn NordVPN back on and enable its “LAN discovery / allow local network” feature so local devices can still talk while the VPN is active.[^17_8][^17_9][^17_10]

Question: after turning NordVPN off on both machines and trying again, do the KDE Connect apps now see each other?
<span style="display:none">[^17_11][^17_12][^17_13][^17_14][^17_15][^17_16][^17_17][^17_18][^17_19][^17_20][^17_21][^17_22][^17_23]</span>

<div align="center">⁂</div>

[^17_1]: https://userbase.kde.org/KDEConnect

[^17_2]: https://www.reddit.com/r/kde/comments/1p4aimk/why_does_kdeconnect_require_both_devices_to_be_on/

[^17_3]: https://forums.opensuse.org/t/kde-connect-what-network/188972

[^17_4]: https://support.nordvpn.com/hc/en-us/articles/25202605194257-Invisibility-on-a-local-network-why-we-had-to-build-a-broken-feature

[^17_5]: https://www.reddit.com/r/nordvpn/comments/horsc1/nordvpn_invisibility_on_lan_meaning/

[^17_6]: https://support.nordvpn.com/hc/en-us/articles/19472023025169-Installing-and-using-NordVPN-on-Windows-10-and-11

[^17_7]: https://discuss.kde.org/t/kde-connect-devices-on-same-network-not-visible/14444/2

[^17_8]: https://github.com/NordSecurity/nordvpn-linux/issues/406

[^17_9]: https://meshnet.nordvpn.com/features/explaining-permissions/local-network-permissions

[^17_10]: https://support.nordvpn.com/hc/en-us/articles/20196094470929-Installing-NordVPN-on-Linux-distributions

[^17_11]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^17_12]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^17_13]: https://www.reddit.com/r/kde/comments/vz7mte/is_there_a_way_to_use_kde_connect_while_using_a/

[^17_14]: https://forums.jeff.pro/t/how-to-get-kde-connect-manjaro-to-work-with-my-vpn-openvpn-on-linode/2433

[^17_15]: https://discuss.kde.org/t/kde-connect-problems-connecting/39789

[^17_16]: https://discussion.fedoraproject.org/t/kdeconnect-not-working-cannot-discover-devies-on-local-network/161581

[^17_17]: https://www.youtube.com/watch?v=qVOmdSXsD-s

[^17_18]: https://github.com/GrapheneOS/os-issue-tracker/issues/2639

[^17_19]: https://support.nordvpn.com/hc/en-us/articles/20225371443345-Staying-invisible-on-unsafe-local-networks-on-macOS

[^17_20]: https://airvpn.org/forums/topic/50459-i-want-to-be-able-to-use-kdeconnect-when-eddie-is-running/

[^17_21]: https://news.ycombinator.com/item?id=37730164

[^17_22]: https://discuss.kde.org/t/kde-connect-does-not-work-correctly-on-kde-neon/9497

[^17_23]: https://forum.kde.org/viewtopic.php%3Ff=18\&t=177685.html


---

# yes it does work now, finally

Nice, that means:

- UFW rules are correct.
- The blocker was purely NordVPN’s handling of local network traffic.[^18_1][^18_2]

Roadmap update:

1) UFW + LAN basics ✔
2) KDE Connect over LAN ✔
3) Next: NordVPN settings so you can use VPN **and** local network safely.

One concept:

- On both Linux and Windows, NordVPN has options like **“Allow LAN traffic” / “Invisibility on LAN” / “Local network discovery”**.[^18_3][^18_4][^18_5]
    - If “invisibility” is ON, KDE Connect breaks.
    - If “allow LAN/local network” is ON, KDE Connect can still work while VPN is connected.

Next micro-step, pick **one device** (Windows laptop is easier UI):

1. Open NordVPN on Windows.
2. Go to Settings → maybe “Kill Switch / Threat Protection / Local Network / Invisibility on LAN” section.
3. Look for a toggle about **local network / LAN visibility**.

Don’t change it yet—just tell me what options you see there related to LAN or local network.
<span style="display:none">[^18_6][^18_7]</span>

<div align="center">⁂</div>

[^18_1]: https://userbase.kde.org/KDEConnect

[^18_2]: https://www.reddit.com/r/kde/comments/vz7mte/is_there_a_way_to_use_kde_connect_while_using_a/

[^18_3]: https://support.nordvpn.com/hc/en-us/articles/25202605194257-Invisibility-on-a-local-network-why-we-had-to-build-a-broken-feature

[^18_4]: https://meshnet.nordvpn.com/features/explaining-permissions/local-network-permissions

[^18_5]: https://support.nordvpn.com/hc/en-us/articles/19472023025169-Installing-and-using-NordVPN-on-Windows-10-and-11

[^18_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^18_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md


---

# is this the right area?

Yes, perfect screen.

Key toggles there:

- **Stay invisible on LAN** – this must be **Off** so other devices (like your Ubuntu box) can see the laptop while VPN is on.[^19_1][^19_2][^19_3]
- **Allow remote access while connected to VPN** – lets RDP-like access reach the laptop via VPN; fine to keep On.[^19_3][^19_4]

Next steps on the laptop:

1. Make sure **Stay invisible on LAN = Off** (it already is in your screenshot).
2. Connect NordVPN (with your dedicated IP if you want).
3. With VPN on, check if KDE Connect still sees the desktop.

Question: after turning NordVPN back on (laptop + desktop), does KDE Connect still see and talk between the two?
<span style="display:none">[^19_5][^19_6][^19_7]</span>

<div align="center">⁂</div>

[^19_1]: https://support.nordvpn.com/hc/en-us/articles/25202605194257-Invisibility-on-a-local-network-why-we-had-to-build-a-broken-feature

[^19_2]: https://www.reddit.com/r/nordvpn/comments/horsc1/nordvpn_invisibility_on_lan_meaning/

[^19_3]: https://support.nordvpn.com/hc/en-us/articles/19472023025169-Installing-and-using-NordVPN-on-Windows-10-and-11

[^19_4]: https://meshnet.nordvpn.com/features/explaining-permissions/local-network-permissions

[^19_5]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^19_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/095661cc-f3d9-481f-a6b4-7fa1d16373e2/image.jpg

[^19_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md


---

# No still not working, also that is IP, do we need to know that or do something specific with that?

You’re doing great; this is the tricky VPN bit.

One concept:

- Your **NordVPN dedicated IP** (89.117.x.x) is the public address of the VPN server, not your home LAN IP. It doesn’t help KDE Connect; KDE still needs the 192.168.1.x network broadcasts.[^20_1][^20_2][^20_3]

Right now NordVPN is probably still blocking local discovery even with “Stay invisible on LAN” off on Windows, and the Linux client has its *own* local-network setting.[^20_4][^20_5][^20_6]

Next very small step (Linux desktop):

In a terminal, run:

```bash
nordvpn settings
```

and paste the output. This shows things like `LanDiscovery`, `Firewall`, `Killswitch` that we may need to toggle.[^20_7][^20_4]

Question: based on this, how would you describe the role of the dedicated IP in one short sentence (what it *is* vs. what it’s *not* doing for KDE Connect)?
<span style="display:none">[^20_10][^20_11][^20_8][^20_9]</span>

<div align="center">⁂</div>

[^20_1]: https://userbase.kde.org/KDEConnect

[^20_2]: https://www.reddit.com/r/kde/comments/vz7mte/is_there_a_way_to_use_kde_connect_while_using_a/

[^20_3]: https://news.ycombinator.com/item?id=37730164

[^20_4]: https://github.com/NordSecurity/nordvpn-linux/issues/406

[^20_5]: https://support.nordvpn.com/hc/en-us/articles/25202605194257-Invisibility-on-a-local-network-why-we-had-to-build-a-broken-feature

[^20_6]: https://meshnet.nordvpn.com/features/explaining-permissions/local-network-permissions

[^20_7]: https://support.nordvpn.com/hc/en-us/articles/20196094470929-Installing-NordVPN-on-Linux-distributions

[^20_8]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^20_9]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/b91541ae-265c-4c0d-a1ca-6feade61f4fc/image.jpg

[^20_10]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^20_11]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/095661cc-f3d9-481f-a6b4-7fa1d16373e2/image.jpg


---

# hilliersm@2023-Cyberpower-Prebuilt:~\$ nordvpn settings

Technology: NORDLYNX
Firewall: enabled
Firewall Mark: 0xe1f1
Routing: enabled
User Consent: enabled
Kill Switch: disabled
Threat Protection Lite: enabled
Notify: enabled
Tray: enabled
Auto-connect: enabled
Meshnet: disabled
DNS: disabled
LAN Discovery: disabled
Virtual Location: enabled
Post-quantum VPN: disabled
ARP Ignore: enabled
hilliersm@2023-Cyberpower-Prebuilt:~\$

---

idk its what others see as my IP or something? Like everything I do is first sent to that server adn then broadcasted from there making me leave a minimal trace or something?

Your description of the dedicated IP is basically right: it’s the stable public address of the **VPN server**, so sites see *that* instead of your home IP.[^21_1][^21_2][^21_3]

Key thing blocking KDE Connect now is this line:

- `LAN Discovery: disabled` → NordVPN is blocking local-network access even on your LAN.[^21_4][^21_5]

Next micro-step on **Ubuntu desktop**:

```bash
nordvpn set lan-discovery enabled
nordvpn settings
```

Make sure it now says `LAN Discovery: enabled`. Then, with NordVPN connected on both devices, test KDE Connect again.

Question: in your own words, what does “LAN Discovery: enabled” allow that was blocked before?
<span style="display:none">[^21_6][^21_7][^21_8][^21_9]</span>

<div align="center">⁂</div>

[^21_1]: https://support.nordvpn.com/hc/en-us/articles/32830477282449-How-to-start-using-NordVPN-dedicated-IP

[^21_2]: https://docs.cloud.google.com/compute/docs/connect/ssh-best-practices

[^21_3]: https://cloud.google.com/security/best-practices

[^21_4]: https://github.com/NordSecurity/nordvpn-linux/issues/406

[^21_5]: https://meshnet.nordvpn.com/features/explaining-permissions/local-network-permissions

[^21_6]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^21_7]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^21_8]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/095661cc-f3d9-481f-a6b4-7fa1d16373e2/image.jpg

[^21_9]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/b91541ae-265c-4c0d-a1ca-6feade61f4fc/image.jpg


---

# It stops Nordvpn blocking other devices that are on my Local area network so like my laptop or anything else connected to wifi at my moms house.

Exactly, nailed it.

“LAN Discovery: enabled” = NordVPN now lets devices on your local 192.168.1.x network see and talk to this machine again (within UFW rules).[^22_1][^22_2]

Where we are:

- UFW locked down and LAN-only for KDE Connect ✔[^22_3][^22_4]
- KDE Connect works with VPN off ✔[^22_5]
- NordVPN now allows LAN on Linux; Windows already had “Stay invisible on LAN: Off” ✔[^22_6][^22_7]

Next quick test (core of this step):

- Ensure NordVPN is **connected on both** laptop and desktop.
- Confirm `LAN Discovery: enabled` on desktop (`nordvpn settings`).
- Open KDE Connect on both and see if they discover each other and can pair/send a test ping or notification.

What happens now when you try that with VPNs on?
<span style="display:none">[^22_10][^22_11][^22_8][^22_9]</span>

<div align="center">⁂</div>

[^22_1]: https://github.com/NordSecurity/nordvpn-linux/issues/406

[^22_2]: https://meshnet.nordvpn.com/features/explaining-permissions/local-network-permissions

[^22_3]: https://help.ubuntu.com/community/UFW

[^22_4]: https://www.zenarmor.com/docs/network-security-tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu

[^22_5]: https://userbase.kde.org/KDEConnect

[^22_6]: https://support.nordvpn.com/hc/en-us/articles/25202605194257-Invisibility-on-a-local-network-why-we-had-to-build-a-broken-feature

[^22_7]: https://support.nordvpn.com/hc/en-us/articles/19472023025169-Installing-and-using-NordVPN-on-Windows-10-and-11

[^22_8]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^22_9]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^22_10]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/095661cc-f3d9-481f-a6b4-7fa1d16373e2/image.jpg

[^22_11]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/b91541ae-265c-4c0d-a1ca-6feade61f4fc/image.jpg


---

# still cant see anything

Yeah, this combo (NordVPN + KDE Connect) is finicky; you’ve already done the right fixes.

Key idea: KDE Connect really wants **plain local LAN**, not tunneled/VPN traffic. Many people simply accept:[^23_1][^23_2][^23_3]

- “KDE Connect works only when VPN is off (or paused)”
- and keep VPN on for browsing/remote stuff instead.[^23_4][^23_5]

Right now:

- Security is good (UFW locked, KDE ports LAN-only, NordVPN LAN discovery allowed).[^23_6][^23_7][^23_8]
- KDE Connect works with VPN off.
- With VPN on, it’s still blocked by how NordVPN handles routing, and working around that would get pretty advanced/annoying for small benefit (involving allowlists, adapter sharing, or Meshnet tricks).[^23_9][^23_10][^23_6]

Given your focus and ADHD, simplest *practical* rule of thumb:

- When you need KDE Connect: **pause/turn off NordVPN** on both briefly.
- When done: turn NordVPN back on.

That lets us move on to the bigger win for your goals: **safe remote GUI access via NordVPN + firewall**, which *is* very relevant to being a GCP ML engineer (thinking about exposed services, VPN entry points, etc.).[^23_11][^23_12][^23_13]

Before we pivot: how do you feel about *accepting* “KDE Connect only with VPN off” for now so we can spend your focus on getting secure remote desktop over NordVPN set up next?
<span style="display:none">[^23_14][^23_15][^23_16][^23_17][^23_18][^23_19][^23_20][^23_21][^23_22][^23_23][^23_24][^23_25][^23_26][^23_27][^23_28][^23_29][^23_30][^23_31]</span>

<div align="center">⁂</div>

[^23_1]: https://userbase.kde.org/KDEConnect

[^23_2]: https://discuss.kde.org/t/kde-connect-devices-on-same-network-not-visible/14444

[^23_3]: https://www.reddit.com/r/kde/comments/1p4aimk/why_does_kdeconnect_require_both_devices_to_be_on/

[^23_4]: https://discussion.fedoraproject.org/t/unable-to-use-kde-connect-with-nordvpn/71594

[^23_5]: https://www.reddit.com/r/kde/comments/vz7mte/is_there_a_way_to_use_kde_connect_while_using_a/

[^23_6]: https://github.com/NordSecurity/nordvpn-linux/issues/406

[^23_7]: https://help.ubuntu.com/community/UFW

[^23_8]: https://www.zenarmor.com/docs/network-security-tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu

[^23_9]: https://www.reddit.com/r/nordvpn/comments/1it7bho/cant_use_my_lannetwork_shares_when_connected/

[^23_10]: https://www.aazuspan.dev/blog/til-whitelisting-a-local-subnet-with-nordvpn/

[^23_11]: https://docs.cloud.google.com/architecture/framework/perspectives/ai-ml/security

[^23_12]: https://docs.cloud.google.com/compute/docs/connect/ssh-best-practices/network-access

[^23_13]: https://docs.cloud.google.com/compute/docs/connect/ssh-best-practices

[^23_14]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/57a93a70-cdde-4a33-9bdd-4e71181fb6f6/2025-12-21_device_specs_laptop.md

[^23_15]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_7d3c5f25-3ccf-441f-9467-14c3e0d6502b/c4c13eb0-f1a2-4082-b13d-20f4490b2472/2025-12-21_device_specs_gaming_pc.md

[^23_16]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/095661cc-f3d9-481f-a6b4-7fa1d16373e2/image.jpg

[^23_17]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/images/88317693/b91541ae-265c-4c0d-a1ca-6feade61f4fc/image.jpg

[^23_18]: https://discussion.fedoraproject.org/t/kdeconnect-not-working-cannot-discover-devies-on-local-network/161581

[^23_19]: https://support.nordvpn.com/hc/en-us/articles/20398047039889-I-can-t-connect-to-the-VPN-on-Linux

[^23_20]: https://support.nordvpn.com/hc/en-us/articles/20196094470929-Installing-NordVPN-on-Linux-distributions

[^23_21]: https://support.nordvpn.com/hc/en-us/articles/19472023025169-Installing-and-using-NordVPN-on-Windows-10-and-11

[^23_22]: https://support.nordvpn.com/hc/en-us/articles/20347784574097-Connecting-to-NordVPN-Linux-Network-Manager

[^23_23]: https://meshnet.nordvpn.com/features/explaining-permissions/local-network-permissions

[^23_24]: https://meshnet.nordvpn.com/features/explaining-permissions/traffic-routing-permissions

[^23_25]: https://forums.opensuse.org/t/nord-vpn-unable-to-connect-activated-and-immediately-deactivated/178274

[^23_26]: https://support.nordvpn.com/hc/en-us/articles/25202605194257-Invisibility-on-a-local-network-why-we-had-to-build-a-broken-feature

[^23_27]: https://www.reddit.com/r/kde/comments/wudbjf/need_help_kde_connect_cannot_find_device_in_the/

[^23_28]: https://github.com/GSConnect/gnome-shell-extension-gsconnect/issues/1550

[^23_29]: https://www.reddit.com/r/nordvpn/comments/16xq0wr/cannot_access_local_network_while_on_vpn/

[^23_30]: https://forum.kde.org/viewtopic.php%3Ff=18\&t=177685.html

[^23_31]: https://meshnet.nordvpn.com/features/routing-traffic-in-meshnet

