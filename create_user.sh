#!/bin/bash

<<MSG

This is a script to 
create use

MSG

echo "This script will create a user"

read -p "Enter the username " username

read -p "Enter the password " password

sudo useradd -m "$username"

echo -e "$password\n$password" | sudo passwd "$username"

echo user $username is now created.
