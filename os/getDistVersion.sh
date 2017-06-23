Package( "os" );

Import( "os.OsConfig" );

#shell中的${}，##和%%的使用，http://blog.csdn.net/shmilyringpull/article/details/7631106
#shell中$(( )) 与 $( ) 还有${ }的区别，http://www.cnblogs.com/xunbu7/p/6187017.html
function get(){
	if [ -s /usr/bin/python3 ]; then
        eval OsConfig.LinuxDistributionVersion=`/usr/bin/python3 -c 'import platform; print(platform.linux_distribution()[1])'`
    elif [ -s /usr/bin/python2 ]; then
        eval OsConfig.LinuxDistributionVersion=`/usr/bin/python2 -c 'import platform; print platform.linux_distribution()[1]'`
    fi
    if [ $? -ne 0 ]; then
        eval OsConfig.LinuxDistributionVersion=`lsb_release -rs`
    fi
}