<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class account_model extends MY_Model {
    protected $table = 'account'; 

    // 检测account是否存在
    public function find_account($account)
    {
        $query = $this->db
            ->select('id,password,tradePassword')
            ->from($this->table)
            ->where('account',$account)
            ->get();
        if ($this->db->affected_rows()) {
            $re = $query->row_array();  
            return $re;
        }else{
            return false;
        }
    }

    public function find_mobile($mobile)
    {
        $query = $this->db
            ->select('id,password,tradePassword')
            ->from($this->table)
            ->where('mobile',$mobile)
            ->get();
        if ($this->db->affected_rows()) {
            $re = $query->row_array();  
            return $re;
        }else{
            return false;
        }
    }

    public function find_email($email)
    {
        $query = $this->db
            ->select('id,password,tradePassword')
            ->from($this->table)
            ->where('email',$email)
            ->get();
        if ($this->db->affected_rows()) {
            $re = $query->row_array();  
            return $re;
        }else{
            return false;
        }
    }

    public function find_inviteCode($inviteCode)
    {
        $query = $this->db
            ->select('id')
            ->from($this->table)
            ->where('inviteCode',$inviteCode)
            ->get();
        if ($this->db->affected_rows()) {
            $id = $query->row_array();  
            return $id['id'];
        }else{
            return false;
        }
    }

    // 注册
    public function create($data){
        $data['gmtCreate'] = time();
        $data['gmtModify'] = time();
        $data['isSetFundPwd']  = 0;
        $data['lastLoginTime'] = time();
        $data['status']  = 1;
        $data['loginIp'] = get_ip();
        $this->db->insert($this->table, $data); 
        if ($this->db->affected_rows()) {
            return $this->db->insert_id();
        }
        return 0;
    }

    //获取用户信息
    public function getinfo($where,$field="id,account,mobile,type,email,status,lastLoginTime,
                                           isSetFundPwd,tradeAccount,gmtModify,gmtCreate,thumb,
                                           address,terminalNo,password,tradePassword,sex,age"){
        if (!is_array($where)) {
            return FALSE;
        }

        $query = $this->db
            ->select($field)
            ->from($this->table)
            ->where($where)
            ->get();
        return $query->row_array();
    }

    // 设定
    public function set($id,$arr)
    {
        $this->db->set($arr)
            -> where(array('id'=>$id))
            -> update($this->table);
        return $this->db->affected_rows();
    }

    // 登录成功后保存登录信息
    public function setlogin($id)
    {
        // 获取上次信息
        $this->db->set('loginIp',get_ip());
        $this->db->set('lastLoginTime',time());
        $this->db->set('pwdErrors',0);
        $this->db->where('id',$id);
        $this->db->update($this->table);
        return $this->db->affected_rows();
    }

    // 设置登录密码
    public function set_pwd($aid,$pwd)
    {
        $this->db->set('password',$pwd);
        $this->db->where('id',$aid);
        $this->db->update($this->table);
        return $this->db->affected_rows();
    }

    // 设置支付密码
    public function set_pwd_pay($aid,$pwd)
    {
        $this->db->set('tradePassword',$pwd);
        $this->db->where('id',$aid);
        $this->db->update($this->table);
        return $this->db->affected_rows();
    }
    
}