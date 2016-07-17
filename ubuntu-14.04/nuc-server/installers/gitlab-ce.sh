#!/bin/bash

echo "Installing GitLab dependencies..."
sudo apt-get install curl openssh-server ca-certificates postfix

echo "Executing the GitLab setup script..."
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

echo "Installing GitLab..."
sudo apt-get install gitlab-ce > /dev/null 2>&1

echo "Reconfiguring GitLab..."
sudo gitlab-ctl reconfigure
