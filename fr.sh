#!/bin/bash
# pflint Fri 14 Feb 2020 04:19:38 PM EST 
# fixes route today...
#
sudo route del -net 192.168.1.0 gw 0.0.0.0 netmask 255.255.255.0 dev eth0
sudo route del -net 0.0.0.0 gw 192.168.1.1 netmask 0.0.0.0 dev eth0
#
#  
route add default wlan0
#  
route add default gw 192.168.1.1

