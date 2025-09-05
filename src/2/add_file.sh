#!/bin/bash
> 02.log
filesDate="$(date +"%d%m%y")"

logDate="DATE = $(date +"%d.%m.%y")"

Folder_name="$(compgen -d / | shuf -n1)"

foldersNames=$dirname

last_name_and_fold=${dirname: -1}

fileNames=$fileName

oldFileName=$fileNames

lastLatterOfFileName=${fileNames: -1}

if [[ ${#foldersNames} -lt 5 ]]; then
    for (( i=${#foldersNames}; i<5; i++ )); do
        foldersNames+="$(echo $last_name_and_fold)"
    done
fi

countOfFolders=100
for (( i=1; i<=$countOfFolders; i++ )); do
    Folder_name="$(compgen -d / | shuf -n1)"
    filesCounter="$(shuf -i 50-100 -n1)"
    if [[ $Folder_name == "/bin" || $Folder_name == "/sbin" ||\
        $Folder_name == "/proc" || $Folder_name == "/sys" ]]; then
        countOfFolders+="$(echo $countOfFolders+1)"
        continue
    fi



    sudo mkdir "$Folder_name/"$foldersNames"_"$filesDate"" 2>/dev/null
    echo ""$logDate" | "$Folder_name"/"$foldersNames"_"$filesDate"">>02.log
    for (( j=1; j<=${filesCounter}; j++)); do
        avelSize="$(df -h / | awk '{print $4}' | tail -n1)"
        if [[ ${avelSize: -1} == "M" ]]; then
            exit 1
        fi
            sudo fallocate -l $filesize"M" ""$Folder_name"/"$foldersNames"_"$filesDate"/"$fileNames"."$fileExt"_"$filesDate"" 2>/dev/null
            echo ""$logDate" | "$Folder_name"/"$foldersNames"_"$filesDate"/"$fileNames"."$fileExt"_"$filesDate" | Size of file = $filesize Mb.">>02.log
            fileNames+="$(echo $lastLatterOfFileName)"
    done
    fileNames=$oldFileName
    foldersNames+="$(echo $last_name_and_fold)"
done