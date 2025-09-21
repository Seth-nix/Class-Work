# Install

sudo -i
apt update && apt -y upgrade
curl -sO https://packages.wazuh.com/4.12/wazuh-install.sh
bash ./wazuh-install.sh -a -i
tar -O -xvf wazuh-install-files.tar wazuh-install-files/wazuh-passwords.txt
systemctl status wazuh-manager
systemctl status wazuh-indexer
systemctl status wazuh-dashboard
systemctl status filebeat

# Find password for dashboard

tar -O -xvf wazuh-install-files.tar wazuh-install-files/wazuh-passwords.txt | grep -A2 "Admin user"
