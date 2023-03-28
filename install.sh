#!/bin/bash
echo "Welcome to the installer."
echo "You may be required to enter your sudo password a few times, this is normal."
echo "This installer is split up into 2 seperate shell scripts"
echo "This is script 1/2, and this is to install yay as the default user."

while true; do
    read -p "Would you like to continue? [Y/N]: " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "installation cancelled, please start over."; exit;;
        * ) echo "Please choose a valid option."
    esac

# fixed yay installation
cd /opt
git clone https://aur.archlinux.org/yay-git.git
sudo chown -R ${USER}:${USER} ./yay-git
cd yay-git
makepkg -si
cd 

sudo ./continue.sh