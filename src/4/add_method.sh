#!/bin/bash

methods=("GET" "POST" "PUT" "PATCH" "DELETE")
METHOD=${methods[$((RANDOM % ${#methods[@]}))]}
