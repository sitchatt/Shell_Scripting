#!/bin/bash

# ----- Root Check -----
if [[ $EUID -ne 0 ]]; then
    echo "Unauthorized !! Not a ROOT user. Exiting the Script"
    exit 1
fi

# ----- User Details -----
read -p 'Please Enter Full Name: ' NAME
read -p 'Please Enter Username: ' USERNAME
read -s -p 'Please Enter Initial Password: ' PASSWORD
echo

# ----- Create User with Bash shell -----
useradd -c "$NAME" -m -s /bin/bash "$USERNAME"
if [[ $? -ne 0 ]]; then
    echo "Unable to add user for ${USERNAME}. Exiting Script"
    exit 1
fi

# ----- Set Password -----
echo "${USERNAME}:${PASSWORD}" | chpasswd

# ----- Unlock and Expire Password for First Login -----
passwd -u "$USERNAME" 2>/dev/null || true
passwd -de "$USERNAME"  # Ubuntu-friendly way to force password change

# ----- Output -----
echo "--------------------------------------"
echo "Successfully Created User"
echo "User Name      : ${USERNAME}"
echo "Full Name      : ${NAME}"
echo "Initial Password: ${PASSWORD}"
echo "Hostname       : $HOSTNAME"
echo "--------------------------------------"
echo "User will be prompted to change password on first login."
