#!/usr/bin/expect
# set name="192.168.1.7"; echo $name
# set user="apc" ; echo $user
# set password="apc"; echo $password
#If it all goes pear shaped the script will timeout after 20 seconds.
set timeout 20
#First argument is assigned to the variable name
set name [lindex $argv 0]
#Second argument is assigned to the variable user
set user [lindex $argv 1]
#Third argument is assigned to the variable password
set password [lindex $argv 2]
#This spawns the telnet program and connects it to the variable name
spawn telnet $name 
#The script expects login
#D 
expect "User" 
#The script sends the user variable
#D 
send "$user"
#The script expects Password
#D expect "Password:"
#The script sends the password variable
#D send "$password "
#This hands control of the keyboard over to you (Nice expect feature!)
expect "> "
send "4"
interact