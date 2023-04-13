#!/bin/bash

######################################################################
#                        * . Caveman Linux .*                       # 
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

# def colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# print textlogo.txt
echo 
cat textlogo.txt
echo
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\033[1mCaveman Linux Installer\033[0m"
echo "This script will configure Caveman Linux."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "Make sure you read the README.md before continuing. (or else)"
echo "By continuing, you acknowledge and ."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\033[1mWARNING: WE ARE NOT RESPONSIBLE FOR DAMAGE DONE TO YOUR COMPUTER.\033[0m"
echo -e "\e[3m(so please make sure you know what you're doing...)\e[0m"
echo

# Ask user for input
while true; do
    read -p "Please choose an option [S/C/R]: " scr
    case $scr in
        [Ss]* ) break;;
        [Cc]* ) echo "Installation cancelled!"; exit;;
        [Rr]* ) cat README.md;;
        * ) echo -e "${RED}Invalid input, please choose a valid option.${NC}"`;;
    esac
done


# Final confirmation with user
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\033[1mFINAL CONFIRMATION\033[0
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\033[1mFINAL CONFIRMATION\033[0m"
echo
echo -e "\033[1mLAST WARNING:\033[0m"
echo -e This the FINAL confirmation to install this software. Anything happening from now on is YOUR fault.
echo By installing, you acknowledge that we are NOT RESPONSIBLE for any damage to your device.
echo and you have read the README.md file before installing.
echo To Install, please type in "whydididothis?" and press enter.

VERIFY_PHRASE="whydididothis?"
read -p "Please enter the phrase to continue: " user_input
if [[ "$user_input" == "$VERIFY_PHRASE" ]]; then
  echo -e "\033[0;31mStarting Installation - 5 seconds to cancel \033[1;34m(Control + C)\033[0m"  seconds=10

  seconds=5
  while [ $seconds -gt 0 ] #countdown of death
  do
  echo -e "\033[0;31mSeconds remaining \033[1;34m[Press Control + C to quit]:\033[1;34m $seconds\033[0m"
      sleep 1
      seconds=$(( $seconds - 1 ))
  done

  echo "Installation Started!"

  # we need to do some research on how to connect to peap on the network



  # installing packages

  pacman -Syu
  pacman -S --noconfirm --needed xorg xorg-server gnome neofetch firefox vim gnome-tweaks libreoffice-fresh htop git gnome-extra

  #nobloat only installs core apps

  # TO BE ADDED:
  # integrate rock to system - Add rock to /bin, add rock to /opt, install yay.

yay 
cd /opt
git clone /opt https://github.com/Jguer/yay

  # starting up GDM on startup
  systemctl enable gdm.service

  echo "Installation Successful!, Make sure to reboot your PC"
   #what if it just restarted so all the systemctl things can start

# fix this im trash at shell scripting

echo Rebooting...
sleep 0.5
echo Rebooting...

reboot
fi
