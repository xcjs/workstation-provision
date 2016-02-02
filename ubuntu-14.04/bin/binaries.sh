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
wget https://download.jetbrains.com/idea/$INTELLIJDOWNLOAD > /dev/null

echo "Extracting Intellij..."
mkdir $INTELLIJINSTALL
tar -zxvf $INTELLIJDOWNLOAD --strip-components=1 -C intellij-ide > /dev/null

echo "Downloading PHPStorm..."
wget https://download.jetbrains.com/webide/$PHPSTORMDOWNLOAD > /dev/null

echo "Extracting PHPStorm..."
mkdir $PHPSTORMINSTALL
tar -zxvf $PHPSTORMDOWNLOAD --strip-components=1 -C phpstorm-ide > /dev/null

rm $INTELLIJDOWNLOAD $PHPSTORMDOWNLOAD

# Android SDK

ANDROIDSDKDOWNLOAD=android-sdk_r24.1.2-linux.tgz

echo "Downloading the Android SDK..."
wget http://dl.google.com/android/$ANDROIDSDKDOWNLOAD > /dev/null

echo "Extracting the Android SDK..."
tar -zxvf $ANDROIDSDKDOWNLOAD > /dev/null

rm $ANDROIDSDKDOWNLOAD

# Visual Studio Code

# Setup symlinks to make applications executable from path (Ubuntu ~/.profile
# adds ~/bin to path if it exists.

echo "Setting up symlinks for the previously installed binaries for PATH support."

ln -s intellij-ide/bin/idea.sh intellij
ln -s phpstorm-ide/bin/phpstorm.sh phpstorm
