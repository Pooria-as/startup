# 🚀 VPN Gateway Setup Script

> Automatic VPN routing, firewall configuration & gateway management

![Bash](https://img.shields.io/badge/Bash-4.4+-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![OpenVPN](https://img.shields.io/badge/OpenVPN-EA7E20?style=for-the-badge&logo=openvpn&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

---

## 📖 Overview

This powerful bash script automatically configures a VPN gateway server with advanced routing, firewall rules, and multi-VPN support. Perfect for creating a secure VPN gateway, proxy server, or network router.

### ✨ Features

| Feature | Description |
|---------|-------------|
| 🎯 **Auto Configuration** | Automatically detects network interfaces and sets up routing tables |
| 🔄 **Multi-VPN Support** | Handles OpenVPN, WireGuard, and Cisco AnyConnect |
| 🛡️ **Firewall Rules** | Configures iptables for NAT, forwarding, and security |
| 📊 **Custom Routing** | Creates DIRECT table (200) for advanced traffic management |
| 🔧 **DNS Setup** | Automatically configures Google DNS servers |
| 💾 **Persistent Settings** | Saves sysctl and routing configurations |

---

## 🚀 Quick Install

```bash
# Clone the repository
git clone https://github.com/yourusername/vpn-gateway-setup.git
cd vpn-gateway-setup

# Make executable and run
chmod +x setup.sh
sudo ./setup.sh
