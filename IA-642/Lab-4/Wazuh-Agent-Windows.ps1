# Wazuh Agent installation on Windows Server 2022
# Replace <MANAGER_IP> and <AGENT_NAME> accordingly

Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.12.0-1.msi -OutFile $env:tmp\wazuh-agent
msiexec.exe /i $env:tmp\wazuh-agent /q WAZUH_MANAGER='<MANAGER_IP>' WAZUH_AGENT_NAME='<AGENT_NAME>'

# Start Wazuh service
NET START WazuhSvc