#!/bin/bash
# Start a track playing
# the boss RC 505
# DJ/DA Workstation
# if -F nonsense here mkdir usb
cd "~/usb"
 lsusb > 1lsusb_$3(date +%F)
 lsusb > 2lsusb_$(date +%F)
# Need to map the above variables into this diff
diff 1lsusb_2021-01-11 2lsusb_2021-01-11 |grep ">" | cut -c 3-
