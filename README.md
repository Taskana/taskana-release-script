# taskana-release-script

This repo contains a release util script which helps detecting all tickets done between two commits / tags.

This script will 
- print all ticket numbers (TSK-XXX)
- generate release notes. Fomrat [TSK-XXX]: <ticket description from jira>
- generate jira filter to see all tickets. This can be used to perform bulk operations with those tickets.


Usage: `./release.sh <tag|commit id> [tag|commit id]`

### Docker (& docker-compose)

In order to use the release script for windows there is a `start.bat` script. 
- Its parameters are the same as those from `release.sh`. 
- It will mount the current director and use it as git referece (Docker Desktop needs share permissions)
- After completion it will write `release.txt` containing all information.
