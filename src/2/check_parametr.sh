#!/bin/bash
if [[ ! "$dirname" =~ ^[A-Za-z]+$ || ${#dirname} -gt 7 ]]; then
    echo "Ошибка! Неправильное имя папки (только буквы, ≤7)"
    exit 1
fi

fileName="${namefile%%.*}"
fileExt="${namefile#*.}"

if [[ -z "$fileName" || -z "$fileExt" || ${#fileName} -gt 7 || ${#fileExt} -gt 3 || \
      "$fileName" =~ [^A-Za-z] || "$fileExt" =~ [^A-Za-z] ]]; then
    echo "Ошибка! Неправильное имя файла или расширение"
    exit 1
fi

sizeLower="${size,,}"
filesize="${sizeLower%mb}"
if [[ ! "$sizeLower" =~ ^[0-9]+mb$ || $filesize -le 0 || $filesize -gt 100 ]]; then
    echo "Ошибка! Размер должен быть от 1 до 100 Mb"
    exit 1
fi

source ./add_file.sh
