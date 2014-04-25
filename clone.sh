#!/bin/bash
#Clone all of the given organisations projects to your workspace

#Replace with your workspace path
WORKSPACE="Path"

#Replace with your GitHub username and target organisation
GITHUB_USER="Username"
ORGANISATION="Organisation"

cd $WORKSPACE
read -s -p "Password: " PASSWORD

REPOS=`curl -s -XGET -u "$GITHUB_USER:$PASSWORD" "https://api.github.com/orgs/$ORGANISATION/repos" | grep "full_name" | cut -d '/' -f 2 | cut -d '"' -f 1`

for i in ${REPOS[@]}
do
	git clone git@github.com:$ORGANISATION/$i
done

echo -e "\nFinished.\n"
