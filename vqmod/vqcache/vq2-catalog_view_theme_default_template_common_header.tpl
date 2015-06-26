<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<?php echo HTTPS_SERVER; ?>catalog/view/theme/default/assets/lib/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo HTTPS_SERVER; ?>catalog/view/theme/default/assets/lib/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo HTTPS_SERVER; ?>catalog/view/theme/default/assets/lib/select2/css/select2.min.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo HTTPS_SERVER; ?>catalog/view/theme/default/assets/lib/jquery.bxslider/jquery.bxslider.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo HTTPS_SERVER; ?>catalog/view/theme/default/assets/lib/owl.carousel/owl.carousel.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo HTTPS_SERVER; ?>catalog/view/theme/default/assets/lib/jquery-ui/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo HTTPS_SERVER; ?>catalog/view/theme/default/assets/css/animate.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo HTTPS_SERVER; ?>catalog/view/theme/default/assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo HTTPS_SERVER; ?>catalog/view/theme/default/assets/css/style.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo HTTPS_SERVER; ?>catalog/view/theme/default/assets/css/responsive.css" />    
    <title><?php echo $title; ?></title>
	<base href="<?php echo $base; ?>" />
	<?php if ($description) { ?>
		<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	<?php if ($keywords) { ?>
		<meta name="keywords" content= "<?php echo $keywords; ?>" />
	<?php } ?>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<?php if ($icon) { ?>
		<link href="<?php echo $icon; ?>" rel="icon" />
	<?php } ?>
	<?php foreach ($links as $link) { ?>
		<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>	
	<?php echo $google_analytics; ?>
	<script type="text/javascript" src="<?php echo HTTPS_SERVER; ?>catalog/view/theme/default/assets/lib/jquery/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.lazyload/1.9.1/jquery.lazyload.js"></script>
	</head>
<body class="<?php if(!isset($this->request->get['route'])){ echo 'home'; } else { echo 'category-page'; } ?>">
<!-- TOP BANNER -->
<!-- <div id="top-banner" class="top-banner">
    <div class="bg-overlay"></div>
    <div class="container">
        <h1>Special Offer!</h1>
        <h2>Rewarding all customers with a 15% discount</h2>
        <span>This offer is available from 9th December to 19th December 2015</span>
        <span class="btn-close"></span>
    </div>
</div> -->
<!-- HEADER -->
<div id="header" class="header">
    <div class="top-header">
        <div class="container">
            <div class="nav-top-links">
                <a class="first-item" href="<?php echo $contact; ?>"><img alt="phone" src="catalog/view/theme/default/assets/images/phone.png" /><?php echo $telephone; ?></a>
                <a href="#"><img alt="email" src="catalog/view/theme/default/assets/images/email.png" />Contact us today!</a>
            </div>
			<?php echo $currency; ?>            
            <!-- <div class="language ">
                <div class="dropdown">
                      <a class="current-open" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
                      <img alt="email" src="assets/images/fr.jpg" />French                      
                      </a>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#"><img alt="email" src="assets/images/en.jpg" />English</a></li>
                        <li><a href="#"><img alt="email" src="assets/images/fr.jpg" />French</a></li>
                    </ul>
                </div>
            </div> -->
            
            <div class="support-link">
                <a href="<?php echo $wishlist; ?>" title="<?php echo $text_wishlist; ?>"><?php echo $text_wishlist; ?></a>
                <a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a>
				<a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><?php echo $text_checkout; ?></a>
            </div>

            <div id="user-info-top" class="user-info pull-right">
                <div class="dropdown">
                    <a class="current-open" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="<?php echo $account; ?>"><span><?php echo $text_account; ?></span></a>
                    <ul class="dropdown-menu mega_dropdown" role="menu">
                    <?php if ($logged) { ?>
						<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
						<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
						<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
						<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
						<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
					<?php } else { ?>
						<li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
						<li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
					<?php } ?>
                    </ul>
                </div>
            </div>
			
			<div id="sellers-info-top" class="user-info pull-right seller"><div class="dropdown">

				<a class="current-open" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="<?php echo $this->url->link('seller/account-dashboard', '', 'SSL'); ?>"><span><?php echo $ms_account_seller_account; ?></span></a>
				<ul class="dropdown-menu mega_dropdown" role="menu">				
                    <?php if ($ms_seller_created) { ?>
                        <?php if ($this->MsLoader->MsSeller->getStatus($this->customer->getId()) == MsSeller::STATUS_ACTIVE) { ?>
                            <li><a href="<?php echo $this->url->link('seller/account-dashboard', '', 'SSL'); ?>"><?php echo $ms_account_dashboard; ?></a></li>
                        <?php } ?>

                        <li><a href= "<?php echo $this->url->link('seller/account-profile', '', 'SSL'); ?>"><?php echo $ms_account_sellerinfo; ?></a></li>
                        <?php if ($this->MsLoader->MsSeller->getStatus($this->customer->getId()) == MsSeller::STATUS_ACTIVE) { ?>
                        <li><a href= "<?php echo $this->url->link('seller/account-product/create', '', 'SSL'); ?>"><?php echo $ms_account_newproduct; ?></a></li>
                        <li><a href= "<?php echo $this->url->link('seller/account-product', '', 'SSL'); ?>"><?php echo $ms_account_products; ?></a></li>
                        <li><a href= "<?php echo $this->url->link('seller/account-order', '', 'SSL'); ?>"><?php echo $ms_account_orders; ?></a></li>
                        <li><a href= "<?php echo $this->url->link('seller/account-transaction', '', 'SSL'); ?>"><?php echo $ms_account_transactions; ?></a></li>

                        <?php if ($this->config->get('msconf_allow_withdrawal_requests')) { ?>
                        <li><a href= "<?php echo $this->url->link('seller/account-withdrawal', '', 'SSL'); ?>"><?php echo $ms_account_withdraw; ?></a></li>
                        <?php } ?>

                        <li><a href= "<?php echo $this->url->link('seller/account-stats', '', 'SSL'); ?>"><?php echo $ms_account_stats; ?></a></li>
                        <li><a href="<?php echo $this->url->link('account/logout', '', 'SSL'); ?>"><?php echo $text_logout; ?></a></li>
                        <?php } ?>
                    <?php } else { ?>
                        <li><a href="<?php echo $this->url->link('account/register-seller', '', 'SSL'); ?>"><?php echo $ms_account_register_seller; ?></a></li>
                        <li><a href="<?php echo $this->url->link('account/login', '', 'SSL'); ?>"><?php echo $text_login; ?></a></li>
                    <?php } ?>
                  </ul>
                </li>
			
                    
                </div>
            </div>
			
        </div>
    </div>
    <!--/.top-header -->
    <!-- MAIN HEADER -->
    <div class="container main-header">
        <div class="row">
            <div class="col-xs-12 col-sm-3 logo">
				<?php if ($logo) { ?>
					<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
				<?php } else { ?>
					<h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
				<?php } ?>
            </div>            
			<div class="col-xs-7 col-sm-7 header-search-box">
				<?php echo $search; ?>
			</div>
			
            <?php echo $cart; ?>
        </div>        
    </div>
    <!-- END MANIN HEADER -->
    <div id="nav-top-menu" class="nav-top-menu">
        <div class="container">
            <div class="row">
                <div class="col-sm-3" id="box-vertical-megamenus">
                    <div class="box-vertical-megamenus">
                    <h4 class="title">
                        <span class="title-menu">Categories</span>
                        <span class="btn-open-mobile pull-right home-page"><i class="fa fa-bars"></i></span>
                    </h4>
                    <div class="vertical-menu-content is-home">
                        <ul class="vertical-menu-list">
							<?php							
							$count = 0; 
							foreach ($categories as $category) { 
							if ($category['children']) { ?>
								<li class="parent <?php if ($count >= 11) { echo 'cat-link-orther'; } ?>" >
								<a href="<?php echo $category['href']; ?>" class="parent"><img class="icon-menu" alt="<?php echo $category['name']; ?>" src="<?php echo $category['image']; ?>"><?php echo $category['name']; ?></a>                           
								<div class="vertical-dropdown-menu">
                                    <div class="vertical-groups col-sm-12">
									<?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
										<?php foreach ($children as $child) { ?>
											<div class="mega-group col-sm-3">
												<h4 class="mega-group-header"><span><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></span></h4>
												<?php 
												$sub_categories = $this->model_catalog_category->getSubCategories($child['child_id']);
												if ($sub_categories) { ?>
													<ul class="group-link-default">
														<?php foreach ($sub_categories as $sub_child) { ?>
															<li><a href="<?php echo $sub_child['href']; ?>"><?php echo $sub_child['name']; ?></a></li>
														<?php } ?>
													</ul>
												<?php } ?>
											</div>
										<?php } ?>
									<?php } ?>
									</div>
                                </div>
								</li>
							<?php } else { ?>
								<li <?php if ($count >= 11) { echo 'class="cat-link-orther"'; } ?> ><a href="<?php echo $category['href']; ?>"><img class="icon-menu" alt="<?php echo $category['name']; ?>" src="<?php echo $category['image']; ?>"><?php echo $category['name']; ?></a></li>
							<?php } $count++; } ?>  
                        </ul>
                        <div class="all-category"><span class="open-cate">All Categories</span></div>
                    </div>
                </div>
                </div>
                <div id="main-menu" class="col-sm-9 main-menu">
                    <nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                    <i class="fa fa-bars"></i>
                                </button>
                                <a class="navbar-brand" href="#">MENU</a>
                            </div>
                            <div id="navbar" class="navbar-collapse collapse">
                                <ul class="nav navbar-nav">
                                    <li class="active"><a href="#">Home</a></li>
                                    <li class="dropdown">
                                        <a href="category.html" class="dropdown-toggle" data-toggle="dropdown">Fashion</a>
                                        <ul class="dropdown-menu mega_dropdown" role="menu" style="width: 830px; left: -72px;">
                                            <li class="block-container col-sm-3">
                                                <ul class="block">
                                                    <li class="link_container group_header">
                                                        <a href="#">MEN'S</a>
                                                    </li>
                                                    <li class="img_container">
                                                        <a href="#">
                                                            <img class="img-responsive" src="catalog/view/theme/default/assets/data/men.png" alt="sport">
                                                        </a>
                                                    </li>
                                                    <li class="link_container"><a href="#">Skirts</a></li>
                                                    <li class="link_container"><a href="#">Jackets</a></li>
                                                    <li class="link_container"><a href="#">Tops</a></li>
                                                    <li class="link_container"><a href="#">Scarves</a></li>
                                                    <li class="link_container"><a href="#">Pants</a></li>
                                                </ul>
                                            </li>
                                             <li class="block-container col-sm-3">
                                                <ul class="block">
                                                    <li class="link_container group_header">
                                                        <a href="#">WOMEN'S</a>
                                                    </li>
                                                    <li class="img_container">
                                                        <a href="#">
                                                            <img class="img-responsive" src="catalog/view/theme/default/assets/data/women.png" alt="sport">
                                                        </a>
                                                    </li>
                                                    <li class="link_container"><a href="#">Skirts</a></li>
                                                    <li class="link_container"><a href="#">Jackets</a></li>
                                                    <li class="link_container"><a href="#">Tops</a></li>
                                                    <li class="link_container"><a href="#">Scarves</a></li>
                                                    <li class="link_container"><a href="#">Pants</a></li>
                                                </ul>
                                            </li>
                                             <li class="block-container col-sm-3">
                                                <ul class="block">
                                                    <li class="link_container group_header">
                                                        <a href="#">MEN'S</a>
                                                    </li>
                                                    <li class="img_container">
                                                        <a href="#">
                                                            <img class="img-responsive" src="catalog/view/theme/default/assets/data/kid.png" alt="sport">
                                                        </a>
                                                    </li>
                                                    <li class="link_container"><a href="#">Shoes</a></li>
                                                    <li class="link_container"><a href="#">Clothing</a></li>
                                                    <li class="link_container"><a href="#">Tops</a></li>
                                                    <li class="link_container"><a href="#">Scarves</a></li>
                                                    <li class="link_container"><a href="#">Accessories</a></li>
                                                </ul>
                                            </li>
                                             <li class="block-container col-sm-3">
                                                <ul class="block">
                                                    <li class="link_container group_header">
                                                        <a href="#">TRENDING</a>
                                                    </li>
                                                    <li class="img_container">
                                                        <a href="#">
                                                            <img class="img-responsive" src="catalog/view/theme/default/assets/data/trending.png" alt="sport">
                                                        </a>
                                                    </li>
                                                    <li class="link_container"><a href="#">Men's Clothing</a></li>
                                                    <li class="link_container"><a href="#">Kid's Clothing</a></li>
                                                    <li class="link_container"><a href="#">Women's Clothing</a></li>
                                                    <li class="link_container"><a href="#">Accessories</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="category.html" class="dropdown-toggle" data-toggle="dropdown">Sports</a>
                                        <ul class="mega_dropdown dropdown-menu" style="width: 830px; left: -197px;">
                                            <li class="block-container col-sm-6">
                                                <ul class="block">
                                                    <li class="img_container">
                                                        <a href="#" title="">
                                                            <img class="img-responsive" src="catalog/view/theme/default/assets/data/sport.png" alt="sport">
                                                        </a>
                                                    </li>   
                                                </ul>
                                            </li>
                                            <li class="block-container col-sm-3">
                                                <ul class="block">
                                                    <li class="link_container group_header">
                                                        <a href="#">BOXING</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Basketball</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Racing</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Foodball</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Tenis</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Accessories</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="block-container col-sm-3">
                                                <ul class="block">
                                                    <li class="link_container group_header">
                                                        <a href="#">BOXING</a>
                                                    </li>
                                                    <li class="img_container">
                                                        <a href="#">
                                                            <img class="img-responsive" src="catalog/view/theme/default/assets/data/ckoo.png" alt="sport">
                                                        </a>
                                                    </li>
                                                    <li class="img_container">
                                                        <a href="#">
                                                            <img class="img-responsive" src="catalog/view/theme/default/assets/data/chaneee.png" alt="sport">
                                                        </a>
                                                    </li>
                                                    <li class="img_container">
                                                        <a href="#">
                                                            <img class="img-responsive" src="catalog/view/theme/default/assets/data/loreee.png" alt="sport">
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="category.html" class="dropdown-toggle" data-toggle="dropdown">Electronics</a>
                                            <ul class="mega_dropdown dropdown-menu" style="width: 830px; left: -304px;">
                                            <li class="block-container col-sm-3">
                                                <ul class="block">
                                                    <li class="link_container group_header">
                                                        <a href="#">Asian Food</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Vietnamese Pho</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Noodles</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Seafood Dishes</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Sausages</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Meat Dishes</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Desserts</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="block-container col-sm-3">
                                                <ul class="block">
                                                    <li class="link_container group_header">
                                                        <a href="#">European Food</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Greek Potatoes</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Famous Spaghetti</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Famous Spaghetti</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Chicken Parmesan</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Italian Pizza</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">French Cakes</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="block-container col-sm-3">
                                                <ul class="block">
                                                    <li class="link_container group_header">
                                                        <a href="#">FAST FOOD</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Hamberger</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Pizza</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Noodles</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Sandwich</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Salad</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Paste</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="block-container col-sm-3">
                                                <ul class="block">
                                                    <li class="link_container group_header">
                                                        <a href="#">DRINK</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Cocktail Drinks</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Coca Colaa</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Pepsino</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Heinekeno</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Wine</a>
                                                    </li>
                                                    <li class="link_container">
                                                        <a href="#">Alcohol</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="category.html" class="dropdown-toggle" data-toggle="dropdown">Digital</a>
                                        <ul class="dropdown-menu container-fluid">
                                            <li class="block-container">
                                                <ul class="block">
                                                    <li class="link_container"><a href="#">Mobile</a></li>
                                                    <li class="link_container"><a href="#">Tablets</a></li>
                                                    <li class="link_container"><a href="#">Laptop</a></li>
                                                    <li class="link_container"><a href="#">Memory Cards</a></li>
                                                    <li class="link_container"><a href="#">Accessories</a></li>
                                                </ul>
                                            </li>
                                        </ul> 
                                    </li>
                                    <li><a href="category.html">Furniture</a></li>
                                    <li><a href="category.html">Jewelry</a></li>
                                    <li><a href="category.html">Blog</a></li>
                                </ul>
                            </div><!--/.nav-collapse -->
                        </div>
                    </nav>
                </div>
            </div>
            <!-- userinfo on top-->
            <div id="form-search-opntop">
            </div>
            <!-- userinfo on top-->
            <div id="user-info-opntop">
            </div>
            <!-- CART ICON ON MMENU -->
            <div id="shopping-cart-box-ontop">
                <i class="fa fa-shopping-cart"></i>
                <div class="shopping-cart-box-ontop-content"></div>
            </div>
        </div>
    </div>
</div>
<!-- end header -->
