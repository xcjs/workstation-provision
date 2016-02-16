#!/bin/bash

echo "Updating NPM..."
sudo npm install -g npm /dev/null

# Install commonly used npm packages globally

echo "Installing Grunt..."
sudo npm install -g grunt-cli > /dev/null

echo "Installing Gulp..."
sudo npm install -g gulp > /dev/null

echo "Installing Bower..."
sudo npm install -g bower > /dev/null

echo "Installing Sails..."
sudo npm install -g sails > /dev/null
