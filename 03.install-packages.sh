#!/bin/bash

ID=$(id -u)

LOGFILE="tmp/$0"

VALIDATE() { 
    if [$1 -ne 0]
    then
        echo -e "$2.. FAILED"
    else
        echo -e "$2... SUCCESS"
    fi
}

if [ $ID -ne 0 ]
then 
       echo -e "please run the script with root acess"
       exit 1
    else
       echo -e "you are root user"

fi
# git mysql postfix net-tools
# package=git for first time

for package in $@
do
    yum list installed $package &>> $LOGFILE #check installed or not
    if [ $? -ne 0 ] #if not installed
    then
        yum install $package -y &>> $LOGFILE # install the package
        VALIDATE $? "Installation of $package" # validate
    else
        echo -e "$package is already installed ... $Y SKIPPING $N"
    fi
done

