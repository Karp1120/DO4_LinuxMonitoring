#!/bin/bash

START=$(date +%s)
TIMES=$(date +%H:%M)

if [[ $# -eq 3 ]]; then
    dirname=$1
    namefile=$2
    size=$3

    source ./check_parametr.sh

    END=$(date +%s)
    DIFF=$((END - START))
    TIMEE=$(date +%H:%M)

    echo "Время начала: $TIMES"
    echo "Время конца: $TIMEE"
    echo "Скрипт работал $DIFF секунд"

    {
      echo ""
      echo "Start time: $TIMES"
      echo "End time: $TIMEE"
      echo "Script working $DIFF sec"
    } >> 02.log
else
    echo "Ошибка, неправильные параметры"
    exit 1
fi
