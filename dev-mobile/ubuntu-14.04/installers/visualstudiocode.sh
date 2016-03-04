#!/bin/bash

version=0.10.6-release
file=VSCode-linux64.zip
installPath=vscode-editor
symLink=vscode

originalPath=$(pwd)

echo "= Install Visual Studio Code ============================================"

mkdir -p ~/bin
cd ~/bin

echo "Downloading Visual Studio Code ${version}..."
wget -q "https://az764295.vo.msecnd.net/public/${version}/${file}"

echo "Extracting Visual Studio Code..."
unzip -qq "${file}" -d "${installPath}"

echo "Playing musical chairs with the Visual Studio Code directory..."
vscodeDir=$(ls "${installPath}" | head -1)
mv "${installPath}/*/*" "./${installPath}/"
rmdir "${installPath}/${vscodeDir}"

echo "Cleaning up the archive..."
rm "${file}"

echo "Symlinking Visual Studio Code..."
ln -s "${installPath}/vscode" "${symLink}"

cd "${originalPath}"

echo
