<?php

echo CHtml::beginForm();

echo CHtml::activeLabel($model, 'Status');
echo CHtml::activeDropDownList($model,'status', Status::listDropDownOptions() , array('prompt'=>'Please Select'));

echo CHtml::activeLabel($model, 'Station');
echo CHtml::activeDropDownList($model,'station', ManufactureStation::listDropDownOptions() , array('prompt'=>'Please Select'));


echo CHtml::endForm();