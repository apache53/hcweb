<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Journals_model extends MY_Model {

	protected $table = 'journals';

    function __construct() {
        parent::__construct();

        $this->galler_fields = 'id, title, photo, timeline';

    }

	public function get_list($limit=5,$start=0,$order=false,$where=false,$fields="*",$table=FALSE) {
		$list = parent::get_list($limit,$start,$order,$where,$fields,$table);
		foreach ($list as $k => &$v) {
			$where = array('ccid'=>$v['id'], 'audit'=>1);
			$galler_list = parent::get_all($where, $this->galler_fields, false, 'gallery');
			photo2url($galler_list);

			if (!empty($galler_list)) {
				$v['more'] = $galler_list;
			} else {
				$v['more'] = null;
			}
		}
		return $list;
	}

	public function get_info($limit=5,$start=0,$order=false,$where=false,$fields="*",$table=FALSE) {
		$list = parent::get_list($limit,$start,$order,$where,$fields,$table);
		foreach ($list as $k => &$v) {
			$where = array('ccid'=>$v['id'], 'audit'=>1);
			$galler_list = parent::get_all($where, $this->galler_fields, false, 'gallery');
			photo2url($galler_list);
			
			if (!empty($galler_list)) {
				$v['more'] = $galler_list;
			} else {
				$v['more'] = null;
			}
		}
		return $list;
	}
}