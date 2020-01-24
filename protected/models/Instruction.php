<?php

class Instruction extends CFormModel {
	public $morning;
	public $dis_morning;
	public $lunch;
	public $dis_lunch;
	public $evening;
	public $dis_evening;
	public $bedtime;
	public $dis_bedtime;
	
	public $instructions;

	public function attributeLabels()
	{
		return array(
		'morning_and_evening' => 'เช้า / เย็น',
		'morning' => 'เช้า',
		'lunch' => 'กลางวัน',
		'evening' => 'เย็น',
		'bedtime' => 'ก่อนนอน',
		);
	}


	public function decode($json) {
		
		// // {morning:{caps:1},evening:{caps:2,softgel:2}}
		// // 
		// 
		// $tmp = json_decode($json);
		// 
		// $this->instructions = '';
		// 
		// foreach(array('morning','lunch','evening','bedtime','other') as $i){
		// 
		// $b = $tmp[$i];
		// if(isset($b)):
		// 
		// 	switch($i){
		// 		case 'morning': 
		// 		if(isset($b['caps']))$s='Morning '.$b['caps'].'Caps '; 
		// 		if(isset($b['softgel']))$s='+ '.$b['caps'].'Caps '; 
		// 		break;
		// 		case 'dis_morning':break;
		// 		case 'lunch':break;
		// 		case 'evening':break;
		// 		case 'bedtime':break;
		// 		default:
		// 	}
		// 	
		// 	$this->instructions = $this->instructions.$s."\n";
		// 
		// endif
		// 
		// 	
		// 
		// }
		// 
		// $this->instructions="Morning 0 Caps + Fish Oil 0 Softgel per Day / Total 0 Caps + 0 Softgel per Day\nEvening 0 Caps + Fish Oil 0 Softgel per Day / Total 0 Caps + 0 Softgel per Day";
		// 
	}
	public function hasNum($time){
		return ($this->times&$time)!=0;  	
	}
	public function has($time){
		switch($time){
		case 'morning_and_evening':$t=1;break;
		case 'morning':$t=2;break;
		case 'lunch':$t=4;break;
		case 'evening':$t=8;break;
		case 'bedtime':$t=16;break;
		default:break;
		}
	    return ($this->times&$t)!=0;  	
	}

	public static function fromJson($json) {
		$form = new self;
		$form->decode($json);
		return $form;
	}
	public static function encode($mixed) {
		return json_encode($mixed);
	}

	public static function activeCheckBoxList($model, $name) {
		return '<table><tr><td>'.CHtml::activeCheckBoxList($model, $name, ConsumeTime::checkboxListOptions()
									, array('template'=>'{input}', 'separator'=>'</td><td>'));
	}
	public static function toString($select) {
		if (!$select) return '';
		$keys = self::checkBoxListOptions();
		$html = array();
		foreach ($select as $time) {
			$html[] = $keys[$time];
		}
		return implode(',', $html);
	}
	public static function checkboxListOptions(){
		return array(
		'morning_and_evening' => 'เช้า / เย็น',
		'morning' => 'เช้า',
		'lunch' => 'กลางวัน',
		'evening' => 'เย็น',
		'bedtime' => 'ก่อนนอน',
		);
	}
	public static function checkboxListSelectionDefault() {
		return array( 'morning_and_evening' );
	}
}