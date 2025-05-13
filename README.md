# SSH Honeypot

A simple SSH honeypot that logs connection attempts and authentication credentials. This honeypot simulates an SSH server and records all connection attempts, including usernames and passwords used in authentication attempts.

## Features

- Logs all SSH connection attempts
- Records authentication credentials (usernames and passwords)
- Simulates a basic Ubuntu SSH server
- Simple and lightweight implementation using bash scripts
- Handles multiple login attempts
- Masks password input
- Detailed logging with timestamps

## Requirements

- Bash shell
- netcat (nc) command-line tool
- Root/administrator privileges (to bind to port 22)

## Installation

1. Clone this repository
2. Make the scripts executable:
   ```bash
   chmod +x ssh.sh connection.sh
   ```

## Usage

1. Run the honeypot (requires root/administrator privileges to bind to port 22):
   ```bash
   sudo ./ssh.sh
   ```

2. Enter the port number when prompted (default is 22)
3. The honeypot will start listening on the specified port and log all connection attempts

## Logging

The honeypot logs the following information:
- Connection attempts with IP addresses
- Authentication attempts with usernames and passwords
- Timestamps for all events

Logs are written to:
- `logs/ssh_YYYYMMDD.log` - Contains full connection logs
- `logs/ssh_attempts.log` - Contains authentication attempts

## Security Notice

This honeypot is designed to be run in a controlled environment. Running it on a production system or exposing it to the internet without proper security measures could be dangerous. Always run honeypots in isolated environments or virtual machines.

## Disclaimer

This tool is for educational and research purposes only. The authors are not responsible for any misuse or damage caused by this program.