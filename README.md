# taskana-release-script

This repo contains a release util script which helps detecting all tickets done between two commits / tags.

This script will 
- print all ticket numbers (TSK-XXX)
- generate release notes. Fomrat [TSK-XXX]: <ticket description from jira>
- generate jira filter to see all tickets. This can be used to perform bulk operations with those tickets.


Usage: `./release <tag|commit id> [tag|commit id]`
