#!/bin/bash

for file in $(ls ./installers/*.sh) do
	cd $SCRIPTPATH

	echo "Executing custom installer ${file}..."
	sh $file

	cd $SCRIPTPATH	
done
