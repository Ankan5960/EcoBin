#!/bin/bash

# Function to run the commands for cloning the repositories
clone_repos() {
    echo Cloning EcoBin-Frontend repository...
    git clone https://github.com/Ankan5960/EcoBin-Frontend.git

    echo Cloning EcoBin-Microservice repository...
    git clone https://github.com/Ankan5960/EcoBin-Microservices.git
}

# Detect the operating system and execute the cloning function
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    clone_repos
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    clone_repos
elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" ]]; then
    # Windows (Git Bash or WSL)
    clone_repos
else
    echo "Unsupported OS. This script supports macOS, Linux, and Windows."
    exit 1
fi