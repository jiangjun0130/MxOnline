/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.21 : Database - mxonline
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mxonline` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mxonline`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add user info',6,'add_userprofile'),(17,'Can change user info',6,'change_userprofile'),(18,'Can delete user info',6,'delete_userprofile'),(19,'Can add idnex page page banner',7,'add_banner'),(20,'Can change idnex page page banner',7,'change_banner'),(21,'Can delete idnex page page banner',7,'delete_banner'),(22,'Can add email vetify code',8,'add_emailverifyrecord'),(23,'Can change email vetify code',8,'change_emailverifyrecord'),(24,'Can delete email vetify code',8,'delete_emailverifyrecord'),(25,'Can add 课程',9,'add_course'),(26,'Can change 课程',9,'change_course'),(27,'Can delete 课程',9,'delete_course'),(28,'Can add 课程资源',10,'add_courseresource'),(29,'Can change 课程资源',10,'change_courseresource'),(30,'Can delete 课程资源',10,'delete_courseresource'),(31,'Can add 章节',11,'add_lesson'),(32,'Can change 章节',11,'change_lesson'),(33,'Can delete 章节',11,'delete_lesson'),(34,'Can add 视频',12,'add_video'),(35,'Can change 视频',12,'change_video'),(36,'Can delete 视频',12,'delete_video'),(37,'Can add 课程评论',13,'add_coursecomments'),(38,'Can change 课程评论',13,'change_coursecomments'),(39,'Can delete 课程评论',13,'delete_coursecomments'),(40,'Can add 用户咨询',14,'add_userask'),(41,'Can change 用户咨询',14,'change_userask'),(42,'Can delete 用户咨询',14,'delete_userask'),(43,'Can add 用户课程',15,'add_usercourse'),(44,'Can change 用户课程',15,'change_usercourse'),(45,'Can delete 用户课程',15,'delete_usercourse'),(46,'Can add 用户收藏',16,'add_userfavorite'),(47,'Can change 用户收藏',16,'change_userfavorite'),(48,'Can delete 用户收藏',16,'delete_userfavorite'),(49,'Can add 用户消息',17,'add_usermessage'),(50,'Can change 用户消息',17,'change_usermessage'),(51,'Can delete 用户消息',17,'delete_usermessage'),(52,'Can add 城市',18,'add_citydict'),(53,'Can change 城市',18,'change_citydict'),(54,'Can delete 城市',18,'delete_citydict'),(55,'Can add 课程机构',19,'add_courseorg'),(56,'Can change 课程机构',19,'change_courseorg'),(57,'Can delete 课程机构',19,'delete_courseorg'),(58,'Can add 教师',20,'add_teacher'),(59,'Can change 教师',20,'change_teacher'),(60,'Can delete 教师',20,'delete_teacher'),(61,'Can view log entry',1,'view_logentry'),(62,'Can view group',3,'view_group'),(63,'Can view permission',2,'view_permission'),(64,'Can view content type',4,'view_contenttype'),(65,'Can view 课程',9,'view_course'),(66,'Can view 课程资源',10,'view_courseresource'),(67,'Can view 章节',11,'view_lesson'),(68,'Can view 视频',12,'view_video'),(69,'Can view 课程评论',13,'view_coursecomments'),(70,'Can view 用户咨询',14,'view_userask'),(71,'Can view 用户课程',15,'view_usercourse'),(72,'Can view 用户收藏',16,'view_userfavorite'),(73,'Can view 用户消息',17,'view_usermessage'),(74,'Can view 城市',18,'view_citydict'),(75,'Can view 课程机构',19,'view_courseorg'),(76,'Can view 教师',20,'view_teacher'),(77,'Can view session',5,'view_session'),(78,'Can view idnex page page banner',7,'view_banner'),(79,'Can view email vetify code',8,'view_emailverifyrecord'),(80,'Can view user info',6,'view_userprofile'),(81,'Can add Bookmark',21,'add_bookmark'),(82,'Can change Bookmark',21,'change_bookmark'),(83,'Can delete Bookmark',21,'delete_bookmark'),(84,'Can add User Setting',22,'add_usersettings'),(85,'Can change User Setting',22,'change_usersettings'),(86,'Can delete User Setting',22,'delete_usersettings'),(87,'Can add User Widget',23,'add_userwidget'),(88,'Can change User Widget',23,'change_userwidget'),(89,'Can delete User Widget',23,'delete_userwidget'),(90,'Can add log entry',24,'add_log'),(91,'Can change log entry',24,'change_log'),(92,'Can delete log entry',24,'delete_log'),(93,'Can view Bookmark',21,'view_bookmark'),(94,'Can view log entry',24,'view_log'),(95,'Can view User Setting',22,'view_usersettings'),(96,'Can view User Widget',23,'view_userwidget'),(97,'Can add revision',25,'add_revision'),(98,'Can change revision',25,'change_revision'),(99,'Can delete revision',25,'delete_revision'),(100,'Can add version',26,'add_version'),(101,'Can change version',26,'change_version'),(102,'Can delete version',26,'delete_version'),(103,'Can view revision',25,'view_revision'),(104,'Can view version',26,'view_version'),(105,'Can add 测试Bug',27,'add_testbug'),(106,'Can change 测试Bug',27,'change_testbug'),(107,'Can delete 测试Bug',27,'delete_testbug'),(108,'Can view 测试Bug',27,'view_testbug'),(109,'Can add captcha store',28,'add_captchastore'),(110,'Can change captcha store',28,'change_captchastore'),(111,'Can delete captcha store',28,'delete_captchastore'),(112,'Can view captcha store',28,'view_captchastore');

/*Table structure for table `captcha_captchastore` */

DROP TABLE IF EXISTS `captcha_captchastore`;

CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `captcha_captchastore` */

insert  into `captcha_captchastore`(`id`,`challenge`,`response`,`hashkey`,`expiration`) values (1,'HMDO','hmdo','6ca748140185b02786442bf12ef2508c544201a5','2018-03-14 17:06:27.072606'),(2,'UQNN','uqnn','3199fc3e715ba9c6d6a11803abf072a1e5adc955','2018-03-14 17:15:52.415923'),(3,'OARO','oaro','2952fde05e91b1a7dd32e663617553c6b0c03a91','2018-03-14 17:48:26.614036');

/*Table structure for table `courses_course` */

DROP TABLE IF EXISTS `courses_course`;

CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `need_known` varchar(100) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `teacher_tells` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_course_org_id_4d2c4aab_fk_orgnazati` (`course_org_id`),
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_orgnazati` FOREIGN KEY (`course_org_id`) REFERENCES `orgnazation_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `courses_course` */

insert  into `courses_course`(`id`,`name`,`desc`,`detail`,`degree`,`learn_times`,`students`,`fav_nums`,`image`,`click_nums`,`add_time`,`course_org_id`,`category`,`tag`,`need_known`,`teacher_id`,`teacher_tells`) values (2,'全网最热Python3入门+进阶 更快上手实际开发','全网最热Python3入门+进阶 更快上手实际开发','全网最热Python3入门+进阶 更快上手实际开发','cj',200,12,6,'course/2018/03/python.jpg',3,'2018-03-08 09:55:00.000000',1,'','python','入门到放弃',1,'来入坑！'),(3,'Python升级3.6 强力Django+杀手级Xadmin打造在线教育平台','Python升级3.6 强力Django+杀手级Xadmin打造在线教育平台','Python升级3.6 强力Django+杀手级Xadmin打造在线教育平台','zj',0,0,0,'course/2018/03/dili.jpg',1,'2018-03-16 14:42:00.000000',1,'python','python','入门到放弃',1,'来入坑！'),(4,'（第二版）亿级流量电商详情页系统实战-缓存架构+高可用服务架构+微服务架构','（第二版）亿级流量电商详情页系统实战-缓存架构+高可用服务架构+微服务架构','（第二版）亿级流量电商详情页系统实战-缓存架构+高可用服务架构+微服务架构','gj',800,1212,123234,'course/2018/03/logo.png',7790,'2018-03-16 15:33:00.000000',3,'java','python','入门到放弃',2,'来入坑！');

/*Table structure for table `courses_courseresource` */

DROP TABLE IF EXISTS `courses_courseresource`;

CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `courses_courseresource` */

insert  into `courses_courseresource`(`id`,`name`,`download`,`add_time`,`course_id`) values (1,'前端资源','course/resource/2018/03/留言板.html','2018-03-19 13:56:00.000000',3);

/*Table structure for table `courses_lesson` */

DROP TABLE IF EXISTS `courses_lesson`;

CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `courses_lesson` */

insert  into `courses_lesson`(`id`,`name`,`add_time`,`course_id`) values (2,'python3介绍','2018-03-08 09:55:00.000000',2),(3,'第一章 基础知识','2018-03-19 11:11:00.000000',3),(4,'第二章 进阶开发','2018-03-19 11:11:00.000000',3);

/*Table structure for table `courses_video` */

DROP TABLE IF EXISTS `courses_video`;

CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `courses_video` */

insert  into `courses_video`(`id`,`name`,`add_time`,`lesson_id`,`url`,`learn_times`) values (1,'1.1 hello world','2018-03-19 11:16:00.000000',3,'https://www.imooc.com/video/3370',0),(2,'1.2 基本概念','2018-03-19 11:17:00.000000',3,'https://www.imooc.com/video/3370',0),(3,'2.1 Fuck','2018-03-19 11:18:00.000000',4,'https://www.imooc.com/video/3370',0),(4,'2.2 Shit','2018-03-19 11:18:00.000000',4,'https://www.imooc.com/video/3370',0);

/*Table structure for table `django_admin_log` */

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
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(28,'captcha','captchastore'),(4,'contenttypes','contenttype'),(9,'courses','course'),(10,'courses','courseresource'),(11,'courses','lesson'),(12,'courses','video'),(13,'operation','coursecomments'),(14,'operation','userask'),(15,'operation','usercourse'),(16,'operation','userfavorite'),(17,'operation','usermessage'),(18,'orgnazation','citydict'),(19,'orgnazation','courseorg'),(20,'orgnazation','teacher'),(25,'reversion','revision'),(26,'reversion','version'),(5,'sessions','session'),(7,'users','banner'),(8,'users','emailverifyrecord'),(27,'users','testbug'),(6,'users','userprofile'),(21,'xadmin','bookmark'),(24,'xadmin','log'),(22,'xadmin','usersettings'),(23,'xadmin','userwidget');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2018-03-05 08:29:33.560100'),(2,'contenttypes','0002_remove_content_type_name','2018-03-05 08:29:34.511830'),(3,'auth','0001_initial','2018-03-05 08:29:38.052378'),(4,'auth','0002_alter_permission_name_max_length','2018-03-05 08:29:38.984644'),(5,'auth','0003_alter_user_email_max_length','2018-03-05 08:29:39.013663'),(6,'auth','0004_alter_user_username_opts','2018-03-05 08:29:39.047192'),(7,'auth','0005_alter_user_last_login_null','2018-03-05 08:29:39.088764'),(8,'auth','0006_require_contenttypes_0002','2018-03-05 08:29:39.118783'),(9,'auth','0007_alter_validators_add_error_messages','2018-03-05 08:29:39.154319'),(10,'auth','0008_alter_user_username_max_length','2018-03-05 08:29:39.189344'),(11,'auth','0009_alter_user_last_name_max_length','2018-03-05 08:29:39.232368'),(12,'users','0001_initial','2018-03-05 08:29:43.431798'),(13,'admin','0001_initial','2018-03-05 08:29:44.711257'),(14,'admin','0002_logentry_remove_auto_add','2018-03-05 08:29:44.742287'),(15,'courses','0001_initial','2018-03-05 08:29:47.478137'),(16,'operation','0001_initial','2018-03-05 08:29:48.704407'),(17,'operation','0002_auto_20180305_1629','2018-03-05 08:29:57.436759'),(18,'orgnazation','0001_initial','2018-03-05 08:30:01.503863'),(19,'sessions','0001_initial','2018-03-05 08:30:02.204196'),(20,'reversion','0001_initial','2018-03-06 10:03:51.278668'),(21,'reversion','0002_auto_20141216_1509','2018-03-06 10:03:51.301684'),(22,'reversion','0003_auto_20160601_1600','2018-03-06 10:03:51.327213'),(23,'reversion','0004_auto_20160611_1202','2018-03-06 10:03:51.351230'),(24,'users','0002_auto_20180305_2251','2018-03-06 10:03:51.387754'),(25,'xadmin','0001_initial','2018-03-06 10:03:54.435333'),(26,'xadmin','0002_log','2018-03-06 10:03:55.653089'),(27,'xadmin','0003_auto_20160715_0100','2018-03-06 10:03:56.185516'),(28,'reversion','0001_squashed_0004_auto_20160611_1202','2018-03-06 10:03:56.213251'),(29,'users','0003_auto_20180306_1014','2018-03-06 10:14:30.037069'),(30,'orgnazation','0002_auto_20180310_1401','2018-03-10 14:02:11.031935'),(31,'orgnazation','0003_auto_20180310_1432','2018-03-10 14:32:43.388787'),(32,'captcha','0001_initial','2018-03-13 09:17:03.495049'),(33,'users','0004_auto_20180306_2329','2018-03-13 09:17:03.559638'),(34,'users','0005_auto_20180307_1137','2018-03-13 09:17:03.875421'),(35,'orgnazation','0004_courseorg_category','2018-03-13 20:42:29.400605'),(36,'orgnazation','0005_auto_20180315_2356','2018-03-16 09:17:55.003604'),(37,'courses','0002_course_course_org','2018-03-16 14:40:13.569297'),(38,'orgnazation','0006_teacher_image','2018-03-16 16:06:51.456628'),(39,'courses','0003_course_category','2018-03-19 09:42:37.672232'),(40,'courses','0004_auto_20180318_2217','2018-03-19 09:42:37.737286'),(41,'courses','0005_course_tag','2018-03-19 09:58:25.498527'),(42,'courses','0006_video_url','2018-03-19 11:14:59.849096'),(43,'courses','0007_video_learn_times','2018-03-19 13:54:40.531141'),(44,'orgnazation','0007_teacher_age','2018-03-20 15:56:15.980630');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('2sd3fqysiscau0kuqg1fdxdq70b21qot','N2UzNjFhZjhmM2ZlZTRjODFkZTNjYzIwOTkxOTBjYjUzYWZlNDg0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjE0ODNjOTI1YTgzMDY3YWQ5ZDZjM2M2NmJhZGNmZGYwMmZlNzIyYmYiLCJMSVNUX1FVRVJZIjpbWyJvcmduYXphdGlvbiIsImNvdXJzZW9yZyJdLCIiXX0=','2018-03-27 20:31:24.270874'),('789p2n7311mmogdwq8nkbzhr4qhw19uu','YTUyZDJmMWMzM2E4OThmYWIyMjNjN2I1Yjk3Y2UzYjJmNGQzNTBiYzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImNmMjQ1ZGQ3MmYwZDc0NDA2MDk0MWVjZGZmMzZkYjIyOTY0N2RjZDUifQ==','2018-03-27 16:04:23.536493'),('afqpmsvxrnoo4pv12lqdn5greuyggqt3','NDg2NDNhNDE4YjRkYzE0ZDdkM2E4ZjE1MmFkN2NhZjU4MjZmYWRkNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjE0ODNjOTI1YTgzMDY3YWQ5ZDZjM2M2NmJhZGNmZGYwMmZlNzIyYmYiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==','2018-04-02 14:25:18.349336'),('cms8hrp123vvw1a49wl9hk66egds7rcn','YTQyOGI0MjMzYzU2MzlkZmQ3MGFlNGQwZGNjOGRjYTQ2OTY1NGY1OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzN2JmMjIxMmY0MjVjNmYzZjhkMWY1ODVlMWM4MDU3N2FjYmZmMzE0IiwiTElTVF9RVUVSWSI6W1sib3JnbmF6YXRpb24iLCJjaXR5ZGljdCJdLCIiXX0=','2018-03-23 16:47:32.611057'),('h3zv1l3fbcx0x8zhnwr1pvjq082wkxhc','ZmE2MWE5YTU1NThmMjJhZWFlMWMwNTJlNmJiNmI5OGM2MTFhNDY5MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjE0ODNjOTI1YTgzMDY3YWQ5ZDZjM2M2NmJhZGNmZGYwMmZlNzIyYmYifQ==','2018-04-03 13:54:06.929711'),('pxc021g6l8te6fxdbt4mfo09m957w42p','MDZlMzcxNDgwZWMxMDAxZmZiMjMxOGI2OGY0ZDk2ZjdhNWJhZDYxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzN2JmMjIxMmY0MjVjNmYzZjhkMWY1ODVlMWM4MDU3N2FjYmZmMzE0In0=','2018-03-23 17:53:01.101339'),('re5usajs78tz31e6r4t9rjmtzjbric1h','Njg1MGQ4M2E4ZmJmNTcxZTc2NWMxOGZhNTA3MGVjYzVlOTZmMDk3Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjM3YmYyMjEyZjQyNWM2ZjNmOGQxZjU4NWUxYzgwNTc3YWNiZmYzMTQifQ==','2018-03-26 14:16:28.969255'),('x3w3c4ah5fio3zw43eesxohtzyong1pk','ZmE2MWE5YTU1NThmMjJhZWFlMWMwNTJlNmJiNmI5OGM2MTFhNDY5MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjE0ODNjOTI1YTgzMDY3YWQ5ZDZjM2M2NmJhZGNmZGYwMmZlNzIyYmYifQ==','2018-03-28 14:36:36.472390');

/*Table structure for table `operation_coursecomments` */

DROP TABLE IF EXISTS `operation_coursecomments`;

CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomm_user_id_f5ff70b3_fk_users_use` (`user_id`),
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `operation_coursecomments` */

insert  into `operation_coursecomments`(`id`,`comments`,`add_time`,`course_id`,`user_id`) values (1,'太他妈好了','2018-03-19 15:10:00.866718',3,1),(2,'good','2018-03-19 15:15:43.843426',3,1);

/*Table structure for table `operation_userask` */

DROP TABLE IF EXISTS `operation_userask`;

CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `operation_userask` */

insert  into `operation_userask`(`id`,`name`,`mobile`,`course_name`,`add_time`) values (1,'江俊','15087180905','django','2018-03-16 10:44:46.685792'),(2,'江俊','15087180905','django222','2018-03-16 10:48:35.486346'),(3,'江俊','15087180905','django22244','2018-03-16 10:48:45.424309'),(4,'江俊','15087180905','django222445','2018-03-16 10:49:11.208556'),(5,'江俊','15087180905','django222445','2018-03-16 10:50:10.842490'),(6,'sf','sjfalj','sfjas','2018-03-16 11:11:15.083358');

/*Table structure for table `operation_usercourse` */

DROP TABLE IF EXISTS `operation_usercourse`;

CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operation_usercourse` */

/*Table structure for table `operation_userfavorite` */

DROP TABLE IF EXISTS `operation_userfavorite`;

CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `operation_userfavorite` */

insert  into `operation_userfavorite`(`id`,`fav_id`,`fav_type`,`add_time`,`user_id`) values (1,4,1,'2018-03-19 10:53:48.383661',1),(2,3,2,'2018-03-19 10:53:57.336011',1),(3,1,3,'2018-03-20 17:21:23.671058',1),(4,1,2,'2018-03-20 17:21:26.557312',1);

/*Table structure for table `operation_usermessage` */

DROP TABLE IF EXISTS `operation_usermessage`;

CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operation_usermessage` */

/*Table structure for table `orgnazation_citydict` */

DROP TABLE IF EXISTS `orgnazation_citydict`;

CREATE TABLE `orgnazation_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `orgnazation_citydict` */

insert  into `orgnazation_citydict`(`id`,`name`,`desc`,`add_time`) values (1,'北京','北京','2018-03-13 17:44:00.000000'),(2,'上海','上海','2018-03-13 17:45:00.000000'),(3,'广州','广州','2018-03-13 17:45:00.000000'),(4,'深圳','深圳','2018-03-13 17:45:00.000000'),(5,'天津','天津','2018-03-13 17:45:00.000000'),(6,'昆明','昆明','2018-03-13 17:46:00.000000');

/*Table structure for table `orgnazation_courseorg` */

DROP TABLE IF EXISTS `orgnazation_courseorg`;

CREATE TABLE `orgnazation_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(4) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orgnazation_courseor_city_id_0c18b1e0_fk_orgnazati` (`city_id`),
  CONSTRAINT `orgnazation_courseor_city_id_0c18b1e0_fk_orgnazati` FOREIGN KEY (`city_id`) REFERENCES `orgnazation_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `orgnazation_courseorg` */

insert  into `orgnazation_courseorg`(`id`,`name`,`desc`,`click_nums`,`fav_nums`,`image`,`address`,`add_time`,`city_id`,`category`,`course_nums`,`students`) values (1,'慕课网','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。[1] \r\n4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。[2]',0,0,'org/2018/03/logo.png','北京','2018-03-13 20:30:00.000000',1,'PXJG',0,0),(2,'51cto','北京无忧创想信息技术有限公司（以下简称51CTO）成立于2005年，目前已建成为专注于IT人职业成长平台；拥有1500万注册用户，覆盖了中国主流城市大多数IT从业人群，是国内排名第一的服务IT技术人员的专业性服务平台。51CTO平台汇聚超过10000名技术专家，在人工智能、移动、大数据、云计算等技术领域产出80W篇文章及1万多个专题，与包括IBM、华为、惠普、戴尔、腾讯、阿里巴巴、百度等20000多家国内外知名企业成为合作伙伴，与上百家网络媒体、平面媒体、广电媒体、移动媒体等保持良好的密切合作关系，在传媒、教育等领域提供优质服务。\r\n\r\n    经过多年发展，51CTO逐步建立起现代化的企业管理制度和良好的公司治理结构，形成了一支充满朝气、富有理想的200多人的年青团队。公司拥有四十余项计算机软件著作权，荣膺国家高新技术企业、中关村科技园区“瞪羚企业”和信用双百企业，成为北京市重点扶持发展文化创意产业企业、共青团中央青年就业创业见习基地、中关村CCTV/CNTV中国公开课IT类独家合作伙伴，并屡次荣获北京市、海淀区创新基金的奖励。\r\n\r\n\r\n    51CTO旗下拥有：\r\n\r\n    中国领先的IT技术与服务平台：51CTO.com\r\n\r\n    行业信息化建设平台：CIOAGE.com\r\n\r\n    中国首家专注于医疗信息化平台：Hc3i.com\r\n\r\n    中国最大的IT职业在线教育及实战培训平台：edu.51cto.com\r\n\r\n    WOT高端峰会平台：wot.51cto.com\r\n\r\n    开发者技术社区：tn.51cto.com',0,0,'org/2018/03/51cto.jpg','北京','2018-03-16 14:34:00.000000',1,'PXJG',0,0),(3,'龙果学院','龙果学院 www.roncoo.com 是专注于互联网金融系统技术解决方案的教育平台,提供专业级的互联网金融系统技术解决方案及技术教育服务;致力于java体系全栈架构师技术培训。',0,0,'org/2018/03/roncoo.png','北京','2018-03-16 14:34:00.000000',4,'PXJG',0,0);

/*Table structure for table `orgnazation_teacher` */

DROP TABLE IF EXISTS `orgnazation_teacher`;

CREATE TABLE `orgnazation_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orgnazation_teacher_org_id_370a424b_fk_orgnazation_courseorg_id` (`org_id`),
  CONSTRAINT `orgnazation_teacher_org_id_370a424b_fk_orgnazation_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `orgnazation_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `orgnazation_teacher` */

insert  into `orgnazation_teacher`(`id`,`name`,`work_years`,`work_company`,`work_position`,`points`,`click_nums`,`fav_nums`,`add_time`,`org_id`,`image`,`age`) values (1,'booby',10,'阿里巴巴','架构师','xxx',1,0,'2018-03-16 14:35:00.000000',1,'teacher/2018/03/dili.jpg',0),(2,'中华石杉',15,'阿里巴巴','架构师','xxx',0,0,'2018-03-16 14:35:00.000000',3,'teacher/2018/03/zhao.jpg',0);

/*Table structure for table `reversion_revision` */

DROP TABLE IF EXISTS `reversion_revision`;

CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_user_id_17095f45_fk_users_userprofile_id` (`user_id`),
  KEY `reversion_revision_date_created_96f7c20c` (`date_created`),
  CONSTRAINT `reversion_revision_user_id_17095f45_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reversion_revision` */

/*Table structure for table `reversion_version` */

DROP TABLE IF EXISTS `reversion_version`;

CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) NOT NULL,
  `format` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `object_repr` longtext NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `db` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reversion_version_db_content_type_id_objec_b2c54f65_uniq` (`db`,`content_type_id`,`object_id`,`revision_id`),
  KEY `reversion_version_content_type_id_7d0ff25c_fk_django_co` (`content_type_id`),
  KEY `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` (`revision_id`),
  CONSTRAINT `reversion_version_content_type_id_7d0ff25c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reversion_version` */

/*Table structure for table `users_banner` */

DROP TABLE IF EXISTS `users_banner`;

CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users_banner` */

/*Table structure for table `users_emailverifyrecord` */

DROP TABLE IF EXISTS `users_emailverifyrecord`;

CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(1) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `users_emailverifyrecord` */

insert  into `users_emailverifyrecord`(`id`,`code`,`email`,`send_type`,`send_time`) values (3,'iHieF7q7RSvJ0ZFD','15087180905@sina.cn','R','2018-03-13 10:21:36.764778'),(4,'JC7ZPtzCN1YaZajI','15087180905@sina.cn','F','2018-03-13 15:06:25.463811'),(5,'jzO4GM4a0EGDM3e9','15087180905@sina.cn','F','2018-03-13 16:02:00.813986'),(6,'QlRSbhoKKEEJslcz','1137829446@qq.com','F','2018-03-13 17:37:18.752355'),(7,'1XVPJ1xgF1LlplXu','15087180905@sina.cn','F','2018-03-13 17:41:28.734985');

/*Table structure for table `users_testbug` */

DROP TABLE IF EXISTS `users_testbug`;

CREATE TABLE `users_testbug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `desc` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users_testbug` */

/*Table structure for table `users_userprofile` */

DROP TABLE IF EXISTS `users_userprofile`;

CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(1) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `users_userprofile` */

insert  into `users_userprofile`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`,`nick_name`,`birthday`,`gender`,`address`,`mobile`,`image`) values (1,'pbkdf2_sha256$100000$oekga67okwDr$2rTTxnmYlpkHq4CFazOhoKDpTjennmjfMkRoDgP0y28=','2018-03-20 13:54:06.893188',1,'admin','','','1137829446@qq.com',1,1,'2018-03-06 10:07:15.740534','',NULL,'F','',NULL,'course/2018/03/dili.jpg'),(2,'pbkdf2_sha256$100000$EUyjceLrAnn2$ERZxHYVdmXYIULPAS7bf06uZX0yDgVdRXqrJ3l9kHMw=','2018-03-12 14:26:25.550094',0,'test','','','',0,0,'2018-03-06 10:15:30.553504','',NULL,'F','',NULL,'course/2018/03/dili.jpg'),(5,'pbkdf2_sha256$100000$8X3NlDl15jeE$erlEx8M3kutZGmebDtvBjHjepuLaRGD4t0UjHhtajJ0=','2018-03-13 17:42:38.641675',0,'15087180905@sina.cn','','','15087180905@sina.cn',0,1,'2018-03-13 10:21:33.795846','',NULL,'F','',NULL,'course/2018/03/dili.jpg');

/*Table structure for table `users_userprofile_groups` */

DROP TABLE IF EXISTS `users_userprofile_groups`;

CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users_userprofile_groups` */

/*Table structure for table `users_userprofile_user_permissions` */

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;

CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users_userprofile_user_permissions` */

/*Table structure for table `xadmin_bookmark` */

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
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xadmin_bookmark` */

/*Table structure for table `xadmin_log` */

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `xadmin_log` */

insert  into `xadmin_log`(`id`,`action_time`,`ip_addr`,`object_id`,`object_repr`,`action_flag`,`message`,`content_type_id`,`user_id`) values (1,'2018-03-06 10:15:30.680589','127.0.0.1','2','test','create','已添加。',6,1),(2,'2018-03-08 09:21:25.894179','127.0.0.1','1','Course object (1)','create','已添加。',9,1),(3,'2018-03-08 09:53:12.267333','127.0.0.1','1','Lesson object (1)','create','已添加。',11,1),(4,'2018-03-08 09:55:41.727401','127.0.0.1','2','python3入门','create','已添加。',9,1),(5,'2018-03-08 09:55:57.689621','127.0.0.1','2','Lesson object (2)','create','已添加。',11,1),(6,'2018-03-13 17:45:05.355504','127.0.0.1','1','CityDict object (1)','create','已添加。',18,1),(7,'2018-03-13 17:45:22.321105','127.0.0.1','2','CityDict object (2)','create','已添加。',18,1),(8,'2018-03-13 17:45:28.600370','127.0.0.1','3','CityDict object (3)','create','已添加。',18,1),(9,'2018-03-13 17:45:35.799591','127.0.0.1','4','CityDict object (4)','create','已添加。',18,1),(10,'2018-03-13 17:45:43.528282','127.0.0.1','5','CityDict object (5)','create','已添加。',18,1),(11,'2018-03-13 17:46:30.012728','127.0.0.1','6','昆明','create','已添加。',18,1),(12,'2018-03-13 20:31:23.660226','127.0.0.1','1','CourseOrg object (1)','create','已添加。',19,1),(13,'2018-03-16 14:31:51.559610','127.0.0.1','1','django入门','change','修改 detail 和 image',9,1),(14,'2018-03-16 14:34:32.030081','127.0.0.1','2','51cto','create','已添加。',19,1),(15,'2018-03-16 14:35:08.929064','127.0.0.1','3','龙果学院','create','已添加。',19,1),(16,'2018-03-16 14:35:42.907363','127.0.0.1','1','booby','create','已添加。',20,1),(17,'2018-03-16 14:36:16.412155','127.0.0.1','2','中华石杉','create','已添加。',20,1),(18,'2018-03-16 14:43:19.202323','127.0.0.1','3','Python升级3.6 强力Django+杀手级Xadmin打造在线教育平台','create','已添加。',9,1),(19,'2018-03-16 15:31:16.087157','127.0.0.1','3','Python升级3.6 强力Django+杀手级Xadmin打造在线教育平台','change','修改 image',9,1),(20,'2018-03-16 15:32:51.415576','127.0.0.1','2','全网最热Python3入门+进阶 更快上手实际开发','change','修改 course_org，name，desc，detail，learn_times，students，fav_nums 和 image',9,1),(21,'2018-03-16 15:33:02.600964','127.0.0.1','1','django入门','delete','',9,1),(22,'2018-03-16 15:34:25.131221','127.0.0.1','4','（第二版）亿级流量电商详情页系统实战-缓存架构+高可用服务架构+微服务架构','create','已添加。',9,1),(23,'2018-03-16 15:44:20.288504','127.0.0.1','3','龙果学院','change','修改 image',19,1),(24,'2018-03-16 15:45:10.746189','127.0.0.1','2','51cto','change','修改 image',19,1),(25,'2018-03-16 16:09:05.779779','127.0.0.1','1','booby','change','修改 image',20,1),(26,'2018-03-16 16:09:59.708000','127.0.0.1','2','中华石杉','change','修改 image',20,1),(27,'2018-03-19 11:11:57.399872','127.0.0.1','3','第一章 基础知识','create','已添加。',11,1),(28,'2018-03-19 11:12:08.170157','127.0.0.1','4','第二章 进阶开发','create','已添加。',11,1),(29,'2018-03-19 11:16:52.462533','127.0.0.1','1','1.1 hello world','create','已添加。',12,1),(30,'2018-03-19 11:17:51.692461','127.0.0.1','2','1.2 基本概念','create','已添加。',12,1),(31,'2018-03-19 11:18:18.514922','127.0.0.1','3','2.1 Fuck','create','已添加。',12,1),(32,'2018-03-19 11:18:24.492364','127.0.0.1','4','2.2 Shit','create','已添加。',12,1),(33,'2018-03-19 13:57:26.185111','127.0.0.1','1','前端资源','create','已添加。',10,1),(34,'2018-03-19 14:23:46.897597','127.0.0.1','4','（第二版）亿级流量电商详情页系统实战-缓存架构+高可用服务架构+微服务架构','change','修改 image，category 和 teacher',9,1),(35,'2018-03-19 14:25:05.334391','127.0.0.1','3','Python升级3.6 强力Django+杀手级Xadmin打造在线教育平台','change','修改 image，category 和 teacher',9,1);

/*Table structure for table `xadmin_usersettings` */

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

/*Data for the table `xadmin_usersettings` */

insert  into `xadmin_usersettings`(`id`,`key`,`value`,`user_id`) values (1,'dashboard:home:pos','',1),(2,'site-theme','/static/xadmin/css/themes/bootstrap-xadmin.css',1);

/*Table structure for table `xadmin_userwidget` */

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

/*Data for the table `xadmin_userwidget` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
