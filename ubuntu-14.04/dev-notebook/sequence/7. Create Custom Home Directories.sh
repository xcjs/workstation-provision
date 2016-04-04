#!/bin/bash

originalPath=$(pwd)

echo "Making custom home directories..."
mkdir -p ~/Auth ~/Projects ~/src ~/.icons ~/.themes ~/Pictures/UI

echo "Linking local theme resources for gksu application support..."
# Link local icons and themes folder so that gksu applications still look correct.
cd ~/
sudo ln -s .icons /root/.icons
sudo ln -s .themes /root/.themes

echo "Linking the Flattr icon themes..."
ln -s .icons/flattr-icons/Flattr .icons/Flattr
ln -s .icons/flattr-icons/Flattr-Dark .icons/Flattr-Dark

cd "${originalPath}"
