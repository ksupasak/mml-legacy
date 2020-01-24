<?php

class ConsumeTime extends CFormModel {
	public $morning_and_evening;
	public $morning;
	public $lunch;
	public $evening;
	public $bedtime;
	public $times;

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
		
		
		$this->times=0;
		$obj = json_decode($json);
		if(!is_null($obj)){
		foreach( $obj as $t){
		
		switch($t){
			case 'morning_and_evening':$this->times+=1;break;
			case 'morning':$this->times+=2;break;
			case 'lunch':$this->times+=4;break;
			case 'evening':$this->times+=8;break;
			case 'bedtime':$this->times+=16;break;
			default:
			
		}
		
		}
		}
		
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
