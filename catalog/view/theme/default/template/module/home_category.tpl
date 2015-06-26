<div class="content-page" id="main">
    <div class="container">
	<?php if($categories) {
		$category_theme = array();
		$category_theme = array('0' => array('color' => 'red'),
								'1' => array('color' => 'green'),
								'2' => array('color' => 'orange'),
								'3' => array('color' => 'blue'),
								'4' => array('color' => 'blue2'),
								'5' => array('color' => 'gray')
						);
		$i = 0;
		foreach($categories as $category) { ?> 
        <div class="category-featured">
            <nav class="navbar nav-menu nav-menu-<?php echo $category_theme[$i]['color']; ?> show-brand">
              <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                  <div class="navbar-brand"><a href="<?php echo $category['href']; ?>"><img alt="fashion" src="<?php echo $category['image']; ?>" /><?php echo $category['name']; ?></a></div>
                  <span class="toggle-menu"></span>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse">           
                  <ul class="nav navbar-nav">
                    <li class="active"><a data-toggle="tab" href="#tab-best-<?php echo $category['category_id']; ?>">Best Seller</a></li>
					<?php if($category['children']) { 
						foreach($category['children'] as $child) { ?>
						<li><a data-toggle="tab" href="#tab-child-<?php echo $child['category_id']; ?>"><?php echo $child['name']; ?></a></li>
					<?php } } ?>
                  </ul>
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
              <div id="elevator-<?php echo $i; ?>" class="floor-elevator">
                    <a href="#" class="btn-elevator up disabled fa fa-angle-up"></a>
                    <a href="#elevator-<?php echo $i + 1; ?>" class="btn-elevator down fa fa-angle-down"></a>
              </div>
            </nav>
            
           <div class="product-featured clearfix">
                <div class="banner-featured">
                    <div class="featured-text"><span>featured</span></div>
                    <div class="banner-img">
                        <a href="#"><img alt="Featurered 1" src="<?php echo HTTPS_SERVER; ?>catalog/view/theme/default/assets/data/f1.jpg" /></a>
                    </div>
                </div>
				
                <div class="product-featured-content">
                    <div class="product-featured-list">
                        <div class="tab-container">
                            <!-- tab product -->
                            <div class="tab-panel active" id="tab-best-<?php echo $category['category_id']; ?>">
                                <ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav = "true" data-margin = "0" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":4}}'>                                    
									<li>
                                        <div class="left-block">
                                            <a href="#">
                                            <img class="img-responsive" alt="product" data-original="<?php echo HTTPS_SERVER; ?>catalog/view/theme/default/assets/data/01_blue-dress.jpg" /></a>
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
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="#">Blue Dress</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">$38,95</span>
                                                <span class="price old-price">$52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
									
                                </ul>
                            </div>
							<?php if($category['children']) { 
							foreach($category['children'] as $child) { ?>
							<div class="tab-panel" id="tab-child-<?php echo $child['category_id']; ?>">
                                <ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav = "true" data-margin = "0" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":4}}'>                                    
									<?php if($child['latests']) { 
									foreach($child['latests'] as $latest) { ?>
									<li>
                                        <div class="left-block">
                                            <a href="<?php echo $latest['href']; ?>">
                                            <img class="img-responsive" alt="<?php echo $latest['name']; ?>" src="<?php echo $latest['thumb']; ?>" /></a>
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
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="<?php echo $latest['href']; ?>"><?php echo $latest['name']; ?></a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">$38,95</span>
                                                <span class="price old-price">$52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
									<?php } } ?>
                                </ul>
                            </div>
                            <?php } } ?>
                        </div>                        
                    </div>
                </div>
           </div>
        </div>
     <?php $i++; } } ?> 
        
        <!-- Baner bottom -->
        <div class="row banner-bottom">
            <div class="col-sm-6">
                <div class="banner-boder-zoom">
                    <a href="#"><img alt="ads" class="img-responsive" src="<?php echo HTTPS_SERVER; ?>catalog/view/theme/default/assets/data/ads17.jpg" /></a>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="banner-boder-zoom">
                    <a href="#"><img alt="ads" class="img-responsive" src="<?php echo HTTPS_SERVER; ?>catalog/view/theme/default/assets/data/ads18.jpg" /></a>
                </div>
            </div>
        </div>
        <!-- end banner bottom -->
    </div>
</div>