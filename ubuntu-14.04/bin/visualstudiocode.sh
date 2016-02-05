#!/bin/bash

echo "Downloading Visual Studio Code..."
wget -q https://az764295.vo.msecnd.net/public/0.10.6-release/VSCode-linux64.zip

echo "Extracting Visual Studio Code..."
unzip -qq VSCode-linux64.zip -d vscode-editor

echo "Playing musical chairs with the Visual Studio Code directory..."
VSCODEDIR=$(ls vscode-editor/ | head -1)
mv vscode-editor/*/* ./vscode-editor/
rmdir vscode-editor/${VSCODEDIR}

echo "Symlinking Visual Studio Code..."
ln -s vscode-editor/vscode vscode
