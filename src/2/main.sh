#!/bin/bash

START=$(date +%s%N)
TIMES=$(date +%H:%M)

if [[ $# -eq 3 ]]; then
    dirname=$1
    namefile=$2
    size=$3
    
    source ./check_parametr.sh
    END=$(date +%s%N)
    DIFF=$((($END - $START)/1000000))
    TIMEE=$(date +%H:%M)
    echo "Время начала: $TIMES"
    echo "Время конца: $TIMEE"
    echo "Скрипт работает $DIFF ms"

    echo "">>logFiles
    echo "Start time: $TIMES" >>logFiles
    echo "End time: $TIMEE" >>logFiles
    echo "Script working $DIFF ms" >>logFiles
else
    echo "Ошибка ! Неправильные параметры 2.0"
fi