#!/bin/bash

############################################
# Script Name  : 13-logs.sh
# Purpose      : Install packages with logs
# Author       : Sundhar
############################################

USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(basename "$0")
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

R="\e[31"
G="\e[32"
Y="\e[33"
N="\e[34"


# Check root access
if [ $USERID -ne 0 ]; then
    echo -e "$G Please run this script with root user access $N" | tee -a $LOGS_FILE
    exit 1
fi

# Create logs folder
mkdir -p "$LOGS_FOLDER"

# Validation function
VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$2 ....$R FAILURE" $N | tee -a $LOGS_FILE
        exit 1
    else
        echo "$2 ....$G SUCCESS" $N | tee -a $LOGS_FILE
    fi
}

for package in "$@" #sudo sh 15-loops.sh <package name>
do 
    dnf list instyalled $package &>>$LOGS_FILE
    if [ $? -ne 0 ]; then
        echo "$package $Y not installed, install now $N"
        dnf install $package -y &>>$LOGS_FILE
        VALIDATE $? "$package installation"
    else 
        echo "$package $G already installed, skipping $N"
        
    fi
done 