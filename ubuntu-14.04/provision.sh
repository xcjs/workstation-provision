#!/bin/bash

# Terminal correction for binaries that don't like screen.xterm as a terminal.
if $TERM == "screen.xterm"
	then
		TERM="xterm"
fi

export DEBIAN_FRONTEND=noninteractive

# Load functions
source ./functions/header.sh
source ./functions/read_lst.sh

SCRIPTPATH=$(dirname `realpath $0`)
cd $SCRIPTPATH

LOG=./provision.log
ERRORLOG=./provision-errors.log
# Copy STDOUT to a log
exec >  >(tee -a $LOG)
# Copy STDERR to a log
exec 2> >(tee -a $LOG >&2)
exec 2> >(tee -a $ERRORLOG >&2)

# Execute the Fix Ubuntu script to ensure additional privacy.
header "Pre-setup. Correct Ubuntu Privacy Concerns"

echo "Selecting the desktop as an installed feature..."
dpkg -s ubuntu-desktop > /dev/null 2>&1

echo "Executing the fixubuntu script..."
./lib/fixubuntu.sh > /dev/null 2>&1

# Accept the ttf-mscorefonts-installer EULA ahead of time
sudo debconf-set-selections <<< "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true"

PPAS=$(read_lst "./conf/ppas.lst")
PPAPACKAGES=$(read_lst "./conf/ppa-packages.lst")
PACKAGES=$(read_lst "./conf/packages.lst")
GITREPOS=$(read_lst "./conf/git-repos.lst") 

header "1. Refresh Package Archives"

echo "Updating the local package cache..."
sudo -E apt-get -qq update > /dev/null 2>&1

header "2. Install OS Updates"

echo "Checking for and installing operating system updates..."
sudo -E apt-get -qq upgrade > /dev/null 2>&1 && sudo -E apt-get -qq dist-upgrade > /dev/null 2>&1

header "3. Install Selected Packages"

printf %s "$PACKAGES" | while IFS= read -r package
do
   echo "Installing $package..."
   sudo -E apt-get -qq install $package > /dev/null 2>&1
done

header "4. Add Personal Package Archives"

printf %s "$PPAS" | while IFS= read -r ppa
do
	echo "Adding package archive $ppa..."
	sudo -E add-apt-repository -y $ppa  > /dev/null 2>&1
done

header "5. Refresh Package Cache and Install Custom PPA Updates"

echo "Checking for and installing third party PPA package updates..."
sudo apt-get -qq update && sudo -E apt-get -qq upgrade > /dev/null 2>&1 && sudo -E apt-get -qq dist-upgrade > /dev/null 2>&1

header "6. Install Custom PPA Packages"

printf %s "$PPAPACKAGES" | while IFS= read -r package
do
	if test -x "./pre/${package}.sh"
		then
			echo 
			echo "There is a script to run before installing ${package}."
			echo "Executing ./pre/${package}.sh..."
			./pre/${package}.sh
			echo
	fi

	echo "Installing $package..."
	sudo -E apt-get -qq install $package > /dev/null 2>&1

	if test -x "./post/${package}.sh"
		then 
			echo
			echo "There is a script to run after installing ${package}."
			echo "Executing ./post/${package}.sh..."
			./post/${package}.sh
			echo
	fi
done

header "7. Add and Install Software Sources without a PPA"

./sources/sources.sh

header "8. Add and Install Software from Git Repositories"

printf %s "$GITREPOS" | while IFS= read -r repo
do
   echo "Cloning $repo..."
   git clone $repo
done

# Create commonly utilized directories

header "9. Create Custom Home Directories"

mkdir ~/bin ~/Projects ~/src ~/www ~/.icons ~/.themes
mkdir -p ~/Pictures/UI

# Link local icons and themes folder so that gksu application still look correct.
cd ~/
sudo ln -s .icons /root/.icons
sudo ln -s .themes /root/.themes 

# Save the biggest for last...
header "11. Download and Install Binaries with no Software Channel"

cd $SCRIPTPATH

# Retrieve and extract Consolas because it is my favorite programming font.
./bin/consolas.sh

#./bin/androidsdk
./bin/consolas.sh
./bin/intellij.sh
./bin/phpstorm.sh
./bin/visualstudiocode.sh

cd $SCRIPTPATH
