#!/bin/bash

export lbd_config_globalWarUrlInEnv


function lbd_getInputUrl_get(){
	local text="Hello World!!!" 

	if [ -z $1 ]; then
	  echo 'enter the url: '
	  read url
	  lbd_config_globalWarUrlInEnv=$url
	else
	  url=$1
	  echo $url
	fi
	return 0
}


function lbd_printWarUrl_print(){
	echo "print war url=$lbd_config_globalWarUrlInEnv"
}


function main() {

    local OPTIND

	while getopts u: OPT;do
	   case $OPT in
	       u)
	           warUrl=$OPTARG
	           lbd_config_globalWarUrlInEnv=$warUrl
	           lbd_getInputUrl_get $warUrl
	           ;;

	       \?)
				echo 'nothing input';
	           usage
	           exit 1
	           ;;
	   esac
	done

	if [ ! -n "$lbd_config_globalWarUrlInEnv" ]; then  
	  echo "input url param must needed"  
	  lbd_getInputUrl_get
	else  
	  echo "url param ok"  
	fi

	lbd_printWarUrl_print
}

main $@
