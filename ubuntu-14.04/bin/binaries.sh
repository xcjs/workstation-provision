#!/bin/bash


# Custom binaries ##############################################################

cd ~/
mkdir -p bin
cd ~/bin

# JetBrains

INTELLIJDOWNLOAD=ideaIU-14.1.2.tar.gz
PHPSTORMDOWNLOAD=PhpStorm-8.0.3.tar.gz

INTELLIJINSTALL=intellij-ide
PHPSTORMINSTALL=phpstorm-ide

wget https://download.jetbrains.com/idea/$INTELLIJDOWNLOAD
mkdir $INTELLIJINSTALL
tar -zxvf $INTELLIJDOWNLOAD --strip-components=1 -C intellij-ide

wget https://download.jetbrains.com/webide/$PHPSTORMDOWNLOAD
mkdir $PHPSTORMINSTALL
tar -zxvf $PHPSTORMDOWNLOAD --strip-components=1 -C phpstorm-ide

rm $INTELLIJDOWNLOAD $PHPSTORMDOWNLOAD

# Android SDK

ANDROIDSDKDOWNLOAD=android-sdk_r24.1.2-linux.tgz

wget http://dl.google.com/android/$ANDROIDSDKDOWNLOAD
tar -zxvf $ANDROIDSDKDOWNLOAD

rm $ANDROIDSDKDOWNLOAD

# Setup symlinks to make applications executable from path (Ubuntu ~/.profile
# adds ~/bin to path if it exists.

ln -s intellij-ide/bin/idea.sh intellij
ln -s phpstorm-ide/bin/phpstorm.sh phpstorm
