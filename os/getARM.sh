Package( "os" );

Import( "os.OsConfig" );

function get(){
	if uname -m | grep -Eqi "arm"; then
        OsConfig.isARM='y'
    fi
}