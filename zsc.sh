#!/bin/bash
# pflint 
# Sat May  4 03:05:08 PM EDT 2024
version=0.451 
#
# opath="/opt/visualbash/bin"
opath="/root/visiualbash/bin"
cd $opath
#
#* function help  - Help function for template basic help goes here
function help(){
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version; # uroot #debug 
clear
cat zsc.sh | grep '^## ' | sed -e 's/##//'
# echo "This is the help function"
##                       *****DOCUMENTATION*****
## You get this when you put in the wrong number or type of arguments...
## The name of this program is zsc.sh, a tool for 
## generating FED Visual Bash scripts.
##      *** NOTE *** This program need not be run as root,
## OPERATION
## The syntax is: 
## - flint 		- Flint Information Technology web site 
## - bosi          	- The Barre Open Systems Institute BOSI site
## - family		- The flint family site
## - summary		- summarize status on all ports
##  For structure information type "grep '^\#\*' zsc.sh"
## (C) P Flint, Barre Open Systems Institute Liscensed under GPLI
## This is released under GPL I
##
} # Test:
#
#
#* function dummy - Rename and fill stuff in between braces
function dummy(){
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version
uroot
} # Test:
#
function flint(){
#* function flint -  Flint Information Technology Site
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version 
uroot
clear; egrep -v "^[[:space:]]*(#.*)?$" '/opt/flint/etc/zope.conf' |grep -A2 \<http-server\> |grep -v http
echo "This is the family site"
echo "docbox.flint.com"
/opt/flint/bin/zopectl help;
echo "At Prompt Type help"
/opt/flint/bin/zopectl  
} # Test:
#
#
function family(){
#* function family -  The flint family site
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version 
uroot
clear; egrep -v "^[[:space:]]*(#.*)?$" '/opt/family/etc/zope.conf' |grep -A2 \<http-server\> |grep -v http
echo "This is the family site"
/opt/family/bin/zopectl help;
echo "At Prompt Type help"
/opt/family/bin/zopectl  
} # Test:
#
#
function bosi(){
#* function bosi -  The bosi site
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version 
uroot
uroot
clear; egrep -v "^[[:space:]]*(#.*)?$" '/opt/bosi/etc/zope.conf' |grep -A2 \<http-server\> |grep -v http
echo "This is the family site"
/opt/bosi/bin/zopectl help;
echo "At Prompt Type help"
/opt/bosi/bin/zopectl  
} # Test:
#
#
function summary(){
#* function summary -  all sites running,,,	
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version 
echo "Try to fix this..."
# /opt/cpyarger/zope/bin/zopectl
nmap 127.0.0.1
} # Test:
#
#*####################################STANDARD AND MAYBE USEFUL FUNCTIONS BELOW################################
#
function flink(){
#* function flink - Adds one symbolic link between named program
# and the profiled directory /home/user/bin
# urootwhich zsc.sh
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version 
#Debug
FNAME=$var2; 
#D echo $FNAME
echo "Have found " $FNAME"!"
STDIR=$(pwd) 
echo "creating target... "
#D 
echo $STDIR
#D 
echo $HOME
TARGET=$HOME"/bin/"$FNAME
echo $TARGET
spause
# if [ -e "$TARGET" ]; echo "Already Linked"; fi
if test -f $TARGET ; then echo "Link Exists flunk first!"; return; fi
#
cd $STDIR
# echo $PWD 
echo $FNAME" should be in the home path"
# echo "    "$PATH
echo $PATH| tr ":" "\n" |while read line; do echo "   - "$line; done  # Very Cool
echo "Above is the be overall path for "$USER
#D ls -alt $HMDIRs
echo "linking now"
SOURCE=$PWD"/"$FNAME
#D echo "Source  "$SOURCE
#D echo "Target  "$TARGET
echo "What happens here is this:"
#D echo "ln -s  " $SOURCE $TARGET 
ln -s  $SOURCE $TARGET  
# ls -alt $TARGET
echo "Output of the 'which "$FNAME"' command shows  linked to the path  "
which $FNAME
#	
} # Test: zsc.sh flink <filename>
#
function flunk(){
#* function flunk - Un-Symlinks [file] & [file].sh into $which zsc.shPATH
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
#D echo $var2
FNAME=$var2
echo "Is this the right name to unlink? "$FNAME
TARGET=$HOME"/bin/"$FNAME
# TARGET=$(which $FNAME)if [ "$#" -eq "2" ] && [ "$1" = "geneval"  ]; then ARGS="2"; fi
echo "Have found a link to "
echo $TARGET 
#
echo "Do This?"
echo "rm "$TARGET
spause
rm $TARGET
} # Test: zsc.sh flunk <filename>
#
#
#* function uroot - Checks to see if you are root
function uroot(){
# echo "Make sure only root can run script"
if [ "$(id -u)" != "0" ]; then
   echo "This script needs to run as root and you are not root" 1>&2
fi
} # Test:~flint/bin/zsc.sh uroot
#
#* function spause   - A simple tarry...
function spause(){
   # -t sets time
   # read -t $pt -p "$*" ans
   read -p "Hit enter to continue..." ans
   echo $ans
} # Test
#
#
#*###################################### MAIN ENTRY POINT AND COMPOUND CASE
#

if [ "$#" -eq "1" ] && [ "$1" = flint   ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = family  ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = bosi    ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = summary ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = dummy   ]; then ARGS="1"; fi
if [ "$#" -eq "2" ] && [ "$1" = flink   ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = flunk   ]; then ARGS="2"; fi
#
# this tests the evaluator...
#D echo "Arg# = "$#"  $1 = "$1"  $2 = "$2" $3 = "$3" $ARGS = "$ARGS ;spause 
#D echo $#"     "$var1"     "$var2"     "$var3"    "$ARGS   #debug 
#D echo "zsc.sh v"$version" starts" ;spause()
#* Dispatcher Routine
# typical cases, be careful to make your own...
case $ARGS in
    "0") clear; "help";;                                        # got nothing, display help and go
    "1") $1 ;;                                                  # run the command
    "2") var2=$2;  $1 ;;                                        # run the command pass an argument
    "3") var3=$3; var2=$2;  $1 ;;                               # run the command pass two arguments
    "4") var4=$4; var3=$3; var2=$2;  $1 ;;                      # run the command pass three arguments
    "5") prompt=$2; $1 ;;                                       # run the command with a different argument
    "6") time=$3; prompt=$2;  $1 ;;                             # run the command with two different arguments
    "7") var3=$3; var2=$2; defvbl;  $1 ;;                       # run the command and default variables
    "8") var2=$2;  $1 ;;                                        # run the command and settle variables
    "9") var3=$3; var2=$2;  $1 ;;                               # run the command and settle variables
      *) clear; "help"; exit 1;;                                        # got nothing, display help and go
      # *) clear; cat $0 | grep '^## '| sed -e 's/##//'; exit 1;; # Anything else run help and exit...
esac # End main loop. TEST: ?fill in test?
#
# echo " "; echo "On "$(date +%F\ %r) $0" version "$version" stops"
#debug echo  "That's all folks!!"
#
#* restore environment cd "$S"
#
