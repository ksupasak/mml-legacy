<?php

	class OrderStation extends CActiveRecord {
		public function tableName() {
			return 'order_station';
		}
		
		public static function model($className=__CLASS__)
		{
			return parent::model($className);
		}
		public function rules () {
			return array(
			array('id, name, icon, remark, pin, stations', 'safe'),
			array('name, icon', 'required'),
			);
		}
		public function relations() {
			return array(
				'operator' => array(self::BELONGS_TO, 'User', 'operator_id')
			);
		}
		public static function listDropDownOptions() {
			$criteria = new CDbCriteria;
			$criteria->addCondition('id >= 100');
			$criteria->addCondition('id < 200');
			$stations = self::model()->findAll($criteria);
			$list = array();
			foreach ($stations as $station) {
				$list[ $station->id ] = $station->name;
			}
			return $list;
		}
		
		public function validatePIN() {
			if (!$_POST['Station']['pin']) {		
				return json_encode( array(
					'status'=>'error',
					'reason'=>'No PIN Entered'
				));
			}
			$user = User::getByPIN($_POST['Station']['pin']);
			if ($user) {
				return json_encode( array(
								'status'=>'verify',
								'data'=>$_POST,
								'user'=>array(
									'id'=>$user->id,
									'name'=>$user->full_name,
									'type'=>$user->type
							)));
			} else {
				return json_encode( array(
									'status'=>'error',
									'reason'=>'Not Valid PIN'
				));
			}
		}
		public static function lastUpdatesFor($order){
			$rows = Yii::app()->db->createCommand()
						->selectDistinct('station_id')
						->select('id, station_id, order_id, operator_id, updated, remarks')
						->from('order_station')
						->order('updated ASC')
						->where('order_id = :order', array(':order'=>$order->id))
						->queryAll();
			$station = array();
			foreach($rows as $row) {
				$station[$row['station_id']] = $row;
			}
			return $station;
		}
	}
?>