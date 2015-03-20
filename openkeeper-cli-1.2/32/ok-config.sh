#!/bin/bash

# Must be root
if test "`/usr/bin/id -u`" != 0 ; then
	echo "$0: You must be root to run this script" >& 2
	exit 1
fi
MYDIR=`dirname $0`
cd $MYDIR
CONFIG_PATH=config
[[ ! -d $CONFIG_PATH ]]&&mkdir $CONFIG_PATH

sflag=0
USAGE="$0 -u chongzhi -p 123456 -e eth0 -s"
while getopts :u:p:e:s OPTION ; do
	case "$OPTION" in
		u) user="$OPTARG" ;;
		p) pass="$OPTARG" ;;
		e) eth="$OPTARG" ;;
		s) sflag=1 ;;
		\?) echo "$USAGE" ;
		exit 1
		;;
	esac
done

function setconfig() {
	#echo $#
	#echo "setconfig $1 $2 $3 $4"
	case "$#" in
		4) U=$2
		;;
		3) 
			if [ "$3" -eq "0"  ] ; then
				echo $2
				read U
				if [ -z $U ] ; then
					echo "$1未填写，未写入"
					return
				fi
			else
				echo "跳过$1"
				return
			fi
		;;
	esac
	if [ -f $CONFIG_PATH/$1 ] ; then
		echo "覆盖原$1"
		rm $CONFIG_PATH/$1 > /dev/null 2>&1
	fi
	echo $U > $CONFIG_PATH/$1
	chown root.root $CONFIG_PATH/$1
	chmod 600 $CONFIG_PATH/$1
}


setconfig user $user "请输入用户名(例如:chongzhi@cqupt)" $sflag
setconfig pass $pass "请输入密码(例如:123456)" $sflag
setconfig eth  $eth "请输入网关(例如：eth0)" $sflag
