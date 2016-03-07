#!/bin/bash

file=WebStorm-11.0.3.tar.gz
installPath=webstorm-ide

originalPath=$(pwd)

echo "= Install WebStorm ======================================================"

mkdir -p ~/bin
cd ~/bin

echo "Downloading WebStorm..."
wget -q "https://download.jetbrains.com/webstorm/${file}"

echo "Extracting WebStorm..."
mkdir -p "${installPath}"
tar -zxvf "${file}" --strip-components=1 -C "${installPath}" > /dev/null

echo "Cleaning up the WebStorm archive..."
rm "${file}"

echo "Symlinking WebStorm..."
ln -s "${installPath}/bin/webstorm.sh" webstorm

cd "${originalPath}"

echo
