#!/bin/bash

# Function to display banner
function show_banner() {
    echo "###################################"
    echo "TARGET (TEXT) : $target"
    echo "TARGET (IP) : $target_ip"
    echo "START TIME : $(date)"
}

# Function to scan a port
function scan_port() {
    local target=$1
    local port=$2
    nc -z -w 1 $target $port &>/dev/null
    if [ $? -eq 0 ]; then
        echo "PORT $port : OPEN"
    fi
}

# Function for a full scan (1-65535)
function full_scan() {
    echo "SCAN TYPE : FULL"
    echo "PORTS : 1-65535"
    echo "--- NOTE : The Full Scan might take a long time to finish"
    echo "-----------------------------------"
    for port in {1..65535}; do
        scan_port $target $port
    done
}

# Function for a half scan (1-1024)
function half_scan() {
    echo "SCAN TYPE : HALF"
    echo "PORTS : 1-1024"
    echo "-----------------------------------"
    for port in {1..1024}; do
        scan_port $target $port
    done
}

# Main Script Logic
if [ $# -ne 2 ]; then
    echo "SYNTAX : ./scanner.sh <target> <full/half>"
    exit 1
fi

target=$1
scan_type=$2

# Resolve the target to an IP address
target_ip=$(getent hosts $target | awk '{ print $1 }')

if [ -z "$target_ip" ]; then
    echo "ERROR: Could not resolve target IP"
    exit 1
fi

# Display the banner
show_banner

# Perform scan based on user input
case $scan_type in
    "full") full_scan;;
    "half") half_scan;;
    *) echo "SYNTAX : ./scanner.sh <target> <full/half>";;
esac
