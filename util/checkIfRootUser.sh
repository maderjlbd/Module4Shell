Package( "util" );

Import( "util.echoUtil" );

function check(){
	# Check if user is root
	if [ $(id -u) != "0" ]; then
	    echoUtil.red "Error: You must be root to run this script, please use root to install lnmp"
	    exit 1
	fi
}