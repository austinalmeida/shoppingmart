<?php
class ControllerModuleHomeTabs extends Controller {
	public function index($setting) {
		
		$this->load->language('module/home_tabs');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');
		$this->load->model('extension/module');

		$this->load->model('tool/image');
	
		foreach ($setting['section'] as $module_code) {
		
			$module_info = $this->model_extension_module->getModuleByCode($module_code);			
			
			if ($module_code == 'featured') { 			
				$data['featured'] = array();
				if (!$module_info['limit']) {
					$module_info['limit'] = 4;
				}
				
				if (!empty($module_info['product'])) { 
					$products = array_slice($module_info['product'], 0, (int)$module_info['limit']);
					
					foreach ($products as $product_id) {
						$product_info = $this->model_catalog_product->getProduct($product_id);
		
						if ($product_info) {
							if ($product_info['image']) {
								$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
							} else {
								$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
							}
		
							if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
								$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));						
							} else {
								$price = false;
							}
		
							if ((float)$product_info['special']) {
								$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
							} else {
								$special = false;
							}
		
							if ($this->config->get('config_tax')) {
								$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
							} else {
								$tax = false;
							}
		
							if ($this->config->get('config_review_status')) {
								$rating = $product_info['rating'];
							} else {
								$rating = false;
							}
		
							$data['featured'][] = array(
								'product_id'  => $product_info['product_id'],
								'thumb'       => $image,
								'name'        => $product_info['name'],
								'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
								'price'       => $price,
								'heading'     => 'Featured',
								'special'     => $special,
								'tax'         => $tax,
								'rating'      => $rating,
								'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
							);
						}
					}
				}
			}
			
			if ($module_code == 'latest') {				
				$data['latests'] = array();
				$filter_data = array(
						'sort'  => 'p.date_added',
						'order' => 'DESC',
						'start' => 0,
						'limit' => $setting['limit']
				);
				
				$results = $this->model_catalog_product->getProducts($filter_data);
				
				if ($results) {
					foreach ($results as $result) {
						if ($result['image']) {
							$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
						}
				
						if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
							$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$price = false;
						}
				
						if ((float)$result['special']) {
							$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$special = false;
						}
				
						if ($this->config->get('config_tax')) {
							$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
						} else {
							$tax = false;
						}
				
						if ($this->config->get('config_review_status')) {
							$rating = $result['rating'];
						} else {
							$rating = false;
						}
				
						$data['latests'][] = array(
								'product_id'  => $result['product_id'],
								'thumb'       => $image,
								'name'        => $result['name'],
								'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
								'price'       => $price,
								'heading'     => 'Latest',
								'special'     => $special,
								'tax'         => $tax,
								'rating'      => $rating,
								'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
						);
					}
				}
			}
			
			if ($module_code == 'special') {
				$data['specials'] = array();
				
				$filter_data = array(
						'sort'  => 'pd.name',
						'order' => 'ASC',
						'start' => 0,
						'limit' => $setting['limit']
				);
				
				$results = $this->model_catalog_product->getProductSpecials($filter_data);
				
				if ($results) {
					foreach ($results as $result) {
						if ($result['image']) {
							$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
						}
				
						if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
							$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$price = false;
						}
				
						if ((float)$result['special']) {
							$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$special = false;
						}
				
						if ($this->config->get('config_tax')) {
							$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
						} else {
							$tax = false;
						}
				
						if ($this->config->get('config_review_status')) {
							$rating = $result['rating'];
						} else {
							$rating = false;
						}
				
						$data['specials'][] = array(
								'product_id'  => $result['product_id'],
								'thumb'       => $image,
								'name'        => $result['name'],
								'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
								'price'       => $price,
								'heading'     => 'Special',
								'special'     => $special,
								'tax'         => $tax,
								'rating'      => $rating,
								'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
						);
					}
				}
			}
			
			if ($module_code == 'bestseller') {
				$data['bestsellers'] = array();
				
				$results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);
				
				if ($results) {
					foreach ($results as $result) {
						if ($result['image']) {
							$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
						}
				
						if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
							$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$price = false;
						}
				
						if ((float)$result['special']) {
							$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$special = false;
						}
				
						if ($this->config->get('config_tax')) {
							$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
						} else {
							$tax = false;
						}
				
						if ($this->config->get('config_review_status')) {
							$rating = $result['rating'];
						} else {
							$rating = false;
						}
				
						$data['bestsellers'][] = array(
								'product_id'  => $result['product_id'],
								'thumb'       => $image,
								'name'        => $result['name'],
								'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
								'price'       => $price,
								'heading'     => 'Best Sellers',
								'special'     => $special,
								'tax'         => $tax,
								'rating'      => $rating,
								'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
						);
					}
				}
			}
		
		}

		if ($data['featured'] || $data['latests'] || $data['specials']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/home_tabs.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/home_tabs.tpl', $data);
			} else {
				return $this->load->view('default/template/module/home_tabs.tpl', $data);
			}
		}
	}
}