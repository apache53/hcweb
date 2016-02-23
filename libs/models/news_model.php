<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class News_model extends MY_Model {

	protected $table = 'news';

	public function add_click($id) {
		$info = parent::get_one($id);
		if (!empty($info)) {
			$data['click'] = $info['click'] + 1;
			$where['id'] = $info['id'];
			parent::update($data, $where);
		}
	}

}