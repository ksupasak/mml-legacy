<h1>Update Stock</h1>

<style>
table { border: 1px solid black; }
table tr.category-root {
background:black; color: white
}
table tr.category {
background:#CCC; color: black
}
</style>
<?php 
$category = Category::model();
?>
<div id="yw0" class="grid-view">
	<table class="items">
		<thead>
			<tr>
				<th>Product</th>
				<th>Code</th>
				<th>Recommended Dosage (Unit)</th>
				<th>Default Consume Time</th>
				<th>Price Base</th>
				<th>Volume Base</th>
				<th>Inventory</th>
				
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
		<?php $categories = $category->catelogOrder();
			foreach( $categories as $category) :?>
				<?php // Root Category 
					if ($category->isRoot()): ?>
						<tr class="category-root"><td colspan="8">
							<em><b><?php echo $category->name; ?></b></em>
						</td></tr>
				<?php // Sub Category 
					else: 	?>
						<tr class="category"><td colspan="8">
							<b><?php echo $category->name; ?></b>
						</td></tr>					
				<?php endif; ?>
		<?php 
			$dataProvider = $category->getProducts();
			if($dataProvider->totalItemCount > 0)
				 $this->widget('zii.widgets.CListView',array(
					'dataProvider'=>$dataProvider,
					'itemView'=>'_productStock',
					'template'=>'{items}',
				    'summaryText' => '{start}-{end} ; ({count})',
				    'cssFile'	=>	Yii::app()->getAssetManager()->publish(Yii::getPathOfAlias('zii.widgets.assets')).'/gridview/styles.css'
				)); ?>
		<?php 
			endforeach; ?>
		</tbody>
	</table>
</div>