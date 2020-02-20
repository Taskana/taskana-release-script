#!/bin/bash
set -x
cd /git/taskana-release-script
git pull

cd /git/repo
../taskana-release-script/release.sh $1 $2 | tee /git/repo/release.txt
