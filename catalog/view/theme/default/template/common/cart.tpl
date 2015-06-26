<div id="cart-block" class="col-xs-5 col-sm-2 shopping-cart-box">
	<a class="cart-link" href="<?php echo $cart; ?>">
		<span class="title">Shopping cart</span>
		<span class="total" id="total"><?php echo $text_items; ?></span>
		<!-- <span class="notify notify-left">2</span> -->
	</a>
	<div class="cart-block">
		<div class="cart-block-content">
		<div class="cart-block-list" id="cart-block-list">
		<?php if ($products || $vouchers) { ?>
		<!-- <h5 class="cart-title">2 Items in my cart</h5> -->			
				<ul>				
				<?php foreach ($products as $product) { ?>
					<li class="product-info">
						<div class="p-left">
							<a href="" onclick="cart.remove('<?php echo $product['key']; ?>');"  title="<?php echo $button_remove; ?>" class="remove_link"></a>
							<?php if ($product['thumb']) { ?>
								<a href="<?php echo $product['href']; ?>" class="text-center">
									<img class="img-responsive" src="<?php echo $product['thumb']; ?>"  title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>">
								</a>
							<?php } ?>
						</div>
						<div class="p-right">
							<p class="p-name"><?php echo $product['name']; ?></p>
							<p class="p-rice"><?php echo $product['total']; ?></p>

							<div class="change_quantity">
								<a class="blockcart_quantity_down" href="#">-</a>
								<input class="cart_quantity_input_text" type="text" value="<?php echo $product['quantity']; ?>">
								<a class="blockcart_quantity_up" href="#">+</a>
							</div>
						</div>
					</li>
					<?php } ?>
				</ul>
			
			<?php foreach ($totals as $total) { ?>
				<div class="toal-cart">
					<span><?php echo $total['title']; ?></span>
					<span class="toal-price pull-right"><?php echo $total['text']; ?></span>
				</div>
			<?php } ?>
			<div class="cart-buttons">
				<a href="<?php echo $cart; ?>" class="btn-my-cart">View my cart</a>
				<a href="<?php echo $checkout; ?>" class="btn-check-out">Checkout</a>
			</div>
			<?php } else { ?>
				<h5 class="cart-title"><?php echo $text_empty; ?></h5>
			<?php } ?></div>
		</div>
	</div>
</div>