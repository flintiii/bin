#!/bin/bash
# pflint
# Tue Feb 18 07:54:40 EST 2020
# SOURCE: https://forums.linuxmint.com/viewtopic.php?t=192477
#
# cinnamon-screensaver-command --lock --away-message "Put your message here"
# ifconfig -a | grep 192.168 | cut -d ":" -f 2 |cut -d " " -f 1
ifconfig -a | grep 192.168 | cut -d ":" -f 2 |cut -d " " -f 1 |	\
xargs cinnamon-screensaver-command --lock --away-message
