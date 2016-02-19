#!/bin/bash

echo "= Install Node.js 5.x ==================================================="

curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -

echo "Installing nodejs..."
sudo apt-get -qq install nodejs nodejs-legacy npm > /dev/null 2>&1

echo "Installing nodejs-legacy..."
sudo apt-get -qq install nodejs-legacy > /dev/null 2>&1

echo "Installing npm..."
sudo apt-get -qq install npm > /dev/null 2>&1

echo "Updating NPM..."
sudo npm install -g npm /dev/null

# Install commonly used npm packages globally

echo "Installing Grunt..."
sudo npm install -g grunt-cli > /dev/null

echo "Installing Gulp..."
sudo npm install -g gulp > /dev/null

echo "Installing Bower..."
sudo npm install -g bower > /dev/null

echo "Installing Express..."
sudo npm install -g express > /dev/null

echo "Installing Sails..."
sudo npm install -g sails > /dev/null
