#!/bin/bash
#Iterates your workspace folders and calls git pull on each git project

#Replace with your workspace path
WORKSPACE="/c/workspace/workspace_git/"

cd $WORKSPACE
echo -e "Pulling for $WORKSPACE"

for dir in $(find . -maxdepth 1 -type d); do
	#Add excludes for folders here, e.g.
	#if [[ "$dir" == *foldername* ]]; ..
	#to either skip or visit certain folders	
	cd $dir
	if [ -d .git ]; then
		echo $dir | cut -d'/' -f 2
		git pull origin $(git branch | sed -n -e 's/^\* \(.*\)/\1/p')	
		#To print origin uncomment the following line
		#git remote -v
		#To exclude up-to-date messages uncomment the following lines
		#R=$(git pull 2>&1)
		#if [ "$R" != "Already up-to-date." ]; then
			#echo $R
		#fi
		echo
	fi
	cd $WORKSPACE
done

echo -e "\nFinished.\n"