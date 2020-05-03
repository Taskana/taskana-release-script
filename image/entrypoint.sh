#!/bin/bash
set -x
cd /git/taskana-release-script
git pull

cd /git/repo
../taskana-release-script/release.sh "$@" | tee /git/repo/release.txt
