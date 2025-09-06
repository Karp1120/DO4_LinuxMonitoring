#!/bin/bash

echo "Введите путь к logfile (можно абсолютный или относительный)"
read -r log

if [ -e "$log" ]; then
    echo "okey. Let's go"
    awk -F'|' '{print $2}' "$log" | while read -r delete; do
        [ -n "$delete" ] && sudo rm -rf -- "$delete"
    done
else
    echo "Файл не найден: $log"
fi
