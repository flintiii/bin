#!/bin/bash
version="0.012"
#
# Wed 24 Aug 2022 03:12:12 PM EDT
# pflint
#
function help(){
#* function help  - Help function for template basic help goes here
clear;
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version; uroot #deb
#
cat $0 | grep '^## ' | sed -e 's/##//'
# echo "This is the help function"
##           *****DOCUMENTATION*****
## You get this when you put in the wrong number or type of arguments...
## The name of this program is cinagrade.sh, an extention of unix find.
## This is released under GPL I
## The syntax is:
## - ch sane         - Checks that you have the stuff you need.
## - cinagrade.sh bupdate       - update packages and backup package file.
## - cinagrade.sh setalias      - Sets up a git based development environment
## - cinagrade.sh bu2usb        - Backup to USB
## - cinagrade.sh <date> <ext> - does something cool
## 		Where <date> = yyy/mm/dd
## - cinagrade.sh gupdate      - updates your git repository.
## - cinagrade.sh dsply <file[doc,txt,pdf]> displays these three types
##    in all of these, Output is delivered to the screen...
## *** NOTE *** These commands need not be run as root, but installing sane code!
##
## For structure information type "grep '^\#\*' cinagrade.sh"
#
} # Test: cinagrade.sh help
#
#
function dummy(){
#* function dummy - Rename and fill stuff in between braces
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
uroot
} # Test: cinagrade.sh dummy
#
#
function bupdate(){
#* function bupdate - Updates package lists & backups packages
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
uroot
# update packages
echo "Now you need root"
sudo apt-get update
#
# now update package file
echo "writing packages_$(date +%F)"
dpkg --get-selections > packages_$(date +%F)
#
} # Test: cinagrade.sh bupdate
#
#
function setalias(){
#* function setalias - sets the alias features we like
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
uroot
# set alias
#
cd ~
mkdir -p ~/obe
cp .bash_aliases obe/$(date +%F)_.bash_aliases
wget http://docbox.flint.com/~flint/bin/.bash_aliases
} # Test: cinagrade.sh setalias
#
#
function bu2usb(){
#* function bu2usb - backs up home directory to usb
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
uroot
} # Test: cinagrade.sh dummy
#
# backup home to usb drive
# navigate to usb drive
# run this:rsync -avr /home .
#
#
#  symlink pluma to gedit
#  cd /usr/bin
#  mv gedit gedit.org
#  ln -s pluma gedit
#
#  install bookmarks and relink for nautilus
#  scp flint@trantor.local:./.gtk-bookmarks ~/.\
#  mkdir -p /home/flint/.config/gtk-3.0/obe
#  mv  /home/flint/.config/gtk-3.0/bookmarks  /home/flint/.config/gtk-3.0/obe/$(date +%F)_bookmarks
#  ln -s  /home/flint/.gtk-bookmarks /home/flint/.config/gtk-3.0/bookmarks
#  ls -alt /home/flint/.config/gtk-3.0/bookmarks
#  ln -s  /home/flint/.gtk-bookmarks /home/flint/.config/gtk-3.0/bookmarks
#  scp flint@trantor.local:./.gtk-bookmarks /home/flint/.
#  mkdir -p /home/flint/.config/gtk-3.0/obe
#  mv  bookmarks obe/$(date +%F)_bookmarks
#
#  install bonjour
#  apt-get install avahi-daemon avahi-utils avahi-discover
#  service avahi-daemon restart
#
#  Fix Tablet
# https://www.linuxquestions.org/questions/linux-newbie-8/touch-screen-activation-in-ubuntu-15-10-lts-on-panasonic-toughbook-cf-29-mark-v-4175560322/
#
# https://www.bobjohnson.com/blog/giving-an-old-toughbook-a-new-lease-on-life-with-linux/
#
#https://www.youtube.com/watch?v=pIvWTH8L0Fk
#
#
#https://www.ebay.com/sch/i.html?_from=R40&_trksid=pmkdir -p /home/flint/.config/gtk-3.0/obe2334524.m570.l1313&_nkw=home+elevator+lift&_sacat=0&LH_TitleDesc=0&_osacat=0&_odkw=home+elevator+kit
#
#
#https://www.youtube.com/watch?v=CgdsamzPN8w
#
#https://search.yahoo.com/yhs/search?hspart=ddc&hsimp=yhs-linuxmint&type=__alt__ddc_linuxmint_com&p=unistrut+elevator
#
#
#####################################STANDARD AND MAYBE USEFUL FUNCTIONS BELOW
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
function sane(){
#* function sane - check location of vital files and programs, sanity check
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
rm -rf need > /dev/null
for prog in openssh-server gparted nautilus pluma git
#d ;do echo $prog; done
#D banana # programs you need put here
do
	# echo $prog
	# Better SOURCE:https://www.cyberciti.biz/faq/find-out-if-package-is-installed-in-linux/
	answer=$(echo $(dpkg-query -W -f='${Status} ${Version}\n' $prog)| cut -d " " -f 3)
	# echo $answer
	if [ "$answer" != "installed" ];
	then
	    echo $prog >> need
	    #debug echo "Type \"sudo apt-get install $prog\" to fix this."
	    #debug spause
	    # exit 0
	fi
done
#D clear
echo "Welcome to $0!"
# uroot
echo "Missing programs:"
	if [ -f need ];
	then
	   echo "    This program needs the following program(s) to be installed on this system."
	   cat need |while read line; do echo -e \\t" - " $line; done
	   if [ "$(id -u)" != "0" ]; then
   		echo "This script needs to run as root and you are not root" 1>&2
	        echo "You want them installed if you are root they will install"
		echo "Leaving this function without installing anything"
		exit
	   fi
	   spause
	   cat need |while read line; do
		echo "apt-get --yes install $line"
		apt-get --yes install $line
	   done
	   #D
	   rm -rf need
	   exit 0 # breaks you out of loop...
	else
	   echo " * None *  Looks like the pot's right, lets play!"
	fi
#
echo "end of check"
} # Test: cinagrade.sh sane
#*###################################### MAIN ENTRY POINT AND COMPOUND CASE
#
#* Evaluator Routine
# Note the evaluator allows for many cases and error checking...
#d ARGS=$#         # carries the number of args into the functions...
#D echo $#"     "$1"    "$2"    "$3"    "$ARGS ;spause
if [ "$#" -eq "1" ] && [ "$1" = "update"      ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "bupdate"     ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "bu2usb"      ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "setalias"    ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "dummy"       ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "uroot"       ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "spause"      ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "sane"        ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "help"        ]; then ARGS="9"; fi
# this tests the evaluator...
#D echo $#"     "$1"    "$2"    "$3"    "$ARGS ;spause
#
#* Dispatcher Routing
# typical cases, be careful to make your own...
case "$ARGS" in
    "0") clear; $1="help"; exit 1;;     # got nothing, display help and go
    "1") $1 ;;  # run the command
    "2") var2=$2;  $1 ;;    # run the command with an argument
    "3") var3=$3; var2=$2;  $1 ;;       # run the command with two arguments
    "4") var4=$4; var3=$3; var2=$2;  $1 ;;          # run the command with three arguments
    "5") prompt=$2; $1 ;;   # run the command with a different argument
    "6") time=$3; prompt=$2;  $1 ;;     # run the command with two different arguments
    "7") flint_short_vita_2017-07-01.odtdefvbl; $1 ;;           # run the command and default variables
    "8") var2=$2;  $1 ;;    # run the command and settle variables
    "9") var3=$3; var2=$2;  $1 ;;       # run the command and settle variables
    "9") var3=$3; var2=$2;  $1 ;;       # run the command and settle variables
      *) clear; cat $0 | grep '^## '| sed -e 's/##//'; exit 1;; # Anything else run help and exit...
esac # End main loop. TEST: ?fill in test?
#
# echo " "; echo "On "$(date +%F\ %r) $0" version "$version" stops"
#debug echo  "That's all folks!!"
#
#* restore environment cd "$S"
