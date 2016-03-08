#!/bin/bash

0.8.3/redis-desktop-manager_0.8.3-120_amd64.deb

version=0.8.3
file=redis-desktop-manager_0.8.3-120_amd64.deb

originalPath=$(pwd)

echo "= Install Redis Desktop Manager ========================================="

echo "Downloading Redis Desktop Manager..."
wget -q "https://github.com/uglide/RedisDesktopManager/releases/download/${version}/${file}"

sudo dpkg -i ${file}
sudo apt-get -qq -f install > /dev/null 2>&1
rm ${file}

cd "${originalPath}"

echo
