#!/bin/bash 


set -e #ERR

trap 'echo "there is an error in $LINED, command:$BASH_COMMAND"'

echo "hello world"
echo "am learning shell"
echo "printing error here"
echo "no error in this"