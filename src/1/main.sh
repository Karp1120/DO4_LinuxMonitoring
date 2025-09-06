#!/bin/bash

if [ $# -eq 6 ]; then
    source ./check_parametr.sh
    source ./check_space.sh
    source ./add_file.sh
else 
    echo " Ошибка! Неполучено 6 параметров"
    exit 1
fi