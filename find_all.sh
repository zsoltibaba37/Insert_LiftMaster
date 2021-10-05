#!/bin/bash


find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(cd {} && find_lst.sh)' \;
