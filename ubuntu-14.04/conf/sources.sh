#!/bin/bash

# Grab the latest version of Virtualbox from the Oracle repository.
wget -q -O- http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list.d/virtualbox.list'

# Grab the offical Google Chrome browser
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo apt-get update
sudo apt-get install google-chrome-stable virtualbox-4.3