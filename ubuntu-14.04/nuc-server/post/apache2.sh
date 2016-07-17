#!/bin/bash

blurConfSrc="./config/001-blur.conf"
blurConfDest="/etc/apache2/sites-available/001-blur.conf" 
apacheUser="www-data"

echo "Copying the BlurAdmin config into sites-available and setting permissions..."
sudo cp "${blurConfSrc}" "${blurConfDest}"
sudo chown "${apacheUser}" "${blurConfDest}"
sudo chgrp "${apacheUser}" "${blurConfDest}"

echo "Enabling the required proxy modules..."
sudo a2enmod proxy
sudo a2enmod proxy_http

echo "Enabling the BlurMontior site configuration..."
sudo a2ensite 001-blur.conf
