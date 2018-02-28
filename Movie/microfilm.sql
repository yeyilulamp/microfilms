/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : microfilm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-02-11 00:05:00
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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

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
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('20', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('21', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('23', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 用户信息', '7', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 用户信息', '7', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 用户信息', '7', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 轮播图', '9', 'add_pagebanner');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 轮播图', '9', 'change_pagebanner');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 轮播图', '9', 'delete_pagebanner');
INSERT INTO `auth_permission` VALUES ('34', 'Can view 轮播图', '9', 'view_pagebanner');
INSERT INTO `auth_permission` VALUES ('36', 'Can view 用户信息', '7', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 电影评论', '10', 'add_moviecomments');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 电影评论', '10', 'change_moviecomments');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 电影评论', '10', 'delete_moviecomments');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 用户收藏', '11', 'add_userfavorite');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 用户收藏', '11', 'change_userfavorite');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 用户收藏', '11', 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES ('43', 'Can view 电影评论', '10', 'view_moviecomments');
INSERT INTO `auth_permission` VALUES ('44', 'Can view 用户收藏', '11', 'view_userfavorite');
INSERT INTO `auth_permission` VALUES ('45', 'Can add 电影信息', '12', 'add_movie');
INSERT INTO `auth_permission` VALUES ('46', 'Can change 电影信息', '12', 'change_movie');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete 电影信息', '12', 'delete_movie');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 电影信息', '12', 'view_movie');
INSERT INTO `auth_permission` VALUES ('49', 'Can add Bookmark', '13', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('50', 'Can change Bookmark', '13', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete Bookmark', '13', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('52', 'Can add User Setting', '14', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('53', 'Can change User Setting', '14', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete User Setting', '14', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('55', 'Can add User Widget', '15', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('56', 'Can change User Widget', '15', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete User Widget', '15', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('58', 'Can add log entry', '16', 'add_log');
INSERT INTO `auth_permission` VALUES ('59', 'Can change log entry', '16', 'change_log');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete log entry', '16', 'delete_log');
INSERT INTO `auth_permission` VALUES ('61', 'Can view Bookmark', '13', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('62', 'Can view log entry', '16', 'view_log');
INSERT INTO `auth_permission` VALUES ('63', 'Can view User Setting', '14', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('64', 'Can view User Widget', '15', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('65', 'Can add captcha store', '17', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('66', 'Can change captcha store', '17', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete captcha store', '17', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('68', 'Can view captcha store', '17', 'view_captchastore');
INSERT INTO `auth_permission` VALUES ('69', 'Can add 邮箱验证码', '18', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('70', 'Can change 邮箱验证码', '18', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete 邮箱验证码', '18', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 邮箱验证码', '18', 'view_emailverifyrecord');

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
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `captcha_captchastore`
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES ('56', 'CXOV', 'cxov', 'ad678b84dd2d92bca2b9226ae4040637f7443be1', '2018-02-07 01:41:00.681000');
INSERT INTO `captcha_captchastore` VALUES ('57', 'VRKL', 'vrkl', '8e4ddb9a2dd60c6121a943de2678031b171e981a', '2018-02-07 01:41:54.715000');
INSERT INTO `captcha_captchastore` VALUES ('58', 'KODA', 'koda', '5aad117a2802e4c3af1d2c11107dcba5b8fe91d1', '2018-02-07 01:48:16.201000');
INSERT INTO `captcha_captchastore` VALUES ('59', 'QTHO', 'qtho', 'e1182b826d1f3f8405392984f96678b6208dd3f4', '2018-02-07 01:48:18.368000');
INSERT INTO `captcha_captchastore` VALUES ('60', 'SAXH', 'saxh', '2d55d635c20dce716099c239550d64ca9eb20b62', '2018-02-07 01:48:20.614000');
INSERT INTO `captcha_captchastore` VALUES ('61', 'WMUH', 'wmuh', '2d6411a86fa3d12b6a9c48cd26c395bd0015c16e', '2018-02-07 01:49:20.192000');
INSERT INTO `captcha_captchastore` VALUES ('62', 'USSM', 'ussm', '08d76310c783af90752fa64f90fab5bcdc4cc44b', '2018-02-08 02:24:51.291000');
INSERT INTO `captcha_captchastore` VALUES ('63', 'AQJT', 'aqjt', 'b78b940d984b61307c740e8acfe794af68a4354a', '2018-02-08 02:24:56.740000');
INSERT INTO `captcha_captchastore` VALUES ('64', 'WJYU', 'wjyu', 'ebf3cfc7be76b83ec9adacd3bec538be5823e3a8', '2018-02-09 01:51:19.207000');
INSERT INTO `captcha_captchastore` VALUES ('65', 'WXKA', 'wxka', 'bc1cb637e37e46eb5a658b8fafb2226718631c50', '2018-02-09 01:52:11.055000');
INSERT INTO `captcha_captchastore` VALUES ('66', 'SLCN', 'slcn', '0d3b872d7d03f25e74acebd4eff2fee63b62a594', '2018-02-09 01:52:18.427000');
INSERT INTO `captcha_captchastore` VALUES ('67', 'AQGS', 'aqgs', '16cfcf766ba9fcb32ecbc58ba3e04c8f07257c0a', '2018-02-09 16:11:00.258000');
INSERT INTO `captcha_captchastore` VALUES ('68', 'KHQF', 'khqf', 'bdb0a1312ba67a15a2c2b943bf3ad00073ba61a5', '2018-02-09 16:12:21.786000');
INSERT INTO `captcha_captchastore` VALUES ('69', 'VDOY', 'vdoy', 'a1a058c18f3fba83fcbd50b8000f909ae01bff23', '2018-02-10 00:25:10.670000');
INSERT INTO `captcha_captchastore` VALUES ('70', 'NWUY', 'nwuy', 'f55595f52662a458b3d012e69773167be91ff055', '2018-02-10 00:25:25.149000');
INSERT INTO `captcha_captchastore` VALUES ('71', 'JDWG', 'jdwg', '572b5a4fd51eb12bbdc90277c11732beb2fc899b', '2018-02-10 02:00:29.291000');
INSERT INTO `captcha_captchastore` VALUES ('72', 'ALGS', 'algs', 'd103092ddf49151f0334b81089b0a69a43884106', '2018-02-10 23:09:36.962000');
INSERT INTO `captcha_captchastore` VALUES ('73', 'ACPZ', 'acpz', 'c8cdd5cede38fe25f0b249be144f3e23c2330780', '2018-02-10 23:10:16.867000');
INSERT INTO `captcha_captchastore` VALUES ('74', 'WHXD', 'whxd', '16d593bdf04da1e1b927c6012356a4e19a14f574', '2018-02-10 23:10:25.753000');

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
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('17', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('12', 'movies', 'movie');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('18', 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('9', 'users', 'pagebanner');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('10', 'user_operation', 'moviecomments');
INSERT INTO `django_content_type` VALUES ('11', 'user_operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES ('13', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('16', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('14', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('15', 'xadmin', 'userwidget');

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-02-05 22:12:46.598000');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-02-05 22:13:00.658000');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-02-05 22:13:05.911000');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-02-05 22:13:06.082000');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-02-05 22:13:07.348000');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2018-02-05 22:13:08.360000');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2018-02-05 22:13:09.285000');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2018-02-05 22:13:09.373000');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2018-02-05 22:13:09.819000');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2018-02-05 22:13:09.846000');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-02-05 22:13:09.883000');
INSERT INTO `django_migrations` VALUES ('12', 'sessions', '0001_initial', '2018-02-05 22:13:10.879000');
INSERT INTO `django_migrations` VALUES ('17', 'xadmin', '0001_initial', '2018-02-06 00:15:00.660000');
INSERT INTO `django_migrations` VALUES ('18', 'xadmin', '0002_log', '2018-02-06 00:15:03.089000');
INSERT INTO `django_migrations` VALUES ('19', 'xadmin', '0003_auto_20160715_0100', '2018-02-06 00:15:04.039000');
INSERT INTO `django_migrations` VALUES ('20', 'captcha', '0001_initial', '2018-02-06 19:25:47.664000');
INSERT INTO `django_migrations` VALUES ('39', 'users', '0001_initial', '2018-02-10 22:22:24.109000');
INSERT INTO `django_migrations` VALUES ('40', 'users', '0002_emailverifyrecord', '2018-02-10 22:22:24.204000');
INSERT INTO `django_migrations` VALUES ('41', 'users', '0003_auto_20180206_2111', '2018-02-10 22:22:24.290000');
INSERT INTO `django_migrations` VALUES ('42', 'users', '0004_remove_pagebanner_url', '2018-02-10 22:22:24.400000');
INSERT INTO `django_migrations` VALUES ('43', 'users', '0005_auto_20180209_0118', '2018-02-10 22:22:24.489000');
INSERT INTO `django_migrations` VALUES ('44', 'users', '0006_auto_20180209_1557', '2018-02-10 22:22:24.544000');
INSERT INTO `django_migrations` VALUES ('45', 'movies', '0001_initial', '2018-02-10 22:29:29.175000');
INSERT INTO `django_migrations` VALUES ('46', 'movies', '0002_auto_20180210_2231', '2018-02-10 22:31:23.543000');
INSERT INTO `django_migrations` VALUES ('47', 'movies', '0003_auto_20180210_2232', '2018-02-10 22:32:16.107000');
INSERT INTO `django_migrations` VALUES ('48', 'movies', '0004_auto_20180210_2251', '2018-02-10 22:51:54.397000');
INSERT INTO `django_migrations` VALUES ('49', 'movies', '0005_auto_20180210_2300', '2018-02-10 23:01:02.905000');

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
INSERT INTO `django_session` VALUES ('ir4uova6yc13en40jamh74w3ywf8nsmh', 'NmJlNGNkNWNiZTI0MTA4YjIxMzhkOGY4NWJlYzFhM2JiYmE4YWYwMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1sibW92aWVzIiwibW92aWUiXSwiX3FfPSJdLCJfYXV0aF91c2VyX2hhc2giOiIyMDk4ZGZlNDUzODU1MjAwMGNmZDE4YzVhZTQ4ODBlNzAwZmEyZTUzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCJ9', '2018-02-21 20:23:52.230000');

-- ----------------------------
-- Table structure for `movies_movie`
-- ----------------------------
DROP TABLE IF EXISTS `movies_movie`;
CREATE TABLE `movies_movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `star` varchar(5) NOT NULL,
  `play_nums` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `video_times` varchar(30) NOT NULL,
  `area` varchar(20) NOT NULL,
  `release_time` date NOT NULL,
  `detail` longtext NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `comment_nums` int(11) NOT NULL,
  `movie_tag` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movies_movie
-- ----------------------------
INSERT INTO `movies_movie` VALUES ('1', '狗的故事', 'movies/2018/02/dog.jpg', 'xxxx', '19', 'http://qiniu-video5.vmoviercdn.com/5a5f0a7a1601f.mp4', '16:57', '美国', '2017-10-20', '<p>本片是由Meirzhan Sandybay制作的2D动画短片，以黑白动画的形式讲述了一只流浪狗拯救人类弃婴的故事。</p><p>狗希望能够引起人们的注意，然后发现被遗弃的小孩，从最开始的不领人类给的食物，到后来的偷东西，它的举动并没有收到效果。于是它变得咄咄逼人，最终为了救孩子而献出了自己的生命，这也使每个人都意识到自己之前对它的误解。</p><p>当你认为这个故事已经结束时，它又重新开始了。影片以闪回的形式再现了狗的视角，狗的人性和和人们的漠视形成鲜明的对比。而且，狗眼里的世界是彩色的，人们看到的却是一片黑白。</p><p><br/> </p>', '2018-02-07 13:43:00.000000', '1', '0', '剧情');
INSERT INTO `movies_movie` VALUES ('2', '你给我听好，都是为你好', 'movies/2018/02/ChineseNewYear.jpg', 'xxxxx', '31', 'http://cdn-video.xinpianchang.com/5a68ad46a1239.mp4', '07:50', '中国大陆', '2018-01-25', '<p>2018春节将至，又到了归家的时刻...</p><p>还没长大的时候，我们和爸妈住在一起，他们那些唠叨的、固执的点点滴滴现在还依稀可见。而过年回家，这些东西又要一股脑地翻涌回来。这支来自<a href=\"http://www.xinpianchang.com/u10231759?from=articleList\" target=\"_blank\" title=\"\">新世相</a>的故事短片就以这样的调子，开始了春节回家的故事讲述。</p><p>的确，曾经的我们彼此嫌弃、互相蹂躏，然而这些点滴却成为了珍贵无比的稀缺品。他们那么任性地爱我，为啥我就不能任性地爱他们呢？于是影片的反转出现了，小时候爸妈对我怎么“爱”，我现在要双倍“爱”回去。在他们说不要的时候给他们拥抱，和他们争夺主厨的位子，让他们在众目睽睽之下吃我做的可爱便当...\r\n 所谓相爱相杀，只能留给最亲近的爹妈。因为，无论什么时候，爸妈那份爱永远都是我们在外走下去的坚实后盾。</p><p>PS：千万不要错过片尾文字分享，绝对是本片精华所在。</p><p><br/> </p>', '2018-02-07 14:52:00.000000', '1', '0', '剧情');
INSERT INTO `movies_movie` VALUES ('3', '被遗弃的', 'movies/2018/02/60w540h1e1c.jpg', 'xxxx', '50', 'http://qiniu-vmovier5.vmoviercdn.com/597efcc1d7716.mp4', '09:38', '中国香港', '2013-07-01', '<p><span style=\"text-indent: 2em;\">公益微电影《被遗弃的》是梁咏琪自编自导，林嘉欣主演的一部作品。故事讲述老人过身后，一只老狗的遭遇。</span></p><p>片中林嘉欣与林云中饰演一对表亲，他们的母亲去世了，为了给母亲办理后事，林嘉欣带着女儿从外地返回香港，把母亲殓葬之后，留下了一只多年陪伴婆婆左右的老狗。林嘉欣与女儿想给狗狗找一个新家，故四处奔走，希望为老狗寻觅新主人，可惜事与愿违。最后，林与狗的相处当中想起了自己的妈妈，也感受到女儿和主人应尽的责任，于是她决定，让老狗与自己一起生活，养着它，照顾它。\r\n\r\n影片由梁咏琪执导，与好友林嘉欣首度合作，热爱动物的两人一拍即合。GIGI亲自撰写剧本，改编亲身经历，希望观众关注年老动物问题和孤寡老人问题。而主演林嘉欣虽然怀孕，也特别从加拿大返港参与拍摄，呼吁观众不要遗弃动物，要尊重生命。GIGI坦言拍摄对像为儿童和小狗，对导演的执行能力的要求非常高，幸好小狗表现专业，影片得以顺利完成。\r\n\r\n而拍摄动机，梁咏琪说：“在构思剧本时，我家里刚好有一只养了十多年的老狗，它是在我们家出生的金毛寻回犬，已经老的奄奄一息。但我们没有放弃她，依旧日夜照顾一只到她几天前往生走了。有感动物老去不时成为不少主人遗弃动物的借口，故想到拍摄这样一个故事。”\r\n\r\n拒绝遗弃，及时拥抱爱，请大家身体力行关爱动物们。它们陪了父母半辈子，我们也该陪它们半辈子</p>', '2018-02-07 18:21:00.000000', '0', '1', '剧情');
INSERT INTO `movies_movie` VALUES ('4', '两束光', 'movies/2018/02/maxresdefa.jpg', 'xxxx', '13', 'http://cdn-video.xinpianchang.com/5a4def6a087de.mp4', '30:47', '韩国', '2017-12-21', '<p>黑夜给了我黑色的眼睛，我却用它寻找光明。世界上有这么一群视觉障碍者，他们勇敢直面命运的捉弄，主动掀开被上帝遮住的眼帘，不仅笑着生活，更创造美好，堪称灵魂的强者。短片《两束光》由著名导演许秦豪执导，讲述了一起参加摄影协会的两个男女日久生情的故事。</p><p>影片以十分克制的镜头语言，温暖更不乏真实的力量呈现，对小美好爱情的深切寄望，让观众了解到视觉障碍者这一弱势群体的生活和情感、精神和梦想。值得一提的是，还有女主韩志旼真的不是带了美瞳，她是认真练了很久才出来那样的效果的。而在结尾歌曲结束后那一段彩蛋，是真实发生的事情，真实是最让人动容的，比心~</p>', '2018-02-10 15:26:00.000000', '0', '0', '爱情');
INSERT INTO `movies_movie` VALUES ('5', '我的中学时代', 'movies/2018/02/wdgzsd.jpg', 'xxxx', '7', 'http://qiniu-vmovier5.vmoviercdn.com/5975e9166e22c.mp4', '36:18', '中国大陆', '2012-07-13', '<p>国内80后导演林旭坚首部剧情片，片子以细致温婉的画面，将一段念念不忘的暗恋情怀，将一段懵懂朦胧的中学回忆，予以了细腻的表现。</p><p>这一部微电影，关于青春，关于回忆，它更像是主人公林依婷的一段回忆。中学时的她，默默地喜欢着帅气的体育老师，内向含蓄的她悄悄的将老师的照片摘下来，拿去照相馆缩印。而她却没有发现，照相馆的老爷爷就是体育老师的父亲。体育老师在暗室里洗毕业照，那一张被摘下来的照片就静静的呆在桌台上。</p><p>暗恋情怀在这一部片子上抒发到了极致，整个片子从前期的铺垫，到细节的刻画，音乐的选取都在营造暗恋时难以言表的心绪。长达三十分钟的影片里，别无其他，而中学时代的其他回忆，甚至是高考，影片都是一笔带过。缺乏了这些细节的烘托，这部片子就变成了纯粹的个人回忆，对于“中学时代”这个片名来说，片子就显得单薄了。</p><p>值得一提的是，本片将于2013年2月登陆央视六套。</p><p><br/> </p>', '2018-02-10 15:57:00.000000', '0', '0', '剧情');
INSERT INTO `movies_movie` VALUES ('6', '法国唯美奇幻动画短片《告别》', 'movies/2018/02/5a1404c95c3a2_cut..jpg', 'xxxxx', '2', 'http://qiniu-video5.vmoviercdn.com/5a1407e66934b.mp4', '07:20', '法国', '2017-11-22', '<p>本片是来自Youtube \r\nESMA频道的一则唯美奇幻动画短片。一名女子在怀孕期间失去了宝宝，当听到窗外孩子们笑声，看见为宝宝准备的摇篮，独自在房间默默的伤心。她用绘画来填充悲伤，融情于景手绘鸟宝宝竟然意外有了生命。它到来将打开这位年轻艺术家的心灵，在悲伤的泪水之上开出一朵带笑的花来。</p>', '2018-02-10 18:10:00.000000', '0', '0', '奇幻');
INSERT INTO `movies_movie` VALUES ('7', '通往你的道路', 'movies/2018/02/TIM20171122141614.jpg', 'xxxx', '12', 'http://cdn-video.xinpianchang.com/5a1516d8409d8.mp4', '03:29', '日本', '2017-12-03', '<p>在这忙碌的雪国夜晚，一年一度灯光秀即将开始，三个关于爱的小事交织在一起，成为这个寒冷冬夜的奇迹。本片是邓禄普轮胎在日本推出的品牌短片，这个冬天，你也一定会想要见你的重要的人。对恋人的爱，对家人的爱，对家乡的爱——为了各自的爱开始奔跑，因为通往你的道路就在脚下。</p>', '2018-02-10 18:18:00.000000', '0', '0', '剧情');
INSERT INTO `movies_movie` VALUES ('8', '极速营救', 'movies/2018/02/52dc9ce90d381.jpg', 'xxx', '1', 'http://qiniu-vmovier5.vmoviercdn.com/597664a23cac3.mp4', '25:04', '中国大陆', '2013-08-06', '<p>在一场见证爱情的婚礼上，新娘的小侄女落入了人贩子的圈套，被拐走。年轻的一对新人立刻暂停了婚礼，驾驶着婚车疯狂寻找，在众人的齐力帮助下，他们与人贩子斗智斗勇，展开了一场与犯罪分子的“生死时速”。<br/>本片由出身电影世家的新锐导演杜童执导，以“解救被拐儿童”为题材，进行了为期4天的拍摄。提及拍摄此部影片的初衷，杜童透露，在中国电影史上，这类题材的公安影片可以说屡见不鲜，但以此为题材的公益性微电影却是寥寥无几。他曾经在一个主题为《孩子》的画展上，听到50对被拐儿童的父母，声泪俱下地诉说着他们的故事，再结合每一幅展出的画面，这位80后新锐导演被深深的触动了，“失去孩子真的很痛苦，希望能够借以此片，呼吁全社会儿童的安全、健康，坚决不给犯罪分子有机可乘，也算是一份传递正能量吧。”<br/>作为一部题材相对稀缺的打拐题材微电影，本片包含了对社会热点问题的关注与深思。这是一部典型的“以小塑大、用爱传递”微电影作品，大爱无形，点滴的关爱就能汇聚成无形安全网，希望我们的孩子都能在幸福、健康的环境下长大。</p>', '2018-02-10 23:10:00.000000', '0', '0', '剧情');
INSERT INTO `movies_movie` VALUES ('9', '人生不过76000多顿饭', 'movies/2018/02/5a6aa5a1af3c0_cut_OKPJTHL.jpg', 'xxxx', '2', 'http://qiniu-xpc5.vmoviercdn.com/5a6aa25e8be53.mp4', '03:17', '中国大陆', '2018-01-28', '<p>百度外卖扎心广告</p><p>本片由新片场创作人<a href=\"http://www.xinpianchang.com/u10001791\" target=\"_blank\" title=\"\">鲸梦文化</a>出品，<a href=\"http://www.xinpianchang.com/u10015773\" target=\"_blank\" title=\"\">张鹏梧</a>为剪辑师，<a href=\"http://www.xinpianchang.com/u10004016\" target=\"_blank\" title=\"\">王天行</a>担任摄影指导。</p><p>喜欢吃火锅，也喜欢吃盖浇饭。喜欢一个人去寻着自己爱的那家店天天吃，把桌上的菜单都背下来。也喜欢三五朋友一起找一家没有去过的店，开一瓶可乐或碰一杯啤酒。</p><p>这些饭里，有日常上班的加班餐，也有周末一个人在出租屋，胡乱叫来的外卖。在吃的时候，你甚至分不清自己吃得连是早饭还是午饭，只是知道饿了用来必须要吃，要填饱那个有些酸痛的腹部，也喂饱那个疲惫不堪的身体。</p><p>因为余下的日子里，这样的时候还有很多，而为了生活，就只能就着心酸泪，机械地咀嚼，而后咽下。</p><p>那些融进我们血肉里的每一顿饭，不仅构成了我们的身体，也完整地记录了我们的人生。</p><p>你靠它去充饥，也靠它去画饼，靠它去让世界认识你，也要靠它去投喂你那生长的梦想。人生不过就是这76000多顿饭，酸甜苦辣都是滋味，每顿饭都值得用心被对待。</p><p><br/> </p>', '2018-02-10 23:29:00.000000', '0', '0', '广告');
INSERT INTO `movies_movie` VALUES ('10', '反叛的童谣', 'movies/2018/02/5a793f8622092_cut.jpg', 'xxxx', '1', '//qiniu-video5.vmoviercdn.com/5a79101e2687b.mp4', '27:39', '英国', '2016-12-26', '<p>第90届奥斯卡提名已经出炉，动画短片们虽不是绝对主角，但短小精悍、画风美观的动画短片每年都能吸引到较多的目光。在今年提名的五部短片中，分上、下两集，总长度将近1小时的《反叛的童谣》与其它短小精悍的影片形成了鲜明的对比。拍得长不但容易引起观影疲倦，在评委面前也容易出错不讨喜。那么这部《反叛的童谣》成色到底如何呢？</p>', '2018-02-10 23:53:00.000000', '0', '0', '动画');

-- ----------------------------
-- Table structure for `users_emailverifyrecord`
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(50) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES ('1', 'k4L9piFlhGUHN6f6', 'yeyilulamp@sina.com', 'register', '2018-02-06 21:13:06.654000');
INSERT INTO `users_emailverifyrecord` VALUES ('2', 'i54UhLHS2KVJMoe2', 'yeyilulamp@sina.com', 'forget', '2018-02-07 01:03:26.534000');
INSERT INTO `users_emailverifyrecord` VALUES ('3', 'EPuq', 'yeyilulamp@sina.com', 'update_email', '2018-02-09 00:22:03.344000');
INSERT INTO `users_emailverifyrecord` VALUES ('4', 'Peds', 'yeyilulamp@sina.com', 'update_email', '2018-02-09 00:30:27.134000');

-- ----------------------------
-- Table structure for `users_pagebanner`
-- ----------------------------
DROP TABLE IF EXISTS `users_pagebanner`;
CREATE TABLE `users_pagebanner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_pagebanner
-- ----------------------------
INSERT INTO `users_pagebanner` VALUES ('1', '结局催泪动画短片《狗的故事》', 'banner/2018/02/banner-dog.jpg', '1', '2018-02-07 13:57:00.000000');
INSERT INTO `users_pagebanner` VALUES ('2', '君の名は。', 'banner/2018/02/201709091050567c06b47981e74e9a9bf83bd98722f701.jpg', '2', '2018-02-07 14:07:00.000000');
INSERT INTO `users_pagebanner` VALUES ('3', '战狼Ⅱ  一朝是战狼 终身是战狼', 'banner/2018/02/2017090910485088605afd6ab442b8a07bb124b712a71c.jpg', '3', '2018-02-07 14:16:00.000000');
INSERT INTO `users_pagebanner` VALUES ('4', '三生三世十里桃花', 'banner/2018/02/201709091049446824b023458e467da24cab74dfddaa27.jpg', '4', '2018-02-07 14:18:00.000000');
INSERT INTO `users_pagebanner` VALUES ('5', '蝙蝠侠大战超人：正义黎明', 'banner/2018/02/201709091052115b74dd208f7849e78d3e92d018e808a5.jpg', '5', '2018-02-07 14:20:00.000000');

-- ----------------------------
-- Table structure for `users_userprofile`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
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
  `nick_name` varchar(50) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `birday` date,
  `gender` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$24000$BNMtYXMpzbv2$GdU7ycCmv09wFphMhGwBeMd70Hy3bQIl/H0KSf9SWUY=', '2018-02-10 23:05:59.067000', '1', 'admin', '', '', '1554916519@qq.com', '1', '1', '2018-02-06 00:21:11.846000', '', null, 'image/2018/02/2f128_MFAaWgR.png', '', null, '女');
INSERT INTO `users_userprofile` VALUES ('4', 'pbkdf2_sha256$24000$5wFbagadB98g$iusYRiMSng0FON/dOmKdYa7xmNWXNmEh8L/aO/1YomQ=', '2018-02-11 00:00:46.369000', '0', 'yeyilulamp@sina.com', '', '', 'yeyilulamp@sina.com', '0', '1', '2018-02-06 21:13:06.559000', '边城__', '13267704812', 'image/2018/02/2f126.jpg', '银河系地球', '1996-08-18', 'male');

-- ----------------------------
-- Table structure for `users_userprofile_groups`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `users_userprofile_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `user_operation_moviecomments`
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_moviecomments`;
CREATE TABLE `user_operation_moviecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_moviecomments_d1b173c8` (`movie_id`),
  KEY `user_operation_moviecomments_e8701ad4` (`user_id`),
  CONSTRAINT `user_operation_moviecom_user_id_11deefe4_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `user_operation_moviecomment_movie_id_2588288c_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operation_moviecomments
-- ----------------------------
INSERT INTO `user_operation_moviecomments` VALUES ('1', '很好看', '2018-02-08 01:45:38.396000', '2', '4');
INSERT INTO `user_operation_moviecomments` VALUES ('2', 'very good！ O(∩_∩)O哈哈~', '2018-02-08 02:22:03.777000', '3', '4');
INSERT INTO `user_operation_moviecomments` VALUES ('3', '大家好！请会员们遵守文明用语，对本网站评论用语涉及政治敏感等相关的行为必将处理，最后祝大家在本站愉快观影，谢谢O(∩_∩)O~', '2018-02-08 02:32:30.668000', '3', '1');
INSERT INTO `user_operation_moviecomments` VALUES ('4', '小时候 以为“年”就是一家人聚在一起吃顿饭 长大后 才明白“年”是团圆', '2018-02-09 17:47:00.552000', '2', '4');
INSERT INTO `user_operation_moviecomments` VALUES ('5', '感动！', '2018-02-09 18:37:53.341000', '3', '4');
INSERT INTO `user_operation_moviecomments` VALUES ('7', '真的很不错^_^', '2018-02-09 18:53:24.670000', '3', '4');

-- ----------------------------
-- Table structure for `user_operation_userfavorite`
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_userfavorite`;
CREATE TABLE `user_operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_userfavorite_e8701ad4` (`user_id`),
  CONSTRAINT `user_operation_userfavo_user_id_afd1d1ef_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operation_userfavorite
-- ----------------------------
INSERT INTO `user_operation_userfavorite` VALUES ('3', '1', '2018-02-08 00:25:58.493000', '4', '1');
INSERT INTO `user_operation_userfavorite` VALUES ('4', '2', '2018-02-08 01:38:17.973000', '4', '1');

-- ----------------------------
-- Table structure for `xadmin_bookmark`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for `xadmin_log`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-02-07 13:47:22.038000', '127.0.0.1', '1', '狗的故事', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2018-02-07 13:58:32.056000', '127.0.0.1', '1', '结局催泪动画短片《狗的故事》', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2018-02-07 14:15:59.003000', '127.0.0.1', '2', '君の名は。', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2018-02-07 14:18:45.537000', '127.0.0.1', '3', '战狼Ⅱ  一朝是战狼 终身是战狼', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2018-02-07 14:19:42.627000', '127.0.0.1', '4', '三生三世十里桃花', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2018-02-07 14:21:05.292000', '127.0.0.1', '5', '蝙蝠侠大战超人：正义黎明', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2018-02-07 14:59:46.940000', '127.0.0.1', '2', '2018春节暖心催泪短片《你给我听好，都是为你好》', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2018-02-07 15:04:11.005000', '127.0.0.1', '2', '你给我听好，都是为你好', 'change', '已修改 title 和 detail 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2018-02-07 15:25:03.487000', '127.0.0.1', '2', '你给我听好，都是为你好', 'change', '已修改 star 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2018-02-07 15:25:15.469000', '127.0.0.1', '1', '狗的故事', 'change', '已修改 star 和 detail 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2018-02-07 18:28:19.460000', '127.0.0.1', '3', '被遗弃的', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2018-02-07 20:17:53.836000', '127.0.0.1', '3', '被遗弃的', 'change', '已修改 image 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2018-02-10 15:38:04.094000', '127.0.0.1', '4', '两束光', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2018-02-10 16:03:31.838000', '127.0.0.1', '5', '我的中学时代', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2018-02-10 18:07:17.692000', '127.0.0.1', '5', '我的中学时代', 'change', '已修改 image 和 detail 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2018-02-10 18:15:45.429000', '127.0.0.1', '6', '法国唯美奇幻动画短片《告别》', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2018-02-10 18:20:47.276000', '127.0.0.1', '7', '通往你的道路', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2018-02-10 21:26:01.855000', '127.0.0.1', '1', '剧情', 'create', '已添加', null, '1');
INSERT INTO `xadmin_log` VALUES ('19', '2018-02-10 21:26:58.651000', '127.0.0.1', '2', '剧情', 'create', '已添加', null, '1');
INSERT INTO `xadmin_log` VALUES ('20', '2018-02-10 21:27:07.287000', '127.0.0.1', '3', '剧情', 'create', '已添加', null, '1');
INSERT INTO `xadmin_log` VALUES ('21', '2018-02-10 21:27:15.427000', '127.0.0.1', '4', '爱情', 'create', '已添加', null, '1');
INSERT INTO `xadmin_log` VALUES ('22', '2018-02-10 21:31:52.008000', '127.0.0.1', '5', '剧情', 'create', '已添加', null, '1');
INSERT INTO `xadmin_log` VALUES ('23', '2018-02-10 21:32:02.543000', '127.0.0.1', '6', '奇幻', 'create', '已添加', null, '1');
INSERT INTO `xadmin_log` VALUES ('24', '2018-02-10 21:32:13.657000', '127.0.0.1', '7', '剧情', 'create', '已添加', null, '1');
INSERT INTO `xadmin_log` VALUES ('25', '2018-02-10 22:32:56.255000', '127.0.0.1', '6', '法国唯美奇幻动画短片《告别》', 'change', '已修改 movie_tag 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2018-02-10 22:33:08.042000', '127.0.0.1', '4', '两束光', 'change', '已修改 movie_tag 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2018-02-10 23:13:40.072000', '127.0.0.1', '8', '极速营救', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2018-02-10 23:32:02.477000', '127.0.0.1', '9', '百度外卖扎心广告《人生不过76000多顿饭》', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2018-02-10 23:34:33.294000', '127.0.0.1', '9', '百度外卖扎心广告《人生不过76000多顿饭》', 'change', '已修改 image 和 detail 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2018-02-10 23:39:08.469000', '127.0.0.1', '9', '人生不过76000多顿饭', 'change', '已修改 title 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2018-02-10 23:40:30.646000', '127.0.0.1', '9', '人生不过76000多顿饭', 'change', '已修改 detail 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2018-02-10 23:57:55.231000', '127.0.0.1', '10', '反叛的童谣', 'create', '已添加', '12', '1');

-- ----------------------------
-- Table structure for `xadmin_usersettings`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'site-theme', '/static/xadmin/css/themes/bootstrap-xadmin.css', '1');

-- ----------------------------
-- Table structure for `xadmin_userwidget`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
