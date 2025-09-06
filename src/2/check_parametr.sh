#!/bin/bash

if [[ (!"$dirname" =~ ^[A-Za-z]+$) || (${#firstParam} -gt 7) ]]; then
    echo "Ошибка! Неправильный ввод названия папки 2.1"
    exit 1
fi

fileName="$(echo $namefile | awk -F. '{print $1}')"
fileExt="$(echo $namefile | awk -F. '{print $2}')"
if [[ ${#fileName} > 7 || ${#fileExt} > 3 ||\
    $fileName =~ [^A-Za-z] || $fileExt =~ [^A-Za-z] ||\
    ($fileExt == "") || ${#fileName} < 1 ]]; then
    echo "Ошибка! Неправильный ввод названия файлов 2.1" 
    exit 1
fi

filesize=$(echo $size | awk -F"Mb" '{print $1}')
if [[ !($size =~ Mb$) || ($filesize =~ [^0-9]) || ($filesize -gt 100) || ($filesize -le 0) ]]; then
    echo "Ошбка! неправильный размер 2.3"
    exit 1
fi

source ./add_file.sh