#!/bin/bash

START=$(date +%s)
TIME_START=$(date +%H:%M)

if [[ $# -eq 3 ]]; then
    dirname=$1      
    namefile=$2     
    size=$3         

    source ./check_parametr.sh

    END=$(date +%s)
    DIFF=$((END - START))
    TIME_END=$(date +%H:%M)

    echo "Время начала: $TIME_START"
    echo "Время конца: $TIME_END"
    echo "Скрипт работал $DIFF секунд"

    {
      echo ""
      echo "Start time: $TIME_START"
      echo "End time:   $TIME_END"
      echo "Script working $DIFF sec"
    } >> 02.log
else
    echo "Ошибка! Неправильные параметры"
    echo "Пример: ./main.sh az az.az 3Mb"
    exit 1
fi
