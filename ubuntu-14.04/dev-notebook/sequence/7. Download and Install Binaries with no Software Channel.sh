#!/bin/bash

for file in $(ls ./${configuration}/installers/*.sh); do

	echo "Executing custom installer ${file}..."
	"${file}"

done
