#!/bin/bash

read_lst () {
	# grep while ignoring blank lines or lines that begin with #
	#
	# read also ends when a newline cannot be found, so append one to the end
	# to ensure that the last line is parsed.
    grep -vE "^(\s*$|#)" ${1} && echo "\n"
}
