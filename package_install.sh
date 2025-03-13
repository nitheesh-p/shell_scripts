#!/bin/bash

<<MSG

This is a script to 
Install Packages

MSG

echo " Installing $1"

sudo apt-get update > /dev/null
sudo apt-get install $1 -y > /dev/null

echo "Installation completed"

