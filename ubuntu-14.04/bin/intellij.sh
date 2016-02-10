#!/bin/bash

FILE=ideaIU-15.0.3.tar.gz
INSTALLPATH=intellij-ide

ORIGINALPATH=$(pwd)

mkdir -p ~/bin
cd ~/bin

echo "Downloading Intellij..."
wget -q --show-progress https://download.jetbrains.com/idea/${FILE}

echo "Extracting Intellij..."
mkdir ${INSTALLPATH}
tar -zxvf ${FILE} --strip-components=1 -C ${INSTALLPATH} > /dev/null

echo "Cleaning up the Intellij archive..."
rm ${FILE}

echo "Symlinking Intellij..."
ln -s ${INSTALLPATH}/bin/idea.sh intellij

cd ${ORIGINALPATH}
