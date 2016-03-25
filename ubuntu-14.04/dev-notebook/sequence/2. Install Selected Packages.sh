#!/bin/bash

packages=$(read_lst "./${configuration}/lst/packages.lst")

printf %s "${packages}" | while IFS= read -r package; do
	if test -x "./${configuration}/pre/${package}.sh"; then
		echo
		echo "There is a script to run before installing ${package}."
		echo "Executing ./${configuration}/pre/${package}.sh..."
		"./${configuration}/pre/${package}.sh"
		echo
	fi

	echo "Installing $package..."
	sudo -E apt-get -qq install $package > /dev/null 2>&1

	if test -x "./post/${package}.sh"; then
		echo
		echo "There is a script to run after installing ${package}."
		echo "Executing ./${configuration}/post/${package}.sh..."
		"./${configuration}/post/${package}.sh"
		echo
	fi
done
