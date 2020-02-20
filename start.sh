#!/bin/bash

first=$1 second=$2 docker-compose -f $(dirname $0)/docker-compose.yml up
