#!/bin/bash

FILE=PhpStorm-10.0.3.tar.gz
INSTALLPATH=phpstorm-ide

ORIGINALPATH=$(pwd)

mkdir -p ~/bin
cd ~/bin

echo "Downloading PHPStorm..."
wget -q https://download.jetbrains.com/webide/${FILE}

echo "Extracting PHPStorm..."
mkdir ${INSTALLPATH}
tar -zxvf ${FILE} --strip-components=1 -C ${INSTALLPATH} > /dev/null

echo "Cleaning up the PHPStorm archive..."
rm $FILE

echo "Symlinking PHPStorm..."
ln -s ${INSTALLPATH}/bin/phpstorm.sh phpstorm 

cd ${ORIGINALPATH}
