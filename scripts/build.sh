#!/bin/bash

set -e

echo "Building Docker image..."

docker build -t linuxproject/devops-demo-app:latest .

echo "Build completed successfully."

