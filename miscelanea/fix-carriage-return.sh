#!/bin/bash
#
# This script delete Windows carriage return characters.
#
#-------------------------------------------------------
# Author: Pablo Cru
# Github: https://github.com/pablocru
#-------------------------------------------------------

for f in `ls`
do
  perl -p -i -e "s/\r//g" $f
done
