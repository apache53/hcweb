<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
* Class banner extends MY_Controller 
 * @author hanj
 * 移动端用户接口类(用户类)
 */
class banner extends MY_Controller{

    function __construct() {
        parent::__construct();

        //加载account_model
        $this->load->model('banner_model', 'model');

        $this->fields = 'id, photo';
    }


    // 获取地区列表
    public function getlist() {
        // 返回服务器时间以及预定义参数
        $vdata['timeline']   = time();
        $vdata['content']    = '';
        $vdata['secure']     = 0;

        $where = array('audit'=>1);
        $order = array('id'=>'asc');

        // 获取新闻列表信息
        if ($list = $this->model->get_all($where, $this->fields, $order)) {
            //返回用户详细数据
            photo2url($list);
            $vdata['returnNo']   = '0000';
            $vdata['returnInfo'] = '操作成功';
            $vdata['secure']     = 0;
            $vdata['content']    = $list;
        } else {
            $vdata['returnNo']   = '0050';
            $vdata['returnInfo'] = '数据不存在';
        }

        // 返回json数据
        $this->output->set_content_type('application/json')->set_output(json_encode($vdata));
    }

}
