#!/bin/bash

#####################################################################
#                       * . caveman linux! .*                       #
#####################################################################
#     A small school project built by Devin, Bradley and Soham      #
#                        Check us out here!                         #
#                                                                   #
#    ninetyninebytes (devin): https://github.com/ninetyninebytes    #
#      caernarferon (bradley): https://github.com/caernarferon      #
#         S-Panjwani (soham): https://github.com/S-Panjwani         #
#####################################################################
#  This project is made with the GNU General Public License v2.0.   #
#           Please read the LICENSE file for the license            #
#####################################################################

# NOTES (moved here because of potential bug):
# we need to do a lot of testing for the script
# the solution to the networkmanager problem has been fixed
# the parallel downloads problem: 5 is enough

# TO BE ADDED:
# integrate rock to system
# make exclusive wallpapers
# [DONE] add colored text (if we have time)
# [DONE] change /etc/os-release information
# [DONE] add graphics driver support options
# [DONE] add ssd detection and add trim

# IDEAS:
# we'll install yay for now, and we'll add rok later

if [ `id -u` != 0 ]; then
	echo -e "\e[1;31mnon root account detected\e[0m"
	echo
	echo "you are not running this as root"
	echo "to continue the installation, this section should be run as root."
	echo "please run this as root, and try again."
	exit 0
fi

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
echo -e "\e[1;31mWARNING: WE ARE NOT RESPONSIBLE FOR DAMAGES TO YOUR COMPUTER.\e[0m"
echo -e "\e[3m(so please make sure you know what you're doing!)\e[0m"
echo
echo "Please choose an option:"
echo
echo "S: Start the Installation"
echo "C: Cancel the Installation"
echo "R: View the README.md file"

while true; do
    read -p "Your Selection [S/C/R]: " scr
    case $scr in
        [Ss]* ) break;;
        [Cc]* ) echo installation cancelled!; exit;;
        [Rr]* ) cat README.md;;
        * ) echo "Please choose a valid selection.";;
    esac
done

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\e[1;31mCONFIRMATION\e[0m"
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
echo -e "\e[1;31mFINAL CONFIRMATION\e[0m"
echo
echo -e "\e[1;31mlast warning!\e[0m"
echo
echo -e This the FINAL confirmation to install the software
echo By installng, you acknowledge that we are NOT RESPONSIBLE for damages to your computer,
echo and you have read the README.md file before installing.
echo
echo To Install, please type in "InstallCavemanLinux" and press enter.

read -p "Please enter the phrase to continue: " user_input
if [[ $user_input == "InstallCavemanLinux" ]]; then
	echo "Starting Installation"
	seconds=10

	while [ $seconds -gt 0 ]
	do
		echo "Seconds remaining [Press Control + C to force quit]: $seconds"
		sleep 1
		seconds=$(( $seconds - 1 ))
	done

	echo "Installation Started!"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "\033[1mmirror and pacman setup\033[0m"
	echo
	echo "please choose a country for your pacman mirrors"
	echo "you are allowed to sepearate each country with commas, and each country must start with a capital letter"
	echo "example: Canada, France"
	read COUNTRY
	sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf; sed -i '/^#.*ParallelDownloads =.*/s/^#//' /etc/pacman.conf; sed -i '/^#.*ParallelDownloads =.*/s/[[:digit:]]*/10/' /etc/pacman.conf
	pacman -Syu --noconfirm
	pacman -S --noconfirm --needed reflector
	reflector --country $COUNTRY --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist --verbose
	echo "done!"
	# select best mirrors and refresh them every week
	echo -e "\033[1msetting up mirror refresh scripts...\033[0m"
	cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
	rm /etc/xdg/reflector/reflector.conf
	echo "--save /etc/pacman.d/mirrorlist" >> /etc/xdg/reflector/reflector.conf
	echo "--country $COUNTRY" >> /etc/xdg/reflector/reflector.conf
	echo "--protocol https" >> /etc/xdg/reflector/reflector.conf
	echo "--latest 10" >> /etc/xdg/reflector/reflector.conf
	echo "--sort rate" >> /etc/xdg/reflector/reflector.conf
	systemctl enable reflector.timer
	echo "mirrors will now be refreshed every week on startup."
	echo "done!"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	# installing packages
	echo -e "\033[1minstalling packages\033[0m"
	pacman -Syu
	pacman -S --noconfirm --needed xorg xorg-server gnome gdm neofetch firefox vim gnome-tweaks libreoffice-fresh htop git
	echo "done!"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "\033[1minstalling graphics card drivers & support software...\033[0m" 
	if lspci | grep -i "nvidia" > /dev/null; then
		pacman -S --noconfirm --needed nvidia nvidia-libgl lib32-nvidia-libgl nvidia-settings nvidia-utils lib32-nvidia-utils
		sed -i '/^HOOKS=/ s/\<kms\>//g' /etc/mkinitcpio.conf
		mkinitcpio -P
	elif lspci | grep -i "amd\|ati" > /dev/null; then
		pacman -S --noconfirm --needed mesa lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau
	elif lspci | grep -i "intel" > /dev/null; then
		pacman -S --noconfirm --needed mesa lib32-mesa vulkan-intel lib32-vulkan-intel
	else
		echo "the graphics card in this system could not be detected, cancelling installation."
	fi
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "\033[1mfinalizing installation...\033[0m"
	# detect solid state drives and install support software if found
	drivetype=$(cat /sys/block/sda/queue/rotational)
	nvmedrivetype=$(ls /dev | grep nvme)
	if [[ "$drivetype" == "0" ]]; then
		pacman -S --noconfirm util-linux
		systemctl enable fstrim.timer
	elif [[ "$nvmedrivetype" == "nvme*" ]]; then
		pacman -S --noconfirm util-linux
		systemctl enable fstrim.timer
	else
		echo "no solid state drives were detected, skipping fstrim installation.."
	fi
	# installing firewall and enabling services on startup
	pacman -S --noconfirm ufw
	ufw enable
	systemctl enable ufw.service
	systemctl enable gdm
	# changing os-release information
	rm -f /usr/lib/os-release
	rm -f /etc/os-release
	echo 'NAME="Caveman Linux"' >> /usr/lib/os-release
	echo 'PRETTY_NAME="Caveman Linux"' >> /usr/lib/os-release
	echo 'ID=caveman' >> /usr/lib/os-release
	echo 'ID_LIKE=arch' >> /usr/lib/os-release
	echo 'BUILD_ID=rolling' >> /usr/lib/os-release
	echo 'HOME_URL="https://github.com/caernarferon/caveman-linux"' >> /usr/lib/os-release
	echo 'DOCUMENTATION_URL="https://github.com/caernarferon/caveman-linux"' >> /usr/lib/os-release
	echo 'SUPPORT_URL="https://github.com/caernarferon/caveman-linux"' >> /usr/lib/os-release
	echo 'BUG_REPORT_URL="https://github.com/caernarferon/caveman-linux/issues"' >> /usr/lib/os-release
	echo 'PRIVACY_POLICY_URL="https://github.com/caernarferon/caveman-linux"' >> /usr/lib/os-release
	echo 'LOGO=archlinux-logo' >> /usr/lib/os-release
	ln -sf /usr/lib/os-release /etc/os-release
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "\033[1moptional applications\033[0m"
	echo "Would you like to install yay?"
	echo "yay is an AUR helper that can assist you in finding and installing packages from the AUR."
	echo "we recommend you install this so you can get AUR access out of the box."
	echo "if you would like to, feel free to skip yay installation."
	echo "if you choose to skip, you can always install this later."
	echo "learn more about yay at: https://github.com/Jguer/yay"
	echo "notice: when installing yay you may be prompted to press Y. if you do get this prompt, please press yes."
	echo
	uidtousername=$(awk -F':' -v uid=1000 '$3 == uid { print $1 }' /etc/passwd)
	while true; do
		read -p "would you like to install yay? [Y/N]: " yn
		case $yn in
			[Yy]* ) sudo -u $uidtousername ./yayinstall.sh; break;;
			[Nn]* ) echo "yay installation has been skipped."; break;;
			* ) echo "Please choose a valid option."
    		esac
	done
	echo -e "\e[1;32minstallation complete! rebooting system...\e[0m"
	seconds=10
	while [ $seconds -gt 0 ]
	do
		echo "Seconds remaining: $seconds"
		sleep 1
		seconds=$(( $seconds - 1 ))
		reboot
	done
else
	echo "installation cancelled, please start over."
	exit 1
fi
