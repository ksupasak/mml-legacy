<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{
	private $_id;
	private $user_role;

	/**
	 * Authenticates a user.
	 * @return boolean whether authentication succeeds.
	 */
	public function authenticate()
	{
		$user=User::model()->find('LOWER(username)=?',array(strtolower($this->username)));
		if($user===null)
			$this->errorCode=self::ERROR_USERNAME_INVALID;
		else if(!$user->validatePassword($this->password))
			$this->errorCode=self::ERROR_PASSWORD_INVALID;
		else
		{
			$this->_id=$user->id;
			$this->username=$user->username;
			$this->errorCode=self::ERROR_NONE;
			Yii::app()->session['user.id'] = $user->id;
			Yii::app()->session['user.type'] = $user->type;
			Yii::app()->session['user.full_name'] = $user->full_name;
			Yii::app()->session['user.email'] = $user->email;
		}
		return $this->errorCode==self::ERROR_NONE;
	}

	/**
	 * @return integer the ID of the user record
	 */
	public function getId()
	{
		return $this->_id;
	}
}