#!/bin/bash

# This installs ASP.NET 5/.NET Core and is almost a copy-paste of the
# official instructions found online at
# http://dotnet.github.io/getting-started/

echo "= Install .NET Core ====================================================="

echo "Adding the .NET software channel..."
sudo sh -c 'echo "deb [arch=amd64] http://apt-mo.trafficmanager.net/repos/dotnet/ trusty main" > /etc/apt/sources.list.d/dotnetdev.list'

echo "Adding the .NET apt key..."
sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893 > /dev/null

echo "Updating package lists..."
sudo apt-get update > /dev/null

echo "Installing .NET Core..."
sudo apt-get -qq install dotnet=1.0.0.001598-1 > /dev/null 2>&1
