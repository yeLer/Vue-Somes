/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : djangocms

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2018-12-12 14:48:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_p_permission_id_f706ac1f34e1773_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_p_permission_id_f706ac1f34e1773_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_7bff5ae97971a001_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_7fd87bd3984749c9_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add book', '7', 'add_book');
INSERT INTO `auth_permission` VALUES ('20', 'Can change book', '7', 'change_book');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete book', '7', 'delete_book');
INSERT INTO `auth_permission` VALUES ('22', 'Can add home lunbo', '8', 'add_homelunbo');
INSERT INTO `auth_permission` VALUES ('23', 'Can change home lunbo', '8', 'change_homelunbo');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete home lunbo', '8', 'delete_homelunbo');
INSERT INTO `auth_permission` VALUES ('25', 'Can add news list', '9', 'add_newslist');
INSERT INTO `auth_permission` VALUES ('26', 'Can change news list', '9', 'change_newslist');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete news list', '9', 'delete_newslist');
INSERT INTO `auth_permission` VALUES ('28', 'Can add news info', '10', 'add_newsinfo');
INSERT INTO `auth_permission` VALUES ('29', 'Can change news info', '10', 'change_newsinfo');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete news info', '10', 'delete_newsinfo');
INSERT INTO `auth_permission` VALUES ('31', 'Can add news comment', '11', 'add_newscomment');
INSERT INTO `auth_permission` VALUES ('32', 'Can change news comment', '11', 'change_newscomment');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete news comment', '11', 'delete_newscomment');
INSERT INTO `auth_permission` VALUES ('34', 'Can add image category', '12', 'add_imagecategory');
INSERT INTO `auth_permission` VALUES ('35', 'Can change image category', '12', 'change_imagecategory');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete image category', '12', 'delete_imagecategory');
INSERT INTO `auth_permission` VALUES ('37', 'Can add photo lists', '13', 'add_photolists');
INSERT INTO `auth_permission` VALUES ('38', 'Can change photo lists', '13', 'change_photolists');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete photo lists', '13', 'delete_photolists');
INSERT INTO `auth_permission` VALUES ('40', 'Can add photo info', '14', 'add_photoinfo');
INSERT INTO `auth_permission` VALUES ('41', 'Can change photo info', '14', 'change_photoinfo');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete photo info', '14', 'delete_photoinfo');
INSERT INTO `auth_permission` VALUES ('43', 'Can add image details', '15', 'add_imagedetails');
INSERT INTO `auth_permission` VALUES ('44', 'Can change image details', '15', 'change_imagedetails');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete image details', '15', 'delete_imagedetails');
INSERT INTO `auth_permission` VALUES ('46', 'Can add goods list', '16', 'add_goodslist');
INSERT INTO `auth_permission` VALUES ('47', 'Can change goods list', '16', 'change_goodslist');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete goods list', '16', 'delete_goodslist');
INSERT INTO `auth_permission` VALUES ('49', 'Can add get goods lun bo', '17', 'add_getgoodslunbo');
INSERT INTO `auth_permission` VALUES ('50', 'Can change get goods lun bo', '17', 'change_getgoodslunbo');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete get goods lun bo', '17', 'delete_getgoodslunbo');
INSERT INTO `auth_permission` VALUES ('52', 'Can add goods info', '18', 'add_goodsinfo');
INSERT INTO `auth_permission` VALUES ('53', 'Can change goods info', '18', 'change_goodsinfo');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete goods info', '18', 'delete_goodsinfo');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_7de238884f3d9ead_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_7de238884f3d9ead_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_1cf39845e21b2071_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_us_permission_id_623a2f02b81a19e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_us_permission_id_623a2f02b81a19e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissio_user_id_70d6130f42f1cb8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_5215d704d228649a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1cbc3bdea98f8789_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_5215d704d228649a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1cbc3bdea98f8789_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_7e97a541d0efe1d0_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'myapp', 'book');
INSERT INTO `django_content_type` VALUES ('17', 'myapp', 'getgoodslunbo');
INSERT INTO `django_content_type` VALUES ('18', 'myapp', 'goodsinfo');
INSERT INTO `django_content_type` VALUES ('16', 'myapp', 'goodslist');
INSERT INTO `django_content_type` VALUES ('8', 'myapp', 'homelunbo');
INSERT INTO `django_content_type` VALUES ('12', 'myapp', 'imagecategory');
INSERT INTO `django_content_type` VALUES ('15', 'myapp', 'imagedetails');
INSERT INTO `django_content_type` VALUES ('11', 'myapp', 'newscomment');
INSERT INTO `django_content_type` VALUES ('10', 'myapp', 'newsinfo');
INSERT INTO `django_content_type` VALUES ('9', 'myapp', 'newslist');
INSERT INTO `django_content_type` VALUES ('14', 'myapp', 'photoinfo');
INSERT INTO `django_content_type` VALUES ('13', 'myapp', 'photolists');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-12-08 02:11:04.114054');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-12-08 02:11:11.470475');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-12-08 02:11:13.254577');
INSERT INTO `django_migrations` VALUES ('4', 'contenttypes', '0002_remove_content_type_name', '2018-12-08 02:11:14.363641');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0002_alter_permission_name_max_length', '2018-12-08 02:11:15.092682');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0003_alter_user_email_max_length', '2018-12-08 02:11:16.088739');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0004_alter_user_username_opts', '2018-12-08 02:11:16.132742');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0005_alter_user_last_login_null', '2018-12-08 02:11:16.666772');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0006_require_contenttypes_0002', '2018-12-08 02:11:16.731776');
INSERT INTO `django_migrations` VALUES ('10', 'myapp', '0001_initial', '2018-12-08 02:11:20.750006');
INSERT INTO `django_migrations` VALUES ('11', 'sessions', '0001_initial', '2018-12-08 02:11:21.593054');
INSERT INTO `django_migrations` VALUES ('12', 'myapp', '0002_imagecategory', '2018-12-08 07:25:24.668816');
INSERT INTO `django_migrations` VALUES ('13', 'myapp', '0003_photolists', '2018-12-08 08:24:22.867190');
INSERT INTO `django_migrations` VALUES ('14', 'myapp', '0004_photoinfo', '2018-12-08 11:46:26.637630');
INSERT INTO `django_migrations` VALUES ('15', 'myapp', '0005_imagedetails', '2018-12-10 01:35:04.377291');
INSERT INTO `django_migrations` VALUES ('16', 'myapp', '0006_goodslist', '2018-12-10 06:08:45.014257');
INSERT INTO `django_migrations` VALUES ('17', 'myapp', '0007_getgoodslunbo', '2018-12-10 08:01:57.443762');
INSERT INTO `django_migrations` VALUES ('18', 'myapp', '0008_goodsinfo', '2018-12-11 06:17:11.883790');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for `myapp_book`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_book`;
CREATE TABLE `myapp_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(64) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_book
-- ----------------------------
INSERT INTO `myapp_book` VALUES ('2', '辟邪剑谱', '2018-12-04 11:17:14.000000');
INSERT INTO `myapp_book` VALUES ('3', '如来神掌', '2018-12-01 11:17:38.000000');
INSERT INTO `myapp_book` VALUES ('19', '天龙八部', '2018-12-07 09:48:45.173358');
INSERT INTO `myapp_book` VALUES ('20', '吸星大法', '2018-12-07 09:48:59.874199');

-- ----------------------------
-- Table structure for `myapp_getgoodslunbo`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_getgoodslunbo`;
CREATE TABLE `myapp_getgoodslunbo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `img_src` varchar(200) NOT NULL,
  `img_msrc` varchar(200) NOT NULL,
  `alt` varchar(80) DEFAULT NULL,
  `catgory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_getgoods_catgory_id_524558ade495651c_fk_myapp_goodslist_id` (`catgory_id`),
  CONSTRAINT `myapp_getgoods_catgory_id_524558ade495651c_fk_myapp_goodslist_id` FOREIGN KEY (`catgory_id`) REFERENCES `myapp_goodslist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_getgoodslunbo
-- ----------------------------
INSERT INTO `myapp_getgoodslunbo` VALUES ('1', '11111', 'https://i8.mifile.cn/a1/pms_1540429668.7636199!560x560.jpg', 'https://farm6.staticflickr.com/5591/15008867125_68a8ed88cc_m.jpg', '111', '1');
INSERT INTO `myapp_getgoodslunbo` VALUES ('2', '22222', 'https://i8.mifile.cn/a1/pms_1540429668.70979601!560x560.jpg', 'https://farm4.staticflickr.com/3902/14985871946_86abb8c56f_m.jpg', '2222', '1');

-- ----------------------------
-- Table structure for `myapp_goodsinfo`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_goodsinfo`;
CREATE TABLE `myapp_goodsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_no` varchar(80) NOT NULL,
  `catgory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_goodsinf_catgory_id_538b1204b89ef1a3_fk_myapp_goodslist_id` (`catgory_id`),
  CONSTRAINT `myapp_goodsinf_catgory_id_538b1204b89ef1a3_fk_myapp_goodslist_id` FOREIGN KEY (`catgory_id`) REFERENCES `myapp_goodslist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_goodsinfo
-- ----------------------------
INSERT INTO `myapp_goodsinfo` VALUES ('1', '小米手机 亮瞎你的双眼', '2018-12-03 14:36:14.000000', '123443424SDADDS', '1');

-- ----------------------------
-- Table structure for `myapp_goodslist`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_goodslist`;
CREATE TABLE `myapp_goodslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `summary` varchar(200) NOT NULL,
  `click_times` int(11) NOT NULL,
  `img_src` varchar(80) NOT NULL,
  `sell_price` double NOT NULL,
  `market_price` double NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_goodslist
-- ----------------------------
INSERT INTO `myapp_goodslist` VALUES ('1', '小米手机 亮瞎你的双眼', '2018-12-03 14:36:14.000000', '111111111111', '12', 'http://localhost:8000/media/images/photoList/132734470_2.jpg', '899', '999', '69');

-- ----------------------------
-- Table structure for `myapp_homelunbo`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_homelunbo`;
CREATE TABLE `myapp_homelunbo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(100) NOT NULL,
  `discription` varchar(100) NOT NULL,
  `url_link` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_homelunbo
-- ----------------------------
INSERT INTO `myapp_homelunbo` VALUES ('1', '/src/images/homelunbo1.jpg', '轮播1', '#');
INSERT INTO `myapp_homelunbo` VALUES ('2', '/src/images/homelunbo2.jpg', '轮播2', '#');
INSERT INTO `myapp_homelunbo` VALUES ('3', '/src/images/homelunbo3.jpg', '轮播3', '#');

-- ----------------------------
-- Table structure for `myapp_imagecategory`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_imagecategory`;
CREATE TABLE `myapp_imagecategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_imagecategory
-- ----------------------------
INSERT INTO `myapp_imagecategory` VALUES ('1', '娱乐');
INSERT INTO `myapp_imagecategory` VALUES ('2', '旅行');
INSERT INTO `myapp_imagecategory` VALUES ('3', '美女');
INSERT INTO `myapp_imagecategory` VALUES ('4', '抽烟');
INSERT INTO `myapp_imagecategory` VALUES ('5', '喝酒');
INSERT INTO `myapp_imagecategory` VALUES ('6', '糖豆');
INSERT INTO `myapp_imagecategory` VALUES ('7', '烫头');

-- ----------------------------
-- Table structure for `myapp_imagedetails`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_imagedetails`;
CREATE TABLE `myapp_imagedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `img_src` varchar(80) NOT NULL,
  `img_msrc` varchar(80) NOT NULL,
  `alt` varchar(80) DEFAULT NULL,
  `catgory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_imagedeta_catgory_id_1f3190b2a3d14a7_fk_myapp_photoinfo_id` (`catgory_id`),
  CONSTRAINT `myapp_imagedeta_catgory_id_1f3190b2a3d14a7_fk_myapp_photoinfo_id` FOREIGN KEY (`catgory_id`) REFERENCES `myapp_photoinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_imagedetails
-- ----------------------------
INSERT INTO `myapp_imagedetails` VALUES ('1', '111111', 'https://i8.mifile.cn/a1/pms_1540429668.71024551!560x560.jpg', 'https://farm6.staticflickr.com/5591/15008867125_68a8ed88cc_m.jpg', '111', '1');
INSERT INTO `myapp_imagedetails` VALUES ('2', '2222', 'https://i8.mifile.cn/a1/pms_1540429668.7636199!560x560.jpg', 'https://farm4.staticflickr.com/3902/14985871946_86abb8c56f_m.jpg', '222', '1');

-- ----------------------------
-- Table structure for `myapp_newscomment`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_newscomment`;
CREATE TABLE `myapp_newscomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `content` varchar(200) NOT NULL,
  `Comment_New_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_newscomment_9c0062f8` (`Comment_New_id`),
  CONSTRAINT `myapp_newsc_Comment_New_id_73b87c84ba30a4a5_fk_myapp_newsinfo_id` FOREIGN KEY (`Comment_New_id`) REFERENCES `myapp_newsinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_newscomment
-- ----------------------------
INSERT INTO `myapp_newscomment` VALUES ('1', '匿名用户', '2018-12-11 10:14:41.000000', '锄禾日当午，汗滴禾下土', '1');
INSERT INTO `myapp_newscomment` VALUES ('2', '张三丰', '2018-12-04 10:16:21.000000', '不知盘中餐，粒粒皆辛苦', '1');
INSERT INTO `myapp_newscomment` VALUES ('3', '赵高', '2018-12-04 10:26:28.000000', '333333333333333333', '1');
INSERT INTO `myapp_newscomment` VALUES ('4', '张无忌', '2018-12-09 10:27:00.000000', '44444444444444444', '1');
INSERT INTO `myapp_newscomment` VALUES ('5', '宋青书', '2018-12-11 10:27:24.000000', '55555555555555555', '1');
INSERT INTO `myapp_newscomment` VALUES ('6', '张宇', '2018-12-22 10:27:48.000000', '66666666666666666', '1');
INSERT INTO `myapp_newscomment` VALUES ('7', '汤家凤', '2018-12-29 10:28:08.000000', '7777777777777777', '1');
INSERT INTO `myapp_newscomment` VALUES ('8', '聂风', '2018-12-12 10:28:38.000000', '8888888888888888', '1');
INSERT INTO `myapp_newscomment` VALUES ('9', '步惊云', '2018-12-03 10:29:02.000000', '9999999999999999', '1');
INSERT INTO `myapp_newscomment` VALUES ('10', '雄霸', '2018-12-05 10:29:22.000000', '1001010010101001', '1');
INSERT INTO `myapp_newscomment` VALUES ('11', '貂蝉', '2018-12-11 10:29:56.000000', '1111111111111111', '1');
INSERT INTO `myapp_newscomment` VALUES ('12', '吕布', '2018-12-07 10:30:26.000000', '1212121212121212', '2');
INSERT INTO `myapp_newscomment` VALUES ('13', '刘备', '2018-12-09 10:30:57.000000', '133131313131313', '1');
INSERT INTO `myapp_newscomment` VALUES ('14', '刘婵', '2018-12-11 10:31:25.000000', '1414141414141441', '2');
INSERT INTO `myapp_newscomment` VALUES ('15', '安琪拉', '2018-12-03 10:31:51.000000', '1515151515151515', '2');
INSERT INTO `myapp_newscomment` VALUES ('16', '小乔', '2018-12-11 11:02:19.000000', '16161616161616161', '1');
INSERT INTO `myapp_newscomment` VALUES ('34', '张无忌', '2018-12-08 06:10:44.960592', '我的九阳神功贼厉害', '1');
INSERT INTO `myapp_newscomment` VALUES ('35', '张无忌', '2018-12-08 06:11:42.984910', '九阳神功体验一下？', '1');
INSERT INTO `myapp_newscomment` VALUES ('36', '张无忌', '2018-12-08 06:11:55.792643', '告辞', '1');
INSERT INTO `myapp_newscomment` VALUES ('37', '张无忌', '2018-12-08 06:13:34.180270', '我来了', '1');
INSERT INTO `myapp_newscomment` VALUES ('41', '张无忌', '2018-12-08 07:18:18.322431', '貂蝉 你好', '2');
INSERT INTO `myapp_newscomment` VALUES ('42', '张无忌', '2018-12-08 12:19:25.672824', '哈哈哈', '1');
INSERT INTO `myapp_newscomment` VALUES ('43', '张无忌', '2018-12-11 07:08:19.164229', '11111', '2');
INSERT INTO `myapp_newscomment` VALUES ('44', '张无忌', '2018-12-11 07:27:40.612660', '锤子手机', '1');

-- ----------------------------
-- Table structure for `myapp_newsinfo`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_newsinfo`;
CREATE TABLE `myapp_newsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `click_times` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `content` varchar(3000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_newsinfo
-- ----------------------------
INSERT INTO `myapp_newsinfo` VALUES ('1', '2018英雄联盟全明星赛 决战拉斯维加斯', '12', '2018-12-19 20:49:09.000000', '<p><p>12月7日，2018年《英雄联盟》全明星赛即将在拉斯维加斯电竞馆拉开序幕，本次全明星赛不仅包含了东西方对决，赛区对抗赛，还有1v1淘汰赛，极限闪击，无限火力，2v2慈善赛，双人共玩等趣味赛事。</p>今年的全明星赛中，赛制回归了娱乐性更强的形式。除了保留1v1Solo对抗外，还新增设了2v2慈善锦标赛，选手们将在哀嚎深渊地\\\r\n        图上进行2v2的比赛。参赛人员将会以自己的名义，在拳头游戏卡尔玛慈善部门的帮助下挑选相应的慈善项目，并进行表演赛。同时，\\\r\n        在本届全明星赛中还将上演由东方选手与西方选手各自组队进行的东西方全明星对决，还有洲际系列赛的全明星改版!除此之外，\\\r\n        每天还将有两支混编队伍，进行另类游戏模式的比赛。全程创意满满的娱乐对战，相信能给玩家们带来非凡的观赛体验。\\\r\n        </p><div class=\"img-container\"><img class=\"large\" data-loadfunc=0 src=\"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2510180609,2693572841&amp;fm=173&amp;app=25&amp;f=JPEG?w=600&amp;h=450&amp;s=34E1B20A21038AED181BC2840300608D\" data-loaded=0 /></div><p>在此前LPL赛区的全明星投票中，RNG战队的AD选手Uzi与打野选手Mlxg，凭借着全年的出色表现以超高人气占据了得票数的前两位。而率领iG夺得2018全球总决赛冠军的中单选手Rookie，则获得了官方直邀资格。三人将作为LPL赛区职业选手代表，在本次全明星赛中出战大部分对抗。而拿下总决赛MVP的iG打野选手Ning，则将作为特别嘉宾参与双人共玩模式。此外，LPL赛区的参赛嘉宾还有明星召唤师罗云熙、官方主持余霜与官方解说周淑怡，此外还有玩家们所熟悉的明星主播神超、官总、骚男等，他们将秉承着娱乐至上的精神，共同参与到本次的赛事中来。</p><div class=\"img-container\"><img class=\"large\" data-loadfunc=0 src=\"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1442676014,4040923520&amp;fm=173&amp;app=25&amp;f=JPEG?w=600&amp;h=450&amp;s=33A3930C444733ED9A3BC68D0300609F\" data-loaded=0 /></div><p>其他赛区中，玩家们所熟悉的“大魔王”Faker、“小花生”Peanut、“大师兄”Doublelift等明星选手，都将参与到本次的赛事中来。此外，在全球总决赛上表现亮眼的C9上单选手Licorice、FNC打野选手Broxah与VIT中单选手Jiizuke等人，也同样不会缺席本次全明星赛。</p><div class=\"img-container\"><img class=\"large\" data-loadfunc=0 src=\"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1343299835,549296841&amp;fm=173&amp;app=25&amp;f=JPEG?w=600&amp;h=337&amp;s=92A7A1AE08DB28DA5B744EAF0300F086\" data-loaded=0 /></div><p>在经历了一年中紧张激烈得赛事后，回归娱乐主题的全明星赛相信将给玩家们带来更加轻松欢乐的观赛体验。</p>');
INSERT INTO `myapp_newsinfo` VALUES ('2', '2222222222222222222', '10', '2018-12-10 10:15:43.000000', '222222222222222222222222222');

-- ----------------------------
-- Table structure for `myapp_newslist`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_newslist`;
CREATE TABLE `myapp_newslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `summary` varchar(100) DEFAULT NULL,
  `click_times` int(11) NOT NULL,
  `url_link` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_newslist
-- ----------------------------
INSERT INTO `myapp_newslist` VALUES ('1', '能和心爱的人一起睡觉...', '2018-12-05 19:59:41.000000', '111111111111', '3', '/src/images/shuijiao.jpg');
INSERT INTO `myapp_newslist` VALUES ('2', '想要这样一间小木屋...', '2018-12-13 20:00:18.000000', '', '5', '/src/images/muwu.jpg');
INSERT INTO `myapp_newslist` VALUES ('3', '小兔子乖乖', '2018-12-19 20:25:41.000000', '3333', '3', '/src/images/shuijiao.jpg');
INSERT INTO `myapp_newslist` VALUES ('4', '4', '2018-12-11 20:27:38.000000', '4', '4', '/src/images/muwu.jpg');
INSERT INTO `myapp_newslist` VALUES ('5', '5', '2018-12-10 20:27:54.000000', '5', '5', '/src/images/muwu.jpg');
INSERT INTO `myapp_newslist` VALUES ('6', '6', '2018-12-02 20:28:05.000000', '6', '6', '/src/images/muwu.jpg');
INSERT INTO `myapp_newslist` VALUES ('7', '7', '2018-12-01 20:28:18.000000', '7', '7', '/src/images/muwu.jpg');
INSERT INTO `myapp_newslist` VALUES ('8', '8', '2018-12-29 20:29:01.000000', '8', '8', '/src/images/muwu.jpg');
INSERT INTO `myapp_newslist` VALUES ('9', '9', '2018-12-12 20:29:19.000000', '9', '9', '/src/images/muwu.jpg');
INSERT INTO `myapp_newslist` VALUES ('10', '10', '2018-12-15 20:29:40.000000', '10', '10', '/src/images/muwu.jpg');

-- ----------------------------
-- Table structure for `myapp_photoinfo`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_photoinfo`;
CREATE TABLE `myapp_photoinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `click_times` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `catgory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_photoin_catgory_id_52c38c66daffd552_fk_myapp_photolists_id` (`catgory_id`),
  CONSTRAINT `myapp_photoin_catgory_id_52c38c66daffd552_fk_myapp_photolists_id` FOREIGN KEY (`catgory_id`) REFERENCES `myapp_photolists` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_photoinfo
-- ----------------------------
INSERT INTO `myapp_photoinfo` VALUES ('1', '国内难得的20个旅行体验，实现10个算你厉害！', '3', '2018-12-10 19:48:41.000000', '不去外面看看，你永远不知道世界有多精彩。不踏上旅途，你永远不知道生活有多缤纷。“旅”是旅行，外出，即为了实现某一目的而在空间上从甲地到乙地的行进过程；“游”是外出游览、观光、娱乐，即为达到这些目的所作的旅行。二者合起来即旅游。所以，旅行偏重于行，旅游不但有“行”，且有观光、娱乐含义。', '1');
INSERT INTO `myapp_photoinfo` VALUES ('2', '带父母旅行真的不是一件轻松的事！', '1', '2018-12-03 20:05:36.000000', '很多朋友也很有共鸣，我们旅行追求好玩刺激，长辈希望别太折腾。我们一定要吃的当地美食，长辈往往吃不惯，我们喜欢体验夜生活睡到自然醒，长辈都习惯早睡早起', '2');

-- ----------------------------
-- Table structure for `myapp_photolists`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_photolists`;
CREATE TABLE `myapp_photolists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `img_url` varchar(100) NOT NULL,
  `summary` varchar(200) NOT NULL,
  `catgory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_phot_catgory_id_7cfed01dfda1c343_fk_myapp_imagecategory_id` (`catgory_id`),
  CONSTRAINT `myapp_phot_catgory_id_7cfed01dfda1c343_fk_myapp_imagecategory_id` FOREIGN KEY (`catgory_id`) REFERENCES `myapp_imagecategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_photolists
-- ----------------------------
INSERT INTO `myapp_photolists` VALUES ('1', '电子游戏', 'http://localhost:8000/media/images/photoList/yl1.jpg', '这里是电子游戏的大厅', '1');
INSERT INTO `myapp_photolists` VALUES ('2', '吹什么啊', 'http://localhost:8000/media/images/photoList/yl2.jpg', '这个人在吹什么啊', '1');
INSERT INTO `myapp_photolists` VALUES ('3', '餐馆', 'http://localhost:8000/media/images/photoList/yl3.jpg', '好像是一个餐馆', '1');
INSERT INTO `myapp_photolists` VALUES ('4', '木马', 'http://localhost:8000/media/images/photoList/yl4.jpg', '旋转的木马', '1');
INSERT INTO `myapp_photolists` VALUES ('5', '女孩', 'http://localhost:8000/media/images/photoList/lx1.jpg', '火车旁的女孩', '2');
INSERT INTO `myapp_photolists` VALUES ('6', '爬山', 'http://localhost:8000/media/images/photoList/lx2.jpg', '山高人为峰', '2');
