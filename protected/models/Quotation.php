<?php
class Quotation extends CActiveDataProvider
{
	public $patientName;
	public $patientHN;
	public $orderDatetime;

	public function attributeLabels()
	{
		return array(
			'patientHN'=>'Patient HN',
		);
	}
}