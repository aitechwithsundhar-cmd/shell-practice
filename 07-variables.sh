#!/bin/bash
#dynamic command 

START_TIME=$(date +%s)

echo "scripit executed at: $START_TIME"
sleep 10
END_TIME=$(date +%s)
TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "script executed in $TOTAL_TIME"