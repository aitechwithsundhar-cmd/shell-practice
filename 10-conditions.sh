#!/bin/bash 

# -gt -> greater than
# -lt -> less than
# -eq -> equal
# -ne -> not equal


if [[ $number -gt 20 ]]; then
    echo "given number: $number is greater than 20"

elif [[ $number -eq 20 ]]; then
    echo "given number: $number is equal to 20"

else
    echo "given number: $number is less than 20"
fi