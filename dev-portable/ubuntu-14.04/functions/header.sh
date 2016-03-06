header () {
	echo
	separator
	echo
	echo "${1}"
	separator
	echo	
}

separator () {
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' _	
}
