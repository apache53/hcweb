-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: zb_rumeinews
-- ------------------------------------------------------
-- Server version	5.5.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `boc_account`
--

DROP TABLE IF EXISTS `boc_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_account` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL COMMENT 'Mail作为帐号',
  `uname` varchar(50) NOT NULL COMMENT '帐号',
  `nickname` varchar(50) NOT NULL COMMENT '显示名称',
  `pwd` varchar(64) NOT NULL COMMENT '密码',
  `tel` varchar(30) DEFAULT NULL COMMENT '电话',
  `phone` varchar(30) DEFAULT NULL COMMENT '手机',
  `addr` varchar(100) DEFAULT NULL COMMENT '地址',
  `photo` varchar(100) DEFAULT NULL COMMENT '头像',
  `thumb` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '用户状态，0 禁用',
  `login_today` int(11) NOT NULL COMMENT '今日登录次数',
  `pwd_errors` int(1) NOT NULL DEFAULT '0' COMMENT '密码错误次数',
  `login_ip` varchar(25) NOT NULL COMMENT '最后登录的IP',
  `reg_time` int(11) NOT NULL COMMENT '添加时间',
  `login_time` int(11) NOT NULL COMMENT '最后一次登录时间',
  `ga` varchar(20) NOT NULL COMMENT 'GA 两部验证密钥 开启与否',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前端会员帐号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_account`
--

LOCK TABLES `boc_account` WRITE;
/*!40000 ALTER TABLE `boc_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `boc_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_article`
--

DROP TABLE IF EXISTS `boc_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号',
  `cid` int(11) NOT NULL COMMENT '所属栏目',
  `ccid` int(11) NOT NULL DEFAULT '0' COMMENT '栏目条目ID伪栏目',
  `sort_id` int(11) DEFAULT '0' COMMENT '排序编号',
  `audit` int(1) NOT NULL DEFAULT '0' COMMENT '0:1审核',
  `flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:1推荐',
  `ctype` int(4) NOT NULL DEFAULT '0' COMMENT '默认分类',
  `type_id` int(4) DEFAULT NULL COMMENT '类型',
  `title` tinytext NOT NULL COMMENT '标题',
  `title_seo` tinytext,
  `intro` varchar(500) DEFAULT NULL COMMENT '简介(200汉字)',
  `tags` tinytext COMMENT '标签',
  `content` text COMMENT '内容',
  `timeline` int(11) DEFAULT NULL COMMENT '发布/修改时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '公告过期时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0:1状态,1 发布，0 草稿',
  `author` varchar(50) DEFAULT NULL COMMENT '消息作者',
  `author_url` tinytext COMMENT '作者链接',
  `source` varchar(50) DEFAULT NULL COMMENT '消息来源',
  `source_url` tinytext COMMENT '来源链接',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `recommend` int(1) NOT NULL DEFAULT '0' COMMENT '0:1推荐到分类门户的页面显示',
  `homepage` int(1) NOT NULL DEFAULT '0' COMMENT '0:1推荐到首页显示',
  `recommend_photo` int(1) NOT NULL DEFAULT '0' COMMENT '0:1作为分类栏目的跑马灯图片新闻',
  `homepage_photo` int(1) NOT NULL DEFAULT '0' COMMENT '0:1作为首页的跑马灯图片新闻',
  `color` int(1) NOT NULL DEFAULT '0' COMMENT '突显状态/颜色',
  `photo` tinytext COMMENT '相关图片',
  `thumb` tinytext COMMENT '图片缩略图',
  `attachment` tinytext COMMENT '附件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_article`
--

LOCK TABLES `boc_article` WRITE;
/*!40000 ALTER TABLE `boc_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `boc_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_article_tag`
--

DROP TABLE IF EXISTS `boc_article_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(30) NOT NULL COMMENT '标签',
  `record` int(11) DEFAULT NULL COMMENT '使用的 article id',
  `count` int(11) DEFAULT NULL COMMENT '计数',
  PRIMARY KEY (`id`),
  KEY `record_index` (`id`,`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_article_tag`
--

LOCK TABLES `boc_article_tag` WRITE;
/*!40000 ALTER TABLE `boc_article_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `boc_article_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_banner`
--

DROP TABLE IF EXISTS `boc_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号',
  `cid` int(11) NOT NULL COMMENT '所属栏目',
  `ccid` int(11) NOT NULL DEFAULT '0' COMMENT '栏目条目ID伪栏目',
  `sort_id` int(11) DEFAULT '0' COMMENT '排序编号',
  `audit` int(1) NOT NULL DEFAULT '0' COMMENT '0:1审核',
  `flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:1推荐',
  `ctype` int(4) NOT NULL DEFAULT '0' COMMENT '默认分类',
  `type_id` int(4) DEFAULT NULL COMMENT '类型',
  `title` tinytext NOT NULL COMMENT '标题',
  `title_seo` tinytext,
  `intro` varchar(500) DEFAULT NULL COMMENT '简介(200汉字)',
  `tags` tinytext COMMENT '标签',
  `content` text COMMENT '内容',
  `timeline` int(11) DEFAULT NULL COMMENT '发布/修改时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '公告过期时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0:1状态,1 发布，0 草稿',
  `author` varchar(50) DEFAULT NULL COMMENT '消息作者',
  `author_url` tinytext COMMENT '作者链接',
  `source` varchar(50) DEFAULT NULL COMMENT '消息来源',
  `source_url` tinytext COMMENT '来源链接',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `recommend` int(1) NOT NULL DEFAULT '0' COMMENT '0:1推荐到分类门户的页面显示',
  `homepage` int(1) NOT NULL DEFAULT '0' COMMENT '0:1推荐到首页显示',
  `recommend_photo` int(1) NOT NULL DEFAULT '0' COMMENT '0:1作为分类栏目的跑马灯图片新闻',
  `homepage_photo` int(1) NOT NULL DEFAULT '0' COMMENT '0:1作为首页的跑马灯图片新闻',
  `color` int(1) NOT NULL DEFAULT '0' COMMENT '突显状态/颜色',
  `photo` tinytext COMMENT '相关图片',
  `thumb` tinytext COMMENT '图片缩略图',
  `attachment` tinytext COMMENT '附件',
  `link` tinytext COMMENT '链接',
  `district_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Banner';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_banner`
--

LOCK TABLES `boc_banner` WRITE;
/*!40000 ALTER TABLE `boc_banner` DISABLE KEYS */;
INSERT INTO `boc_banner` VALUES (1,6,0,1,1,0,0,NULL,'201501',NULL,NULL,NULL,NULL,1445943264,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,'15','2015/10/27/thumbnail/14459432880735z88v6.png',NULL,NULL,9),(2,6,0,2,1,0,0,NULL,'201502',NULL,NULL,NULL,NULL,1445943331,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,'16','2015/10/27/thumbnail/144594333721333gvjv.png',NULL,NULL,9),(3,7,0,3,1,0,7,NULL,'201501',NULL,NULL,NULL,NULL,1446013701,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,'28','2015/10/28/thumbnail/14460137074244h3mn7.png',NULL,NULL,9),(4,7,0,4,1,0,7,NULL,'201502',NULL,NULL,NULL,NULL,1446013711,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,'29','2015/10/28/thumbnail/1446013718022rbjvr.png',NULL,NULL,9),(5,7,0,5,1,0,8,NULL,'201501',NULL,NULL,NULL,NULL,1446013722,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,'30','2015/10/28/thumbnail/14460137287307t2hin.png',NULL,NULL,9),(6,7,0,6,1,0,8,NULL,'201502',NULL,NULL,NULL,NULL,1446013732,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,'31','2015/10/28/thumbnail/14460137386772wte5i.png',NULL,NULL,9),(7,8,0,7,1,0,9,NULL,'2010501',NULL,NULL,NULL,NULL,1446013745,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,'32','2015/10/28/thumbnail/1446013752181sga14.png',NULL,NULL,9),(8,8,0,8,1,0,9,NULL,'201502',NULL,NULL,NULL,NULL,1446013755,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,'33','2015/10/28/thumbnail/14460137606765f88km.png',NULL,NULL,9),(9,8,0,9,1,0,10,NULL,'201501',NULL,NULL,NULL,NULL,1446013767,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,'34','2015/10/28/thumbnail/14460137721981wx5cv.png',NULL,NULL,9),(10,8,0,10,1,0,10,NULL,'201502',NULL,NULL,NULL,NULL,1446013775,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,'35','2015/10/28/thumbnail/14460137817787r73f2.png',NULL,NULL,9);
/*!40000 ALTER TABLE `boc_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_city`
--

DROP TABLE IF EXISTS `boc_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yid` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `depth` tinyint(4) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `timeline` int(13) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_city`
--

LOCK TABLES `boc_city` WRITE;
/*!40000 ALTER TABLE `boc_city` DISABLE KEYS */;
INSERT INTO `boc_city` VALUES (1,110000,0,0,0,'','北京市',0,'','',1368120198),(2,120000,0,0,0,'','天津市',0,'','',1368120198),(3,130000,0,0,0,'','河北省',0,'','',1368120198),(4,140000,0,0,0,'','山西省',0,'','',1368120198),(5,150000,0,0,0,'','内蒙自治区',0,'','',1368120198),(6,210000,0,0,0,'','辽宁省',0,'','',1368120198),(7,220000,0,0,0,'','吉林市',0,'','',1368120198),(8,230000,0,0,0,'','黑龙江省',0,'','',1368120198),(9,310000,0,0,0,'','上海市',0,'','',1368120198),(10,320000,0,0,0,'','江苏省',0,'','',1368120198),(11,330000,0,0,0,'','浙江省',0,'','',1368120198),(12,340000,0,0,0,'','安徽省',0,'','',1368120198),(13,350000,0,0,0,'','福建省',0,'','',1368120198),(14,360000,0,0,0,'','江西省',0,'','',1368120198),(15,370000,0,0,0,'','山东省',0,'','',1368120198),(16,410000,0,0,0,'','河南省',0,'','',1368120198),(17,420000,0,0,0,'','湖北省',0,'','',1368120198),(18,430000,0,0,0,'','湖南省',0,'','',1368120198),(19,440000,0,0,0,'','广东省',0,'','',1368120198),(20,450000,0,0,0,'','广西自治区',0,'','',1368120198),(21,460000,0,0,0,'','海南省',0,'','',1368120198),(22,500000,0,0,0,'','重庆市',0,'','',1368120198),(23,510000,0,0,0,'','四川省',0,'','',1368120198),(24,520000,0,0,0,'','贵州省',0,'','',1368120198),(25,530000,0,0,0,'','云南省',0,'','',1368120198),(26,540000,0,0,0,'','西藏自治区',0,'','',1368120198),(27,610000,0,0,0,'','陕西省',0,'','',1368120198),(28,620000,0,0,0,'','甘肃省',0,'','',1368120198),(29,630000,0,0,0,'','青海省',0,'','',1368120198),(30,640000,0,0,0,'','宁夏自治区',0,'','',1368120198),(31,650000,0,0,0,'','新疆自治区',0,'','',1368120198),(32,710000,0,0,0,'','台湾省',0,'','',1368120198),(33,810000,0,0,0,'','香港特区',0,'','',1368120198),(34,820000,0,0,0,'','澳门特区',0,'','',1368120198);
/*!40000 ALTER TABLE `boc_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_coltypes`
--

DROP TABLE IF EXISTS `boc_coltypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_coltypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `sort_id` int(11) NOT NULL COMMENT '排序id',
  `fid` int(11) NOT NULL COMMENT '父类型',
  `depth` int(3) NOT NULL COMMENT '深度',
  `cid` int(4) NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `name` varchar(30) NOT NULL DEFAULT 'ctype' COMMENT '表单名称，分类标志，单个栏目多个类型时',
  `title` varchar(30) NOT NULL COMMENT '标题类型',
  `identify` varchar(30) NOT NULL COMMENT '标记',
  `photo` varchar(30) NOT NULL COMMENT '图片',
  `thumb` varchar(200) NOT NULL COMMENT '缩略图',
  `show` int(1) NOT NULL DEFAULT '1' COMMENT '显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_coltypes`
--

LOCK TABLES `boc_coltypes` WRITE;
/*!40000 ALTER TABLE `boc_coltypes` DISABLE KEYS */;
INSERT INTO `boc_coltypes` VALUES (1,1,0,0,1,'ctype','专业线','','19,20','2015/10/28/thumbnail/1445994231921305o5m.png',1),(2,2,0,0,1,'ctype','日化线','','21,22','2015/10/28/thumbnail/1445994391122411igl.png',1),(3,3,0,0,3,'ctype','专业线','','','',1),(4,4,0,0,3,'ctype','日化线','','','',1),(5,5,0,0,4,'ctype','专业线','','23','2015/10/28/thumbnail/1445994406351245eww.png',1),(6,6,0,0,4,'ctype','日化线','','24,25','2015/10/28/thumbnail/144599441628287wbkr.png',1),(7,7,0,0,7,'ctype','专业线','','','',1),(8,8,0,0,7,'ctype','日化线','','','',1),(9,9,0,0,8,'ctype','专业线','','','',1),(10,10,0,0,8,'ctype','日化线','','','',1);
/*!40000 ALTER TABLE `boc_coltypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_columns`
--

DROP TABLE IF EXISTS `boc_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_columns` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `sort_id` int(4) DEFAULT NULL COMMENT '排序',
  `parent_id` int(4) NOT NULL DEFAULT '0' COMMENT '父标识(col id)',
  `depth` int(4) NOT NULL DEFAULT '1' COMMENT '深度',
  `identify` tinytext NOT NULL COMMENT 'url唯一标记(word or link)',
  `path` tinytext NOT NULL COMMENT 'urlpath',
  `title` tinytext NOT NULL COMMENT '标题',
  `title_seo` tinytext COMMENT '优化标题',
  `tags` tinytext COMMENT '标签',
  `intro` text COMMENT '简介',
  `mid` int(2) NOT NULL COMMENT '模型标识(Model id)',
  `temp_index` varchar(50) DEFAULT NULL COMMENT '前台模板栏目index',
  `temp_show` varchar(50) DEFAULT NULL COMMENT '内容展示模板show',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '0删除 1正常',
  `show` int(1) NOT NULL DEFAULT '1' COMMENT '0隐藏 1正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='栏目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_columns`
--

LOCK TABLES `boc_columns` WRITE;
/*!40000 ALTER TABLE `boc_columns` DISABLE KEYS */;
INSERT INTO `boc_columns` VALUES (1,1,0,0,'news','/news','如美资讯','','','',11,'','',1,1),(5,5,0,0,'others','/others','其它','','','',8,'','',1,1),(6,6,5,1,'newsbanner','others/newsbanner','Banner','','','',13,'','',1,1),(4,4,0,0,'journals','/journals','电子杂志','','','',12,'','',1,1),(7,7,6,2,'local','others/newsbanner/local','地方资讯','','','',13,'','',1,1),(8,8,6,2,'global','others/newsbanner/global','全国资讯','','','',13,'','',1,1);
/*!40000 ALTER TABLE `boc_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_configs`
--

DROP TABLE IF EXISTS `boc_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_id` int(11) NOT NULL,
  `category` varchar(30) NOT NULL COMMENT '分类',
  `key` varchar(30) NOT NULL COMMENT '键值',
  `value` tinytext NOT NULL COMMENT '值',
  `label` varchar(100) NOT NULL COMMENT '标题',
  `intor` tinytext COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_configs`
--

LOCK TABLES `boc_configs` WRITE;
/*!40000 ALTER TABLE `boc_configs` DISABLE KEYS */;
INSERT INTO `boc_configs` VALUES (1,1,'adminer','title_suffix','如美APP资讯','标题后缀','后端标题栏显示内容的后缀.'),(2,9,'site','copyright','Copyright 2014','CopyRight','站点版权内容!'),(3,8,'site','email','mail@mail.com','联系邮箱','网站联系人'),(4,4,'site','title_suffix','杭州丽人广告有限公司','公司名称|品牌名称','前台站点标题的后缀优化'),(5,5,'site','title_seo','杭州丽人广告有限公司','首页标题[Title]','网站首页优化标题'),(6,6,'site','tags','杭州 丽人广告','关键词[Keywords]','网站首页关键词设定，使用`,`来间隔标签.'),(7,7,'site','intro','杭州 丽人广告','站点描述[Description]','网站首页描述'),(8,10,'site','icp','ICP','ICP编号',''),(9,9,'adminer','rember_hours','72','记住登录','记住登录的时间，默认单位为小时。'),(15,10,'adminer','nopurview','login,welcome,manager,ajax','权限过滤',''),(10,11,'adminer','forbidden_hours','2','登录禁用','账户登录错误超过6次时的禁用时间[小时]。'),(11,12,'email','stmp','smtp.126.com','STMP服务器',''),(12,13,'email','account','erasin@126.com','帐号','发送帐号'),(13,14,'email','pwd','lastway','密码',''),(14,15,'email','port','25','端口','STMP端口[25]'),(22,12,'email','name','电邮名称','电邮名称','邮件地址显示的名称'),(16,3,'site','title','前端标题 ss','网站标题','用于保存前台站点的默认首页标题'),(17,1,'upload','upload_size','120m','上传大小限制','默认上传权限大小'),(18,2,'upload','inline_file_types','gif|jpe?g|png|doc?|mp?|zip|pdf','上传后缀过滤','文件类型的上传'),(19,3,'upload','memory_limit','120m','内存限制',''),(20,4,'upload','max_file_uploads','10','上传文件个数','个数限制'),(21,5,'upload','scale_width','0','上传图片默认宽度','主要为编辑器上传图片设定'),(23,7,'upload','watermark','0','图片水印','图片使用背景为透明的PNG格式'),(24,0,'html','html','0','开启静态','是否使用静态生成'),(25,0,'html','token','','验证密码','对生成页面操作进行验证,用于第三方触发'),(26,0,'html','urlmodel','0','路由模式','0:ID;1:标题,2:拼音'),(27,6,'upload','scale_height','0','上传图片高度','主要为编辑器上传图片压缩高度');
/*!40000 ALTER TABLE `boc_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_district`
--

DROP TABLE IF EXISTS `boc_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_district` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `entitle` varchar(50) DEFAULT NULL COMMENT '英文标题',
  `show` int(1) DEFAULT '1' COMMENT '显隐',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='地区列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_district`
--

LOCK TABLES `boc_district` WRITE;
/*!40000 ALTER TABLE `boc_district` DISABLE KEYS */;
INSERT INTO `boc_district` VALUES (1,'北京','BeiJing',1),(2,'天津','Tianjin',1),(3,'河北','Hebei',1),(4,'山西','Shanxi',1),(5,'辽宁','Liaoning',1),(6,'吉林','Jilin',1),(7,'上海','Shanghai',1),(8,'江苏','Jiangsu',1),(9,'浙江','Zhejiang',1),(10,'安徽','Anhui',1),(11,'福建','Fujian',1),(12,'江西','Jiangxi',1),(13,'山东','Shandong',1),(14,'河南','Henan',1),(15,'内蒙古','Neimenggu',1),(16,'黑龙江','Heilongjiang',1),(17,'湖北','Hubei',1),(18,'湖南','Hunan',1),(19,'广东','Guangdong',1),(20,'广西','Guangxi',1),(21,'海南','Hainan',1),(22,'四川','Sichuan',1),(23,'重庆','Chongqing',1),(24,'台湾','Taiwan',1),(25,'贵州','Guizhou',1),(26,'云南','Yunnan',1),(27,'西藏','Xizang',1),(28,'陕西','Shanxi',1),(29,'甘肃','Gansu',1),(30,'青海','Qinghai',1),(31,'宁夏','Ningxia',1),(32,'新疆','Xinjiang',1),(33,'香港','xianggang',1),(34,'澳门','aomen',1),(35,'钓鱼岛','Diaoyudao',1);
/*!40000 ALTER TABLE `boc_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_feedback`
--

DROP TABLE IF EXISTS `boc_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_id` int(11) DEFAULT NULL COMMENT '排序编号',
  `audit` int(1) NOT NULL DEFAULT '0' COMMENT '0:1审核',
  `type_id` int(11) DEFAULT NULL COMMENT '分类',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '详细内容',
  `answer` text COMMENT '回答问题',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `fax` varchar(50) CHARACTER SET utf8 COLLATE utf8_estonian_ci DEFAULT NULL COMMENT '传真',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `addr` varchar(100) DEFAULT NULL COMMENT '地址',
  `solve` int(1) DEFAULT '0' COMMENT '解决',
  `show` int(1) DEFAULT NULL COMMENT '是否显示',
  `timeline` int(11) DEFAULT NULL COMMENT '发布时间',
  `timeline_answer` int(11) DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='反馈';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_feedback`
--

LOCK TABLES `boc_feedback` WRITE;
/*!40000 ALTER TABLE `boc_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `boc_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_gallery`
--

DROP TABLE IF EXISTS `boc_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `cid` int(4) NOT NULL COMMENT '栏目标识',
  `ccid` int(11) NOT NULL DEFAULT '0' COMMENT '栏目条目ID伪栏目',
  `sort_id` int(11) NOT NULL COMMENT '排序',
  `audit` int(1) NOT NULL DEFAULT '0' COMMENT '0:1审核',
  `flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:1推荐',
  `ctype` int(4) NOT NULL DEFAULT '0' COMMENT '默认分类',
  `title` tinytext COMMENT '标题',
  `title_seo` tinytext COMMENT '优化标题',
  `tags` tinytext COMMENT '标签',
  `intro` varbinary(500) DEFAULT NULL COMMENT '简介',
  `photo` text COMMENT '图片列表',
  `thumb` text COMMENT '对应压缩图',
  `timeline` int(11) NOT NULL COMMENT '时间线',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='画廊';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_gallery`
--

LOCK TABLES `boc_gallery` WRITE;
/*!40000 ALTER TABLE `boc_gallery` DISABLE KEYS */;
INSERT INTO `boc_gallery` VALUES (1,4,1,1,1,0,0,'2015年9月刊上半期','','','','5,6','2015/10/26/thumbnail/144584585282333wwqr.png',1445845857),(2,4,2,2,1,0,0,'2014年1月刊上半期','','','','7,8,9','2015/10/26/thumbnail/14458470619365ja32o.png',1445847083),(3,4,2,3,1,0,0,'2014年1月刊下半期','','','','10,11,12','2015/10/26/thumbnail/144584710900828lrlz.png',1445847116),(4,4,1,4,1,0,0,'2015年9月刊下半期','','','','13,14','2015/10/26/thumbnail/14458504701754w38yn.png',1445850473),(5,4,3,5,1,0,0,'201501','','','','36,37','2015/10/28/thumbnail/144602024833563cx5q.png',1446020252),(6,4,3,6,1,0,0,'还有一本','','','','38,39,40','2015/10/28/thumbnail/14460202712339u8r4k.png',1446020275),(7,4,5,7,1,0,0,'201501','','','','41,42,43','2015/10/28/thumbnail/1446022913087y9h6d.png',1446022923),(8,4,6,8,1,0,0,'201501','','','','44,45,46,47','2015/10/28/thumbnail/14460229712053xs2w8.png',1446022984),(9,4,5,9,1,0,0,'201502','','','','50,48,49,51','2015/10/28/thumbnail/144602301549180nqqg.png',1446023022),(10,4,3,10,1,0,0,'再来一本','','','','52,53','2015/10/28/thumbnail/14460230563962g3fvn.png',1446023067);
/*!40000 ALTER TABLE `boc_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_honor`
--

DROP TABLE IF EXISTS `boc_honor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_honor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_id` int(11) DEFAULT NULL COMMENT '排序编号',
  `audit` int(1) NOT NULL DEFAULT '0' COMMENT '0:1审核',
  `flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:1推荐',
  `ctype` int(4) NOT NULL DEFAULT '0' COMMENT '默认分类',
  `cid` int(11) NOT NULL COMMENT '所属栏目 columns.id',
  `ccid` int(11) NOT NULL COMMENT '附属栏目id',
  `title` tinytext NOT NULL COMMENT '标题',
  `content` text COMMENT '详细内容',
  `url` tinytext COMMENT 'URL地址',
  `photo` tinytext COMMENT '图片',
  `thumb` tinytext COMMENT '缩略图',
  `show` int(1) DEFAULT '1' COMMENT '是否显示',
  `timeline` int(11) DEFAULT NULL COMMENT '发布日期',
  `title_seo` varchar(250) DEFAULT NULL,
  `tags` varchar(250) DEFAULT NULL,
  `intro` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='荣耀';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_honor`
--

LOCK TABLES `boc_honor` WRITE;
/*!40000 ALTER TABLE `boc_honor` DISABLE KEYS */;
/*!40000 ALTER TABLE `boc_honor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_journals`
--

DROP TABLE IF EXISTS `boc_journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_journals` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号',
  `cid` int(11) NOT NULL COMMENT '所属栏目',
  `ccid` int(11) NOT NULL DEFAULT '0' COMMENT '栏目条目ID伪栏目',
  `sort_id` int(11) DEFAULT '0' COMMENT '排序编号',
  `audit` int(1) NOT NULL DEFAULT '0' COMMENT '0:1审核',
  `flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:1推荐',
  `ctype` int(4) NOT NULL DEFAULT '0' COMMENT '默认分类',
  `type_id` int(4) DEFAULT NULL COMMENT '类型',
  `district_id` int(11) DEFAULT '0',
  `title` tinytext NOT NULL COMMENT '标题',
  `title_seo` tinytext,
  `intro` varchar(500) DEFAULT NULL COMMENT '简介(200汉字)',
  `tags` tinytext COMMENT '标签',
  `content` text COMMENT '内容',
  `timeline` int(11) DEFAULT NULL COMMENT '发布/修改时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '公告过期时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0:1状态,1 发布，0 草稿',
  `author` varchar(50) DEFAULT NULL COMMENT '消息作者',
  `author_url` tinytext COMMENT '作者链接',
  `source` varchar(50) DEFAULT NULL COMMENT '消息来源',
  `source_url` tinytext COMMENT '来源链接',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `recommend` int(1) NOT NULL DEFAULT '0' COMMENT '0:1推荐到分类门户的页面显示',
  `homepage` int(1) NOT NULL DEFAULT '0' COMMENT '0:1推荐到首页显示',
  `recommend_photo` int(1) NOT NULL DEFAULT '0' COMMENT '0:1作为分类栏目的跑马灯图片新闻',
  `homepage_photo` int(1) NOT NULL DEFAULT '0' COMMENT '0:1作为首页的跑马灯图片新闻',
  `color` int(1) NOT NULL DEFAULT '0' COMMENT '突显状态/颜色',
  `photo` tinytext COMMENT '相关图片',
  `thumb` tinytext COMMENT '图片缩略图',
  `attachment` tinytext COMMENT '附件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='杂志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_journals`
--

LOCK TABLES `boc_journals` WRITE;
/*!40000 ALTER TABLE `boc_journals` DISABLE KEYS */;
INSERT INTO `boc_journals` VALUES (2,4,0,5,1,0,6,NULL,9,'如美美容','','  ','','',1445847013,NULL,1,NULL,NULL,NULL,NULL,0,0,0,0,0,0,'','',NULL),(3,4,0,1,1,0,5,NULL,0,'全国报刊','','  ','','',1445850630,NULL,1,NULL,NULL,NULL,NULL,0,0,0,0,0,0,'','',NULL),(4,4,0,4,1,0,5,NULL,9,'测试专业杂志','','  ','',NULL,1445931373,NULL,1,NULL,NULL,NULL,NULL,0,0,0,0,0,0,'','',NULL),(5,4,0,2,1,0,6,NULL,0,'全国日化线期刊','','  ','',NULL,1446022863,NULL,1,NULL,NULL,NULL,NULL,0,0,0,0,0,0,'','',NULL);
/*!40000 ALTER TABLE `boc_journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_links`
--

DROP TABLE IF EXISTS `boc_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_links` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `cid` int(4) NOT NULL COMMENT '栏目 id',
  `ccid` int(11) NOT NULL DEFAULT '0' COMMENT '栏目条目ID伪栏目',
  `sort_id` int(11) DEFAULT NULL COMMENT '排序编号',
  `audit` int(1) NOT NULL DEFAULT '0' COMMENT '0:1审核',
  `flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:1推荐',
  `ctype` int(4) NOT NULL DEFAULT '0' COMMENT '默认分类',
  `title` tinytext NOT NULL COMMENT '标题',
  `content` text COMMENT '详细内容',
  `tip` tinytext COMMENT '鼠标悬停提示',
  `link` tinytext COMMENT 'URL地址',
  `photo` tinytext COMMENT '图片',
  `thumb` tinytext COMMENT '缩略图',
  `show` int(1) DEFAULT '1' COMMENT '是否显示',
  `timeline` int(11) DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_links`
--

LOCK TABLES `boc_links` WRITE;
/*!40000 ALTER TABLE `boc_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `boc_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_lists`
--

DROP TABLE IF EXISTS `boc_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `cid` int(4) NOT NULL COMMENT '栏目 id',
  `ccid` int(11) NOT NULL DEFAULT '0' COMMENT '栏目条目ID伪栏目',
  `sort_id` int(11) NOT NULL COMMENT '排序',
  `audit` int(1) NOT NULL DEFAULT '0' COMMENT '0:1审核',
  `flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:1推荐',
  `ctype` int(4) NOT NULL DEFAULT '0' COMMENT '默认分类',
  `title` tinytext COMMENT '小标题',
  `content` text COMMENT '内容',
  `timeline` int(11) NOT NULL COMMENT '时间线',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='小列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_lists`
--

LOCK TABLES `boc_lists` WRITE;
/*!40000 ALTER TABLE `boc_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `boc_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_log`
--

DROP TABLE IF EXISTS `boc_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controller` varchar(50) NOT NULL,
  `url` mediumtext NOT NULL COMMENT '控制器',
  `category` varchar(50) NOT NULL DEFAULT '' COMMENT '级别: 1 view,2update,add,3,del',
  `message` tinytext NOT NULL COMMENT '备注',
  `mid` int(6) NOT NULL COMMENT '操作人',
  `ip` varchar(20) NOT NULL COMMENT 'IP地址',
  `timeline` int(11) NOT NULL COMMENT '时间线',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COMMENT='操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_log`
--

LOCK TABLES `boc_log` WRITE;
/*!40000 ALTER TABLE `boc_log` DISABLE KEYS */;
INSERT INTO `boc_log` VALUES (17,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php?','login','manager ID 1: 登录成功！',1,'0.0.0.0',1445831459),(18,'modules','/rumeinews/bocadmin/index.php/modules/create','create','添加数据id:11',1,'0.0.0.0',1445831636),(19,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php/news/index/1?','login','manager ID 1: 登录成功！',1,'0.0.0.0',1445832503),(20,'coltypes','/rumeinews/bocadmin/index.php/coltypes/create?cid=1&field=ctype&rc=news','create','添加数据id:1',1,'0.0.0.0',1445832749),(21,'coltypes','/rumeinews/bocadmin/index.php/coltypes/create/?cid=1&field=ctype&rc=news','create','添加数据id:2',1,'0.0.0.0',1445832758),(22,'columns','/rumeinews/bocadmin/index.php/columns/edit/1','update','更新数据id:1',1,'0.0.0.0',1445832804),(23,'columns','/rumeinews/bocadmin/index.php/columns/edit/2','update','更新数据id:2',1,'0.0.0.0',1445832853),(24,'columns','/rumeinews/bocadmin/index.php/columns/edit/1','update','更新数据id:1',1,'0.0.0.0',1445832865),(25,'coltypes','/rumeinews/bocadmin/index.php/coltypes/create?cid=3&field=ctype&rc=news','create','添加数据id:3',1,'0.0.0.0',1445837923),(26,'coltypes','/rumeinews/bocadmin/index.php/coltypes/create/?cid=3&field=ctype&rc=news','create','添加数据id:4',1,'0.0.0.0',1445837931),(27,'news','/rumeinews/bocadmin/index.php/news/create?c=1','create','添加数据id:1',1,'0.0.0.0',1445838343),(28,'news','/rumeinews/bocadmin/index.php/news/create/?c=1','create','添加数据id:2',1,'0.0.0.0',1445838359),(29,'news','/rumeinews/bocadmin/index.php/news/create/?c=1','create','添加数据id:3',1,'0.0.0.0',1445838373),(30,'news','/rumeinews/bocadmin/index.php/news/audit?c=1','audit','审核数据ID：3为1',1,'0.0.0.0',1445838378),(31,'news','/rumeinews/bocadmin/index.php/news/audit?c=1','audit','审核数据ID：2为1',1,'0.0.0.0',1445838378),(32,'news','/rumeinews/bocadmin/index.php/news/audit?c=1','audit','审核数据ID：1为1',1,'0.0.0.0',1445838379),(33,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php/news/index?c=1','login','manager ID 1: 登录成功！',1,'0.0.0.0',1445838550),(34,'news','/rumeinews/bocadmin/index.php/news/flag?c=1','flag','推荐数据ID：12为1',1,'0.0.0.0',1445838589),(35,'news','/rumeinews/bocadmin/index.php/news/flag?c=1','flag','推荐数据ID：11为1',1,'0.0.0.0',1445838590),(36,'news','/rumeinews/bocadmin/index.php/news/flag?c=1','flag','推荐数据ID：10为1',1,'0.0.0.0',1445838590),(37,'news','/rumeinews/bocadmin/index.php/news/flag?c=1','flag','推荐数据ID：9为1',1,'0.0.0.0',1445838591),(38,'news','/rumeinews/bocadmin/index.php/news/flag?c=1','flag','推荐数据ID：8为1',1,'0.0.0.0',1445838591),(39,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php/news/index/3?','login','manager ID 1: 登录成功！',1,'0.0.0.0',1445840086),(40,'modules','/rumeinews/bocadmin/index.php/modules/create','create','添加数据id:12',1,'0.0.0.0',1445845134),(41,'columns','/rumeinews/bocadmin/index.php/columns/edit/4','update','更新数据id:4',1,'0.0.0.0',1445845142),(42,'modules','/rumeinews/bocadmin/index.php/modules/sortid?ids=11%2C9%2C7%2C8%2C1%2C3%2C6%2C10%2C12&sort=5%2C4%2C3%2C1%2C0%2C0%2C0%2C0%2C6&sortby=desc','sort','对数据排序:ID: [11,9,7,8,1,3,6,10,12]顺序改为[6,5,4,3,1,0,0,0,0]',1,'0.0.0.0',1445845149),(43,'modules','/rumeinews/bocadmin/index.php/modules/sortid?ids=9%2C7%2C8%2C1%2C3%2C6%2C10%2C12%2C11&sort=4%2C3%2C1%2C0%2C0%2C0%2C0%2C6%2C5&sortby=desc','sort','对数据排序:ID: [9,7,8,1,3,6,10,12,11]顺序改为[6,5,4,3,1,0,0,0,0]',1,'0.0.0.0',1445845150),(44,'coltypes','/rumeinews/bocadmin/index.php/coltypes/create?cid=4&field=ctype&rc=journals','create','添加数据id:5',1,'0.0.0.0',1445845264),(45,'coltypes','/rumeinews/bocadmin/index.php/coltypes/create/?cid=4&field=ctype&rc=journals','create','添加数据id:6',1,'0.0.0.0',1445845272),(46,'journals','/rumeinews/bocadmin/index.php/journals/create?c=4','create','添加数据id:1',1,'0.0.0.0',1445845348),(47,'journals','/rumeinews/bocadmin/index.php/journals/audit?c=4','audit','审核数据ID：1为1',1,'0.0.0.0',1445845353),(48,'gallery','/rumeinews/bocadmin/index.php/gallery/create?c=4&cc=1','create','添加数据id:1',1,'0.0.0.0',1445845783),(49,'journals','/rumeinews/bocadmin/index.php/journals/edit/1?c=4','update','更新数据id:1',1,'0.0.0.0',1445845820),(50,'gallery','/rumeinews/bocadmin/index.php/gallery/audit?c=4&cc=1','audit','审核数据ID：1为1',1,'0.0.0.0',1445845843),(51,'gallery','/rumeinews/bocadmin/index.php/gallery/edit/1?c=4&cc=1','update','更新数据id:1',1,'0.0.0.0',1445845857),(52,'journals','/rumeinews/bocadmin/index.php/journals/create?c=4','create','添加数据id:2',1,'0.0.0.0',1445847037),(53,'gallery','/rumeinews/bocadmin/index.php/gallery/create?c=4&cc=2','create','添加数据id:2',1,'0.0.0.0',1445847083),(54,'gallery','/rumeinews/bocadmin/index.php/gallery/audit?c=4&cc=2','audit','审核数据ID：2为1',1,'0.0.0.0',1445847088),(55,'gallery','/rumeinews/bocadmin/index.php/gallery/create?c=4&cc=2','create','添加数据id:3',1,'0.0.0.0',1445847116),(56,'gallery','/rumeinews/bocadmin/index.php/gallery/audit?c=4&cc=2','audit','审核数据ID：3为1',1,'0.0.0.0',1445847121),(57,'journals','/rumeinews/bocadmin/index.php/journals/audit?c=4','audit','审核数据ID：2为1',1,'0.0.0.0',1445847135),(58,'journals','/rumeinews/bocadmin/index.php/journals/edit/1?c=4','update','更新数据id:1',1,'0.0.0.0',1445847491),(59,'journals','/rumeinews/bocadmin/index.php/journals/edit/2?c=4','update','更新数据id:2',1,'0.0.0.0',1445848617),(60,'gallery','/rumeinews/bocadmin/index.php/gallery/create?c=4&cc=1','create','添加数据id:4',1,'0.0.0.0',1445850473),(61,'gallery','/rumeinews/bocadmin/index.php/gallery/audit?c=4&cc=1','audit','审核数据ID：4为1',1,'0.0.0.0',1445850477),(62,'journals','/rumeinews/bocadmin/index.php/journals/create?c=4','create','添加数据id:3',1,'0.0.0.0',1445850644),(63,'journals','/rumeinews/bocadmin/index.php/journals/audit?c=4','audit','审核数据ID：3为1',1,'0.0.0.0',1445850648),(64,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php/journals/edit/3?c=4','login','manager ID 1: 登录成功！',1,'0.0.0.0',1445862641),(65,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1445907284),(66,'columns','/rumeinews/bocadmin/index.php/columns/edit/1','update','更新数据id:1',1,'121.41.128.239',1445907389),(67,'columns','/rumeinews/bocadmin/index.php/columns/delete?ids=3','delete','删除数据id:3',1,'121.41.128.239',1445907434),(68,'columns','/rumeinews/bocadmin/index.php/columns/delete?ids=2','delete','删除数据id:2',1,'121.41.128.239',1445907446),(69,'columns','/rumeinews/bocadmin/index.php/columns/edit/1','update','更新数据id:1',1,'121.41.128.239',1445907459),(70,'news','/rumeinews/bocadmin/index.php/news/create?c=1','create','添加数据id:13',1,'121.41.128.239',1445907545),(71,'news','/rumeinews/bocadmin/index.php/news/create/?c=1','create','添加数据id:14',1,'121.41.128.239',1445907563),(72,'news','/rumeinews/bocadmin/index.php/news/audit?c=1','audit','审核数据ID：14为1',1,'121.41.128.239',1445907572),(73,'news','/rumeinews/bocadmin/index.php/news/audit?c=1','audit','审核数据ID：13为1',1,'121.41.128.239',1445907572),(74,'journals','/rumeinews/bocadmin/index.php/journals/edit/2?c=4','update','更新数据id:2',1,'121.41.128.239',1445910771),(75,'journals','/rumeinews/bocadmin/index.php/journals/edit/3?c=4','update','更新数据id:3',1,'121.41.128.239',1445910785),(76,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php/news/index/1?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1445927681),(77,'news','/rumeinews/bocadmin/index.php/news/edit/12?c=1','update','更新数据id:12',1,'121.41.128.239',1445928767),(78,'journals','/rumeinews/bocadmin/index.php/journals/create?c=4','create','添加数据id:4',1,'121.41.128.239',1445931392),(79,'journals','/rumeinews/bocadmin/index.php/journals/audit?c=4&ctype=5','audit','审核数据ID：4为1',1,'121.41.128.239',1445931414),(80,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1445942857),(81,'modules','/rumeinews/bocadmin/index.php/modules/create','create','添加数据id:13',1,'121.41.128.239',1445943103),(82,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php/news/index/1?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1445943196),(83,'banner','/rumeinews/bocadmin/index.php/banner/create?c=6','create','添加数据id:1',1,'121.41.128.239',1445943329),(84,'banner','/rumeinews/bocadmin/index.php/banner/create/?c=6','create','添加数据id:2',1,'121.41.128.239',1445943339),(85,'banner','/rumeinews/bocadmin/index.php/banner/audit?c=6','audit','审核数据ID：2为1',1,'121.41.128.239',1445943441),(86,'banner','/rumeinews/bocadmin/index.php/banner/audit?c=6','audit','审核数据ID：1为1',1,'121.41.128.239',1445943442),(87,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php/news/index/1?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1445943890),(88,'configs','/rumeinews/bocadmin/index.php/configs/set','edit','修改配置adminer.title_suffix:如美APP资讯',1,'121.41.128.239',1445943909),(89,'configs','/rumeinews/bocadmin/index.php/configs/set','edit','修改配置site.title_suffix:如美APP资讯',1,'121.41.128.239',1445944030),(90,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1445993450),(91,'upload','/rumeinews/bocadmin/index.php/upload/delete','delete','删除文件ID:17',1,'121.41.128.239',1445994138),(92,'coltypes','/rumeinews/bocadmin/index.php/coltypes/edit/1?cid=1&field=ctype&rc=news','update','更新数据id:1',1,'121.41.128.239',1445994140),(93,'upload','/rumeinews/bocadmin/index.php/upload/delete','delete','删除文件ID:18',1,'121.41.128.239',1445994233),(94,'coltypes','/rumeinews/bocadmin/index.php/coltypes/edit/1?cid=1&field=ctype&rc=news','update','更新数据id:1',1,'121.41.128.239',1445994234),(95,'coltypes','/rumeinews/bocadmin/index.php/coltypes/edit/1?cid=1&field=ctype&rc=news','update','更新数据id:1',1,'121.41.128.239',1445994315),(96,'coltypes','/rumeinews/bocadmin/index.php/coltypes/edit/2?cid=1&field=ctype&rc=news','update','更新数据id:2',1,'121.41.128.239',1445994396),(97,'coltypes','/rumeinews/bocadmin/index.php/coltypes/edit/5?cid=4&field=ctype&rc=journals','update','更新数据id:5',1,'121.41.128.239',1445994408),(98,'coltypes','/rumeinews/bocadmin/index.php/coltypes/edit/6?cid=4&field=ctype&rc=journals','update','更新数据id:6',1,'121.41.128.239',1445994420),(99,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php/journals/index/4?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1446004334),(100,'news','/rumeinews/bocadmin/index.php/news/edit/14?c=1','update','更新数据id:14',1,'121.41.128.239',1446004358),(101,'news','/rumeinews/bocadmin/index.php/news/edit/13?c=1','update','更新数据id:13',1,'121.41.128.239',1446004369),(102,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1446013559),(103,'columns','/rumeinews/bocadmin/index.php/columns/edit/6','update','更新数据id:6',1,'121.41.128.239',1446013622),(104,'coltypes','/rumeinews/bocadmin/index.php/coltypes/create?cid=7&field=ctype&rc=banner','create','添加数据id:7',1,'121.41.128.239',1446013672),(105,'coltypes','/rumeinews/bocadmin/index.php/coltypes/create/?cid=7&field=ctype&rc=banner','create','添加数据id:8',1,'121.41.128.239',1446013677),(106,'coltypes','/rumeinews/bocadmin/index.php/coltypes/create?cid=8&field=ctype&rc=banner','create','添加数据id:9',1,'121.41.128.239',1446013689),(107,'coltypes','/rumeinews/bocadmin/index.php/coltypes/create/?cid=8&field=ctype&rc=banner','create','添加数据id:10',1,'121.41.128.239',1446013695),(108,'banner','/rumeinews/bocadmin/index.php/banner/create?c=7','create','添加数据id:3',1,'121.41.128.239',1446013709),(109,'banner','/rumeinews/bocadmin/index.php/banner/create/?c=7','create','添加数据id:4',1,'121.41.128.239',1446013719),(110,'banner','/rumeinews/bocadmin/index.php/banner/create/?c=7','create','添加数据id:5',1,'121.41.128.239',1446013730),(111,'banner','/rumeinews/bocadmin/index.php/banner/create/?c=7','create','添加数据id:6',1,'121.41.128.239',1446013740),(112,'banner','/rumeinews/bocadmin/index.php/banner/create?c=8','create','添加数据id:7',1,'121.41.128.239',1446013753),(113,'banner','/rumeinews/bocadmin/index.php/banner/create/?c=8','create','添加数据id:8',1,'121.41.128.239',1446013763),(114,'banner','/rumeinews/bocadmin/index.php/banner/create?c=8','create','添加数据id:9',1,'121.41.128.239',1446013774),(115,'banner','/rumeinews/bocadmin/index.php/banner/create/?c=8','create','添加数据id:10',1,'121.41.128.239',1446013783),(116,'banner','/rumeinews/bocadmin/index.php/banner/audit?c=8','audit','审核数据ID：10为1',1,'121.41.128.239',1446013786),(117,'banner','/rumeinews/bocadmin/index.php/banner/audit?c=8','audit','审核数据ID：9为1',1,'121.41.128.239',1446013787),(118,'banner','/rumeinews/bocadmin/index.php/banner/audit?c=8','audit','审核数据ID：8为1',1,'121.41.128.239',1446013788),(119,'banner','/rumeinews/bocadmin/index.php/banner/audit?c=8','audit','审核数据ID：7为1',1,'121.41.128.239',1446013788),(120,'banner','/rumeinews/bocadmin/index.php/banner/audit?c=7','audit','审核数据ID：6为1',1,'121.41.128.239',1446013793),(121,'banner','/rumeinews/bocadmin/index.php/banner/audit?c=7','audit','审核数据ID：5为1',1,'121.41.128.239',1446013793),(122,'banner','/rumeinews/bocadmin/index.php/banner/audit?c=7','audit','审核数据ID：4为1',1,'121.41.128.239',1446013794),(123,'banner','/rumeinews/bocadmin/index.php/banner/audit?c=7','audit','审核数据ID：3为1',1,'121.41.128.239',1446013794),(124,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php/news/index/1?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1446014700),(125,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1446020231),(126,'gallery','/rumeinews/bocadmin/index.php/gallery/create?c=4&cc=3','create','添加数据id:5',1,'121.41.128.239',1446020252),(127,'gallery','/rumeinews/bocadmin/index.php/gallery/create?c=4&cc=3','create','添加数据id:6',1,'121.41.128.239',1446020275),(128,'gallery','/rumeinews/bocadmin/index.php/gallery/audit?c=4&cc=3','audit','审核数据ID：5为1',1,'121.41.128.239',1446020280),(129,'gallery','/rumeinews/bocadmin/index.php/gallery/audit?c=4&cc=3','audit','审核数据ID：6为1',1,'121.41.128.239',1446020283),(130,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1446022834),(131,'journals','/rumeinews/bocadmin/index.php/journals/create?c=4','create','添加数据id:5',1,'121.41.128.239',1446022876),(132,'gallery','/rumeinews/bocadmin/index.php/gallery/create?c=4&cc=5','create','添加数据id:7',1,'121.41.128.239',1446022923),(133,'gallery','/rumeinews/bocadmin/index.php/gallery/audit?c=4&cc=5','audit','审核数据ID：7为1',1,'121.41.128.239',1446022934),(134,'journals','/rumeinews/bocadmin/index.php/journals/audit?c=4','audit','审核数据ID：5为1',1,'121.41.128.239',1446022938),(135,'journals','/rumeinews/bocadmin/index.php/journals/create?c=4','create','添加数据id:6',1,'121.41.128.239',1446022955),(136,'gallery','/rumeinews/bocadmin/index.php/gallery/create?c=4&cc=6','create','添加数据id:8',1,'121.41.128.239',1446022984),(137,'gallery','/rumeinews/bocadmin/index.php/gallery/audit?c=4&cc=6','audit','审核数据ID：8为1',1,'121.41.128.239',1446022988),(138,'journals','/rumeinews/bocadmin/index.php/journals/audit?c=4','audit','审核数据ID：6为1',1,'121.41.128.239',1446022994),(139,'journals','/rumeinews/bocadmin/index.php/journals/delete?c=4&ids=6','delete','删除数据id:6',1,'121.41.128.239',1446022999),(140,'gallery','/rumeinews/bocadmin/index.php/gallery/create?c=4&cc=5','create','添加数据id:9',1,'121.41.128.239',1446023022),(141,'gallery','/rumeinews/bocadmin/index.php/gallery/audit?c=4&cc=5','audit','审核数据ID：9为1',1,'121.41.128.239',1446023027),(142,'gallery','/rumeinews/bocadmin/index.php/gallery/create?c=4&cc=3','create','添加数据id:10',1,'121.41.128.239',1446023067),(143,'gallery','/rumeinews/bocadmin/index.php/gallery/audit?c=4&cc=3','audit','审核数据ID：10为1',1,'121.41.128.239',1446023079),(144,'journals','/rumeinews/bocadmin/index.php/journals/sortid?c=4&ids=4%2C5%2C3%2C2%2C1&sort=4%2C5%2C3%2C2%2C1&sortby=desc','sort','对数据排序:ID: [4,5,3,2,1]顺序改为[5,4,3,2,1]',1,'121.41.128.239',1446023204),(145,'journals','/rumeinews/bocadmin/index.php/journals/sortid?c=4&ids=2%2C4%2C5%2C3%2C1&sort=2%2C4%2C5%2C3%2C1&sortby=desc','sort','对数据排序:ID: [2,4,5,3,1]顺序改为[5,4,3,2,1]',1,'121.41.128.239',1446023207),(146,'journals','/rumeinews/bocadmin/index.php/journals/sortid?c=4&ids=2%2C4%2C1%2C5%2C3&sort=5%2C4%2C1%2C3%2C2&sortby=desc','sort','对数据排序:ID: [2,4,1,5,3]顺序改为[5,4,3,2,1]',1,'121.41.128.239',1446023501),(147,'journals','/rumeinews/bocadmin/index.php/journals/delete?c=4&ids=1','delete','删除数据id:1',1,'121.41.128.239',1446023515),(148,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1446023896),(149,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1446186498),(150,'news','/rumeinews/bocadmin/index.php/news/edit/14?c=1','update','更新数据id:14',1,'121.41.128.239',1446186512),(151,'news','/rumeinews/bocadmin/index.php/news/edit/14?c=1','update','更新数据id:14',1,'121.41.128.239',1446186567),(152,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php/news/index/1?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1446186837),(153,'news','/rumeinews/bocadmin/index.php/news/flag?c=1','flag','推荐数据ID：14为1',1,'121.41.128.239',1446186856),(154,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1446188459),(155,'news','/rumeinews/bocadmin/index.php/news/edit/14?c=1','update','更新数据id:14',1,'121.41.128.239',1446188475),(156,'news','/rumeinews/bocadmin/index.php/news/edit/12?c=1','update','更新数据id:12',1,'121.41.128.239',1446188493),(157,'news','/rumeinews/bocadmin/index.php/news/edit/14?c=1','update','更新数据id:14',1,'121.41.128.239',1446188545),(158,'news','/rumeinews/bocadmin/index.php/news/edit/12?c=1','update','更新数据id:12',1,'121.41.128.239',1446188572),(159,'configs','/rumeinews/bocadmin/index.php/configs/set','edit','修改配置site.title_suffix:杭州丽人广告有限公司',1,'121.41.128.239',1446188630),(160,'configs','/rumeinews/bocadmin/index.php/configs/set','edit','修改配置site.title_seo:杭州丽人广告有限公司',1,'121.41.128.239',1446188633),(161,'configs','/rumeinews/bocadmin/index.php/configs/set','edit','修改配置site.tags:杭州 丽人广告',1,'121.41.128.239',1446188643),(162,'configs','/rumeinews/bocadmin/index.php/configs/set','edit','修改配置site.intro:杭州 丽人广告',1,'121.41.128.239',1446188649),(163,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1446606123),(164,'banner','/rumeinews/bocadmin/index.php/banner/edit/6?c=7','update','更新数据id:6',1,'121.41.128.239',1446606442),(165,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php/news/index/1?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1446607611),(166,'upload','/rumeinews/bocadmin/index.php/upload/delete','delete','删除文件ID:26',1,'121.41.128.239',1446607623),(167,'news','/rumeinews/bocadmin/index.php/news/edit/14?c=1','update','更新数据id:14',1,'121.41.128.239',1446607626),(168,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php?','login','manager ID 1: 登录成功！',1,'121.41.128.239',1446632197),(169,'login','/rumeinews/bocadmin/index.php/login?url=http://121.41.128.239:8080/rumeinews/bocadmin/index.php?','login','manager ID 1: 登录成功！',1,'192.168.0.121',1446690363),(170,'news','/rumeinews/bocadmin/index.php/news/create?c=1','create','添加数据id:15',1,'192.168.0.121',1446690408),(171,'news','/rumeinews/bocadmin/index.php/news/create?c=1','create','添加数据id:16',1,'192.168.0.121',1446690409),(172,'news','/rumeinews/bocadmin/index.php/news/audit?c=1','audit','审核数据ID：15为1',1,'192.168.0.121',1446690416),(173,'news','/rumeinews/bocadmin/index.php/news/audit?c=1','audit','审核数据ID：16为1',1,'192.168.0.121',1446690419);
/*!40000 ALTER TABLE `boc_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_manager`
--

DROP TABLE IF EXISTS `boc_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_manager` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) NOT NULL COMMENT '用户名',
  `nickname` varchar(50) DEFAULT NULL COMMENT '显示名称',
  `pwd` varchar(64) NOT NULL COMMENT '密码',
  `gid` varchar(64) NOT NULL DEFAULT '2' COMMENT '用户组ID',
  `email` varchar(100) NOT NULL COMMENT 'email',
  `tel` varchar(30) DEFAULT NULL COMMENT '电话',
  `phone` varchar(30) DEFAULT NULL COMMENT '手机',
  `addr` varchar(100) DEFAULT NULL COMMENT '地址',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '用户状态，0 禁用',
  `login_today` int(11) DEFAULT NULL COMMENT '今日登录次数',
  `pwd_errors` int(1) NOT NULL DEFAULT '0' COMMENT '密码错误次数',
  `login_ip` varchar(25) DEFAULT NULL COMMENT '最后登录的IP',
  `reg_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `login_time` int(11) DEFAULT NULL COMMENT '最后一次登录时间',
  `ga` int(1) DEFAULT '0' COMMENT 'GA 两部验证密钥 开启与否',
  `getpass` int(11) DEFAULT NULL COMMENT '获取密码时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后端管理帐号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_manager`
--

LOCK TABLES `boc_manager` WRITE;
/*!40000 ALTER TABLE `boc_manager` DISABLE KEYS */;
INSERT INTO `boc_manager` VALUES (1,'bocadmin','超级用户','11372a6e7343831f12352cfd049ff59c','1','customservice@bocweb.cn','','','',1,0,0,'192.168.0.121',1376471117,1446690363,1,1389317880);
/*!40000 ALTER TABLE `boc_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_manager_group`
--

DROP TABLE IF EXISTS `boc_manager_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_manager_group` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `purview` text NOT NULL COMMENT '权限id序列',
  `title` varchar(50) NOT NULL COMMENT '用户组名称',
  `title_en` varchar(50) NOT NULL COMMENT '用户组名称en',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='权限组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_manager_group`
--

LOCK TABLES `boc_manager_group` WRITE;
/*!40000 ALTER TABLE `boc_manager_group` DISABLE KEYS */;
INSERT INTO `boc_manager_group` VALUES (2,'7afb566e83d3dca2d8a47c8cc29e7e36,ff2fa0336fe8fbc6a51c4707aa47c3e3,a155574e57e9a8a0d0c6ecb1c511da68,fddc215a132fa97ca3c193f1cae5cf9f,c54e594684ebf2862c75ba29d83f71be,2ebbbd65b4e2fc52a3ce44de2160e8d2,12fb6543af2e5541b0fc4f8fdd950be0,8d2159c1e0cf70473e66866eb026e80f,c166381208e23d3f4d65dec1231ccf76,a87d77b65f6d1e8380b3d05290a994d0,430f99bc176c67ec705091d6a5da07d4,d230f6a24270b02237beb82a23e2742f,54b064097df1ab924354f87efcdc4ea0,2338d4221db8f9c52bcc2d64ee436b23,70fc54e47310e38ef19160c17ecd91af,ad92c9d2ad1d512ea852e8ae88f762ff,d0101b9aa277c72e45d078dd8369fc65','用户','users'),(3,'4115dd2b6affc9e3626c695e398f335a,7afb566e83d3dca2d8a47c8cc29e7e36,ff2fa0336fe8fbc6a51c4707aa47c3e3,bfc0ef3829e8d84dfc8d31e5edc26d0f,a155574e57e9a8a0d0c6ecb1c511da68,fddc215a132fa97ca3c193f1cae5cf9f,7d5101dc315695e13463ffdf708b5865,a2756c433a39a2319e61bcd68a758265,5341fd0c5de128ab7979a7414b2e586a,e537f9c0308cbfeb6ee40b4e4c344947,35845fea21044129353364ba21f144a0,efdb91a0f150375b423d8361d254241f,a3c8c3d444880bda2a553b8f3eb6695b,4141c0f8e6a977cd7048cd9d751af350,bbff3957029793ef5163df61fbe018a5,dbc10e6bbc54c0ea6f49e604839f5526,048c50d364a23dfcec0a87aa49e19eb8,c54e594684ebf2862c75ba29d83f71be,3345e3e48188396dc21242fb119ba6b1,a93b06daaedb7fd811ab57131fabc630,af47d02385ccc820bce012061718aff8,78b231e4efafea1d14789b0ad8941cf2,bef23131580195c4a411d4222ef68c9f,214ea1a7fecff45a8447cea07943d068','访客','guest'),(1,'a634cc19664a4f86577556784da60940,7afb566e83d3dca2d8a47c8cc29e7e36,ff2fa0336fe8fbc6a51c4707aa47c3e3,bfc0ef3829e8d84dfc8d31e5edc26d0f,a155574e57e9a8a0d0c6ecb1c511da68,fddc215a132fa97ca3c193f1cae5cf9f,52b7869014f743535798ba509432feb1,a2756c433a39a2319e61bcd68a758265,5341fd0c5de128ab7979a7414b2e586a,e537f9c0308cbfeb6ee40b4e4c344947,c2bc4d65c38311ab74b9dc39680d82df,efdb91a0f150375b423d8361d254241f,a3c8c3d444880bda2a553b8f3eb6695b,4141c0f8e6a977cd7048cd9d751af350,3045880458ee8b8734bf6b3307acd0d5,dbc10e6bbc54c0ea6f49e604839f5526,048c50d364a23dfcec0a87aa49e19eb8,c54e594684ebf2862c75ba29d83f71be,3345e3e48188396dc21242fb119ba6b1,2ebbbd65b4e2fc52a3ce44de2160e8d2,12fb6543af2e5541b0fc4f8fdd950be0,8d2159c1e0cf70473e66866eb026e80f,c166381208e23d3f4d65dec1231ccf76,3025704bb00b809798194964bccb8d3d,60decd16ccd83e013261697b7cc93bc6,7847598074d20e5abc220cb05a606213,afef320193ab13431e6b085c847b8094,9b4b25e0ea18183e9b085cc116246220,2e0115348725a3f383d8daa4354c7c3a,524c66aa98b226bd78bc7e7ad0423de7,66bfe11515e892dbf8bb4a5a92792e8b,50b03d671787f35800682c10c90a75bf,a1873764d0aa66fa9c6d34e16dcc86c2,0e69c6f28f25c24fe241da13093f9b12,6d119f7ae0c3c090ed51e672203c000f,7ff25ae6e8120b5ae5b5fb7b86a11641,53a396649c27c4e0dbd96fe57c2377e9,f59d0f67b7223a083e4449d583e90307,a41e16b61dd21e98c8143409d807890b,e44bd2f89f2820521a93c981c8af920d,f729102b0a0a547d20a4322e2d12cf71,7cf04cb70fa2f26d449acfb7974fd417,a7cd680c1676df4fdb93e7bdd83d6b3c,5f667ab7322f039e4e7e0ba8b04edf2f,6470d2304686b20640688c6d9dc44b46,df53f98d0b09ef3173cc8d594671fa6f,051071e245077a8126a4607e2148f327,224a58fde770d8718f7c06ac852fd9ae,0309718bf1a4785dcbf1e34461213c3e,d174c0a461db66945abcd861216dd94a,494b71b75af1e63c628544872f3c54d4,454f6e4ce4e57bd58eefda7d3fea1fa5,a87d77b65f6d1e8380b3d05290a994d0,430f99bc176c67ec705091d6a5da07d4,d230f6a24270b02237beb82a23e2742f,e5ba15d009798276692f84b4e0c9c1e9,026e09db119a340d72c2d5a611dfedb1,33a3ca4433131ad797eb4a7ff8bdb40b,87f64ed3bd52c1d6396fcb9908cb7fdf','管理员','root');
/*!40000 ALTER TABLE `boc_manager_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_manager_purview`
--

DROP TABLE IF EXISTS `boc_manager_purview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_manager_purview` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `model` varchar(30) NOT NULL COMMENT '控制模型',
  `method` varchar(30) NOT NULL COMMENT '控制函数',
  `cid` varchar(30) DEFAULT NULL COMMENT 'column id 参数',
  `uri` varchar(64) NOT NULL COMMENT '权限地址md5(model/method)',
  `title` varchar(50) NOT NULL COMMENT '权限名称',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '是否使用权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=495 DEFAULT CHARSET=utf8 COMMENT='用户组权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_manager_purview`
--

LOCK TABLES `boc_manager_purview` WRITE;
/*!40000 ALTER TABLE `boc_manager_purview` DISABLE KEYS */;
INSERT INTO `boc_manager_purview` VALUES (313,'configs','index','','fddc215a132fa97ca3c193f1cae5cf9f','配置查看',1),(314,'configs','set','','a155574e57e9a8a0d0c6ecb1c511da68','配置修改',1),(315,'columns','index','','bfc0ef3829e8d84dfc8d31e5edc26d0f','栏目列表',1),(316,'columns','create','','ff2fa0336fe8fbc6a51c4707aa47c3e3','栏目添加',1),(317,'columns','edit','','7afb566e83d3dca2d8a47c8cc29e7e36','栏目修改',1),(318,'columns','delete','','4115dd2b6affc9e3626c695e398f335a','栏目删除',1),(319,'modules','index','','c54e594684ebf2862c75ba29d83f71be','模型查看',1),(320,'modules','create','','048c50d364a23dfcec0a87aa49e19eb8','模型添加',1),(321,'modules','edit','','dbc10e6bbc54c0ea6f49e604839f5526','模型修改',1),(322,'modules','delete','','bbff3957029793ef5163df61fbe018a5','删除模型',1),(323,'manager_purview','index','','4141c0f8e6a977cd7048cd9d751af350','权限管理',1),(324,'manager_purview','create','','a3c8c3d444880bda2a553b8f3eb6695b','权限添加',1),(325,'manager_purview','edit','','efdb91a0f150375b423d8361d254241f','权限修改',1),(326,'manager_purview','delete','','35845fea21044129353364ba21f144a0','权限删除',1),(327,'manager_group','index','','e537f9c0308cbfeb6ee40b4e4c344947','用户组查看',1),(328,'manager_group','create','','5341fd0c5de128ab7979a7414b2e586a','用户组添加',1),(329,'manager_group','edit','','a2756c433a39a2319e61bcd68a758265','用户组修改',1),(330,'manager_group','delete','','7d5101dc315695e13463ffdf708b5865','用户组删除',1),(334,'upload','uploado','','3345e3e48188396dc21242fb119ba6b1','上传',0),(455,'news','index','1','972b18dc8694b87b5d666d28356d8a25','查看',0),(456,'news','create','1','8fd3abbabe3ef8c53b1df9c82be96e1e','创建',1),(457,'news','edit','1','bb82b0191c904a7af92b3cc7567c1e48','编辑',1),(458,'news','delete','1','c10f6faa4aae7e8e4dacad2fd41567da','删除',1),(459,'news','audit','1','f7d6e6c7c390f7b2cd3d730d94461d9e','审核',1),(460,'news','index','2','3f5ff69774b599887e202a20232c6167','查看',0),(461,'news','create','2','3ccc32e6d7c2a7d78838cbd2294459be','创建',1),(462,'news','edit','2','6550adf1133732ec9f4d64310907d806','编辑',1),(463,'news','delete','2','f50f440c6f065a931f2e3c6fbe6d5bd4','删除',1),(464,'news','audit','2','ce38ad39a8f0a6c41526aaa73ca8e191','审核',1),(465,'news','index','3','85c7392c26ee49426ba346f84db2f976','查看',0),(466,'news','create','3','0d0845cbec71f7cef3882481438300f4','创建',1),(467,'news','edit','3','9250ada41b1c5ae59c2dab3f5ae26882','编辑',1),(468,'news','delete','3','1f6ea35adf2bc5a339c6ab017fc9621d','删除',1),(469,'news','audit','3','4d95226d653f76296a745be4bf8ff414','审核',1),(470,'news','index','4','c3db764450d6e669f56241856cb58861','查看',0),(471,'news','create','4','80daf38484d86062bb9a290023319fbb','创建',1),(472,'news','edit','4','245f9ab09243f27816a1db34510dd15b','编辑',1),(473,'news','delete','4','162796b564b51b0a9c0fd86a628ee11f','删除',1),(474,'news','audit','4','489d579e055d681e2c1da858ce27eef0','审核',1),(475,'page','index','5','de1e78874b11fd301c52907f65716491','查看',0),(476,'page','create','5','f6b8687e6ce63122b566f9fa3f6ac159','创建',1),(477,'page','edit','5','f03bed106b7b007eeb8ccbbf23626600','编辑',1),(478,'page','delete','5','8e2a937ecea85f468bc7821b3b5c2fd9','删除',1),(479,'page','audit','5','6dbebe685fc6a70124bbc26955aaa587','审核',1),(480,'banner','index','6','0afb70f8b3e48a91a7736da99bdbbc73','查看',0),(481,'banner','create','6','ce1da05708408e6ffe2944e1cb95a203','创建',1),(482,'banner','edit','6','74fd403aa230f2e865fb45a0abf94bec','编辑',1),(483,'banner','delete','6','57793661eadd4094b363e8d18cd2293d','删除',1),(484,'banner','audit','6','c0989e9c94516529b23867bb3faee634','审核',1),(485,'banner','index','7','813426b2fadfed99b52d7fdc0a116413','查看',0),(486,'banner','create','7','5f4eec19034c72973c3be9da3fc49659','创建',1),(487,'banner','edit','7','c3efd4e0afd299e6d0a11ad02915bf75','编辑',1),(488,'banner','delete','7','7f1b7a9dff3d9a12d07058bd355eca17','删除',1),(489,'banner','audit','7','54074d1d3570e107cb00169b2d2b5186','审核',1),(490,'banner','index','8','90b171971f9e4fec74f461e31d534c76','查看',0),(491,'banner','create','8','c6e8010da5c1c3d1a8098f52ba471a57','创建',1),(492,'banner','edit','8','bf728098a061ef90311ce79277ed744c','编辑',1),(493,'banner','delete','8','453643e30cdc46364155e71f9517158f','删除',1),(494,'banner','audit','8','3ab035b02641d2822c3489ab7ab420dc','审核',1);
/*!40000 ALTER TABLE `boc_manager_purview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_modules`
--

DROP TABLE IF EXISTS `boc_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_modules` (
  `id` int(2) NOT NULL AUTO_INCREMENT COMMENT '模型标识',
  `sort_id` int(2) NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '显示名称',
  `controller` varchar(50) NOT NULL COMMENT '控制器名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='栏目模型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_modules`
--

LOCK TABLES `boc_modules` WRITE;
/*!40000 ALTER TABLE `boc_modules` DISABLE KEYS */;
INSERT INTO `boc_modules` VALUES (1,3,'链接','links'),(3,1,'文章','article'),(6,0,'清单','lists'),(7,5,'期刊','gallery'),(8,4,'单页','page'),(9,6,'产品','product'),(10,0,'招聘','recruit'),(11,0,'新闻','news'),(12,0,'杂志','journals'),(13,7,'Banner','banner');
/*!40000 ALTER TABLE `boc_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_msgs`
--

DROP TABLE IF EXISTS `boc_msgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_msgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `msg` tinytext COMMENT '提示消息',
  `level` int(1) DEFAULT '1' COMMENT '类型: 1notie 2info 3 success 4error',
  `timeline` int(11) NOT NULL COMMENT '时间',
  `markread` int(1) NOT NULL COMMENT '是否阅读',
  `notify` int(1) DEFAULT '0' COMMENT '是否提示过',
  `byer` int(6) NOT NULL DEFAULT '0' COMMENT '发送者 mid system is 0',
  `toer` int(6) NOT NULL COMMENT '接受者 mid',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='消息提示';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_msgs`
--

LOCK TABLES `boc_msgs` WRITE;
/*!40000 ALTER TABLE `boc_msgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `boc_msgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_news`
--

DROP TABLE IF EXISTS `boc_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号',
  `cid` int(11) NOT NULL COMMENT '所属栏目',
  `ccid` int(11) NOT NULL DEFAULT '0' COMMENT '栏目条目ID伪栏目',
  `sort_id` int(11) DEFAULT '0' COMMENT '排序编号',
  `audit` int(1) NOT NULL DEFAULT '0' COMMENT '0:1审核',
  `flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:1推荐',
  `ctype` int(4) NOT NULL DEFAULT '0' COMMENT '默认分类',
  `type_id` int(4) DEFAULT NULL COMMENT '类型',
  `district_id` int(11) DEFAULT '0' COMMENT '地区ID',
  `title` tinytext NOT NULL COMMENT '标题',
  `title_seo` tinytext,
  `intro` varchar(500) DEFAULT NULL COMMENT '简介(200汉字)',
  `tags` tinytext COMMENT '标签',
  `content` text COMMENT '内容',
  `timeline` int(11) DEFAULT NULL COMMENT '发布/修改时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0:1状态,1 发布，0 草稿',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `photo` tinytext COMMENT '相关图片',
  `thumb` tinytext COMMENT '图片缩略图',
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_news`
--

LOCK TABLES `boc_news` WRITE;
/*!40000 ALTER TABLE `boc_news` DISABLE KEYS */;
INSERT INTO `boc_news` VALUES (1,1,0,1,1,0,1,NULL,1,'化妆大师-最前沿的化妆秘诀','','  ','','<p>化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀</p>',1445838333,1,23,'2','2015/10/26/thumbnail/1445838340535745p9u.png',NULL),(2,1,0,2,1,0,1,NULL,1,'化妆大师-最前沿的化妆秘诀2','','  ','','<p>化妆大师-最前沿的化妆秘诀2化妆大师-最前沿的化妆秘诀2化妆大师-最前沿的化妆秘诀2化妆大师-最前沿的化妆秘诀2</p>',1445838345,1,8,'3','2015/10/26/thumbnail/14458383570016fqlau.png',NULL),(3,1,0,3,1,0,1,NULL,1,'化妆大师-最前沿的化妆秘诀3','','  ','','<p>化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3</p>',1445838361,1,7,'4','2015/10/26/thumbnail/14458383714084juhr5.png',NULL),(4,1,0,4,1,0,1,NULL,1,'化妆大师-最前沿的化妆秘诀3','','  ','','<p>化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3</p>',1445838538,1,1,'4','2015/10/26/thumbnail/14458383714084juhr5.png',NULL),(5,1,0,5,1,0,1,NULL,1,'化妆大师-最前沿的化妆秘诀','','  ','','<p>化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀</p>',1445838539,1,4,'2','2015/10/26/thumbnail/1445838340535745p9u.png',NULL),(6,1,0,6,1,0,1,NULL,1,'化妆大师-最前沿的化妆秘诀','','  ','','<p>化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀</p>',1445838559,1,1,'2','2015/10/26/thumbnail/1445838340535745p9u.png',NULL),(7,1,0,7,1,0,1,NULL,1,'化妆大师-最前沿的化妆秘诀3','','  ','','<p>化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3</p>',1445838562,1,1,'4','2015/10/26/thumbnail/14458383714084juhr5.png',NULL),(8,1,0,8,1,1,1,NULL,1,'化妆大师-最前沿的化妆秘诀3','','  ','','<p>化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3</p>',1445838562,1,1,'4','2015/10/26/thumbnail/14458383714084juhr5.png',NULL),(9,1,0,9,1,1,1,NULL,1,'化妆大师-最前沿的化妆秘诀2','','  ','','<p>化妆大师-最前沿的化妆秘诀2化妆大师-最前沿的化妆秘诀2化妆大师-最前沿的化妆秘诀2化妆大师-最前沿的化妆秘诀2</p>',1445838563,1,1,'3','2015/10/26/thumbnail/14458383570016fqlau.png',NULL),(10,1,0,10,1,1,1,NULL,1,'化妆大师-最前沿的化妆秘诀','','  ','','<p>化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀</p>',1445838564,1,1,'2','2015/10/26/thumbnail/1445838340535745p9u.png',NULL),(11,1,0,11,1,1,1,NULL,1,'化妆大师-最前沿的化妆秘诀','','  ','','<p>化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀化妆大师-最前沿的化妆秘诀</p>',1445838564,1,0,'2','2015/10/26/thumbnail/1445838340535745p9u.png',NULL),(12,1,0,12,1,1,1,NULL,1,'化妆大师-最前沿的化妆秘诀3','','  ','如美头条 如美大师','<p>化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3化妆大师-最前沿的化妆秘诀3</p><p></p>',1445838565,1,4,'4','2015/10/26/thumbnail/14458383714084juhr5.png','15319333775'),(13,1,0,13,1,0,1,NULL,0,'这里是全国咨询专业线','','  ','','<p>这里是全国咨询</p>',1445907523,1,4,'27','2015/10/28/thumbnail/144600436696496xry9.png',NULL),(14,1,0,14,1,1,2,NULL,0,'这里是全国咨询日化线','','  ','如美头条','<p class=\"newsd-p3\">速成第1步：底妆是关键</p><p class=\"newsd-p4\">阅兵女兵要经受长时间的日晒与汗水的考验，所以，对底妆的要求非常高。当然，想要不脱妆，一整天都呈现服帖的妆效，妆容结束后用粉饼加固的步骤是不可少的。图片上这款粉饼被很多媒体都进行了不同的猜测，小编在此申明：有图有真相，绝对是国货精品自然堂家的。</p><div class=\"newsd-div1\"><img src=\"http://121.41.128.239:8080/rumeinews/static/m/img/newsd_img1.png?v=v3 \" width=\"70%\"/></div><p class=\"newsd-p4\">这款自然堂光透无瑕矿物养护两用粉饼质地柔滑，贴合肌肤，均匀\r\n肤色并修饰瑕疵，展现自然清透妆效;独具舒缓修护功效的天然矿物\r\n成分为底妆加持，更加服帖持久，提升肌肤光泽感及通透度，绽放\r\n清新亮白感;</p><div class=\"newsd-div1\"><img src=\"http://121.41.128.239:8080/rumeinews/static/m/img/newsd_img2.png?v=v3 \" width=\"70%\"/></div>',1445907546,1,12,'','','15319333774'),(15,1,0,15,1,0,1,NULL,0,'这是测试无图情况下','','  ','','<p>噶发生的广泛的规定的发生噶讽德诵功范德萨发生大幅上班地方噶法国法办法噶当然反光板V大分割人无法固定设备V刹为法国萨博V字形从vbgfsaddbvcx百分比v<br/></p>',1446690381,1,0,'','',''),(16,1,0,16,1,0,1,NULL,0,'这是测试无图情况下','','  ','','<p>噶发生的广泛的规定的发生噶讽德诵功范德萨发生大幅上班地方噶法国法办法噶当然反光板V大分割人无法固定设备V刹为法国萨博V字形从vbgfsaddbvcx百分比v<br/></p>',1446690381,1,0,'','','');
/*!40000 ALTER TABLE `boc_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_page`
--

DROP TABLE IF EXISTS `boc_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号',
  `cid` int(4) DEFAULT NULL COMMENT '栏目id',
  `ccid` int(11) DEFAULT '0' COMMENT '栏目条目ID伪栏目',
  `sort_id` int(11) DEFAULT '0' COMMENT '排序编号',
  `audit` int(1) DEFAULT '0' COMMENT '审核',
  `title` tinytext COMMENT '标题',
  `title_seo` tinytext,
  `intro` varchar(500) DEFAULT NULL COMMENT '简介(200汉字)',
  `tags` tinytext COMMENT '标签',
  `content` text COMMENT '内容',
  `photo` varchar(200) DEFAULT NULL COMMENT '图片组',
  `thumb` varchar(200) DEFAULT NULL COMMENT '缩略图',
  `template` varchar(200) DEFAULT NULL COMMENT '模板',
  `timeline` int(10) DEFAULT NULL COMMENT '发布/修改时间',
  `attachment` tinytext COMMENT '附件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='单页表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_page`
--

LOCK TABLES `boc_page` WRITE;
/*!40000 ALTER TABLE `boc_page` DISABLE KEYS */;
INSERT INTO `boc_page` VALUES (1,5,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1445943199,NULL);
/*!40000 ALTER TABLE `boc_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_product`
--

DROP TABLE IF EXISTS `boc_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL COMMENT '栏目id',
  `sort_id` int(11) DEFAULT '1' COMMENT '排序编号',
  `ccid` int(11) NOT NULL DEFAULT '0' COMMENT '栏目条目ID伪栏目',
  `audit` int(1) DEFAULT '0' COMMENT '0/1审核',
  `flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:1推荐',
  `ctype` int(4) NOT NULL DEFAULT '0' COMMENT '默认分类',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `title_seo` varchar(255) DEFAULT NULL COMMENT '优化标题',
  `intro` varchar(500) DEFAULT NULL COMMENT '简介',
  `tags` varchar(255) DEFAULT NULL COMMENT '标签',
  `content` mediumtext COMMENT '内容',
  `photo` varchar(255) DEFAULT NULL COMMENT '图片',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `show` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `click` int(11) DEFAULT '0' COMMENT '点击量',
  `timeline` int(11) DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_product`
--

LOCK TABLES `boc_product` WRITE;
/*!40000 ALTER TABLE `boc_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `boc_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_product_child`
--

DROP TABLE IF EXISTS `boc_product_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_product_child` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_id` int(11) DEFAULT NULL COMMENT '排序编号',
  `type_id` int(11) DEFAULT NULL COMMENT '分类',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `photo` varchar(255) DEFAULT NULL COMMENT '图片',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `show` int(11) DEFAULT '1' COMMENT '是否显示',
  `timeline` int(11) DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_product_child`
--

LOCK TABLES `boc_product_child` WRITE;
/*!40000 ALTER TABLE `boc_product_child` DISABLE KEYS */;
/*!40000 ALTER TABLE `boc_product_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_product_type`
--

DROP TABLE IF EXISTS `boc_product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT '1',
  `parent_id` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `intro` varchar(1000) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT '0',
  `timeline` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `path_index` (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_product_type`
--

LOCK TABLES `boc_product_type` WRITE;
/*!40000 ALTER TABLE `boc_product_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `boc_product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_province`
--

DROP TABLE IF EXISTS `boc_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `entitle` varchar(50) DEFAULT NULL COMMENT '英文标题',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='省级列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_province`
--

LOCK TABLES `boc_province` WRITE;
/*!40000 ALTER TABLE `boc_province` DISABLE KEYS */;
INSERT INTO `boc_province` VALUES (1,'北京市','BeiJing'),(2,'天津市','Tianjin'),(3,'河北省','Hebei'),(4,'山西省','Shanxi'),(5,'辽宁省','Liaoning'),(6,'吉林省','Jilin'),(7,'上海市','Shanghai'),(8,'江苏省','Jiangsu'),(9,'浙江省','Zhejiang'),(10,'安徽省','Anhui'),(11,'福建省','Fujian'),(12,'江西省','Jiangxi'),(13,'山东省','Shandong'),(14,'河南省','Henan'),(15,'内蒙古','Neimenggu'),(16,'黑龙江省','Heilongjiang'),(17,'湖北省','Hubei'),(18,'湖南省','Hunan'),(19,'广东省','Guangdong'),(20,'广西省','Guangxi'),(21,'海南省','Hainan'),(22,'四川省','Sichuan'),(23,'重庆市','Chongqing'),(24,'台湾省','Taiwan'),(25,'贵州省','Guizhou'),(26,'云南省','Yunnan'),(27,'西藏','Xizang'),(28,'陕西省','Shanxi'),(29,'甘肃省','Gansu'),(30,'青海省','Qinghai'),(31,'宁夏','Ningxia'),(32,'新疆','Xinjiang'),(33,'香港','xianggang'),(34,'澳门','aomen'),(35,'钓鱼岛','Diaoyudao');
/*!40000 ALTER TABLE `boc_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_province_city`
--

DROP TABLE IF EXISTS `boc_province_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_province_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省级id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `entitle` varchar(50) DEFAULT NULL COMMENT '英文标题',
  `weather` varchar(11) DEFAULT NULL COMMENT '国家天气ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=384 DEFAULT CHARSET=utf8 COMMENT='城市列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_province_city`
--

LOCK TABLES `boc_province_city` WRITE;
/*!40000 ALTER TABLE `boc_province_city` DISABLE KEYS */;
INSERT INTO `boc_province_city` VALUES (1,1,'北京',NULL,'101010100'),(2,2,'天津',NULL,'101030100'),(3,3,'石家庄',NULL,'101090101'),(4,3,'保定',NULL,'101090201'),(5,3,'沧州',NULL,'101090701'),(6,3,'承德',NULL,'101090402'),(7,3,'邯郸',NULL,'101091001'),(8,3,'衡水',NULL,'101090801'),(9,3,'廊坊',NULL,'101090601'),(10,3,'秦皇岛',NULL,'101091101'),(11,3,'唐山',NULL,'101090501'),(12,3,'邢台',NULL,'101090901'),(13,3,'张家口',NULL,'101090301'),(14,4,'太原',NULL,'101100101'),(15,4,'长治',NULL,'101100501'),(16,4,'大同',NULL,'101100201'),(17,4,'晋城',NULL,'101100601'),(18,4,'晋中',NULL,'101100401'),(19,4,'临汾',NULL,'101100701'),(20,4,'吕梁',NULL,'101101101'),(21,4,'朔州',NULL,'101100901'),(22,4,'忻州',NULL,'101101001'),(23,4,'阳泉',NULL,'101100301'),(24,4,'运城',NULL,'101100801'),(25,5,'沈阳',NULL,'101070101'),(26,5,'大连',NULL,'101070201'),(27,5,'鞍山',NULL,'101070301'),(28,5,'本溪',NULL,'101070501'),(29,5,'朝阳',NULL,'101071201'),(30,5,'丹东',NULL,'101070601'),(31,5,'抚顺',NULL,'101070401'),(32,5,'阜新',NULL,'101070901'),(33,5,'葫芦岛',NULL,'101071401'),(34,5,'锦州',NULL,'101070701'),(35,5,'辽阳',NULL,'101071001'),(36,5,'盘锦',NULL,'101071301'),(37,5,'铁岭',NULL,'101071101'),(38,5,'营口',NULL,'101070801'),(39,6,'长春',NULL,'101060101'),(40,6,'吉林',NULL,'101060201'),(41,6,'白城',NULL,'101060601'),(42,6,'白山',NULL,'101060901'),(43,6,'辽源',NULL,'101060701'),(44,6,'四平',NULL,'101060401'),(45,6,'松原',NULL,'101060801'),(46,6,'通化',NULL,'101060501'),(47,6,'延边朝鲜族自治州',NULL,NULL),(48,7,'上海',NULL,'101020100'),(49,8,'南京',NULL,'101190101'),(50,8,'常州',NULL,'101191101'),(51,8,'淮安',NULL,'101190901'),(52,8,'连云港',NULL,'101191001'),(53,8,'南通',NULL,'101190501'),(54,8,'苏州',NULL,'101190401'),(55,8,'宿迁',NULL,'101191301'),(56,8,'泰州',NULL,'101191201'),(57,8,'无锡',NULL,'101190201'),(58,8,'徐州',NULL,'101190801'),(59,8,'盐城',NULL,'101190701'),(60,8,'扬州',NULL,'101190601'),(61,8,'镇江',NULL,'101190301'),(62,9,'杭州',NULL,'101210101'),(63,9,'湖州',NULL,'101210201'),(64,9,'嘉兴',NULL,'101210301'),(65,9,'金华',NULL,'101210901'),(66,9,'丽水',NULL,'101210801'),(67,9,'宁波',NULL,'101210401'),(68,9,'绍兴',NULL,'101210501'),(69,9,'台州',NULL,'101210601'),(70,9,'温州',NULL,'101210701'),(71,9,'舟山',NULL,'101211101'),(72,9,'衢州',NULL,'101211001'),(73,10,'合肥',NULL,'101220101'),(74,10,'安庆',NULL,'101220601'),(75,10,'蚌埠',NULL,'101220201'),(76,10,'巢湖',NULL,'101221601'),(77,10,'池州',NULL,'101221701'),(78,10,'滁州',NULL,'101221101'),(79,10,'阜阳',NULL,'101220801'),(80,10,'淮北',NULL,'101221201'),(81,10,'淮南',NULL,'101220401'),(82,10,'黄山',NULL,NULL),(83,10,'六安',NULL,'101221501'),(84,10,'马鞍山',NULL,'101220501'),(85,10,'宿州',NULL,'101220701'),(86,10,'铜陵',NULL,'101221301'),(87,10,'芜湖',NULL,'101220301'),(88,10,'宣城',NULL,'101221401'),(89,10,'亳州',NULL,NULL),(90,11,'福州',NULL,'101230101'),(91,11,'厦门',NULL,'101230201'),(92,11,'龙岩',NULL,'101230701'),(93,11,'南平',NULL,'101230901'),(94,11,'宁德',NULL,'101230301'),(95,11,'莆田',NULL,'101230401'),(96,11,'泉州',NULL,'101230501'),(97,11,'三明',NULL,'101230801'),(98,11,'漳州',NULL,'101230601'),(99,12,'南昌',NULL,'101240101'),(100,12,'抚州',NULL,'101240401'),(101,12,'赣州',NULL,'101240701'),(102,12,'吉安',NULL,'101240601'),(103,12,'景德镇',NULL,'101240801'),(104,12,'九江',NULL,'101240201'),(105,12,'萍乡',NULL,'101240901'),(106,12,'上饶',NULL,'101240301'),(107,12,'新余',NULL,'101241001'),(108,12,'宜春',NULL,'101240501'),(109,12,'鹰潭',NULL,'101241101'),(110,13,'济南',NULL,'101120101'),(111,13,'青岛',NULL,'101120201'),(112,13,'烟台',NULL,'101120501'),(113,13,'滨州',NULL,'101121101'),(114,13,'德州',NULL,'101120401'),(115,13,'东营',NULL,'101121201'),(116,13,'菏泽',NULL,'101121001'),(117,13,'济宁',NULL,'101120701'),(118,13,'莱芜',NULL,'101121601'),(119,13,'聊城',NULL,'101121701'),(120,13,'临沂',NULL,'101120901'),(121,13,'日照',NULL,'101121501'),(122,13,'泰安',NULL,'101120801'),(123,13,'威海',NULL,'101121301'),(124,13,'潍坊',NULL,'101120601'),(125,13,'枣庄',NULL,'101121401'),(126,13,'淄博',NULL,'101120301'),(127,14,'郑州',NULL,'101180101'),(128,14,'洛阳',NULL,'101180901'),(129,14,'开封',NULL,'101180801'),(130,14,'安阳',NULL,'101180201'),(131,14,'鹤壁',NULL,'101181201'),(132,14,'济源',NULL,NULL),(133,14,'焦作',NULL,'101181101'),(134,14,'南阳',NULL,'101180701'),(135,14,'平顶山',NULL,'101180501'),(136,14,'三门峡',NULL,'101181701'),(137,14,'商丘',NULL,'101181001'),(138,14,'新乡',NULL,'101180301'),(139,14,'信阳',NULL,'101180601'),(140,14,'许昌',NULL,'101180401'),(141,14,'周口',NULL,'101181401'),(142,14,'驻马店',NULL,'101181601'),(143,14,'漯河',NULL,'101181501'),(144,14,'濮阳',NULL,'101181301'),(145,15,'呼和浩特',NULL,'101080101'),(146,15,'包头',NULL,'101080201'),(147,15,'赤峰',NULL,'101080601'),(148,15,'鄂尔多斯',NULL,'101080701'),(149,15,'呼伦贝尔',NULL,'101081001'),(150,15,'阿拉善盟',NULL,NULL),(151,15,'巴彦淖尔盟',NULL,NULL),(152,15,'通辽',NULL,'101080501'),(153,15,'乌海',NULL,'101080301'),(154,15,'乌兰察布盟',NULL,NULL),(155,15,'锡林郭勒盟',NULL,NULL),(156,15,'兴安盟',NULL,NULL),(157,16,'哈尔滨',NULL,'101050101'),(158,16,'大庆',NULL,'101050901'),(159,16,'大兴安岭',NULL,'101050701'),(160,16,'鹤岗',NULL,'101051201'),(161,16,'黑河',NULL,'101050601'),(162,16,'鸡西',NULL,'101051101'),(163,16,'佳木斯',NULL,'101050401'),(164,16,'牡丹江',NULL,'101050301'),(165,16,'七台河',NULL,'101051002'),(166,16,'齐齐哈尔',NULL,'101050201'),(167,16,'双鸭山',NULL,'101051301'),(168,16,'绥化',NULL,'101050501'),(169,16,'伊春',NULL,'101050801'),(170,17,'武汉',NULL,'101200101'),(171,17,'鄂州',NULL,'101200301'),(172,17,'黄冈',NULL,'101200501'),(173,17,'黄石',NULL,'101200601'),(174,17,'荆门',NULL,'101201401'),(175,17,'荆州',NULL,'101200801'),(176,17,'潜江',NULL,NULL),(177,17,'十堰',NULL,'101201101'),(178,17,'随州',NULL,'101201301'),(179,17,'天门',NULL,NULL),(180,17,'仙桃',NULL,NULL),(181,17,'咸宁',NULL,'101200701'),(182,17,'襄樊',NULL,NULL),(183,17,'孝感',NULL,'101200401'),(184,17,'宜昌',NULL,'101200901'),(185,17,'恩施土家族苗族自治州',NULL,NULL),(186,17,'神农架林区',NULL,NULL),(187,18,'长沙',NULL,'101250101'),(188,18,'益阳',NULL,'101250701'),(189,18,'湘潭',NULL,'101250201'),(190,18,'常德',NULL,'101250601'),(191,18,'郴州',NULL,'101250501'),(192,18,'衡阳',NULL,'101250401'),(193,18,'怀化',NULL,'101251201'),(194,18,'娄底',NULL,'101250801'),(195,18,'邵阳',NULL,'101250901'),(196,18,'永州',NULL,'101251401'),(197,18,'岳阳',NULL,'101251001'),(198,18,'张家界',NULL,'101251101'),(199,18,'株洲',NULL,'101250301'),(200,18,'湘西土家族苗族自治州',NULL,NULL),(201,19,'广州',NULL,'101280101'),(202,19,'深圳',NULL,'101280601'),(203,19,'珠海',NULL,'101280701'),(204,19,'湛江',NULL,'101281001'),(205,19,'惠州',NULL,'101280301'),(206,19,'江门',NULL,'101281101'),(207,19,'潮州',NULL,'101281501'),(208,19,'汕头',NULL,'101280501'),(209,19,'东莞',NULL,'101281601'),(210,19,'佛山',NULL,'101280800'),(211,19,'河源',NULL,'101281201'),(212,19,'揭阳',NULL,'101281901'),(213,19,'茂名',NULL,'101282001'),(214,19,'梅州',NULL,'101280401'),(215,19,'清远',NULL,'101281301'),(216,19,'汕尾',NULL,'101282101'),(217,19,'韶关',NULL,'101280201'),(218,19,'阳江',NULL,'101281801'),(219,19,'云浮',NULL,'101281401'),(220,19,'肇庆',NULL,'101280901'),(221,19,'中山',NULL,'101281701'),(222,20,'南宁',NULL,'101300101'),(223,20,'桂林',NULL,'101300501'),(224,20,'北海',NULL,'101301301'),(225,20,'百色',NULL,'101301001'),(226,20,'崇左',NULL,'101300201'),(227,20,'防城港',NULL,'101301401'),(228,20,'贵港',NULL,'101300801'),(229,20,'河池',NULL,'101301201'),(230,20,'贺州',NULL,'101300701'),(231,20,'来宾',NULL,'101300401'),(232,20,'柳州',NULL,'101300301'),(233,20,'钦州',NULL,'101301101'),(234,20,'梧州',NULL,'101300601'),(235,20,'玉林',NULL,'101300901'),(236,21,'海口',NULL,'101310101'),(237,21,'三亚',NULL,'101310201'),(238,21,'白沙黎族自治县',NULL,NULL),(239,21,'保亭黎族苗族自治县',NULL,NULL),(240,21,'昌江黎族自治县',NULL,NULL),(241,21,'澄迈县',NULL,NULL),(242,21,'定安县',NULL,NULL),(243,21,'东方',NULL,NULL),(244,21,'乐东黎族自治县',NULL,NULL),(245,21,'临高县',NULL,NULL),(246,21,'陵水黎族自治县',NULL,NULL),(247,21,'琼海',NULL,NULL),(248,21,'琼中黎族苗族自治县',NULL,NULL),(249,21,'屯昌县',NULL,NULL),(250,21,'万宁',NULL,NULL),(251,21,'文昌',NULL,'101310212'),(252,21,'五指山',NULL,NULL),(253,21,'儋州',NULL,'101310205'),(254,22,'成都',NULL,'101270101'),(255,22,'绵阳',NULL,'101270401'),(256,22,'巴中',NULL,'101270901'),(257,22,'达州',NULL,'101270601'),(258,22,'德阳',NULL,'101272001'),(259,22,'广安',NULL,'101270801'),(260,22,'广元',NULL,'101272101'),(261,22,'乐山',NULL,'101271401'),(262,22,'眉山',NULL,'101271501'),(263,22,'南充',NULL,'101270501'),(264,22,'内江',NULL,'101271201'),(265,22,'攀枝花',NULL,'101270201'),(266,22,'遂宁',NULL,'101270701'),(267,22,'雅安',NULL,'101271701'),(268,22,'宜宾',NULL,'101271101'),(269,22,'资阳',NULL,'101271301'),(270,22,'自贡',NULL,'101270301'),(271,22,'泸州',NULL,'101271001'),(272,22,'甘孜藏族自治州',NULL,NULL),(273,22,'阿坝藏族羌族自治州',NULL,NULL),(274,22,'凉山彝族自治州',NULL,NULL),(275,23,'重庆',NULL,'101040100'),(276,24,'台北',NULL,'101340102'),(277,24,'高雄',NULL,'101340201'),(278,24,'台中',NULL,NULL),(279,24,'台南',NULL,NULL),(280,24,'新北',NULL,NULL),(281,24,'基隆',NULL,NULL),(282,24,'新竹',NULL,NULL),(283,24,'嘉义',NULL,NULL),(284,24,'桃园县',NULL,NULL),(285,24,'新竹县',NULL,NULL),(286,24,'苗栗县',NULL,NULL),(287,24,'彰化县',NULL,NULL),(288,24,'南投县',NULL,NULL),(289,24,'云林县',NULL,NULL),(290,24,'嘉义县',NULL,NULL),(291,24,'屏东县',NULL,NULL),(292,24,'宜兰县',NULL,NULL),(293,24,'花莲县',NULL,NULL),(294,24,'台东县',NULL,NULL),(295,24,'澎湖县',NULL,NULL),(296,24,'金门县',NULL,NULL),(297,24,'连江县',NULL,NULL),(298,25,'贵阳',NULL,'101260101'),(299,25,'六盘水',NULL,'101260801'),(300,25,'遵义',NULL,'101260201'),(301,25,'安顺',NULL,'101260301'),(302,25,'毕节',NULL,'101260701'),(303,25,'铜仁',NULL,'101260601'),(304,25,'黔东南苗族侗族自治州',NULL,NULL),(305,25,'黔南布依族苗族自治州',NULL,NULL),(306,25,'黔西南布依族苗族自治州',NULL,NULL),(307,26,'昆明',NULL,'101290101'),(308,26,'丽江',NULL,'101291401'),(309,26,'保山',NULL,'101290501'),(310,26,'楚雄彝族自治州',NULL,NULL),(311,26,'大理白族自治州',NULL,NULL),(312,26,'德宏傣族景颇族自治州',NULL,NULL),(313,26,'迪庆藏族自治州',NULL,NULL),(314,26,'红河哈尼族彝族自治州',NULL,NULL),(315,26,'临沧',NULL,'101291101'),(316,26,'怒江傈傈族自治州',NULL,NULL),(317,26,'曲靖',NULL,'101290401'),(318,26,'思茅',NULL,'101290901'),(319,26,'文山壮族苗族自治州',NULL,NULL),(320,26,'西双版纳傣族自治州',NULL,NULL),(321,26,'玉溪',NULL,'101290701'),(322,26,'昭通',NULL,'101291001'),(323,27,'拉萨',NULL,'101140101'),(324,27,'日喀则',NULL,'101140201'),(325,27,'阿里',NULL,'101140701'),(326,27,'昌都',NULL,'101140501'),(327,27,'林芝',NULL,'101140401'),(328,27,'那曲',NULL,'101140601'),(329,27,'山南',NULL,'101140301'),(330,28,'西安',NULL,'101110101'),(331,28,'宝鸡',NULL,'101110901'),(332,28,'咸阳',NULL,'101110200'),(333,28,'延安',NULL,'101110300'),(334,28,'榆林',NULL,'101110401'),(335,28,'安康',NULL,'101110701'),(336,28,'汉中',NULL,'101110801'),(337,28,'商洛',NULL,'101110601'),(338,28,'铜川',NULL,'101111001'),(339,28,'渭南',NULL,'101110501'),(340,29,'兰州',NULL,'101160101'),(341,29,'白银',NULL,'101161301'),(342,29,'定西',NULL,'101160201'),(343,29,'嘉峪关',NULL,NULL),(344,29,'金昌',NULL,'101160601'),(345,29,'酒泉',NULL,'101160801'),(346,29,'陇南',NULL,NULL),(347,29,'平凉',NULL,'101160301'),(348,29,'庆阳',NULL,'101160401'),(349,29,'天水',NULL,'101160901'),(350,29,'武威',NULL,'101160501'),(351,29,'张掖',NULL,'101160701'),(352,29,'临夏回族自治州',NULL,NULL),(353,29,'甘南藏族自治州',NULL,NULL),(354,30,'西宁',NULL,'101150101'),(355,30,'果洛藏族自治州',NULL,NULL),(356,30,'海北藏族自治州',NULL,NULL),(357,30,'海东',NULL,'101150201'),(358,30,'海南藏族自治州',NULL,NULL),(359,30,'海西蒙古族藏族自治州',NULL,NULL),(360,30,'黄南藏族自治州',NULL,NULL),(361,30,'玉树藏族自治州',NULL,NULL),(362,31,'银川',NULL,'101170101'),(363,31,'固原',NULL,'101170401'),(364,31,'石嘴山',NULL,'101170201'),(365,31,'吴忠',NULL,'101170301'),(366,32,'乌鲁木齐',NULL,'101130101'),(367,32,'吐鲁番',NULL,'101130501'),(368,32,'阿克苏',NULL,'101130801'),(369,32,'阿拉尔',NULL,NULL),(370,32,'巴音郭楞蒙古自治州',NULL,NULL),(371,32,'博尔塔拉蒙古自治州',NULL,NULL),(372,32,'昌吉回族自治州',NULL,NULL),(373,32,'哈密',NULL,'101131201'),(374,32,'和田',NULL,'101131301'),(375,32,'喀什',NULL,'101130901'),(376,32,'克拉玛依',NULL,'101130201'),(377,32,'克孜勒苏柯尔克孜自治州',NULL,NULL),(378,32,'石河子',NULL,'101130301'),(379,32,'图木舒克',NULL,NULL),(380,32,'五家渠',NULL,NULL),(381,32,'伊犁哈萨克自治州',NULL,NULL),(382,33,'香港',NULL,'101320101'),(383,34,'澳门',NULL,'101330101');
/*!40000 ALTER TABLE `boc_province_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_recruit`
--

DROP TABLE IF EXISTS `boc_recruit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_recruit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号',
  `sort_id` int(11) DEFAULT '1' COMMENT '排序编号',
  `cid` int(11) DEFAULT NULL COMMENT '类型',
  `ccid` int(11) DEFAULT '0',
  `title` tinytext NOT NULL COMMENT '标题',
  `title_seo` tinytext,
  `intro` tinytext COMMENT '简介',
  `tags` tinytext,
  `content` mediumtext COMMENT '内容',
  `timeline` int(11) DEFAULT NULL COMMENT '发布/修改时间',
  `expiretime` int(11) DEFAULT NULL COMMENT '公告过期时间',
  `click` int(11) DEFAULT '0' COMMENT '浏览次数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显隐状态',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐到分类门户的页面显示',
  `audit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '突显状态/颜色',
  `show` tinyint(1) NOT NULL DEFAULT '1',
  `photo` varchar(255) DEFAULT NULL COMMENT '相关图片',
  `thumb` varchar(255) DEFAULT NULL COMMENT '图片缩略图',
  `attachment` varchar(255) DEFAULT NULL COMMENT '相关文件',
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `county` varchar(50) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `require` varchar(50) DEFAULT NULL COMMENT '职称要求',
  `amount` int(11) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `age` smallint(6) DEFAULT NULL,
  `age_max` smallint(6) DEFAULT NULL,
  `edu` varchar(50) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL,
  `experience` varchar(50) DEFAULT NULL,
  `requirement` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='人才招聘';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_recruit`
--

LOCK TABLES `boc_recruit` WRITE;
/*!40000 ALTER TABLE `boc_recruit` DISABLE KEYS */;
/*!40000 ALTER TABLE `boc_recruit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_recruit_apply`
--

DROP TABLE IF EXISTS `boc_recruit_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_recruit_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号',
  `sort_id` int(11) DEFAULT '1' COMMENT '排序编号',
  `type_id` int(11) DEFAULT NULL COMMENT '类型',
  `recruit_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '应聘标题',
  `intro` varchar(1000) DEFAULT NULL COMMENT '简介',
  `content` mediumtext COMMENT '内容',
  `answer` mediumtext,
  `timeline_answer` int(11) DEFAULT NULL,
  `timeline` int(11) DEFAULT NULL COMMENT '发布/修改时间',
  `expire` int(11) DEFAULT NULL COMMENT '公告过期时间',
  `solve` int(1) DEFAULT '0',
  `click` int(11) DEFAULT '0' COMMENT '浏览次数',
  `show` tinyint(4) DEFAULT '1' COMMENT '显隐状态',
  `recommend` tinyint(4) DEFAULT '0' COMMENT '推荐到分类门户的页面显示',
  `color` tinyint(4) DEFAULT '0' COMMENT '突显状态/颜色',
  `audit` tinyint(1) DEFAULT '0' COMMENT '审核状态',
  `photo` varchar(255) DEFAULT NULL COMMENT '相关图片',
  `thumb` varchar(255) DEFAULT NULL COMMENT '图片缩略图',
  `file` varchar(255) DEFAULT NULL COMMENT '相关文件',
  `ip` varchar(100) DEFAULT NULL,
  `ex1` varchar(255) DEFAULT '' COMMENT '其他标签（预留）',
  `ex2` varchar(255) DEFAULT '',
  `ex3` varchar(255) DEFAULT '',
  `ex4` varchar(255) DEFAULT '',
  `x` varchar(255) DEFAULT '',
  `y` varchar(255) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `county` varchar(50) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL COMMENT '部门',
  `name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `marriage` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `qq` varchar(100) DEFAULT NULL,
  `msn` varchar(100) DEFAULT NULL,
  `wangwang` varchar(100) DEFAULT NULL,
  `nation` varchar(50) DEFAULT NULL COMMENT '民族',
  `birthday` varchar(20) DEFAULT NULL,
  `politic` varchar(50) DEFAULT NULL COMMENT '政治面貌',
  `birthplace` varchar(50) DEFAULT NULL COMMENT '籍贯',
  `school` varchar(100) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL COMMENT '专业',
  `graduation` varchar(20) DEFAULT NULL COMMENT '毕业时间',
  `language` varchar(50) DEFAULT NULL COMMENT '外语水平',
  `position` varchar(100) DEFAULT NULL COMMENT '应聘职位',
  `age` smallint(6) DEFAULT NULL,
  `edu` varchar(50) DEFAULT NULL,
  `experience` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='在线应聘';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_recruit_apply`
--

LOCK TABLES `boc_recruit_apply` WRITE;
/*!40000 ALTER TABLE `boc_recruit_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `boc_recruit_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_sessions_adminer`
--

DROP TABLE IF EXISTS `boc_sessions_adminer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_sessions_adminer` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会话保存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_sessions_adminer`
--

LOCK TABLES `boc_sessions_adminer` WRITE;
/*!40000 ALTER TABLE `boc_sessions_adminer` DISABLE KEYS */;
INSERT INTO `boc_sessions_adminer` VALUES ('cc0288b153fae685c9151529068a153f','192.168.0.121','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11) AppleWebKit/601.1.56 (KHTML, like Gecko) Version/9.0 Safari/601.1.56',1446690357,'a:6:{s:9:\"user_data\";s:0:\"\";s:3:\"mid\";s:1:\"1\";s:5:\"uname\";s:8:\"bocadmin\";s:8:\"nickname\";s:12:\"超级用户\";s:8:\"login_ip\";s:13:\"192.168.0.121\";s:3:\"gid\";s:1:\"1\";}');
/*!40000 ALTER TABLE `boc_sessions_adminer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_sessions_site`
--

DROP TABLE IF EXISTS `boc_sessions_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_sessions_site` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会话保存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_sessions_site`
--

LOCK TABLES `boc_sessions_site` WRITE;
/*!40000 ALTER TABLE `boc_sessions_site` DISABLE KEYS */;
INSERT INTO `boc_sessions_site` VALUES ('bcc9c63ead6d1e9778fed541783bfe3e','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446706113,''),('372db8290f64156695606787f6958015','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446703042,''),('288d6fee6614b5148abcec1317bc5382','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446703042,''),('3a06b93a339f202d5ec412ba4d88a589','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446703042,''),('ac5c83a41fdf3ea637dca2e16a4ab027','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446703041,''),('9d94d1618223654ae0c21cb11eacfa2e','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446703040,''),('949d88eb6e549ebb281a7d9dec012d28','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446703039,''),('f787b2b5357721cbeb4f313fcfc07a81','192.168.0.121','AsBeautiful/1.0 (iPhone; iOS 9.0; Scale/2.00)',1446704723,''),('2e26be1b00023e692864e0bf1fed8cf7','192.168.0.121','AsBeautiful/1.0 (iPhone; iOS 9.0; Scale/2.00)',1446702378,''),('ef6bb9dea5172392f3f96e7fa6870ce0','192.168.0.121','AsBeautiful/1.0 (iPhone; iOS 9.0; Scale/2.00)',1446702378,''),('272607fd7f05e671c1ea93624f720f1f','192.168.0.121','AsBeautiful/1.0 (iPhone; iOS 9.0; Scale/2.00)',1446702378,''),('92ca8031b1e050a640527db08123954f','192.168.0.121','AsBeautiful/1.0 (iPhone; iOS 9.0; Scale/2.00)',1446702377,''),('b2766ff532bf16333fa32fbd3a7a8858','192.168.0.121','AsBeautiful/1.0 (iPhone; iOS 9.0; Scale/2.00)',1446702376,''),('b9f15c2461c9b719e69f50f54ac6ef4f','192.168.0.121','AsBeautiful/1.0 (iPhone; iOS 9.0; Scale/2.00)',1446702375,''),('aca3e6d344c521820dd6433c1384a22b','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446717620,''),('60112dc65757e0da19acb39edd24150f','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446717620,''),('43c4b5a182207325490b5b9281b38723','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446717620,''),('1a5a84d7eb9719faf1e5776a4fa2d456','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446717619,''),('b208380cc45d81cc081ed29a5682bed7','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446717619,''),('5874489636c4fb705024566d13c935a3','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446717619,''),('6511ec5a3048c707f15274579b6bd147','192.168.0.193','Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13B143',1446717558,'a:2:{s:9:\"user_data\";s:0:\"\";s:7:\"news_13\";i:1;}'),('5b407e91eb8097c46a838a0d789f8a67','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446717619,''),('9fdcf38a99345a37a0b6db6b084b444f','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446717117,''),('9209a6556e9e4c9166c15875b13b66fa','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446717117,''),('01eeb3529ecebbd9a5c2d3bc90bb74b1','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446717116,''),('9485c783fb10b02df1ae30b014a07b1e','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446717116,''),('7df2f8ababb44c150f8692dad08d726b','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446717116,''),('6fd060bf5e9a4639c396c26acf220a23','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446717116,''),('940d7c22e84bf55b1871b2b7f8c19539','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446716335,''),('eb7db38c1f17d3a25710f192745b5056','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446716335,''),('39678e42f7c8b420c2e23c5539b688b0','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446716334,''),('19e396de29674fbfd7f06fdd29d9b8c3','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446716334,''),('dde1ad47a1a1f3ba04a49a76b254cc76','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446716334,''),('4d46ef83d6992a5aa13aca397aa40537','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446716334,''),('165752024e825963052a8a44dd7d9154','192.168.0.193','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446717318,''),('caf35adc80a98754e9671fd13794ba22','192.168.0.193','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446716147,''),('4579b21eded6cfebcb1c5499b391b9e5','192.168.0.193','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446716147,''),('4a8689c314a6f2c8c87385638892b6bd','192.168.0.193','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446716146,''),('c51a5579dd0cd9ecb04d50a415dd2fff','192.168.0.193','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446716146,''),('83e93f8c27a7a5937450a9b1e1fd740b','192.168.0.193','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446716146,''),('046811ca8e5b755ca2b95e159624937f','192.168.0.193','AsBeautiful/1.2 (iPhone; iOS 9.1; Scale/2.00)',1446716146,''),('a09f9be5cf4fc269a5d99052d37c4a1a','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446716073,''),('f2d3068f0fa6b765838dcb8a28efa5e9','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446716071,''),('2f22f48e888a6959c9d1718945ed2a46','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446716071,''),('7bedb248f45b7dd9d338ed506190da5c','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446716071,''),('8df46e891aba782b7f0b3d7870b8da70','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446716070,''),('7df82d87ae74bb5d9e3d60dfd33448e1','192.168.0.121','AsBeautiful/1.0 (iPhone; iOS 9.0; Scale/2.00)',1446704726,''),('ccdd85ebb54ccb33be5986c89ac299ab','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446716070,''),('bc1b91572a1ebbcbe57902f198a6eaf2','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446716070,''),('ba11a91aa5ad90674a6f086f832d2c10','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446706114,''),('160daf276085c67df53f2fdc9eace271','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446706114,''),('36ba86413d1e9a9a69e4c123ac79f8a5','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446706114,''),('205a3a0ae27f868d743f36cef5e10ddf','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446706113,''),('2ec5e970ac6a62871110f267e4f387af','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446706113,''),('272d40d470bf17f7e62bbb3b22d23d93','192.168.0.121','AsBeautiful/1.2 (iPhone; iOS 8.3; Scale/2.00)',1446706113,''),('c0b59937deebc466eb97246f65e8f3a8','192.168.0.121','AsBeautiful/1.0 (iPhone; iOS 9.0; Scale/2.00)',1446704726,''),('9a28a5f9f961f75056857b048c358e71','192.168.0.121','AsBeautiful/1.0 (iPhone; iOS 9.0; Scale/2.00)',1446704726,''),('e8eb275f2e21306ad44081ecfef32a3e','192.168.0.121','AsBeautiful/1.0 (iPhone; iOS 9.0; Scale/2.00)',1446704726,''),('946687b506feaaefa1624ebf08aa334b','192.168.0.121','AsBeautiful/1.0 (iPhone; iOS 9.0; Scale/2.00)',1446704725,''),('f80fc2e639138c6a05dcb9adae839fcc','192.168.0.121','AsBeautiful/1.0 (iPhone; iOS 9.0; Scale/2.00)',1446704724,'');
/*!40000 ALTER TABLE `boc_sessions_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_smscode`
--

DROP TABLE IF EXISTS `boc_smscode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_smscode` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `phone` int(11) NOT NULL COMMENT '手机号',
  `code` int(11) DEFAULT NULL COMMENT '短信号码',
  `timeline` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='短信验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_smscode`
--

LOCK TABLES `boc_smscode` WRITE;
/*!40000 ALTER TABLE `boc_smscode` DISABLE KEYS */;
/*!40000 ALTER TABLE `boc_smscode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_tags`
--

DROP TABLE IF EXISTS `boc_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(30) NOT NULL COMMENT '标签',
  `en` varchar(60) DEFAULT NULL COMMENT '拼音|英语',
  `len` int(3) DEFAULT '0' COMMENT '长度',
  `count` int(11) DEFAULT '0' COMMENT '计数',
  `type` int(1) DEFAULT '0' COMMENT '分类,0:tags,1:title,2:intro,3:content',
  PRIMARY KEY (`id`),
  KEY `record_index` (`id`,`tag`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_tags`
--

LOCK TABLES `boc_tags` WRITE;
/*!40000 ALTER TABLE `boc_tags` DISABLE KEYS */;
INSERT INTO `boc_tags` VALUES (1,'如美头条','ru_mei_tou_tiao',4,2,0),(2,'如美大师','ru_mei_da_shi',4,0,0);
/*!40000 ALTER TABLE `boc_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_tags_list`
--

DROP TABLE IF EXISTS `boc_tags_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_tags_list` (
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT 'tag id',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT 'col id',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT 'col''s aritcle id',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '分类,0:tags,1:title,2:intro,3:content',
  `timeline` int(11) NOT NULL COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签使用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_tags_list`
--

LOCK TABLES `boc_tags_list` WRITE;
/*!40000 ALTER TABLE `boc_tags_list` DISABLE KEYS */;
INSERT INTO `boc_tags_list` VALUES (1,1,12,0,1446188572),(2,1,12,0,1446188572),(1,1,14,0,1446607625);
/*!40000 ALTER TABLE `boc_tags_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_upload`
--

DROP TABLE IF EXISTS `boc_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `size` int(11) DEFAULT NULL COMMENT '大小',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `url` varchar(100) DEFAULT NULL COMMENT '地址',
  `thumb` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `deleteUrl` varchar(150) DEFAULT NULL COMMENT '删除',
  `alt` varbinary(30) DEFAULT NULL COMMENT '提示',
  `title` varbinary(100) DEFAULT NULL COMMENT '标题',
  `text` tinytext COMMENT '简介内容',
  `timeline` int(11) DEFAULT NULL COMMENT '时间线',
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='文件上传';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_upload`
--

LOCK TABLES `boc_upload` WRITE;
/*!40000 ALTER TABLE `boc_upload` DISABLE KEYS */;
INSERT INTO `boc_upload` VALUES (1,'144583823388162ehvb.png',26823,'image/png','2015/10/26/144583823388162ehvb.png','2015/10/26/thumbnail/144583823388162ehvb.png','?file=144583823388162ehvb.png&dt=2015/10/26',NULL,NULL,NULL,1445838233,NULL),(2,'1445838340535745p9u.png',26823,'image/png','2015/10/26/1445838340535745p9u.png','2015/10/26/thumbnail/1445838340535745p9u.png','?file=1445838340535745p9u.png&dt=2015/10/26',NULL,NULL,NULL,1445838340,NULL),(3,'14458383570016fqlau.png',26823,'image/png','2015/10/26/14458383570016fqlau.png','2015/10/26/thumbnail/14458383570016fqlau.png','?file=14458383570016fqlau.png&dt=2015/10/26',NULL,NULL,NULL,1445838357,NULL),(4,'14458383714084juhr5.png',39611,'image/png','2015/10/26/14458383714084juhr5.png','2015/10/26/thumbnail/14458383714084juhr5.png','?file=14458383714084juhr5.png&dt=2015/10/26',NULL,NULL,NULL,1445838371,NULL),(5,'144584585282333wwqr.png',706343,'image/png','2015/10/26/144584585282333wwqr.png','2015/10/26/thumbnail/144584585282333wwqr.png','?file=144584585282333wwqr.png&dt=2015/10/26','','','',1445845852,NULL),(6,'14458458554755pbwft.png',263673,'image/png','2015/10/26/14458458554755pbwft.png','2015/10/26/thumbnail/14458458554755pbwft.png','?file=14458458554755pbwft.png&dt=2015/10/26','alt','title','content',1445845855,'15319333771'),(7,'14458470619365ja32o.png',706343,'image/png','2015/10/26/14458470619365ja32o.png','2015/10/26/thumbnail/14458470619365ja32o.png','?file=14458470619365ja32o.png&dt=2015/10/26',NULL,NULL,NULL,1445847061,NULL),(8,'14458470694149631k6.png',58713,'image/png','2015/10/26/14458470694149631k6.png','2015/10/26/thumbnail/14458470694149631k6.png','?file=14458470694149631k6.png&dt=2015/10/26',NULL,NULL,NULL,1445847069,NULL),(9,'14458470776124uvz3o.png',278610,'image/png','2015/10/26/14458470776124uvz3o.png','2015/10/26/thumbnail/14458470776124uvz3o.png','?file=14458470776124uvz3o.png&dt=2015/10/26',NULL,NULL,NULL,1445847077,NULL),(10,'144584710900828lrlz.png',278610,'image/png','2015/10/26/144584710900828lrlz.png','2015/10/26/thumbnail/144584710900828lrlz.png','?file=144584710900828lrlz.png&dt=2015/10/26',NULL,NULL,NULL,1445847109,NULL),(11,'144584711251842hquq.png',31923,'image/png','2015/10/26/144584711251842hquq.png','2015/10/26/thumbnail/144584711251842hquq.png','?file=144584711251842hquq.png&dt=2015/10/26','','','',1445847112,'15300000001'),(12,'14458471143575gfpy3.png',646874,'image/png','2015/10/26/14458471143575gfpy3.png','2015/10/26/thumbnail/14458471143575gfpy3.png','?file=14458471143575gfpy3.png&dt=2015/10/26',NULL,NULL,NULL,1445847114,NULL),(13,'14458504701754w38yn.png',31923,'image/png','2015/10/26/14458504701754w38yn.png','2015/10/26/thumbnail/14458504701754w38yn.png','?file=14458504701754w38yn.png&dt=2015/10/26',NULL,NULL,NULL,1445850470,NULL),(14,'144585047175854k8jb.png',646874,'image/png','2015/10/26/144585047175854k8jb.png','2015/10/26/thumbnail/144585047175854k8jb.png','?file=144585047175854k8jb.png&dt=2015/10/26',NULL,NULL,NULL,1445850471,NULL),(15,'14459432880735z88v6.png',305691,'image/png','2015/10/27/14459432880735z88v6.png','2015/10/27/thumbnail/14459432880735z88v6.png','?file=14459432880735z88v6.png&dt=2015/10/27',NULL,NULL,NULL,1445943288,NULL),(16,'144594333721333gvjv.png',305691,'image/png','2015/10/27/144594333721333gvjv.png','2015/10/27/thumbnail/144594333721333gvjv.png','?file=144594333721333gvjv.png&dt=2015/10/27',NULL,NULL,NULL,1445943337,NULL),(19,'1445994231921305o5m.png',305691,'image/png','2015/10/28/1445994231921305o5m.png','2015/10/28/thumbnail/1445994231921305o5m.png','?file=1445994231921305o5m.png&dt=2015/10/28',NULL,NULL,NULL,1445994231,NULL),(20,'14459943134259y12fz.png',305691,'image/png','2015/10/28/14459943134259y12fz.png','2015/10/28/thumbnail/14459943134259y12fz.png','?file=14459943134259y12fz.png&dt=2015/10/28',NULL,NULL,NULL,1445994313,NULL),(21,'1445994391122411igl.png',305691,'image/png','2015/10/28/1445994391122411igl.png','2015/10/28/thumbnail/1445994391122411igl.png','?file=1445994391122411igl.png&dt=2015/10/28',NULL,NULL,NULL,1445994391,NULL),(22,'14459943936945gzhky.png',31016,'image/png','2015/10/28/14459943936945gzhky.png','2015/10/28/thumbnail/14459943936945gzhky.png','?file=14459943936945gzhky.png&dt=2015/10/28',NULL,NULL,NULL,1445994393,NULL),(23,'1445994406351245eww.png',305691,'image/png','2015/10/28/1445994406351245eww.png','2015/10/28/thumbnail/1445994406351245eww.png','?file=1445994406351245eww.png&dt=2015/10/28',NULL,NULL,NULL,1445994406,NULL),(24,'144599441628287wbkr.png',26823,'image/png','2015/10/28/144599441628287wbkr.png','2015/10/28/thumbnail/144599441628287wbkr.png','?file=144599441628287wbkr.png&dt=2015/10/28',NULL,NULL,NULL,1445994416,NULL),(25,'14459944180939lubo5.png',305691,'image/png','2015/10/28/14459944180939lubo5.png','2015/10/28/thumbnail/14459944180939lubo5.png','?file=14459944180939lubo5.png&dt=2015/10/28',NULL,NULL,NULL,1445994418,NULL),(27,'144600436696496xry9.png',305691,'image/png','2015/10/28/144600436696496xry9.png','2015/10/28/thumbnail/144600436696496xry9.png','?file=144600436696496xry9.png&dt=2015/10/28',NULL,NULL,NULL,1446004367,NULL),(28,'14460137074244h3mn7.png',26823,'image/png','2015/10/28/14460137074244h3mn7.png','2015/10/28/thumbnail/14460137074244h3mn7.png','?file=14460137074244h3mn7.png&dt=2015/10/28',NULL,NULL,NULL,1446013707,NULL),(29,'1446013718022rbjvr.png',305691,'image/png','2015/10/28/1446013718022rbjvr.png','2015/10/28/thumbnail/1446013718022rbjvr.png','?file=1446013718022rbjvr.png&dt=2015/10/28',NULL,NULL,NULL,1446013718,NULL),(30,'14460137287307t2hin.png',305691,'image/png','2015/10/28/14460137287307t2hin.png','2015/10/28/thumbnail/14460137287307t2hin.png','?file=14460137287307t2hin.png&dt=2015/10/28',NULL,NULL,NULL,1446013728,NULL),(31,'14460137386772wte5i.png',39611,'image/png','2015/10/28/14460137386772wte5i.png','2015/10/28/thumbnail/14460137386772wte5i.png','?file=14460137386772wte5i.png&dt=2015/10/28',NULL,NULL,NULL,1446013738,NULL),(32,'1446013752181sga14.png',31016,'image/png','2015/10/28/1446013752181sga14.png','2015/10/28/thumbnail/1446013752181sga14.png','?file=1446013752181sga14.png&dt=2015/10/28',NULL,NULL,NULL,1446013752,NULL),(33,'14460137606765f88km.png',26823,'image/png','2015/10/28/14460137606765f88km.png','2015/10/28/thumbnail/14460137606765f88km.png','?file=14460137606765f88km.png&dt=2015/10/28',NULL,NULL,NULL,1446013760,NULL),(34,'14460137721981wx5cv.png',305691,'image/png','2015/10/28/14460137721981wx5cv.png','2015/10/28/thumbnail/14460137721981wx5cv.png','?file=14460137721981wx5cv.png&dt=2015/10/28',NULL,NULL,NULL,1446013772,NULL),(35,'14460137817787r73f2.png',39611,'image/png','2015/10/28/14460137817787r73f2.png','2015/10/28/thumbnail/14460137817787r73f2.png','?file=14460137817787r73f2.png&dt=2015/10/28',NULL,NULL,NULL,1446013781,NULL),(36,'144602024833563cx5q.png',31016,'image/png','2015/10/28/144602024833563cx5q.png','2015/10/28/thumbnail/144602024833563cx5q.png','?file=144602024833563cx5q.png&dt=2015/10/28',NULL,NULL,NULL,1446020248,NULL),(37,'14460202507797iaw94.png',26823,'image/png','2015/10/28/14460202507797iaw94.png','2015/10/28/thumbnail/14460202507797iaw94.png','?file=14460202507797iaw94.png&dt=2015/10/28',NULL,NULL,NULL,1446020250,NULL),(38,'14460202712339u8r4k.png',39611,'image/png','2015/10/28/14460202712339u8r4k.png','2015/10/28/thumbnail/14460202712339u8r4k.png','?file=14460202712339u8r4k.png&dt=2015/10/28',NULL,NULL,NULL,1446020271,NULL),(39,'14460202727781pqo8.png',26823,'image/png','2015/10/28/14460202727781pqo8.png','2015/10/28/thumbnail/14460202727781pqo8.png','?file=14460202727781pqo8.png&dt=2015/10/28',NULL,NULL,NULL,1446020272,NULL),(40,'1446020274274gnqtm.png',305691,'image/png','2015/10/28/1446020274274gnqtm.png','2015/10/28/thumbnail/1446020274274gnqtm.png','?file=1446020274274gnqtm.png&dt=2015/10/28',NULL,NULL,NULL,1446020274,NULL),(41,'1446022913087y9h6d.png',58713,'image/png','2015/10/28/1446022913087y9h6d.png','2015/10/28/thumbnail/1446022913087y9h6d.png','?file=1446022913087y9h6d.png&dt=2015/10/28',NULL,NULL,NULL,1446022913,NULL),(42,'14460229175802s6gf4.png',647817,'image/png','2015/10/28/14460229175802s6gf4.png','2015/10/28/thumbnail/14460229175802s6gf4.png','?file=14460229175802s6gf4.png&dt=2015/10/28',NULL,NULL,NULL,1446022917,NULL),(43,'14460229217485m2fov.png',176256,'image/png','2015/10/28/14460229217485m2fov.png','2015/10/28/thumbnail/14460229217485m2fov.png','?file=14460229217485m2fov.png&dt=2015/10/28',NULL,NULL,NULL,1446022921,NULL),(44,'14460229712053xs2w8.png',176256,'image/png','2015/10/28/14460229712053xs2w8.png','2015/10/28/thumbnail/14460229712053xs2w8.png','?file=14460229712053xs2w8.png&dt=2015/10/28',NULL,NULL,NULL,1446022971,NULL),(45,'14460229727724491gx.png',233202,'image/png','2015/10/28/14460229727724491gx.png','2015/10/28/thumbnail/14460229727724491gx.png','?file=14460229727724491gx.png&dt=2015/10/28',NULL,NULL,NULL,1446022972,NULL),(46,'14460229745835j71la.png',176256,'image/png','2015/10/28/14460229745835j71la.png','2015/10/28/thumbnail/14460229745835j71la.png','?file=14460229745835j71la.png&dt=2015/10/28',NULL,NULL,NULL,1446022974,NULL),(47,'14460229820109zizj3.png',26823,'image/png','2015/10/28/14460229820109zizj3.png','2015/10/28/thumbnail/14460229820109zizj3.png','?file=14460229820109zizj3.png&dt=2015/10/28',NULL,NULL,NULL,1446022982,NULL),(48,'14460230089265kbssn.png',26823,'image/png','2015/10/28/14460230089265kbssn.png','2015/10/28/thumbnail/14460230089265kbssn.png','?file=14460230089265kbssn.png&dt=2015/10/28',NULL,NULL,NULL,1446023008,NULL),(49,'14460230103255zarw1.png',39611,'image/png','2015/10/28/14460230103255zarw1.png','2015/10/28/thumbnail/14460230103255zarw1.png','?file=14460230103255zarw1.png&dt=2015/10/28',NULL,NULL,NULL,1446023010,NULL),(50,'144602301549180nqqg.png',176256,'image/png','2015/10/28/144602301549180nqqg.png','2015/10/28/thumbnail/144602301549180nqqg.png','?file=144602301549180nqqg.png&dt=2015/10/28','','','',1446023015,'15300000002'),(51,'14460230173779flqvu.png',233202,'image/png','2015/10/28/14460230173779flqvu.png','2015/10/28/thumbnail/14460230173779flqvu.png','?file=14460230173779flqvu.png&dt=2015/10/28',NULL,NULL,NULL,1446023017,NULL),(52,'14460230563962g3fvn.png',176256,'image/png','2015/10/28/14460230563962g3fvn.png','2015/10/28/thumbnail/14460230563962g3fvn.png','?file=14460230563962g3fvn.png&dt=2015/10/28',NULL,NULL,NULL,1446023056,NULL),(53,'14460230578403okffc.png',233202,'image/png','2015/10/28/14460230578403okffc.png','2015/10/28/thumbnail/14460230578403okffc.png','?file=14460230578403okffc.png&dt=2015/10/28',NULL,NULL,NULL,1446023057,NULL);
/*!40000 ALTER TABLE `boc_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boc_video`
--

DROP TABLE IF EXISTS `boc_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boc_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(4) DEFAULT NULL COMMENT '栏目id',
  `sort_id` int(11) DEFAULT '0' COMMENT '排序',
  `audit` int(1) DEFAULT '0' COMMENT '0/1审核',
  `flag` int(1) NOT NULL DEFAULT '0' COMMENT '0:1推荐',
  `title` tinytext COMMENT '标题',
  `title_seo` tinytext COMMENT 'seo标题',
  `intro` varchar(500) DEFAULT NULL COMMENT '简介',
  `tags` tinytext COMMENT '标签',
  `content` text COMMENT '内容',
  `url` tinytext COMMENT '外链',
  `video` tinytext COMMENT '视频地址',
  `photo` tinytext COMMENT '封面',
  `thumb` tinytext COMMENT '封面缩略图',
  `show` int(1) DEFAULT '1' COMMENT '是否显示',
  `timeline` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='视频';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boc_video`
--

LOCK TABLES `boc_video` WRITE;
/*!40000 ALTER TABLE `boc_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `boc_video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-05 18:07:33
