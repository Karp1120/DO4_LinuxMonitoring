#!/bin/bash

url="$1"
numbdir="$2"
dirname="$3"
numbfile="$4"
abc="$5"
size="$6"

if [[ ! "$url" =~ ^/ ]]; then
  echo "Ошибка 1 параметра: путь должен быть абсолютным (начинаться с /)"
  exit 1
fi
if [[ ! -d "$url" ]]; then
  echo "Ошибка 1 параметра: директория $url не существует"
  exit 1
fi


if [[ ! "$numbdir" =~ ^[0-9]+$ ]] || (( numbdir <= 0 )); then
  echo "Ошибка 2 параметра: должно быть положительное число"
  exit 1
fi

if [[ -z "$dirname" || ${#dirname} -gt 7 || "$dirname" =~ [^A-Za-z] ]]; then # -z - оператор для проверки пустой строки ( истона если "$a" не задана или пустая)
  echo "Ошибка 3 параметра: 1..7 английских букв (A–Z)"
  exit 1
fi

if [[ ! "$numbfile" =~ ^[0-9]+$ ]] || (( numbfile <= 0 )); then
  echo "Ошибка 4 параметра: должно быть положительное число"
  exit 1
fi

filename="${abc%%.*}" # abc%%. удалит самый длинный суффикс до точки
fileExt="${abc#*.}" # удалиn самый короткий префикс до точки. пример az.az -> filename = az fileext = az

if [[ "$filename" == "$abc" ]]; then
  echo "Ошибка 5 параметра: укажите в формате name.ext"
  exit 1
fi
if [[ -z "$filename" || -z "$fileExt" ]]; then 
  echo "Ошибка 5.1 параметра: пустое имя или расширение"
  exit 1
fi
if [[ ${#filename} -gt 7 || ${#fileExt} -gt 3 ]]; then
  echo "Ошибка 5.2 параметра: имя ≤ 7 символов, расширение ≤ 3 символов"
  exit 1
fi
if [[ "$filename" =~ [^A-Za-z] || "$fileExt" =~ [^A-Za-z] ]]; then
  echo "Ошибка 5.3 параметра: имя и расширение должны состоять только из английских букв"
  exit 1
fi

lower="${size,,}"    # строку к нижнему ригустру         
if [[ ! "$lower" =~ ^[0-9]+kb$ ]]; then
  echo "Ошибка 6 параметра: формат, например 3kb (1..100kb)"
  exit 1
fi
filesize="${lower%kb}" # Убирает kb, оставляя только число
if [[ ! "$filesize" =~ ^[0-9]+$ ]] || (( filesize <= 0 || filesize > 100 )); then
  echo "Ошибка 6.1 параметра: размер должен быть в диапазоне 1..100kb"
  exit 1
fi
