<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if (!function_exists('photo2url')) {
	/**
	 * 图片id转url
	 * @param  string $ids 上传列表值 '1,2,3[...]'
	 * @return array|false 数组或逻辑false
	 */
	function photo2url(&$list, $more='0', $phone='1'){
		foreach ($list as $k => &$v) {
			if ($more == '0') {
				if (!empty($v['photo'])) {
					$tmp_urls = UPLOAD_URL.tag_photo($v['photo']);
				} else {
					$tmp_urls = null;
				}
				$v['photo'] = $tmp_urls;

			} else {
				$tmp_list = list_upload($v['photo']);
				$tmp_urls = array();

				if ($phone == '1') {
					foreach ($tmp_list as $ks => $vs) {
						array_push($tmp_urls, array('url'=>UPLOAD_URL.$vs['url'], 'phone'=>$vs['phone']));
					}
				} else {
					foreach ($tmp_list as $ks => $vs) {
						array_push($tmp_urls, array('url'=>UPLOAD_URL.$vs['url']));
					}
				}


				$v['photo'] = $tmp_urls;
			}
		}
	}
}

if (!function_exists('getallheaders_for_hook')) {
    function getallheaders_for_hook() {
        foreach ($_SERVER as $name => $value) {
            if (substr($name, 0, 5) == 'HTTP_') {
                $headers[str_replace(' ', '-', ucwords(strtolower(str_replace('_', ' ', substr($name, 5)))))] = $value;
            }
        }
        return $headers;
    }
}

// API拦截以及验证
function apiValidate($data) {

	if (is_post()) {
            
        //验证数据
        //TODO .. 拦截数据请求

        // 加载数据加密模块
        if (!isset($CI)) {
			$CI =& get_instance();
		}

        $CI->load->library('AES');

        // 判断content
        if (isset($data['content'])) {
            
            $content = AES::decrypt($data['content'], KEY);
            $content = json_decode($content,1);

            // 解密前打印日志
            logfile('解密前数据:'.$data['content']);
            
            // 过滤数据
            if ($content) {
                //全局赋值
                $data = $content;
                $rules = array(
		            array(
		                "field" => "terminalNo",
		                "label" => "手机终端类型",
		                "rules" => "trim|required|numeric|max_length[1]|regex_match[/^[1234]*$/]"
		            ),
		            array(
		                "field" => "token",
		                "label" => "手机的token值",
		                "rules" => "trim|required|max_length[50]"
		            ),
		            array(
		                "field" => "usId",
		                "label" => "用户登录账号",
		                "rules" => "trim|numeric|max_length[11]]"
		            )
			        
		        );

		        // 验证
		        $CI->form_validation->set_rules($rules);

		        // validate验证结果
		        if ($CI->form_validation->run('', $content) == FALSE) {
		            // 返回失败
		            return FALSE;
		        } 

		        // 解密后打印日志
            	logfile('解密后数据:'.print_r($content, 1));

		        return $content;
            } else {
                
                //返回失败
                return FALSE;
            }
        }

    } else {

        //返回失败
        return FALSE;
    }
}
