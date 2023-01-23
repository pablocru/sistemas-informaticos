#!/bin/bash
# Script que lee un nombre y saluda.
#-------------------------------------
# Author: Pablo Cru
# Github: https://github.com/pabcrudel
#-------------------------------------

if [ -z $1 ]
then
  echo ¿Como te llamas?
  read name
else
name=$1
fi

echo Buenos dias, $name