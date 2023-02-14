#!/bin/bash
## echo $#
clear
if [ $# -ne 1 ]
then
  cat $0 | grep '^# ' | sed -e 's/#//'
#                       *****DOCUMENTATION*****
# Greetings Tiddlers, this is tiddlette.sh version 0.012
# I constantly find myself trolling around google in firefox, racking up
# some great research, which I felt would be useful to save in a tiddle
# table. What I have done in the past has been to go Edit > Preferences, click
# "Use Current Pages" <shift-tab> to highlight the line <ctl-c> to copy the
# current pages, open gedit and paste the current tabs in.
# I would then run search/replace on the result to convert it into a tiddle
# table. I kept forgetting the variables, so here is the shell script that does this
# thing... Thus, tiddlet.sh is used to convert a firefox "current pages" dump into
# a tiddle table.
# :^)
# The syntax is tiddlet.sh <file>, and pipes into a file.
#
  exit 1
fi
## add Running head r e.g. "|!Reference HTML|! Description|"
echo "|!Reference HTML|! Description|"
## add prefix e.g. "|[[reference|"
echo -n "|[[reference|"
## tiddler replace | with ]]||\n|[[reference| and add footer e.g. "]]||"
cat $1 |sed -e 's/|/\]\]\|\|\n\|\[\[reference\|/g' |sed -e '$s/$/\]\]||/g'

