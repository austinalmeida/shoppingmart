<script type="text/javascript" src="<?php echo HTTPS_SERVER; ?>catalog/view/theme/default/assets/lib/jquery-ui/jquery-ui.min.js"></script>
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
<div class="block left-module">
	<p class="title_block">Filter selection</p>
	<div class="block_content">
		<!-- layered -->
		<div class="layered layered-filter-price">
		
			<div class="layered_subtitle">Price</div>
				<div class="layered-content slider-range">
					<div id="slider-range"></div>
					<div class="amount-range-price">
						Rs.<input type="text" size="4" readonly id="start_amount"> - 
						Rs.<input type="text" readonly size="4" id="end_amount">
					</div>
					<ul>
					<?php foreach ($sorts as $sorts) { ?>
						<li style="padding-bottom:5px;">
							<input type="radio" <?php if($sorts['filter_order'] == $sorts['checked']){ echo 'checked="checked"'; } ?> value="<?php echo $sorts['href']; ?>" name="price[]" onchange="location = this.value;"> <?php echo $sorts['text']; ?>   
						</li>
					<?php } ?>
					</ul>
				</div>
  