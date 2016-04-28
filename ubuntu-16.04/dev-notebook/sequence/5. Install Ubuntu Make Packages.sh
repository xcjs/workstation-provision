#!/bin/bash

packages=$(read_lst "./lst/umake.lst")

printf %s "${packages}" | while IFS= read -r package; do
    read -a args <<< $package
    packageName="${args[1]}"

	echo "Installing umake package ${packageName}..."
	umake ${package} > /dev/null 2>&1
done
