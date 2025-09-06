#!/bin/bash

if [ $1 -eq 1 ]; then
   source ./first.sh
elif [ $1 -eq 2 ]; then
   source ./second.sh
elif [ $1 -eq 3 ]; then
   source ./third.sh
else 
    echo "Ошибка! Принимаются только цифры: 1, 2, 3."
    exit 1
fi