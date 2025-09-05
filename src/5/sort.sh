#!/bin/bash
param=$1

case $param in
    1)  
        for (( i=1; i<=5; i++ )); do
            sort -k 9,9n ../4/day$i.log > sort$i.log
        done
    ;;

    2)  
        for (( i=1; i<=5; i++ )); do
            awk '{print $1}' ../4/day$i.log \
            | sort -t . -k1,1n -k2,2n -k3,3n -k4,4n -u > sort$i.log
        done
    ;;

    3) 
        for (( i=1; i<=5; i++ )); do
            awk '$9 ~ /^4/ || $9 ~ /^5/' ../4/day$i.log \
            | sort -k 9,9n > sort$i.log
        done
    ;;

    4)  
        for (( i=1; i<=5; i++ )); do
            awk '$9 ~ /^4/ || $9 ~ /^5/ {print $1}' ../4/day$i.log \
            | sort -t . -k1,1n -k2,2n -k3,3n -k4,4n -u > sort$i.log
        done
    ;;
esac


#proverkaproverkaproverkaproverka