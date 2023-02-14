#!/bin/bash
# Sat 14 Nov 2020 10:55:56 AM EST
# Mon 14 Dec 2020 04:13:38 PM EST
# pflint
echo "writing packages_$(date +%F)"
dpkg --get-selections > packages_$(date +%F)
#
# set alias
#
#b apt-get install openssh-server
cd ~
wget http://docbox.flint.com/~flint/bin/.bash_aliases
#
# fix touchpad
# tpi.sh
#
# backup home to usb drive
# navigate to usb drive
# run this:rsync -avr /home .
#
#  apt-get install openssh-server
#  apt-get install gparted
#  apt-get install pluma
#  apt-get install nautilus
#  symlink pluma to gedit
#  cd /usr/bin
#  mv gedit gedit.org
#  ln -s pluma gedit
#
#  install bookmarks and relink for nautilus
#  scp flint@trantor.local:./.gtk-bookmarks ~/.
#  ln -s  /home/flint/.gtk-bookmarks /home/flint/.config/gtk-3.0/bookmarks
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
#




