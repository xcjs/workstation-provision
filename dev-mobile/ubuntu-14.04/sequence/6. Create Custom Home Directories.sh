#!/bin/bash

mkdir -p ~/bin ~/Projects ~/src ~/.icons ~/.themes ~/Pictures/UI

# Link local icons and themes folder so that gksu applications still look correct.
cd ~/
sudo ln -s .icons /root/.icons
sudo ln -s .themes /root/.themes 
