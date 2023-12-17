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

# git mysql
for package in $@
do
   yum list installed $package &>> $LOGFILE
   
   if [$? -ne 0]
   then
       yum install $packages -y 
       VALIDATE $? "installing $package"
    else
      echo -e "$packages is alredy installed"...
   fi   

done

