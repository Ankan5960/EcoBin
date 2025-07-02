#!/bin/bash

# Function to update the repository
update_repo() {
  REPO_PATH=$1
  echo "Updating repository at $REPO_PATH..."

  # Change directory to the repository and perform git operations
  cd "$REPO_PATH" || exit
  git checkout main
  git pull origin main
  cd - || exit
}

# Check for the OS (Linux or macOS)
if [[ "$OSTYPE" == "linux-gnu"* || "$OSTYPE" == "darwin"* ]]; then
  # Update both repositories
  update_repo "EcoBin-Frontend"
  update_repo "EcoBin-Microservices"
else
  echo "Unsupported OS: $OSTYPE"
  exit 1
fi
