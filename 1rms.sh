#!/bin/bash
# Start a track playing
# the boss RC 505
# DJ/DA Workstation
# if -F nonsense here mkdir usb
#
function fusb(){
#* function fusb - figure out the usb situation
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
cd "~/usb"
 lsusb > 1lsusb_$3(date +%F)
 lsusb > 2lsusb_$(date +%F)
diff 1lsusb_2021-01-11 2lsusb_2021-01-11 |grep ">" | cut -c 3-
uroot
} # Test:
fusb
# remember arecord and aplay back.
# First identify the device on the bnetwork... 
# Give:
  IPAddress="192.168.1.7"
  Userid="apc"
  Password="apc"
Telnet $IPAddress
