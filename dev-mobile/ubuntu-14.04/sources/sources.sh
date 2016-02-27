#!/bin/bash

# Grab the latest version of Virtualbox from the Oracle repository.
echo "Adding Oracle channel for Virtualbox 5.0..."
wget -q -O- http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list.d/virtualbox.list'

# Grab the offical Google Chrome browser
echo "Adding Google's official Chrome channel..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

echo "Installing Google Chrome and Virtualbox 5.0..."
sudo apt-get -qq update && sudo apt-get -qq install google-chrome-stable virtualbox-5.0
