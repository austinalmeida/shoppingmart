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
		  
		<?php echo $content_top; ?>
		<h2 class="page-heading no-line"><?php echo $heading_title; ?>
			<?php if ($weight) { ?>
			&nbsp;(<?php echo $weight; ?>)
			<?php } ?>
			</span>
        </h2>
		
	<div class="page-content page-order">
		<ul class="step">
			<li class="current-step"><span>01. Summary</span></li>
			<li><span>02. Sign in</span></li>
			<li><span>03. Address</span></li>
			<li><span>04. Shipping</span></li>
			<li><span>05. Payment</span></li>
		</ul>
		<br>
		<?php if ($attention) { ?>
		  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  </div>
		<?php } ?>
		  <?php if ($success) { ?>
		  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  </div>
		  <?php } ?>
		  <?php if ($error_warning) { ?>
		  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  </div>
		  <?php } ?><br>
		
		<div class="order-detail-content">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			<table class="table table-bordered table-responsive cart_summary">
				<thead>
					<tr>
						<th class="cart_product"><?php echo $column_image; ?></th>
						<th><?php echo $column_name; ?></th>
						<th>Avail.</th>
						<th><?php echo $column_price; ?></th>
						<th><?php echo $column_quantity; ?></th>
						<th><?php echo $column_total; ?></th>
						<th  class="action"><i class="fa fa-trash-o"></i></th>
					</tr>
				</thead>
				<tbody>
				<?php foreach ($products as $product) { ?>
					<tr>
						<td class="cart_product text-center">
							<?php if ($product['thumb']) { ?>
								<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
							<?php } ?>
						</td>
						<td class="cart_description">
							<p class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></p>

				<?php
					$this->load->language('multiseller/multiseller');
					$seller = $this->MsLoader->MsSeller->getSeller($this->MsLoader->MsProduct->getSellerId($product['product_id']));
					if ($seller) {
						echo "<span class='ms-by-seller'>" . $this->language->get('ms_by') . " <a href='". $this->url->link('seller/catalog-seller/profile', 'seller_id=' . $seller['seller_id']) ."'>{$seller['ms.nickname']}</a>";
					}
				?>
			
							<small class="cart_ref">Model : <?php echo $product['model']; ?></small><br>
							<?php if ($product['option']) { ?>
							  <?php foreach ($product['option'] as $option) { ?>
							  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br>
							  <?php } } ?>
							  <?php if ($product['reward']) { ?>
							  <small><?php echo $product['reward']; ?></small><br>
							  <?php } ?>
							  <?php if ($product['recurring']) { ?>
							  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
							  <?php } ?>							
						</td>
						<td class="cart_avail">						
						  <?php if (!$product['stock']) { ?>
							<span style="color:#ff3366; border:1px solid #ff3366" class="label label-success">Not In stock</span>
						  <?php } else { ?>
						    <span class="label label-success text-danger">In stock</span>
						  <?php } ?>
						</td>
						<td class="price"><span><?php echo $product['price']; ?></span></td>
						<td class="qty">
							<input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />												
						</td>
						<td class="price">
							<span><?php echo $product['total']; ?></span>
						</td>
						<td class="action">
							<button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-primary"><i class="fa fa-refresh"></i></button>
							<button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="cart.remove('<?php echo $product['key']; ?>');"><i class="fa fa-times-circle"></i></button>
						</td>
					</tr>
					<?php } ?>
				</tbody>
				<?php foreach ($totals as $total) { ?>
				<tfoot>
					<tr>
						<td colspan="2" rowspan="2"></td>
						<td colspan="3"><?php echo $total['title']; ?></td>
						<td colspan="2"><?php echo $total['text']; ?></td>
					</tr>
				</tfoot>  
			    <?php } ?>
			</table>
			</form>
			<?php if ($coupon || $voucher || $reward || $shipping) { ?>
			  <h2 class="page-heading no-line"><?php echo $text_next; ?></h2>
			  <p class="product-name"><?php echo $text_next_choice; ?></p><br>
			  <div class="panel-group" id="accordion">
			  <?php echo $coupon; ?>
			  <?php echo $voucher; ?>
			  <?php echo $reward; ?>
			  <?php echo $shipping; ?></div>
			  <?php } ?>
			  
			<div class="cart_navigation">
				<a class="prev-btn" href="<?php echo $continue; ?>">Continue shopping</a>
				<a class="next-btn" href="<?php echo $checkout; ?>">Proceed to checkout</a>
			</div>
		</div>
	</div>
	<?php echo $content_bottom; ?>
	<?php echo $column_right; ?>
</div>
</div>
<?php echo $footer; ?>