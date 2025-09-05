#!/bin/bash

if [[ $# != 1 || $1 =~ [^1-4] ]]; then
    echo "Ошибка данных"
else
    param=$1
    source ./sort.sh
fi

#proverkaproverkaproverkaproverkaproverkaproverkaproverkaproverka