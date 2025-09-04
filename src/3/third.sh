#!/bin/bash

echo "Input name mask"
read pattern
letters=$(echo "${pattern%_*}" | sed 's/\S/&+/g')
date=${pattern#*_}
pattern="${letters}_${date}"
for var in $(sudo find / | grep -E "$letters_$date")
    do
       sudo rm -rf $var
done
