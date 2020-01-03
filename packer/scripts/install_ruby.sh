#!/bin/bash
set -e

# Install Ruby
echo "Install Ruby process..."
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
