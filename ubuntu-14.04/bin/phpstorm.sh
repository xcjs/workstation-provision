#!/bin/bash

PHPSTORMDOWNLOAD=PhpStorm-10.0.3.tar.gz
PHPSTORMINSTALL=phpstorm-ide

echo "Downloading PHPStorm..."
wget -q https://download.jetbrains.com/webide/$PHPSTORMDOWNLOAD

echo "Extracting PHPStorm..."
mkdir $PHPSTORMINSTALL
tar -zxvf $PHPSTORMDOWNLOAD --strip-components=1 -C phpstorm-ide > /dev/null

echo "Cleaning up the PHPStorm archive..."
rm $PHPSTORMDOWNLOAD

echo "Symlinking PHPStorm..."
ln -s ${PHPSTORMINSTALL}/bin/phpstorm.sh phpstorm 
