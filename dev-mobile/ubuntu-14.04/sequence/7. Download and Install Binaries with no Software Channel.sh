#!/bin/bash

for file in $(ls ../installers/*.sh); do

	echo "Executing custom installer ${file}..."
	sh $file

done
