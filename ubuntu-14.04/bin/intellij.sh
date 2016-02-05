#!/bin/bash

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
