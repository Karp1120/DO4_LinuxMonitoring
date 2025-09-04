#!/bin/bash

echo "Input name mask (например: az_040925)"
read pattern
if [ -z "$pattern" ]; then
    echo "Mask cannot be empty"
    exit 1
fi

find / -name "*$pattern*" 2>/dev/null | while read -r item; do
    rm -rf "$item"
done
