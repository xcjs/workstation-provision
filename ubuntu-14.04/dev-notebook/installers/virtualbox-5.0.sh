#!/bin/bash

echo "= Install Virtualbox 5.0 ================================================"

# Grab the latest version of Virtualbox from the Oracle repository.
echo "Adding Oracle channel for Virtualbox 5.0..."
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" >> /etc/apt/sources.list.d/virtualbox.list'

echo "Installing Virtualbox 5.0..."
sudo apt-get -qq update && sudo apt-get -qq install virtualbox-5.0
