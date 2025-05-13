#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root (use sudo)"
    exit 1
fi

# Create logs directory if it doesn't exist
mkdir -p logs

# Get port number
read -p "Enter port number (default 22): " port
port=${port:-22}

# Validate port number
if ! [[ "$port" =~ ^[0-9]+$ ]] || [ "$port" -lt 1 ] || [ "$port" -gt 65535 ]; then
    echo "Invalid port number. Using default port 22."
    port=22
fi

# Check if port is in use
if netstat -tuln | grep -q ":$port "; then
    echo "Port $port is already in use. Please choose another port."
    exit 1
fi

echo "Starting SSH honeypot on port $port"
echo "Press Ctrl+C to stop"

# Start the honeypot
while true; do
    nc -lvnp $port -c './connection.sh' 2>&1 | tee -a "logs/ssh_$(date +%Y%m%d).log"
done

