<style>
table { border: 1px solid black; }
table tr.category-root {
background:black; color: white
}
table tr.category {
background:#CCC; color: black
}

.consume_time {  width:300px; } 
.consume_time input, .consume_time label { float:left; margin-right: 6px; }
.order-item input[type="checkbox"], .order-item input[type="text"] { margin: 0 0 0 0; padding: 0 0 0 0;

</style>
<div id="yw0" class="grid-view">
	<table class="items">
		<thead>
			<tr>
				<th>Product</th>
				<th>Recommended<br /> Dosage (Unit)</th>
				<th>Order Per Day</th>				
				<th>Consume Time</th>
			</tr>
		</thead>
		<tbody>
		<?php $categories = $category->catelogOrder();
			foreach( $categories as $category) :?>
				<?php // Root Category 
					if ($category->isRoot()): ?>
						<tr class="category-root"><td colspan="5">
							<em><b><?php 
							$name = $category->name;
							if($category->name=='Compound')$name='Ingredients';
							echo $name; ?></b></em>
						</td></tr>
				<?php // Sub Category 
					else: 	?>
						<tr class="category"><td colspan="5">
							<b><?php echo $category->name; ?></b>
						</td></tr>					
				<?php endif; ?>
		<?php 
			$dataProvider = $category->getProducts();
			if($dataProvider->totalItemCount > 0)
				 $this->widget('zii.widgets.CListView',array(
					'dataProvider'=>$dataProvider,
					'itemView'=>'_item',
					'template'=>'{items}',
				    'summaryText' => '{start}-{end} ; ({count})',
				    'cssFile'	=>	Yii::app()->getAssetManager()->publish(Yii::getPathOfAlias('zii.widgets.assets')).'/gridview/styles.css'
				)); ?>
		<?php 
			endforeach; ?>
		</tbody>
	</table>
</div>* Dispensed order use unit per day such as 1 means 1 pill or tablet per day. 