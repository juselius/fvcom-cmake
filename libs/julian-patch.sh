#!/bin/sh

sed -i "s,\.\./\.\.,$1,; s,\$(INSTALLDIR),$2," $3/makefile

mkdir -p $2/include
mkdir -p $2/lib
mkdir -p $2/bin

