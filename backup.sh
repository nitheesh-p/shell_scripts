#!/bin/bash

<<MSG

This script takes backup

MSG

src=$1
dest=$2

timestamp=$(date '+%Y_%m_%d_%H:%M')

echo "Backing up $src to $dest"

zip -r "$dest/backup-$timestamp.zip" $src > /dev/null

echo "backup-$timestamp.zip has created in location $dest"