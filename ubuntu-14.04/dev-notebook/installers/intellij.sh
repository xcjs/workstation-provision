#!/bin/bash

file=ideaIU-2016.1.tar.gz
installPath=intellij-ide

originalPath=$(pwd)

echo "= Install Intellij ======================================================"

mkdir -p ~/bin
cd ~/bin

echo "Downloading Intellij..."
wget -q "https://download.jetbrains.com/idea/${file}"

echo "Extracting Intellij..."
mkdir -p "${installPath}"
tar -zxvf "${file}" --strip-components=1 -C "${installPath}" > /dev/null

echo "Cleaning up the Intellij archive..."
rm "${file}"

echo "Symlinking Intellij..."
ln -s "${installPath}/bin/idea.sh" intellij

cd "${originalPath}"

echo
