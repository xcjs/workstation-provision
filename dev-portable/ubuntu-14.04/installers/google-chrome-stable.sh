#!/bin/bash

echo "= Install Google Chrome ================================================="

# Grab the offical Google Chrome browser
echo "Adding Google's official Chrome channel..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

echo "Installing Google Chrome..."
sudo apt-get -qq update && sudo apt-get -qq install google-chrome-stable

echo
