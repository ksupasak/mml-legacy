<?php
/**
	 * @var integer 	$id
	 * @var integer 	$user_id
	 * @var string 		$pin
	 * @property User   $user
 */
class UserPin extends CActiveRecord {
	public static function model($className=__CLASS__) {
		return parent::model($className);
	}
	public function tableName() {
		return '{{user_pin}}';
	}
	public function relations() {
		return array(
			'user'=>array(self::BELONGS_TO,'User','user_id'),
		);
	}
	public function rules()
	{
		return array(
			array('pin', 'safe'),
			array('', 'required'),
			array('pin', 'unique'),
		);
	}
	public function attributeLabels() {
		return array(
			'pin' => 'pin'
		);
	}
}