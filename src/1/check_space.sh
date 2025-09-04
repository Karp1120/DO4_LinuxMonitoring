#!/bin/bash

sizef=$(df -k / | awk 'NR==2 {print $4}') # свободное место на разделе / в килобайтах
if [[ $sizef -le 1048576 ]]; then
	echo "The / partition is less than or equal to 1 GB. Script stopped!"
	exit 1
fi