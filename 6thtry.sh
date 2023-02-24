#!/bin/bash
#
DIRECTORY="/sys/bus/w1/devices/"
if  [ -d "$DIRECTORY" ]; then
 echo "$DIRECTORY exists on your filesystem." ;
fi
echo "change Directory to: $DIRECTORY"
cd $DIRECTORY
ls -1 $DIRECTORY | grep -v "bus"|while read line;
do
inputfile=$DIRECTORY$line"/w1_slave"
echo "victum is: "$inputfile
    while IFS=, read -r y
    do
    echo $y
done # echo
done # read line
