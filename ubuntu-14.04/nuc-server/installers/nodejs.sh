#!/bin/bash

echo "= Install Node.js 5.x ==================================================="

curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash - > /dev/null

echo "Installing nodejs..."
sudo apt-get -qq install nodejs > /dev/null 2>&1

echo "Installing nodejs-legacy..."
sudo apt-get -qq install nodejs-legacy > /dev/null 2>&1

echo "Installing npm..."
sudo apt-get -qq install npm > /dev/null 2>&1

echo "Refreshing the command cache..."
hash -r

echo "Updating NPM..."
sudo npm install -g npm > /dev/null 2>&1

# Install commonly used npm packages globally
echo "Installing Bower..."
sudo npm install -g bower > /dev/null 2>&1

echo "Installing Gulp..."
sudo npm install -g gulp > /dev/null 2>&1
