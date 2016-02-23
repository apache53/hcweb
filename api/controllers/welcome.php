<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
* Class News extends MY_Controller 
 * @author hanj
 * 移动端用户接口类(用户类)
 */
class welcome extends MY_Controller{

	public function test() {
		$ctypes = list_coltypes(1,0,'ctype');

		print_r($ctypes);

	}

}
