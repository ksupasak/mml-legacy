<div>
<?php
$this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider' => $model->search(),
	'filter' => $model,
	'columns' => array(
		array(
			'name' => 'username',
			'type' => 'raw',
			'value' => 'CHtml::encode($data->username)'
		),
		array(
			'name' => 'email',
			'type' => 'raw',
			'value' => 'CHtml::link(CHtml::encode($data->email), "mailto:".CHtml::encode($data->email))',
		),
		array(
			'name' => 'display_name',
			'type' => 'raw',
			'value' => 'CHtml::encode($data->display_name)'
		),
		array(
			'header' => 'Actions',
			'class' => 'CButtonColumn',
			'viewButtonImageUrl' => Yii::app()->baseUrl . '/css/gridViewStyle/images/' . 'gr-view.png',
			'updateButtonImageUrl' => Yii::app()->baseUrl . '/css/gridViewStyle/images/' . 'gr-update.png',
			'deleteButtonImageUrl' => Yii::app()->baseUrl . '/css/gridViewStyle/images/' . 'gr-delete.png',
		),
	),
));
?>
</div>