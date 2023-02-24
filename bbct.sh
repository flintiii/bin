#!/bin/bash
version="0.01"
echo "version =" $version
##
# pflint
echo "hello"
echo $version
#
2>/dev/null << cut
# All this stuff is gone 
#  this includes anything...
#
cat $0 | grep '^## ' | sed -e 's/##//'
# echo "This is the help function"
unless and until you hit
cut
echo "see?"
