#! /bin/bash
# Wed 15 Jan 2020 01:37:22 PM EST 
# pflint Wed 15 Jan 2020 01:41:10 PM EST 
# this will look for stuff...
# the first part pings whatever number I give it
#


#!/bin/bash
for i in {30..39}
do
	j="192.168.1."$i
	echo $i, $j
	echo "Ok lets go..."
	ping $j && nmap $j
   	# echo "Welcome $i times"
done

