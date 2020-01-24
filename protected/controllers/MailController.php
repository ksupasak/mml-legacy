<?php

Yii::import('application.vendors.mail.*');

class MailController extends Controller
{

	public function actionOrderMail()
	{
		$orderId = Yii::app()->request->getQuery('orderId');
		if (!$orderId) throw new CHttpException(400, 'No Order ID');
		$order = Order::model()->findByPk($orderId);
	
		if(isset($_POST['Mail'])){
			$to = $_POST['Mail']['to'];
			$from = $_POST['Mail']['from'];
			
			$cc = $_POST['Mail']['cc'];
			$bcc = $_POST['Mail']['bcc'];
			
			
			
			$subject = $_POST['Mail']['subject'];
			$body = $_POST['Mail']['body'];		
			// 	// var_dump($_POST['Mail']);
			// CustomMail::sendMail($subject,$body,$to,$from);
			// 
			
			$message = new YiiMailMessage();

			if($to!=''){
			$tos = explode(',',$to);
				$message->setTo($tos);
			}
            $message->setFrom(array($from));
		
			if($cc!=''){
				$ccs = explode(',',$cc);
				$message->setCc($ccs);
			}
			
			if($bcc!=''){
				$bccs = explode(',',$bcc);
				$message->setBcc($bccs);
			}
			
            $message->setSubject($subject);
            $message->setBody($body);

            $numsent = Yii::app()->mail->send($message);
			
		}
		
		$params = array('order'=>$order);
		$this->render('orderMail',$params);	
	}
	
	public function actionTest()
	{
		
		
		$this->render('test');
		
	}
	


}
