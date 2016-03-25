#!/bin/bash

echo "Selecting the desktop as an installed feature..."
dpkg -s ubuntu-desktop > /dev/null 2>&1

# Execute the Fix Ubuntu script to ensure additional privacy.
echo "Executing the fixubuntu script..."
"./${configuration}/lib/fixubuntu.sh" > /dev/null 2>&1
