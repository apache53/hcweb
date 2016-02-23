<?php include_once VIEWS.'inc/action.nav.php'; ?>
<?php include_once VIEWS.'inc/action.info.php'; ?>
<?php

// 点击计数
// $this->load->library('session');
if(!($CI->session->userdata("news_".$id))) {
  $CI->model->add_click($it['id']);
  $CI->session->set_userdata(array("news_".$id=>1));
}

$limit = 2;
$page = 1;
$page_pos = 3;
$where = array('cid'=>$it['cid'], 'audit'=>1, 'flag'=>1);
$fields = 'id, title, content, photo';
include_once VIEWS.'inc/action.list.php';
?>
<!DOCTYPE html>
<head>
<?php include_once VIEWS.'inc/head.php'; ?>
</head>

<body>
    <?php include_once VIEWS.'inc/header.php'; ?>
    <div class="w92">
       <p class="newsd-p1"><?php echo $it['title'] ?></p> 
       <p class="newsd-p2"><?php echo date('m-d H:i', $it['timeline']); ?> <?php echo $it['tags']; ?></p>     
       <?php echo $it['content'] ?>

       <?php if (!empty($it['phone'])) { ?>
        <a class="newsd-a1" href="tel:<?php echo $it['phone'] ?>">一键联系</a>
       <?php } ?>
       
    </div>
    <div class="news-div2">
      <span class="newsd-span1">分享</span>
    </div>
    <div class="newsd-div3 clear w92">
      <ul>
        <li class="newsd-li1">
          <a class="newsd-a2" href="javascript:open2()">
             <img src="<?php echo static_file('m/img/newsd_icon1.png'); ?> " width="70%">
              <p class="newsd-p5">微信朋友圈</p>
          </a>
        </li>
         <li class="newsd-li1">
          <a class="newsd-a2" href="javascript:open3()">
             <img src="<?php echo static_file('m/img/newsd_icon2.png'); ?> " width="70%">
              <p class="newsd-p5">微信好友</p>
          </a>
        </li>
         <li class="newsd-li1">
          <a class="newsd-a2" href="javascript:open4()">
             <img src="<?php echo static_file('m/img/newsd_icon3.png'); ?> " width="70%">
              <p class="newsd-p5">QQ好友</p>
          </a>
        </li>
         <li class="newsd-li1">
          <a class="newsd-a2" href="javascript:open5()">
             <img src="<?php echo static_file('m/img/newsd_icon4.png'); ?> " width="70%">
              <p class="newsd-p5">更多</p>
          </a>
        </li>
      </ul>

    </div>

    <div class="w92">
    <p class="newsd-p6"><span class="newsd-span2">推荐咨询</span></p>
    <div class="newsd-ul2 clear">
      <ul>
      <?php if (!empty($list)): ?>
        <?php foreach ($list as $k => $v): ?>
          <li class="newsd-li2">
                <a class="newsd-a3" href="<?php echo site_url('news/info/'.$v['id']); ?>">
                  <div class="fl newsd-div4"><img src="<?php echo UPLOAD_URL.tag_photo($v['photo']); ?>"  title="<?php echo tag_photo($v['photo'], 'title'); ?>" alt="<?php echo tag_photo($v['photo'], 'alt'); ?>" width="100%"></div>
                  <div class="fl newsd-div5">
                    <p class="newsd-p7"><?php echo strcut($v['title'], 13) ?></p>
                    <p class="newsd-p8"><?php echo strcut(strip_tags($v['content']), 35); ?></p>
                  </div>
                </a>
          </li>
          <?php if (($k+1) != sizeof($list)): ?>
          <li class="newsd-li3"></li>
          <?php endif ?>
        <?php endforeach ?>
      <?php else: ?>
          <li class="newsd-li2">
            暂无推荐咨询
          </li>
      <?php endif ?>
      </ul>
    </div>
    </div>
    
    <?php include_once VIEWS.'inc/footer.php'; ?>
<?php
	echo static_file('web/js/main.js');
?>

<script type="text/javascript">
   function open1(){
        window.location.href="contect//www.baidu.com";
      }
  function open2(){
        window.location.href="wxpyq//www.baidu.com";
      }
  function open3(){
        window.location.href="wxhy//www.baidu.com";
      }
  function open4(){
        window.location.href="QQ//www.baidu.com";
      }
  function open5(){
        window.location.href="more//www.baidu.com";
      }
</script>
</body>
</html>