<?php
class ControllerModulePriceSlider extends Controller {
	public function index() {
		$this->load->language('module/price_slider');

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

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			$children_data = array();

			if ($category['category_id'] == $data['category_id']) {
				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach($children as $child) {
					$filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

					$children_data[] = array(
						'category_id' => $child['category_id'],
						'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);						
					
				}
			}
			
			if (isset($this->request->get['sort'])) {
				$sort = $this->request->get['sort'];
			} else {
				$sort = 'p.sort_order';
			}
			
			if (isset($this->request->get['order'])) {
				$order = $this->request->get['order'];
			} else {
				$order = 'ASC';
			}
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}
			
			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];
			} else {
				$limit = $this->config->get('config_product_limit');
			}
			
			/*if (isset($this->request->get['range'])) {
				$range = $this->request->get['range'];
			} else {
				$range = 0;
			}*/
			
			$url = '';
							
			/*if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['range'])) {
				$url .= '&range=' . $this->request->get['range'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}*/
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
			
			$data['sorts'] = array();
			
			$filter_order = '';
			
			if (isset($this->request->get['order'])) {
				$filter_order .= $this->request->get['order'];
			}
			
			$data['sorts'][] = array(
					'text'  => 'Sort By Lowest Prices',
					'value' => 'p.price-ASC',
					'filter_order' => $filter_order,
					'checked' => 'ASC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			);
				
			$data['sorts'][] = array(
					'text'  => 'Sort By Highest Prices',
					'value' => 'p.price-DESC',
					'filter_order' => $filter_order,
					'checked' => 'DESC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			);
			
			$data['range'] = array();
			
			if (isset($this->request->get['range'])) {
				$p_range = explode(",", $this->request->get['range']);
				$min = $p_range[0]; $max = $p_range[1];
			} else {
				$min = '0'; $max = '10000';
			}
			
			$data['range'][] = array(
					'min' => $min,
					'max' => $max,
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
			);
			
			$filter_data = array(
				'filter_category_id'  => $category['category_id'],
				'filter_sub_category' => true,
				//'sort'               => $sort,
				//'range'              => $range,
				//'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);

			$data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
				'children'    => $children_data,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/price_slider.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/price_slider.tpl', $data);
		} else {
			return $this->load->view('default/template/module/price_slider.tpl', $data);
		}
	}
}