#!/bin/bash

if ! command -v docker &> /dev/null; then
    echo "Installing Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker "$USER"
    rm get-docker.sh
    echo "Docker installed successfully."
fi

docker pull "r0879842/edge-api:latest"

docker run -d -p 8000:8000 --name edge-api "r0879842/edge-api:latest"
