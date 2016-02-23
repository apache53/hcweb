<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
* Class News extends MY_Controller 
 * @author hanj
 * 移动端用户接口类(用户类)
 */
class News extends MY_Controller{

    function __construct() {
        parent::__construct();

        //加载account_model
        $this->load->model('news_model', 'model');
        $this->load->model('banner_model', 'mbanner');

        $this->fields = 'id, title, content, photo, click, timeline';
    }

    protected $rules = array(
        "getbannerlocal" => array(
            array(
                "field" => "district_id",
                "label" => "地区ID",
                "rules" => "trim|numeric|required"
            )
        ),
        "list" => array(        
            array(
                "field" => "ctype",
                "label" => "类型ID",
                "rules" => "trim|numeric"
            )
            ,array(
                "field" => "district_id",
                "label" => "地区ID",
                "rules" => "trim|numeric"
            )
        )
    );

    // 资讯Banner
    public function getbannerlocal() {
        // 返回服务器时间以及预定义参数
        $vdata['timeline']   = time();
        $vdata['content']    = '';
        $vdata['secure']     = 0;

        $where = array('audit'=>1);
        $fields = 'id, titile, photo';
        $content = array();

        // 获取新闻列表信息
        if ($list = list_coltypes(7,0,'ctype')) {

            foreach ($list as $k => $v) {
                $where = array('cid'=>7, 'ctype'=>$v['id'], 'audit'=>1);
                $banners = $this->mbanner->get_all($where, 'id, photo');

                photo2url($banners, 0, 0);

                $content[$v['id']]['id'] = $v['id'];
                $content[$v['id']]['title'] = $v['title'];
                $content[$v['id']]['photo'] = $banners;
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

    // 资讯Banner
    public function getbannerlocal2() {
        // 返回服务器时间以及预定义参数
        $vdata['timeline']   = time();
        $vdata['content']    = '';
        $vdata['secure']     = 0;

        // 验证
        $this->form_validation->set_rules($this->rules['getbannerlocal']);

        // validate验证结果
        if ($this->form_validation->run() == FALSE) {
            // 返回失败
            $vdata['returnNo']   = '0011';
            $vdata['returnInfo'] = validation_errors();
        } else {

            $where = array('audit'=>1);
            $fields = 'id, titile, photo';
            $content = array();

            $district_id = $this->input->post('district_id');;
            if (!$district_id) {
                $district_id = 9;
            }

            // 获取新闻列表信息
            if ($list = list_coltypes(7,0,'ctype')) {

                foreach ($list as $k => $v) {
                    $where = array('cid'=>7, 'ctype'=>$v['id'], 'audit'=>1, 'district_id'=>$district_id);
                    $banners = $this->mbanner->get_all($where, 'id, photo');

                    photo2url($banners, 0, 0);

                    $content[$v['id']]['id'] = $v['id'];
                    $content[$v['id']]['title'] = $v['title'];
                    $content[$v['id']]['photo'] = $banners;
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

        }
        // 返回json数据
        $this->output->set_content_type('application/json')->set_output(json_encode($vdata));
    }




    // 资讯Banner
    public function getbannerglobal() {
        // 返回服务器时间以及预定义参数
        $vdata['timeline']   = time();
        $vdata['content']    = '';
        $vdata['secure']     = 0;

        $where = array('audit'=>1);
        $fields = 'id, titile, photo';
        $content = array();

        // 获取新闻列表信息
        if ($list = list_coltypes(8,0,'ctype')) {

            foreach ($list as $k => $v) {
                $where = array('cid'=>8, 'ctype'=>$v['id'], 'audit'=>1);
                $banners = $this->mbanner->get_all($where, 'id, photo');
                photo2url($banners, 0, 0);

                $content[$v['id']]['id'] = $v['id'];
                $content[$v['id']]['title'] = $v['title'];
                $content[$v['id']]['photo'] = $banners;
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
        $this->form_validation->set_rules($this->rules['list']);

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
                $where['in'] = array('district_id', array(9));
            }else {
                $where['in'] = array('district_id', array($district_id));
            }

            // 获取新闻列表信息
            if ($list = $this->model->get_list($this->limit, $this->offset, $this->orderby, $where, $this->fields)) {

                $this->_url($list);
                photo2url($list);

                // 去除HTML标签
                foreach ($list as $k => $v) {
                    $list[$k]['content'] = strip_tags($v['content']);
                }

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

    public function click($id) {
        return 'OK';
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
            $v['info_url'] = site_url('news/info/'.$v['id']);
        }
    }
}
