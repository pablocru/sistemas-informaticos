#!/bin/bash
#
#-----------------
# Author: Pablo Cru
#------------------

if [ -z $1 ]
then
  echo ¿Como te llamas?
  read name
else
name=$1
fi

echo Buenos dias, $name
