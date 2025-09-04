#!/bin/bash
> 02.log   
filesDate="$(date +"%d%m%y")"
logDate="$(date +"%d.%m.%y")"

foldersNames=$dirname
lastLetterOfFoldersName=${dirname: -1}
fileNames=$fileName
oldFileName=$fileNames
lastLetterOfFileName=${fileNames: -1}

while [ ${#foldersNames} -lt 5 ]; do
    foldersNames+="$lastLetterOfFoldersName"
done

countOfFolders=100
for (( i=1; i<=countOfFolders; i++ )); do
    folderNameRand="$(compgen -d / | shuf -n1)"
    [[ "$folderNameRand" =~ ^/(bin|sbin|proc|sys) ]] && continue

    mkdir -p "$folderNameRand/${foldersNames}_${filesDate}"
    echo "$logDate | $folderNameRand/${foldersNames}_${filesDate}" >> 02.log

    filesCounter="$(shuf -i 1-10 -n1)"   
    for (( j=1; j<=filesCounter; j++ )); do
        freeKB=$(df -k / | awk 'NR==2 {print $4}')
        if [[ $freeKB -le 1048576 ]]; then
            echo "Место закончилось, остановка"
            exit 1
        fi

        fileFull="${fileNames}.${fileExt}_${filesDate}"
        filePath="$folderNameRand/${foldersNames}_${filesDate}/$fileFull"
        dd if=/dev/zero of="$filePath" bs=1M count="$filesize" status=none 2>> 02.log
        echo "$logDate | $filePath | Size of file = ${filesize} Mb." >> 02.log
        fileNames+="$lastLetterOfFileName"
    done
    fileNames=$oldFileName
    foldersNames+="$lastLetterOfFoldersName"
done
