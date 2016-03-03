#!/bin/bash

originalPath=$(pwd)
gitRepos=$(read_lst "./conf/git-repos.lst") 

cd ~/

printf %s "${gitRepos}" | while IFS= read -r repo; do
	repo=($repo)
	echo "Cloning $repo..."
	eval git clone "${repo[@]}"
done

cd "${originalPath}"
