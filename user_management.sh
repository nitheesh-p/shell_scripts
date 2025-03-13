#!/bin/bash

# FUNCTIONS

function create_user {

read -p "Enter the Username to create: " username
check=$(sudo grep "^$username:" /etc/passwd | cut -d: -f1)

if [ "$check" == "$username" ]; then
    echo "User '$username' Already exists!"
else    
    sudo useradd -m $username 
    echo "User $username created successfully"
    echo "Now its time to set a password for $username"
    reset_user "$username" 
fi  
}

function delete_user {

read -p "Enter the username: " username
check=$(sudo grep "^$username:" /etc/passwd | cut -d: -f1)
   
if [ "$check" == "$username" ]; then

    sudo userdel -r $username 
    echo "User $username and its directories deleted successfully"

else

    echo "cannot find the user or user does not exist"

fi

}

function reset_user {

local username=$1

 if [ -z "$username" ]; then
        read -p "Enter the username: " username
 else 
        echo "changing password for $username"
 fi
read -p "Enter the password: " password
echo -e "$password\n$password" | sudo passwd "$username"
echo "User $username's password has been changed"
}


# MENU OF OPTIONS

echo "===== USER MANAGEMENT ======"  
echo -e "
1. User Account Creation '-c' or '--create' \n
2. User Account Deletion '-d' or '--delete' \n
3. User Password Reset '-r' or '--reset' \n
4. List User Accounts '-l' or '--list' \n "  

read -p "Enter the flag or option as mentioned" flag

case $flag in 
    --create | -c )
        create_user
      ;;
    --delete | -d )
        delete_user
      ;;
    --reset | -r )
        reset_user
      ;;
    --list | -l )
    echo "Listing all users:"
    cut -d: -f1 /etc/passwd
    ;;
    *)
      echo "invalid option"
      exit 1
      ;;
esac


