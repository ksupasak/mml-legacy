<?php 
class OrderTracking extends CActiveRecord {
	
	public function tableName() {
		return '{{order_station}}';
	}
	public function relations() {
		return array(
			'station'=>array(self::BELONGS_TO,'Station','station_id'),
			'operator'=>array(self::BELONGS_TO,'User','operator_id'),
			'order'=>array(self::BELONGS_TO,'Order','order_id')
		);
	}
	
		public function acceptAjaxSubmit() {
			$save = false;
			if ( isset($_POST['Station']['stations']) ) {
		//	$operator_id = $_POST['operator_id'];
				$stations = $_POST['Station']['stations'];
				$updates = array();
				foreach ($stations as $k => $station) {
					if ( isset($station['checked']) && $station['checked'] ){
						$updates[$k] = $station['remarks'];	
						if ( isset($_POST['confirmed']) && $station['remarks'] ) {
							$tracking = new OrderTracking;
							$tracking->station_id = $k;
							$tracking->remarks = $station['remarks'];	
							$tracking->updated = date('Y-m-d H:i:s');
							$tracking->operator_id = $_POST['operator_id'];
							$tracking->order_id = $_POST['order_id'];
							$tracking->save();
							
							$transaction = Yii::app()->db->beginTransaction();
							$order = $tracking->order;
							$order->station_id = $k;
							$order->save();
							$transaction->commit();
							/* If update at this station, it means Order state is complete. */
							if ($k == 110) {
								$order = Order::model()->findByPk($_POST['order_id']);
								// $order->status_id = Status::COMPLETE;
								$_POST['save']=Status::COMPLETE;
								$order->save();
							}
							
							$save = true;
						}
					}
				}
				if ($save)
					return 'save';
				return json_encode($updates);
			}
		}
}

?>