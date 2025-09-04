#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Ошибка! На ввод должен приниматься один параметр"
    exit 1
else
    source ./parametr.sh
fi

