<?php
class ControllerModuleHomeCategory extends Controller {
	public function index($setting) {
		
		$this->load->language('module/home_category');

		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		$this->load->model('catalog/product');

		$data['categories'] = array();		
		
		if (!empty($setting['category'])) {
			$categories_id = array_slice($setting['category'], 0, (int)$setting['limit']);
			
			$categories = $this->model_catalog_category->getCategoriesById($setting['category']);
				
			foreach ($categories as $category) {
				//Best Sellers Tab function
				/*$data['bestsellers'] = array();
				
				$results = $this->model_catalog_product->getBestSellerProductsByCategory($category['category_id'], $setting['limit']);
				
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
				} */
				// End of best seller section
				
								
				if ($category['image']) {
					$image = $this->model_tool_image->resize($category['image'], '30', '30');
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', '30', '30');
				}
				
				$children_data = array();
				$children = $this->model_catalog_category->getSubCategoryById($category['category_id']);
				
				foreach($children as $child) {
					
					//Sub Category products Tab function
					$data['latests'] = array();
					$filter_data = array(
							'sort'  		=> 'p.date_added',
							'category_id'  	=> $child['category_id'],
							'order' 		=> 'DESC',
							'start' 		=> 0,
							'limit' 		=> $setting['limit']
					);
					$latests_data = array();
					$results = $this->model_catalog_product->getProducts($filter_data);
					
					if ($results) {
						foreach ($results as $result) {
							if ($result['image']) {
								$image_latest = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
							} else {
								$image_latest = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
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
					
							$latests_data[] = array(
									'product_id'  => $result['product_id'],
									'thumb'       => $image_latest,
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
					//End of Sub Category products
					
					$children_data[] = array(
						'category_id' => $child['category_id'],
						'name' => $child['name'],
						'latests' => $latests_data,
						'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}
				
				$data['categories'][] = array(
					'category_id' => $category['category_id'],
					'name'        => $category['name'],
					'image'		  => $image,
					'children'    => $children_data,
					'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/home_category.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/home_category.tpl', $data);
		} else {
			return $this->load->view('default/template/module/home_category.tpl', $data);
		}
	}
}