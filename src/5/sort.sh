#!/bin/bash
case $param in

    1)  
        for (( i=1; i<=5; i++ )); do
            sort -k 9 ../4/day$i.log -o sort$i.log
        done
    ;;

    2)  
        for (( i=1; i<=5; i++ )); do
            awk '{print $1}' ../4/day$i.log | sort -u > sort$i.log
        done
    ;;

    3)  
        for (( i=1; i<=5; i++ )); do
            awk '$9 ~ /^4/ || $9 ~ /^5/' ../4/day$i.log > sort$i.log
        done
    ;;

    4)  
        for (( i=1; i<=5; i++ )); do
            awk '$9 ~ /^4/ || $9 ~ /^5/ {print $1}' ../4/day$i.log | sort -u > sort$i.log
        done
    ;;
esac

#proverkaproverkaproverkaproverka