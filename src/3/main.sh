#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Ошибка! Укажите один параметр (1, 2 или 3)"
  exit 1
fi



case $1 in
  1) source ./first.sh ;;
  2) source ./second.sh ;;
  3) source ./third.sh ;;
  *) echo "Ошибка! Параметр должен быть 1, 2 или 3" ;;
esac
