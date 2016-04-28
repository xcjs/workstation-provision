#!/bin/sh

file=PowerPointViewer.exe
extractedFile=ppviewer.cab
powerpointViewerUrl=http://download.microsoft.com/download/E/6/7/E675FFFC-2A6D-4AB0-B3EB-27C9F8C8F696/${file}

tmpFile=$(mktemp /tmp/${file}.XXXXXXXXXX)

originalPath=$(pwd)

echo "= Install the Consolas Font ============================================="

mkdir -p ~/.fonts

echo "Installing prequiresites to extract the font..."
sudo apt-get -qq install font-manager cabextract > /dev/null

echo "Downloading Microsoft PowerPointViewer..."
wget -q "${powerpointViewerUrl}" -O "${tmpFile}"

cd /tmp

echo "Extracting ppviewer.cab from PowerPointViewer..."
cabextract -q -L -F "${extractedFile}" "${tmpFile}"

echo "Extracting ppviewer.cab..."
cabextract -q "${extractedFile}"

rm "${extractedFile}"

echo "Copying Consolas to ~/.fonts/"
cp CONSOLA*.TTF ~/.fonts/


echo "Removing the PowerPointViewer..."
cd ../
rm "${tmpFile}"

cd "${originalPath}"

echo
