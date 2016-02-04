#!/bin/bash


# Custom Binaries ##############################################################

echo "= Installing Custom Binaries ============================================"

cd ~/
mkdir -p bin
cd ~/bin

# JetBrains

INTELLIJDOWNLOAD=ideaIU-14.1.2.tar.gz
PHPSTORMDOWNLOAD=PhpStorm-8.0.3.tar.gz

INTELLIJINSTALL=intellij-ide
PHPSTORMINSTALL=phpstorm-ide

echo "Downloading Intellij..."
wget -q https://download.jetbrains.com/idea/$INTELLIJDOWNLOAD

echo "Extracting Intellij..."
mkdir $INTELLIJINSTALL
tar -zxvf $INTELLIJDOWNLOAD --strip-components=1 -C intellij-ide > /dev/null

echo "Cleaning up the Intellij archive..."
rm $INTELLIJDOWNLOAD

echo "Symlinking Intellij..."
ln -s intellij-ide/bin/idea.sh intellij

echo "Downloading PHPStorm..."
wget -q https://download.jetbrains.com/webide/$PHPSTORMDOWNLOAD

echo "Extracting PHPStorm..."
mkdir $PHPSTORMINSTALL
tar -zxvf $PHPSTORMDOWNLOAD --strip-components=1 -C phpstorm-ide > /dev/null

echo "Cleaning up the PhpStorm archive..."
rm $PHPSTORMDOWNLOAD

ln -s phpstorm-ide/bin/phpstorm.sh phpstorm 

# Android SDK

ANDROIDSDKDOWNLOAD=android-sdk_r24.1.2-linux.tgz

echo "Downloading the Android SDK..."
wget -q http://dl.google.com/android/$ANDROIDSDKDOWNLOAD

echo "Extracting the Android SDK..."
tar -zxvf $ANDROIDSDKDOWNLOAD > /dev/null

rm $ANDROIDSDKDOWNLOAD

# Visual Studio Code
wget -q https://az764295.vo.msecnd.net/public/0.10.6-release/VSCode-linux64.zip
unzip -qq VSCode-linux64.zip -d vscode-editor
mv vscode-editor/*/* ./vscode-editor/
ln -s vscode-editor/vscode vscode
