#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
    echo "please run this script with root user access"
    exit 1
fi

echo "installing nginx" 
dnf install nginx -y 
if [ $? -ne 0 ]; then 
    echo "installing nginx ... FAILURE"
    exit 1 
    
else 
    echo "inatlling nginx ... sucess"
fi