<style>
#stations { position: relative; }
.cell { width: 65em; height: 2em; padding-top:0.5em; border-bottom: 1px solid; position: relative;}
.cell input.checkbox { position: absolute; left: 18em; }

.cell span {font-weight: bold; }
.cell div { padding-top: 0.5em; }
.remarks  { display:none; }
.remarks {position: absolute; left: 20em; top: 0; }
.operator {position: absolute; left: 45em; top: 0; }
.updated {position: absolute; left: 55em; top: 0; width: 12em; }
.previous_remarks {position: absolute; left:17em; top: 0; }
</style>
<div id="stations">

<div class="cell">
	<span style="position:absolute;left:3em;">Station</span>
	<span style="position:absolute;left:18em;">Remarks</span>
	<span style="position:absolute;left:44em;">Operator</span>
	<span style="position:absolute;left:57em;">Updated</span>
</div>
<?php foreach(Station::listDropDownOptions() as $station_id => $station_name): ?>
<div class="cell">
	<?php echo $station_name ?>
	<input id="station_<?php echo $station_id; ?>" class="checkbox" type="checkbox" name="Station[stations][<?php echo $station_id;?>][checked]" onchange="javascript:toggleRemarks(this);" />
	<input id="station_<?php echo $station_id; ?>_remarks" class="remarks" type="text" name="Station[stations][<?php echo $station_id;?>][remarks]" size="45" />
	<div id="station_<?php echo $station_id; ?>_previous_remarks" class="previous_remarks">
		<?php if (isset($previous[$station_id])) echo $previous[$station_id]['remarks']; ?>
	</div>
	<div id="station_<?php echo $station_id; ?>_operator" class="operator">
		<?php if (isset($previous[$station_id])) 
					echo User::model()->findByPk($previous[$station_id]['operator_id'])->username; ?>
	</div>
	<div id="station_<?php echo $station_id; ?>_updated" class="updated">
		<?php if (isset($previous[$station_id])) echo $previous[$station_id]['updated']; ?>
	</div>
</div>
<?php endforeach; ?>
<script>
	function toggleRemarks(el) {
			if (el.checked) {
					$('#'+$(el).attr('id')+'_previous_remarks').hide(); //hide previous;
					remarks=$('#'+$(el).attr('id')+'_remarks');
					remarks.show().val('-').focus(function(){$(this).val('');});
				} else {
					$('#'+$(el).attr('id')+'_remarks' ).hide();
			} 
		}
</script>
</div>