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

# Check root access
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access" | tee -a $LOGS_FILE
    exit 1
fi

# Create logs folder
mkdir -p "$LOGS_FOLDER"

# Validation function
VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo "$2 .... FAILURE" | tee -a $LOGS_FILE
        exit 1
    else
        echo "$2 .... SUCCESS" | tee -a $LOGS_FILE
    fi
}

echo "Script started at: $(date)" | tee -a "$LOGS_FILE"

# Install nginx
dnf install nginx -y >> "$LOGS_FILE" 2>&1
VALIDATE $? "Installing nginx"

# Install mysql
dnf install mysql -y >> "$LOGS_FILE" 2>&1
VALIDATE $? "Installing mysql"

# Install nodejs
dnf install nodejs -y >> "$LOGS_FILE" 2>&1
VALIDATE $? "Installing nodejs"

echo "Script completed at: $(date)" | tee -a "$LOGS_FILE"
