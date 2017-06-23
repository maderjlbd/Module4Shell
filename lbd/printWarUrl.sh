Package( "lbd" );

Import( "lbd.config" );
Import( "util.checkIfRootUser" );
Import( "util.echoUtil" );

function print(){
	#checkIfRootUser.check

	echoUtil.red "print war url = $config.globalWarUrlInEnv"
}