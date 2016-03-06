#!/bin/bash

ppas=$(read_lst "./conf/ppas.lst")

printf %s "${ppas}" | while IFS= read -r ppa; do
	echo "Adding package archive ${ppa}..."
	sudo -E add-apt-repository -y "${ppa}"  > /dev/null 2>&1
done
