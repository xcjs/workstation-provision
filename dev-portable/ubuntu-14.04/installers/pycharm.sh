#!/bin/bash

file=pycharm-professional-5.0.4.tar.gz
installPath=pycharm-ide

originalPath=$(pwd)

echo "= Install PyCharm ======================================================="

mkdir -p ~/bin
cd ~/bin

echo "Downloading PyCharm..."
wget -q "https://download.jetbrains.com/python/${file}"

echo "Extracting PyCharm..."
mkdir -p "${installPath}"
tar -zxvf "${file}" --strip-components=1 -C "${installPath}" > /dev/null

echo "Cleaning up the PyCharm archive..."
rm "${file}"

echo "Symlinking PyCharm..."
ln -s "${installPath}/bin/pycharm.sh" pycharm

cd "${originalPath}"

echo
