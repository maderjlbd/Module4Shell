Package( "" );

Import( "lbd.config" );
Import( "lbd.getInputUrl" );
Import( "lbd.printWarUrl" );

#参考：http://www.zmonster.me/2014/08/09/pare-arguments-in-shell-function.html
#参考：http://www.cnblogs.com/FrankTan/archive/2010/03/01/1634516.html
#参考：http://www.cnblogs.com/chengmo/archive/2010/10/17/1853356.html
#参考：http://c.biancheng.net/cpp/view/2739.html
#参考：http://www.cnblogs.com/baizhantang/archive/2012/09/11/2680453.html
#入口函数
function main() {

    local OPTIND

	while getopts u: OPT;do
	   case $OPT in
	       u)
			   #这里定义了一个变量warUrl，经实践发现定义变量等号（=）两边不能有空格，否则报错。
	           warUrl = $OPTARG
	           #复制给用作全局变量的环境变量，用于判断用户有没有输入指定命令行参数
	           config.globalWarUrlInEnv = $warUrl
	           #调用getInputUrl函数并传入$warUrl参数
	           getInputUrl.get $warUrl
	           ;;

	       #[dev@sh-weimob-java-arch-dev-03 ~]$ ./test001.sh -?
		   #./test001.sh: illegal option -- ?
		   #nothing input
		   #./test001.sh: line 33: usage: command not found
	       \?)
				echo 'nothing input';
	           usage
	           exit 1
	           ;;
	   esac
	done

	#shell中如何判断一个变量是否为空，http://blog.csdn.net/l_nan/article/details/37760851
	if [ ! -n "$config.globalWarUrlInEnv" ]; then  
	  echo "input url param must needed"  
	  getInputUrl.get
	else  
	  echo "url param ok"  
	fi

	printWarUrl.print
}

#执行入口函数
main $@