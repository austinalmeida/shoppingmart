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
        <div id="view-product-list" class="view-product-list">
			<h2 class="page-heading">
				<span class="page-heading-title"><?php echo $heading_title; ?></span>
			</h2>
			<?php if ($products) { ?>
			<ul class="display-product-option">
				<li class="view-as-grid selected">
					<span>grid</span>
				</li>
				<li class="view-as-list">
					<span>list</span>
				</li>
			</ul>
			<!-- PRODUCT LIST -->
			<ul class="row product-list grid">
			<?php foreach ($products as $product) { ?>
				<li class="col-sx-12 col-sm-4">
					<div class="product-container">
						<div class="left-block">
							<a href="<?php echo $product['href']; ?>">
								<img class="img-responsive" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" src="<?php echo $product['thumb']; ?>" />
							</a>
							<div class="quick-view">
								<a title="Add to my wishlist" class="heart" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"></a>
								<a title="Add to compare" class="compare" onclick="compare.add('<?php echo $product['product_id']; ?>');"></a>
								<a title="Quick view" class="search" href="#"></a>
							</div>
							<div class="add-to-cart">
								<a title="Add to Cart" href="#" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><?php echo $button_cart; ?></a>
							</div>
							<div class="group-price">
								<span class="price-percent-reduction">20% OFF</span>
							</div>
						</div>
						<div class="right-block">
							<h5 class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h5>
							<?php if ($product['rating']) { ?>
							<div class="product-star">
								<?php for ($i = 1; $i <= 5; $i++) { ?>
								<?php if ($product['rating'] < $i) { ?>
									<i class="fa fa-star"></i>
								<?php } else { ?>
									<i class="fa fa-star"></i>
								<?php } } ?>
							</div>
							<?php } ?>
							<?php if ($product['price']) { ?>
							<div class="content_price">
								<span class="price product-price">$38,95</span>
								<?php if (!$product['special']) { ?>
								  <span class="price old-price"><?php echo $product['price']; ?></span>
								<?php } else { ?>
								  <span class="price product-price"><?php echo $product['special']; ?></span>
								  <span class="price old-price"><?php echo $product['price']; ?></span>
								<?php } ?>
							</div>
							<?php } ?>
							<div class="info-orther">
								<p>Item Code: #453217907</p>
								<p class="availability">Availability: <span>In stock</span></p>
								<div class="product-desc">
									<?php echo $product['description']; ?>
								</div>
							</div>
						</div>
					</div>
				</li>
				<?php } ?>
				</ul>
				<?php } ?>
                    <!-- ./PRODUCT LIST -->
                </div>
                <!-- ./view-product-list-->
                <div class="sortPagiBar">
                    <div class="bottom-pagination">
                        <nav>
							<?php echo $pagination; ?>                        
                        </nav>
                    </div>
                    <div class="show-product-item">
						<select id="input-limit" class="form-control" onchange="location = this.value;">
							<?php foreach ($limits as $limits) { ?>
							<?php if ($limits['value'] == $limit) { ?>
							<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
							<?php } ?>
							<?php } ?>
						 </select>
                    </div>
                    <div class="sort-product">
                        <select id="input-sort" class="form-control" onchange="location = this.value;">
							<?php foreach ($sorts as $sorts) { ?>
							<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
							<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
							<?php } ?>
							<?php } ?>
						</select>
                    </div>
                </div>
            </div>
            <!-- ./ Center colunm -->
        </div>
        <!-- ./row-->
    </div>
</div>
<?php echo $footer; ?>
