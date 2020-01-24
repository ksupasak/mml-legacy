<graph caption='<?php echo $title;?>' xAxisName='Date' yAxisName='Requests' decimalPrecision='0' formatNumberScale='0'>
<?php  foreach ($orders as $item) { ?>
<set name='<?php echo $item['day']; ?>-<?php echo $item['month']; ?>' value='<?php echo $item['c']?>' color='FF8E46' />
<?php } ?>
</graph>
