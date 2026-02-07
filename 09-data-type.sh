#!/bin/bash
## data-tpes examples
NUM1=100
NUM2=sundhar

SUM=$(($NUM1+$NUM2))


echo "sum is: $SUM"

fruits=("Apple" "banana" "mango")
echo "fruits are : ${fruits[@]}"
echo "first fruit: ${fruits[0]}"
echo "second fruit: ${fruits[1]}"
echo "third fruit: ${fruits[2]}"