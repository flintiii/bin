#!/bin/bash

#This script will back up an SD card

#Check if the required command-line tools are installed
if ! command -v dd &> /dev/null
then
	echo "dd command not found"
	exit 1
fi

if ! command -v pv &> /dev/null
then
	echo "pv command not found"
	exit 1
fi

#Get the SD card device name
echo "Please enter the device name of the SD card (e.g. /dev/sdc):"
read device

#Check if the device exists
if [ ! -b "$device" ]
then
	echo "$device does not exist"
	exit 1
fi

#Get the path to save the backup
echo "Please enter the path to save the backup:"
read path

#Check if the path is valid
if [ ! -d "$path" ]
then
	echo "$path is not a valid path"
	exit 1
fi

#Create the backup filename
filename="$(date +%Y%m%d_%H%M%S)_sd_card_backup.img"

#Back up the SD card
echo "Backing up SD card..."
sudo dd if="$device" | pv | sudo dd of="$path/$filename"
echo "Backup complete: $path/$filename"

