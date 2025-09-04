#!/bin/bash
if [[ ! "$dirname" =~ ^[A-Za-z]+$ || ${#dirname} -gt 7 ]]; then
    echo "Ошибка!!! Неправильный ввод названия папки"
    exit 1
fi


fileName="${namefile%%.*}"
fileExt="${namefile#*.}"

if [[ -z "$fileName" || -z "$fileExt" || ${#fileName} -gt 7 || ${#fileExt} -gt 3 || \
      "$fileName" =~ [^A-Za-z] || "$fileExt" =~ [^A-Za-z] ]]; then
    echo "Ошибка!!! Неправильный ввод названия файлов"
    exit 1
fi

sizeLower="${size,,}"
filesize="${sizeLower%mb}"
if [[ ! "$sizeLower" =~ ^[0-9]+mb$ || $filesize -le 0 || $filesize -gt 100 ]]; then
    echo "Ошибка!!! Неправильный размер"
    exit 1
fi

source ./add_file.sh
