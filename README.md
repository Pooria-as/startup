<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VPN Gateway Setup Script</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 40px 20px;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 50px;
            text-align: center;
        }

        .header h1 {
            font-size: 3em;
            margin-bottom: 10px;
            animation: fadeInDown 0.8s ease;
        }

        .header p {
            font-size: 1.2em;
            opacity: 0.95;
            animation: fadeInUp 0.8s ease;
        }

        .badge-container {
            margin-top: 20px;
        }

        .badge {
            display: inline-block;
            padding: 8px 16px;
            margin: 5px;
            border-radius: 20px;
            font-size: 0.9em;
            font-weight: 500;
            background: rgba(255,255,255,0.2);
            backdrop-filter: blur(10px);
        }

        .content {
            padding: 40px 50px;
        }

        .section {
            margin-bottom: 40px;
            animation: fadeIn 0.6s ease;
        }

        .section h2 {
            color: #667eea;
            margin-bottom: 20px;
            font-size: 1.8em;
            border-left: 5px solid #667eea;
            padding-left: 15px;
        }

        .section h3 {
            color: #764ba2;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }

        .feature-card {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            padding: 20px;
            border-radius: 15px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .feature-card h3 {
            color: #667eea;
            margin-bottom: 10px;
        }

        .code-block {
            background: #2d2d2d;
            color: #f8f8f2;
            padding: 20px;
            border-radius: 10px;
            overflow-x: auto;
            font-family: 'Courier New', monospace;
            font-size: 0.9em;
            margin: 15px 0;
            position: relative;
        }

        .code-block pre {
            margin: 0;
        }

        .copy-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            background: #667eea;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.8em;
            transition: background 0.3s;
        }

        .copy-btn:hover {
            background: #764ba2;
        }

        .command {
            background: #f4f4f4;
            padding: 12px 18px;
            border-left: 4px solid #667eea;
            font-family: monospace;
            margin: 10px 0;
            border-radius: 5px;
        }

        .warning {
            background: #fff3cd;
            border-left: 4px solid #ffc107;
            padding: 15px;
            border-radius: 8px;
            margin: 20px 0;
        }

        .success {
            background: #d4edda;
            border-left: 4px solid #28a745;
            padding: 15px;
            border-radius: 8px;
            margin: 20px 0;
        }

        .info {
            background: #d1ecf1;
            border-left: 4px solid #17a2b8;
            padding: 15px;
            border-radius: 8px;
            margin: 20px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #667eea;
            color: white;
        }

        tr:hover {
            background: #f5f5f5;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .footer {
            background: #2d2d2d;
            color: white;
            text-align: center;
            padding: 30px;
        }

        @media (max-width: 768px) {
            .content {
                padding: 20px;
            }
            .header h1 {
                font-size: 2em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🚀 VPN Gateway Setup Script</h1>
            <p>Automatic VPN routing, firewall configuration & gateway management</p>
            <div class="badge-container">
                <span class="badge">🐧 Linux</span>
                <span class="badge">🔐 OpenVPN</span>
                <span class="badge">🛡️ IPTables</span>
                <span class="badge">🌐 WireGuard Ready</span>
                <span class="badge">⚡ Auto Routing</span>
            </div>
        </div>

        <div class="content">
            <div class="section">
                <h2>📖 Overview</h2>
                <p>This powerful bash script automatically configures a VPN gateway server with advanced routing, firewall rules, and multi-VPN support. Perfect for creating a secure VPN gateway, proxy server, or network router.</p>
                
                <div class="feature-grid">
                    <div class="feature-card">
                        <h3>🎯 Auto Configuration</h3>
                        <p>Automatically detects network interfaces and sets up routing tables</p>
                    </div>
                    <div class="feature-card">
                        <h3>🔄 Multi-VPN Support</h3>
                        <p>Handles multiple VPN connections (OpenVPN, WireGuard, Cisco AnyConnect)</p>
                    </div>
                    <div class="feature-card">
                        <h3>🛡️ Firewall Rules</h3>
                        <p>Configures iptables for NAT, forwarding, and security</p>
                    </div>
                    <div class="feature-card">
                        <h3>📊 Routing Tables</h3>
                        <p>Custom routing table (DIRECT) for advanced traffic management</p>
                    </div>
                </div>
            </div>

            <div class="section">
                <h2>✨ Features</h2>
                <ul>
                    <li>✅ Automatic network interface detection</li>
                    <li>✅ Custom routing table creation (200 DIRECT)</li>
                    <li>✅ OpenVPN & OCserv auto-start</li>
                    <li>✅ IP forwarding enablement</li>
                    <li>✅ NAT masquerading for VPN traffic</li>
                    <li>✅ Bidirectional traffic forwarding between interfaces</li>
                    <li>✅ DNS configuration (Google DNS servers)</li>
                    <li>✅ Persistent sysctl settings</li>
                    <li>✅ Error handling and validation</li>
                </ul>
            </div>

            <div class="section">
                <h2>🚀 Quick Install</h2>
                <div class="code-block">
                    <button class="copy-btn" onclick="copyToClipboard(this)">Copy</button>
                    <pre><code>git clone https://github.com/yourusername/vpn-gateway-setup.git
cd vpn-gateway-setup
chmod +x setup.sh
sudo ./setup.sh</code></pre>
                </div>
            </div>

            <div class="section">
                <h2>📋 Prerequisites</h2>
                <table>
                    <tr>
                        <th>Requirement</th>
                        <th>Details</th>
                    </tr>
                    <tr>
                        <td>Operating System</td>
                        <td>Ubuntu 20.04+, Debian 11+, CentOS 8+</td>
                    </tr>
                    <tr>
                        <td>Root Access</td>
                        <td>sudo privileges required</td>
                    </tr>
                    <tr>
                        <td>OpenVPN Config</td>
                        <td>/root/root.ovpn file</td>
                    </tr>
                    <tr>
                        <td>Network</td>
                        <td>At least one network interface (eth0, tun0, tun1)</td>
                    </tr>
                </table>
            </div>

            <div class="section">
                <h2>🔧 Configuration</h2>
                <div class="info">
                    <strong>💡 Custom Routes:</strong> Uncomment and modify the static routes section in the script
                </div>
                <div class="code-block">
                    <button class="copy-btn" onclick="copyToClipboard(this)">Copy</button>
                    <pre><code># Example static routes (uncomment if needed)
# ip route add 192.168.1.3 via 172.25.0.1 dev eth0
# ip route add 91.224.110.37 via 172.25.0.1 dev eth0</code></pre>
                </div>
            </div>

            <div class="section">
                <h2>📊 Network Architecture</h2>
                <div class="code-block">
                    <pre><code>Internet
    ↓
[eth0] (Public Interface)
    ↓
[VPN Gateway]
    ↓
[tun0] (VPN Tunnel)
    ↓
[Internal Network]</code></pre>
                </div>
            </div>

            <div class="section">
                <h2>🛠️ Manual Usage</h2>
                <div class="command"># Start OpenVPN manually</div>
                <div class="code-block">
                    <button class="copy-btn" onclick="copyToClipboard(this)">Copy</button>
                    <pre><code>nohup openvpn --config /path/to/config.ovpn &</code></pre>
                </div>
                
                <div class="command"># Check routing table</div>
                <div class="code-block">
                    <button class="copy-btn" onclick="copyToClipboard(this)">Copy</button>
                    <pre><code>ip route show table DIRECT</code></pre>
                </div>
                
                <div class="command"># View iptables rules</div>
                <div class="code-block">
                    <button class="copy-btn" onclick="copyToClipboard(this)">Copy</button>
                    <pre><code>iptables -L -v -n
iptables -t nat -L -v -n</code></pre>
                </div>
            </div>

            <div class="section">
                <h2>⚠️ Troubleshooting</h2>
                <div class="warning">
                    <strong>🔍 Interface not found:</strong><br>
                    Ensure VPN is connected before running the script. Add longer sleep time if needed.
                </div>
                <div class="warning">
                    <strong>🔍 Permission denied:</strong><br>
                    Run the script with sudo or as root user.
                </div>
                <div class="warning">
                    <strong>🔍 DNS not working:</strong><br>
                    Check /etc/resolv.conf or use systemd-resolved.
                </div>
            </div>

            <div class="section">
                <h2>📈 Performance Tips</h2>
                <ul>
                    <li>🚀 Increase sleep time for slower VPN connections</li>
                    <li>🔧 Use autossh for persistent SSH tunnels (commented in script)</li>
                    <li>📊 Monitor interface traffic with <code>iftop</code> or <code>nethogs</code></li>
                    <li>💾 Save iptables rules: <code>iptables-save > /etc/iptables/rules.v4</code></li>
                </ul>
            </div>

            <div class="section">
                <h2>🔐 Security Notes</h2>
                <div class="success">
                    ✅ IP forwarding enabled for routing<br>
                    ✅ NAT masquerade hides internal network<br>
                    ✅ Custom routing table for traffic segregation<br>
                    ✅ VPN encryption protects data in transit
                </div>
            </div>

            <div class="section">
                <h2>📦 Services Managed</h2>
                <table>
                    <tr>
                        <th>Service</th>
                        <th>Description</th>
                        <th>Config Location</th>
                    </tr>
                    <tr>
                        <td>OpenVPN</td>
                        <td>Main VPN connection</td>
                        <td>/root/root.ovpn</td>
                    </tr>
                    <tr>
                        <td>OCserv</td>
                        <td>Cisco AnyConnect compatible server</td>
                        <td>/etc/ocserv/</td>
                    </tr>
                    <tr>
                        <td>IPTables</td>
                        <td>Firewall & NAT rules</td>
                        <td>Runtime configuration</td>
                    </tr>
                </table>
            </div>

            <div class="section">
                <h2>🔄 Updating</h2>
                <div class="code-block">
                    <button class="copy-btn" onclick="copyToClipboard(this)">Copy</button>
                    <pre><code>git pull origin main
sudo ./setup.sh</code></pre>
                </div>
            </div>

            <div class="section">
                <h2>📝 License</h2>
                <p>MIT License - Free for personal and commercial use</p>
            </div>

            <div class="section">
                <h2>👥 Contributing</h2>
                <p>Pull requests are welcome! For major changes, please open an issue first.</p>
                <div class="command"># Fork, clone, and create a feature branch</div>
                <div class="code-block">
                    <button class="copy-btn" onclick="copyToClipboard(this)">Copy</button>
                    <pre><code>git checkout -b feature/amazing-feature
git commit -m 'Add amazing feature'
git push origin feature/amazing-feature</code></pre>
                </div>
            </div>
        </div>

        <div class="footer">
            <p>Made with ❤️ for secure VPN gateways</p>
            <p style="margin-top: 10px; font-size: 0.9em;">⭐ Star this repo if it helped you!</p>
        </div>
    </div>

    <script>
        function copyToClipboard(button) {
            const codeBlock = button.parentElement;
            const code = codeBlock.querySelector('pre').innerText;
            navigator.clipboard.writeText(code).then(() => {
                button.textContent = 'Copied!';
                setTimeout(() => {
                    button.textContent = 'Copy';
                }, 2000);
            });
        }
    </script>
</body>
</html>
