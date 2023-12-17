#!/bin/bash

ID=$( id -U)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script stareted executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE (){
    if [ $1 ne -0]
    then
        echo -e "$2... FAILED"
    else
        echo -e "$2... SUCCESS"
    fi
}

if [ $ID -ne 0]
then
    echo -e "ERROR: : please run the script with root access"
    exit 1 
else 
     echo "you are root user"
fi 

#echo "All arguments passed: $@"
# git mysql postfix net-tools
# package=git for first time

for package in $@
do
    yum list install $package
    if [ $? -ne 0 ]
    then
       yum intsall $package -y
       VALIDATE $?
    else
       echo -E "$package is alredy installed..."
    fi
done
