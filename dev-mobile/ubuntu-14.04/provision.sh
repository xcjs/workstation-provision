#!/bin/bash

# Terminal correction for binaries that don't like screen.xterm as a terminal.
if [ "${TERM}" == "screen.xterm" ]
	then
		TERM="xterm"
fi

export DEBIAN_FRONTEND=noninteractive

# Load functions
source ./functions/header.sh
source ./functions/read_lst.sh

SCRIPTPATH="$(dirname -- "$(readlink -f -- "$0")")"
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

PPAS=$(read_lst "./conf/ppas.lst")
PPAPACKAGES=$(read_lst "./conf/ppa-packages.lst")
PACKAGES=$(read_lst "./conf/packages.lst")
GITREPOS=$(read_lst "./conf/git-repos.lst") 

header "1. Install OS Updates"
"Refreshing the package cache..."
sudo -E apt-get -qq update > /dev/null 2>&1

echo "Checking for and installing operating system updates..."
sudo -E apt-get -qq upgrade > /dev/null 2>&1 && sudo -E apt-get -qq dist-upgrade > /dev/null 2>&1

header "2. Install Selected Packages"

printf %s "$PACKAGES" | while IFS= read -r package
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

header "3. Add Personal Package Archives"

printf %s "$PPAS" | while IFS= read -r ppa
do
	echo "Adding package archive $ppa..."
	sudo -E add-apt-repository -y $ppa  > /dev/null 2>&1
done

header "4. Refresh Package Cache and Install Custom PPA Updates"

echo "Checking for and installing third party PPA package updates..."
sudo apt-get -qq update && sudo -E apt-get -qq upgrade > /dev/null 2>&1 && sudo -E apt-get -qq dist-upgrade > /dev/null 2>&1

header "5. Install Custom PPA Packages"

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

header "6. Add and Install Software from Git Repositories"

cd ~/

printf %s "$GITREPOS" | while IFS= read -r repo
do
	repo=($repo)
	echo "Cloning $repo..."
	eval git clone "${repo[@]}"
done

cd ${SCRIPTPATH}

# Create commonly utilized directories

header "7. Create Custom Home Directories"

mkdir -p ~/bin ~/Projects ~/src ~/.icons ~/.themes ~/Pictures/UI

# Link local icons and themes folder so that gksu applications still look correct.
cd ~/
sudo ln -s .icons /root/.icons
sudo ln -s .themes /root/.themes 

# Save the biggest for last...
header "8. Download and Install Binaries with no Software Channel"

cd $SCRIPTPATH

for file in $(ls ./installers/*.sh)
	do
		echo "Executing custom installer ${file}..."
		sh $file
done

cd $SCRIPTPATH
