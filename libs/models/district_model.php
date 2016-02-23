<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class District_model extends MY_Model {

	protected $table = 'district';

	public function get_all($where=false,$fields='*',$order=false,$table=FALSE) {
		$list = parent::get_all($where, $fields, $order, $table);
		$top = array(array('id'=>'0', 'title'=>"全国"));
		$list = array_merge($top, $list);

		$list_re = array();
		foreach ($list as $k => $v) {
			$list_re[$v['id']] = $v;
		}

		return $list;

	}
}