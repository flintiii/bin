#!/bin/bash
# Tue 04 Feb 2020 09:50:29 AM EST pfliunt
# fix wireless route on pi41
#
echo "Route started as:"
route -n
route del eth0
route add default wlan0
route add default gw 192.168.1.1
echo "Now Route is:"
route -n
echo "Ping Router:"
ping -a -c3 192.168.1.1
