#!/bin/bash

file=PhpStorm-10.0.3.tar.gz
installPath=phpstorm-ide

originalPath=$(pwd)

echo "= Install PHPStorm ======================================================"

mkdir -p ~/bin
cd ~/bin

echo "Downloading PHPStorm..."
wget -q "https://download.jetbrains.com/webide/${file}"

echo "Extracting PHPStorm..."
mkdir "${installPath}"
tar -zxvf "${file}" --strip-components=1 -C "${installPath}" > /dev/null

echo "Cleaning up the PHPStorm archive..."
rm "${file}"

echo "Symlinking PHPStorm..."
ln -s "${installPath}/bin/phpstorm.sh" phpstorm 

cd "${originalPath}"

echo
