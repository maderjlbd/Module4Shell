Package( "os" );

function kill(){
	if ps aux | grep "yum" | grep -qv "grep"; then
        killall yum
    elif ps aux | grep "apt-get" | grep -qv "grep"; then
        killall apt-get
    fi
}