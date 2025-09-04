#!/bin/bash
touch 01.log error.log
: > 01.log
: > error.log

date_tag="$(date +"%d%m%y")"
human_date="$(date +"%d.%m.%y")"

make_core_name() {
  local alphabet="$1" # исходная последовательность букв из параметров
  local repeats="$2"  # сколько ПОЛНЫХ повторов добавить
  local core="$alphabet" # начинаем имя с одного полного прохода
  local i
  for ((i=0;i<repeats;i++)); do 
    core+="$alphabet" # добавления одной строки в конец другой строки или конкатенация
  done
  while [ ${#core} -lt 4 ]; do
    core+="$alphabet"
  done
  echo "$core"
}

space_check() {
  if [ -f "./check_space.sh" ]; then
    bash ./check_space.sh || exit 1
  fi
}


space_check
# кол-во папок
for (( d=1; d<=numbdir; d++ )); do
  space_check

  dir_core="$(make_core_name "$dirname" $((d-1)))" 
  dir_name="${dir_core}_${date_tag}"
  dir_path="${url%/}/$dir_name"

  mkdir -p "$dir_path" 2>> error.log
  echo "${human_date} | ${dir_path} | created directory" >> 01.log
  # числа файлов
  for (( f=1; f<=numbfile; f++ )); do
    space_check

# минимальная длина, сохранение порядка и использование всех букв.
    file_core="$(make_core_name "$filename" $((f-1)))"
# добвляем расширение .ext and date
    file_full="${file_core}.${fileExt}_${date_tag}"
    # полныый путь
    file_path="${dir_path}/${file_full}"

    if ! dd if=/dev/zero of="$file_path" bs=1K count="$filesize" status=none 2>> error.log; then
      echo "Failed to create file: $file_path" >> error.log
      exit 1
    fi

    echo "${human_date} | ${file_path} | Size of file = ${filesize} Kb." >> 01.log
  done
done

echo "Готово. Записан в 01.log."
