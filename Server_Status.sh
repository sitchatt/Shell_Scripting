#!/bin/bash


echo "-----------------------------\n"
echo "Hello, $(whoami)  \nWelcome to, $(hostname)\n "
echo "------------------------------\n"
echo "The script is currently running in $(pwd) \n"
echo "------------------------------\n"


CTDATE=$(date | awk '{print $1, $2, $3}')
CTTIME=$(date | awk '{print $4}')
CTTIMEZONE=$(date | awk '{print $5}')
UP=$(uptime | xargs | awk '{print $3,$4}')
CD=$(uptime | xargs | awk '{print $5,$6}')
LASTLOGIN=$(last -a | head -3)
DISK=$(df -h | xargs | awk '{print   $11 " / " $9}')
RAM=$(free -m | xargs | awk '{print  $10 " / " $8 " MB "}')
CPU=$(top -b | head -n 5)
DIR=$(pwd)
OLD=$(find $DIR -mtime +30 -print)

echo "Today's date is:  $CTDATE"
echo "Current time is: $CTTIME"
echo "Your time zone is: $CTTIMEZONE \n"
echo "Last logins:"
echo "$LASTLOGIN \n\n"
echo "----------------------------------- \n"
echo "$(hostname) is UP for :"

echo "$UP hr"

echo "currently connected:"

echo "$CD \n"

echo "------------------------------\n"

echo "Here is the Disk and Memory usage of ' $(hostname) '  :"

echo "Free/Total disk: \n"
echo "$DISK"
echo "----------"
echo "Free/Total memory: \n"
echo "$RAM"
echo "----------"

echo "Below 5 processes are consuming most of the Cpu: "
echo "$CPU"
echo "----------\n"
echo "Below files are untouched since last 30 days: "
echo "-------"
echo "$OLD\n"

echo "######################## Thanks "  $(whoami) "  for running the script ##################################"

