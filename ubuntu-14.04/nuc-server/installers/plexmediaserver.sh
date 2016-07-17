#!/bin/bash

version="1.0.1.2396-c094d0d"
file="plexmediaserver_${version}_amd64.deb"

originalPath=$(pwd)

echo "= Install Plex Media Server ============================================="

echo "Downloading Plex Media Server..."
wget -q "https://downloads.plex.tv/plex-media-server/${version}/${file}"

echo "Installing Plex Media Server.."
sudo dpkg -i ${file}

echo "Cleaning up..."
rm ${file}

cd "${originalPath}"
