#!/bin/bash

# Install Composer and add it to the path
echo "Installing Composer..."
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin

echo "Adding Composer alias to the .bash_aliases file..."
touch ~/.bash_aliases
echo "alias composer='php /usr/local/bin/composer.phar'" >> ~/.bash_aliases
source ~/.bash_aliases

echo "Installing Laravel Installer..."
composer global require "laravel/installer=~1.1"
