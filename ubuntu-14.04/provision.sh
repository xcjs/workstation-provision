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

# Package setup

function newline {
	echo ""
}

PPAS=$(./lib/lst-reader.sh ./conf/ppas.lst)
PPAPACKAGES=$(./lib/lst-reader.sh ./conf/ppa-packages.lst)
PACKAGES=$(./lib/lst-reader.sh ./conf/packages.lst)

newline
echo "1. Add Personal Package Archives  ======================================="
printf %s "$PPAS" | while IFS= read -r ppa
do
	echo "Adding package archive $ppa..."
	sudo -E add-apt-repository -y "$ppa"
done

newline
echo "2. Refresh Package Archives ============================================="
sudo -E apt-get -q update

newline
echo "3. Install OS Updates ==================================================="
sudo -E apt-get -qy upgrade && sudo -E apt-get -qy dist-upgrade

newline
echo "4. Install Selected Packages ============================================"
printf %s "$PACKAGES" | while IFS= read -r package
do
   echo "Installing $package..."
   sudo -E apt-get install -qy "$package"
done

newline
echo "5. Install Custom PPA Packages =========================================="
printf %s "$PPAPACKAGES" | while IFS= read -r package
do
   echo "Installing $package..."
   sudo -E apt-get install -qy "$package"
done

# Create commonly utilized directories

cd ~/
mkdir bin Projects src www .icons .themes
mkdir -p Pictures/UI
	