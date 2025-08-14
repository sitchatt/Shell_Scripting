#!/bin/bash

## Check User is Root or not

if [[ ${UID} != 0 ]]; then
    echo "Unauthorized !! Not a ROOT user. Exiting the Script"
    exit 1
fi

# Prompt to enter user details
read -p 'Please Enter Your Name: ' NAME
read -p 'Please Enter UserName: ' USERNAME
read -p 'Please Enter Initial Password: ' PASSWORD

# User Creation
useradd -c "${NAME}" -m "${USERNAME}"

if [[ $? -ne 0 ]]; then
    echo "Unable to add user for ${USERNAME}. Exiting Script"
    exit 1
else
    echo "User is added. Creating Password....."
fi

# Create Password and Expire it to force user to change password on next login
echo "${USERNAME}:${PASSWORD}" | sudo chpasswd
passwd -e "${USERNAME}"

if [[ $? -ne 0 ]]; then
    echo "Unable to create password. Exiting Script"
    exit 1
fi

echo "Successfully Created User"
echo "User Name: ${USERNAME}"
echo "Initial Password: ${PASSWORD}"
echo "Hostname is: $HOSTNAME"
