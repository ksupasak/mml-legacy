<?php
/**
 * Status class
 *   Status of Order. This also help manage status icons
 * @property integer $id
 * @property string $name
 * @property string $icon
 * @property string $html
 * @property string $remark
 */
class Status extends CActiveRecord {
	const basePath 		= '/images/icon/';

	const NA			=	0;
	const DRAFT 		=	1;
	const REQUEST	 	=	2;
	const PENDING		= 	3;
	const CONFIRMED		=	4;
	const PROCESSING	=	5;
	const COMPLETE		=	6;
	const APPROVED		=	7;

	public function tableName() {
		return 'status';
	}

	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}	
	public function rules () {
		return array(
			array('id, name, icon, remark', 'safe'),
			array('name, icon', 'required'),
		);		
	}
	/* For filter */
	public static function dropDownOptions() {
		$statuses = self::model()->findAll('id < 100'); // Id more than 100 is Station class
		$list = array();
		foreach ($statuses as $status) {
			$list[ $status->id ] = strtoupper($status->name);
		}
		return $list;
	}
	public function renderIcon() {
		$icon = Yii::app()->baseUrl . self::basePath . $this->icon;
		return sprintf('<span style="width:30px;border:0px solid;display:block;text-align:center"><img src="%s" alt="%s"/><span>', $icon, $this->name );
	}
	
	public function iconImage() {
		$url = Yii::app()->baseUrl . self::basePath . $this->icon;
		return sprintf('<img src="%s" alt="%s" />', $url, $this->name);
	}
}