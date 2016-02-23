<?php


# Tag
define('BOCTAG','0.9');

# 数据库
define('DB_TYPE'   , 'mysqli');
define('DB_HOST'   , 'localhost');
define('DB_USER'   , 'root');
define('DB_PASS'   , '');
define('DB_NAME'   , 'zb_rumeinews');
define('DB_PREFIX' , 'boc_');

# 全局URL路径
// 主域名 保留最后的 /
define('GLOBAL_URL'  , 'http://'.$_SERVER['HTTP_HOST'].'/rumeinews/');
// 提供给后台做链接用的
define('SITE_URL'  ,   GLOBAL_URL.'index.php/');
define('STATIC_URL'  , GLOBAL_URL.'static/');
define('UPLOAD_URL'  , GLOBAL_URL.'upload/');
define('ADMINER_URL' , GLOBAL_URL.'bocadmin/');
define('MOBILE_URL'  , GLOBAL_URL.'mobile/');
define('API_URL' , GLOBAL_URL.'api/');

// define('GLOBAL_URL'  , 'http://192.168.0.78:220/');
// define('STATIC_URL'  , 'http://192.168.0.78:221/');
// define('UPLOAD_URL'  , 'http://192.168.0.78:222/');
// define('ADMINER_URL' , 'http://192.168.0.78:224/');
// define('MOBILE_URL'  , 'http://192.168.0.78:225/');

// // 快捷提供给JS
define('IMG_URL'     , STATIC_URL.'img/');

# 引用绝对路径PATH定义
define('ROOT'        , dirname(__FILE__).'/');
define('LIBS_PATH'   , ROOT.'libs/');
define('CI_PATH'     , ROOT.'libs/ci/');
define('STATIC_PATH' , ROOT.'static/');
define('UPLOAD_PATH' , ROOT.'upload/');

# 可忽略 当css|js改变时替换本地缓存,将false 替换为 'v[1,2...]'
define('STATIC_V','v3');

# 密钥设置;设置多个 用于 md5/sha1(hmac.value.time) 外部数据输入输出
# 提供给 app 的config 的 encryption_key
define('HMACPWD','SA1S2D3F4G5H6J7K8L9'); // PASSWD and cookie
define('HMAC','SA1S2D3F4G5H6J7K8L8');    // 提供第三方API验证使用

/*
 * 开发模式
 * 配置项目运行的环境，该配置会影响错误报告的显示和配置文件的读取。
 * development
 * testing
 * production
 * 使用 error_reporting();
 */
define('ENVIRONMENT', 'development');
// 有些服务器不支持调试，需要开启错误调试
// error_reporting(E_ALL);
// ini_set("display_errors", 1);
// ini_set("error_reporting", 1);

// PHP 5 尝试加载未定义的类
// 挂载本地库 其他 core Controller
// 使用第三方报错工具可能会出现未加载的现象出现使
function __autoload($class)
{
	if(strpos($class, 'CI_') !== 0)
	{
		if (file_exists(APPPATH . 'core/'. $class . EXT)) {
			@include_once( APPPATH . 'core/'. $class . EXT );
		}elseif(file_exists(LIBS_PATH . 'core/'. $class . EXT)) {
			@include_once( LIBS_PATH . 'core/'. $class . EXT );
		}
	}
}
