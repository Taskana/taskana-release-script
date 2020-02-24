#!/bin/bash

tickets=( `git log --pretty=oneline "$2"..."$3" | grep "$1-" | sed s/.*$1/$1/ | cut -d ' ' -f 1 | sort -u | cut -c$(( ${#1} + 2 ))-9 | sort -n` )

echo "Tickets between $2 and $3:"

for i in ${tickets[@]}; do
  echo "$1-$i"
done

echo ""
echo "Release notes:"

for i in ${tickets[@]}; do
  echo "[$1-$i](https://taskana.atlassian.net/browse/$1-$i): $(curl -s https://taskana.atlassian.net/rest/api/3/issue/$1-$i | jq -r '.fields .summary')" 
done

filter="ID in ( $(echo $1-${tickets[@]} | sed s/\ /,\ $1-/g) )"
echo ""
echo "jira filter:"
echo $filter
echo "URL:"
echo "https://taskana.atlassian.net/browse/$1-${tickets[0]}?jql=$filter"
