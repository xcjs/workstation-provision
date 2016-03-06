#!/bin/bash

file=RubyMine-8.0.3.tar.gz
installPath=rubymine-ide

originalPath=$(pwd)

echo "= Install RubyMine ======================================================"

mkdir -p ~/bin
cd ~/bin

echo "Downloading RubyMine..."
wget -q "https://download.jetbrains.com/ruby/${file}"

echo "Extracting RubyMine..."
mkdir -p "${installPath}"
tar -zxvf "${file}" --strip-components=1 -C "${installPath}" > /dev/null

echo "Cleaning up the DataGrip archive..."
rm "${file}"

echo "Symlinking DataGrip..."
ln -s "${installPath}/bin/rubymine.sh" rubymine

cd "${originalPath}"

echo
