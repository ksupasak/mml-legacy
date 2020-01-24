<?php

class SiteController extends Controller
{

	
	
	public $layout='main';
	/**
	 * Declares class-based actions.
	 */
	public function actionTest(){
		$orders = Order::model()->findAll();
		//echo count($orders); exit;
		$order = $orders[30];
		echo $order->uuid;
		echo $order->id; echo "|";
		$newOrder = $order->copy();
		echo $newOrder->id;
		echo get_class($newOrder);
	}
	public function actions()
	{
		return array(
			// captcha action renders the CAPTCHA image displayed on the contact page
			'captcha'=>array(
				'class'=>'CCaptchaAction',
				'backColor'=>0xFFFFFF,
			),
			// page action renders "static" pages stored under 'protected/views/site/pages'
			// They can be accessed via: index.php?r=site/page&view=FileName
			'page'=>array(
				'class'=>'CViewAction',
			),
		);
	}

	/**
	 * This is the action to handle external exceptions.
	 */
	public function actionError()
	{
	    if($error=Yii::app()->errorHandler->error)
	    {
	    	if(Yii::app()->request->isAjaxRequest)
	    		echo $error['message'];
	    	else
	        	$this->render('error', $error);
	    }
	}

	/**
	 * Displays the home page
	 */
	public function actionIndex() {
		$this->disclaimerPage();
		if (Yii::app()->user->isGuest) {
			$this->redirect('site/login'); // Is guest, send to login page.
		} else {
			// "render screen by user type";
			$uid = Yii::app()->user->id;
			$user = User::model()->findByPk((int)$uid); 
			// print_r($user->type);  echo $uid;
			Yii::app()->user->setState('role', $user->type);
			$this->render($user->homeView());
		}
	}

	/**
	 * Displays the contact page
	 */
	public function actionContact()
	{
		$model=new ContactForm;
		if(isset($_POST['ContactForm']))
		{
			$model->attributes=$_POST['ContactForm'];
			if($model->validate())
			{
				$headers="From: {$model->email}\r\nReply-To: {$model->email}";
				mail(Yii::app()->params['adminEmail'],$model->subject.'_name_'.$model->name.'_tel_'.$model->tel,$model->body,$headers);
				Yii::app()->user->setFlash('contact','Thank you for contacting us. We will respond to you as soon as possible.');
				$this->refresh();
			}
		}
		$this->render('contact',array('model'=>$model));
	}

	/**
	 * Displays the login page
	 */
	public function actionLogin()
	{
		$model=new LoginForm;

		// if it is ajax validation request
		if(isset($_POST['ajax']) && $_POST['ajax']==='login-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}

		// collect user input data
		if(isset($_POST['LoginForm']))
		{
			$model->attributes=$_POST['LoginForm'];
			// validate user input and redirect to the previous page if valid
			if($model->validate() && $model->login())
				$this->redirect(Yii::app()->user->returnUrl);
		}
		// display the login form
		$this->render('login',array('model'=>$model));
	}
	/**
	 * Logs out the current user and redirect to homepage.
	 */
	public function actionLogout()
	{
		Yii::app()->user->logout();
		$this->redirect(Yii::app()->homeUrl);
	}
	public function actionPasswordRecovery() {
		$model = new PasswordRecoveryForm();
		$this->render('passwordRecovery',array('model'=>$model));
	}
	
	public function actionChangePassword() {

			$model=User::model()->find('id=:id', array(':id'=>Yii::app()->user->getId() ));

			// Uncomment the following line if AJAX validation is needed
			// $this->performAjaxValidation($model);

			if(isset($_POST['User']))
			{
				$model->attributes=$_POST['User'];
				$model->pin->attributes=$_POST['UserPin'];
				if($model->save())
					if ($model->pin) {
						if($model->pin->save()){
							$this->redirect(array('login','id'=>$model->id));
						}
					}
			}

			$this->render('changePassword',array(
				'model'=>$model,
			));
	}
	
	private function disclaimerPage() {
		if (Yii::app()->request->getPost('disclaimer_accepted')) {
			Yii::app()->session['disclaimer'] = true;
		};
		if (Yii::app()->session['disclaimer'] == true) {
			return true;
		}
		$this->render('disclaimer');
		Yii::app()->end();
	}
	
}