#!/usr/bin/env bash 
# Thu 03 Mar 2022 09:40:27 AM EST pflint
version="0.06"
#
# programs you need put here
need="git libsecret-tools pv " #D add "banana" to ntest 
# need="sphinx-common sphinx-doc python-sphinx git pv apache2" 
#
# GIT SOURCE: https://gist.github.com/alexpchin/dc91e723d4db5018fef8
# git --version 	# to check git version
# git config --global user.name "Paul Flint"
# git config --global user.email "flint@flint.com"
# git config --global --list
# git status 		# important
# cd repository
# touch README.md
# git init
# git add README.md
# git commit -m "first commit"
# git remote add origin git@github.com:alexpchin/<reponame>.git
# git push -u origin master
# git config --global user.name "Paul Flint"
# git config --global user.email "flint@flint.com"
# https://github.com/settings/keys
# ssh-keygen -t rsa -C "flint@flint.com" ; copied key using gui
#
#* function help  - Help function for template basic help goes here
function help(){ 
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version; uroot #deb
#
cat $0 | grep '^## ' | sed -e 's/##//'
# echo "This is the help function"
##                         *****DOCUMENTATION*****
## You get this when you put in the wrong number or type of arguments...
## The name of this program is gitbrain.sh, an extention of unix find.
## This is released under GPL I
## The syntax is:
## - gitbrain.sh sane          - Checks that you have the stuff you need. 
## - gitbrain.sh See2do        - Shows you what you need to fix. 
## - gitbrain.sh briget [file] - Checks your braces, where...
##   [file]  = [any valid vb file name (if not included checks itself)]
## - gitbrain.sh select        - An example of select where... 
## - gitbrain.sh gitset <dir>  - Sets up a git based development environment 
##   <dir> = ["." (= default unless specified)]
## - gitbrain.sh <date> [ext]  - Shows revision history where...
##   <date> = yyyy/mm/dd 
##   <ext>  = [any valid part of name (optional)]
## - gitbrain.sh gupdate [dir] - updates your git repository. 
##   [dir] = [. (unless specified)]
## - gitbrain.sh dsply <ext> where...
##   <ext>=<file[doc,txt,pdf]> displays these three types
## - gitbrain.sh difsply <ext1> <ext2> where... 
##    in all of these, Output is delivered to the screen...
## *** NOTE *** , except installing code in sane, commands need not be run as root
##
## For structure information type "grep '^\#\*' gitbrain.sh"
#
} # Test: gitbrain.sh help 
#
function dummy(){
#* function dummy - Rename and fill stuff in between braces
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
uroot
} # Test: gitbrain.sh dummy
#
function gitset(){
#* function gitset - Rename and fill stuff in between braces
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
uroot
} # Test: gitbrain.sh gitset
#
#
function difsply(){
#* function difsply - Rename and fill stuff in between braces
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
uroot
} # Test: gitbrain.sh difsply

#
function dsply(){
#* function dsply - Rename and fill stuff in between braces
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
uroot
} # Test: gitbrain.sh dsply
#
#
function select(){
#* function select - Example of a select function
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
# uroot
echo "Type the letter for the fruit"
echo " 1. Banana"
echo " 2. Apple"
echo "Please choose 1 or 2 >" 
read ans
case "$ans" in
    "1") echo "Banana" ;;
    "2") echo "Apple"  ;;
      *) echo "Wrong"  ;; # Anything else run help and exit...
esac 
} # Test: gitbrain.sh select
#
function briget(){
#* function briget - Checks the braces in a visual bash function
clear; echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
#
ob=$(echo -e '\x7b')
cb=$(echo -e '\x7d')

if [ "$ARGS" -eq "1" ]; then target="gitbrain.sh"; fi
if [ "$ARGS" -eq "2" ]; then target=$var2; fi
# echo $ARGS, $target; spause
cat -n $target |while read line; 
do echo $line
# while $FUNCNAME != "briget" 
# do
# if [[ "$line" == *$ob* ]] && [[ "$line" != "*'/*$ob/*'*" ]] ; then
if [[ "$line" == *$ob* ]] ; then
 #  echo "$ob" FSTART 
   echo  "$ob"  FSTART 
   i=$((i+1))
 # else
 # echo "$ob" was not found
 fi
 if [[ "$line" == *$cb* ]] ; then
 # if [[ "$line" == *$cb* ]] && [[ "$line" != "*'/*$cb/*'*" ]] ; then
   echo  "$cb" FEND; PAIR=1
   i=$((i-1))
 fi
# done # test name
 #
done
# uroot
} # Test: gitbrain.sh dummy
#

function See2do(){
clear
#* function See2do - Notionally lists what you need to complete
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
#
echo "You need to rewrite the menu in a manner that is functional"
echo "Add a function which sets up the git environment the way you want it"
echo "Add a function which checks for proper braces (briget)"
echo "Add a function that puts this program in the path"
spause
} # Test: gitbrain.sh See2do
#
function gitset(){
#* function gitset - Rename and fill stuff in between braces
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
# uroot
echo " the name of the directory you are setting up is: "$var2
spause
PROJ=$var2  cd $#* function help  - Help function for template basic help goes here
#* function dummy - Rename and fill stuff in between braces
#* function gitset - Rename and fill stuff in between braces
#* function difsply - Rename and fill stuff in between braces
#* function dsply - Rename and fill stuff in between braces
#* function select - Example of a select function
#* function briget - Checks the braces in a visual bash function
#* function See2do - Notionally lists what you need to complete
#* function gitset - Rename and fill stuff in between braces
#* function PlainDrupal - apparently installs a drupal instance. ?please expand?
#* function uroot - Checks to see if you are root
#* function spause   - A simple tarry...
#* check location of vital files and programs, sanity check
PROJ
  git init
  echo "*~" >> .gitignore
  echo "*.swp" >> .gitignore
  echo "*.swo" >> .gitignore
  echo "*.tmp" >> .gitignore
  echo "*.sql" >> .gitignore
  echo "*.zip" >> .gitignore
  echo "*.tgz" >> .gitignore
  echo "*.tar.gz" >> .gitignore
  echo "*/sites/default/files" >> .gitignore
  echo "*/sites/default/settings.php" >> .gitignore
  echo "*/sites/default/civicrm.settings.php" >> .gitignore
  git add .gitignore
  git commit -m "Begin."
  git add .
  git commit -m "Track files."
} # Test: gitbrain.sh gitset banana
#
function PlainDrupal(){
#* function PlainDrupal - apparently installs a drupal instance. ?please expand?
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
uroot #F do you need root?
echo "note that $opt and $PROJ are not yet defined..."
echo "type in 'opt' ";read opt
echo "type in 'PROJ' ";read PROJ
echo "are these correct? "$opt, $PROJ
spause
break
echo "installing $opt into $PROJ"
echo " I have no idea what we do now..."
echo "I presume that this next line..." 
echo "composer create-project drupal/recommended-project:8.x $PROJ"
init_git_and_ddev
composer require drupal/admin_toolbar
# @TODO drush enabI'd like to skip the tiddlywiki altogether if possibleles
ddev exec drush site-install --yes
ddev exec drush en -y admin_toolbar_tools
} # Test: gitbrain.sh PlainDrupal
#
#
######################################STANDARD AND MAYBE USEFUL FUNCTIONS BELOW
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
#* check location of vital files and programs, sanity check
function sane(){
echo "This is the \""$FUNCNAME"\" function in "$0" version "$version #debug
rm -rf need > /dev/null
for prog in $need
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
} # Test: gitbrain.sh sane
#*###################################### MAIN ENTRY POINT AND COMPOUND CASE
#
#* Evaluator Routine
# Note the evaluator allows for many cases and error checking...
#d ARGS=$#         # carries the number of args into the functions...
#D echo $#"     "$1"    "$2"    "$3"    "$ARGS ;spause 
if [ "$#" -eq "1" ] && [ "$1" = "PlainDrupal" ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "Crunchy"     ]; then ARGS="*"; fi
if [ "$#" -eq "2" ] && [ "$1" = "Replace"     ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = "These"       ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = "With "       ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = "Your"        ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = "Functions"   ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = "GotIt?"      ]; then ARGS="2"; fi
if [ "$#" -eq "2" ] && [ "$1" = "gitset"      ]; then ARGS="2"; fi
if [ "$#" -eq "1" ] && [ "$1" = "See2do"      ]; then ARGS="1"; fi
if [ "$#" -eq "1" ] && [ "$1" = "briget"      ]; then ARGS="1"; fi
if [ "$#" -eq "2" ] && [ "$1" = "briget"      ]; then ARGS="2"; fi
if [ "$#" -eq "1" ] && [ "$1" = "select"      ]; then ARGS="1"; fi
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

