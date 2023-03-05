# enter all commands in order here
# the install.sh file will point to this file, and will write the commands in order
# arch install is root so no sudo stuff
# WARNING: if you need to cd into a directory, it may cause problems.
# contact devin for more info on this 



# someone do pre install stuff





pacman -S --noconfirm --needed networkmanager dhclient
systemctl enable --now networkmanager
echo enabled networkmanager

#select best mirrors

pacman -S --noconfirm --needed pacman-contrib curl
pacman -S --noconfirm --needed reflector rsync grub arch-install-scripts git
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak