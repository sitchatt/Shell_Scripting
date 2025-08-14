#!/bin/bash
#
## Check User is Root or not
#
#
set -x
if [[ ${UID} != 0 ]];
	echo "Not a ROOT user. Exiting the run"
	exit 1
fi

#Prompt to enter user detail
read -p 'Please Enter Your Name: ' NAME
read -p 'Please Enter UserName: ' USERNAME
read -p 'Please Enter Initial Password: ' PASSWORD
 #User Creation
useradd -c ${NAME} -m ${USERNAME}

if [[ $? -nq 0 ]]
	echo "Unable to add user for ${USERNAME}. Exiting Script"
	exit 1
else
	echo " User is added. Creating Password....."
fi

#Create Password and Expire that to force user to change password on next login
echo $PASSWORD | passwd --stdin $USERNAME
passwd -e $USERNAME

if [[ $? -nq 0 ]]
        echo "Unable Create Password. Exiting Script"
	exit 1
fi

echo " Successfully Created User "
echo " User Name : ${USERNAME}"
echo " Initial Password : ${PASSWORD}"
echo " Hostname is : $HOSTNAME "
