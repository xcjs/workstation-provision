#!/bin/bash

LOG=provision.log
# Copy STDOUT to a log
exec >  >(tee -a $LOG)
# Copy STDERR to a log
exec 2> >(tee -a $LOG >&2)

export DEBIAN_FRONTEND=noninteractive

# Execute the Fix Ubuntu script to ensure additional privacy.
dpkg -s ubuntu-desktop 2>/dev/null >/dev/null && ./lib/fixubuntu.sh

# Retrieve and extract Consolas because it is my favorite programming font.
./lib/consolas.sh

# Load functions
source ./lib/read_lst.sh

# Package setup

# Accept the ttf-mscorefonts-installer EULA ahead of time
sudo debconf-set-selections <<< "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true"

PPAS=$(read_lst "./conf/ppas.lst")
PPAPACKAGES=$(read_lst "./conf/ppa-packages.lst")
PACKAGES=$(read_lst "./conf/packages.lst")
GITREPOS=$(read_lst "./conf/git-repos.lst") 

echo
echo "1. Refresh Package Archives ============================================="
echo "Updating the local package cache..."
sudo -E apt-get -qq update > /dev/null

echo
echo "2. Install OS Updates ==================================================="
echo "Checking for and installing operating system upates..."
sudo -E apt-get -qq upgrade > /dev/null && sudo -E apt-get -qq dist-upgrade > /dev/null

echo
echo "3. Install Selected Packages ============================================"
printf %s "$PACKAGES" | while IFS= read -r package
do
   echo "Installing $package..."
   sudo -E apt-get -qq install $package > /dev/null
done

echo
echo "4. Add Personal Package Archives  ======================================="
printf %s "$PPAS" | while IFS= read -r ppa
do
	echo "Adding package archive $ppa..."
	sudo -E add-apt-repository -y $ppa
done

echo
echo "5. Refresh Package Cache and Install Custom PPA Updates ================="
echo "Checking for and installing third party PPA package updates..."
sudo apt-get -qq update && sudo -E apt-get -qq upgrade > /dev/null && sudo -E apt-get -qq dist-upgrade > /dev/null

echo
echo "6. Install Custom PPA Packages =========================================="
printf %s "$PPAPACKAGES" | while IFS= read -r package
do
   echo "Installing $package..."
   sudo -E apt-get -qq install $package > /dev/null
done

echo
echo "7. Add and Install Software Sources without a PPA ======================="
./conf/sources.sh

echo
echo "8. Add and Install Software from Git Repositories ======================="
printf %s "$GITREPOS" | while IFS= read -r repo
do
   echo "Cloning $repo..."
   git clone $repo
done

# Create commonly utilized directories

echo
echo "9. Create Custom Home Directories ======================================="
mkdir ~/bin ~/Projects ~/src ~/www ~/.icons ~/.themes
mkdir -p ~/Pictures/UI

# Link local icons and themes folder so that gksu application still look correct.
cd ~/
sudo ln -s .icons /root/.icons
sudo ln -s .themes /root/.themes 

echo
echo "10. Further Configure Installed Software Pacakges ======================="
SCRIPTPATH=$(dirname `realpath $0`)
cd $SCRIPTPATH
./lib/node.sh
./lib/php.sh
./lib/vagrant.sh

# Save the biggest for last...
echo
echo "11. Download and Install Binaries with no Software Channel =============="
cd $SCRIPTPATH
./lib/bin.sh
