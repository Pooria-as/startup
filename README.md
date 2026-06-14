# 🚀 Startup Scripts Collection

> Essential automation scripts for Linux servers, VPN gateways, and network configuration

![Bash](https://img.shields.io/badge/Bash-4.4+-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![OpenVPN](https://img.shields.io/badge/OpenVPN-EA7E20?style=for-the-badge&logo=openvpn&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)
![GitHub](https://img.shields.io/badge/GitHub-Pooria--as-181717?style=for-the-badge&logo=github)

---

## 📖 Overview

A collection of powerful bash scripts for automating server setup, VPN gateway configuration, and network management. Perfect for:

- 🖥️ **Server initialization**
- 🔐 **VPN gateway setup**
- 🌐 **Network routing & firewall**
- ⚡ **Quick deployment**

---

## 📦 Scripts Included

| Script | Purpose | Status |
|--------|---------|--------|
| `setup.sh` | VPN gateway with routing & iptables | ✅ Stable |
| More coming soon | ... | 🚧 WIP |

### Current Script: VPN Gateway Setup

This script automatically configures a VPN gateway server with:
- ✅ Custom routing table (200 DIRECT)
- ✅ OpenVPN & OCserv auto-start
- ✅ IP forwarding & NAT masquerading
- ✅ Automatic interface detection
- ✅ Bidirectional traffic forwarding

---

## 🚀 Quick Install

```bash
# Clone the repository
git clone https://github.com/Pooria-as/startup.git
cd startup

# Make script executable
chmod +x setup.sh

# Run as root
sudo ./setup.sh
