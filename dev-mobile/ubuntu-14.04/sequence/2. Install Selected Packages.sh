#!/bin/bash

PACKAGES=$(read_lst "./conf/packages.lst")

printf %s "$PACKAGES" | while IFS= read -r package; do
	if test -x "./pre/${package}.sh"
	then
		echo 
		echo "There is a script to run before installing ${package}."
		echo "Executing ./pre/${package}.sh..."
		./pre/${package}.sh
		echo
	fi

	echo "Installing $package..."
	sudo -E apt-get -qq install $package > /dev/null 2>&1

	if test -x "./post/${package}.sh"
		then 
			echo
			echo "There is a script to run after installing ${package}."
			echo "Executing ./post/${package}.sh..."
			./post/${package}.sh
			echo
	fi
done
