#!/bin/bash

SOUR_DIRE= "/tmp/shellscript.logs"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -d $SOUR_DIRE ]
then
    echo -e "$R Source directory: $SOUR_DIRE does not exits. "

fi 

FILES_TO_DELETE=$(find . -type f -mtime +14 -name "*.log")

while IFS= read -r line
do
    echo "Deleting file: $line"
    rm -rf $line
done <<< $FILES_TO_DELETE