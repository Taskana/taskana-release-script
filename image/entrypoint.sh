#!/bin/bash
set -x
set -e # fail fast
cd /git/taskana-release-script
git pull

cd /git/repo 
../taskana-release-script/release.sh "$@" | tee /git/repo/release.txt
