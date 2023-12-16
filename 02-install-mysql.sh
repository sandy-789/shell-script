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

if [ $? -ne 0 ]
then
    echo "ERROR :: Installation is failed"
    exit1
else
    echo "Installation is succed"
fi
