Package( "util" );

Import( "util.colorText" );

function red(){
	echo $(colorText.echo "$1" "31")
}

function green(){
	echo $(colorText.echo "$1" "32")
}

function yellow(){
	echo -n $(colorText.echo "$1" "33")
}

function blue(){
	echo $(colorText.echo "$1" "34")
}