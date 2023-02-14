#!/bin/bash
# sets lan on rpi zero running raspbian
#
echo "This is the current setting"
ifconfig -a | grep -A5 wlan


