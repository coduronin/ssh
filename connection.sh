#!/bin/bash

read -p "login: " username
read -p "password" " password

echo "Permission denied, please try again. "

echo "[$(date)] IP: $NCAT_REMOTE_ADDR --- Username: $username --- Password: $password" >> logs
