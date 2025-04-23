#!/bin/bash

read -p "port number: " port
lfile="logs.txt"

while true;do
	nc -lvnp $port -c './connection.sh'
done

