#!/bin/bash
# if -F nonsense here mkdir usb
cd "~/usb"
 lsusb > 1lsusb_$(date +%F)
 lsusb > 2lsusb_$(date +%F)
diff 1lsusb_2021-01-11 2lsusb_2021-01-11 |grep ">" | cut -c 3-
