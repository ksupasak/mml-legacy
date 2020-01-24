<style>
#loading { display:none; position:fixed; left:0; top:0; width:100%; height:100%; }
</style>
<div id="loading">
  <p><img src="<?php echo $this->createUrl('/images/spinner.gif'); ?>" /> Please Wait...</p>
</div>
<script>
$("#loading").ajaxStart(function(){
    $(this).show();
 }).ajaxStop(function(){
    $(this).hide();
 });
</script>