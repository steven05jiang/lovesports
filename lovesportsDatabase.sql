-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: lovesports
-- ------------------------------------------------------
-- Server version	5.6.22-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `username` varchar(45) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `admin` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('david@qq.com','admin'),('steven05jiang@gmail.com','Admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `text` mediumtext NOT NULL,
  `username` varchar(45) NOT NULL,
  `groupName` varchar(45) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `present` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `blog_idx` (`username`,`groupName`),
  KEY `blog2group_idx` (`groupName`),
  CONSTRAINT `blog2group` FOREIGN KEY (`groupName`) REFERENCES `group` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `blog2user` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (18,'Yes!!!','Yahoo! Good job.','steven05jiang@gmail.com','Forum','2015-04-17 00:00:00','2015-04-18 00:00:00',1),(19,'Come on','hello','steven05jiang@gmail.com','Forum','2015-04-17 00:00:00',NULL,1),(23,'Picture','','steven05jiang@gmail.com','Forum','2015-04-17 00:00:00','2015-04-25 20:58:46',1),(24,'This is my first blog','Enjoy it!<div><br></div><img src=\"http://images.nationalgeographic.com/wpf/media-live/photos/000/687/cache/bonobo-congo-ziegler_68751_990x742.jpg\">','David@qq.com','Forum','2015-04-18 00:00:00',NULL,1),(27,'Hi','<img src=\"http://blogs.agu.org/georneys/files/2012/12/IMG_7273-1024x682.jpg\">','steven05jiang@gmail.com','Forum','2015-04-22 00:00:00',NULL,1),(28,'Midnight POST','Hello!<div><br></div><img src=\"http://p1.pichost.me/640/39/1623860.jpg\">\'<div><br></div><div>I will have a good sleep tonight.</div>','steven05jiang@gmail.com','Forum','2015-04-24 00:00:00','2015-04-24 00:00:00',1),(29,'Boston','Lost tonight.','steven05jiang@gmail.com','Forum','2015-04-24 01:53:43',NULL,1),(33,'I love Red Sox~','Let\'s go red sox!<div><br></div><img src=\"http://img0.imgtn.bdimg.com/it/u=1118989668,938807514&amp;fm=21&amp;gp=0.jpg\">','David@qq.com','MLB','2015-04-25 21:12:27',NULL,1),(34,'Let\'s go celtics!','Why not?<div><br></div><img src=\"http://img5.imgtn.bdimg.com/it/u=2595827486,465029973&amp;fm=11&amp;gp=0.jpg\">','David@qq.com','NBA','2015-04-25 21:14:55',NULL,0),(35,'NBA','I Love this game<div><br></div><img src=\"http://cdn.gottabemobile.com/wp-content/uploads/2015/04/NBA_Logo.jpg\">','David@qq.com','NBA','2015-04-25 22:54:52',NULL,1);
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogreference`
--

DROP TABLE IF EXISTS `blogreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogreference` (
  `blogId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`blogId`,`categoryId`),
  KEY `reference2_idx` (`categoryId`),
  CONSTRAINT `reference2blog` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reference2category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogreference`
--

LOCK TABLES `blogreference` WRITE;
/*!40000 ALTER TABLE `blogreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `homepage` int(11) DEFAULT NULL,
  `editor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_idx` (`homepage`),
  KEY `category2_idx` (`editor`),
  CONSTRAINT `category1` FOREIGN KEY (`homepage`) REFERENCES `homepage` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `category2` FOREIGN KEY (`editor`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Basketball','Popular sport',1,'steven05jiang@gmail.com'),(2,'Football','Let\'s rock',1,'zgjxxzn@gmail.com'),(3,'NBA','I love this GAME!',NULL,NULL),(4,'CBA',NULL,NULL,NULL),(5,'Baseball',NULL,1,'steven05jiang@gmail.com'),(6,'Soccer',NULL,1,'steven05jiang@gmail.com'),(7,'Badminton',NULL,1,'steven05jiang@gmail.com'),(8,'Tabletennis',NULL,1,'steven05jiang@gmail.com'),(9,'Tennis',NULL,1,'steven05jiang@gmail.com');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `blogId` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `collection2_idx` (`blogId`),
  KEY `collection1` (`username`),
  CONSTRAINT `collection1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collection2` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (41,'steven05jiang@gmail.com',24,'');
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `blogId` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `news` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `commend1_idx` (`username`),
  KEY `commend2_idx` (`blogId`),
  CONSTRAINT `commend1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `commend2` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (66,'steven05jiang@gmail.com',18,'yeye','hhaha','2015-04-18 00:00:00',NULL),(67,'David@qq.com',18,'Hello','yeah','2015-04-18 00:00:00',NULL),(68,'David@qq.com',23,'Hello','hello','2015-04-18 00:00:00',NULL),(69,'steven05jiang@gmail.com',24,'a','s','2015-04-20 00:00:00',NULL),(73,'steven05jiang@gmail.com',24,'Reply to #1:','yes','2015-04-22 00:00:00',NULL),(74,'steven05jiang@gmail.com',28,'hi','you','2015-04-25 00:00:00',NULL),(76,'steven05jiang@gmail.com',NULL,'','Cool','2015-04-29 00:00:00','http://www.citizen-times.com/story/sports/2015/04/29/tar-heels-lose-major-basketball-recruit-duke/26578045/'),(77,'steven05jiang@gmail.com',NULL,'','Hi','2015-04-29 00:00:00','http://www.citizen-times.com/story/sports/2015/04/29/tar-heels-lose-major-basketball-recruit-duke/26578045/'),(78,'steven05jiang@gmail.com',NULL,'','Hi','2015-04-29 00:00:00','http://www.citizen-times.com/story/sports/2015/04/29/tar-heels-lose-major-basketball-recruit-duke/26578045/'),(79,'steven05jiang@gmail.com',NULL,'','yes','2015-04-29 00:00:00','http://www.citizen-times.com/story/sports/2015/04/29/tar-heels-lose-major-basketball-recruit-duke/26578045/'),(80,'steven05jiang@gmail.com',NULL,'','test','2015-04-29 00:00:00','http://www.citizen-times.com/story/sports/2015/04/29/tar-heels-lose-major-basketball-recruit-duke/26578045/'),(81,'steven05jiang@gmail.com',NULL,'Hi','GOOD','2015-04-29 00:00:00','http://www.bbc.com/sport/0/32506662'),(82,'steven05jiang@gmail.com',NULL,'HI','hello','2015-04-30 00:00:00','http://www.usatoday.com/story/sports/ncaab/sec/2015/04/30/billy-donovan-florida-basketball-job-oklahoma-city-thunder/26618263/'),(83,'steven05jiang@gmail.com',NULL,'try','try','2015-04-30 00:00:00','http://www.usatoday.com/story/sports/ncaab/sec/2015/04/30/billy-donovan-florida-basketball-job-oklahoma-city-thunder/26618263/');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `following`
--

DROP TABLE IF EXISTS `following`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `following` (
  `follower` varchar(45) NOT NULL,
  `followee` varchar(45) NOT NULL,
  PRIMARY KEY (`follower`,`followee`),
  KEY `followee2user_idx` (`followee`),
  CONSTRAINT `followee2user` FOREIGN KEY (`followee`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `follower2user` FOREIGN KEY (`follower`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `following`
--

LOCK TABLES `following` WRITE;
/*!40000 ALTER TABLE `following` DISABLE KEYS */;
INSERT INTO `following` VALUES ('steven05jiang@gmail.com','David@qq.com'),('a@a.a','steven05jiang@gmail.com'),('David@qq.com','steven05jiang@gmail.com'),('hualong@yahoo.com','steven05jiang@gmail.com');
/*!40000 ALTER TABLE `following` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `group2user_idx` (`username`),
  CONSTRAINT `group2user` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES ('Badminton','We love this game.','steven05jiang@gmail.com','2015-04-22 00:00:00'),('Basketball','We love basketball','steven05jiang@gmail.com',NULL),('Football','Here we go','steven05jiang@gmail.com',NULL),('Forum','Sports forum for all users','steven05jiang@gmail.com',NULL),('MLB','Baseball','David@qq.com','2015-04-25 21:09:22'),('NBA','Basketball','David@qq.com','2015-04-25 21:13:35'),('Swimming','I like it','David@qq.com','2015-04-25 22:52:47');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homepage`
--

DROP TABLE IF EXISTS `homepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homepage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homepage`
--

LOCK TABLES `homepage` WRITE;
/*!40000 ALTER TABLE `homepage` DISABLE KEYS */;
INSERT INTO `homepage` VALUES (1,'Lovesports',NULL,NULL);
/*!40000 ALTER TABLE `homepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img`
--

DROP TABLE IF EXISTS `img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `img2_idx` (`categoryId`),
  CONSTRAINT `img2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img`
--

LOCK TABLES `img` WRITE;
/*!40000 ALTER TABLE `img` DISABLE KEYS */;
INSERT INTO `img` VALUES (1,'','Img/BasketballStockImage.jpg',1),(2,'','Img/football.jpg',2),(3,NULL,'Img/Baseball.svg',5),(4,NULL,'Img/480px-Soccer_ball.svg.png',6),(5,NULL,'Img/825838229_616.jpg',7),(6,NULL,'Img/tabletennis.jpg',8),(7,NULL,'Img/Tennis-clip-art1.jpg',9),(8,NULL,'Img/NBA_Logo.jpg',3),(9,NULL,'Img/1330484498_99462300.jpg',4);
/*!40000 ALTER TABLE `img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `including`
--

DROP TABLE IF EXISTS `including`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `including` (
  `hostId` int(11) NOT NULL,
  `subId` int(11) NOT NULL,
  PRIMARY KEY (`hostId`,`subId`),
  KEY `including2_idx` (`subId`),
  CONSTRAINT `including1` FOREIGN KEY (`hostId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `including2` FOREIGN KEY (`subId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `including`
--

LOCK TABLES `including` WRITE;
/*!40000 ALTER TABLE `including` DISABLE KEYS */;
INSERT INTO `including` VALUES (1,3),(1,4);
/*!40000 ALTER TABLE `including` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg`
--

DROP TABLE IF EXISTS `msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` varchar(1024) NOT NULL,
  `date` datetime NOT NULL,
  `sender` varchar(45) NOT NULL,
  `receiver` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `msg2user1_idx` (`sender`),
  KEY `msg2user2_idx` (`receiver`),
  CONSTRAINT `msg2user1` FOREIGN KEY (`sender`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `msg2user2` FOREIGN KEY (`receiver`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg`
--

LOCK TABLES `msg` WRITE;
/*!40000 ALTER TABLE `msg` DISABLE KEYS */;
INSERT INTO `msg` VALUES (1,'Hello','2015-04-24 06:06:30','steven05jiang@gmail.com','Alice@gmail.com'),(2,'Hi','2015-04-24 06:07:20','Alice@gmail.com','steven05jiang@gmail.com');
/*!40000 ALTER TABLE `msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stamp`
--

DROP TABLE IF EXISTS `stamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stamp` (
  `blogId` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`blogId`,`username`),
  KEY `stamp2user_idx` (`username`),
  CONSTRAINT `stamp2blog` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stamp2user` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stamp`
--

LOCK TABLES `stamp` WRITE;
/*!40000 ALTER TABLE `stamp` DISABLE KEYS */;
INSERT INTO `stamp` VALUES (18,'steven05jiang@gmail.com'),(27,'steven05jiang@gmail.com'),(35,'steven05jiang@gmail.com');
/*!40000 ALTER TABLE `stamp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `username` varchar(45) NOT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`username`,`categoryId`),
  KEY `subscription1_idx` (`username`),
  KEY `subscription2_idx` (`categoryId`),
  CONSTRAINT `subscription1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscription2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES ('steven05jiang@gmail.com',1),('steven05jiang@gmail.com',2),('steven05jiang@gmail.com',3),('steven05jiang@gmail.com',4),('steven05jiang@gmail.com',6),('steven05jiang@gmail.com',7);
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `frozen` int(11) DEFAULT '0',
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('a@a.a','a','aaaa','Aa','Aaa','',1),('abc',NULL,'ABC',NULL,NULL,NULL,0),('Alice@gmail.com','alice','Alice','Alice','Wonderland','Alice@gmail.com',0),('BCc',NULL,'ABC',NULL,NULL,NULL,1),('Bob@gmail.com','bob','Bob',NULL,NULL,NULL,0),('Clare@gmail.com','clare','Clare',NULL,NULL,NULL,0),('David@qq.com','david','David',NULL,NULL,NULL,0),('Ella@163.com','ella','Ella',NULL,NULL,NULL,0),('Frank@hotmail.com','frank','Frank',NULL,NULL,NULL,0),('Grace@gmail.com','grace','Grace','Grace','Cao','Grace@gmail.com',0),('Hera@gmail.com','hera','Hera','Hera','Dove','Hera@gmail.com',0),('hualong@yahoo.com','123','HL','Hualong','Shen','',0),('shen.hu@husky.neu.edu','shenhualong','Hu','Hualong','Shen','shen.hu@husky.neu.edu',0),('steven05jiang@gmail.com','jiangwei','Jiang','Wei','Jiang','steven05jiang@gmail.com',0),('zgjxxzn@gmail.com','xiongzinan','Xiong','Zinan','Xiong','zgjxxzn@gmail.com',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-30 23:01:50
