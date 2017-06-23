
#!/bin/bash
##################DJUST AS YOU NEED###########################
tomcat_home=/usr/local/tomcats/apache-tomcat-01

#################### DO NOT MODIFY ##################################
kill -9 `ps -C java u --cols=500|grep $tomcat_home/ |awk '{print $2}'`
nohup $tomcat_home/bin/startup.sh >> /dev/null

local_ip=`/sbin/ifconfig eth0 |grep "inet addr"| cut -f 2 -d ":"|cut -f 1 -d " "`
login_user=`who am i | awk '{print $1}'`
login_ip=`who am i | awk '{print $5}' | sed 's/[()]//g'`
script_name=`basename $0`
login_acction=`echo $script_name | sed 's/_.*//'`
if [ -h /usr/local/apps_deploy/$script_name ];then
    login_tomcatid=`readlink -f /usr/local/apps_deploy/$script_name | sed 's/.*\(tomcat[0-9]\{4\}\).*/\1/'`
else
    login_tomcatid=`echo $script_name | sed 's/.*\(tomcat[0-9]\{4\}\).*/\1/'`
fi
echo -e "`date +%Y-%m-%d`\t`date +%H:%M:%S`\t$local_ip\t$login_ip\t$login_user\t$login_tomcatid\t$login_acction" >> /usr/local/apps_deploy/tomcat_action.log

tail -f $tomcat_home/logs/catalina.out

