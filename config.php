<?php

//stop file from being directly acessed

if (phpversion() >= 5)
    {
    if (count(get_included_files()) == 1)
    {
        header("HTTP/1.1 404 File Not Found", 404);
        exit;
    }
}
else
{
    if (count(get_included_files()) == 0)  //stop file from being directly acessed
    {
        header("HTTP/1.1 404 File Not Found", 404);
        exit;
    }
}

$config                     = array();
$config['adminemail']       = 'someone@test.com';       //the email address to send notifications to
$config['sendnotification'] = true;                     //send email notification (recommended)
$config['emailfrom']        = 'someone@test.com';       //send email from
$config['smtp']             = false;                    //use smtp to send emails
$config['smtpserver']       = '';                       //smtp server (only enter if smtp is true)
$config['smtpusername']     = '';                       //smtp username (only enter if smtp is true)
$config['smtppassword']     = '';                       //smtp password (only enter if smtp is true)
$config['smtpsecure']       = 'tls';                    //smtp encryption (tls / ssl)
$config['smtpport']         = 587;                      //smtp port (only enter if smtp is true)
$config['path']             = dirname(__FILE__);        //script root path
$config['version']          = '1.2';                    //script version
$config['logintimeout']     = '1800';                   //inactivity timeout in seconds
$config['debug']            = false;                    //debug mode
$config['debuglevel']       = 2;                        //0 for just show errors, 1 for just log errors or 2 for show and log errors
$config['errorlevels']      = 'E_ALL | E_STRICT';       //error reporting level
$config['logerrors']        = true;                     //log errors to the syslog even when debug is set to false
$config['timezone']         = 'UTC';                    //default time zone to use

// DON'T EDIT BELOW THIS LINE

error_reporting($config['errorlevels']);          
date_default_timezone_set($config['timezone']);        

if ($config['debug'])                         
{
	switch ($config['debuglevel'])
	{
		case 0:
			ini_set('display_errors', 1);
			ini_set('log_errors', 0);
			break;
		case 1:
			ini_set('display_errors', 0);
			ini_set('log_errors', 1);
			break;
		case 2:
			ini_set('display_errors', 1);
			ini_set('log_errors', 1);
			break;
		default:
			ini_set('display_errors', 1);
			ini_set('log_errors', 1);
			break;
	}
}
else
{
	ini_set('display_errors', 0);
}

if ($config['logerrors'])                         
{
	ini_set('log_errors', 1);
	ini_set('error_log', 'syslog');
}

?>
