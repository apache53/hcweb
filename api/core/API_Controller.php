<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
* MY Controller
*/
class API_Controller extends MY_Controller{

	function __construct(){
		parent::__construct();

        //验证数据安全
        $this->data = apiValidate($this->input->post());
        
        //验证失败操作
        if (!$this->data) {
            
            $re = array('returnNo'   => '9999', 
                        'returnInfo' => '请求操作失败！',
                        'timeline'   => time());

            echo json_encode($re);
            exit;
        }

        //load_AES
        $this->load->library('AES');

        //加载account_model
        $this->load->model('account_model', 'macc');

	}


}
