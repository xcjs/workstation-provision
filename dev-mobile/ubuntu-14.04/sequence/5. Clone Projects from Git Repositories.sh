#!/bin/bash

GITREPOS=$(read_lst "../conf/git-repos.lst") 

cd ~/

printf %s "$GITREPOS" | while IFS= read -r repo; do
	repo=($repo)
	echo "Cloning $repo..."
	eval git clone "${repo[@]}"
done

cd ${SCRIPTPATH}
