#!/bin/bash

# Check if rt_tables exists, create if not, then add DIRECT table if missing
RT_TABLES="/etc/iproute2/rt_tables"

# Create directory if it doesn't exist (for iproute2)
if [ ! -d "/etc/iproute2" ]; then
    mkdir -p /etc/iproute2
fi

# Create file if it doesn't exist
if [ ! -f "$RT_TABLES" ]; then
    echo "# Reserved values" > "$RT_TABLES"
    echo "0       unspec" >> "$RT_TABLES"
    echo "255     local" >> "$RT_TABLES"
    echo "254     main" >> "$RT_TABLES"
    echo "253     default" >> "$RT_TABLES"
fi

# Add DIRECT table only if not already present
if ! grep -q "^200[[:space:]]\+DIRECT" "$RT_TABLES"; then
    echo "200     DIRECT" >> "$RT_TABLES"
    echo "Added DIRECT table (200) to $RT_TABLES"
else
    echo "DIRECT table already exists in $RT_TABLES"
fi

# Start services
service openvpn start
service ocserv start

# Start OpenVPN with root.ovpn
nohup openvpn --config /root/root.ovpn &

# Wait for VPN to establish
echo "Waiting for VPN connection..."
sleep 8

# Set DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 4.2.2.4" >> /etc/resolv.conf

# Get interface info
IFACE=$(ip route | grep "^default" | awk '{print $5}' | head -n 1)

if [ -z "$IFACE" ]; then
    echo "Error: No default interface found"
    exit 1
fi

GW_IP=$(ip route | grep "^default.*dev $IFACE" | awk '{print $3}' | head -n 1)
MY_IP=$(ip addr show dev "$IFACE" | grep "inet " | awk '{print $2}' | cut -d/ -f1 | head -n 1)

# Add routes if we have the info
if [ -n "$GW_IP" ] && [ -n "$MY_IP" ]; then
    ip route add default via "$GW_IP" dev "$IFACE" table DIRECT 2>/dev/null || true
    ip rule add from "$MY_IP" table DIRECT prio 0 2>/dev/null || true
    echo "Routing configured for $IFACE ($MY_IP -> $GW_IP)"
else
    echo "Warning: Could not configure routing"
fi

# Enable IP forwarding
sysctl -w net.ipv4.ip_forward=1

# Wait for tun interfaces
sleep 2

# Setup iptables (with error handling)
if ip link show tun1 > /dev/null 2>&1 && ip link show tun0 > /dev/null 2>&1; then
    iptables -A FORWARD -i tun1 -o tun0 -j ACCEPT 2>/dev/null || true
    iptables -A FORWARD -i tun0 -o tun1 -j ACCEPT 2>/dev/null || true
    iptables -t nat -A POSTROUTING -o tun1 -j MASQUERADE 2>/dev/null || true
fi

if ip link show eth0 > /dev/null 2>&1 && ip link show tun0 > /dev/null 2>&1; then
    iptables -A FORWARD -i eth0 -o tun0 -j ACCEPT 2>/dev/null || true
    iptables -A FORWARD -i tun0 -o eth0 -j ACCEPT 2>/dev/null || true
    iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE 2>/dev/null || true
fi

echo "Setup complete"
