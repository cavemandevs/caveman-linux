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

while true; do
    read -p "Your Selection [S/C/R/A/L]: " scral 
    case $scral in
        [Ss]* ) break;;
        [Cc]* ) echo installation cancelled!; exit;;
        [Rr]* ) cat README.md;;
        [Aa]* ) cat CREDITS.txt;;
        [Ll]* ) cat LICENSE;;
        * ) echo "Please choose an answer within the limits.";;
    esac
done

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\033[1mFINAL CONFIRMATION\033[0m"
echo
echo This is the final confirmation to install the software
echo Once again, WE ARE NOT RESPONSIBLE FOR DAMAGES TO YOUR COMPUTER.
echo To continue, type in "InstallCavemanLinux" and press enter to confirm installation

while true; do
    read -p "Please type in the Confirmation Code: " installcavemanlinux
    case $installcavemanlinux in
        [installcavemanlinux]* ) install.sh; break;;
        * ) echo "installation cancelled, please start over."; exit;;
    esac
done



