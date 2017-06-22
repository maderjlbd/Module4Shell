Package( "lbd" );

Import( "lbd.config" );

function get(){
	#定义函数内部的局部变量，如果同名，Shell函数定义的local变量会屏蔽脚本定义的global变量
	local text="Hello World!!!" 

	if [ -z $1 ]; then
	  echo 'enter the url: '
	  read url
	  config.globalWarUrlInEnv = $url
	else
	  #定义变量的时候不需要加$符号，但使用这个变量的时候的需要加上$符号
	  url=$1
	  echo $url
	fi
	#报错：return: url: numeric argument required
	#参考：http://blog.csdn.net/yasi_xi/article/details/8546758
	#Shell 函数返回值只能是整形数值，一般是用来表示函数执行成功与否的，0表示成功，其他值表示失败
	#如果一定要让函数返回一个或多个值，可以定义全局变量，函数将计算结果赋给全局变量，然后脚本中其他地方通过访问全局变量，就可以获得那个函数“返回”的一个或多个执行结果了。
	return 0
}