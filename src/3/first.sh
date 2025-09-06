#!/bin/bash

echo "Введите путь logfile"
read log
remfiles=$(cat ../02/"$log"| awk -F'|' '{print $2}')
if [ -e ../02/"$log" ]; then 
    echo "okey.Let's go"
    for delete in $remfiles
    do
    sudo rm -rf $delete
    done
else 
    echo "$log не найден"
fi
