-- MySQL dump 10.17  Distrib 10.3.25-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_a555550
-- ------------------------------------------------------
-- Server version	10.3.25-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `micropost_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `micropost_id` (`micropost_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`micropost_id`) REFERENCES `microposts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (4,'test test test',102,71,'2022-10-19 13:40:57'),(5,'mais um comentÃ¡rio\r\ncomentᲩo',102,71,'2022-10-19 13:41:24'),(6,'musica top!',74,80,'2022-11-18 17:42:24'),(7,'post com muita falta de inspiraÃ§Ã£o ....',123,82,'2022-11-23 20:10:19'),(8,'14asdadadadadadasaxzax',125,83,'2022-11-24 02:04:50'),(9,'adadaadada',128,85,'2022-11-26 20:52:43');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microposts`
--

DROP TABLE IF EXISTS `microposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `microposts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `microposts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microposts`
--

LOCK TABLES `microposts` WRITE;
/*!40000 ALTER TABLE `microposts` DISABLE KEYS */;
INSERT INTO `microposts` VALUES (3,'bla bla bla\r\n',4,'2016-10-18 01:21:58','2016-10-18 01:23:25',12),(4,'\r\nNecessito ajuda para o lab4',5,'2016-10-18 12:03:47','2016-10-18 12:03:47',9),(5,'\r\nmais um.',6,'2016-10-18 12:13:02','2016-10-18 12:13:02',9),(6,':/\r\n',7,'2016-10-18 12:14:51','2016-10-18 12:14:51',9),(7,'Pois, entÃ£o bananas.',8,'2016-10-18 12:15:19','2016-10-18 12:15:19',9),(8,'O pedras Ã©  um macho latino,',9,'2016-10-18 12:33:36','2016-10-18 12:33:36',9),(9,'Today we have learned how to template using pear. Have a great day, student!',11,'2016-10-18 14:14:02','2016-10-18 14:14:02',9),(13,'GGWP',18,'2016-10-25 13:26:58','2016-10-25 13:26:58',9),(16,'\r\n',48,'2016-11-10 17:21:03','2016-11-10 17:22:21',9),(17,'\r\nOY',64,'2016-11-10 18:38:31','2016-11-10 18:38:31',15),(18,'Props pro peÃ§oal XD!\r\n\r\n\r\n\r\n',65,'2016-11-10 23:43:57','2016-11-11 09:41:55',10),(25,'Os caracteres jÃ¡ estÃ£o bem!',9,'2016-11-11 13:13:01','2016-11-11 13:13:01',11),(29,'Boa tarde\r\n',67,'2016-11-14 19:31:07','2016-11-14 19:31:07',9),(30,'Boa tarde pessoal!\r\n\r\n',67,'2016-11-14 19:31:31','2016-11-14 19:37:41',9),(32,'OlÃ¡',68,'2016-11-15 11:23:59','2016-11-15 11:23:59',10),(33,'\r\najksdka',63,'2016-11-15 12:10:50','2016-11-15 12:10:50',15),(35,'Please contact the server administrator, root@diana.uceh.ualg.pt and inform them of the time the error occurred, and anything you might have done that may have caused the error.\r\n\r\nMore information about this error may be available in the server error log.\r\n\r\nApache/1.3.34 Server at intranet.deei.fct.ualg.pt Port 80',5,'2016-11-21 22:43:54','2017-01-23 13:29:02',14),(36,'123',46,'2016-11-29 00:37:16','2016-11-29 00:37:16',10),(37,'Este Ã© o meu novo post actualizado\r\n  \r\n  \r\n',2,'2016-12-16 20:21:39','2017-02-11 20:01:48',69),(38,'aaaaa111222\r\n\r\n',78,'2017-01-09 18:13:47','2017-01-09 19:02:29',16),(39,'\r\noi',94,'2017-01-09 18:49:06','2017-01-09 18:49:06',11),(40,'\r\nsadsadsaasdsad',79,'2017-01-09 18:50:44','2017-01-09 18:50:44',15),(41,'\r\ncoisas',90,'2017-01-09 19:01:34','2017-01-09 19:01:34',12),(44,'\r\nfeaffw',89,'2017-01-09 19:21:58','2017-01-09 19:21:58',15),(45,'hello\r\n',38,'2017-01-09 19:23:27','2017-01-09 19:23:27',17),(46,'\r\nits me',92,'2017-01-09 19:26:53','2017-01-09 19:26:53',15),(48,'\r\nI Love SO',37,'2017-01-09 19:37:01','2017-01-09 19:37:01',26),(50,'123',81,'2017-01-09 19:38:52','2017-01-09 19:38:52',30),(51,'Boa tarde\r\n',67,'2017-01-09 19:44:28','2017-01-09 19:44:28',15),(53,'\r\nÃ§Â§ÂÃ£ÂÂ®Ã¥Â®ÂÃ§â€°Â©Ã£ÂÂ¯Ã£â€šÂ³Ã£â€šÂ³Ã£Æ’Å Ã£ÂÂ Ã¯Â¼ÂÃ¯Â¼ÂÃ¯Â¼ÂÃ¯Â¼ÂÃ¯Â¼Â',98,'2017-01-09 19:46:04','2017-01-09 19:46:04',16),(54,'\r\naaaa',78,'2017-01-09 19:46:25','2017-01-09 19:46:25',15),(55,'\r\nteste auto',6,'2017-01-09 19:47:01','2017-01-09 19:47:01',15),(56,'\r\noi 123\r\n\r\n',94,'2017-01-09 19:53:56','2017-01-09 20:10:04',14),(57,'\r\nyolo',94,'2017-01-09 20:10:18','2017-01-09 20:10:18',16),(58,'\r\nI love spd <3',37,'2017-01-09 20:12:35','2017-01-09 20:12:35',21),(60,'2nd try',2,'2017-02-11 20:03:38','2017-02-11 20:03:38',10),(71,'Mais um teste 456\r\n\r\n\r\n',74,'2017-11-11 15:36:07','2019-10-29 11:27:12',0),(72,'mais um teste <br>\r\n\r\n12345\r\n\r\n\r\n\r\n\r\n',74,'2017-11-11 22:08:01','2017-12-11 19:05:10',0),(78,'THIS IS A DRILL',102,'2018-01-13 17:54:43','2018-01-13 17:54:43',668),(79,'lixo',102,'2022-10-15 16:01:46','2022-10-15 16:01:46',0),(80,'					<p> <video height=\"240\" controls>\n  <source src=\"https://i.imgur.com/xZfrSxL.mp4\" type=\"video/mp4\">\nYour browser does not support the video tag.\n</video>\n </p>',102,'2022-10-15 16:17:38','2022-10-15 23:57:19',0),(82,'mais um post',74,'2022-11-04 11:35:57','2022-11-18 16:41:06',0),(83,'`test` a \"ver\" se o \'JSON\' falha   ...\n\n...nÃ£o falhou!',123,'2022-11-23 20:11:20','2022-11-23 19:14:02',0),(84,'dadadadada',125,'2022-11-24 02:04:06','2022-11-24 01:04:38',0),(85,'aaaaaaaaaaaa :(\n',126,'2022-11-25 22:11:00','2022-11-25 21:12:21',0),(86,'olaolaolaola',128,'2022-11-26 20:48:01','2022-11-26 20:48:01',0);
/*!40000 ALTER TABLE `microposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `remember_digest` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT 0,
  `activation_digest` varchar(255) DEFAULT NULL,
  `activated` tinyint(1) DEFAULT NULL,
  `activated_at` datetime DEFAULT NULL,
  `reset_digest` varchar(255) DEFAULT NULL,
  `reset_sent_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Jose Bastos','jose.bastos@gmail.com','2016-09-30 18:54:49','2016-09-30 18:54:49','1873b45aaf4317c32dbde506bf09d646','6a67ff2a8f83756dae554b8b25b5b5d2',0,NULL,NULL,NULL,'f817c3db99522ad077be1a7f3f44fb67','2019-10-31 22:05:41'),(4,'Maria Silva','maria.silva@gmail.com','2016-10-18 01:18:19','2016-10-18 01:18:19','f8ba9d424c67b8812dc06b46ec801787',NULL,0,NULL,NULL,NULL,NULL,NULL),(5,'Paulo Silva','a22297@ualg.pt','2016-10-18 12:03:13','2016-10-18 12:03:13','f8ba9d424c67b8812dc06b46ec801787',NULL,0,NULL,NULL,NULL,NULL,NULL),(6,'mais_um','a52495@ualg.pt','2016-10-18 12:12:29','2016-10-18 12:12:29','827ccb0eea8a706c4c34a16891f84e7b',' ',0,NULL,NULL,NULL,NULL,NULL),(7,'DÃ¡rio Hermann','a49728@ualg.pt','2016-10-18 12:13:47','2016-10-18 12:13:47','ec5883451bb7d0aa6b5950e39ed5f16d',NULL,0,NULL,NULL,NULL,NULL,NULL),(8,'Banana Bananas','bananas@hotmail.com','2016-10-18 12:14:13','2016-10-18 12:14:13','db763be15e695777689418be7364e0a3',NULL,0,NULL,NULL,NULL,NULL,NULL),(9,'Pedro GraÃ§a','kabasizubo@hostcalls.com','2016-10-18 12:26:56','2016-10-18 12:26:56','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,NULL,NULL,NULL,NULL),(10,'Minion ','minionsforever@hotmail.com','2016-10-18 12:32:51','2016-10-18 12:32:51','2157ab29713b48cb69a0fc7a1282eaa9',NULL,0,NULL,NULL,NULL,NULL,NULL),(11,'Dank Blogger','dank@blogger.ru','2016-10-18 14:12:00','2016-10-18 14:12:00','7de954b5bd633a219020a277230727ba',NULL,0,NULL,NULL,NULL,NULL,NULL),(12,'Bananao','banana@banana.com','2016-10-18 14:33:19','2016-10-18 14:33:19','8a0bf547786f70a9adc7dc8a5f3edae8',NULL,0,NULL,NULL,NULL,NULL,NULL),(13,'Mario Andrade','mario.andrade@gmail.com','2016-10-18 21:06:30','2016-10-18 21:06:30','f8ba9d424c67b8812dc06b46ec801787',NULL,0,NULL,NULL,NULL,NULL,NULL),(14,'asdasd','asdasd@asdasd.com','2016-10-24 19:58:05','2016-10-24 19:58:05','4297f44b13955235245b2497399d7a93',NULL,0,NULL,NULL,NULL,NULL,NULL),(15,'ayy','lmao@gmail.com','2016-10-24 23:12:42','2016-10-24 23:12:42','0e1b8b3ef01dad60a89c3b16b6eeff54',NULL,0,NULL,NULL,NULL,NULL,NULL),(16,'ion','a52115@ualg.pt','2016-10-25 02:07:31','2016-10-25 02:07:31','8b82bd2ef31d867db598fba5014e1762',NULL,0,NULL,NULL,NULL,NULL,NULL),(17,'hufeh','lifelnfa@hgor.com','2016-10-25 13:07:55','2016-10-25 13:07:55','fcea920f7412b5da7be0cf42b8c93759',NULL,0,NULL,NULL,NULL,NULL,NULL),(18,'AndrÃ© Generoso','a50366@hotmail.com','2016-10-25 13:26:16','2016-10-25 13:26:16','9f3b9486daba74b7766b7919bb493f47',NULL,0,NULL,NULL,NULL,NULL,NULL),(19,'anton','a12345@ualg.pt','2016-10-25 15:44:35','2016-10-25 15:44:35','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(20,'skdfhvdsfkjvh sdfvasdf','asdfgh@ualg.pt','2016-10-25 16:44:23','2016-10-25 16:44:23','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,NULL,NULL,NULL,NULL),(21,'Diogo LuÃ­s','diogorramosluid@gmail.com','2016-10-26 12:05:35','2016-10-26 12:05:35','c32a28b6afa6d758210e1841ba8d5110',NULL,0,NULL,NULL,NULL,NULL,NULL),(22,'Jose Ribeiro','jose.a.s.ribeiro@sapo.pt','2016-10-30 18:04:40','2016-10-30 18:04:40','266898b908ea2e57dd874ccebd762fa5',NULL,0,NULL,NULL,NULL,'','0000-00-00 00:00:00'),(32,'wddfcsc','sdcswdcedvc@ualg.pt','2016-11-06 02:45:59','2016-11-06 02:45:59','25d55ad283aa400af464c76d713c07ad',NULL,0,NULL,NULL,NULL,NULL,NULL),(33,'coco','123456@hotmail.com','2016-11-06 05:57:33','2016-11-06 05:57:33','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(37,'teste','teste@teste.com','2016-11-06 06:33:19','2016-11-06 06:33:19','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(38,'andre','andre@andre.pt','2016-11-06 17:13:48','2016-11-06 17:13:48','19984dcaea13176bbb694f62ba6b5b35','98a30af214ec3cf4d17c8c00f24f8c9a',0,NULL,NULL,NULL,NULL,NULL),(39,'senhor_do_sabugal','sabugal@sabugal.com','2016-11-07 12:13:46','2016-11-07 12:13:46','72b302bf297a228a75730123efef7c41',NULL,0,NULL,NULL,NULL,NULL,NULL),(40,'senhor','sabug2al@sabugal.com','2016-11-07 12:39:40','2016-11-07 12:39:40','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(41,'joao','joao@joa.pt','2016-11-07 13:51:56','2016-11-07 13:51:56','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,NULL,NULL,NULL,NULL),(42,'andre','a51767@ualg.pt','2016-11-07 16:38:18','2016-11-07 16:38:18','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,NULL,NULL,NULL,NULL),(43,'Hello','Hello@gmail.com','2016-11-07 17:27:14','2016-11-07 17:27:14','c0c3e5247487147b0d4746f18bfcaabc',NULL,0,NULL,NULL,NULL,NULL,NULL),(44,'banananas','olaola@hotmail.com','2016-11-07 20:46:01','2016-11-07 20:46:01','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,NULL,NULL,NULL,NULL),(45,'André Gonçalves','a48052@ualg.pt','2016-11-07 23:38:01','2016-11-07 23:38:01','3c82df09d80472526bcf47b7cd8f9523',NULL,0,NULL,NULL,NULL,NULL,NULL),(46,'Jose','alo@alo.com','2016-11-08 02:37:36','2016-11-08 02:37:36','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(47,'sdfsdf','sdfsdf@a.com','2016-11-08 03:07:03','2016-11-08 03:07:03','d58e3582afa99040e27b92b13c8f2280',NULL,0,NULL,NULL,NULL,NULL,NULL),(48,'Dusk','Dusk252@gmail.com','2016-11-08 05:52:17','2016-11-08 05:52:17','978c1c56566a640d1002af5cc386c3c7',NULL,0,NULL,NULL,NULL,NULL,NULL),(49,'dfdfd','xx@gmail.com','2016-11-08 08:26:48','2016-11-08 08:26:48','d458decd2384f5e6ed16bef258e6756a',NULL,0,NULL,NULL,NULL,NULL,NULL),(50,'dfsdfsdgsd','ff@gmail.com','2016-11-08 08:27:10','2016-11-08 08:27:10','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(51,'dfgdgdg','jiko@gmail.com','2016-11-08 08:29:58','2016-11-08 08:29:58','5d41402abc4b2a76b9719d911017c592',NULL,0,NULL,NULL,NULL,NULL,NULL),(52,'pinksoulgem','homuhomu@gmail.com','2016-11-08 08:37:38','2016-11-08 08:37:38','1c487c56a6ed97f7c7f7e8a0c5f5ee2c',NULL,0,NULL,NULL,NULL,NULL,NULL),(53,'abv','rr@a.com','2016-11-08 11:21:24','2016-11-08 11:21:24','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(54,'banana','Ricardo_dos_santos@pt.pt','2016-11-08 11:25:57','2016-11-08 11:25:57','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(55,'abcdef','12345@gmail.com','2016-11-08 12:07:03','2016-11-08 12:07:03','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(56,'abc','abc@abc.com','2016-11-08 12:30:17','2016-11-08 12:30:17','61a60170273e74a5be90355ffe8e86ad',NULL,0,NULL,NULL,NULL,'41a8175d3fe47baf423a09c87eed42be','2017-11-12 23:58:56'),(57,'gg gg','gg@g.com','2016-11-08 12:46:42','2016-11-08 12:46:42','9a0fe27c8bcc9aad51eda55e1b735eb5',NULL,0,NULL,NULL,NULL,NULL,NULL),(58,'gg gg','123@ht.com','2016-11-08 12:47:04','2016-11-08 12:47:04','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(59,'asss','as@ho.com','2016-11-08 13:07:52','2016-11-08 13:07:52','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(60,'asbn','qwqe@ja.com','2016-11-08 13:09:19','2016-11-08 13:09:19','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(61,'dotora','dotora@dr.pt','2016-11-10 16:05:10','2016-11-10 16:05:10','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(62,'','peter.smith@gmail.com','2016-11-10 18:20:57','2016-11-10 18:20:57','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(63,'','josee.bastos@gmail.com','2016-11-10 18:36:07','2016-11-10 18:36:07','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(64,'dtore','dr@dr.dr','2016-11-10 18:38:05','2016-11-10 18:38:05','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(65,'Meitas','beita@chup.pt','2016-11-10 23:42:52','2016-11-10 23:42:52','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(66,'andre ','andre.teixeira3690@gmail.com','2016-11-13 20:12:17','2016-11-13 20:12:17','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,NULL,NULL,NULL,NULL),(67,'Jose','a51804@ualg.pt','2016-11-14 17:37:10','2016-11-14 17:37:10','827ccb0eea8a706c4c34a16891f84e7b','9370ecd3cab995fc110245d9421e78ea',0,NULL,NULL,NULL,NULL,NULL),(68,'Manel Bidente','andre.quarteira@gmail.com','2016-11-15 11:22:25','2016-11-15 11:22:25','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(69,'Alexandra','alexandra@alexandra.com','2016-11-15 12:38:36','2016-11-15 12:38:36','9db3c8f773c85206e661d7538de50fe7',NULL,0,NULL,NULL,NULL,NULL,NULL),(70,'','joao@jodsfsda.pt','2016-11-25 13:20:55','2016-11-25 13:20:55','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(71,'','asd@asd.asd','2016-11-27 14:04:23','2016-11-27 14:04:23','7815696ecbf1c96e6894b779456d330e',NULL,0,NULL,NULL,NULL,NULL,NULL),(72,'','test123@gmail.com','2016-11-29 01:29:12','2016-11-29 01:29:12','25f9e794323b453885f5181f1b624d0b',NULL,0,NULL,NULL,NULL,NULL,NULL),(73,'','joao@ualg.pt','2016-11-29 12:41:36','2016-11-29 12:41:36','dccd96c256bc7dd39bae41a405f25e43',NULL,0,NULL,NULL,NULL,NULL,NULL),(74,'Jose Bastos','jbastos@ualg.pt','2016-12-11 00:11:20','2019-11-27 10:37:06','827ccb0eea8a706c4c34a16891f84e7b','a52d1dfe2484a284c4bb2b8d570a9a8e',0,NULL,NULL,NULL,NULL,NULL),(76,'Jose Bastos','jmatbastos@hotmail.com','2016-12-11 00:16:06','2016-12-11 00:16:06','73608990fda4db21bedced8e4ee5740f\n',NULL,0,NULL,NULL,NULL,NULL,NULL),(77,'Jose Bastos','sigdeei@ualg.pt','2016-12-11 00:55:24','2016-12-11 00:55:24','73608990fda4db21bedced8e4ee5740f\n',NULL,0,NULL,NULL,NULL,NULL,NULL),(78,'username','danielstantchev@me.com','2017-01-09 18:12:17','2017-01-09 18:12:17','25d55ad283aa400af464c76d713c07ad','1c50e4d83ff55d7763e1e36fb2d38b92',0,NULL,NULL,NULL,NULL,NULL),(79,'penelope','penelope@gmail.com','2017-01-09 18:14:00','2017-01-09 18:14:00','827ccb0eea8a706c4c34a16891f84e7b','663d4a5c61d8fe3ceecc52fad5eb53a2',0,NULL,NULL,NULL,NULL,NULL),(80,'Adriano Vaz','adriano_vaz@live.com.pt','2017-01-09 18:14:59','2017-01-09 18:14:59','79df64f73eab9bc0d7b448d2008d876e',NULL,0,NULL,NULL,NULL,NULL,NULL),(81,'ricardoreais','ricardoreais@gmail.com','2017-01-09 18:15:15','2017-01-09 18:15:15','e10adc3949ba59abbe56e057f20f883e','a8012fe294b838edbf910fd718078090',0,NULL,NULL,NULL,NULL,NULL),(84,'ricardo','a48374@ualg.pt','2017-01-09 18:18:50','2017-01-09 18:18:50','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,NULL,NULL,NULL,NULL),(89,'patricia','a34693@ualg.pt','2017-01-09 18:24:23','2017-01-09 18:24:23','5f4dcc3b5aa765d61d8327deb882cf99','5c4a8093ec3bb4201115f3c51f955d0c',0,NULL,NULL,NULL,NULL,NULL),(90,'Doutor','doutor@sapo.pt','2017-01-09 18:27:04','2017-01-09 18:27:04','827ccb0eea8a706c4c34a16891f84e7b','b1bd237b02733f90d8a969d2fb601bcb',0,NULL,NULL,NULL,NULL,NULL),(92,'Cyrill','CB@CB.CB','2017-01-09 18:29:49','2017-01-09 18:29:49','827ccb0eea8a706c4c34a16891f84e7b','123',0,NULL,NULL,NULL,NULL,NULL),(93,'ramalho','a52777@ualg.pt','2017-01-09 17:31:31','2017-01-09 17:31:31','827ccb0eea8a706c4c34a16891f84e7b','d39b83e5ed4e20df94b6b13904b65530',0,NULL,NULL,NULL,NULL,NULL),(94,'testtest','123@123.com','2017-01-09 18:32:04','2017-01-09 18:32:04','827ccb0eea8a706c4c34a16891f84e7b','21ae8df77b93087297f5e42c7e12216e',0,NULL,NULL,NULL,NULL,NULL),(96,'ion','ion@hotmail.com','2017-01-09 18:33:35','2017-01-09 18:33:35','fcea920f7412b5da7be0cf42b8c93759',NULL,0,NULL,NULL,NULL,NULL,NULL),(98,'Yayaka','YYK@gmail.com','2017-01-09 19:07:30','2017-01-09 19:07:30','e3a102e4dec3d927ea2776e2554124d8','aa998c616d22b85f47341be2af120376',0,NULL,NULL,NULL,NULL,NULL),(99,'AndrÃ©T','pedrodds1@hotmail.com','2017-01-09 19:10:38','2017-01-09 19:10:38','827ccb0eea8a706c4c34a16891f84e7b',NULL,0,NULL,NULL,NULL,NULL,NULL),(102,'abc','abc@yahoo.com','2022-10-15 12:41:48','2022-10-15 12:41:48','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,NULL,NULL,NULL,NULL),(118,'abcd','abcd@yahoo.com','2022-10-16 17:59:06','2022-10-16 17:59:06','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,NULL,NULL,NULL,NULL),(119,'abcde','abcde@yahoo.com','2022-10-16 19:21:08','2022-10-16 19:21:08','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,NULL,NULL,NULL,NULL),(120,'abcdef','abcdef@yahoo.com','2022-10-17 10:37:45','2022-10-17 10:37:45','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,NULL,NULL,NULL,NULL),(123,'joe','joe@gmail.com','2022-11-23 19:08:25','2022-11-23 19:08:25','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,NULL,NULL,NULL,NULL),(124,'heyhey','heyhey@gmaill.com','2022-11-24 01:02:36','2022-11-24 01:02:36','660330d60fbc1a241be39280696b2942',NULL,0,NULL,NULL,NULL,NULL,NULL),(125,'aluno','aluno420@gmail.com','2022-11-24 01:03:28','2022-11-24 01:03:28','422af4b3fef744c551cd21028f8a4d1a',NULL,0,NULL,NULL,NULL,NULL,NULL),(126,'dodo','dodo@dodo.dodo','2022-11-25 21:10:20','2022-11-25 21:10:20','728f31c693d2fa1066f36ea894dc6a5a',NULL,0,NULL,NULL,NULL,NULL,NULL),(127,'test','test@test.test','2022-11-26 19:22:07','2022-11-26 19:22:07','0192023a7bbd73250516f069df18b500',NULL,0,NULL,NULL,NULL,NULL,NULL),(128,'computador','computador@gmail.com','2022-11-26 19:46:43','2022-11-26 19:46:43','099867db4ba200cacd1575d008c3e3e7',NULL,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-30 14:12:55
