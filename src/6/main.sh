#!/bin/bash
if [ $# -ne 0 ]; then
    echo "Ошибка: скрипт не принимает аргументы"
    exit 1
fi

goaccess ../4/*.log --log-format=COMBINED -o report.html --real-time-html
echo "Отчёт создан: report.html"
