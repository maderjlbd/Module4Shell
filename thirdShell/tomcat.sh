# 启动脚本

#!/bin/sh
TomcatName="$1"
Action="$2"

SERVER_NAME="$TomcatName"
Tomcat1_PATH="/application/$TomcatName"

PARAMS="" 
EXEC="$Tomcat1_PATH/bin/startup.sh"
EXEC_PRINT_CATALINA_LOG="tail -f $Tomcat1_PATH/logs/catalina.out"
COMMAND=$EXEC
SERVER_TAG="$TomcatName"

echo "self sh script startup!"

print_catalina_log(){
        $EXEC_PRINT_CATALINA_LOG
}
is_server_started(){
        ps -ef |grep "$SERVER_TAG" | grep -v grep
        if [ -n $pid ]
        then 
                return 0
        else 
                echo "pid=$pid is running!"
                return $pid
        fi      
}

start_proc(){
        is_server_started
        if [ ! -n $pid ]; then
                echo "${SERVER_NAME} is already running !"
        else
                echo "Starting ${SERVER_NAME} ..."
                sleep 2
                                        $EXEC > /dev/null 2>&1 &
                
                is_server_started
                if [ $? -eq 0 ]; then
                        echo "${SERVER_NAME} started !"
                        print_catalina_log
                else
                        echo "${SERVER_NAME} starts failed !"
                fi

        fi
}

status_proc(){
        is_server_started
        if [ $? -eq 0 ]; then
                echo "${SERVER_TAG} ${SERVER_NAME} is running !"
                ps -ef | grep -w "${PROC_TAG}" | grep -v grep
        else
                echo "${SERVER_NAME} is not running !"
        fi
}

stop_proc(){
        is_server_started
        if [ $? -eq 0 ]; then
                pid=`ps -ef|grep ${SERVER_TAG} |grep -v grep|awk '{print $2}'`
                kill -9 ${pid}
                echo "${pid} ${SERVER_NAME} is stoped !"
        else
                echo "${SERVER_NAME} is already stoped !"
        fi
}

client(){
        $COMMAND
}

case $2 in
        start)
                start_proc
                ;;
        status)
                status_proc
                ;;
        stop)
                stop_proc
                ;;
        restart)
                stop_proc
                start_proc
                ;;
        *)
                client
esac
exit $RETVAL

