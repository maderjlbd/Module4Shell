Package( "os" );

Import( "os.OsConfig" );

function get(){
	if grep -Eqi "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
        OsConfig.LinuxDistributionName='CentOS'
        OsConfig.PackageManager='yum'
    elif grep -Eqi "Red Hat Enterprise Linux Server" /etc/issue || grep -Eq "Red Hat Enterprise Linux Server" /etc/*-release; then
        OsConfig.LinuxDistributionName='RHEL'
        OsConfig.PackageManager='yum'
    elif grep -Eqi "Aliyun" /etc/issue || grep -Eq "Aliyun" /etc/*-release; then
        OsConfig.LinuxDistributionName='Aliyun'
        OsConfig.PackageManager='yum'
    elif grep -Eqi "Fedora" /etc/issue || grep -Eq "Fedora" /etc/*-release; then
        OsConfig.LinuxDistributionName='Fedora'
        OsConfig.PackageManager='yum'
    elif grep -Eqi "Amazon Linux AMI" /etc/issue || grep -Eq "Amazon Linux AMI" /etc/*-release; then
        OsConfig.LinuxDistributionName='Amazon'
        OsConfig.PackageManager='yum'
    elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
        OsConfig.LinuxDistributionName='Debian'
        OsConfig.PackageManager='apt'
    elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
        OsConfig.LinuxDistributionName='Ubuntu'
        OsConfig.PackageManager='apt'
    elif grep -Eqi "Raspbian" /etc/issue || grep -Eq "Raspbian" /etc/*-release; then
        OsConfig.LinuxDistributionName='Raspbian'
        OsConfig.PackageManager='apt'
    elif grep -Eqi "Deepin" /etc/issue || grep -Eq "Deepin" /etc/*-release; then
        OsConfig.LinuxDistributionName='Deepin'
        OsConfig.PackageManager='apt'
    elif grep -Eqi "Mint" /etc/issue || grep -Eq "Mint" /etc/*-release; then
        OsConfig.LinuxDistributionName='Mint'
        OsConfig.PackageManager='apt'
    else
        OsConfig.LinuxDistributionName='unknow'
    fi
}