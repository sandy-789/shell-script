#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR":: "please run with root acess"
    exit 1
else
    echo "you are root user"    
fi

yum install mysql -y