#!/bin/bash
#Iterates your workspace folders and calls git pull on each

#Replace with your workspace path
WORKSPACE="/c/workspace/workspace_git/"

cd $WORKSPACE

echo -e "\nPulling down latest for $WORKSPACE\n"

for d in $(find . -maxdepth 1 -type d); do
		#Add excludes for folders here, e.g.
		#if [[ "$d" == *foldername* ]]; ..
		#to either skip or visit certain folders
        echo -e "$d"
        cd $d
        git remote -v
        git pull
        cd $WORKSPACE
done

echo -e "\nFinished.\n"