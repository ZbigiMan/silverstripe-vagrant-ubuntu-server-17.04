<?php
ini_set('date.timezone', 'Europe/Warsaw');

// Which kind of environment: dev, test, live
define('SS_ENVIRONMENT_TYPE', 'dev');
if(SS_ENVIRONMENT_TYPE == 'dev') {
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL|E_STRICT);
}

// This defines a default database user
define('SS_DATABASE_SERVER', 'localhost');
define('SS_DATABASE_NAME', 'SS_mysite');
define('SS_DATABASE_USERNAME', 'ssuser');
define('SS_DATABASE_PASSWORD', 'ssuser@pass');

// This defines a default cms user
define('SS_DEFAULT_ADMIN_USERNAME', 'admin');
define('SS_DEFAULT_ADMIN_PASSWORD', 'admin@pass');

global $_FILE_TO_URL_MAPPING;
$baseDir = realpath(dirname(getcwd()));
$_FILE_TO_URL_MAPPING[$baseDir] = 'http://localhost/';
?>