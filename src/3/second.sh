#!/bin/bash

pattern='[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}'
echo "Input start time (YYYY-MM-DD HH:MM):"
read time_start
echo "Input end time (YYYY-MM-DD HH:MM):"
read time_end

if [[ $time_start =~ $pattern ]] && [[ $time_end =~ $pattern ]]; then
    find / -type d -newerct "$time_start" ! -newerct "$time_end" -name "*_[0-9][0-9][0-9][0-9][0-9][0-9]" 2>/dev/null | while read -r dir; do
        rm -rf "$dir"
    done
    find / -type f -newerct "$time_start" ! -newerct "$time_end" -name "*.[a-z]*_[0-9][0-9][0-9][0-9][0-9][0-9]" 2>/dev/null | while read -r file; do
        rm -rf "$file"
    done
else
    echo "Wrong data format"
fi
