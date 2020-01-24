<?php
/**
 * Status class
 *  For help with rendering 
 */
class DiscountFactor {
	static function dropDownOptions() {
		return array(
			'0.00' => '0%',
			'0.05' => '5%',
			'0.10' => '10%',
			'0.15' => '15%',
			'0.20' => '20%',
			'0.25' => '25%',
			'0.30' => '30%',
			'0.35' => '35%',
			'0.40' => '40%',
			'0.50' => '50%',
			'1.00' => 'Free'
		);
	} 
}