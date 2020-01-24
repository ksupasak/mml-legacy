<?php

class CustomMail {


	public static function sendMail($subject="Hi!",$body="Hi,\n\nHow are you?", $to="Supasak<ksupasak@gmail.com>",$from="MaxMaxLife<noreply@maxmaxlife.com>") {



	 $host = "mail.maxmaxlife.com";
	 $username = "noreply@maxmaxlife.com";
	 $password = "minadadmin";

	 $headers = array ('From' => $from,
	   'To' => $to,
	   'Subject' => $subject);
	 $smtp = Mail::factory('smtp',
	   array ('host' => $host,
	     'auth' => true,
	     'username' => $username,
	     'password' => $password));

	 $mail = $smtp->send($to, $headers, $body);

	 if (PEAR::isError($mail)) {
		return false;
	  } else {
	    return true;
	   }
	
	}
	
	
	
	
	
}