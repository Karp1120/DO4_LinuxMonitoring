#!/bin/bash
if [ $# != 0 ] ; then
    echo "Ошибка что-то не так :/"
else
    goaccess ../04/*.log --log-format=COMBINED > index.html
fi