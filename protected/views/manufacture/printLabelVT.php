<?php

$d = date_parse($order->confirm_date);
$d = mktime(0,0,0,$d['month'],$d['day'],$d['year']);



$list1 = array();
$list2 = array();
$list3 = array();
foreach($order->items as $i):

 $x =  ConsumeTime::fromJson($i->consume_time);
 if($x->has('morning_and_evening')||$x->has('morning')||$x->has('evening')){
	array_push($list1,$i);
 }elseif($x->has('lunch')){$lunch=true;array_push($list2,$i);}
elseif($x->has('bedtime')){$bedtime=true;array_push($list3,$i);}
endforeach;

?>
<?php $this->renderPartial('_renderPrintLabelVT', array('order'=>$order,'items'=>$list1,'lang'=>$lang,'title'=>'')); ?>
<?php if($lunch): ?>
<div class="clear">
</div>
<div style="page-break-after:always"></div>
<?php $this->renderPartial('_renderPrintLabelVT', array('order'=>$order,'items'=>$list2,'lang'=>$lang,'title'=>'(Lunch time)')); ?>
<?php endif; ?>
<?php if($bedtime): ?>
<div class="clear">
</div>
<div style="page-break-after:always"></div>
<?php $this->renderPartial('_renderPrintLabelVT', array('order'=>$order,'items'=>$list3,'lang'=>$lang,'title'=>'(Bed time)')); ?>
<?php endif; ?>
