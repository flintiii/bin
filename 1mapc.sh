#!/bin/bash
#
function dummy(){
#* function dummy - Rename and fill stuff in between braces
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
  IPAddress="192.168.1.7"
  Userid="apc"
  Password="apc"
telnet $IPAddress
} # Test:
dummy