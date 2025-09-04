#!/bin/bash

pattern='[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}'
file_name='[a-z]+_[0-9]{6}'
echo "Input start time for search in format YYYY-MM-DD HH:MM"
read time_start
echo "Input end time for search in format YYYY-MM-DD HH:MM"
read time_end
if [[ $time_start =~ $pattern ]] && [[ $time_end =~ $pattern ]]; then
    for var in $(sudo find / -type d -newerct "$time_start" ! -newerct "$time_end")
    do
    if [[ $var =~ $file_name ]]; then
       sudo rm -rf $var
    fi
    done
else
    echo "Wrong data format"
fi