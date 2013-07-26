#!/bin/bash
#Prints pull requests and issues from every repository of a given organisation

#Replace with your GitHub username and target organisation
GITHUB_USER="Username"
ORGANISATION="Organisation"

read -s -p "Password: " PASSWORD

REPOS=`curl -s -XGET -u "$GITHUB_USER:$PASSWORD" "https://api.github.com/orgs/$ORGANISATION/repos" | grep "full_name" | cut -d '/' -f 2 | cut -d '"' -f 1`

for i in ${REPOS[@]}
do
	resp=$(curl -s -u "$GITHUB_USER:$PASSWORD" "https://api.github.com/repos/$ORGANISATION/${i}/issues" | grep 'html_url' | cut -d '"' -f 4)
	if [ -n "$resp" ] 
	then
		echo -e "\n${i}"
		echo $resp
	fi
done
