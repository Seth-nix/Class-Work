#!/bin/bash
# Kali Attack Simulation for Wazuh Lab (Part D)
# Replace <LINUX_TARGET_IP> and <WINDOWS_TARGET_IP> accordingly

echo "[*] Simulating failed SSH logins on Linux target..."
printf "Wrong1\nWrong2\nWrong3\n" > /tmp/bad.txt
hydra -l testuser -P /tmp/bad.txt ssh://<LINUX_TARGET_IP> -V

echo "[*] Simulating sudo abuse on Linux target..."
for i in {1..3}; do sudo -k; sudo -S id; done

echo "[*] Scanning remote services for lateral movement..."
nmap -sS -sV -p 22,135,139,445,3389 <TARGET_IP>

echo "[*] Simulating failed RDP logins on Windows target..."
xfreerdp /u:testuser /p:WrongPass /v:<WINDOWS_TARGET_IP> /cert:ignore