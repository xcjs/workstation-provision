#!/bin/bash


# Custom Binaries ##############################################################

echo "= Installing Custom Binaries ============================================"

cd ~/
mkdir -p bin
cd ~/bin

# JetBrains

INTELLIJDOWNLOAD=ideaIU-15.0.3.tar.gz
INTELLIJINSTALL=intellij-ide

echo "Downloading Intellij..."
wget -q https://download.jetbrains.com/idea/$INTELLIJDOWNLOAD

echo "Extracting Intellij..."
mkdir $INTELLIJINSTALL
tar -zxvf $INTELLIJDOWNLOAD --strip-components=1 -C intellij-ide > /dev/null

echo "Cleaning up the Intellij archive..."
rm $INTELLIJDOWNLOAD

echo "Symlinking Intellij..."
ln -s ${INTELLIJINSTALL}/bin/idea.sh intellij

PHPSTORMDOWNLOAD=PhpStorm-10.0.3.tar.gz
PHPSTORMINSTALL=phpstorm-ide

echo "Downloading PHPStorm..."
wget -q https://download.jetbrains.com/webide/$PHPSTORMDOWNLOAD

echo "Extracting PHPStorm..."
mkdir $PHPSTORMINSTALL
tar -zxvf $PHPSTORMDOWNLOAD --strip-components=1 -C phpstorm-ide > /dev/null

echo "Cleaning up the PHPStorm archive..."
rm $PHPSTORMDOWNLOAD

echo "Symlinking PHPStorm..."
ln -s ${PHPSTORMINSTALL}/bin/phpstorm.sh phpstorm 

# Android SDK

ANDROIDSDKDOWNLOAD=android-sdk_r24.1.2-linux.tgz

echo "Downloading the Android SDK..."
wget -q http://dl.google.com/android/$ANDROIDSDKDOWNLOAD

echo "Extracting the Android SDK..."
tar -zxvf $ANDROIDSDKDOWNLOAD > /dev/null

rm $ANDROIDSDKDOWNLOAD

# Visual Studio Code
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
