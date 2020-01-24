<?php
$this->pageTitle=Yii::app()->name . ' - Manage Products';
$this->breadcrumbs=array(
		'Manage Products'=>array('ManageProducts') 
	);
?>
<h1>Manage Product Inventories</h1>
<form id="inventory-update" action="" method="POST">
<div  style="float:right;">
    <input id="form-submit" type="button" value="Update Inventory" />
</div>
<div class="clear">
</div>
<div>
    <p>Remarks:
    <?php echo CHtml::textArea('remarks','',array('cols'=>80,'rows'=>3)); ?>
    </p>
</div>
<style>
#confirm { display: none; }
</style>
<div id="confirm">
    <h1>Please confirm...</h1>
    <p>The inventory count for these items are to be updated</p>
    <p id="confirm-remarks"></p>
    <div id="update-list"></div>
    <br />
</div>
<?php $this->renderPartial('_inv',array('product'=>Product::model(),'category'=>Category::model())); ?>
</form>
<script>
$("#form-submit").click( function() {
    $(".update-field").each( function() {
    // Updates only lines that are changed
        id = this.id.substring(8); //crop 8 chars: product_ 
        _html = "";
        if ($("#product_"+id).val() != $("#product_"+id+"_original").val()){
            //console.log(this.name); console.log(this.value);
            product_name = $("#product_"+id+"_name").html();
            product_code = $("#product_"+id+"_code").html();
            _html += "<div class='update-item'>"+product_name+" Code:"+product_code+" Count:<span>"+this.value+"</span></div>"
        }
        console.log(_html);
        $("#update-list").append(_html);
        
    });
    $("#confirm-remarks").html("Remarks: "+$("#remarks").val());
    $("#confirm").dialog({
        title: 'Confirm Inventory Update',
        modal:true, resizable:false, draggable: false,
        width:'60em', position:'center',
        buttons: {
            "Confirm" : function() {
                $("#inventory-update").submit();
            },
            "Cancel" : function() { 
                $(".update-item").remove();
                $(this).dialog("close");
            }
        }
        }
    );
} );
</script>