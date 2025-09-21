#!/bin/bash
# Wazuh Manager Installation (All-in-One)
# Replace <MANAGER_IP> with your static IP for this VM

sudo -i

# Update system
apt update && apt -y upgrade

# Download and run Wazuh installer
curl -sO https://packages.wazuh.com/4.12/wazuh-install.sh
bash ./wazuh-install.sh -a

# Extract dashboard passwords
tar -O -xvf wazuh-install-files.tar wazuh-install-files/wazuh-passwords.txt

# Ensure Wazuh services are running
systemctl daemon-reexec
systemctl enable wazuh-manager wazuh-indexer wazuh-dashboard filebeat
systemctl start wazuh-manager wazuh-indexer wazuh-dashboard filebeat

# Configure netplan static IP for enp0s8
cat <<EOF > /etc/netplan/01-enp0s8.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s8:
      dhcp4: no
      addresses:
        - <MANAGER_IP>/24
      routes:
        - to: 0.0.0.0/0
          via: <GATEWAY_IP>
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]
EOF

chmod 600 /etc/netplan/01-enp0s8.yaml
netplan apply