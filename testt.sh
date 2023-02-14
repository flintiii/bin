#!/bin/bash
#
#
#
version="0.021"
mchnl="24:0"
##
#* function help  - Help function for template basic help goes here
function help(){
# clear;
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version;
# uroot #debug
cat $0 | grep '^## ' | sed -e 's/##//'
# echo "This is the help function"
##                       *****DOCUMENTATION*****
## You get this when you put in the wrong number or type of arguments...
## The name of this program is testt.sh, an over-extention of unix bash.
## This is released under GPL I
##
## This program allows you to check the hardware on your particular
## Maxim DS1802 1-wire sendor, and optionally if run on the correct platform
## configuraiton, will check and/or edit an appropriate config.txt.
## This program should be run from a bootable linux version and the
## bootable Home Assistant SD card should be installed and available. This
## would run in a environment where there is a  booting Raspbian image and an additional
## sd card with the Home Assistant (haasm) image.
## The syntax is:#
## testt.sh 	<verb>
## - dcc	Display current configuration
## - ccc	Change current configuration
## - sfd	Scan For Devices
## - snc	Set Naming Configuration
## - fct	find config.txt
## - cct	check config.txt
## - xct	change (and bu) config.txt
##
## For structure information type "grep '^\#\*' testt.sh"
##    :^)
## (C) P Flint, Barre Open Systems Institute Liscensed under GPLI
##
#          *****Documentation Loop ends here the rest is function******
#
} # Test: testt.sh
#
function dummy(){
#* function dummy - Rename and fill stuff in between braces
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
uroot
} # Test:
#
#
function maximscan(){
#* function maximscan - scans the appropriate data line for the configured 1 Wire devicces
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
uroot

INODE="/sys/bus/w1/devices/"
#
Shower="28-011935de5bdf"
Ambient="28-3c01a8162001"
Ambient1="28-3c01a816985d"
Outside="28-0120580db310"
#
# start with no arguments
# list devices
# assign device to name
#
#
temp()
#
{
target=$INODE$LINE
#
# echo "This is your target: "$target
tfile=$target"/w1_slave"
# echo $tfile
#
# echo -en "$(head -1 $target"/w1_slave")"
if [[ "$(head -1 $tfile)" == *"YES"* ]]
then
 # echo $(grep "t=" $tfile) | cut -d " " -f 10 | cut -c 3-
 CDX=$(echo $(grep "t=" $tfile) | cut -d " " -f 10 | cut -c 3-)
 # echo $tfile, $CDX
 # echo -n $CDX
else
    echo $LINE" has a communications issue"
fi
}
} # Test:

#
# asgn()
{
# echo $target
if [[ ! -f $target ]]
then
    if [[ $LINE == "$Ambient"  ]]; then LOCATION="Ambient ";fi
    if [[ $LINE == "$Ambient1" ]]; then LOCATION="Ambient1";fi
    if [[ $LINE == "$Outside"  ]]; then LOCATION="Outside ";fi
    if [[ $LINE == "$Shower"   ]]; then LOCATION="Shower  ";fi
    # echo $LINE" at "$LOCATION" exists on your system"
else
    echo $LINE" does map to element on your system"
fi
#
}
#
#
######################################STANDARD AND MAYBE USEFUL FUNCTIONS BELOW
#
#
#* function uroot - Checks to see if you are root
function uroot(){
# echo "Make sure only root can run script"
if [ "$(id -u)" != "0" ]; then
   echo "This script does not need to run as root but that's OK as you are not root" 1>&2
fi
} # Test:~flint/bin/mtoc.sh uroot
#
#* function spause   - A simple tarry...
function spause(){
   # -t sets time
   # read -t $pt -p "$*" ans
   read -p "Hit enter to continue..." ans
   echo $ans
}
#
#*###################################### MAIN ENTRY POINT AND COMPOUND CASE
#
#D echo "echoplex.sh"$version" starts"
#* Evaluator Routine
# Note the evaluator allows for many cases and error checking...
#d ARGS=$#         # carries the number of args into the functions...
#D echo $#"     "$1"    "$2"    "$3"    "$ARGS ;spause
# Note these are special compound cases...
if [ "$#" -eq "1" ] && [ "$1" = "record"   ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "play"     ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "midi"     ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "loop"     ]; then ARGS="1"; fi
if [ "$#" -eq "2" ] && [ "$1" = "timesave" ]; then ARGS="2"; fi
if [ "$#" -eq "3" ] && [ "$1" = "add"      ]; then ARGS="3"; fi
if [ "$#" -eq "1" ] && [ "$1" = "midit"    ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "midid"    ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "dummy"    ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "remote"   ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "spause"   ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "help"     ]; then ARGS="9"; fi
# this tests the evaluator...
#D echo $#"     "$1"    "$2"    "$3"    "$ARGS ;spause
# typical cases, be careful to make your own...
case "$ARGS" in
    "0") clear; $1="help"; exit 1;;			        # got nothing, display help and go
    "1") $1 ;;                                              	# run the command
    "2") var2=$2;  $1 ;;                                    	# run the command with an argument
    "3") var3=$3; var2=$2;  $1 ;;                           	# run the command with two arguments
    "4") var4=$4; var3=$3; var2=$2;  $1 ;;                      # run the command with three arguments
    "5") prompt=$2; $1 ;;				    					# run the command with a different argument
    "6") time=$3; prompt=$2;  $1 ;;								# run the command with two different arguments
    "7") flint_short_vita_2017-07-01.odtdefvbl; $1 ;;			# run the command and default variables
    "8") var2=$2;  $1 ;;                                 		# run the command and settle variables
    "9") var3=$3; var2=$2;  $1 ;;                               # run the command and settle variables
      *) clear; cat $0 | grep '^## '| sed -e 's/##//'; exit 1;; # Anything else run help and exit...
esac # End main loop. To TEST:
#
# echo " "; echo "On "$(date +%F\ %r) $0" version "$version" stops"
#debug echo  "That's all folks!!"
#
#* restore environment cd "$S"
