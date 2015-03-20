#!/bin/bash
SUDOER=sudo

# Must be root
if test "`/usr/bin/id -u`" != 0 ; then
    echo "$0: You must be root to run this script" >& 2
    exit 1
fi


INSTALL_PATH=/usr/local/openkeeper
SH=bash
MYDIR=`dirname $0`
cd $MYDIR

$SUDOER chmod 777 . -R

$SUDOER rp-pppoe-3.10/ok-go
$SUDOER cp pppoe-connect /usr/sbin/

cd diallinux_v1.0_src_a/
make
cp dialnetkeeper ../
make clean
cd ..

#/usr/bin/ok-config

if [ -d "$INSTALL_PATH" ]
then
	echo "覆盖安装"
	$SUDOER rm -rf $INSTALL_PATH
else
	echo "初次安装"
fi
$SUDOER mkdir $INSTALL_PATH
$SUDOER cp * $INSTALL_PATH

$SUDOER ln -sf $INSTALL_PATH/ok /usr/bin/ok 
$SUDOER ln -sf $INSTALL_PATH/ok-stop /usr/bin/ok-stop 
$SUDOER ln -sf $INSTALL_PATH/ok-config /usr/bin/ok-config
$SUDOER ln -sf $INSTALL_PATH/okok /usr/bin/okok
$SUDOER ln -sf $INSTALL_PATH/okok-stop /usr/bin/okok-stop

echo "安装结束，使用ok拨号，使用ok-stop挂断，ok-config进行设置"
echo "如果在安装中出现No之类的错误提示，请先安装build-essential(g++)编译器，再重新安装！"

