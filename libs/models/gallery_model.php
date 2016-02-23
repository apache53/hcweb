<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class gallery_model extends MY_Model {
	protected $table = 'gallery';

	public function get_info($where,$fields = "*",$table=FALSE) {
		$it[] = parent::get_one($where, $fields, $table);
		photo2url($it, 'true');

		return $it;
	}
}
