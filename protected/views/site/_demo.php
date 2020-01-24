<div id="mainMbMenu">
        <?php
        $menuitems =  array(
                array('label'=>'Home', 'url'=>array('/site/index')),
                array('label'=>'About', 'url'=>array('/site/page', 'view'=>'about')),
                array('label'=>'Contact', 'url'=>array('/site/contact'), 
					'items'=>array(
						array('label'=>'sub 1 contact'),
						array('label'=>'sub 2 contact', 'url'=>array('/site/contact', 't'=>'ids')),
                  ),
				),
            );

        $this->widget('application.extensions.mbmenu.MbMenu',array(
            'items'=> $menuitems,
        )); ?>

<style>
#menu-top ul { list-style: none; margin: 0; padding: 0; }
 
#menu-top ul li { display: block; height: 28px; float: left; overflow: visible; }
#menu-top ul li:hover > ul { display: block; }
 
#menu-top ul li a { float: left; display: block; }
 
#menu-top ul li ul { display: none; position: absolute; top: 100%;
                    background: #000; color: #fff; height: auto;
}
 
#menu-top ul li ul li a { color: #ccc; padding: 4px 14px; display: block; }
 
#menu-top ul li ul li.active a,
#menu-top ul li ul li a:hover { color: #fff; }
</style>
<div id="menu-top">
<?php
$this->widget('zii.widgets.CMenu',array(
  'activeCssClass'=>'active',
  'activateParents'=>true,
  'items'=>array(
    array(
      'label'=>'Company',
      'url'=>array('/company/index'),
      'linkOptions'=>array('id'=>'menuCompany'),
      'itemOptions'=>array('id'=>'itemCompany'),
      'items'=>array(
        array('label'=>'Our Mission', 'url'=>array('/company/index')),
        array('label'=>'About Us', 'url'=>array('/company/aboutUs')),
        array('label'=>'Careers', 'url'=>array('/company/careers')),
        array('label'=>'Contact Us', 'url'=>array('/company/contactUs')),
        array('label'=>'Store Locator', 'url'=>array('/company/storeLocator')),
      ),
    ),
    array(
      'label'=>'Blog',
      'url'=>array('/blog/post/index'),
      'linkOptions'=>array('id'=>'menuBlog')
    ),
    array(
      'label'=>'Change',
      'url'=>array('/change/index'),
      'linkOptions'=>array('id'=>'menuChange'),
      'itemOptions'=>array('id'=>'itemChange'),
      'items'=>array(
        array('label'=>'Community Involvement', 'url'=>array('/change/index')),
        array('label'=>'Eco Responsibility', 'url'=>array('/change/ecoPolicy')),
        array('label'=>'Responsibility', 'url'=>array('/change/responsibility')),
      ),
    ),
    array(
      'label'=>'Shop',
      'url'=>array('/shop'),
      'linkOptions'=>array('id'=>'menuBuy')
    ),
  ),
)); ?>
</div>


<hr />
<?php echo CHtml::link('Create classroom', "",  // the link for open the dialog
    array(
        'style'=>'cursor: pointer; text-decoration: underline;',
        'onclick'=>"{addClassroom(); $('#dialogClassroom').dialog('open');}"));?>
 
<?php
$this->beginWidget('zii.widgets.jui.CJuiDialog', array( // the dialog
    'id'=>'dialogClassroom',
    'options'=>array(
        'title'=>'Create classroom',
        'autoOpen'=>false,
        'modal'=>true,
        'width'=>550,
        'height'=>470,
    ),
));?>
<div class="divForForm"></div>
 
<?php $this->endWidget();?>
 
<script type="text/javascript">
// here is the magic
function addClassroom()
{
    <?php echo CHtml::ajax(array(
            'url'=>array('classroom/create'),
            'data'=> "js:$(this).serialize()",
            'type'=>'post',
            'dataType'=>'json',
            'success'=>"function(data)
            {
                if (data.status == 'failure')
                {
                    $('#dialogClassroom div.divForForm').html(data.div);
                          // Here is the trick: on submit-> once again this function!
                    $('#dialogClassroom div.divForForm form').submit(addClassroom);
                }
                else
                {
                    $('#dialogClassroom div.divForForm').html(data.div);
                    setTimeout(\"$('#dialogClassroom').dialog('close') \",3000);
                }
 
            } ",
            ))?>;
    return false; 
 
}
 
</script>