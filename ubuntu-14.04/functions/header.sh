header () {
	echo
	separator
	echo "${1}"
	separator
	echo	
}

separator () {
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' _	
}