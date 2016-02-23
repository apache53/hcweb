<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
* Class journals extends MY_Controller 
 * @author hanj
 * 移动端用户接口类(用户类)
 */
class Journals extends MY_Controller{

    function __construct() {
        parent::__construct();

        //加载account_model
        $this->load->model('journals_model', 'model');
        $this->load->model('gallery_model', 'mgallery');

        $this->fields = 'id, title, district_id';
        $this->galleryfields = 'id, title, photo, timeline';
    }

    protected $rules = array(
        "getlist" => array(  
            array(
                "field" => "ctype",
                "label" => "期刊类型",
                "rules" => "trim|numeric|required"
            )
            ,array(
                "field" => "district_id",
                "label" => "地区ID",
                "rules" => "trim|numeric"
            )
        ),
        "getgallery" => array(  
            array(
                "field" => "gallery_id",
                "label" => "期刊分册ID",
                "rules" => "trim|numeric|required|callback_gallery_check"
            )
        )
    );

    // 资讯Banner
    public function getbanner() {
        // 返回服务器时间以及预定义参数
        $vdata['timeline']   = time();
        $vdata['content']    = '';
        $vdata['secure']     = 0;

        $where = array('audit'=>1);
        $fields = 'id, titile, photo';
        $content = array();

        // 获取新闻列表信息
        if ($list = list_coltypes(4,0,'ctype')) {

            photo2url($list, 1, 0);

            foreach ($list as $k => $v) {
                $content[$v['id']]['id'] = $v['id'];
                $content[$v['id']]['title'] = $v['title'];
                $content[$v['id']]['photo'] = $v['photo'];
            }

            //返回用户详细数据
            $vdata['returnNo']   = '0000';
            $vdata['returnInfo'] = '操作成功';
            $vdata['secure']     = 0;
            $vdata['content']    = $content;
        } else {
            $vdata['returnNo']   = '0050';
            $vdata['returnInfo'] = '数据不存在';
        }
        // 返回json数据
        $this->output->set_content_type('application/json')->set_output(json_encode($vdata));
    }

    // 用户信息查询
    public function getlist() {
        // 返回服务器时间以及预定义参数
        $vdata['timeline']   = time();
        $vdata['content']    = '';
        $vdata['secure']     = 0;

        // 验证
        $this->form_validation->set_rules($this->rules['getlist']);

        // validate验证结果
        if ($this->form_validation->run() == FALSE) {
            // 返回失败
            $vdata['returnNo']   = '0011';
            $vdata['returnInfo'] = validation_errors();
        } else {
            $data_post = $this->input->post();

            // 初始化翻页
            $this->_list();
            
            $where = array('audit'=>1);

            $where['ctype'] = $this->form_validation->set_value('ctype');

            $district_id = $this->form_validation->set_value('district_id');

            if (!isset($data_post['district_id'])) {
                $where['in'] = array('district_id', array(0, 9));
            }else {
                $where['in'] = array('district_id', array(0, $district_id));
            }

            // 获取新闻列表信息
            if ($list = $this->model->get_list($this->limit, $this->offset, $this->orderby, $where, $this->fields)) {

                //返回用户详细数据
                $vdata['returnNo']   = '0000';
                $vdata['returnInfo'] = '操作成功';
                $vdata['secure']     = 0;
                $vdata['content']    = $list;
            } else {
                $vdata['returnNo']   = '0050';
                $vdata['returnInfo'] = '数据不存在';
            }
        }

        // 返回json数据
        $this->output->set_content_type('application/json')->set_output(json_encode($vdata));
    }

    // 期刊信息查询
    public function getgallery() {
        // 返回服务器时间以及预定义参数
        $vdata['timeline']   = time();
        $vdata['content']    = '';
        $vdata['secure']     = 0;

        // 验证
        $this->form_validation->set_rules($this->rules['getgallery']);

        // validate验证结果
        if ($this->form_validation->run() == FALSE) {
            // 返回失败
            $vdata['returnNo']   = '0011';
            $vdata['returnInfo'] = validation_errors();
        } else {

            $where = array('audit'=>1);
            $where['id'] = $this->gallery_id;

            // 获取新闻列表信息
            if ($list = $this->mgallery->get_info($where, $this->galleryfields)) {

                if (!empty($list[0])) {
                    //返回用户详细数据
                    $vdata['returnNo']   = '0000';
                    $vdata['returnInfo'] = '操作成功';
                    $vdata['secure']     = 0;
                    $vdata['content']    = $list[0];
                } else {
                    $vdata['returnNo']   = '0050';
                    $vdata['returnInfo'] = '数据不存在';
                }

            } else {
                $vdata['returnNo']   = '0050';
                $vdata['returnInfo'] = '数据不存在';
            }
        }
        // 返回json数据
        $this->output->set_content_type('application/json')->set_output(json_encode($vdata));
    }

    // 验证码
    public function gallery_check($str)
    {
        if($this->mgallery->get_one($str)){
            $this->gallery_id = $str;
            return true;
        }else{
            $this->form_validation->set_message('captchas_verify', '该期刊不存在');
            return false;
        }
    }

    // 初始化翻页
    protected function _list() {
        $data_post = $this->input->post();
        $page = !empty($data_post)&&isset($data_post['page'])?($data_post['page']-1):0;
        $this->limit = !empty($data_post)&&isset($data_post['limit'])?$data_post['limit']:4;
        $this->offset = $page*$this->limit;
        $this->orderby = !empty($data_post)&&isset($data_post['orderby'])?$data_post['orderby']:'sort_id';
    }

    protected function _url(&$list) {
        foreach ($list as $k => &$v) {
            $v['info_url'] = site_url('journals/info/'.$v['id']);
        }
    }
}
