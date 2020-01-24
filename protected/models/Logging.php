<?php

class Logging {
	protected function processLogs($logs)
	{
		$sql="
	INSERT INTO {$this->logTableName}
	(level, category, logtime, message) VALUES
	(:level, :category, :logtime, :message)
	";
		$command=$this->getDbConnection()->createCommand($sql);
		foreach($logs as $log)
		{
			$command->bindValue(':level',$log[1]);
			$command->bindValue(':category',$log[2]);
			$command->bindValue(':logtime',(int)$log[3]);
			$command->bindValue(':message',$log[0]);
			$command->execute();
		}
	}
	protected static function log($table, $insert) {
		$keys = implode(',',array_keys($insert));
		$values = array();
		foreach (array_keys($insert) as $value) {
			$values[] = ':'.$value;
		}
		$values = implode(',',array_values($values));
		$sql = "INSERT INTO $table ($keys) VALUES ($values)";
		$command=Yii::app()->db->createCommand($sql);
		foreach($insert as $key => $val)
		{
			$command->bindValue(':'.$key,$val);
	
		}
		$command->execute();
	}
	static function dbConnection() {
		return Yii::app()->db;
	}
	static function order($orderId, $event, $time, $msg) {
		$insert = array('order_id'=>$orderId,
						'msg'=>$msg,
						'updated'=>$time,
						'category'=>$event);
		self::log('order_logs', $insert );
	}
	static function user($userId, $event, $time, $msg) {
		$insert = array('user_id'=>$userId,
						'msg'=>$msg,
						'updated'=>$time,
						'category'=>$event);
		self::log('user_logs', $insert );	
	}
	/* Returns CSqlDataProvider of user_logs table */
	static function getUserLogs() {
		$count=Yii::app()->db->createCommand('SELECT COUNT(*) FROM user_logs')->queryScalar();
		$sql='SELECT * FROM user_logs';
		$dataProvider=new CSqlDataProvider($sql, array(
			'keyField'=>'updated',
			'totalItemCount'=>$count,
			'sort'=>array(
				'attributes'=>array(
					 'updated', 'category', 'user_id'
				),
			),
			'pagination'=>array(
				'pageSize'=>10,
			),
		));
		return $dataProvider;
	}
		/* Returns CSqlDataProvider of order_logs table */
	static function getOrderLogs() {
		$count=Yii::app()->db->createCommand('SELECT COUNT(*) FROM order_logs')->queryScalar();
		$sql='SELECT * FROM order_logs';
		$dataProvider=new CSqlDataProvider($sql, array(
			'keyField'=>'updated',
			'totalItemCount'=>$count,
			'sort'=>array(
				'attributes'=>array(
					 'updated', 'category', 'order_id'
				),
			),
			'pagination'=>array(
				'pageSize'=>10,
			),
		));
		return $dataProvider;
	}
}