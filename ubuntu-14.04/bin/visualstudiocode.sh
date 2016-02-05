#!/bin/bash

VERSION=0.10.6-release
FILE=VSCode-linux64.zip
INSTALLPATH=vscode-editor
SYMLINK=vscode

ORIGINALPATH=$(pwd)

mkdir -p ~/bin
cd ~/bin

echo "Downloading Visual Studio Code ${VERSION}..."
wget -q https://az764295.vo.msecnd.net/public/${VERSION}/${FILE}

echo "Extracting Visual Studio Code..."
unzip -qq $FILE -d ${INSTALLPATH}

echo "Playing musical chairs with the Visual Studio Code directory..."
VSCODEDIR=$(ls vscode-editor/ | head -1)
mv ${INSTALLPATH}/*/* ./${INSTALLPATH}/
rmdir ${INSTALLPATH}/${VSCODEDIR}

echo "Cleaning up the archive..."
rm ${FILE}

echo "Symlinking Visual Studio Code..."
ln -s ${INSTALLPATH}/vscode ${SYMLINK}

cd ${ORIGINALPATH}
