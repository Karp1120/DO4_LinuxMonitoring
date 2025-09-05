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

    echo "">>02.log
    echo "Start time: $TIMES" >>02.log
    echo "End time: $TIMEE" >>02.log
    echo "Script working $DIFF ms" >>02.log
else
    echo "Ошибка, неправильные параметры"
fi