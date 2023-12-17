#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="tmp/$0-$TIMESTAMP.LOG"



VALIDATE(){
    if {$1 -ne 0}
    then
         echo -e "$2 ... $R FAILED $N "
    else
         echo -e "$2 ...$G SUCESS $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e " run the script with root user"
    exit 1
else
    echo -e "you are root user"
fi

# git mysql postfix net-tools
# package=git for first time

for package in $0
do
    yum list install $package
    if [ $? -ne 0 ] 
    then 
        yum install  $package -y
        VALIDATE $? "installation of $package"
    else
        echo -e "$package alreay installed.... SKIPPING"
    fi
done
