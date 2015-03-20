#!/bin/bash

INSTALL_PATH=/usr/local/openkeeper
MYDIR=`dirname $0`
cd $MYDIR

SUDOER=sudo
RELEASE_PATH=openkeeper-cli-1.0
rm -rf $RELEASE_PATH
mkdir $RELEASE_PATH

mkdir $RELEASE_PATH/diallinux_v1.0_src_a/
mkdir $RELEASE_PATH/rp-pppoe-3.10/
cp -rf dev/diallinux_v1.0_src_a $RELEASE_PATH
cp -rf dev/rp-pppoe-3.10 $RELEASE_PATH
cp cli/* $RELEASE_PATH/

echo tar cfz $RELEASE_PATH.tar.gz $RELEASE_PATH
tar cfz $RELEASE_PATH.tar.gz $RELEASE_PATH
rm -r $RELEASE_PATH 
#echo tar cfj $RELEASE_PATH.tar.bz2 $RELEASE_PATH
#tar cfj $RELEASE_PATH.tar.bz2 $RELEASE_PATH

#$RELEASE_PATH/install.sh
