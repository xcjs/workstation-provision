#!/bin/bash

# Install Composer and add it to the path
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin
touch ~/.bash_aliases
echo "alias composer='php /usr/local/bin/composer.phar'" >> ~/.bash_aliases
source ~/.bash_aliases
