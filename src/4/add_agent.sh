#!/bin/bash

agents=("Yandex" "Google Chrome" "Mozilla" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
AGENT=${agents[$((RANDOM % ${#agents[@]}))]}
