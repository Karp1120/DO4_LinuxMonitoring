#!/bin/bash

echo "Введите имя лог-файла (по умолчанию 02.log):"
read log
log=${log:-02.log}

if [ -f "./$log" ]; then
    echo "okey. Let's go"
    awk -F'|' '{print $2}' "./$log" | while read -r path; do
        [ -n "$path" ] && rm -rf "$path"
    done
else
    echo "$log не найден"
fi
