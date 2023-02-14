#!/usr/bin/expect
# #!/bin/bash
name="192.168.1.7"
user="apc"
password="apc"
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
expect "login:" 
#The script sends the user variable
send "$user "
#The script expects Password
expect "Password:"
#The script sends the password variable
send "$password "
#This hands control of the keyboard over to you (Nice expect feature!)
interact