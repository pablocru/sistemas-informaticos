#!/bin/bash
#
# This script delete Windows carriage return characters.
#
#-------------------------------------------------------
# Author: Pablo Cru
# Github: 

FILES="./*"
for f in $FILES
do
  perl -p -i -e "s/\r//g" $f
done
