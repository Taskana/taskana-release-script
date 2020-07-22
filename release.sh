#!/bin/bash

tickets=()

for i in $1; do
  temp_tickets=( `git log --pretty=oneline "$2"..."$3" | egrep -o "$i-[[:digit:]]+" | grep -v TSK-1337 | cut -f2 -d "-" | sort -un` )
  tickets+=( ${temp_tickets[@]/#/$i-} )
done

echo "Tickets between $2 and $3:"

for i in ${tickets[@]}; do
  echo $i
done

echo ""
echo "Release notes:"

for i in ${tickets[@]}; do
  echo "[$i](https://taskana.atlassian.net/browse/$i): $(curl -s https://taskana.atlassian.net/rest/api/3/issue/$i | jq -r '.fields .summary')" 
done

filter="ID in ( $( echo ${tickets[@]/%/,} | sed 's/,$//') )"
echo ""
echo "jira filter:"
echo $filter
echo "URL:"
echo "https://taskana.atlassian.net/issues/?jql=$filter"
