-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: springbootj11ei
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','http://localhost:8080/springbootj11ei/upload/picture1.jpg'),(2,'picture2','http://localhost:8080/springbootj11ei/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/springbootj11ei/upload/picture3.jpg'),(6,'homepage',NULL);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discusszhishidian`
--

DROP TABLE IF EXISTS `discusszhishidian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discusszhishidian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1618208889467 DEFAULT CHARSET=utf8 COMMENT='知识点评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discusszhishidian`
--

LOCK TABLES `discusszhishidian` WRITE;
/*!40000 ALTER TABLE `discusszhishidian` DISABLE KEYS */;
INSERT INTO `discusszhishidian` VALUES (81,'2021-04-12 06:19:52',1,1,'用户名1','评论内容1','回复内容1'),(82,'2021-04-12 06:19:52',2,2,'用户名2','评论内容2','回复内容2'),(83,'2021-04-12 06:19:52',3,3,'用户名3','评论内容3','回复内容3'),(84,'2021-04-12 06:19:52',4,4,'用户名4','评论内容4','回复内容4'),(85,'2021-04-12 06:19:52',5,5,'用户名5','评论内容5','回复内容5'),(86,'2021-04-12 06:19:52',6,6,'用户名6','评论内容6','回复内容6'),(1618208577383,'2021-04-12 06:22:56',21,1618208549985,'1','真的很重要',NULL),(1618208872505,'2021-04-12 06:27:51',26,1618208549985,'1','1111',NULL),(1618208889466,'2021-04-12 06:28:08',1618208722252,1618208549985,'1','111',NULL);
/*!40000 ALTER TABLE `discusszhishidian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exampaper`
--

DROP TABLE IF EXISTS `exampaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1618208736753 DEFAULT CHARSET=utf8 COMMENT='试卷表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exampaper`
--

LOCK TABLES `exampaper` WRITE;
/*!40000 ALTER TABLE `exampaper` DISABLE KEYS */;
INSERT INTO `exampaper` VALUES (1618208736752,'2021-04-12 06:25:36','XXXX',60,1);
/*!40000 ALTER TABLE `exampaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examquestion`
--

DROP TABLE IF EXISTS `examquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1618208804050 DEFAULT CHARSET=utf8 COMMENT='试题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examquestion`
--

LOCK TABLES `examquestion` WRITE;
/*!40000 ALTER TABLE `examquestion` DISABLE KEYS */;
INSERT INTO `examquestion` VALUES (1618208770605,'2021-04-12 06:26:09',1618208736752,'XXXX','XXXXXXXX','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"}]',10,'C','xxxx',0,1),(1618208787846,'2021-04-12 06:26:27',1618208736752,'XXXX','xxxxxxxxxxx','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',5,'A','xxxxxxxx',2,2),(1618208804049,'2021-04-12 06:26:43',1618208736752,'XXXX','xxxxxxxx','[]',10,'xxxxx','xxxx',3,3);
/*!40000 ALTER TABLE `examquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examrecord`
--

DROP TABLE IF EXISTS `examrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1618208920476 DEFAULT CHARSET=utf8 COMMENT='考试记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examrecord`
--

LOCK TABLES `examrecord` WRITE;
/*!40000 ALTER TABLE `examrecord` DISABLE KEYS */;
INSERT INTO `examrecord` VALUES (1618208913583,'2021-04-12 06:28:32',1618208549985,NULL,1618208736752,'XXXX',1618208770605,'XXXXXXXX','[{\"text\":\"A.1\",\"code\":\"A\",\"checked\":true},{\"text\":\"B.2\",\"code\":\"B\",\"checked\":false},{\"text\":\"C.3\",\"code\":\"C\",\"checked\":false}]',10,'C','xxxx',0,'A'),(1618208915855,'2021-04-12 06:28:35',1618208549985,NULL,1618208736752,'XXXX',1618208787846,'xxxxxxxxxxx','[{\"text\":\"A.对\",\"code\":\"A\",\"checked\":true},{\"text\":\"B.错\",\"code\":\"B\",\"checked\":false}]',5,'A','xxxxxxxx',5,'A'),(1618208920475,'2021-04-12 06:28:39',1618208549985,NULL,1618208736752,'XXXX',1618208804049,'xxxxxxxx','[]',10,'xxxxx','xxxx',0,'xx');
/*!40000 ALTER TABLE `examrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kemuleixing`
--

DROP TABLE IF EXISTS `kemuleixing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kemuleixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='科目类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kemuleixing`
--

LOCK TABLES `kemuleixing` WRITE;
/*!40000 ALTER TABLE `kemuleixing` DISABLE KEYS */;
INSERT INTO `kemuleixing` VALUES (31,'2021-04-12 06:19:52','XX'),(32,'2021-04-12 06:19:52','类型2'),(33,'2021-04-12 06:19:52','类型3'),(34,'2021-04-12 06:19:52','类型4'),(35,'2021-04-12 06:19:52','类型5'),(36,'2021-04-12 06:19:52','类型6');
/*!40000 ALTER TABLE `kemuleixing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1618208891879 DEFAULT CHARSET=utf8 COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
INSERT INTO `storeup` VALUES (1618208565418,'2021-04-12 06:22:45',1618208549985,21,'zhishidian','名称1','http://localhost:8080/springbootj11ei/upload/zhishidian_tupian1.jpg'),(1618208868290,'2021-04-12 06:27:47',1618208549985,26,'zhishidian','名称6','http://localhost:8080/springbootj11ei/upload/zhishidian_tupian6.jpg'),(1618208891878,'2021-04-12 06:28:11',1618208549985,1618208722252,'zhishidian','XXXX','http://localhost:8080/springbootj11ei/upload/1618208711049.jpg');
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1618208549985,'1','yonghu','用户','hb0816fame7tpmomk9tvdlf4j7u25w76','2021-04-12 06:22:36','2021-04-12 07:27:43'),(2,1,'abo','users','管理员','j9lyvlct95bf3tcbqahso7ez1dzz35xp','2021-04-12 06:24:33','2021-04-12 07:24:34');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abo','abo','管理员','2021-04-12 06:19:52');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) NOT NULL COMMENT '学号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `shenfenzheng` varchar(200) DEFAULT NULL COMMENT '身份证',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=1618208549986 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (11,'2021-04-12 06:19:52','用户1','123456','姓名1','女','13823888881','773890001@qq.com','440300199101010001','http://localhost:8080/springbootj11ei/upload/yonghu_tupian1.jpg'),(12,'2021-04-12 06:19:52','用户2','123456','姓名2','男','13823888882','773890002@qq.com','440300199202020002','http://localhost:8080/springbootj11ei/upload/yonghu_tupian2.jpg'),(13,'2021-04-12 06:19:52','用户3','123456','姓名3','男','13823888883','773890003@qq.com','440300199303030003','http://localhost:8080/springbootj11ei/upload/yonghu_tupian3.jpg'),(14,'2021-04-12 06:19:52','用户4','123456','姓名4','男','13823888884','773890004@qq.com','440300199404040004','http://localhost:8080/springbootj11ei/upload/yonghu_tupian4.jpg'),(15,'2021-04-12 06:19:52','用户5','123456','姓名5','男','13823888885','773890005@qq.com','440300199505050005','http://localhost:8080/springbootj11ei/upload/yonghu_tupian5.jpg'),(16,'2021-04-12 06:19:52','用户6','123456','姓名6','男','13823888886','773890006@qq.com','440300199606060006','http://localhost:8080/springbootj11ei/upload/yonghu_tupian6.jpg'),(1618208549985,'2021-04-12 06:22:29','1','1','1','男','15869856456',NULL,NULL,NULL);
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zhishidian`
--

DROP TABLE IF EXISTS `zhishidian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zhishidian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `mingcheng` varchar(200) DEFAULT NULL COMMENT '名称',
  `kemuleixing` varchar(200) DEFAULT NULL COMMENT '科目类型',
  `zhongdiandu` varchar(200) DEFAULT NULL COMMENT '重点度',
  `neirong` longtext COMMENT '内容',
  `beizhu` longtext COMMENT '备注',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1618208722253 DEFAULT CHARSET=utf8 COMMENT='知识点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zhishidian`
--

LOCK TABLES `zhishidian` WRITE;
/*!40000 ALTER TABLE `zhishidian` DISABLE KEYS */;
INSERT INTO `zhishidian` VALUES (21,'2021-04-12 06:19:52','名称1','科目类型1','一星','内容1','备注1','2021-04-12','http://localhost:8080/springbootj11ei/upload/zhishidian_tupian1.jpg','2021-04-12 14:27:59',4),(22,'2021-04-12 06:19:52','名称2','科目类型2','一星','内容2','备注2','2021-04-12','http://localhost:8080/springbootj11ei/upload/zhishidian_tupian2.jpg','2021-04-12 14:19:52',2),(23,'2021-04-12 06:19:52','名称3','科目类型3','一星','内容3','备注3','2021-04-12','http://localhost:8080/springbootj11ei/upload/zhishidian_tupian3.jpg','2021-04-12 14:19:52',3),(24,'2021-04-12 06:19:52','名称4','科目类型4','一星','内容4','备注4','2021-04-12','http://localhost:8080/springbootj11ei/upload/zhishidian_tupian4.jpg','2021-04-12 14:19:52',4),(25,'2021-04-12 06:19:52','名称5','科目类型5','一星','内容5','备注5','2021-04-12','http://localhost:8080/springbootj11ei/upload/zhishidian_tupian5.jpg','2021-04-12 14:19:52',5),(26,'2021-04-12 06:19:52','名称6','科目类型6','一星','内容6','备注6','2021-04-12','http://localhost:8080/springbootj11ei/upload/zhishidian_tupian6.jpg','2021-04-12 14:27:53',8),(1618208722252,'2021-04-12 06:25:22','XXXX','类型1','一星','<p>编辑器可以发布文字图片</p>','xxx','2021-04-05','http://localhost:8080/springbootj11ei/upload/1618208711049.jpg','2021-04-12 14:28:10',2);
/*!40000 ALTER TABLE `zhishidian` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-13 16:04:34
