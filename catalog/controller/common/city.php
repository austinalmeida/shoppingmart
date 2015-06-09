<?php
class ControllerCommonCity extends Controller {
	public function index() {
		$this->load->language('common/city'); 

		$data['text_city'] = $this->language->get('text_city');

		$data['action'] = $this->url->link('common/city/city', '', $this->request->server['HTTPS']); 
		
		$data['code'] = $this->city->getCode();
		
		$this->load->model('localisation/city');

		$data['cities'] = array();

		$results = $this->model_localisation_city->getCities();
		
		foreach ($results as $result) {
			if ($result['status']) {
				$data['cities'][] = array(
					'city_name'    => $result['city_name'],
					'code'         => $result['city_name'],
				);
			}
		}

		if (!isset($this->request->get['route'])) {
			$data['redirect'] = $this->url->link('common/home');
		} else {
			$url_data = $this->request->get;

			unset($url_data['_route_']);

			$route = $url_data['route'];

			unset($url_data['route']);

			$url = '';

			if ($url_data) {
				$url = '&' . urldecode(http_build_query($url_data, '', '&'));
			}

			$data['redirect'] = $this->url->link($route, $url, $this->request->server['HTTPS']);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/city.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/city.tpl', $data);
		} else {
			return $this->load->view('default/template/common/city.tpl', $data);
		}
	}

	public function city() {
		if (isset($this->request->post['code'])) {			
			$this->city->set($this->request->post['code']);

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
		}

		if (isset($this->request->post['redirect'])) {
			$this->response->redirect($this->request->post['redirect']);
		} else {
			$this->response->redirect($this->url->link('common/home'));
		}
	}
}