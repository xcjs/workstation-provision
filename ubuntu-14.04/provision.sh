#!/bin/bash

LOG=provision.log
# Copy STDOUT to a log
exec >  >(tee -a $LOG)
# Copy STDERR to a log
exec 2> >(tee -a $LOG >&2)

export DEBIAN_FRONTEND=noninteractive

# Execute the Fix Ubuntu script to ensure additional privacy.
./lib/fixubuntu.sh

# Retrieve and extract Consolas because it is my favorite programming font.
./lib/consolas.sh

# Load functions
source ./lib/read_lst.sh
source ./lib/newline.sh

# Package setup

# Accept the ttf-mscorefonts-installer EULA ahead of time
sudo debconf-set-selections <<< "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true"

PPAS=$(read_lst "./conf/ppas.lst")
PPAPACKAGES=$(read_lst "./conf/ppa-packages.lst")
PACKAGES=$(read_lst "./conf/packages.lst")
GITREPOS = $(read_lst "./conf/git-repos.lst") 

newline
echo "1. Add Personal Package Archives  ======================================="
printf %s "$PPAS" | while IFS= read -r ppa
do
	echo "Adding package archive $ppa..."
	sudo -E add-apt-repository -y "$ppa"
done

newline
echo "2. Refresh Package Archives ============================================="
sudo -E apt-get -qq update

newline
echo "3. Install OS Updates ==================================================="
sudo -E apt-get -qq upgrade && sudo -E apt-get -qq dist-upgrade

newline
echo "4. Install Selected Packages ============================================"
printf %s "$PACKAGES" | while IFS= read -r package
do
   echo "Installing $package..."
   sudo -E apt-get -qq install "$package"
done

newline
echo "5. Install Custom PPA Packages =========================================="
printf %s "$PPAPACKAGES" | while IFS= read -r package
do
   echo "Installing $package..."
   sudo -E apt-get -qq install "$package"
done

# Create commonly utilized directories

cd ~/
mkdir bin Projects src www .icons .themes
mkdir -p Pictures/UI

# Link local icons and themes folder so that gksu application still look correct.
sudo ln -s ~/.icons /root/.icons
sudo ln -s ~/.themes /root/.themes 
