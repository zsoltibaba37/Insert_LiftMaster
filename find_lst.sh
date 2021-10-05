#!/bin/bash


find . -maxdepth 1 -type f -name "*.LST" -exec ins_lm.sh {} \;
