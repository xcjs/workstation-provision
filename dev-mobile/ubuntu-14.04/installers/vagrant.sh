#!/bin/bash

version=1.8.1
file=vagrant_${version}_x86_64.deb

originalPath=$(pwd)

echo "= Install Vagrant ======================================================="

echo "Downloading Vagrant..."
wget -q "https://releases.hashicorp.com/vagrant/${version}/${file}"

echo "Installing Vagrant..."
sudo dpkg -i "${file}" > /dev/null

echo "Cleaning up..."
rm "${file}"

echo "Installing Ruby gem prerequsisites..."
sudo apt-get -qq install build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev autoconf libc6-dev ncurses-dev automake libtool > /dev/null 2>&1

echo "Refreshing the command cache..."
hash -r

echo "Installing vagrant-vbguest..."
sudo vagrant plugin install vagrant-vbguest > /dev/null

echo "Installing vagrant-digitalocean..."
sudo vagrant plugin install vagrant-digitalocean > /dev/null

echo "Installing vagrant-linode..."
sudo vagrant plugin install vagrant-linode > /dev/null

cd "${originalPath}"

echo
