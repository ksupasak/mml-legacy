<?php

class OrderLine {
	/* Get Product lines in JSON
	 * The OrderLine table use Product ID as pimary key
     */
	 public $post;
	 
	 
	public static function getLines($order=null) {
		if ($order) { // If getting the OrderLine of Order in database
			$order = Order::model()->findByPk($order);
			$keys = array();
			$items = $order->items;
			foreach ($items as $item) {
				$keys[$item->product->id] = $item;
			}
		}
		$products = Product::getStandardList();
		foreach( $products as $product) {
			if ( $product->grouping == 'item' ){
				isset($keys[$product->id]) ? $quantity = $keys[$product->id]->order_per_day : $quantity = 0.0;
				$product->order_per_day= CHtml::textField('OrderLine['.$product->id.'][order_per_day]', $quantity, array('size'=>7));
				isset($keys[$product->id]) ? $select = json_decode($keys[$product->id]->consume_time) :  $select = ConsumeTime::checkboxListSelectionDefault();
				$product->consume_time = CHtml::checkBoxList('OrderLine['.$product->id.'][consume_time]', $select, ConsumeTime::checkboxListOptions()
							, array('template'=>'{input}&nbsp;{label}', 'separator'=>'&nbsp;&nbsp;'));
							
			    $product->consume_time = '<div id="cell" style="width:300px">'.$product->consume_time.'</div>';
			}
		}
		return json_encode($products);	
	}
}