<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'Max Max Life: Online Perscription',

	// preloading 'log' component
	'preload'=>array('log'),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
		'application.extensions.yii-mail.*',
	),

	'defaultController'=>'site',

	// application components
	'components'=>array(
		'user'=>array(
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
		),
		'db'=>array(
			'connectionString' => 'mysql:host=127.0.0.1;dbname=maxmaxlife_service',
			'emulatePrepare' => true,
			'username' => 'maxmaxlife_user',
			'password' => 'minadadmin',
			'charset' => 'utf8',
			'tablePrefix' => '',
		),
		'errorHandler'=>array(
			// use 'site/error' action to display errors
            'errorAction'=>'site/error',
        ),
        'urlManager'=>array(
        	'urlFormat'=>'path',
        	'rules'=>array(
        		'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
        	),
			'showScriptName'=>false,
        ),
		'authManager'=>array(
			'class'=>'CDbAuthManager',
			'connectionID'=>'db',
		),
		'acl'=>array(
			'class'=>'ACL'
		),
		'mail' => array(
	        'class' => 'application.extensions.yii-mail.YiiMail',
	        'transportType'=>'smtp', /// case sensitive!
	        'transportOptions'=>array(
	            'host'=>'smtp.mmlwellness.com',
	            'username'=>'noreply@mmlwellness.com',
	            // or email@googleappsdomain.com
	            'password'=>'kamsk'
	            ),
	        'viewPath' => 'application.views.mail',
	        'logging' => true,
	        'dryRun' => false
	    ),
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
				*/
			),
		),
	),
	'modules'=>array(
		'gii'=>array(
			'class'=>'system.gii.GiiModule',
            'password'=>'1234',
		),
	),
	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>require(dirname(__FILE__).'/params.php'),
);
