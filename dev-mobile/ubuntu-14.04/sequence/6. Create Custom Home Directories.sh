#!/bin/bash

echo "Making custom home directories..."
mkdir -p ~/bin ~/Projects ~/src ~/.icons ~/.themes ~/Pictures/UI

echo "Linking local theme resources for gksu application support..."
# Link local icons and themes folder so that gksu applications still look correct.
cd ~/
sudo ln -s .icons /root/.icons
sudo ln -s .themes /root/.themes 
