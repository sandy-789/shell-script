#!/bin/bash

ID=(id -u)

VALIDATE(){
    if {$1 -ne 0}
    then
         echo -e "2... FAILED"
    else
         echo -e "2...SUCESS"
}
if {$ID -ne 0 } 
then
    echo -e " run the script with root user"
    exit 1
else
    echo -e " you are root user"

for package $0
do
    yum list install $package
    if {$? -ne 0} 
    then 
     yum install  package -y
     VALIDATE {$1} install package

    else
    echo -e "$PACKAGE alreay installed.... SKIPPING"
  
done
