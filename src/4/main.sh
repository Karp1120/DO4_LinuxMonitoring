#!/bin/bash
LANG=en_US.UTF-8

min=60
time=0
b=1

for ((i=0; i<5; i++)); do
    logfile="day${b}.log"
    numbrecords=$((RANDOM % (1000 - 100 +1)))  
    > "$logfile"
    logdate=$(date -d "-$i day" +%d/%b/%Y) #Дата для текущего файла (i дней назад)
    for ((j=0; j<$numbrecords; j++)); do
        (( time += min ))
        date=$(date -d "@$time" '+%T')
        source ./add_ip.sh
        source ./add_agent.sh
        source ./add_code.sh
        source ./add_method.sh
        url=$((RANDOM % 100))
        size=$((RANDOM % 2000))
        echo "$IP - - [$logdate:$date +0000] \"$METHOD /$url/index.html HTTP/1.1\" $STATUS_CODE $size \"-\" \"$AGENT\"" >> "$logfile"
    done
    ((b++))
done
