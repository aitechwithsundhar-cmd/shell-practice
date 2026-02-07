#!/bin/bash


number=$1 

# -gt -> greater than
# -lt -> less then 
# -eq -> equal 
# -ne -> not equal

if [ "$number" -gt 20 ]; then 
    echo "given number: $number is greater then 20"

elif [ "$numeber" -eq 20 ]; then 
    echo "given number: $number is equal to 20"

else 
    echo "given nuber: $number is less then 20"

fi     
