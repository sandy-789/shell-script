#!/bin/bash

ID=$(id -u)

if [$id -ne 0]
then
    echo "ERROE" :: "please run with root acess
else
    echo "you are root user"    