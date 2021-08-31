#!/bin/bash

tickets=()

for i in $1; do
  temp_tickets=( $(git log --pretty=oneline "$2"..."$3" | grep -E -o "$i-[[:digit:]]+" | cut -f2 -d "-" | sort -un) )
  tickets+=( "${temp_tickets[@]/#/$i-}" )
done

echo "Tickets between $2 and $3:"

for i in "${tickets[@]}"; do
  echo "$i"
done

echo ""
echo "**Complete list of features and fixes**"

for i in "${tickets[@]}"; do
  echo "* [$i](https://taskana.atlassian.net/browse/$i): $(curl -s https://taskana.atlassian.net/rest/api/3/issue/"$i" | jq -r '.fields .summary')"
done

filter="ID in ( $( echo "${tickets[@]/%/,}" | sed 's/,$//') )"
echo ""
echo "jira filter:"
echo "$filter"
echo "URL:"
filter=$(echo "$filter" | sed 's/ /%20/g; s/,/%2C/g')
echo "https://taskana.atlassian.net/issues/?jql=$filter"
