Package( "os" );

function get(){
	if uname -m | grep -Eqi "arm"; then
        Is_ARM='y'
    fi
}