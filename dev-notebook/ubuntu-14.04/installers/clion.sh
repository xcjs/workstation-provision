#!/bin/bash

file=CLion-2016.1.tar.gz
installPath=clion-ide

originalPath=$(pwd)

echo "= Install CLion ========================================================="

mkdir -p ~/bin
cd ~/bin

echo "Downloading CLion..."
wget -q "https://download.jetbrains.com/cpp/${file}"

echo "Extracting CLion..."
mkdir -p "${installPath}"
tar -zxvf "${file}" --strip-components=1 -C "${installPath}" > /dev/null

echo "Cleaning up the CLion archive..."
rm "${file}"

echo "Symlinking CLion..."
ln -s "${installPath}/bin/clion.sh" clion

cd "${originalPath}"

echo
