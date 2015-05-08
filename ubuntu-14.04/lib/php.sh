#!/bin/bash

# Install Composer and add it to the path
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin
echo "alias composer='php /usr/local/bin/composer.phar'" >> ~/.bashrc
source ~/.bashrc