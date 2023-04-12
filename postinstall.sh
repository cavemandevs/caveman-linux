#!/bin/bash

######################################################################
#                        * . Caveman Linux! .*                       # 
######################################################################
#      A small school project built by Devin, Bradley and Soham      #
#                         Check us out here!                         #
#                                                                    #
#   ninetyninebytes (devin): https://www.github.com/ninetyninebytes  #
#         caernarferon (bradley): https://github.com/caernarferon    #
#         S-Panjwani (soham): https://github.com/S-Panjwani          #
######################################################################
#   This project is made with the GNU General Public License v2.0.   #
#            Please read the LICENSE file for the license            #
######################################################################

echo 
cat textlogo.txt
echo
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\033[1mCaveman Linux Installer\033[0m"
echo "This will configure Arch Linux with our modifications"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "Make sure you read the README.md before continuing."
echo "also, please read the LICENSE file for the license."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\033[1mWARNING: WE ARE NOT RESPONSIBLE FOR DAMAGES TO YOUR COMPUTER.\033[0m"
echo -e "\e[3m(so please make sure you know what you're doing!)\e[0m"
echo
echo "Please choose an option:"
echo
echo "S: Start the Installation"
echo "C: Cancel the Installation"
echo "R: View the README.md file"

while true; do
    read -p "
S - Start installation
C - Cancel 
R - Read README.md file

Your Selection [S/C/R]: " scr
    case $scr in
        [Ss]* ) break;;
        [Cc]* ) echo installation cancelled!; exit;;
        [Rr]* ) cat README.md;;
        * ) echo "Please choose a valid selection.";;
    esac
done

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\033[1mCONFIRMATION\033[0m"
echo
echo This is a confirmation to install the software
echo WE ARE NOT RESPONSIBLE FOR DAMAGES TO YOUR COMPUTER.

while true; do
    read -p "Do you want to Install? [Y/N]: " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "installation cancelled, please start over."; exit;;
        * ) echo "Please choose a valid option."
    esac
done

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\033[1mFINAL CONFIRMATION\033[0m"
echo
echo -e "\033[1mLAST WARNING:\033[0m"
echo -e This the FINAL confirmation to install this software. Anything happening from now on is YOUR fault.
echo By installing, you acknowledge that we are NOT RESPONSIBLE for any damage done to your device.
echo and you have read the README.md file before installing.

VERIFY_PHRASE="whydididothis?"
read -p "Please enter the phrase to continue: " user_input
if [[ "$user_input" == "$VERIFY_PHRASE" ]]; then
  echo "Starting Installation"
    seconds=10

  while [ $seconds -gt 0 ]
  do
      echo "Seconds remaining [Press Control + C to force quit]: $seconds"
      sleep 1
      seconds=$(( $seconds - 1 ))
  done


  echo "Installation Started!"

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
  pacman -S --noconfirm xorg xorg-server gnome neofetch firefox vim gnome-tweaks libreoffice-fresh htop git gnome-extra

  #nobloat only installs core apps

  # TO BE ADDED:
  # integrate rock to system - Add rock to /bin, add rock to /opt, install yay.

    #yay 
    #cd /opt
    #git clone - /opt https://github.com/Jguer/yay

  # starting up GDM on startup
  systemctl enable gdm.service

  echo "Installation Successful!, Make sure to reboot your PC"
   #what if it just restarted so all the systemctl things can start

# fix this im trash at shell scripting

echo Rebooting...
sleep 0.5
echo Rebooting...

fi