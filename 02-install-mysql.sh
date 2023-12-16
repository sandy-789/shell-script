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
    echo "ERROR:: Installation mysql is failed"
    exit 1
else
    echo "Installation mysql is succed"
fi
yum install git -y

if [ $? -ne 0 ]
then
    echo "ERROR:: Installation git is failed"
    exit 1
else
    echo "Installation mysql git succed"