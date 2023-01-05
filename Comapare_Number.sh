#!/bin/bash

echo -n "Enter your first number:" ; read a
echo -n  "Enter your second number:" ; read b

echo "Your first number is $a , Your second number is  $b"


if [ $a -eq $b ]
then
   echo "Both number are same"
elif [ $a -gt $b ]
then
   echo "First number is greater"
elif [ $a -lt $b ]
then
   echo "Second number is greater"
else
   echo "None of the condition met"
fi