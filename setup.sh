#!/bin/bash


set -o errexit
set -o nounset


cd "$(dirname "${BASH_SOURCE[0]}")"
DIR=$(pwd)


# Fix missing appgrid public key
sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com 241FE6973B765FAE


# Remove unused packages
sudo apt purge -y chromium*
# Clean up
sudo apt autoremove --purge && sudo apt autoclean


# Install commonly used packages
sudo apt update
sudo apt install -y git vim vlc build-essential p7zip-full htop python-pip python3-pip command-not-found \
    fcitx fcitx-googlepinyin


# Install .deb files
[ -d debs ] && sudo apt install ./debs/*.deb


# Update installed packages
sudo apt update && sudo apt upgrade -y


# Disable bluetooth autostart
gsettings set org.blueman.plugins.powermanager auto-power-on false


# Create an autostart to run .mike_xinitrc
[ ! -d "$HOME/.config/autostart" ] && mkdir -p "$HOME/.config/autostart"
cp ./mike_xinit.desktop "$HOME/.config/autostart/"


# Copy all dotfiles to "$HOME/"
rsync -avh ./dotfiles/ ~/

