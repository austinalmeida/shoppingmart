<?php echo $header; ?>
<div class="columns-container">
    <div class="container" id="columns">
        <!-- breadcrumb -->
        <div class="breadcrumb clearfix">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <a class="home" href="<?php echo $breadcrumb['href']; ?>" title="<?php echo $breadcrumb['text']; ?>"><?php echo $breadcrumb['text']; ?></a>
            <span class="navigation-pipe">&nbsp;</span>
		<?php } ?>
        </div>
  
  <div class="row">
  <?php echo $column_left; ?>
	<div class="center_column col-xs-12 col-sm-9" id="center_column">
	<?php echo $content_top; ?>
	
		<!-- Product -->
			<div id="product">
				<div class="primary-box row">
					<div class="pb-left-column col-xs-12 col-sm-6">
						<!-- product-imge-->
						<?php if ($thumb || $images) { ?>
						<div class="product-image">
						<?php if ($thumb) { ?>
							<div class="product-full">
								<img title="<?php echo $heading_title; ?>" id="product-zoom" src='<?php echo $thumb; ?>' data-zoom-image="<?php echo $popup; ?>"/>
							</div>
						<?php } ?>
						<?php if ($images) { ?>
							<div class="product-img-thumb" id="gallery_01">
								<ul class="owl-carousel" data-items="3" data-nav="true" data-dots="false" data-margin="20" data-loop="true">
									<?php foreach ($images as $image) { ?>
									<li>
										<a href="#" data-image="<?php echo $image['popup']; ?>" data-zoom-image="<?php echo $image['popup']; ?>">
											<img id="product-zoom"  src="<?php echo $image['thumb']; ?>" /> 
										</a>
									</li>
									<?php } ?>
								</ul>
							</div>
							<?php } ?>
						</div>
						<?php } ?>
						<!-- product-imge-->
					</div>
					<div class="pb-right-column col-xs-12 col-sm-6">
						<h1 class="product-name"><?php echo $heading_title; ?></h1>
						<div class="product-comments">
							<div class="product-star">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star-half-o"></i>
							</div>
							<div class="comments-advices">
								<a href="#">Based  on 3 ratings</a>
								<a href="#"><i class="fa fa-pencil"></i> write a review</a>
							</div>
						</div>
						<?php if ($price) { ?>
						<div class="product-price-group">
						<?php if (!$special) { ?>
							<span class="price"><?php echo $price; ?></span>
						<?php } else { ?>
							<span class="price"><?php echo $special; ?></span>
							<span class="old-price"><?php echo $price; ?></span>
						<?php } ?>
						<?php if ($discounts) { ?>
						<?php foreach ($discounts as $discount) { ?>
							<span class="discount"><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></span>
						<?php } } ?>
						</div>
						<?php } ?>
						<div class="info-orther">
							<?php if ($manufacturer) { ?>
							<p><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></p>
							<?php } ?>
							<p><?php echo $text_model; ?> <?php echo $model; ?></p>
							<p><?php echo $text_stock; ?> <?php echo $stock; ?></p>
							<?php if ($reward) { ?>
							<p><?php echo $text_reward; ?> <?php echo $reward; ?></p>
							<?php } ?>
						</div>
						<!-- <div class="product-desc">
							Vestibulum eu odio. Suspendisse potenti. Morbi mollis tellus ac sapien. Praesent egestas tristique nibh. Nullam dictum felis eu pede mollis pretium.Fusce egestas elit eget lorem. 
						</div> -->
						<?php if ($options) { ?>
						<div class="form-option">
							<p class="form-option-title"><?php echo $text_option; ?>:</p>
							<?php foreach ($options as $option) { ?>
							<?php if ($option['type'] == 'select') { ?>
							<div class="attributes">
								<div class="attribute-label"><?php echo $option['name']; ?>:</div>
								<div class="attribute-list">
									<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>">
										<option value=""><?php echo $text_select; ?></option>
										<?php foreach ($option['product_option_value'] as $option_value) { ?>
										<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
										<?php if ($option_value['price']) { ?>
										(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
										<?php } ?>
										</option>
										<?php } ?>
									</select>									
								</div>								
							</div>
							<?php } ?>							
							
							<?php if ($option['type'] == 'radio') { ?>
							<div class="attributes">
								<div class="attribute-label"><?php echo $option['name']; ?>:</div>
								<div class="attribute-list" id="input-option<?php echo $option['product_option_id']; ?>">
									<ul class="list-color">
									<?php foreach ($option['product_option_value'] as $option_value) { ?>
										<li><input class="custom-radio" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" /></li>
									<?php } ?>
									</ul>
								</div>
							</div>
							<?php } } ?>
							
							<div class="attributes">
								<div class="attribute-label"><?php echo $entry_qty; ?>:</div>
								<div class="attribute-list">
									<div class="qty">
										<input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
										<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
									</div>
								</div>
							</div>
							
						</div>
						<?php } ?>	
						
						<div class="form-action">							
							<div class="button-group">
								<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn-add-cart"><?php echo $button_cart; ?></button>								
							</div>
							<div class="button-group">
								<a class="wishlist" href="#"><i class="fa fa-heart-o"></i>
								<br>Wishlist</a>
								<a class="compare" href="#"><i class="fa fa-signal"></i>
								<br>        
								Compare</a>
							</div>
						</div>
						<div class="form-share">
							<div class="sendtofriend-print">
								<a href="javascript:print();"><i class="fa fa-print"></i> Print</a>
								<a href="#"><i class="fa fa-envelope-o fa-fw"></i>Send to a friend</a>
							</div>
							<div class="network-share">
							</div>
						</div>
					</div>
				</div>
				<!-- tab product -->
				<div class="product-tab">
					<ul class="nav-tab">
						<li class="active">
							<a aria-expanded="false" data-toggle="tab" href="#product-detail"><?php echo $tab_description; ?></a>
						</li>
						<li>
							<a aria-expanded="true" data-toggle="tab" href="#specification"><?php echo $tab_attribute; ?></a>
						</li>
						<li>
							<a data-toggle="tab" href="#reviews"><?php echo $tab_review; ?></a>
						</li>
					</ul>
					<div class="tab-container">
						<div id="product-detail" class="tab-panel active">
							<?php echo $description; ?>
						</div>
						<div id="specification" class="tab-panel">
							<table class="table table-bordered">
							<?php foreach ($attribute_groups as $attribute_group) { ?>
							<thead>
							  <tr style="background:#f6f6f6">
								<td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
							  </tr>
							</thead>
							<tbody>
							  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
							  <tr>
								<td width="200"><?php echo $attribute['name']; ?></td>
								<td><?php echo $attribute['text']; ?></td>
							  </tr>
							  <?php } ?>
							</tbody>
							<?php } ?>
						  </table>
						</div>
						<?php if ($review_status) { ?>
						<div id="reviews" class="tab-panel">
							<div class="product-comments-block-tab">
								<form class="form-horizontal">
									<div id="review"></div>
									<h2><?php echo $text_write; ?></h2>
									<?php if ($review_guest) { ?>
									<div class="form-group required">
									  <div class="col-sm-12">
										<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
										<input type="text" name="name" value="" id="input-name" class="form-control" />
									  </div>
									</div>
									<div class="form-group required">
									  <div class="col-sm-12">
										<label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
										<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
										<div class="help-block"><?php echo $text_note; ?></div>
									  </div>
									</div>
									<div class="form-group required">
									  <div class="col-sm-12">
										<label class="control-label"><?php echo $entry_rating; ?></label>
										&nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
										<input type="radio" name="rating" value="1" />
										&nbsp;
										<input type="radio" name="rating" value="2" />
										&nbsp;
										<input type="radio" name="rating" value="3" />
										&nbsp;
										<input type="radio" name="rating" value="4" />
										&nbsp;
										<input type="radio" name="rating" value="5" />
										&nbsp;<?php echo $entry_good; ?></div>
									</div>
									<?php if ($site_key) { ?>
									  <div class="form-group">
										<div class="col-sm-12">
										  <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
										</div>
									  </div>
									<?php } ?>
									<div class="buttons clearfix">
									  <div class="pull-right">
										<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
									  </div>
									</div>
									<?php } else { ?>
									<?php echo $text_login; ?>
									<?php } ?>
								  </form>
							</div>
							
						</div>
						<?php } ?>
						
					</div>
				</div>
				<!-- ./tab product -->
				<!-- box product -->
				<?php if ($products) { ?>
				<div class="page-product-box">
					<h3 class="heading"><?php echo $text_related; ?></h3>
					<ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav = "true" data-margin = "30" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":4},"1000":{"items":4}}'>
						<?php foreach ($products as $product) { ?>
						<li>
							<div class="product-container">
								<div class="left-block">
									<a href="<?php echo $product['href']; ?>">
										<img class="img-responsive" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" src="<?php echo $product['thumb']; ?>" />
									</a>
									<div class="quick-view">
										<a title="Add to my wishlist" class="heart" href="#"></a>
										<a title="Add to compare" class="compare" href="#"></a>
										<a title="Quick view" class="search" href="#"></a>
									</div>
									<div class="add-to-cart">
										<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" class="btn-add-cart"><?php echo $button_cart; ?></button>										
									</div>
								</div>
								<div class="right-block">
									<h5 class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h5>
									<div class="product-star">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-half-o"></i>
									</div>
									<?php if ($product['price']) { ?>
									<div class="content_price">
									<?php if (!$product['special']) { ?>
										<span class="price product-price"><?php echo $product['price']; ?></span>
									<?php } else { ?>
										<span class="price product-price"><?php echo $product['special']; ?></span>
										<span class="price old-price"><?php echo $product['price']; ?></span>
									<?php } ?>
									</div>
									<?php } ?>
								</div>
							</div>
						</li>
						<?php } ?>
					</ul>
				</div>	
				<?php } ?>
			</div>
		<!-- Product -->
	</div>
</div>
        <!-- ./row-->
    </div>
</div>

<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#total').html(json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart-block-list > ul').load('index.php?route=common/cart/info ul li');
			}
		}
	});
});
//--></script>
	
<?php echo $footer; ?>