#!/bin/bash

file=clion-1.2.4.tar.gz
installPath=clion-ide

originalPath=$(pwd)

echo "= Install CLion ========================================================="

mkdir -p ~/bin
cd ~/bin

echo "Downloading CLion..."
wget -q "https://download.jetbrains.com/cpp/${file}"
https://download.jetbrains.com/cpp/clion-1.2.4.tar.gz

echo "Extracting CLion..."
mkdir -p "${installPath}"
tar -zxvf "${file}" --strip-components=1 -C "${installPath}" > /dev/null

echo "Cleaning up the CLion archive..."
rm "${file}"

echo "Symlinking CLion..."
ln -s "${installPath}/bin/clion.sh" clion

cd "${originalPath}"

echo
