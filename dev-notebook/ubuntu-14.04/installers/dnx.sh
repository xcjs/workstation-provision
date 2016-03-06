#!/bin/bash

# This installs ASP.NET 5/.NET Core and is almost a copy-paste of the
# official instructions found online at
# http://docs.asp.net/en/latest/getting-started/installing-on-linux.html

echo "= Install .NET Core ====================================================="

originalPath=$(pwd)
cd ~/

echo "Installing the .NET Core prerequsisites..."
sudo apt-get -qq install \
	unzip \
	curl \
	libunwind8 \
	gettext \
	libssl-dev \
	libcurl4-openssl-dev \
	zlib1g \
	libicu-dev \
	uuid-dev \
	make \
	automake \
	libtool \
	curl
> /dev/null 2>&1

echo "Downloading the dnvminstall.sh script and sourcing it..."
curl -sSL https://raw.githubusercontent.com/aspnet/Home/release/dnvminstall.sh | DNX_BRANCH=release sh && source ~/.dnx/dnvm/dnvm.sh

echo "Installing the .NET Core CLR..."
dnvm upgrade -r coreclr

echo "Building Libuv"
curl -sSL https://github.com/libuv/libuv/archive/v1.8.0.tar.gz | sudo tar zxfv - -C /usr/local/src

cd /usr/local/src/libuv-1.8.0
sudo sh autogen.sh
sudo ./configure
sudo make
sudo make install
sudo rm -rf /usr/local/src/libuv-1.8.0 && cd ~/
sudo ldconfig

cd "${originalPath}"
