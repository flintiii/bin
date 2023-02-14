#!/bin/bash
# Wed 05 Feb 2020 08:15:28 AM EST
# pflint
#
# wanders through and finds bounjour names...
#
echo "This program starts nmap"
echo "This could take a while..."
nmap 192.168.1.0/24 |grep report |cut -d " " -f 5 |xargs avahi-resolve --address |tee $(date +%F)_ip.out
#
# Here is what it looked like today:
# 192.168.1.200	PROD4.local
# 192.168.1.203	fits440.local
# 192.168.1.201	alexator.local
# 192.168.1.22	trantor.local
# 192.168.1.29	pi41.local
# 192.168.1.206	pandl.local
# 192.168.1.208	alexator.local

