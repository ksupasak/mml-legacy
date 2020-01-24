<?php 
class Configuration extends CActiveRecord {
	public static function model($className=__CLASS__) {
		return parent::model($className);
	}	
	public function tableName() {
		return '{{configure}}';
	}
	public function rules() {
		return array();
	}
	public function relations() {
		return array();
	}
	public function attributeLabels()
	{
		return array(
				'name'		=> 'Name',
				'value'		=> 'Value',
		);
	}
	public static function get($name) {
		return self::model()->find('name=:name',array(':name'=>$name))->value;
	}
}