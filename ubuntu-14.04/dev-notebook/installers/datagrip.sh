#!/bin/bash

file=datagrip-1.0.3-custom-jdk-linux.tar.gz
installPath=datagrip-ide

originalPath=$(pwd)

echo "= Install DataGrip ======================================================"

mkdir -p ~/bin
cd ~/bin

echo "Downloading DataGrip..."
wget -q "https://download.jetbrains.com/datagrip/${file}"

echo "Extracting DataGrip..."
mkdir -p "${installPath}"
tar -zxvf "${file}" --strip-components=1 -C "${installPath}" > /dev/null

echo "Cleaning up the DataGrip archive..."
rm "${file}"

echo "Symlinking DataGrip..."
ln -s "${installPath}/bin/datagrip.sh" datagrip

cd "${originalPath}"

echo
