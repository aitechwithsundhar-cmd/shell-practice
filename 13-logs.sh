#!/bin/bash

#functions/methods 
#functions are intended to complete specific task, it takes input and does the job 

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.sh"

    if [ $USERID -ne 0 ]; then 
        echo "please run this script with root user access" 
        exit 1
    fi 
mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then 
        echo "$2 .... faliure"
    else 
        echo "$2 .... sucess"
    fi
}
dnf install nginx -y &>> $LOGS_FILE
VALIDATE $? "installing nginx"

dnf install mysql -y &>> $LOGS_FILE
VALIDATE $? "installing mysql"

dnf install nodejs -y &>> $LOGS_FILE
VALIDATE $? "installing nodejs"