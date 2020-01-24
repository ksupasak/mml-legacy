<?php
/**
 * @property integer $id
 * @property string $display_name
 */
class Unit extends CActiveRecord
{
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	public function tableName()
	{
		return '{{product_unit}}';
	}
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id, parent', 'numerical', 'integerOnly'=>true),
			array('display_name', 'length', 'max'=>100),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, parent, name', 'safe', 'on'=>'search'),
		);
	}
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'display_name' => 'Unit',
		);
	}
	public function productUnitOptions() {
		$options = array();
		$units = $this->findAll();
		foreach ($units as $unit) {
			$options[$unit->id] = $unit->display_name;
		}
		return $options;
	}
}