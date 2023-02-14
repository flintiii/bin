#! /bin/bash
# Wed 15 Jan 2020 01:37:22 PM EST 
# pflint Wed 15 Jan 2020 01:41:10 PM EST 
# this will look for stuff...
# the first part pings whatever number I give it
#
echo "Ok lets go..."
ping $1 && nmap $1

