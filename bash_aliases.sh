#!/bin/bash
before=$(alias | wc -l)
echo "You got $before nmber of aliases"
# lt list files used today
alias lt='ls -alt --full-time --time-style=long-iso | grep $(date +%F)'
# ly list files used yesterday
alias ly='ls -alt --full-time --time-style=long-iso | grep $(date -d yesterday +%F)'
# sc go through a file without comment lines
alias sc='egrep -v "^[[:space:]]*(#.*)?$"'
# dq check directory usage at this level
alias dq='du -h --max-depth=1'
# date backup binding...
bind '"\ed":"obe/$(date +%F)_"'
# standard error binding...
bind '"\ee":" 2>/dev/null "'
after=$(alias | wc -l)
echo "Now, you got $after nmber of aliases"
# Note: ya gotta run this with the following syntaxx:
# $ . ./bash_aliases.sh
# Here's why: https://superuser.com/questions/240223/warning-line-editing-not-enabled
# pflint Sat Jan 30 13:25:55 EST 2021
