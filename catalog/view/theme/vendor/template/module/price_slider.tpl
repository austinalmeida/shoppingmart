<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
  $(function() {
  $( "#slider-range" ).on( "slidechange", function( event, ui ) {
	var str = '<?php echo $range[0]['href']; ?>'; 
	var url = str.replace(/&amp;/g, "&") + '&range=' + ui.values[ 0 ] + ',' + ui.values[ 1 ];
	$(location).attr('href',url); 
  } );
  
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 10000,
      values: [ <?php echo $range[0]['min']; ?>, <?php echo $range[0]['max']; ?> ],
      slide: function( event, ui ) { 
		$( "#start_amount" ).val( ui.values[ 0 ] );
		$( "#end_amount" ).val( ui.values[ 1 ] );
      }
    });
	  $( "#start_amount" ).val( $( "#slider-range" ).slider( "values", 0 ) );
      $( "#end_amount" ).val( $( "#slider-range" ).slider( "values", 1 ) );
  });
  </script>
<div class="panel panel-default"> <?php //var_dump($sorts); die; ?>
  <div class="panel-heading"><?php echo 'PRICE'; ?></div>
  <div class="list-group">
	<div class="list-group-item">		
		<div id="filter-group2">
		<?php foreach ($sorts as $sorts) { ?>
			<div class="radio">
				<label><input type="radio" <?php if($sorts['filter_order'] == $sorts['checked']){ echo 'checked="checked"'; } ?> value="<?php echo $sorts['href']; ?>" name="price[]" onchange="location = this.value;"> <?php echo $sorts['text']; ?> </label>
			</div>
		<?php } ?>
			<div class="radio">
				<div id="slider-range"></div>
			</div>
			<div class="radio">
				Rs.<input type="text" size="4" readonly id="start_amount"> - Rs.<input type="text" readonly size="4" id="end_amount">
			</div>		
		</div>
	</div>
  </div>
</div>
