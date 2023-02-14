#!/usr/bin/expect

set timeout 20

spawn "./addition.pl"

expect "Enter the number1 :" { send "12\r" }
expect "Enter the number2 :" { send "23\r" }

interact# expect "hello"

send "world"
name="192.168.1.7"; echo "name = " $name
user="apc" ; echo "user =" $user
password="apc"; echo "password =" $password
