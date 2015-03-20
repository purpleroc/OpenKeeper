#!/bin/bash
# Must be root
if test "`/usr/bin/id -u`" != 0 ; then
    echo "$0: You must be root to run this script" >& 2
    exit 1
fi

while true
do
	if test -z "`ifconfig|grep ppp`" ; then
		date
		/usr/bin/ok
	fi
	sleep 3
done
