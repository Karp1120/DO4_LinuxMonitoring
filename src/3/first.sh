#!/bin/bash

echo "Введите имя лог-файла (по умолчанию 02.log):"
read log
log=${log:-02.log}

if [ -f "./$log" ]; then
    echo "okey. Let's go"
    awk -F'|' '{print $2}' "./$log" | sed 's/^ *//;s/ *$//' | while read -r path; do
        if [ -n "$path" ]; then
            rm -rf "$path"
            echo "Удалено: $path"
        fi
    done
else
    echo "$log не найден"
fi
