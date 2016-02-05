#!/bin/sh

echo "= Install the Consolas Font ============================================="

echo "Installing prequiresites to extract the font..."
sudo apt-get -qq install font-manager cabextract > /dev/null

TEMPPATH='powerpointviewertmp/'

mkdir -p $TEMPPATH
cd $TEMPPATH

echo "Downloading Microsoft PowerPointViewer..."
wget -q http://download.microsoft.com/download/E/6/7/E675FFFC-2A6D-4AB0-B3EB-27C9F8C8F696/PowerPointViewer.exe

echo "Extracting ppviewer.cab from PowerPointViewer..."
cabextract -q -L -F ppviewer.cab PowerPointViewer.exe

echo "Extracting ppviewer.cab..."
cabextract -q ppviewer.cab

mkdir -p ~/.fonts

echo "Copying Consolas to ~/.fonts/"
cp CONSOLA*.TTF ~/.fonts/


echo "Removing the PowerPointViewer..."
cd ../
rm -r $TEMPPATH
