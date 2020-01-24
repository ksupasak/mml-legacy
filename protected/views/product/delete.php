<h1>Delete Product!!</h1>

This will delete product ID 
<?php echo Yii::app()->request->getQuery('id'); ?>

<pre>
Note: For production env, dont actually delete from database, 
but set inactive to preserve FK constraints.
</pre>

<a href="<?php echo $this->createUrl('product/ManageProducts'); ?>" class="yui-button">back</a>