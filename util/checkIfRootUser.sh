Package( "util" );

function check(){
	# Check if user is root
	if [ $(id -u) != "0" ]; then
	    echo "Error: You must be root to run this script, please use root to install lnmp"
	    exit 1
	fi
}