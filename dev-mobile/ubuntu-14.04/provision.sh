#!/bin/bash

screenWorkaround=false

# Terminal correction for binaries that don't like screen.xterm as a terminal.
if [ "${TERM}" == "screen.xterm" ]; then
		TERM="xterm"
		screenWorkaround=true
fi

export DEBIAN_FRONTEND=noninteractive

# Load functions
source ./functions/header.sh
source ./functions/read_lst.sh

# Export shared functions
export -f read_lst

export SCRIPTPATH="$(dirname -- "$(readlink -f -- "$0")")"

log=./provision.log
errorLog=./provision-errors.log
# Copy STDOUT to a log
exec >  >(tee -a "${log}")
# Copy STDERR to log and STDERR only to errorLog
exec 2> >(tee -a "${log}" >&2)
exec 2> >(tee -a "${errorLog}" >&2)

cd $SCRIPTPATH

for script in $(ls ./sequence/*.sh | sort -n); do
	header $(basename "$script")
	sh "${script}"

	cd $SCRIPTPATH
done

# Clean-up exported variables and functions
unset DEBIAN_FRONTEND
unset SCRIPTPATH
unset -f read_lst

if ${screenWorkaround}; then
	TERM="screen.xterm"
fi
