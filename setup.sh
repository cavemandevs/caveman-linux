#!/bin/bash

# enter all commands in order here
# the install.sh file will point to this file, and will write the commands in order
# arch install is root so no sudo stuff
# WARNING: if you need to cd into a directory, it may cause problems.
# contact devin for more info on this 

echo "Starting Installation"

seconds=10

while [ $seconds -gt 0 ]
do
    echo "Seconds remaining [Press Control + C to force quit]: $seconds"
    sleep 1
    seconds=$(( $seconds - 1 ))
done

echo "Installtion Started!"

pacman -S --noconfirm --needed networkmanager dhclient
systemctl enable --now networkmanager
echo enabled networkmanager

# we need to do some research on how to connect to peap on the network

#select best mirrors

pacman -S --noconfirm --needed pacman-contrib curl
pacman -S --noconfirm --needed reflector rsync grub arch-install-scripts git
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

# installing packages

pacman -Syu
pacman -S xorg xorg-server gnome neofetch firefox vim tweaks libreoffice-fresh htop 

# installing yay
# this might be a bit unstable
cd /opt
git clone https://aur.archlinux.org/yay-git.git
sudo chown -R ${USER}:${USER} ./yay-git
cd yay-git
makepkg -si

# starting up GDM on startup
systemctl enable gdm.service

echo "Installation Complete!, starting GNOME..."

seconds=10

while [ $seconds -gt 0 ]
do
    echo "Seconds remaining: $seconds"
    sleep 1
    seconds=$(( $seconds - 1 ))
done

echo "Starting GNOME"
systemctl start gdm.service