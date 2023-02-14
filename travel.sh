
#!/bin/bash
# pflint 2017-01-09 11:28:49 
# travel backup
#
#
version="0.01"
#
#* function help  - Help function for template basic help goes here
function help(){
clear;
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version; uroot #debug 
cat $0 | grep '^## ' | sed -e 's/##//'
# echo "This is the help function"
##                       *****DOCUMENTATION*****
## You get this when you put in the wrong number or type of arguments...
## The name of this program is travel.sh, an extention of unix find.
## This is released under GPL I
## The syntax is:
##  - travel.sh <date> <ext> - converts to html format
##             Where <date> = yyy/mm/dd 
##  - travel.sh <date> <date> - files in this directory between
##             These dates 
##  - travel.sh rename- rename resume files to upload names. 
##  - travel.sh dsply <file[doc,txt,pdf]> displays these three types
##  - travel.sh upld    - Uploads resume files to server. 
##    in all of these, Output is delivered to the screen...
##      *** NOTE *** These commands need not be run as root!
##
## For structure information type "grep '^\#\*' travel.sh"
##    :^)
## (C) P Flint, Barre Open Systems Institute Liscensed under GPLI
##
#          *****Documentation Loop ends here the rest is function******
#
} # Test: travel.sh
#
function dummy(){
#* function dummy - Rename and fill stuff in between braces
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
uroot
} # Test:
#
function passwd(){
#* function passwd - Rename and fill stuff in between braces
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
uroot
echo $var2
export SSHPASS=$var2;
/usr/bin/rsync -avr --rsh='/usr/bin/sshpass -e  ssh -l flint' flint@aprefire.local:/home/flint/Desktop/17averill /home/flint/Desktop/.
# /usr/bin/rsync -avr --rsh='/usr/bin/sshpass -e  ssh -l flint' flint@aprefire.local:/home/flint/17averill /home/flint/Desktop/.
# /usr/bin/rsync -avr --rsh='/usr/bin/sshpass -e  ssh -l flint' flint@aprefire.local:/home/flint/Desktop/zskunk /home/flint/Desktop/.
/usr/bin/rsync -avr --rsh='/usr/bin/sshpass -e  ssh -l flint' flint@aprefire.local:/home/flint/zskunk /home/flint/Desktop/.
/usr/bin/rsync -avr --rsh='/usr/bin/sshpass -e  ssh -l flint' flint@aprefire.local:/home/flint/sugartower /home/flint/Desktop/.
#  /usr/bin/rsync -avr --rsh='/usr/bin/sshpass -e  ssh -l flint' flint@aprefire.local:/home/flint/travel /home/flint/Desktop/.
/usr/bin/rsync -avr --rsh='/usr/bin/sshpass -e  ssh -l flint' flint@aprefire.local:/home/flint/Desktop/flint/travel /home/flint/Desktop/.
} # Test:
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
# echo "mtoc.sh v"$version" starts"
#* Evaluator Routine
# Note the evaluator allows for many cases and error checking...
#d ARGS=$#         # carries the number of args into the functions...
#D echo $#"     "$1"    "$2"    "$3"    "$ARGS ;spause 
if [ "$#" -eq "2" ] && [ "$1" = "tw9y"     ]; then ARGS="2"; fi
if [ "$#" -eq "1" ] && [ "$1" = "upld"     ]; then ARGS="1"; fi
if [ "$#" -eq "2" ] && [ "$1" = "c2htm"    ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = "c2txt"    ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = "passwd"   ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = "conv"     ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = "rename"   ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = "dsply"    ]; then ARGS="2"; fi
if [ "$#" -eq "1" ] && [ "$1" = "dummy"    ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "uroot"    ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "spause"   ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "help"     ]; then ARGS="9"; fi
# this tests the evaluator...
#d echo $#"     "$1"    "$2"    "$3"    "$ARGS ;spause 
# typical cases, be careful to make your own...
case "$ARGS" in
    "0") clear; $1="help"; exit 1;;			        # got nothing, display help and go
    "1") $1 ;;                                              	# run the command
    "2") var2=$2;  $1 ;;                                    	# run the command with an argument
    "3") var3=$3; var2=$2;  $1 ;;                           	# run the command with two arguments
    "4") var4=$4; var3=$3; var2=$2;  $1 ;;                      # run the command with three arguments
    "5") prompt=$2; $1 ;;				    	# run the command with a different argument
    "6") time=$3; prompt=$2;  $1 ;;				# run the command with two different arguments
    "7") flint_short_vita_2017-07-01.odtdefvbl; $1 ;;						# run the command and default variables
    "8") var2=$2;  $1 ;;                                 	# run the command and settle variables
    "9") var3=$3; var2=$2;  $1 ;;                               # run the command and settle variables
      *) clear; cat $0 | grep '^## '| sed -e 's/##//'; exit 1;; # Anything else run help and exit...
esac # End main loop. To TEST:
#
# echo " "; echo "On "$(date +%F\ %r) $0" version "$version" stops"
#debug echo  "That's all folks!!"
#
#d rm -rf ss # removes super secret data file
#* restore environment cd "$S"
