#!/bin/bash

PPAS=$(read_lst "./conf/ppas.lst")

printf %s "$PPAS" | while IFS= read -r ppa; do
	echo "Adding package archive $ppa..."
	sudo -E add-apt-repository -y $ppa  > /dev/null 2>&1
done
