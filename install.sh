#!/bin/bash

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\033[1mCaveman Linux Installer\033[0m"
echo "This will configure Ubuntu Linux with our modifications"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "Make sure you read the README.md before continuing."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\033[1mWARNING: WE ARE NOT RESPONSIBLE FOR DAMAGES TO YOUR COMPUTER.\033[0m"
echo -e "\e[3m(so please make sure you know what you're doing!)\e[0m"
echo
echo "Please choose an option:"
echo
echo "S: Start the Installation"
echo "C: Cancel the Installation"
echo "R: View the README.md file"
echo "A: Acknowledgements and Credits"
echo "L: Read the LICENSE file"

# scral is input
while true; do
    read -p "Your Selection [S/C/R/A/L]: " scral
    case $scral in
        [Ss]* ) break;;
        [Cc]* ) echo installation cancelled!; exit;;
        [Rr]* ) cat README.md;;
        [Aa]* ) cat CREDITS.txt;;
        [Ll]* ) cat LICENSE;;
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
echo -e This the FINAL confirmation to install the software
echo By installng, you acknowledge that we are NOT RESPONSIBLE for damages to your computer,
echo and you have read the README.md file before installing.
echo
echo To Install, please type in "InstallCavemanLinux" and press enter.

VERIFY_PHRASE="InstallCavemanLinux"
read -p "Please enter the phrase to continue: " user_input
if [[ "$user_input" == "$VERIFY_PHRASE" ]]; then
  ./testing.sh
else
  echo "installation cancelled, please start over."
  exit 1
fi