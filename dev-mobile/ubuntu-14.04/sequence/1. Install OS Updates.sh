#!/bin/bash

"Refreshing the package cache..."
sudo -E apt-get -qq update > /dev/null 2>&1

echo "Checking for and installing operating system updates..."
sudo -E apt-get -qq upgrade > /dev/null 2>&1 && sudo -E apt-get -qq dist-upgrade > /dev/null 2>&1
