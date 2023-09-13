#!/usr/bin/env bash

######################################################################
#                                                                    #
#                  caveman linux! | cozy computing!                  #
#                                                                    #
######################################################################
#                                                                    #
#    A simple and fast Linux distribution designed for beginners     #
#                      to computers and Linux.                       #
#                                                                    #
######################################################################
#                                                                    #
#        Made with <3 by Caveman Software, and the community!        #
#                         Check us out here:                         #
#                   https://github.com/cavemandevs                   #
#                                                                    #
#           and read the CREDITS file for the full credits           #
#                   (thanks to our contributors!)                    #
#                                                                    #
######################################################################
#                                                                    #
# This project is licensed under the GNU General Public License v2.0 #
#         Please read the LICENSE file to read the license.          #
#                                                                    #
######################################################################


# TO DO:
# [DONE] add installer framework
# add installer

usercheck () {
	if [ `id -u` != 0 ]; then
		echo -e "\e[1;31mnon root account detected!\e[0m"
		echo
		echo "you are not running the installer as a root user."
		echo "this can result in a partial installation, and an unstable system."
		echo "please enter './cavemaninstaller' in the shell prompt."
		echo
		echo "if that's not working, try redownloading the ISO."
		echo
		echo "if you're unsure what to do, look for support on the Caveman Official Github,"
		echo "or contact your system administrator."
		echo
		echo "if you've done everything, and you're still seeing this message over and over again,"
		echo "please report it to the Caveman Linux developers on Github."
		echo
		echo "https://github.com/cavemandevs/caveman-linux/"
		exit 1
	fi
}

checkdeps () {
	# TO BE ADDED: dependency list and dependency checks
	clear
}

welcome () {
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "\033[1mCaveman Linux Installer\033[0m"
	echo "Welcome to Caveman Linux!"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "This installer is by Caveman Linux contributors, & Caveman Software."
	echo "It's also under the GPLv2 License, please visit link to read more."
	echo
	echo "2023 - 2023, Caveman Software & Contributors"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "END USER NOTICE:"
	echo "NETWORKING SETUP IS UNSTABLE, PLEASE SET IT UP BEFORE YOU RUN THE INSTALLER"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "Please choose an option:"
	echo
	echo "S: Start the Installation"
	echo "E: Enter Shell"
	echo "R: Read the License"

	while true; do
    		read -p "Your Selection [S/E/R]: " ser
    		case $ser in
        		[Ss]* ) break;;
        		[Ee]* ) entershell;;
        		[Rr]* ) cat add_license_path ;;
        		* ) echo "Please choose a valid selection.";;
    		esac
	done
}

entershell () {
	clear
	echo "here be dragons!"
        echo
        echo "You've just entered the shell interface."
        echo "You may proceed to do a custom installation, or do other things here."
        echo "Please do be warned that doing custom installations, and deviating from the standard Caveman Linux Installer may result in instability, and is NOT supported by Caveman Developers."
        echo 
        echo "If you have entered this menu by mistake, you may re-enter the installer by typing in cavemaninstaller, and pressing enter."
	exit 0
}


confirm() {
	clear
	echo -e "\e[1;31m>>> CONFIRMATION REQUIRED <<<\e[0m"
	echo
	echo "The screen has gone blank to get your attention."
	echo "There's nothing wrong, and we just need your confirmation to continue."
	echo "If you would like to turn back, now's your chance."
	echo "Press CTRL+C to exit the installer, and return to the terminal."
	echo
	echo "If you would like to continue, read below"
	echo "Please enter "InstallCavemanLinux" exactly as seen on the screen to continue (without the quotes)"
	echo
	echo -n ">>> "
	read confirmcode
  	if [[ "$confirmcode" != "InstallCavemanLinux" ]]; then
    		echo -e "\e[1;31m>>> CONFIRMATION REJECTED <<<\e[0m"
    		echo The Confirmation was rejected, and you must start over.
    		sleep 5
    		exit 1
  	else
    		echo -e "\e[1;32m>>> CONFIRMATION APPROVED <<<\e[0m"
    		echo Approved!
    		echo Installation will resume in a few seconds.
    		sleep 5
  	fi
}

net-check () {
	echo -e "\033[1mNetwork Settings - Network Check - Caveman Linux Installation Assistant\033[0m"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "Checking Network.."
	networkstatus=$(nm-online | grep -o online)
	if [[ "$networkstatus" == "online" ]]; then
		echo "network is online!"
	else
		echo -e "\e[1;31mNetwork not found\e[0m"
		echo 
		echo "A working network connection was not found."
		echo
		echo "The Network configuration assistant is under construction,"
		echo "and will be coming soon."
		echo
		echo "This Screen will close in 5 Seconds."
		sleep 5
	fi
}

disksetup () {
	clear
	echo -e "\033[1mDisk Configuration - Partitioning - Caveman Linux Installation Assistant / Screen 1 of X\033[0m"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "Disk Configuration"
	echo "This screen will assist in setting up the target disk."
	echo -e "\e[1;31mWARNING: AS OF NOW, SELECTING THE DISK WILL ***ERASE THE ENTIRE DISK***\e[0m"
	echo "A proper partitioner is coming soon."
	echo "Here is a list of available disks:"
	echo
	lsblk
	echo
	echo "Make sure you select a disk and not a partition. The disk should not have a number at the end"
	echo
	echo "Please enter the target disk where Caveman Linux will be installed."
	read -p ">>> " targetdisk
}

region () {
	clear
	echo -e "\033[1mRegion Settings - Mirror Configuration - Caveman Linux Installation Assistant / Screen 2 of X\033[0m"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "Mirror Settings"
	echo "What's a Mirror?"
	echo 
	echo "A Mirror is a server (usually in your city) that helps you download and Install packages."
	echo "Selecting a country is important to get the quickest package upgrades and installations."
	echo "When Selelecting a Mirror, you must format it like so:"
	echo
	echo "Canada, France"
	echo
	echo "You are allowed to have 2 countries at the same time, but that is not recommended."
	echo
	echo -e "\e[90mCaveman Software is committed to keeping your privacy safe and secure.\e[0m"
	echo -e "\e[90mYour region details will be kept offline, and locally on your device.\e[0m"
	echo -e "\e[90mThe packages you download will only be visible to the mirror, and will NOT be visible to outside attackers.\e[0m"
	echo -e "\e[90mThe mirror system uses HTTP Secure encryption layers to keep your package choices private.\e[0m"
	echo
	echo "Please enter the country for your mirrors, then press ENTER." 
	read -p ">>> " mirrorlocation
}

timezone () {
	clear
	echo -e "\033[1mRegion Settings - Timezone Configuration - Caveman Linux Installation Assistant / Screen 3 of X\033[0m"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "Timezone"
	echo
	echo "This screen will assist you in setting up a timezone."
	echo "The configuration assistant is very primitive, and will be improved in the future"
	echo
	echo "An example timezone code is the following:"
	echo "Canada/Mountain"
	echo
	echo "Please enter the timezone code, and press ENTER."
	echo
	read -p ">>> " timezone
}

locale () {
	clear
	echo -e "\033[1mRegion Settings - Locale Configuration - Caveman Linux Installation Assistant / Screen 4 of X\033[0m"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "Locales"
	echo "This screen will assist you in setting up locales."
	echo "Once again, this section is very primitive, and it will be improved soon"
	echo
	echo "Here are some example codes for Locales"
	echo "English [US]       -->  en_US.UTF-8 UTF-8"
	echo "French [Canadian]  -->  fr_CA.UTF-8 UTF-8"
	echo
	echo "Please enter the Locale code, and press enter."
	echo
	read -p ">>> " locale
}

makeuser () {
	clear
	echo -e "\033[1mUser Setup - Standard Users - Caveman Linux Installation Assistant / Screen 5 of X\033[0m"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "This screen will assist you in creating a user."
	echo 
	echo "The installer will NOT scan for reserved names, so just use your first name for now. Do not use any numbers or special characters."
	echo "Name checks & better username setup coming soon"
	echo 
	echo "Please enter your username, and press enter."
	echo 
	read -p ">>> " standardusername
}

makeuserpassword () {
	clear
	echo -e "\e[1;31m>>> PASSWORD REQUIRED <<<\e[0m"
	echo
	echo "The screen has gone blank to get your attention."
	echo "There's nothing wrong, and we just need you to enter a password for your account."
	echo
	echo "Make sure your password is strong, longer than 5 characters, and consists of numbers, capital letters, special characters."
	echo "Entering Password for user" $standardusername
	echo
	read -p ">>> " standarduserpassword
    	echo -e "\e[1;32m>>> PASSWORD APPROVED <<<\e[0m"
    	echo Approved!
    	echo Installation will resume in a few seconds.
    	sleep 5
}

setrootpassword () {
	clear
	echo -e "\033[1mUser Setup - Root Password - Caveman Linux Installation Assistant / Screen 6 of X\033[0m"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "This section will help you in setting up the Root Password"
	echo
	echo -e "\e[1;31m>>> PASSWORD REQUIRED <<<\e[0m"
	echo
	echo "The screen has gone blank to get your attention."
	echo "There's nothing wrong, and we just need you to enter a password for the Root account."
	echo
	echo "Make sure this password is REALLY strong, longer than 10 characters, and consists of numbers, capital letters, special characters."
	echo "Do NOT give out this password, because this key will give full access to your computer."
	echo
	echo "Entering Password for user root" 
	echo
	read -p ">>> " rootpassword
    	echo -e "\e[1;32m>>> PASSWORD APPROVED <<<\e[0m"
    	echo Approved!
    	echo Installation will resume in a few seconds.
    	sleep 5
}

summary () {
	clear
	echo -e "\033[1mInstallation Summary - Caveman Linux Installation Assistant\033[0m"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "These are the following settings that will be installed with your copy of Caveman Linux."
	echo
	echo "Partitioning"
	echo "├─Target disk [**WILL BE ERASED**]:" $targetdisk
	echo "├─Swap Size: 16G"
	echo "└─Filesystem: btrfs"
	echo "  ├─Subvolume: @"
	echo "  ├─Subvolume: @home"
	echo "  ├─Subvolume: @var_log"
	echo "  ├─Subvolume: @pacman_pkg"
	echo "  ├─Subvolume: @swap"
	echo "  └─Subvolume: @snapshots"
	echo 
	echo "Region Settings"
	echo "├─Mirror Location:" $mirrorlocation
	echo "├─Timezone:" $timezone
	echo "└─Locale:" $locale
	echo
	echo "Users"
	echo "├─Username:" $standardusername
	echo "└─Root Account: ENABLED"
	echo
	echo "Automatically Installed"
	echo "├─Rok AUR Helper (coming soon)"
	echo "└─System Drivers"
	echo "  ├─Video Drivers (Automatically Detected by the Installation Assistant)"
	echo "  ├─Audio Drivers (pipewire)"
	echo "  ├─Disk Support software"
	echo "  └─Extra Device Drivers"
	echo
	echo "Once you're ready, press ENTER to begin installation."
	echo
	read -p ">>> " confirmmoment
}

# usercheck, uncommented because installer is not done yet
checkdeps
welcome
confirm
net-check
disksetup
region
timezone
locale
makeuser
makeuserpassword
setrootpassword
summary
