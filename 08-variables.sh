#!/bin/bsah 

### special variables ###
echo "All args passed to script: $@"
echo "number od vars passed to script: $#"
echo "script name: $0"
echo "present directory: $PWD"
echo "who is running: $USER"
echo "home directory of current user: $HOME"
echo "PID of the script: $$"
sleep 100 &
echo "PID od recently background process: $!"
echo "ALL arges passed to script: $*"