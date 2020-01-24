<?php
/**
 * Application ACL rules. Control by user TYPE.
 */
class ACL extends CComponent
{
	private $rules = array(
			'viewLoginPage' => array('GUEST'),
			'dataAdmin' => array('ADMIN','MANAGER'),
		);
	protected $user_role; 
	protected $user_id;
	public function init() {
		if (Yii::app()->user->isGuest ) {
			$this->user_id = 0;
			$this->user_role = 'GUEST';
		} else {
			$this->user_id = Yii::app()->user->id;
			if ( isset(Yii::app()->user->role) ){
				$this->user_role = Yii::app()->user->role;
			} else { //TODO: use currentUser()
				$this->user_role = User::model()->findByPk($this->user_id)->type;
			}
		}
	}
	public function rules() {
		return $this->rules;
	}
	public function userId() {
		return $this->user_id;
	}
	public function role() {
		return $this->user_role;
	}
	public function check($check) {
		$rules = $this->rules();
		if( array_key_exists($check, $rules ) ){
			if (in_array($this->role(), $rules[$check])) {
				return true;
			}
		}
		return false;
	}
}