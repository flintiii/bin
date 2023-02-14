#!/bin/bash
# pflint Fri 30 Jan 2015 04:04:36 PM EST04/13/2016 08:35:36 PM
# 04/13/2016 08:35:27 PM
# - fix security into ss
# - sanify code
# - establish variables once
# - 2017-03-11 10:05:04 fix function names
# - Add port to documentaiton
#
# Indexes Tiddlers On Zope Server
version="0.07"
#
#* function help  - Help function for template basic help goes here
function help(){
clear;
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version; uroot #debug
cat $0 | grep '^## ' | sed -e 's/##//'
# echo "This is the help function"
##                       *****DOCUMENTATION*****
## You get this when you put in the wrong number or type of arguments...
## The name of this program is mtoc.sh, a damn bad tiddle show-er.
## This is released under GPL dbtsI
## The syntax is:
##  - mtoc.sh dss <Tiddle URL[:port]> <USER> -
##    sets the tiddlewiki, id & secrets
##  - mtoc.sh sets <Tiddle URL[:port]> <USER> <PASS> -
##    sets the tiddlewiki, id & secrets
##  - mtoc.sh shows - shows  the name of the
##    shows the tiddlewiki, id & secrets
##  - mtoc.sh gtdlu <FILENAME> - gets the tiddles urls into file
##  - mtoc.sh doit - <SUBDIR> downloads all tiddles to subdir
##  - mtoc.sh find <String> - Search for string in downloaded
##  - mtoc.sh clear  <FILENAME> - removes a <FILENAME> and
##  - destroys secrets file
##  - mtoc.sh cover <SUBDIR> - removes a <SUBDIR>
##    in all of these, Output is delivered to the screen...
##      *** NOTE *** This program need not be run as root!
##
## For structure information type "grep '^\#\*' mtoc.sh"
##    :^)
## (C) P Flint, Barre Open Systems Institute Liscensed under GPLI
##
#          *****Documentation Loop ends here the rest is function******
#
} # Test: mtoc.sh
# next lines run ballisticly
#* hold environment
S=$PWD
# echo "This is the path "$S
# debug
#
# Define files to be used
#* function ch4ps - checks and reports on what you need.
function ch4ps(){
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
uroot
#* check location of vital files and programs, sanity check
rm -rf need > /dev/null
for prog in curl expect cadaver xmlstarlet git # libsecret-tools
do
	# echo $prog
	isit=$(which $prog)
	# echo $isit
	if [ ! -f "$isit" ];
	then
	    echo $prog >> need
	    #debug echo "Type \"sudo apt-get install $prog\" to fix this."
	    #debug spause
	    # exit 0
	fi
done
clear
echo "Welcome to $0!"
echo "Missing programs:"
	if [ -f need ];
	then
	   echo "    This program needs the following program(s) to be installed on this system."
	   cat need |while read line; do echo -e \\t" - " $line; done
	   echo "    If you want them installed please logon as root (sudo $0) and they will install"
	   exit 0 # breaks you out of loop...
	else
	   echo " * None *  Looks like the pot's right, lets play!"
	fi
#
echo "end of check"
} # Test:
#
#
#* function instg - # installs extra software if you are root, installs all the good stuff
function instg(){
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
if [ "$(id -u)" = "0" ] && [ -f need ]; then
   echo "You are root and you are about to install the following:" 1>&2
   cat need |while read line; do echo -e \\t" - " $line; done
   read -p "Hit enter to continue and install..." an
   #debug
   cat need |while read line; do apt-get install $line; done
   #debug cat need |while read line; do echo -e \\t" - " $line; done
fi
rm -rf need
#debug exit 0 # breaks you out of loop...
} # Test:
#
# next lines run ballisticly
#debug
instg # installs extra software if you are root
ch4ps # checks and reports on what you need.
# above runs ballisticly
#
#* function dummy - Rename and fill stuff in between braces
function dummy(){
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
uroot
} # Test:
#
#####################################Put stuff here!
#
#* function dss - uses secret-store to gain password
function dss(){
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
# use this command to store a password "secret-tool store --label=zope user <userid>"
tiddleurl=$var2;user=$var3
echo $user
pass=$(secret-tool lookup user $user)
rm -rf ss
#
echo -e " TiddleURL is\t"$tiddleurl
echo -e " User is \t"$user
echo -e " PASS is \t"$pass
#
#d spause
#
touch ss
echo $tiddleurl >> ss
echo $user >> ss
echo $pass  >> ss

if [ "$pass" ]; then
   echo -n "ss is in "; pwd
else
   echo "password is not good"
   rm -rf ss
   #d spause
fi
} # Test dss the
#
#* function sets - sets the name and logon for tiddlewiki you want to work on
function sets(){
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
rm -rf ss
tiddleurl=$var2;user=$var3;pass=$var4
#
echo -e " TiddleURL is\t"$tiddleurl
echo -e " User is \t"$user
echo -e " PASS is \t"$pass
#
touch ss
echo $tiddleurl >> ss
echo $user >> ss
echo $pass  >> ss
#
spause
} # Test: ./mtoc.sh sets one two three
#
#* function shows - shows the url, user and secrets you are currently working on
function shows(){
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
IFS=$'\n' ss=($(cat ss 2>/dev/null))
# [[ ${ss[1]} = $name ]] && echo "${a[$i]}"
tiddleurl=${ss[0]};
user=${ss[1]};
pass=${ss[2]}
proj=${ss[3]}
#
echo -e " TiddleURL is\t"$tiddleurl
echo -e " User is \t"$user
echo -e " Pass is \t"$pass
echo -e " Project is \t"$proj
#
#debug spause
} # Test: ./mtoc.sh shows
#
#* function find - Finds a String in the result..
function find(){
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
echo "This needs work"
cd tiddlers  #fix this...
find . 2>/dev/null |xargs grep robot 2>/dev/null

} # Test:
#
#
#* function gdtml gets the DTML files from a specific directory in zope
function gdtml(){
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
#
shows > /dev/null # loads url, use & secrets
#
subdir=$line
# pwd
#d
echo -e " TiddleURL is\t"$tiddleurl
echo -e " User is \t"$user
echo -e " PASS is \t"$pass
echo -e " PROJECT is \t"$proj
echo "arg0="$tiddleurl",   arg1="$user",   arg2="$pass",   arg3="$subdir;read -p "Hit enter to continue..." ans
#
cd tiddlers
#
[[ -d $subdir ]] || mkdir $subdir
cd $subdir
pwd
#
# packs expect and sends it out...
#
# From this line to EOF is the code to export
# note slash escapes (\\)
read -d '' String <<"EOF"
#!/usr/bin/expect -f
set tiddleurl [lindex $argv 0]
set user      [lindex $argv 1]
set pass      [lindex $argv 2]
set subdir    [lindex $argv 3]
# puts "Argument data:";
# puts "tiddleurl: $tiddleurl";
# puts "user: $user";
# puts "pass: $pass";
# puts "subdir: $subdir";
# check...
if { $user == "" || $pass == "" || $tiddleurl == "" || $subdir == "" }  {
  puts "Usage: <tiddleurl> <user> <pass> <subdir> "
  exit 1
}
spawn /usr/bin/cadaver http://$tiddleurl/$subdir/tiddlers
expect "Username:"
send "$user\\n"
expect "Password:"
send "$pass\\n"
expect "dav:"
send "mget *\\n"
expect "dav:"
send "quit\\n"
EOF
#d echo "this is the subdirectory "$subdir
echo "$String" > doit.exp
chmod +x doit.exp
#d echo "arg0="$tiddleurl",   arg1="$user",   arg2="$pass",   arg3="$subdir
#d read -p "Hit enter to continue..." ans
#./doit.exp $tiddleurl $user $pass $subdir
#d echo "arg0="$tiddleurl",   arg1="$user",   arg2="$pass",   arg3="$subdir;read -p "Hit enter to continue..." ans
./doit.exp $tiddleurl $user $pass $subdir
#d rm -rf doit.exp
#
cd ../../
} # Test: ./mtoc.sh gdtml
#
#
#* function suck <SUBDIRNAME> - makes a <SUBDIRNAME> in the current tiddlewiki
function suck(){
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
#
#
shows > /dev/null # loads url, use & secrets
#
fname=$var2
echo $fname >> ss
# pwd
#d
#d echo -e " TiddleURL is\t"$tiddleurl
#d echo -e " User is \t"$user
#d echo -e " PASS is \t"$pass
#d echo -e " FNAME is \t"$fname
#d echo "arg0="$tiddleurl",   arg1="$user",   arg2="$pass",   arg3="$fname;read -p "Hit enter to continue..." ans
#
# packs expect and sends it out...
#
# From this line to EOF is the code to export
# note slash escapes (\\)
read -d '' String <<"EOF"
#!/usr/bin/expect -f
set tiddleurl [lindex $argv 0]
set user      [lindex $argv 1]
set pass      [lindex $argv 2]
set subdir    [lindex $argv 3]
# put strings very useful
# puts "Argument data:";
# puts "tiddleurl: $tiddleurl";
# puts "user: $user";
# puts "pass: $pass";
# puts "subdir: $subdir";
# check...
# if { $user == "" || $pass == "" || $tiddleurl == "" || $subdir == "" }  {
if { $user == "" || $pass == "" || $tiddleurl == "" }  {
  puts "Usage: <tiddleurl> <user> <pass> <subdir> "
  exit 1
}
spawn /usr/bin/cadaver http://$tiddleurl/$subdir
expect "Username:"
send "$user\\n"
expect "Password:"
send "$pass\\n"
expect "dav:"
send "ls\\n"
expect "dav:"
send "quit\\n"
EOF
echo "This records the root directory entries of $tiddleurl in '$fname' "
echo "$String" > doit.exp
chmod +x doit.exp
#d echo "arg0="$tiddleurl",   arg1="$user",   arg2="$pass",   arg3="$subdir
#d read -p "Hit enter to continue..." ans
#d ./doit.exp $tiddleurl $user $pass $subdir
#d
./doit.exp $tiddleurl $user $pass $subdir | grep "^Coll:" |
						cut -c 9- |
						tr -s " " |
						cut -d " " -f 1  > $fname
#d rm -rf doit.exp
#
} # Test: ./mtoc.sh suck banana
#
#
#* function gtdlu <SUBDIRNAME> - makes a <SUBDIRNAME> dump of the tiddles
function gtdlu(){
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
#
fname=$var2
#
shows > /dev/null # loads url, use & secrets
#d echo -e " TiddleURL is\t"$tiddleurl
#d echo -e " User is \t"$user
#d echo -e " PASS is \t"$pass
#d echo -e " PROJ is \t"$proj
#d echo -e " FNAME is \t"$fname
#d echo "arg0="$tiddleurl",   arg1="$user",   arg2="$pass",   arg3="$proj",   fname="$fname
#d read -p "Hit enter to continue..." ans
#
tdl=0
cat $fname |while read line
do
	# echo "You are currently in: "$line
	# this is the name of the subdirectory you are in
	./doit.exp docbox.flint.com:1980 the end $line | grep "^Coll:" |cut -c 9- |tr -s " " | cut -d " " -f 1 |while read subd
	do
		# echo $subd
		if [[ "$subd" == *"tiddlers"* ]]; then
			echo $tiddleurl"/"$line"/"$subd |tee -a tidlurls; fi
			# echo $tdl" "$tiddleurl"/"$line"/"$subd |tee -a tidlurls; fi
			mkdir -p $subd"/"$line
			# cd $subd"/"$line
			# pwd; read -p "Hit enter to continue..." ans
			gdtml
			((tdl++));
	done
done
#
} # Test: ./mtoc.sh gtdlu
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
if [ "$#" -eq "4" ] && [ "$1" = "sets"     ]; then ARGS="4"; fi
if [ "$#" -eq "1" ] && [ "$1" = "shows"    ]; then ARGS="1"; fi
if [ "$#" -eq "2" ] && [ "$1" = "gtdlu"    ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = "gdtml"    ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = "find"     ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = "doit"     ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = "find"     ]; then ARGS="2"; fi
if [ "$#" -eq "3" ] && [ "$1" = "dss"      ]; then ARGS="3"; fi
if [ "$#" -eq "2" ] && [ "$1" = "cut"      ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = "cover"    ]; then ARGS="2"; fi
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
    "7") defvbl; $1 ;;						# run the command and default variables
    "8") var2=$2;  $1 ;;                                 	# run the command and settle variables
    "9") var3=$3; var2=$2;  $1 ;;                               # run the command and settle variables
      *) clear; cat $0 | grep '^## '| sed -e 's/##//'; exit 1;; # Anything else run help and exit...
esac # End main loop. To TEST:
#
# echo " ";
echo "On "$(date +%F\ %r) $0" version "$version" stops"
#debug echo  "That's all folks!!"
#
#d rm -rf ss # removes super secret data file
#* restore environment
cd "$S"


