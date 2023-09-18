#include <iostream>
#include <string>
#include <unistd.h>

void welcome() {
    system("clear");
    std::cout << "\e[1mCaveman Linux Installation Assistant" << std::endl;
    std::cout << "\e[0mWelcome to Caveman Linux!" << std::endl;
    std::cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << std::endl;
    std::cout << "This installer was made by the Caveman Linux contributors & Caveman Software" << std::endl;
    std::cout << "This software is released under the GPLv2 License" << std::endl << std::endl;
    std::cout << "2023 - 2023 Caveman Software & Contributors" << std::endl;
    std::cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << std::endl;
    std::cout << "WARNING: NETWORKING SETUP IS UNSTABLE. PLEASE SET UP NETWORKING BEFORE USING THE INSTALLER" << std::endl;
    std::cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << std::endl;

    while (1) {
        std::cout << "Please choose an option: " << std::endl << std::endl;
        std::cout << "1: Start Installation" << std::endl;
        std::cout << "2: Enter Shell" << std::endl;
        std::cout << "3: Shutdown Computer" << std::endl;
        int choice;
        std::cin >> choice;
        if (choice == 1) {
            return;
                     }
        else if (choice == 2) {
            system("clear");
            std::cout << "You have entered the shell" << std::endl << std::endl;
            std::cout << "HERE BE DRAGONS!" << std::endl << std::endl;
            std::cout << "You can continue and do a custom installation or run some other commands" << std::endl << std::endl;
            std::cout << "Do be warned that doing custom installations and deviating from standard installation isn't officially supported and may result in instability" << std::endl << std::endl;
            std::cout << "If you entered the shell by mistake you may run the installer by running ./cavemaninstall" << std::endl;
            exit(0);
        }
        else if (choice == 3) {
             system("clear");
             std::cout << "Shutting down" << std::endl;
             sleep(5);
             // system("shutdown now");
             return;
         }
        else {
            std::cout << "Invalid choice. Select a valid option (1/2/3). " <<  std::endl;
        }
    }

    return;
}

void netCheck() {
    system("clear");
    int netConnected = system("ping -c3 archlinux.org");
    if (netConnected == 0) {
        std::cout << "Connected to internet" << std::endl;
        return;
    }
    else {
        std::cout << "Please connect to the internet" << std::endl;
        exit(0);
    }
    return;
}

void diskSetup() {
    system("clear");
    std::cout << "Disk Configuration - Partitioning - Caveman Linux Installation Assistant" << std::endl;
    std::cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << std::endl;
    std::cout << "Disk Configuration" << std::endl;
    std::cout << "This screen will assist in setting up the target disk" << std::endl;
    std::cout << "WARNING: SELECTING A DISK WILL ERASE THE ***ENTIRE*** DISK" << std::endl;
    std::cout << "Here is a list of available disks" << std::endl << std::endl;
    system("lsblk");
    std::cout << "\n Make sure to select a disk and not a partition. The disk should not have a number at the end. " << std::endl << std::endl;
    std::cout << "Please enter the disk where Caveman Linux will be installed" << std::endl;
    std::string targetDisk;
    std::cout << ">>>>>" ;
    std::cin >> targetDisk;

}

void mirrorSetup() {
    system("clear");
    std::cout << "Region Settings - Mirror Configuration - Caveman Linux Installation Assistant" << std::endl;
    std::cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << std::endl;
    std::cout << "Mirror Settings" << std::endl;
    std::cout << "What's a mirror?" << std::endl << std::endl;
    std::cout << "A mirror is a server near you which helps you download and install packages" << std::endl;
    std::cout << "Selecting the right country is important for fast downloads and installations" << std::endl;
    std::cout << "When selecting a mirror, it is vital that you format like so: " << std::endl << std::endl;
    std::cout << "Canada, France" << std::endl << std::endl;
    std::cout << "While it is possible to have two or more mirrors at once, it is not recommended" << std::endl << std::endl;
    std::cout << "Region details are stored locally on your device, and downloaded packages are only visible to you and the mirrors. They cannot be seen by external attackers." << std::endl << std::endl;
    std::cout << "Please enter the country for your mirrors and then press ENTER" << std::endl;
    std::string mirrorLocations;
    std::cout << ">>>>>";
    std::cin >> mirrorLocations;

    return;
}

void timezoneSetup() {

    system("clear");
    std::cout << "Region Settings - Timezone Configuration - Caveman Linux Installation Assistant" << std::endl;
    std::cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << std::endl;
    std::cout << "Timezone" << std::endl << std::endl;
    std::cout << "This screen will assist you in setting up a timezone" << std::endl;
    std::cout << "The following is a list of available timezones: " << std::endl << std::endl;
    system("timdatectl list-timezones");
    std::cout << "Enter the timezone code and press ENTER: " << std::endl;
    std::string timezone;
    std::cin >> timezone;

    return;
}

void localeSetup() {
    system("clear");
    std::cout << "This will help you set up locales" << std::endl;
    std::cout << "These are the available locales. Please enter the name of ONE locale, preferably with UTF-8 encoding." << std::endl;
    system("cat /etc/locale.gen");
    std::string locale;
    std::cin >> locale;
    return;
}

void makeUser() {
    system("clear");
    std::cout << "This screen will help in creating a user" << std::endl;
    std::cout << "The following is a list of reserved keywords" << std::endl;
    return;
}

int main() {
    welcome();
    netCheck();
    mirrorSetup();
    timezoneSetup();
    localeSetup();
    return 0;
}
