#!/bin/bash

# Get client IP
CLIENT_IP=${NCAT_REMOTE_ADDR:-"unknown"}

# Show SSH banner
echo "SSH-2.0-OpenSSH_8.9p1 Ubuntu-3ubuntu0.1"
echo "Welcome to Ubuntu 22.04.1 LTS (GNU/Linux 5.15.0-56-generic x86_64)"
echo "Last login: $(date -d "yesterday" "+%a %b %d %H:%M:%S %Y") from 192.168.1.1"

# First login attempt
echo -n "login as: "
read -r username

if [ -z "$username" ]; then
    echo "Permission denied, please try again."
    exit 1
fi

echo -n "$username@$(hostname)'s password: "
read -rs password
echo

# Log first attempt
echo "[$(date '+%Y-%m-%d %H:%M:%S')] IP: $CLIENT_IP --- Username: $username --- Password: $password" >> "logs/ssh_attempts.log"

# Second login attempt
echo "Permission denied, please try again."
echo -n "login as: "
read -r username2

if [ -z "$username2" ]; then
    echo "Permission denied, please try again."
    exit 1
fi

echo -n "$username2@$(hostname)'s password: "
read -rs password2
echo

# Log second attempt
echo "[$(date '+%Y-%m-%d %H:%M:%S')] IP: $CLIENT_IP --- Username: $username2 --- Password: $password2" >> "logs/ssh_attempts.log"

# Final rejection
echo "Permission denied (publickey,password)."
