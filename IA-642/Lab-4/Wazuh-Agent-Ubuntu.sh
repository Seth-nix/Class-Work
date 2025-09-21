#!/bin/bash
# Wazuh Agent installation on Ubuntu Target
# Replace <MANAGER_IP> and <AGENT_NAME> accordingly

sudo -i

# Download and install Wazuh agent
wget https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.12.0-1_amd64.deb
sudo WAZUH_MANAGER='<MANAGER_IP>' WAZUH_AGENT_NAME='<AGENT_NAME>' dpkg -i ./wazuh-agent_4.12.0-1_amd64.deb

# Enable and start agent
systemctl daemon-reload
systemctl enable wazuh-agent
systemctl start wazuh-agent