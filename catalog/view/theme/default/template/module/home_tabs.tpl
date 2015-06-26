<div class="page-top">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 page-top-left">
                <div class="popular-tabs">
                    <ul class="nav-tab">
					  <?php if($featured) { ?>
                        <li class="active"><a data-toggle="tab" href="#tab-1">Featured</a></li>
					  <?php } ?>
					  <?php if($latests) { ?>
                        <li><a data-toggle="tab" href="#tab-2">Latest</a></li>
					  <?php } ?>
					  <?php if($specials) { ?>
                        <li><a data-toggle="tab" href="#tab-3">Special</a></li>
						<?php } ?>
						<?php if($bestsellers) { ?>
							<li><a data-toggle="tab" href="#tab-4">Best Sellers</a></li>
						<?php } ?>
                    </ul>
                      <div class="tab-container">
						<?php if($featured) { ?>							
                            <div id="tab-1" class="tab-panel active">
                                <ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav = "true" data-margin = "30" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":5},"1000":{"items":5}}'>
                                    <?php foreach ($featured as $feature) { ?>
									<li>
                                        <div class="left-block">
                                            <a href="<?php echo $feature['href']; ?>">
                                                <img class="img-responsive" alt="<?php echo $feature['name']; ?>" title="<?php echo $feature['name']; ?>"  src="<?php echo $feature['thumb']; ?>" />
                                            </a>
                                            <div class="quick-view">
												<a title="Add to my wishlist" class="heart" href="#"></a>
												<a title="Add to compare" class="compare" href="#"></a>
												<a title="Quick view" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">Add to Cart</a>
                                            </div>
                                            <div class="group-price">
                                                <span class="price-percent-reduction">20% OFF</span>
                                                <span class="product-new">NEW</span>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="<?php echo $feature['href']; ?>"><?php echo $feature['name']; ?></a></h5>
                                            <?php if ($feature['price']) { ?>
											<div class="content_price">
												<?php if (!$feature['special']) { ?>
											  <span class="price product-price"><?php echo $feature['price']; ?></span>
											  <?php } else { ?>
											  <span class="price product-price"><?php echo $feature['special']; ?></span> <span class="price old-price"><?php echo $feature['price']; ?></span>
											  <?php } ?>
                                            </div>
											<?php } ?>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                  <?php } ?>  
                                </ul>
                            </div>
						<?php } ?>
						<?php if($latests) { ?>
                            <div id="tab-2" class="tab-panel">
                                <ul class="product-list owl-carousel"  data-dots="false" data-loop="true" data-nav = "true" data-margin = "30"  data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":5},"1000":{"items":5}}'>
                                    <?php foreach ($latests as $latest) { ?>
									<li>
                                        <div class="left-block">
                                            <a href="<?php echo $latest['href']; ?>">
                                            <img class="img-responsive" alt="<?php echo $latest['name']; ?>" title="<?php echo $latest['name']; ?>" src="<?php echo $latest['thumb']; ?>" /></a>
                                            <div class="quick-view">
                                                    <a title="Add to my wishlist" class="heart" href="#"></a>
                                                    <a title="Add to compare" class="compare" href="#"></a>
                                                    <a title="Quick view" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">Add to Cart</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="<?php echo $latest['href']; ?>"><?php echo $latest['name']; ?></a></h5>
                                            <?php if ($latest['price']) { ?>
											<div class="content_price">
												<?php if (!$latest['special']) { ?>
												  <span class="price product-price"><?php echo $latest['price']; ?></span>
												  <?php } else { ?>
												  <span class="price product-price"><?php echo $latest['special']; ?></span> <span class="price old-price"><?php echo $latest['price']; ?></span>
												  <?php } ?>
                                            </div>
											<?php } ?>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
									<?php } ?>
                                </ul>
                            </div>
							<?php } ?>
							<?php if($specials) { ?>
                            <div id="tab-3" class="tab-panel">
                                <ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav = "true" data-margin = "30" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":5},"1000":{"items":5}}'>
                                    <?php foreach ($specials as $special) { ?>
									<li>
                                        <div class="left-block">
                                            <a href="<?php echo $special['href']; ?>"><img class="img-responsive" src="<?php echo $special['thumb']; ?>" alt="<?php echo $special['name']; ?>" title="<?php echo $special['name']; ?>" /></a>
                                            <div class="quick-view">
                                                    <a title="Add to my wishlist" class="heart" href="#"></a>
                                                    <a title="Add to compare" class="compare" href="#"></a>
                                                    <a title="Quick view" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">Add to Cart</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="<?php echo $special['href']; ?>"><?php echo $special['name']; ?></a></h5>
                                            <?php if ($special['price']) { ?>
											<div class="content_price">
												<?php if (!$special['special']) { ?>
												  <span class="price product-price"><?php echo $special['price']; ?></span>
												  <?php } else { ?>
												  <span class="price product-price"><?php echo $special['special']; ?></span> <span class="price old-price"><?php echo $special['price']; ?></span>
												  <?php } ?>
                                            </div>
											<?php } ?>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
									<?php } ?>
                                </ul>
                            </div>
							<?php } ?>
							<?php if($bestsellers) { ?>
                            <div id="tab-4" class="tab-panel">
                                <ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav = "true" data-margin = "30" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":5},"1000":{"items":5}}'>
                                    <?php foreach ($bestsellers as $bestseller) { ?>
									<li>
                                        <div class="left-block">
                                            <a href="<?php echo $bestseller['href']; ?>"><img class="img-responsive" src="<?php echo $bestseller['thumb']; ?>" alt="<?php echo $bestseller['name']; ?>" title="<?php echo $bestseller['name']; ?>" /></a>
                                            <div class="quick-view">
                                                    <a title="Add to my wishlist" class="heart" href="#"></a>
                                                    <a title="Add to compare" class="compare" href="#"></a>
                                                    <a title="Quick view" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">Add to Cart</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="<?php echo $bestseller['href']; ?>"><?php echo $bestseller['name']; ?></a></h5>
                                            <?php if ($bestseller['price']) { ?>
											<div class="content_price">
												<?php if (!$bestseller['special']) { ?>
												  <span class="price product-price"><?php echo $bestseller['price']; ?></span>
												  <?php } else { ?>
												  <span class="price product-price"><?php echo $bestseller['special']; ?></span> <span class="price old-price"><?php echo $bestseller['price']; ?></span>
												  <?php } ?>
                                            </div>
											<?php } ?>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
									<?php } ?>
                                </ul>
                            </div>
							<?php } ?>
						</div>
					</div>
				</div>            
			</div>
		</div>
	</div>