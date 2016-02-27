#!/bin/sh

FILE=PowerPointViewer.exe
EXTRACTEDFILE=ppviewer.cab
POWERPOINTVIEWERURL=http://download.microsoft.com/download/E/6/7/E675FFFC-2A6D-4AB0-B3EB-27C9F8C8F696/${FILE}

TMPFILE=$(mktemp /tmp/${FILE}.XXXXXXXXXX)

ORIGINALPATH=$(pwd)

echo "= Install the Consolas Font ============================================="

mkdir -p ~/.fonts

echo "Installing prequiresites to extract the font..."
sudo apt-get -qq install font-manager cabextract > /dev/null

echo "Downloading Microsoft PowerPointViewer..."
wget -q ${POWERPOINTVIEWERURL} -O ${TMPFILE}

cd /tmp

echo "Extracting ppviewer.cab from PowerPointViewer..."
cabextract -q -L -F ${EXTRACTEDFILE} ${TMPFILE}

echo "Extracting ppviewer.cab..."
cabextract -q ${EXTRACTEDFILE}

rm ${EXTRACTEDFILE}

echo "Copying Consolas to ~/.fonts/"
cp CONSOLA*.TTF ~/.fonts/


echo "Removing the PowerPointViewer..."
cd ../
rm $TMPFILE
