#!/bin/bash

tickets=( `git log --pretty=oneline "$1"..."$2" | grep TSK- | sed s/.*TSK/TSK/ | cut -c1-9 | sed -e s/\ .*// -e s/:// | sort -u | cut -c5-9 | sort -n` )

echo "Tickets between $1 and $2:"

for i in ${tickets[@]}; do
  echo TSK-$i
done

echo ""
echo "Release notes:"

for i in ${tickets[@]}; do
  echo "[TSK-$i](https://taskana.atlassian.net/browse/TSK-$i): $(curl -s https://taskana.atlassian.net/rest/api/3/issue/TSK-$i | jq -r '.fields .summary')" 
done

filter="ID in ( $(echo TSK-${tickets[@]} | sed s/\ /,\ TSK-/g) )"
echo ""
echo "jira filter:"
echo $filter
echo "URL:"
echo "https://taskana.atlassian.net/browse/TSK-${tickets[0]}?jql=$filter"
