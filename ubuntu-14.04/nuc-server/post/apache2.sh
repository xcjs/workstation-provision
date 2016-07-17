#!/bin/bash

blurConfSrc="./config/apache2/001-blur.conf"
blurConfDest="/etc/apache2/sites-available/001-blur.conf" 
apacheUser="www-data"

echo "Copying the BlurAdmin config into sites-available and setting permissions..."
sudo cp "${blurConfSrc}" "${blurConfDest}"
sudo chown "${apacheUser}" "${blurConfDest}"
sudo chgrp "${apacheUser}" "${blurConfDest}"

echo "Enabling the required proxy modules..."
sudo a2enmod proxy > /dev/null 2>&1
sudo a2enmod proxy_http > /dev/null 2>&1

echo "Enabling the BlurMontior site configuration..."
sudo a2ensite 001-blur.conf > /dev/null 2>&1

echo "Restarting apache2..."
sudo service apache2 restart > /dev/null 2>&1
