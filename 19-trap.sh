#!/bin/bash 

set -e 
trap 'echo "there is an error in $LINENO, command:$BASH_COMMAND"' ERR


USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(basename "$0")
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

# Color codes
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# Root check
if [ $USERID -ne 0 ]; then
    echo -e "${R}Please run this script with root user access${N}"
    exit 1
fi

# Create logs folder
mkdir -p "$LOGS_FOLDER"


# Loop through packages
for package in "$@"
do
    dnf list installed "$package" &>>"$LOGS_FILE"
    if [ $? -ne 0 ]; then
        echo -e "${Y}$package not installed, installing now...${N}"
        dnf install "$package" -y &>>"$LOGS_FILE"
    else
        echo -e "${G}$package already installed, skipping${N}"
    fi
done
