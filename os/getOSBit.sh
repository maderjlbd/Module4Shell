Package( "os" );

Import( "os.OsConfig" );

function get(){
	if [[ `getconf WORD_BIT` = '32' && `getconf LONG_BIT` = '64' ]] ; then
        OsConfig.is64bit='y'
    else
        OsConfig.is64bit='n'
    fi
}