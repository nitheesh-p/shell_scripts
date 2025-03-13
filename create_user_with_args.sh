#!/bin/bash

echo Creating user $1 with password $2

sudo useradd -m $1

echo -e "$2\n$2" | sudo passwd $1

echo user $1 created with password $2
