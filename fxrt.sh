#!/bin/bash
# Tue 04 Feb 2020 09:50:29 AM EST pfliunt
# fix route on pi41
#
echo "Route started as:"
route -n
route add default eth0
route add default gw 192.168.1.1
echo "Now Route is:"
route -n
echo "Ping Self:"
ping -a -c3 192.168.1.31
echo "Ping Router:"
ping -a -c3 192.168.1.1
