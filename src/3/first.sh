#!/bin/bash

echo "Введите имя лог-файла (по умолчанию 02.log):"
read log

remfiles=$(cat ../02/"$log"| awk -F'|' '{print $2}')
if [ -e ../02/"$log" ]; then 
    echo "start"
    for delete in $remfiles
    do
    sudo rm -rf $delete
    done
else 
    echo "$log не найден"
fi
