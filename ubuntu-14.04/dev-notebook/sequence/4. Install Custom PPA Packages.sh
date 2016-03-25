#!/bin/bash

ppaPackages=$(read_lst "./${configuration}/lst/ppa-packages.lst")

echo "Checking for and installing third party PPA package updates..."
sudo apt-get -qq update && sudo -E apt-get -qq upgrade > /dev/null 2>&1 && sudo -E apt-get -qq dist-upgrade > /dev/null 2>&1

printf %s "${ppaPackages}" | while IFS= read -r package; do
	if test -x "./${configuration}/pre/${package}.sh"
		then
			echo
			echo "There is a script to run before installing ${package}."
			echo "Executing ./${configuration}/pre/${package}.sh..."
			"./${configuration}/pre/${package}.sh"
			echo
	fi

	echo "Installing $package..."
	sudo -E apt-get -qq install "${package}" > /dev/null 2>&1

	if test -x "./post/${package}.sh"
		then
			echo
			echo "There is a script to run after installing ${package}."
			echo "Executing ./${configuration}/post/${package}.sh..."
			"./${configuration}/post/${package}.sh"
			echo
	fi
done
