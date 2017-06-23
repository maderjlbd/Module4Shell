Package( "lbd" );

Import( "os.getDistName" );
Import( "os.getOsBit" );
Import( "os.getDistVersion" );
Import( "util.echoUtil" );
Import( "os.OsConfig" );

function print(){
	getDistName.get
	getDistVersion.get
	getOsBit.get

	echoUtil.red $OsConfig.LinuxDistributionName
	echoUtil.red $OsConfig.LinuxDistributionVersion
	echoUtil.red $OsConfig.PackageManager
	echoUtil.red $OsConfig.is64bit
}