#!/bin/bash
############ADJUST AS YOU NEED###########################
outdir=ROOT
tomcat_home=/usr/local/tomcats/apache-tomcat-01

#################### DO NOT MODIFY ##################################
webapp_dir=/usr/local/tomcats/apache-tomcat-01/webapps

if [ -z $1 ]; then
  echo 'enter the url: '
  read url
else
  url=$1
fi
fname=`basename $url`
echo $fname
wget $url -P /tmp
rm -rf $webapp_dir/$outdir/*
unzip -q /tmp/$fname -d $webapp_dir/$outdir
rm -f /tmp/$fname

pid=`ps -C java u --cols=500|grep $tomcat_home/ |awk '{print $2}'`

echo $pid

kill -9 `ps -C java u --cols=500|grep $tomcat_home/ |awk '{print $2}'`
nohup $tomcat_home/bin/startup.sh >> /dev/null

local_ip=`/sbin/ifconfig eth0 |grep "inet addr"| cut -f 2 -d ":"|cut -f 1 -d " "`
login_user=`who am i | awk '{print $1}'`
login_ip=`who am i | awk '{print $5}' | sed 's/[()]//g'`
script_name=`basename $0`
echo $script_name
login_acction=`echo $script_name | sed 's/_.*//'`
if [ -h /usr/local/apps_deploy/$script_name ];then
    login_tomcatid=`readlink -f /home/yhdteopts/$script_name | sed 's/.*\(apache-tomcat[0-9]\{4\}\).*/\1/'`
else
    login_tomcatid=`echo $script_name | sed 's/.*\(apache-tomcat[0-9]\{4\}\).*/\1/'`
fi
echo -e "`date +%Y-%m-%d`\t`date +%H:%M:%S`\t$local_ip\t$login_ip\t$login_user\t$login_tomcatid\t$login_acction" >> /usr/local/apps_deploy/tomcat_action.log

tail -f $tomcat_home/logs/catalina.out
