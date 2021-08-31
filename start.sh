#!/bin/bash

args=()
for i in "$@"; do
  args+=("$i")
done
args=${args[*]} docker-compose -f "$(dirname "$0")/docker-compose.yml" up
