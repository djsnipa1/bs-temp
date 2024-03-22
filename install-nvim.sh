#!/bin/bash
set -eux
prefix=$HOME/.local

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' 0
cd "$tmp" || exit
# Download the latest Neovim tarball
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz

# Remove the existing Neovim installation if it exists
sudo rm -rf /opt/nvim

mkdir -p $prefix/bin

# Extract the tarball to /opt
mkdir opt
sudo tar -C opt -xzf nvim-linux64.tar.gz
cp opt/nvim-linux64/bin/nvim $prefix/bin

#cd $_ || exit
#install -m 755 "$tmp/nvim.appimage" nvim.appimage.$revision

# Add Neovim to the PATH
#export PATH="$PATH:/opt/nvim-linux64/bin"

# Optionally, add the export command to your shell's profile script (e.g., ~/.bashrc or ~/.zshrc)
#echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc

# Source your profile script to apply the changes
#source ~/.bashrc

# Verify the installation
nvim --version

