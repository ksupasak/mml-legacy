<?php

Yii::import('zii.widgets.CPortlet');

class MyMenu extends CPortlet{
	public function init() {
		$this->title=CHtml::encode('My Custom Menu');
		parent::init();
	}
	protected function renderContent() {
		// render according to User Role
		$this->render('myMenu');
	}
}