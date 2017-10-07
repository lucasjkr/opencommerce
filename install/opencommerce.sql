# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.19-0ubuntu0.16.04.1)
# Database: opencommerce
# Generation Time: 2017-10-06 14:32:54 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table oc_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_address`;

CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_api_ip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_api_ip`;

CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_api_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_api_session`;

CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`api_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_attribute`;

CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_attribute` WRITE;
/*!40000 ALTER TABLE `oc_attribute` DISABLE KEYS */;

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`, `date_added`, `date_modified`)
VALUES
	(1,6,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(2,6,5,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(3,6,3,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(4,3,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(5,3,2,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(6,3,3,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(7,3,4,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(8,3,5,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(9,3,6,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(10,3,7,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(11,3,8,'2017-10-06 10:23:42','2017-10-06 10:23:42');

/*!40000 ALTER TABLE `oc_attribute` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_attribute_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_attribute_description`;

CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_attribute_description` WRITE;
/*!40000 ALTER TABLE `oc_attribute_description` DISABLE KEYS */;

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`, `date_added`, `date_modified`)
VALUES
	(1,1,'Description','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(2,1,'No. of Cores','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(3,1,'Clockspeed','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(4,1,'test 1','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(5,1,'test 2','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(6,1,'test 3','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(7,1,'test 4','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(8,1,'test 5','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(9,1,'test 6','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(10,1,'test 7','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(11,1,'test 8','2017-10-06 10:23:42','2017-10-06 10:23:42');

/*!40000 ALTER TABLE `oc_attribute_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_attribute_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_attribute_group`;

CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_attribute_group` WRITE;
/*!40000 ALTER TABLE `oc_attribute_group` DISABLE KEYS */;

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`, `date_added`, `date_modified`)
VALUES
	(3,2,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(4,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(5,3,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(6,4,'2017-10-06 10:23:42','2017-10-06 10:23:42');

/*!40000 ALTER TABLE `oc_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_attribute_group_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_attribute_group_description`;

CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_attribute_group_description` WRITE;
/*!40000 ALTER TABLE `oc_attribute_group_description` DISABLE KEYS */;

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`, `date_added`, `date_modified`)
VALUES
	(3,1,'Memory','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(4,1,'Technical','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(5,1,'Motherboard','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(6,1,'Processor','2017-10-06 10:23:42','2017-10-06 10:23:42');

/*!40000 ALTER TABLE `oc_attribute_group_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_banner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_banner`;

CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_banner` WRITE;
/*!40000 ALTER TABLE `oc_banner` DISABLE KEYS */;

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`, `date_added`, `date_modified`)
VALUES
	(6,'HP Products',1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(7,'Home Page Slideshow',1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(8,'Manufacturers',1,'2017-10-06 10:23:42','2017-10-06 10:23:42');

/*!40000 ALTER TABLE `oc_banner` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_banner_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_banner_image`;

CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_banner_image` WRITE;
/*!40000 ALTER TABLE `oc_banner_image` DISABLE KEYS */;

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`, `date_added`, `date_modified`)
VALUES
	(79,7,1,'iPhone 6','index.php?route=product/product&amp;path=57&amp;product_id=49','catalog/demo/banners/iPhone6.jpg',0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(80,7,1,'MacBookAir','','catalog/demo/banners/MacBookAir.jpg',0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(87,6,1,'HP Banner','index.php?route=product/manufacturer/info&amp;manufacturer_id=7','catalog/demo/compaq_presario.jpg',0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(88,8,1,'Harley Davidson','','catalog/demo/manufacturer/harley.png',0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(89,8,1,'Dell','','catalog/demo/manufacturer/dell.png',0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(90,8,1,'Disney','','catalog/demo/manufacturer/disney.png',0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(91,8,1,'Coca Cola','','catalog/demo/manufacturer/cocacola.png',0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(92,8,1,'Burger King','','catalog/demo/manufacturer/burgerking.png',0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(93,8,1,'Canon','','catalog/demo/manufacturer/canon.png',0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(94,8,1,'NFL','','catalog/demo/manufacturer/nfl.png',0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(95,8,1,'RedBull','','catalog/demo/manufacturer/redbull.png',0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(96,8,1,'Sony','','catalog/demo/manufacturer/sony.png',0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(97,8,1,'Starbucks','','catalog/demo/manufacturer/starbucks.png',0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(98,8,1,'Nintendo','','catalog/demo/manufacturer/nintendo.png',0,'2017-10-06 10:23:42','2017-10-06 10:23:42');

/*!40000 ALTER TABLE `oc_banner_image` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_cart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_cart`;

CREATE TABLE `oc_cart` (
  `cart_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_category`;

CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_category` WRITE;
/*!40000 ALTER TABLE `oc_category` DISABLE KEYS */;

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`)
VALUES
	(17,'',0,1,1,4,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(18,'catalog/demo/hp_2.jpg',0,1,0,2,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(20,'catalog/demo/compaq_presario.jpg',0,1,1,1,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(24,'',0,1,1,5,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(25,'',0,1,1,3,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(26,'',20,0,0,1,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(27,'',20,0,0,2,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(28,'',25,0,0,1,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(29,'',25,0,0,1,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(30,'',25,0,0,1,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(31,'',25,0,0,1,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(32,'',25,0,0,1,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(33,'',0,1,1,6,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(34,'catalog/demo/ipod_touch_4.jpg',0,1,4,7,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(35,'',28,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(36,'',28,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(37,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(38,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(39,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(40,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(41,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(42,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(43,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(44,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(45,'',18,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(46,'',18,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(47,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(48,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(49,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(50,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(51,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(52,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(53,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(54,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(55,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(56,'',34,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(57,'',0,1,1,3,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(58,'',52,0,0,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42');

/*!40000 ALTER TABLE `oc_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_category_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_category_description`;

CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_category_description` WRITE;
/*!40000 ALTER TABLE `oc_category_description` DISABLE KEYS */;

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`, `date_added`, `date_modified`)
VALUES
	(17,1,'Software','','Software','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(18,1,'Laptops &amp; Notebooks','&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n','Laptops &amp; Notebooks','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(20,1,'Desktops','&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n','Desktops','Example of category description','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(24,1,'Phones &amp; PDAs','','Phones &amp; PDAs','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(25,1,'Components','','Components','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(26,1,'PC','','PC','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(27,1,'Mac','','Mac','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(28,1,'Monitors','','Monitors','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(29,1,'Mice and Trackballs','','Mice and Trackballs','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(30,1,'Printers','','Printers','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(31,1,'Scanners','','Scanners','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(32,1,'Web Cameras','','Web Cameras','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(33,1,'Cameras','','Cameras','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(34,1,'MP3 Players','&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n','MP3 Players','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(35,1,'test 1','','test 1','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(36,1,'test 2','','test 2','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(37,1,'test 5','','test 5','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(38,1,'test 4','','test 4','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(39,1,'test 6','','test 6','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(40,1,'test 7','','test 7','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(41,1,'test 8','','test 8','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(42,1,'test 9','','test 9','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(43,1,'test 11','','test 11','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(44,1,'test 12','','test 12','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(45,1,'Windows','','Windows','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(46,1,'Macs','','Macs','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(47,1,'test 15','','test 15','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(48,1,'test 16','','test 16','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(49,1,'test 17','','test 17','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(50,1,'test 18','','test 18','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(51,1,'test 19','','test 19','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(52,1,'test 20','','test 20','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(53,1,'test 21','','test 21','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(54,1,'test 22','','test 22','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(55,1,'test 23','','test 23','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(56,1,'test 24','','test 24','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(57,1,'Tablets','','Tablets','','','2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(58,1,'test 25','','test 25','','','2017-10-06 10:23:42','2017-10-06 10:23:42');

/*!40000 ALTER TABLE `oc_category_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_category_filter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_category_filter`;

CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_category_path
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_category_path`;

CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_category_path` WRITE;
/*!40000 ALTER TABLE `oc_category_path` DISABLE KEYS */;

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`, `date_added`, `date_modified`)
VALUES
	(17,17,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(18,18,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(20,20,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(24,24,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(25,25,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(26,20,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(26,26,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(27,20,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(27,27,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(28,25,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(28,28,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(29,25,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(29,29,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(30,25,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(30,30,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(31,25,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(31,31,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(32,25,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(32,32,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(33,33,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(34,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(35,25,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(35,28,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(35,35,2,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(36,25,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(36,28,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(36,36,2,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(37,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(37,37,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(38,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(38,38,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(39,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(39,39,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(40,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(40,40,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(41,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(41,41,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(42,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(42,42,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(43,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(43,43,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(44,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(44,44,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(45,18,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(45,45,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(46,18,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(46,46,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(47,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(47,47,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(48,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(48,48,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(49,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(49,49,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(50,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(50,50,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(51,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(51,51,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(52,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(52,52,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(53,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(53,53,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(54,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(54,54,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(55,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(55,55,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(56,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(56,56,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(57,57,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(58,34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(58,52,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(58,58,2,'2017-10-06 10:23:42','2017-10-06 10:23:42');

/*!40000 ALTER TABLE `oc_category_path` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_category_to_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_category_to_layout`;

CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_category_to_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_category_to_store`;

CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_category_to_store` WRITE;
/*!40000 ALTER TABLE `oc_category_to_store` DISABLE KEYS */;

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`, `date_added`, `date_modified`)
VALUES
	(17,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(18,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(20,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(24,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(25,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(26,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(27,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(28,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(29,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(30,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(31,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(32,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(33,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(34,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(35,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(36,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(37,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(38,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(39,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(40,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(41,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(42,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(43,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(44,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(45,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(46,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(47,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(48,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(49,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(50,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(51,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(52,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(53,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(54,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(55,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(56,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(57,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(58,0,'2017-10-06 10:23:42','2017-10-06 10:23:42');

/*!40000 ALTER TABLE `oc_category_to_store` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_country
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_country`;

CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_country` WRITE;
/*!40000 ALTER TABLE `oc_country` DISABLE KEYS */;

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`, `date_added`, `date_modified`)
VALUES
	(1,'Afghanistan','AF','AFG','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(2,'Albania','AL','ALB','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(3,'Algeria','DZ','DZA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(4,'American Samoa','AS','ASM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(5,'Andorra','AD','AND','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(6,'Angola','AO','AGO','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(7,'Anguilla','AI','AIA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(8,'Antarctica','AQ','ATA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(9,'Antigua and Barbuda','AG','ATG','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(10,'Argentina','AR','ARG','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(11,'Armenia','AM','ARM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(12,'Aruba','AW','ABW','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(13,'Australia','AU','AUS','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(14,'Austria','AT','AUT','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(15,'Azerbaijan','AZ','AZE','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(16,'Bahamas','BS','BHS','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(17,'Bahrain','BH','BHR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(18,'Bangladesh','BD','BGD','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(19,'Barbados','BB','BRB','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(20,'Belarus','BY','BLR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(21,'Belgium','BE','BEL','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(22,'Belize','BZ','BLZ','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(23,'Benin','BJ','BEN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(24,'Bermuda','BM','BMU','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(25,'Bhutan','BT','BTN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(26,'Bolivia','BO','BOL','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(27,'Bosnia and Herzegovina','BA','BIH','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(28,'Botswana','BW','BWA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(29,'Bouvet Island','BV','BVT','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(30,'Brazil','BR','BRA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(31,'British Indian Ocean Territory','IO','IOT','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(32,'Brunei Darussalam','BN','BRN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(33,'Bulgaria','BG','BGR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(34,'Burkina Faso','BF','BFA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(35,'Burundi','BI','BDI','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(36,'Cambodia','KH','KHM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(37,'Cameroon','CM','CMR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(38,'Canada','CA','CAN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(39,'Cape Verde','CV','CPV','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(40,'Cayman Islands','KY','CYM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(41,'Central African Republic','CF','CAF','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(42,'Chad','TD','TCD','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(43,'Chile','CL','CHL','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(44,'China','CN','CHN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(45,'Christmas Island','CX','CXR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(46,'Cocos (Keeling) Islands','CC','CCK','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(47,'Colombia','CO','COL','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(48,'Comoros','KM','COM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(49,'Congo','CG','COG','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(50,'Cook Islands','CK','COK','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(51,'Costa Rica','CR','CRI','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(52,'Cote D\'Ivoire','CI','CIV','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(53,'Croatia','HR','HRV','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(54,'Cuba','CU','CUB','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(55,'Cyprus','CY','CYP','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(56,'Czech Republic','CZ','CZE','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(57,'Denmark','DK','DNK','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(58,'Djibouti','DJ','DJI','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(59,'Dominica','DM','DMA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(60,'Dominican Republic','DO','DOM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(61,'East Timor','TL','TLS','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(62,'Ecuador','EC','ECU','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(63,'Egypt','EG','EGY','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(64,'El Salvador','SV','SLV','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(65,'Equatorial Guinea','GQ','GNQ','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(66,'Eritrea','ER','ERI','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(67,'Estonia','EE','EST','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(68,'Ethiopia','ET','ETH','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(69,'Falkland Islands (Malvinas)','FK','FLK','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(70,'Faroe Islands','FO','FRO','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(71,'Fiji','FJ','FJI','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(72,'Finland','FI','FIN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(74,'France, Metropolitan','FR','FRA','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',1,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(75,'French Guiana','GF','GUF','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(76,'French Polynesia','PF','PYF','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(77,'French Southern Territories','TF','ATF','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(78,'Gabon','GA','GAB','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(79,'Gambia','GM','GMB','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(80,'Georgia','GE','GEO','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(81,'Germany','DE','DEU','{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',1,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(82,'Ghana','GH','GHA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(83,'Gibraltar','GI','GIB','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(84,'Greece','GR','GRC','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(85,'Greenland','GL','GRL','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(86,'Grenada','GD','GRD','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(87,'Guadeloupe','GP','GLP','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(88,'Guam','GU','GUM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(89,'Guatemala','GT','GTM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(90,'Guinea','GN','GIN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(91,'Guinea-Bissau','GW','GNB','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(92,'Guyana','GY','GUY','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(93,'Haiti','HT','HTI','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(94,'Heard and Mc Donald Islands','HM','HMD','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(95,'Honduras','HN','HND','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(96,'Hong Kong','HK','HKG','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(97,'Hungary','HU','HUN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(98,'Iceland','IS','ISL','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(99,'India','IN','IND','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(100,'Indonesia','ID','IDN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(101,'Iran (Islamic Republic of)','IR','IRN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(102,'Iraq','IQ','IRQ','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(103,'Ireland','IE','IRL','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(104,'Israel','IL','ISR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(105,'Italy','IT','ITA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(106,'Jamaica','JM','JAM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(107,'Japan','JP','JPN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(108,'Jordan','JO','JOR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(109,'Kazakhstan','KZ','KAZ','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(110,'Kenya','KE','KEN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(111,'Kiribati','KI','KIR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(112,'North Korea','KP','PRK','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(113,'South Korea','KR','KOR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(114,'Kuwait','KW','KWT','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(115,'Kyrgyzstan','KG','KGZ','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(116,'Lao People\'s Democratic Republic','LA','LAO','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(117,'Latvia','LV','LVA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(118,'Lebanon','LB','LBN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(119,'Lesotho','LS','LSO','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(120,'Liberia','LR','LBR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(121,'Libyan Arab Jamahiriya','LY','LBY','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(122,'Liechtenstein','LI','LIE','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(123,'Lithuania','LT','LTU','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(124,'Luxembourg','LU','LUX','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(125,'Macau','MO','MAC','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(126,'FYROM','MK','MKD','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(127,'Madagascar','MG','MDG','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(128,'Malawi','MW','MWI','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(129,'Malaysia','MY','MYS','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(130,'Maldives','MV','MDV','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(131,'Mali','ML','MLI','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(132,'Malta','MT','MLT','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(133,'Marshall Islands','MH','MHL','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(134,'Martinique','MQ','MTQ','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(135,'Mauritania','MR','MRT','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(136,'Mauritius','MU','MUS','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(137,'Mayotte','YT','MYT','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(138,'Mexico','MX','MEX','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(139,'Micronesia, Federated States of','FM','FSM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(140,'Moldova, Republic of','MD','MDA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(141,'Monaco','MC','MCO','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(142,'Mongolia','MN','MNG','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(143,'Montserrat','MS','MSR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(144,'Morocco','MA','MAR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(145,'Mozambique','MZ','MOZ','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(146,'Myanmar','MM','MMR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(147,'Namibia','NA','NAM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(148,'Nauru','NR','NRU','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(149,'Nepal','NP','NPL','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(150,'Netherlands','NL','NLD','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(151,'Netherlands Antilles','AN','ANT','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(152,'New Caledonia','NC','NCL','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(153,'New Zealand','NZ','NZL','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(154,'Nicaragua','NI','NIC','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(155,'Niger','NE','NER','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(156,'Nigeria','NG','NGA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(157,'Niue','NU','NIU','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(158,'Norfolk Island','NF','NFK','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(159,'Northern Mariana Islands','MP','MNP','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(160,'Norway','NO','NOR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(161,'Oman','OM','OMN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(162,'Pakistan','PK','PAK','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(163,'Palau','PW','PLW','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(164,'Panama','PA','PAN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(165,'Papua New Guinea','PG','PNG','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(166,'Paraguay','PY','PRY','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(167,'Peru','PE','PER','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(168,'Philippines','PH','PHL','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(169,'Pitcairn','PN','PCN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(170,'Poland','PL','POL','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(171,'Portugal','PT','PRT','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(172,'Puerto Rico','PR','PRI','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(173,'Qatar','QA','QAT','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(174,'Reunion','RE','REU','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(175,'Romania','RO','ROM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(176,'Russian Federation','RU','RUS','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(177,'Rwanda','RW','RWA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(178,'Saint Kitts and Nevis','KN','KNA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(179,'Saint Lucia','LC','LCA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(180,'Saint Vincent and the Grenadines','VC','VCT','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(181,'Samoa','WS','WSM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(182,'San Marino','SM','SMR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(183,'Sao Tome and Principe','ST','STP','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(184,'Saudi Arabia','SA','SAU','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(185,'Senegal','SN','SEN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(186,'Seychelles','SC','SYC','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(187,'Sierra Leone','SL','SLE','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(188,'Singapore','SG','SGP','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(189,'Slovak Republic','SK','SVK','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(190,'Slovenia','SI','SVN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(191,'Solomon Islands','SB','SLB','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(192,'Somalia','SO','SOM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(193,'South Africa','ZA','ZAF','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(194,'South Georgia &amp; South Sandwich Islands','GS','SGS','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(195,'Spain','ES','ESP','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(196,'Sri Lanka','LK','LKA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(197,'St. Helena','SH','SHN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(198,'St. Pierre and Miquelon','PM','SPM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(199,'Sudan','SD','SDN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(200,'Suriname','SR','SUR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(201,'Svalbard and Jan Mayen Islands','SJ','SJM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(202,'Swaziland','SZ','SWZ','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(203,'Sweden','SE','SWE','{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',1,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(204,'Switzerland','CH','CHE','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(205,'Syrian Arab Republic','SY','SYR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(206,'Taiwan','TW','TWN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(207,'Tajikistan','TJ','TJK','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(208,'Tanzania, United Republic of','TZ','TZA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(209,'Thailand','TH','THA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(210,'Togo','TG','TGO','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(211,'Tokelau','TK','TKL','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(212,'Tonga','TO','TON','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(213,'Trinidad and Tobago','TT','TTO','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(214,'Tunisia','TN','TUN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(215,'Turkey','TR','TUR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(216,'Turkmenistan','TM','TKM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(217,'Turks and Caicos Islands','TC','TCA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(218,'Tuvalu','TV','TUV','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(219,'Uganda','UG','UGA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(220,'Ukraine','UA','UKR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(221,'United Arab Emirates','AE','ARE','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(222,'United Kingdom','GB','GBR','',1,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(223,'United States','US','USA','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(224,'United States Minor Outlying Islands','UM','UMI','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(225,'Uruguay','UY','URY','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(226,'Uzbekistan','UZ','UZB','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(227,'Vanuatu','VU','VUT','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(228,'Vatican City State (Holy See)','VA','VAT','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(229,'Venezuela','VE','VEN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(230,'Viet Nam','VN','VNM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(231,'Virgin Islands (British)','VG','VGB','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(232,'Virgin Islands (U.S.)','VI','VIR','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(233,'Wallis and Futuna Islands','WF','WLF','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(234,'Western Sahara','EH','ESH','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(235,'Yemen','YE','YEM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(237,'Democratic Republic of Congo','CD','COD','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(238,'Zambia','ZM','ZMB','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(239,'Zimbabwe','ZW','ZWE','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(242,'Montenegro','ME','MNE','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(243,'Serbia','RS','SRB','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(244,'Aaland Islands','AX','ALA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(245,'Bonaire, Sint Eustatius and Saba','BQ','BES','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(246,'Curacao','CW','CUW','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(247,'Palestinian Territory, Occupied','PS','PSE','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(248,'South Sudan','SS','SSD','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(249,'St. Barthelemy','BL','BLM','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(250,'St. Martin (French part)','MF','MAF','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(251,'Canary Islands','IC','ICA','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(252,'Ascension Island (British)','AC','ASC','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(253,'Kosovo, Republic of','XK','UNK','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(254,'Isle of Man','IM','IMN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(255,'Tristan da Cunha','TA','SHN','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(256,'Guernsey','GG','GGY','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(257,'Jersey','JE','JEY','',0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42');

/*!40000 ALTER TABLE `oc_country` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_coupon
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_coupon`;

CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '2001-01-01',
  `date_end` date NOT NULL DEFAULT '2001-01-01',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_coupon` WRITE;
/*!40000 ALTER TABLE `oc_coupon` DISABLE KEYS */;

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`, `date_modified`)
VALUES
	(4,'-10% Discount','2222','P',10.0000,0,0,0.0000,'2014-01-01','2020-01-01',10,'10',0,'2009-01-27 13:55:03','2017-10-06 10:23:42'),
	(5,'Free Shipping','3333','P',0.0000,0,1,100.0000,'2014-01-01','2014-02-01',10,'10',0,'2009-03-14 21:13:53','2017-10-06 10:23:42'),
	(6,'-10.00 Discount','1111','F',10.0000,0,0,10.0000,'2014-01-01','2020-01-01',100000,'10000',0,'2009-03-14 21:15:18','2017-10-06 10:23:42');

/*!40000 ALTER TABLE `oc_coupon` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_coupon_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_coupon_category`;

CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_coupon_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_coupon_history`;

CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_coupon_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_coupon_product`;

CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_cron
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_cron`;

CREATE TABLE `oc_cron` (
  `cron_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `cycle` varchar(12) NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cron_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_currency
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_currency`;

CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` double(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_currency` WRITE;
/*!40000 ALTER TABLE `oc_currency` DISABLE KEYS */;

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_added`, `date_modified`)
VALUES
	(1,'Pound Sterling','GBP','£','','2',0.61250001,1,'2017-10-06 10:23:42','2014-09-25 14:40:00'),
	(2,'US Dollar','USD','$','','2',1.00000000,1,'2017-10-06 10:23:42','2014-09-25 14:40:00'),
	(3,'Euro','EUR','','€','2',0.78460002,1,'2017-10-06 10:23:42','2014-09-25 14:40:00');

/*!40000 ALTER TABLE `oc_currency` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_custom_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_custom_field`;

CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_custom_field_customer_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_custom_field_customer_group`;

CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_custom_field_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_custom_field_description`;

CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_custom_field_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_custom_field_value`;

CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_custom_field_value_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_custom_field_value_description`;

CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer`;

CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_customer_activity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_activity`;

CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_customer_affiliate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_affiliate`;

CREATE TABLE `oc_customer_affiliate` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `custom_field` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_customer_affiliate_report
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_affiliate_report`;

CREATE TABLE `oc_customer_affiliate_report` (
  `customer_affiliate_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `country` varchar(2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_affiliate_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_customer_approval
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_approval`;

CREATE TABLE `oc_customer_approval` (
  `customer_approval_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `type` varchar(9) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_approval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_customer_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_group`;

CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_customer_group` WRITE;
/*!40000 ALTER TABLE `oc_customer_group` DISABLE KEYS */;

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`, `date_added`, `date_modified`)
VALUES
	(1,0,1,'2017-10-06 10:23:42','2017-10-06 10:23:42');

/*!40000 ALTER TABLE `oc_customer_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_customer_group_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_group_description`;

CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_customer_group_description` WRITE;
/*!40000 ALTER TABLE `oc_customer_group_description` DISABLE KEYS */;

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`, `date_added`, `date_modified`)
VALUES
	(1,1,'Default','test','2017-10-06 10:23:42','2017-10-06 10:23:42');

/*!40000 ALTER TABLE `oc_customer_group_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_customer_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_history`;

CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_customer_ip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_ip`;

CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `country` varchar(2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_customer_login
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_login`;

CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_customer_online
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_online`;

CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_customer_search
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_search`;

CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_search_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_customer_transaction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_transaction`;

CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_customer_wishlist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_wishlist`;

CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_download
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_download`;

CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_download_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_download_description`;

CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_download_report
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_download_report`;

CREATE TABLE `oc_download_report` (
  `download_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `download_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `country` varchar(2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`download_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_event`;

CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_event` WRITE;
/*!40000 ALTER TABLE `oc_event` DISABLE KEYS */;

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`, `date_added`, `date_modified`)
VALUES
	(1,'activity_customer_add','catalog/model/account/customer/addCustomer/after','event/activity/addCustomer',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(2,'activity_customer_edit','catalog/model/account/customer/editCustomer/after','event/activity/editCustomer',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(3,'activity_customer_password','catalog/model/account/customer/editPassword/after','event/activity/editPassword',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(4,'activity_customer_forgotten','catalog/model/account/customer/editCode/after','event/activity/forgotten',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(5,'activity_transaction','catalog/model/account/customer/addTransaction/after','event/activity/addTransaction',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(6,'activity_customer_login','catalog/model/account/customer/deleteLoginAttempts/after','event/activity/login',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(7,'activity_address_add','catalog/model/account/address/addAddress/after','event/activity/addAddress',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(8,'activity_address_edit','catalog/model/account/address/editAddress/after','event/activity/editAddress',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(9,'activity_address_delete','catalog/model/account/address/deleteAddress/after','event/activity/deleteAddress',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(10,'activity_affiliate_add','catalog/model/account/affiliate/addAffiliate/after','event/activity/addAffiliate',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(11,'activity_affiliate_edit','catalog/model/account/affiliate/editAffiliate/after','event/activity/editAffiliate',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(12,'activity_order_add','catalog/model/checkout/order/addOrderHistory/before','event/activity/addOrderHistory',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(13,'activity_return_add','catalog/model/account/return/addReturn/after','event/activity/addReturn',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(14,'mail_transaction','catalog/model/account/customer/addTransaction/after','mail/transaction',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(15,'mail_forgotten','catalog/model/account/customer/editCode/after','mail/forgotten',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(16,'mail_customer_add','catalog/model/account/customer/addCustomer/after','mail/register',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(17,'mail_customer_alert','catalog/model/account/customer/addCustomer/after','mail/register/alert',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(18,'mail_affiliate_add','catalog/model/account/customer/addAffiliate/after','mail/affiliate',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(19,'mail_affiliate_alert','catalog/model/account/customer/addAffiliate/after','mail/affiliate/alert',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(20,'mail_voucher','catalog/model/checkout/order/addOrderHistory/after','extension/total/voucher/send',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(21,'mail_order_add','catalog/model/checkout/order/addOrderHistory/before','mail/order',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(22,'mail_order_alert','catalog/model/checkout/order/addOrderHistory/before','mail/order/alert',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(23,'statistics_review_add','catalog/model/catalog/review/addReview/after','event/statistics/addReview',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(24,'statistics_return_add','catalog/model/account/return/addReturn/after','event/statistics/addReturn',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(25,'statistics_order_history','catalog/model/checkout/order/addOrderHistory/after','event/statistics/addOrderHistory',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(26,'admin_mail_affiliate_approve','admin/model/customer/customer_approval/approveAffiliate/after','mail/affiliate/approve',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(27,'admin_mail_affiliate_deny','admin/model/customer/customer_approval/denyAffiliate/after','mail/affiliate/deny',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(28,'admin_mail_customer_approve','admin/model/customer/customer_approval/approveCustomer/after','mail/customer/approve',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(29,'admin_mail_customer_deny','admin/model/customer/customer_approval/denyCustomer/after','mail/customer/deny',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(31,'admin_mail_transaction','admin/model/customer/customer/addTransaction/after','mail/transaction',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(32,'admin_mail_return','admin/model/sale/return/addReturn/after','mail/return',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42'),
	(33,'admin_mail_forgotten','admin/model/user/user/editCode/after','mail/forgotten',1,0,'2017-10-06 10:23:42','2017-10-06 10:23:42');

/*!40000 ALTER TABLE `oc_event` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_extension
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_extension`;

CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_extension_install
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_extension_install`;

CREATE TABLE `oc_extension_install` (
  `extension_install_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) NOT NULL,
  `extension_download_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`extension_install_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_extension_path
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_extension_path`;

CREATE TABLE `oc_extension_path` (
  `extension_path_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_install_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`extension_path_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_filter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_filter`;

CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_filter_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_filter_description`;

CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_filter_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_filter_group`;

CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_filter_group_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_filter_group_description`;

CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_geo_zone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_geo_zone`;

CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_geo_zone` WRITE;
/*!40000 ALTER TABLE `oc_geo_zone` DISABLE KEYS */;

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_added`, `date_modified`)
VALUES
	(3,'UK VAT Zone','UK VAT','2009-01-06 23:26:25','2010-02-26 22:33:24'),
	(4,'UK Shipping','UK Shipping Zones','2009-06-23 01:14:53','2010-12-15 15:18:13');

/*!40000 ALTER TABLE `oc_geo_zone` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_information
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_information`;

CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_information` WRITE;
/*!40000 ALTER TABLE `oc_information` DISABLE KEYS */;

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`, `date_added`, `date_modified`)
VALUES
	(3,1,3,1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4,1,1,1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(5,1,4,1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(6,1,2,1,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_information` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_information_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_information_description`;

CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` mediumtext NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_information_description` WRITE;
/*!40000 ALTER TABLE `oc_information_description` DISABLE KEYS */;

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`, `date_added`, `date_modified`)
VALUES
	(3,1,'Privacy Policy','&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n','Privacy Policy','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4,1,'About Us','&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n','About Us','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(5,1,'Terms &amp; Conditions','&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n','Terms &amp; Conditions','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(6,1,'Delivery Information','&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n','Delivery Information','','','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_information_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_information_to_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_information_to_layout`;

CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_information_to_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_information_to_store`;

CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_information_to_store` WRITE;
/*!40000 ALTER TABLE `oc_information_to_store` DISABLE KEYS */;

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`, `date_added`, `date_modified`)
VALUES
	(3,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(5,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(6,0,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_information_to_store` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_language
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_language`;

CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_language` WRITE;
/*!40000 ALTER TABLE `oc_language` DISABLE KEYS */;

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`, `date_added`, `date_modified`)
VALUES
	(1,'English','en-gb','en-gb,en','gb.png','english',1,1,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_language` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_layout`;

CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_layout` WRITE;
/*!40000 ALTER TABLE `oc_layout` DISABLE KEYS */;

INSERT INTO `oc_layout` (`layout_id`, `name`, `date_added`, `date_modified`)
VALUES
	(1,'Home','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2,'Product','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3,'Category','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4,'Default','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(5,'Manufacturer','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(6,'Account','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(7,'Checkout','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(8,'Contact','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(9,'Sitemap','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(10,'Affiliate','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(11,'Information','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(12,'Compare','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(13,'Search','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_layout` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_layout_module
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_layout_module`;

CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_layout_module` WRITE;
/*!40000 ALTER TABLE `oc_layout_module` DISABLE KEYS */;

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`, `date_added`, `date_modified`)
VALUES
	(2,4,'0','content_top',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3,4,'0','content_top',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(20,5,'0','column_left',2,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(65,1,'featured.28','content_top',2,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(66,1,'slideshow.27','content_top',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(67,1,'carousel.29','content_top',3,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(68,6,'account','column_right',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(69,10,'account','column_right',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(72,3,'category','column_left',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(73,3,'banner.30','column_left',2,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_layout_module` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_layout_route
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_layout_route`;

CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_layout_route` WRITE;
/*!40000 ALTER TABLE `oc_layout_route` DISABLE KEYS */;

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`, `date_added`, `date_modified`)
VALUES
	(17,10,0,'affiliate/%','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(20,2,0,'product/product','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(23,7,0,'checkout/%','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(24,11,0,'information/information','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(31,8,0,'information/contact','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(32,9,0,'information/sitemap','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(34,4,0,'','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(38,6,0,'account/%','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(42,1,0,'common/home','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(44,3,0,'product/category','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(45,5,0,'product/manufacturer','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(52,12,0,'product/compare','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(53,13,0,'product/search','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_layout_route` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_length_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_length_class`;

CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`length_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_length_class` WRITE;
/*!40000 ALTER TABLE `oc_length_class` DISABLE KEYS */;

INSERT INTO `oc_length_class` (`length_class_id`, `value`, `date_added`, `date_modified`)
VALUES
	(1,1.00000000,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2,10.00000000,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3,0.39370000,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_length_class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_length_class_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_length_class_description`;

CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_length_class_description` WRITE;
/*!40000 ALTER TABLE `oc_length_class_description` DISABLE KEYS */;

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`, `date_added`, `date_modified`)
VALUES
	(1,1,'Centimeter','cm','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2,1,'Millimeter','mm','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3,1,'Inch','in','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_length_class_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_location`;

CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_manufacturer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_manufacturer`;

CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_manufacturer` WRITE;
/*!40000 ALTER TABLE `oc_manufacturer` DISABLE KEYS */;

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`, `date_added`, `date_modified`)
VALUES
	(5,'HTC','catalog/demo/htc_logo.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(6,'Palm','catalog/demo/palm_logo.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(7,'Hewlett-Packard','catalog/demo/hp_logo.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(8,'Apple','catalog/demo/apple_logo.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(9,'Canon','catalog/demo/canon_logo.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(10,'Sony','catalog/demo/sony_logo.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_manufacturer_to_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_manufacturer_to_store`;

CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_manufacturer_to_store` WRITE;
/*!40000 ALTER TABLE `oc_manufacturer_to_store` DISABLE KEYS */;

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`, `date_added`, `date_modified`)
VALUES
	(5,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(6,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(7,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(8,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(9,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(10,0,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_manufacturer_to_store` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_marketing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_marketing`;

CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`marketing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_marketing_report
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_marketing_report`;

CREATE TABLE `oc_marketing_report` (
  `marketing_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `marketing_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `country` varchar(2) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`marketing_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_modification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_modification`;

CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_install_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`modification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_module
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_module`;

CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_module` WRITE;
/*!40000 ALTER TABLE `oc_module` DISABLE KEYS */;

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`, `date_added`, `date_modified`)
VALUES
	(27,'Home Page','slideshow','{\"name\":\"Home Page\",\"banner_id\":\"7\",\"width\":\"1140\",\"height\":\"380\",\"status\":\"1\"}','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(28,'Home Page','featured','{\"name\":\"Home Page\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(29,'Home Page','carousel','{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(30,'Category','banner','{\"name\":\"Category\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(31,'Banner 1','banner','{\"name\":\"Banner 1\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_module` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_option`;

CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_option` WRITE;
/*!40000 ALTER TABLE `oc_option` DISABLE KEYS */;

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`, `date_added`, `date_modified`)
VALUES
	(1,'radio',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2,'checkbox',2,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4,'text',3,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(5,'select',4,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(6,'textarea',5,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(7,'file',6,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(8,'date',7,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(9,'time',8,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(10,'timestamp',9,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(11,'select',10,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(12,'date',11,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_option` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_option_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_option_description`;

CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_option_description` WRITE;
/*!40000 ALTER TABLE `oc_option_description` DISABLE KEYS */;

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`, `date_added`, `date_modified`)
VALUES
	(1,1,'Radio','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2,1,'Checkbox','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4,1,'Text','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(5,1,'Select','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(6,1,'Textarea','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(7,1,'File','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(8,1,'Date','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(9,1,'Time','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(10,1,'Date &amp; Time','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(11,1,'Size','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(12,1,'Delivery Date','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_option_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_option_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_option_value`;

CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_option_value` WRITE;
/*!40000 ALTER TABLE `oc_option_value` DISABLE KEYS */;

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`, `date_added`, `date_modified`)
VALUES
	(23,2,'',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(24,2,'',2,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(31,1,'',2,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(32,1,'',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(39,5,'',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(40,5,'',2,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(41,5,'',3,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(42,5,'',4,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(43,1,'',3,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(44,2,'',3,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(45,2,'',4,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(46,11,'',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(47,11,'',2,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(48,11,'',3,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_option_value` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_option_value_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_option_value_description`;

CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_option_value_description` WRITE;
/*!40000 ALTER TABLE `oc_option_value_description` DISABLE KEYS */;

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`, `date_added`, `date_modified`)
VALUES
	(23,1,2,'Checkbox 1','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(24,1,2,'Checkbox 2','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(31,1,1,'Medium','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(32,1,1,'Small','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(39,1,5,'Red','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(40,1,5,'Blue','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(41,1,5,'Green','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(42,1,5,'Yellow','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(43,1,1,'Large','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(44,1,2,'Checkbox 3','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(45,1,2,'Checkbox 4','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(46,1,11,'Small','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(47,1,11,'Medium','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(48,1,11,'Large','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_option_value_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_order`;

CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_order_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_history`;

CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_order_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_option`;

CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_order_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_product`;

CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_product_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_order_recurring
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_recurring`;

CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_order_recurring_transaction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_recurring_transaction`;

CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_order_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_status`;

CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_order_status` WRITE;
/*!40000 ALTER TABLE `oc_order_status` DISABLE KEYS */;

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`, `date_added`, `date_modified`)
VALUES
	(1,1,'Pending','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2,1,'Processing','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3,1,'Shipped','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(5,1,'Complete','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(7,1,'Canceled','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(8,1,'Denied','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(9,1,'Canceled Reversal','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(10,1,'Failed','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(11,1,'Refunded','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(12,1,'Reversed','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(13,1,'Chargeback','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(14,1,'Expired','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(15,1,'Processed','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(16,1,'Voided','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_order_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_order_total
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_total`;

CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_order_voucher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_voucher`;

CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `oc_product`;
CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(28, 'Product 1', '', '', '', '', '', '', '', 939, 7, 'catalog/demo/htc_touch_hd_1.jpg', 5, 1, '100.0000', 200, 9, '2009-02-03', '146.40000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 16:06:50', '2011-09-30 01:05:39'),
(29, 'Product 2', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/palm_treo_pro_1.jpg', 6, 1, '279.9900', 0, 9, '2009-02-03', '133.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 16:42:17', '2011-09-30 01:06:08'),
(30, 'Product 3', '', '', '', '', '', '', '', 7, 6, 'catalog/demo/canon_eos_5d_1.jpg', 9, 1, '100.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 16:59:00', '2011-09-30 01:05:23'),
(31, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/nikon_d300_1.jpg', 0, 1, '80.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 17:00:10', '2011-09-30 01:06:00'),
(32, 'Product 5', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/ipod_touch_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 17:07:26', '2011-09-30 01:07:22'),
(33, 'Product 6', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/samsung_syncmaster_941bw.jpg', 0, 1, '200.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 17:08:31', '2011-09-30 01:06:29'),
(34, 'Product 7', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/ipod_shuffle_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:07:54', '2011-09-30 01:07:17'),
(35, 'Product 8', '', '', '', '', '', '', '', 1000, 5, '', 0, 0, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 18:08:31', '2011-09-30 01:06:17'),
(36, 'Product 9', '', '', '', '', '', '', '', 994, 6, 'catalog/demo/ipod_nano_1.jpg', 8, 0, '100.0000', 100, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:09:19', '2011-09-30 01:07:12'),
(40, 'product 11', '', '', '', '', '', '', '', 970, 5, 'catalog/demo/iphone_1.jpg', 8, 1, '101.0000', 0, 9, '2009-02-03', '10.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 21:07:12', '2011-09-30 01:06:53'),
(41, 'Product 14', '', '', '', '', '', '', '', 977, 5, 'catalog/demo/imac_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 21:07:26', '2011-09-30 01:06:44'),
(42, 'Product 15', '', '', '', '', '', '', '', 990, 5, 'catalog/demo/apple_cinema_30.jpg', 8, 1, '100.0000', 400, 9, '2009-02-04', '12.50000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 2, 0, 1, 0, '2009-02-03 21:07:37', '2011-09-30 00:46:19'),
(43, 'Product 16', '', '', '', '', '', '', '', 929, 5, 'catalog/demo/macbook_1.jpg', 8, 0, '500.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:07:49', '2011-09-30 01:05:46'),
(44, 'Product 17', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/macbook_air_1.jpg', 8, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:00', '2011-09-30 01:05:53'),
(45, 'Product 18', '', '', '', '', '', '', '', 998, 5, 'catalog/demo/macbook_pro_1.jpg', 8, 1, '2000.0000', 0, 100, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:17', '2011-09-15 22:22:01'),
(46, 'Product 19', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/sony_vaio_1.jpg', 10, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:29', '2011-09-30 01:06:39'),
(47, 'Product 21', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/hp_1.jpg', 7, 1, '100.0000', 400, 9, '2009-02-03', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 0, '2009-02-03 21:08:40', '2011-09-30 01:05:28'),
(48, 'product 20', 'test 1', '', '', '', '', '', 'test 2', 995, 5, 'catalog/demo/ipod_classic_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-08', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-08 17:21:51', '2011-09-30 01:07:06'),
(49, 'SAM1', '', '', '', '', '', '', '', 0, 8, 'catalog/demo/samsung_tab_1.jpg', 0, 1, '199.9900', 0, 9, '2011-04-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2011-04-26 08:57:34', '2011-09-30 01:06:23');



# Dump of table oc_product_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_attribute`;

CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_product_attribute` WRITE;
/*!40000 ALTER TABLE `oc_product_attribute` DISABLE KEYS */;

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`, `date_added`, `date_modified`)
VALUES
	(42,3,1,'100mhz','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(43,2,1,'1','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(43,4,1,'8gb','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(47,2,1,'4','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(47,4,1,'16GB','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_product_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_description`;

CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_product_description` WRITE;
/*!40000 ALTER TABLE `oc_product_description` DISABLE KEYS */;

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `date_added`, `date_modified`)
VALUES
	(28,1,'HTC Touch HD','&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n','','	 HTC Touch HD','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(29,1,'Palm Treo Pro','&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n','','Palm Treo Pro','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(30,1,'Canon EOS 5D','&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n','','sdf','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(31,1,'Nikon D300','&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;','','Nikon D300','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(32,1,'iPod Touch','&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n','','	 iPod Touch','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(33,1,'Samsung SyncMaster 941BW','&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n','','Samsung SyncMaster 941BW','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(34,1,'iPod Shuffle','&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n','','iPod Shuffle','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(35,1,'Product 8','&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n','','Product 8','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(36,1,'iPod Nano','&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n','','iPod Nano','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(40,1,'iPhone','&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n','','iPhone','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(41,1,'iMac','&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n','','iMac','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(42,1,'Apple Cinema 30&quot;','&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n','','Apple Cinema 30','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(43,1,'MacBook','&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n','','MacBook','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(44,1,'MacBook Air','&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n','','MacBook Air','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(45,1,'MacBook Pro','&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;','','MacBook Pro','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(46,1,'Sony VAIO','&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n','','Sony VAIO','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(47,1,'HP LP3065','&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n','','HP LP3065','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(48,1,'iPod Classic','&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;','','iPod Classic','','','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(49,1,'Samsung Galaxy Tab 10.1','&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n','','Samsung Galaxy Tab 10.1','','','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_product_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_product_discount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_discount`;

CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '2001-01-01',
  `date_end` date NOT NULL DEFAULT '2001-01-01',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_product_discount` WRITE;
/*!40000 ALTER TABLE `oc_product_discount` DISABLE KEYS */;

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`, `date_added`, `date_modified`)
VALUES
	(438,42,1,10,1,88.0000,'0000-00-00','0000-00-00','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(439,42,1,20,1,77.0000,'0000-00-00','0000-00-00','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(440,42,1,30,1,66.0000,'0000-00-00','0000-00-00','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_product_discount` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_product_filter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_filter`;

CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_product_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_image`;

CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_product_image` WRITE;
/*!40000 ALTER TABLE `oc_product_image` DISABLE KEYS */;

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`, `date_added`, `date_modified`)
VALUES
	(1968,43,'catalog/demo/macbook_3.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1969,43,'catalog/demo/macbook_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1970,43,'catalog/demo/macbook_4.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1971,43,'catalog/demo/macbook_5.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1972,44,'catalog/demo/macbook_air_3.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1973,44,'catalog/demo/macbook_air_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1974,44,'catalog/demo/macbook_air_4.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1975,45,'catalog/demo/macbook_pro_4.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1976,45,'catalog/demo/macbook_pro_3.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1977,45,'catalog/demo/macbook_pro_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1978,40,'catalog/demo/iphone_4.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1979,40,'catalog/demo/iphone_3.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1980,40,'catalog/demo/iphone_5.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1981,40,'catalog/demo/iphone_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1982,40,'catalog/demo/iphone_6.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1983,31,'catalog/demo/nikon_d300_5.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1984,31,'catalog/demo/nikon_d300_4.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1985,31,'catalog/demo/nikon_d300_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1986,31,'catalog/demo/nikon_d300_3.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1987,29,'catalog/demo/palm_treo_pro_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1988,29,'catalog/demo/palm_treo_pro_3.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1989,48,'catalog/demo/ipod_classic_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1990,48,'catalog/demo/ipod_classic_3.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1991,48,'catalog/demo/ipod_classic_4.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1992,46,'catalog/demo/sony_vaio_3.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1993,46,'catalog/demo/sony_vaio_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1994,46,'catalog/demo/sony_vaio_4.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1995,46,'catalog/demo/sony_vaio_5.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1998,36,'catalog/demo/ipod_nano_3.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1999,36,'catalog/demo/ipod_nano_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2000,36,'catalog/demo/ipod_nano_4.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2001,36,'catalog/demo/ipod_nano_5.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2002,34,'catalog/demo/ipod_shuffle_3.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2003,34,'catalog/demo/ipod_shuffle_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2004,34,'catalog/demo/ipod_shuffle_4.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2005,34,'catalog/demo/ipod_shuffle_5.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2006,32,'catalog/demo/ipod_touch_4.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2007,32,'catalog/demo/ipod_touch_3.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2008,32,'catalog/demo/ipod_touch_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2009,32,'catalog/demo/ipod_touch_5.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2010,32,'catalog/demo/ipod_touch_6.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2011,32,'catalog/demo/ipod_touch_7.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2034,28,'catalog/demo/htc_touch_hd_3.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2035,28,'catalog/demo/htc_touch_hd_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2313,42,'catalog/demo/canon_eos_5d_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2314,42,'catalog/demo/canon_eos_5d_1.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2315,42,'catalog/demo/compaq_presario.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2316,42,'catalog/demo/hp_1.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2317,42,'catalog/demo/canon_logo.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2320,47,'catalog/demo/hp_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2321,47,'catalog/demo/hp_3.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2322,49,'catalog/demo/samsung_tab_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2323,49,'catalog/demo/samsung_tab_3.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2324,49,'catalog/demo/samsung_tab_4.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2325,49,'catalog/demo/samsung_tab_5.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2326,49,'catalog/demo/samsung_tab_6.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2327,49,'catalog/demo/samsung_tab_7.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2344,30,'catalog/demo/canon_eos_5d_3.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2345,30,'catalog/demo/canon_eos_5d_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2350,41,'catalog/demo/imac_2.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2351,41,'catalog/demo/imac_3.jpg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_product_image` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_product_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_option`;

CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_product_option` WRITE;
/*!40000 ALTER TABLE `oc_product_option` DISABLE KEYS */;

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`, `date_added`, `date_modified`)
VALUES
	(208,42,4,'test',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(209,42,6,'',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(217,42,5,'',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(218,42,1,'',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(219,42,8,'2011-02-20',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(220,42,10,'2011-02-20 22:25',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(221,42,9,'22:25',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(222,42,7,'',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(223,42,2,'',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(224,35,11,'',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(225,47,12,'2011-04-22',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(226,30,5,'',1,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_product_option` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_product_option_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_option_value`;

CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_product_option_value` WRITE;
/*!40000 ALTER TABLE `oc_product_option_value` DISABLE KEYS */;

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`, `date_added`, `date_modified`)
VALUES
	(1,217,42,5,41,100,0,1.0000,'+',0,'+',1.00000000,'+','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2,217,42,5,42,200,1,2.0000,'+',0,'+',2.00000000,'+','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3,217,42,5,40,300,0,3.0000,'+',0,'+',3.00000000,'+','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4,217,42,5,39,92,1,4.0000,'+',0,'+',4.00000000,'+','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(5,218,42,1,32,96,1,10.0000,'+',1,'+',10.00000000,'+','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(6,218,42,1,31,146,1,20.0000,'+',2,'-',20.00000000,'+','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(7,218,42,1,43,300,1,30.0000,'+',3,'+',30.00000000,'+','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(8,223,42,2,23,48,1,10.0000,'+',0,'+',10.00000000,'+','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(9,223,42,2,24,194,1,20.0000,'+',0,'+',20.00000000,'+','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(10,223,42,2,44,2696,1,30.0000,'+',0,'+',30.00000000,'+','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(11,223,42,2,45,3998,1,40.0000,'+',0,'+',40.00000000,'+','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(12,224,35,11,46,0,1,5.0000,'+',0,'+',0.00000000,'+','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(13,224,35,11,47,10,1,10.0000,'+',0,'+',0.00000000,'+','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(14,224,35,11,48,15,1,15.0000,'+',0,'+',0.00000000,'+','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(15,226,30,5,39,2,1,0.0000,'+',0,'+',0.00000000,'+','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(16,226,30,5,40,5,1,0.0000,'+',0,'+',0.00000000,'+','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_product_option_value` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_product_recurring
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_recurring`;

CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_product_related
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_related`;

CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_product_related` WRITE;
/*!40000 ALTER TABLE `oc_product_related` DISABLE KEYS */;

INSERT INTO `oc_product_related` (`product_id`, `related_id`, `date_added`, `date_modified`)
VALUES
	(40,42,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(41,42,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(42,40,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(42,41,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_product_related` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_product_special
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_special`;

CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '2001-01-01',
  `date_end` date NOT NULL DEFAULT '2001-01-01',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_product_special` WRITE;
/*!40000 ALTER TABLE `oc_product_special` DISABLE KEYS */;

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`, `date_added`, `date_modified`)
VALUES
	(419,42,1,1,90.0000,'2001-01-01','2001-01-01','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(438,30,1,1,80.0000,'2001-01-01','2001-01-01','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(439,30,1,2,90.0000,'2001-01-01','2001-01-01','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_product_special` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_product_to_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_to_category`;

CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_product_to_category` WRITE;
/*!40000 ALTER TABLE `oc_product_to_category` DISABLE KEYS */;

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `date_added`, `date_modified`)
VALUES
	(28,20,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(28,24,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(29,20,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(29,24,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(30,20,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(30,33,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(31,33,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(32,34,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(33,20,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(33,28,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(34,34,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(35,20,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(36,34,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(40,20,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(40,24,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(41,27,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(42,20,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(42,28,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(43,18,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(43,20,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(44,18,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(44,20,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(45,18,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(46,18,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(46,20,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(47,18,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(47,20,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(48,20,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(48,34,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(49,57,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_product_to_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_product_to_download
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_to_download`;

CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_product_to_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_to_layout`;

CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_product_to_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_to_store`;

CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_product_to_store` WRITE;
/*!40000 ALTER TABLE `oc_product_to_store` DISABLE KEYS */;

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`, `date_added`, `date_modified`)
VALUES
	(28,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(29,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(30,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(31,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(32,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(33,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(34,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(35,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(36,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(40,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(41,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(42,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(43,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(44,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(45,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(46,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(47,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(48,0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(49,0,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_product_to_store` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_recurring
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_recurring`;

CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recurring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_recurring_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_recurring_description`;

CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_return
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_return`;

CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '2001-01-01',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_return_action
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_return_action`;

CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_return_action` WRITE;
/*!40000 ALTER TABLE `oc_return_action` DISABLE KEYS */;

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`, `date_added`, `date_modified`)
VALUES
	(1,1,'Refunded','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2,1,'Credit Issued','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3,1,'Replacement Sent','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_return_action` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_return_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_return_history`;

CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`return_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_return_reason
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_return_reason`;

CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_return_reason` WRITE;
/*!40000 ALTER TABLE `oc_return_reason` DISABLE KEYS */;

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`, `date_added`, `date_modified`)
VALUES
	(1,1,'Dead On Arrival','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2,1,'Received Wrong Item','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3,1,'Order Error','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4,1,'Faulty, please supply details','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(5,1,'Other, please supply details','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_return_reason` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_return_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_return_status`;

CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_return_status` WRITE;
/*!40000 ALTER TABLE `oc_return_status` DISABLE KEYS */;

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`, `date_added`, `date_modified`)
VALUES
	(1,1,'Pending','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2,1,'Awaiting Products','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3,1,'Complete','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_return_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_review
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_review`;

CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_seo_url
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_seo_url`;

CREATE TABLE `oc_seo_url` (
  `seo_url_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`seo_url_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_seo_url` WRITE;
/*!40000 ALTER TABLE `oc_seo_url` DISABLE KEYS */;

INSERT INTO `oc_seo_url` (`seo_url_id`, `store_id`, `language_id`, `query`, `keyword`, `date_added`, `date_modified`)
VALUES
	(730,0,1,'manufacturer_id=8','apple','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(768,0,1,'product_id=42','test','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(772,0,1,'information_id=4','about_us','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(774,0,1,'category_id=18','laptop-notebook','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(775,0,1,'category_id=46','macs','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(776,0,1,'category_id=45','windows','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(777,0,1,'category_id=25','component','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(778,0,1,'category_id=29','mouse','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(779,0,1,'category_id=28','monitor','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(780,0,1,'category_id=35','test1','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(781,0,1,'category_id=36','test2','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(782,0,1,'category_id=30','printer','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(783,0,1,'category_id=31','scanner','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(784,0,1,'category_id=32','web-camera','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(785,0,1,'category_id=57','tablet','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(786,0,1,'category_id=17','software','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(787,0,1,'category_id=24','smartphone','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(788,0,1,'category_id=33','camera','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(789,0,1,'category_id=34','mp3-players','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(790,0,1,'category_id=43','test11','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(791,0,1,'category_id=44','test12','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(792,0,1,'category_id=47','test15','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(793,0,1,'category_id=48','test16','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(794,0,1,'category_id=49','test17','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(795,0,1,'category_id=50','test18','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(796,0,1,'category_id=51','test19','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(797,0,1,'category_id=52','test20','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(798,0,1,'category_id=58','test25','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(799,0,1,'category_id=53','test21','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(800,0,1,'category_id=54','test22','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(801,0,1,'category_id=55','test23','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(802,0,1,'category_id=56','test24','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(803,0,1,'category_id=38','test4','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(804,0,1,'category_id=37','test5','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(805,0,1,'category_id=39','test6','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(806,0,1,'category_id=40','test7','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(807,0,1,'category_id=41','test8','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(808,0,1,'category_id=42','test9','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(809,0,1,'product_id=30','canon-eos-5d','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(811,0,1,'product_id=28','htc-touch-hd','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(812,0,1,'product_id=43','macbook','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(813,0,1,'product_id=44','macbook-air','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(814,0,1,'product_id=45','macbook-pro','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(816,0,1,'product_id=31','nikon-d300','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(817,0,1,'product_id=29','palm-treo-pro','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(818,0,1,'product_id=35','product-8','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(819,0,1,'product_id=49','samsung-galaxy-tab-10-1','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(820,0,1,'product_id=33','samsung-syncmaster-941bw','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(821,0,1,'product_id=46','sony-vaio','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(823,0,1,'product_id=40','iphone','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(824,0,1,'product_id=48','ipod-classic','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(825,0,1,'product_id=36','ipod-nano','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(826,0,1,'product_id=34','ipod-shuffle','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(827,0,1,'product_id=32','ipod-touch','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(828,0,1,'manufacturer_id=9','canon','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(829,0,1,'manufacturer_id=5','htc','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(830,0,1,'manufacturer_id=7','hewlett-packard','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(831,0,1,'manufacturer_id=6','palm','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(832,0,1,'manufacturer_id=10','sony','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(834,0,1,'category_id=26','pc','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(835,0,1,'category_id=27','mac','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(836,0,1,'category_id=20','desktops','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(837,0,1,'product_id=41','imac','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(840,0,1,'product_id=47','hp-lp3065','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(841,0,1,'information_id=6','delivery','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(842,0,1,'information_id=3','privacy','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(843,0,1,'information_id=5','terms','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_seo_url` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_session`;

CREATE TABLE `oc_session` (
  `session_id` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `expire` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_setting`;

CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_setting` WRITE;
/*!40000 ALTER TABLE `oc_setting` DISABLE KEYS */;

INSERT INTO `oc_setting` (store_id`, `code`, `key`, `value`, `serialized`, `date_added`, `date_modified`)
VALUES
	(0,'config','config_robots','abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_shared','0',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_secure','0',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'voucher','total_voucher_sort_order','8',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'voucher','total_voucher_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_fraud_detection','0',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_meta_title','Your Store',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_meta_description','My Store',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_meta_keyword','',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	('config','config_theme','default',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_layout_id','4',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_country_id','222',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_zone_id','3563',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_language','en-gb',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_admin_language','en-gb',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_currency','USD',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_currency_auto','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_length_class_id','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_weight_class_id','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_product_count','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_limit_admin','20',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_review_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_review_guest','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_voucher_min','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_voucher_max','1000',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_tax','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_tax_default','shipping',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_tax_customer','shipping',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_customer_online','0',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_customer_activity','0',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_customer_search','0',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_customer_group_id','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_customer_group_display','[\"1\"]',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_customer_price','0',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_account_id','3',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_invoice_prefix','INV-2013-00',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_cart_weight','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_checkout_guest','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_checkout_id','5',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_order_status_id','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_processing_status','[\"5\",\"1\",\"2\",\"12\",\"3\"]',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_complete_status','[\"5\",\"3\"]',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_stock_display','0',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_stock_warning','0',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_stock_checkout','0',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_return_id','0',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_return_status_id','2',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_logo','catalog/logo.png',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_icon','catalog/cart.png',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_comment','',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_open','',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_image','',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_fax','',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_telephone','123456789',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_geocode','',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_owner','Your Name',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_address','Address 1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_name','Your Store',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_seo_url','0',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_file_max_size','300000',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_file_ext_allowed','zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_file_mime_allowed','text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_maintenance','0',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_password','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_compression','0',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_error_display','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_error_log','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_error_filename','error.log',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_google_analytics','',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_mail_alert_email','',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_mail_alert','[\"order\"]',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_captcha','basic',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_captcha_page','[\"review\",\"return\",\"contact\"]',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_login_attempts','5',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'payment_free_checkout','payment_free_checkout_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'payment_free_checkout','payment_free_checkout_order_status_id','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'payment_free_checkout','payment_free_checkout_sort_order','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'payment_cod','payment_cod_sort_order','5',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'payment_cod','payment_cod_total','0.01',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'payment_cod','payment_cod_order_status_id','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'payment_cod','payment_cod_geo_zone_id','0',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'payment_cod','payment_cod_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'shipping_flat','shipping_flat_sort_order','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'shipping_flat','shipping_flat_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'shipping_flat','shipping_flat_geo_zone_id','0',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'shipping_flat','shipping_flat_tax_class_id','9',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'shipping_flat','shipping_flat_cost','5.00',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'total_shipping','total_shipping_sort_order','3',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'total_sub_total','total_sub_total_sort_order','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'total_sub_total','total_sub_total_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'total_tax','total_tax_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'total_total','total_total_sort_order','9',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'total_total','total_total_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'total_tax','total_tax_sort_order','5',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'total_credit','total_credit_sort_order','7',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'total_credit','total_credit_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'total_shipping','total_shipping_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'total_shipping','total_shipping_estimator','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'total_coupon','total_coupon_sort_order','4',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'total_coupon','total_coupon_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'module_category','module_category_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'module_account','module_account_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_product_limit','15',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_product_description_length','100',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_thumb_width','228',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_thumb_height','228',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_popup_width','500',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_popup_height','500',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_category_width','80',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_category_height','80',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_product_width','228',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_product_height','228',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_additional_width','74',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_additional_height','74',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_related_width','200',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_related_height','200',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_compare_width','90',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_compare_height','90',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_wishlist_width','47',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_wishlist_height','47',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_cart_height','47',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_cart_width','47',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_location_height','50',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_image_location_width','268',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_directory','default',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'theme_default','theme_default_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_activity','dashboard_activity_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_activity','dashboard_activity_sort_order','7',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_sale','dashboard_sale_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_sale','dashboard_sale_width','3',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_chart','dashboard_chart_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_chart','dashboard_chart_width','6',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_customer','dashboard_customer_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_customer','dashboard_customer_width','3',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_map','dashboard_map_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_map','dashboard_map_width','6',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_online','dashboard_online_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_online','dashboard_online_width','3',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_order','dashboard_order_sort_order','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_order','dashboard_order_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_order','dashboard_order_width','3',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_sale','dashboard_sale_sort_order','2',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_customer','dashboard_customer_sort_order','3',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_online','dashboard_online_sort_order','4',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_map','dashboard_map_sort_order','5',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_chart','dashboard_chart_sort_order','6',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_recent','dashboard_recent_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_recent','dashboard_recent_sort_order','8',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_activity','dashboard_activity_width','4',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'dashboard_recent','dashboard_recent_width','8',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_customer_activity','report_customer_activity_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_customer_activity','report_customer_activity_sort_order','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_customer_order','report_customer_order_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_customer_order','report_customer_order_sort_order','2',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_customer_search','report_customer_search_sort_order','3',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_customer_search','report_customer_search_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_customer_transaction','report_customer_transaction_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_customer_transaction','report_customer_transaction_status_sort_order','4',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_sale_tax','report_sale_tax_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_sale_tax','report_sale_tax_sort_order','5',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_sale_shipping','report_sale_shipping_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_sale_shipping','report_sale_shipping_sort_order','6',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_sale_return','report_sale_return_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_sale_return','report_sale_return_sort_order','7',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_sale_order','report_sale_order_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_sale_order','report_sale_order_sort_order','8',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_sale_coupon','report_sale_coupon_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_sale_coupon','report_sale_coupon_sort_order','9',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_product_viewed','report_product_viewed_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_product_viewed','report_product_viewed_sort_order','10',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_product_purchased','report_product_purchased_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_product_purchased','report_product_purchased_sort_order','11',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_marketing','report_marketing_status','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'report_marketing','report_marketing_sort_order','12',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'developer','developer_theme','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'developer','developer_sass','1',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(0,'config','config_email','lucasjkr@me.com',0,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_setting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_shipping_courier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_shipping_courier`;

CREATE TABLE `oc_shipping_courier` (
  `shipping_courier_id` int(11) NOT NULL,
  `shipping_courier_code` varchar(255) NOT NULL DEFAULT '',
  `shipping_courier_name` varchar(255) NOT NULL DEFAULT '',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shipping_courier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_shipping_courier` WRITE;
/*!40000 ALTER TABLE `oc_shipping_courier` DISABLE KEYS */;

INSERT INTO `oc_shipping_courier` (`shipping_courier_id`, `shipping_courier_code`, `shipping_courier_name`, `date_added`, `date_modified`)
VALUES
	(1,'dhl','DHL','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2,'fedex','Fedex','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3,'ups','UPS','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4,'royal-mail','Royal Mail','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(5,'usps','United States Postal Service','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(6,'auspost','Australia Post','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(7,'citylink','Citylink','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_shipping_courier` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_statistics
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_statistics`;

CREATE TABLE `oc_statistics` (
  `statistics_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`statistics_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_statistics` WRITE;
/*!40000 ALTER TABLE `oc_statistics` DISABLE KEYS */;

INSERT INTO `oc_statistics` (`statistics_id`, `code`, `value`, `date_added`, `date_modified`)
VALUES
	(1,'order_sale',0.0000,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2,'order_processing',0.0000,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3,'order_complete',0.0000,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4,'order_other',0.0000,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(5,'returns',0.0000,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(6,'product',0.0000,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(7,'review',0.0000,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_statistics` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_stock_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_stock_status`;

CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_stock_status` WRITE;
/*!40000 ALTER TABLE `oc_stock_status` DISABLE KEYS */;

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`, `date_added`, `date_modified`)
VALUES
	(5,1,'Out Of Stock','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(6,1,'2-3 Days','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(7,1,'In Stock','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(8,1,'Pre-Order','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_stock_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_store`;

CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_tax_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_tax_class`;

CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_tax_class` WRITE;
/*!40000 ALTER TABLE `oc_tax_class` DISABLE KEYS */;

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`)
VALUES
	(9,'Taxable Goods','Taxed goods','2009-01-06 23:21:53','2011-09-23 14:07:50'),
	(10,'Downloadable Products','Downloadable','2011-09-21 22:19:39','2011-09-22 10:27:36');

/*!40000 ALTER TABLE `oc_tax_class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_tax_rate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_tax_rate`;

CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_tax_rate` WRITE;
/*!40000 ALTER TABLE `oc_tax_rate` DISABLE KEYS */;

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`)
VALUES
	(86,3,'VAT (20%)',20.0000,'P','2011-03-09 21:17:10','2011-09-22 22:24:29'),
	(87,3,'Eco Tax (-2.00)',2.0000,'F','2011-09-21 21:49:23','2011-09-23 00:40:19');

/*!40000 ALTER TABLE `oc_tax_rate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_tax_rate_to_customer_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;

CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_tax_rate_to_customer_group` WRITE;
/*!40000 ALTER TABLE `oc_tax_rate_to_customer_group` DISABLE KEYS */;

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`, `date_added`, `date_modified`)
VALUES
	(86,1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(87,1,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_tax_rate_to_customer_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_tax_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_tax_rule`;

CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_tax_rule` WRITE;
/*!40000 ALTER TABLE `oc_tax_rule` DISABLE KEYS */;

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`, `date_added`, `date_modified`)
VALUES
	(120,10,87,'store',0,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(121,10,86,'payment',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(127,9,87,'shipping',2,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(128,9,86,'shipping',1,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_tax_rule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_theme
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_theme`;

CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` mediumtext NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_translation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_translation`;

CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`translation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_upload
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_upload`;

CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_user`;

CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_user_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_user_group`;

CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_user_group` WRITE;
/*!40000 ALTER TABLE `oc_user_group` DISABLE KEYS */;

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`, `date_added`, `date_modified`)
VALUES
	(1,'Administrator','{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/theme\",\"design\\/translation\",\"design\\/seo_url\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/marketing\\/remarketing\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/payment\\/pp_braintree\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/cron\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/openbay\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/theme\",\"design\\/translation\",\"design\\/seo_url\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/marketing\\/remarketing\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/payment\\/pp_braintree\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/event\",\"marketplace\\/cron\",\"marketplace\\/api\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/openbay\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"]}','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(10,'Demonstration','','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_user_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_voucher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_voucher`;

CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_voucher_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_voucher_history`;

CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oc_voucher_theme
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_voucher_theme`;

CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_voucher_theme` WRITE;
/*!40000 ALTER TABLE `oc_voucher_theme` DISABLE KEYS */;

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`, `date_added`, `date_modified`)
VALUES
	(6,'catalog/demo/apple_logo.jpg','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(7,'catalog/demo/gift-voucher-birthday.jpg','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(8,'catalog/demo/canon_eos_5d_2.jpg','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_voucher_theme` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_voucher_theme_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_voucher_theme_description`;

CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_voucher_theme_description` WRITE;
/*!40000 ALTER TABLE `oc_voucher_theme_description` DISABLE KEYS */;

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`, `date_added`, `date_modified`)
VALUES
	(6,1,'Christmas','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(7,1,'Birthday','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(8,1,'General','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_voucher_theme_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_weight_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_weight_class`;

CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`weight_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_weight_class` WRITE;
/*!40000 ALTER TABLE `oc_weight_class` DISABLE KEYS */;

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`, `date_added`, `date_modified`)
VALUES
	(1,1.00000000,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2,1000.00000000,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(5,2.20460000,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(6,35.27400000,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_weight_class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_weight_class_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_weight_class_description`;

CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_weight_class_description` WRITE;
/*!40000 ALTER TABLE `oc_weight_class_description` DISABLE KEYS */;

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`, `date_added`, `date_modified`)
VALUES
	(1,1,'Kilogram','kg','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2,1,'Gram','g','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(5,1,'Pound ','lb','2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(6,1,'Ounce','oz','2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_weight_class_description` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_zone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_zone`;

CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_zone` WRITE;
/*!40000 ALTER TABLE `oc_zone` DISABLE KEYS */;

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`, `date_added`, `date_modified`)
VALUES
	(1,1,'Badakhshan','BDS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2,1,'Badghis','BDG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3,1,'Baghlan','BGL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4,1,'Balkh','BAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(5,1,'Bamian','BAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(6,1,'Farah','FRA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(7,1,'Faryab','FYB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(8,1,'Ghazni','GHA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(9,1,'Ghowr','GHO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(10,1,'Helmand','HEL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(11,1,'Herat','HER',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(12,1,'Jowzjan','JOW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(13,1,'Kabul','KAB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(14,1,'Kandahar','KAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(15,1,'Kapisa','KAP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(16,1,'Khost','KHO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(17,1,'Konar','KNR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(18,1,'Kondoz','KDZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(19,1,'Laghman','LAG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(20,1,'Lowgar','LOW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(21,1,'Nangrahar','NAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(22,1,'Nimruz','NIM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(23,1,'Nurestan','NUR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(24,1,'Oruzgan','ORU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(25,1,'Paktia','PIA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(26,1,'Paktika','PKA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(27,1,'Parwan','PAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(28,1,'Samangan','SAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(29,1,'Sar-e Pol','SAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(30,1,'Takhar','TAK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(31,1,'Wardak','WAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(32,1,'Zabol','ZAB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(33,2,'Berat','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(34,2,'Bulqize','BU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(35,2,'Delvine','DL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(36,2,'Devoll','DV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(37,2,'Diber','DI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(38,2,'Durres','DR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(39,2,'Elbasan','EL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(40,2,'Kolonje','ER',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(41,2,'Fier','FR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(42,2,'Gjirokaster','GJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(43,2,'Gramsh','GR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(44,2,'Has','HA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(45,2,'Kavaje','KA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(46,2,'Kurbin','KB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(47,2,'Kucove','KC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(48,2,'Korce','KO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(49,2,'Kruje','KR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(50,2,'Kukes','KU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(51,2,'Librazhd','LB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(52,2,'Lezhe','LE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(53,2,'Lushnje','LU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(54,2,'Malesi e Madhe','MM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(55,2,'Mallakaster','MK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(56,2,'Mat','MT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(57,2,'Mirdite','MR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(58,2,'Peqin','PQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(59,2,'Permet','PR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(60,2,'Pogradec','PG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(61,2,'Puke','PU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(62,2,'Shkoder','SH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(63,2,'Skrapar','SK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(64,2,'Sarande','SR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(65,2,'Tepelene','TE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(66,2,'Tropoje','TP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(67,2,'Tirane','TR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(68,2,'Vlore','VL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(69,3,'Adrar','ADR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(70,3,'Ain Defla','ADE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(71,3,'Ain Temouchent','ATE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(72,3,'Alger','ALG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(73,3,'Annaba','ANN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(74,3,'Batna','BAT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(75,3,'Bechar','BEC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(76,3,'Bejaia','BEJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(77,3,'Biskra','BIS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(78,3,'Blida','BLI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(79,3,'Bordj Bou Arreridj','BBA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(80,3,'Bouira','BOA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(81,3,'Boumerdes','BMD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(82,3,'Chlef','CHL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(83,3,'Constantine','CON',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(84,3,'Djelfa','DJE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(85,3,'El Bayadh','EBA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(86,3,'El Oued','EOU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(87,3,'El Tarf','ETA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(88,3,'Ghardaia','GHA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(89,3,'Guelma','GUE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(90,3,'Illizi','ILL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(91,3,'Jijel','JIJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(92,3,'Khenchela','KHE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(93,3,'Laghouat','LAG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(94,3,'Muaskar','MUA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(95,3,'Medea','MED',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(96,3,'Mila','MIL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(97,3,'Mostaganem','MOS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(98,3,'M\'Sila','MSI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(99,3,'Naama','NAA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(100,3,'Oran','ORA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(101,3,'Ouargla','OUA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(102,3,'Oum el-Bouaghi','OEB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(103,3,'Relizane','REL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(104,3,'Saida','SAI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(105,3,'Setif','SET',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(106,3,'Sidi Bel Abbes','SBA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(107,3,'Skikda','SKI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(108,3,'Souk Ahras','SAH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(109,3,'Tamanghasset','TAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(110,3,'Tebessa','TEB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(111,3,'Tiaret','TIA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(112,3,'Tindouf','TIN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(113,3,'Tipaza','TIP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(114,3,'Tissemsilt','TIS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(115,3,'Tizi Ouzou','TOU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(116,3,'Tlemcen','TLE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(117,4,'Eastern','E',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(118,4,'Manu\'a','M',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(119,4,'Rose Island','R',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(120,4,'Swains Island','S',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(121,4,'Western','W',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(122,5,'Andorra la Vella','ALV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(123,5,'Canillo','CAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(124,5,'Encamp','ENC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(125,5,'Escaldes-Engordany','ESE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(126,5,'La Massana','LMA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(127,5,'Ordino','ORD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(128,5,'Sant Julia de Loria','SJL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(129,6,'Bengo','BGO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(130,6,'Benguela','BGU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(131,6,'Bie','BIE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(132,6,'Cabinda','CAB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(133,6,'Cuando-Cubango','CCU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(134,6,'Cuanza Norte','CNO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(135,6,'Cuanza Sul','CUS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(136,6,'Cunene','CNN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(137,6,'Huambo','HUA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(138,6,'Huila','HUI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(139,6,'Luanda','LUA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(140,6,'Lunda Norte','LNO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(141,6,'Lunda Sul','LSU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(142,6,'Malange','MAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(143,6,'Moxico','MOX',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(144,6,'Namibe','NAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(145,6,'Uige','UIG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(146,6,'Zaire','ZAI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(147,9,'Saint George','ASG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(148,9,'Saint John','ASJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(149,9,'Saint Mary','ASM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(150,9,'Saint Paul','ASL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(151,9,'Saint Peter','ASR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(152,9,'Saint Philip','ASH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(153,9,'Barbuda','BAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(154,9,'Redonda','RED',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(155,10,'Antartida e Islas del Atlantico','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(156,10,'Buenos Aires','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(157,10,'Catamarca','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(158,10,'Chaco','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(159,10,'Chubut','CU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(160,10,'Cordoba','CO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(161,10,'Corrientes','CR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(162,10,'Distrito Federal','DF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(163,10,'Entre Rios','ER',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(164,10,'Formosa','FO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(165,10,'Jujuy','JU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(166,10,'La Pampa','LP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(167,10,'La Rioja','LR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(168,10,'Mendoza','ME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(169,10,'Misiones','MI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(170,10,'Neuquen','NE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(171,10,'Rio Negro','RN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(172,10,'Salta','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(173,10,'San Juan','SJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(174,10,'San Luis','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(175,10,'Santa Cruz','SC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(176,10,'Santa Fe','SF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(177,10,'Santiago del Estero','SD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(178,10,'Tierra del Fuego','TF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(179,10,'Tucuman','TU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(180,11,'Aragatsotn','AGT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(181,11,'Ararat','ARR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(182,11,'Armavir','ARM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(183,11,'Geghark\'unik\'','GEG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(184,11,'Kotayk\'','KOT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(185,11,'Lorri','LOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(186,11,'Shirak','SHI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(187,11,'Syunik\'','SYU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(188,11,'Tavush','TAV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(189,11,'Vayots\' Dzor','VAY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(190,11,'Yerevan','YER',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(191,13,'Australian Capital Territory','ACT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(192,13,'New South Wales','NSW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(193,13,'Northern Territory','NT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(194,13,'Queensland','QLD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(195,13,'South Australia','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(196,13,'Tasmania','TAS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(197,13,'Victoria','VIC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(198,13,'Western Australia','WA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(199,14,'Burgenland','BUR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(200,14,'Kärnten','KAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(201,14,'Niederösterreich','NOS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(202,14,'Oberösterreich','OOS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(203,14,'Salzburg','SAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(204,14,'Steiermark','STE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(205,14,'Tirol','TIR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(206,14,'Vorarlberg','VOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(207,14,'Wien','WIE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(208,15,'Ali Bayramli','AB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(209,15,'Abseron','ABS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(210,15,'AgcabAdi','AGC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(211,15,'Agdam','AGM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(212,15,'Agdas','AGS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(213,15,'Agstafa','AGA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(214,15,'Agsu','AGU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(215,15,'Astara','AST',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(216,15,'Baki','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(217,15,'BabAk','BAB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(218,15,'BalakAn','BAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(219,15,'BArdA','BAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(220,15,'Beylaqan','BEY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(221,15,'Bilasuvar','BIL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(222,15,'Cabrayil','CAB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(223,15,'Calilabab','CAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(224,15,'Culfa','CUL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(225,15,'Daskasan','DAS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(226,15,'Davaci','DAV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(227,15,'Fuzuli','FUZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(228,15,'Ganca','GA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(229,15,'Gadabay','GAD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(230,15,'Goranboy','GOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(231,15,'Goycay','GOY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(232,15,'Haciqabul','HAC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(233,15,'Imisli','IMI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(234,15,'Ismayilli','ISM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(235,15,'Kalbacar','KAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(236,15,'Kurdamir','KUR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(237,15,'Lankaran','LA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(238,15,'Lacin','LAC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(239,15,'Lankaran','LAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(240,15,'Lerik','LER',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(241,15,'Masalli','MAS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(242,15,'Mingacevir','MI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(243,15,'Naftalan','NA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(244,15,'Neftcala','NEF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(245,15,'Oguz','OGU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(246,15,'Ordubad','ORD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(247,15,'Qabala','QAB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(248,15,'Qax','QAX',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(249,15,'Qazax','QAZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(250,15,'Qobustan','QOB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(251,15,'Quba','QBA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(252,15,'Qubadli','QBI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(253,15,'Qusar','QUS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(254,15,'Saki','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(255,15,'Saatli','SAT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(256,15,'Sabirabad','SAB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(257,15,'Sadarak','SAD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(258,15,'Sahbuz','SAH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(259,15,'Saki','SAK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(260,15,'Salyan','SAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(261,15,'Sumqayit','SM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(262,15,'Samaxi','SMI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(263,15,'Samkir','SKR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(264,15,'Samux','SMX',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(265,15,'Sarur','SAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(266,15,'Siyazan','SIY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(267,15,'Susa','SS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(268,15,'Susa','SUS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(269,15,'Tartar','TAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(270,15,'Tovuz','TOV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(271,15,'Ucar','UCA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(272,15,'Xankandi','XA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(273,15,'Xacmaz','XAC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(274,15,'Xanlar','XAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(275,15,'Xizi','XIZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(276,15,'Xocali','XCI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(277,15,'Xocavand','XVD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(278,15,'Yardimli','YAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(279,15,'Yevlax','YEV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(280,15,'Zangilan','ZAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(281,15,'Zaqatala','ZAQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(282,15,'Zardab','ZAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(283,15,'Naxcivan','NX',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(284,16,'Acklins','ACK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(285,16,'Berry Islands','BER',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(286,16,'Bimini','BIM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(287,16,'Black Point','BLK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(288,16,'Cat Island','CAT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(289,16,'Central Abaco','CAB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(290,16,'Central Andros','CAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(291,16,'Central Eleuthera','CEL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(292,16,'City of Freeport','FRE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(293,16,'Crooked Island','CRO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(294,16,'East Grand Bahama','EGB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(295,16,'Exuma','EXU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(296,16,'Grand Cay','GRD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(297,16,'Harbour Island','HAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(298,16,'Hope Town','HOP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(299,16,'Inagua','INA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(300,16,'Long Island','LNG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(301,16,'Mangrove Cay','MAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(302,16,'Mayaguana','MAY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(303,16,'Moore\'s Island','MOO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(304,16,'North Abaco','NAB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(305,16,'North Andros','NAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(306,16,'North Eleuthera','NEL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(307,16,'Ragged Island','RAG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(308,16,'Rum Cay','RUM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(309,16,'San Salvador','SAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(310,16,'South Abaco','SAB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(311,16,'South Andros','SAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(312,16,'South Eleuthera','SEL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(313,16,'Spanish Wells','SWE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(314,16,'West Grand Bahama','WGB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(315,17,'Capital','CAP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(316,17,'Central','CEN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(317,17,'Muharraq','MUH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(318,17,'Northern','NOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(319,17,'Southern','SOU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(320,18,'Barisal','BAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(321,18,'Chittagong','CHI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(322,18,'Dhaka','DHA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(323,18,'Khulna','KHU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(324,18,'Rajshahi','RAJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(325,18,'Sylhet','SYL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(326,19,'Christ Church','CC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(327,19,'Saint Andrew','AND',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(328,19,'Saint George','GEO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(329,19,'Saint James','JAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(330,19,'Saint John','JOH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(331,19,'Saint Joseph','JOS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(332,19,'Saint Lucy','LUC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(333,19,'Saint Michael','MIC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(334,19,'Saint Peter','PET',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(335,19,'Saint Philip','PHI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(336,19,'Saint Thomas','THO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(337,20,'Brestskaya (Brest)','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(338,20,'Homyel\'skaya (Homyel\')','HO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(339,20,'Horad Minsk','HM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(340,20,'Hrodzyenskaya (Hrodna)','HR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(341,20,'Mahilyowskaya (Mahilyow)','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(342,20,'Minskaya','MI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(343,20,'Vitsyebskaya (Vitsyebsk)','VI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(344,21,'Antwerpen','VAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(345,21,'Brabant Wallon','WBR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(346,21,'Hainaut','WHT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(347,21,'Liège','WLG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(348,21,'Limburg','VLI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(349,21,'Luxembourg','WLX',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(350,21,'Namur','WNA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(351,21,'Oost-Vlaanderen','VOV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(352,21,'Vlaams Brabant','VBR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(353,21,'West-Vlaanderen','VWV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(354,22,'Belize','BZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(355,22,'Cayo','CY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(356,22,'Corozal','CR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(357,22,'Orange Walk','OW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(358,22,'Stann Creek','SC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(359,22,'Toledo','TO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(360,23,'Alibori','AL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(361,23,'Atakora','AK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(362,23,'Atlantique','AQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(363,23,'Borgou','BO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(364,23,'Collines','CO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(365,23,'Donga','DO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(366,23,'Kouffo','KO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(367,23,'Littoral','LI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(368,23,'Mono','MO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(369,23,'Oueme','OU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(370,23,'Plateau','PL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(371,23,'Zou','ZO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(372,24,'Devonshire','DS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(373,24,'Hamilton City','HC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(374,24,'Hamilton','HA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(375,24,'Paget','PG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(376,24,'Pembroke','PB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(377,24,'Saint George City','GC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(378,24,'Saint George\'s','SG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(379,24,'Sandys','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(380,24,'Smith\'s','SM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(381,24,'Southampton','SH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(382,24,'Warwick','WA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(383,25,'Bumthang','BUM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(384,25,'Chukha','CHU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(385,25,'Dagana','DAG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(386,25,'Gasa','GAS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(387,25,'Haa','HAA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(388,25,'Lhuntse','LHU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(389,25,'Mongar','MON',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(390,25,'Paro','PAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(391,25,'Pemagatshel','PEM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(392,25,'Punakha','PUN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(393,25,'Samdrup Jongkhar','SJO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(394,25,'Samtse','SAT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(395,25,'Sarpang','SAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(396,25,'Thimphu','THI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(397,25,'Trashigang','TRG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(398,25,'Trashiyangste','TRY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(399,25,'Trongsa','TRO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(400,25,'Tsirang','TSI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(401,25,'Wangdue Phodrang','WPH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(402,25,'Zhemgang','ZHE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(403,26,'Beni','BEN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(404,26,'Chuquisaca','CHU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(405,26,'Cochabamba','COC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(406,26,'La Paz','LPZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(407,26,'Oruro','ORU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(408,26,'Pando','PAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(409,26,'Potosi','POT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(410,26,'Santa Cruz','SCZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(411,26,'Tarija','TAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(412,27,'Brcko district','BRO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(413,27,'Unsko-Sanski Kanton','FUS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(414,27,'Posavski Kanton','FPO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(415,27,'Tuzlanski Kanton','FTU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(416,27,'Zenicko-Dobojski Kanton','FZE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(417,27,'Bosanskopodrinjski Kanton','FBP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(418,27,'Srednjebosanski Kanton','FSB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(419,27,'Hercegovacko-neretvanski Kanton','FHN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(420,27,'Zapadnohercegovacka Zupanija','FZH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(421,27,'Kanton Sarajevo','FSA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(422,27,'Zapadnobosanska','FZA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(423,27,'Banja Luka','SBL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(424,27,'Doboj','SDO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(425,27,'Bijeljina','SBI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(426,27,'Vlasenica','SVL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(427,27,'Sarajevo-Romanija or Sokolac','SSR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(428,27,'Foca','SFO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(429,27,'Trebinje','STR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(430,28,'Central','CE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(431,28,'Ghanzi','GH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(432,28,'Kgalagadi','KD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(433,28,'Kgatleng','KT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(434,28,'Kweneng','KW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(435,28,'Ngamiland','NG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(436,28,'North East','NE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(437,28,'North West','NW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(438,28,'South East','SE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(439,28,'Southern','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(440,30,'Acre','AC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(441,30,'Alagoas','AL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(442,30,'Amapá','AP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(443,30,'Amazonas','AM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(444,30,'Bahia','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(445,30,'Ceará','CE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(446,30,'Distrito Federal','DF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(447,30,'Espírito Santo','ES',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(448,30,'Goiás','GO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(449,30,'Maranhão','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(450,30,'Mato Grosso','MT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(451,30,'Mato Grosso do Sul','MS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(452,30,'Minas Gerais','MG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(453,30,'Pará','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(454,30,'Paraíba','PB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(455,30,'Paraná','PR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(456,30,'Pernambuco','PE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(457,30,'Piauí','PI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(458,30,'Rio de Janeiro','RJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(459,30,'Rio Grande do Norte','RN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(460,30,'Rio Grande do Sul','RS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(461,30,'Rondônia','RO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(462,30,'Roraima','RR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(463,30,'Santa Catarina','SC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(464,30,'São Paulo','SP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(465,30,'Sergipe','SE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(466,30,'Tocantins','TO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(467,31,'Peros Banhos','PB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(468,31,'Salomon Islands','SI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(469,31,'Nelsons Island','NI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(470,31,'Three Brothers','TB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(471,31,'Eagle Islands','EA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(472,31,'Danger Island','DI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(473,31,'Egmont Islands','EG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(474,31,'Diego Garcia','DG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(475,32,'Belait','BEL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(476,32,'Brunei and Muara','BRM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(477,32,'Temburong','TEM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(478,32,'Tutong','TUT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(479,33,'Blagoevgrad','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(480,33,'Burgas','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(481,33,'Dobrich','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(482,33,'Gabrovo','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(483,33,'Haskovo','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(484,33,'Kardjali','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(485,33,'Kyustendil','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(486,33,'Lovech','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(487,33,'Montana','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(488,33,'Pazardjik','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(489,33,'Pernik','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(490,33,'Pleven','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(491,33,'Plovdiv','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(492,33,'Razgrad','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(493,33,'Shumen','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(494,33,'Silistra','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(495,33,'Sliven','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(496,33,'Smolyan','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(497,33,'Sofia','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(498,33,'Sofia - town','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(499,33,'Stara Zagora','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(500,33,'Targovishte','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(501,33,'Varna','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(502,33,'Veliko Tarnovo','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(503,33,'Vidin','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(504,33,'Vratza','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(505,33,'Yambol','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(506,34,'Bale','BAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(507,34,'Bam','BAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(508,34,'Banwa','BAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(509,34,'Bazega','BAZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(510,34,'Bougouriba','BOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(511,34,'Boulgou','BLG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(512,34,'Boulkiemde','BOK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(513,34,'Comoe','COM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(514,34,'Ganzourgou','GAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(515,34,'Gnagna','GNA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(516,34,'Gourma','GOU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(517,34,'Houet','HOU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(518,34,'Ioba','IOA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(519,34,'Kadiogo','KAD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(520,34,'Kenedougou','KEN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(521,34,'Komondjari','KOD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(522,34,'Kompienga','KOP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(523,34,'Kossi','KOS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(524,34,'Koulpelogo','KOL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(525,34,'Kouritenga','KOT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(526,34,'Kourweogo','KOW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(527,34,'Leraba','LER',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(528,34,'Loroum','LOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(529,34,'Mouhoun','MOU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(530,34,'Nahouri','NAH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(531,34,'Namentenga','NAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(532,34,'Nayala','NAY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(533,34,'Noumbiel','NOU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(534,34,'Oubritenga','OUB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(535,34,'Oudalan','OUD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(536,34,'Passore','PAS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(537,34,'Poni','PON',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(538,34,'Sanguie','SAG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(539,34,'Sanmatenga','SAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(540,34,'Seno','SEN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(541,34,'Sissili','SIS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(542,34,'Soum','SOM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(543,34,'Sourou','SOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(544,34,'Tapoa','TAP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(545,34,'Tuy','TUY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(546,34,'Yagha','YAG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(547,34,'Yatenga','YAT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(548,34,'Ziro','ZIR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(549,34,'Zondoma','ZOD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(550,34,'Zoundweogo','ZOW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(551,35,'Bubanza','BB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(552,35,'Bujumbura','BJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(553,35,'Bururi','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(554,35,'Cankuzo','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(555,35,'Cibitoke','CI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(556,35,'Gitega','GI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(557,35,'Karuzi','KR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(558,35,'Kayanza','KY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(559,35,'Kirundo','KI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(560,35,'Makamba','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(561,35,'Muramvya','MU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(562,35,'Muyinga','MY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(563,35,'Mwaro','MW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(564,35,'Ngozi','NG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(565,35,'Rutana','RT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(566,35,'Ruyigi','RY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(567,36,'Phnom Penh','PP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(568,36,'Preah Seihanu (Kompong Som or Sihanoukville)','PS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(569,36,'Pailin','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(570,36,'Keb','KB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(571,36,'Banteay Meanchey','BM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(572,36,'Battambang','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(573,36,'Kampong Cham','KM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(574,36,'Kampong Chhnang','KN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(575,36,'Kampong Speu','KU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(576,36,'Kampong Som','KO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(577,36,'Kampong Thom','KT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(578,36,'Kampot','KP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(579,36,'Kandal','KL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(580,36,'Kaoh Kong','KK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(581,36,'Kratie','KR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(582,36,'Mondul Kiri','MK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(583,36,'Oddar Meancheay','OM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(584,36,'Pursat','PU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(585,36,'Preah Vihear','PR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(586,36,'Prey Veng','PG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(587,36,'Ratanak Kiri','RK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(588,36,'Siemreap','SI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(589,36,'Stung Treng','ST',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(590,36,'Svay Rieng','SR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(591,36,'Takeo','TK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(592,37,'Adamawa (Adamaoua)','ADA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(593,37,'Centre','CEN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(594,37,'East (Est)','EST',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(595,37,'Extreme North (Extreme-Nord)','EXN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(596,37,'Littoral','LIT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(597,37,'North (Nord)','NOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(598,37,'Northwest (Nord-Ouest)','NOT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(599,37,'West (Ouest)','OUE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(600,37,'South (Sud)','SUD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(601,37,'Southwest (Sud-Ouest).','SOU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(602,38,'Alberta','AB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(603,38,'British Columbia','BC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(604,38,'Manitoba','MB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(605,38,'New Brunswick','NB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(606,38,'Newfoundland and Labrador','NL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(607,38,'Northwest Territories','NT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(608,38,'Nova Scotia','NS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(609,38,'Nunavut','NU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(610,38,'Ontario','ON',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(611,38,'Prince Edward Island','PE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(612,38,'Qu&eacute;bec','QC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(613,38,'Saskatchewan','SK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(614,38,'Yukon Territory','YT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(615,39,'Boa Vista','BV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(616,39,'Brava','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(617,39,'Calheta de Sao Miguel','CS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(618,39,'Maio','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(619,39,'Mosteiros','MO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(620,39,'Paul','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(621,39,'Porto Novo','PN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(622,39,'Praia','PR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(623,39,'Ribeira Grande','RG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(624,39,'Sal','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(625,39,'Santa Catarina','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(626,39,'Santa Cruz','CR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(627,39,'Sao Domingos','SD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(628,39,'Sao Filipe','SF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(629,39,'Sao Nicolau','SN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(630,39,'Sao Vicente','SV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(631,39,'Tarrafal','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(632,40,'Creek','CR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(633,40,'Eastern','EA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(634,40,'Midland','ML',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(635,40,'South Town','ST',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(636,40,'Spot Bay','SP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(637,40,'Stake Bay','SK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(638,40,'West End','WD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(639,40,'Western','WN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(640,41,'Bamingui-Bangoran','BBA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(641,41,'Basse-Kotto','BKO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(642,41,'Haute-Kotto','HKO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(643,41,'Haut-Mbomou','HMB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(644,41,'Kemo','KEM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(645,41,'Lobaye','LOB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(646,41,'Mambere-KadeÔ','MKD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(647,41,'Mbomou','MBO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(648,41,'Nana-Mambere','NMM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(649,41,'Ombella-M\'Poko','OMP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(650,41,'Ouaka','OUK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(651,41,'Ouham','OUH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(652,41,'Ouham-Pende','OPE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(653,41,'Vakaga','VAK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(654,41,'Nana-Grebizi','NGR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(655,41,'Sangha-Mbaere','SMB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(656,41,'Bangui','BAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(657,42,'Batha','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(658,42,'Biltine','BI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(659,42,'Borkou-Ennedi-Tibesti','BE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(660,42,'Chari-Baguirmi','CB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(661,42,'Guera','GU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(662,42,'Kanem','KA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(663,42,'Lac','LA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(664,42,'Logone Occidental','LC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(665,42,'Logone Oriental','LR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(666,42,'Mayo-Kebbi','MK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(667,42,'Moyen-Chari','MC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(668,42,'Ouaddai','OU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(669,42,'Salamat','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(670,42,'Tandjile','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(671,43,'Aisen del General Carlos Ibanez','AI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(672,43,'Antofagasta','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(673,43,'Araucania','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(674,43,'Atacama','AT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(675,43,'Bio-Bio','BI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(676,43,'Coquimbo','CO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(677,43,'Libertador General Bernardo O\'Higgins','LI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(678,43,'Los Lagos','LL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(679,43,'Magallanes y de la Antartica Chilena','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(680,43,'Maule','ML',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(681,43,'Region Metropolitana','RM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(682,43,'Tarapaca','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(683,43,'Valparaiso','VS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(684,44,'Anhui','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(685,44,'Beijing','BE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(686,44,'Chongqing','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(687,44,'Fujian','FU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(688,44,'Gansu','GA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(689,44,'Guangdong','GU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(690,44,'Guangxi','GX',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(691,44,'Guizhou','GZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(692,44,'Hainan','HA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(693,44,'Hebei','HB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(694,44,'Heilongjiang','HL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(695,44,'Henan','HE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(696,44,'Hong Kong','HK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(697,44,'Hubei','HU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(698,44,'Hunan','HN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(699,44,'Inner Mongolia','IM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(700,44,'Jiangsu','JI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(701,44,'Jiangxi','JX',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(702,44,'Jilin','JL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(703,44,'Liaoning','LI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(704,44,'Macau','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(705,44,'Ningxia','NI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(706,44,'Shaanxi','SH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(707,44,'Shandong','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(708,44,'Shanghai','SG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(709,44,'Shanxi','SX',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(710,44,'Sichuan','SI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(711,44,'Tianjin','TI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(712,44,'Xinjiang','XI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(713,44,'Yunnan','YU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(714,44,'Zhejiang','ZH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(715,46,'Direction Island','D',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(716,46,'Home Island','H',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(717,46,'Horsburgh Island','O',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(718,46,'South Island','S',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(719,46,'West Island','W',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(720,47,'Amazonas','AMZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(721,47,'Antioquia','ANT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(722,47,'Arauca','ARA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(723,47,'Atlantico','ATL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(724,47,'Bogota D.C.','BDC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(725,47,'Bolivar','BOL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(726,47,'Boyaca','BOY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(727,47,'Caldas','CAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(728,47,'Caqueta','CAQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(729,47,'Casanare','CAS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(730,47,'Cauca','CAU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(731,47,'Cesar','CES',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(732,47,'Choco','CHO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(733,47,'Cordoba','COR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(734,47,'Cundinamarca','CAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(735,47,'Guainia','GNA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(736,47,'Guajira','GJR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(737,47,'Guaviare','GVR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(738,47,'Huila','HUI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(739,47,'Magdalena','MAG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(740,47,'Meta','MET',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(741,47,'Narino','NAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(742,47,'Norte de Santander','NDS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(743,47,'Putumayo','PUT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(744,47,'Quindio','QUI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(745,47,'Risaralda','RIS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(746,47,'San Andres y Providencia','SAP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(747,47,'Santander','SAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(748,47,'Sucre','SUC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(749,47,'Tolima','TOL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(750,47,'Valle del Cauca','VDC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(751,47,'Vaupes','VAU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(752,47,'Vichada','VIC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(753,48,'Grande Comore','G',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(754,48,'Anjouan','A',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(755,48,'Moheli','M',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(756,49,'Bouenza','BO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(757,49,'Brazzaville','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(758,49,'Cuvette','CU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(759,49,'Cuvette-Ouest','CO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(760,49,'Kouilou','KO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(761,49,'Lekoumou','LE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(762,49,'Likouala','LI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(763,49,'Niari','NI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(764,49,'Plateaux','PL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(765,49,'Pool','PO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(766,49,'Sangha','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(767,50,'Pukapuka','PU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(768,50,'Rakahanga','RK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(769,50,'Manihiki','MK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(770,50,'Penrhyn','PE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(771,50,'Nassau Island','NI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(772,50,'Surwarrow','SU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(773,50,'Palmerston','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(774,50,'Aitutaki','AI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(775,50,'Manuae','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(776,50,'Takutea','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(777,50,'Mitiaro','MT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(778,50,'Atiu','AT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(779,50,'Mauke','MU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(780,50,'Rarotonga','RR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(781,50,'Mangaia','MG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(782,51,'Alajuela','AL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(783,51,'Cartago','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(784,51,'Guanacaste','GU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(785,51,'Heredia','HE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(786,51,'Limon','LI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(787,51,'Puntarenas','PU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(788,51,'San Jose','SJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(789,52,'Abengourou','ABE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(790,52,'Abidjan','ABI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(791,52,'Aboisso','ABO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(792,52,'Adiake','ADI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(793,52,'Adzope','ADZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(794,52,'Agboville','AGB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(795,52,'Agnibilekrou','AGN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(796,52,'Alepe','ALE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(797,52,'Bocanda','BOC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(798,52,'Bangolo','BAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(799,52,'Beoumi','BEO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(800,52,'Biankouma','BIA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(801,52,'Bondoukou','BDK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(802,52,'Bongouanou','BGN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(803,52,'Bouafle','BFL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(804,52,'Bouake','BKE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(805,52,'Bouna','BNA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(806,52,'Boundiali','BDL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(807,52,'Dabakala','DKL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(808,52,'Dabou','DBU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(809,52,'Daloa','DAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(810,52,'Danane','DAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(811,52,'Daoukro','DAO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(812,52,'Dimbokro','DIM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(813,52,'Divo','DIV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(814,52,'Duekoue','DUE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(815,52,'Ferkessedougou','FER',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(816,52,'Gagnoa','GAG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(817,52,'Grand-Bassam','GBA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(818,52,'Grand-Lahou','GLA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(819,52,'Guiglo','GUI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(820,52,'Issia','ISS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(821,52,'Jacqueville','JAC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(822,52,'Katiola','KAT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(823,52,'Korhogo','KOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(824,52,'Lakota','LAK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(825,52,'Man','MAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(826,52,'Mankono','MKN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(827,52,'Mbahiakro','MBA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(828,52,'Odienne','ODI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(829,52,'Oume','OUM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(830,52,'Sakassou','SAK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(831,52,'San-Pedro','SPE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(832,52,'Sassandra','SAS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(833,52,'Seguela','SEG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(834,52,'Sinfra','SIN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(835,52,'Soubre','SOU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(836,52,'Tabou','TAB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(837,52,'Tanda','TAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(838,52,'Tiebissou','TIE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(839,52,'Tingrela','TIN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(840,52,'Tiassale','TIA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(841,52,'Touba','TBA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(842,52,'Toulepleu','TLP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(843,52,'Toumodi','TMD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(844,52,'Vavoua','VAV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(845,52,'Yamoussoukro','YAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(846,52,'Zuenoula','ZUE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(847,53,'Bjelovarsko-bilogorska','BB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(848,53,'Grad Zagreb','GZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(849,53,'Dubrovačko-neretvanska','DN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(850,53,'Istarska','IS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(851,53,'Karlovačka','KA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(852,53,'Koprivničko-križevačka','KK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(853,53,'Krapinsko-zagorska','KZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(854,53,'Ličko-senjska','LS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(855,53,'Međimurska','ME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(856,53,'Osječko-baranjska','OB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(857,53,'Požeško-slavonska','PS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(858,53,'Primorsko-goranska','PG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(859,53,'Šibensko-kninska','SK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(860,53,'Sisačko-moslavačka','SM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(861,53,'Brodsko-posavska','BP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(862,53,'Splitsko-dalmatinska','SD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(863,53,'Varaždinska','VA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(864,53,'Virovitičko-podravska','VP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(865,53,'Vukovarsko-srijemska','VS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(866,53,'Zadarska','ZA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(867,53,'Zagrebačka','ZG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(868,54,'Camaguey','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(869,54,'Ciego de Avila','CD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(870,54,'Cienfuegos','CI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(871,54,'Ciudad de La Habana','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(872,54,'Granma','GR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(873,54,'Guantanamo','GU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(874,54,'Holguin','HO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(875,54,'Isla de la Juventud','IJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(876,54,'La Habana','LH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(877,54,'Las Tunas','LT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(878,54,'Matanzas','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(879,54,'Pinar del Rio','PR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(880,54,'Sancti Spiritus','SS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(881,54,'Santiago de Cuba','SC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(882,54,'Villa Clara','VC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(883,55,'Famagusta','F',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(884,55,'Kyrenia','K',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(885,55,'Larnaca','A',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(886,55,'Limassol','I',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(887,55,'Nicosia','N',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(888,55,'Paphos','P',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(889,56,'Ústecký','U',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(890,56,'Jihočeský','C',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(891,56,'Jihomoravský','B',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(892,56,'Karlovarský','K',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(893,56,'Královehradecký','H',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(894,56,'Liberecký','L',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(895,56,'Moravskoslezský','T',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(896,56,'Olomoucký','M',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(897,56,'Pardubický','E',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(898,56,'Plzeňský','P',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(899,56,'Praha','A',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(900,56,'Středočeský','S',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(901,56,'Vysočina','J',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(902,56,'Zlínský','Z',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(903,57,'Arhus','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(904,57,'Bornholm','BH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(905,57,'Copenhagen','CO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(906,57,'Faroe Islands','FO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(907,57,'Frederiksborg','FR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(908,57,'Fyn','FY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(909,57,'Kobenhavn','KO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(910,57,'Nordjylland','NO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(911,57,'Ribe','RI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(912,57,'Ringkobing','RK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(913,57,'Roskilde','RO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(914,57,'Sonderjylland','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(915,57,'Storstrom','ST',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(916,57,'Vejle','VK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(917,57,'Vestj&aelig;lland','VJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(918,57,'Viborg','VB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(919,58,'\'Ali Sabih','S',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(920,58,'Dikhil','K',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(921,58,'Djibouti','J',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(922,58,'Obock','O',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(923,58,'Tadjoura','T',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(924,59,'Saint Andrew Parish','AND',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(925,59,'Saint David Parish','DAV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(926,59,'Saint George Parish','GEO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(927,59,'Saint John Parish','JOH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(928,59,'Saint Joseph Parish','JOS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(929,59,'Saint Luke Parish','LUK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(930,59,'Saint Mark Parish','MAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(931,59,'Saint Patrick Parish','PAT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(932,59,'Saint Paul Parish','PAU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(933,59,'Saint Peter Parish','PET',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(934,60,'Distrito Nacional','DN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(935,60,'Azua','AZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(936,60,'Baoruco','BC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(937,60,'Barahona','BH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(938,60,'Dajabon','DJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(939,60,'Duarte','DU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(940,60,'Elias Pina','EL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(941,60,'El Seybo','SY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(942,60,'Espaillat','ET',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(943,60,'Hato Mayor','HM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(944,60,'Independencia','IN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(945,60,'La Altagracia','AL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(946,60,'La Romana','RO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(947,60,'La Vega','VE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(948,60,'Maria Trinidad Sanchez','MT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(949,60,'Monsenor Nouel','MN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(950,60,'Monte Cristi','MC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(951,60,'Monte Plata','MP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(952,60,'Pedernales','PD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(953,60,'Peravia (Bani)','PR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(954,60,'Puerto Plata','PP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(955,60,'Salcedo','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(956,60,'Samana','SM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(957,60,'Sanchez Ramirez','SH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(958,60,'San Cristobal','SC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(959,60,'San Jose de Ocoa','JO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(960,60,'San Juan','SJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(961,60,'San Pedro de Macoris','PM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(962,60,'Santiago','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(963,60,'Santiago Rodriguez','ST',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(964,60,'Santo Domingo','SD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(965,60,'Valverde','VA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(966,61,'Aileu','AL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(967,61,'Ainaro','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(968,61,'Baucau','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(969,61,'Bobonaro','BO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(970,61,'Cova Lima','CO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(971,61,'Dili','DI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(972,61,'Ermera','ER',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(973,61,'Lautem','LA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(974,61,'Liquica','LI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(975,61,'Manatuto','MT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(976,61,'Manufahi','MF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(977,61,'Oecussi','OE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(978,61,'Viqueque','VI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(979,62,'Azuay','AZU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(980,62,'Bolivar','BOL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(981,62,'Ca&ntilde;ar','CAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(982,62,'Carchi','CAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(983,62,'Chimborazo','CHI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(984,62,'Cotopaxi','COT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(985,62,'El Oro','EOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(986,62,'Esmeraldas','ESM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(987,62,'Gal&aacute;pagos','GPS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(988,62,'Guayas','GUA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(989,62,'Imbabura','IMB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(990,62,'Loja','LOJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(991,62,'Los Rios','LRO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(992,62,'Manab&iacute;','MAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(993,62,'Morona Santiago','MSA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(994,62,'Napo','NAP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(995,62,'Orellana','ORE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(996,62,'Pastaza','PAS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(997,62,'Pichincha','PIC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(998,62,'Sucumb&iacute;os','SUC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(999,62,'Tungurahua','TUN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1000,62,'Zamora Chinchipe','ZCH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1001,63,'Ad Daqahliyah','DHY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1002,63,'Al Bahr al Ahmar','BAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1003,63,'Al Buhayrah','BHY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1004,63,'Al Fayyum','FYM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1005,63,'Al Gharbiyah','GBY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1006,63,'Al Iskandariyah','IDR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1007,63,'Al Isma\'iliyah','IML',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1008,63,'Al Jizah','JZH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1009,63,'Al Minufiyah','MFY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1010,63,'Al Minya','MNY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1011,63,'Al Qahirah','QHR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1012,63,'Al Qalyubiyah','QLY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1013,63,'Al Wadi al Jadid','WJD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1014,63,'Ash Sharqiyah','SHQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1015,63,'As Suways','SWY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1016,63,'Aswan','ASW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1017,63,'Asyut','ASY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1018,63,'Bani Suwayf','BSW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1019,63,'Bur Sa\'id','BSD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1020,63,'Dumyat','DMY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1021,63,'Janub Sina\'','JNS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1022,63,'Kafr ash Shaykh','KSH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1023,63,'Matruh','MAT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1024,63,'Qina','QIN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1025,63,'Shamal Sina\'','SHS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1026,63,'Suhaj','SUH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1027,64,'Ahuachapan','AH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1028,64,'Cabanas','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1029,64,'Chalatenango','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1030,64,'Cuscatlan','CU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1031,64,'La Libertad','LB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1032,64,'La Paz','PZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1033,64,'La Union','UN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1034,64,'Morazan','MO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1035,64,'San Miguel','SM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1036,64,'San Salvador','SS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1037,64,'San Vicente','SV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1038,64,'Santa Ana','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1039,64,'Sonsonate','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1040,64,'Usulutan','US',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1041,65,'Provincia Annobon','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1042,65,'Provincia Bioko Norte','BN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1043,65,'Provincia Bioko Sur','BS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1044,65,'Provincia Centro Sur','CS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1045,65,'Provincia Kie-Ntem','KN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1046,65,'Provincia Litoral','LI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1047,65,'Provincia Wele-Nzas','WN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1048,66,'Central (Maekel)','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1049,66,'Anseba (Keren)','KE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1050,66,'Southern Red Sea (Debub-Keih-Bahri)','DK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1051,66,'Northern Red Sea (Semien-Keih-Bahri)','SK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1052,66,'Southern (Debub)','DE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1053,66,'Gash-Barka (Barentu)','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1054,67,'Harjumaa (Tallinn)','HA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1055,67,'Hiiumaa (Kardla)','HI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1056,67,'Ida-Virumaa (Johvi)','IV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1057,67,'Jarvamaa (Paide)','JA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1058,67,'Jogevamaa (Jogeva)','JO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1059,67,'Laane-Virumaa (Rakvere)','LV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1060,67,'Laanemaa (Haapsalu)','LA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1061,67,'Parnumaa (Parnu)','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1062,67,'Polvamaa (Polva)','PO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1063,67,'Raplamaa (Rapla)','RA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1064,67,'Saaremaa (Kuessaare)','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1065,67,'Tartumaa (Tartu)','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1066,67,'Valgamaa (Valga)','VA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1067,67,'Viljandimaa (Viljandi)','VI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1068,67,'Vorumaa (Voru)','VO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1069,68,'Afar','AF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1070,68,'Amhara','AH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1071,68,'Benishangul-Gumaz','BG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1072,68,'Gambela','GB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1073,68,'Hariai','HR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1074,68,'Oromia','OR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1075,68,'Somali','SM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1076,68,'Southern Nations - Nationalities and Peoples Region','SN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1077,68,'Tigray','TG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1078,68,'Addis Ababa','AA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1079,68,'Dire Dawa','DD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1080,71,'Central Division','C',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1081,71,'Northern Division','N',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1082,71,'Eastern Division','E',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1083,71,'Western Division','W',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1084,71,'Rotuma','R',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1085,72,'Ahvenanmaan lääni','AL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1086,72,'Etelä-Suomen lääni','ES',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1087,72,'Itä-Suomen lääni','IS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1088,72,'Länsi-Suomen lääni','LS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1089,72,'Lapin lääni','LA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1090,72,'Oulun lääni','OU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1114,74,'Ain','01',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1115,74,'Aisne','02',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1116,74,'Allier','03',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1117,74,'Alpes de Haute Provence','04',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1118,74,'Hautes-Alpes','05',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1119,74,'Alpes Maritimes','06',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1120,74,'Ard&egrave;che','07',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1121,74,'Ardennes','08',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1122,74,'Ari&egrave;ge','09',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1123,74,'Aube','10',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1124,74,'Aude','11',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1125,74,'Aveyron','12',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1126,74,'Bouches du Rh&ocirc;ne','13',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1127,74,'Calvados','14',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1128,74,'Cantal','15',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1129,74,'Charente','16',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1130,74,'Charente Maritime','17',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1131,74,'Cher','18',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1132,74,'Corr&egrave;ze','19',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1133,74,'Corse du Sud','2A',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1134,74,'Haute Corse','2B',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1135,74,'C&ocirc;te d&#039;or','21',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1136,74,'C&ocirc;tes d&#039;Armor','22',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1137,74,'Creuse','23',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1138,74,'Dordogne','24',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1139,74,'Doubs','25',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1140,74,'Dr&ocirc;me','26',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1141,74,'Eure','27',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1142,74,'Eure et Loir','28',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1143,74,'Finist&egrave;re','29',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1144,74,'Gard','30',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1145,74,'Haute Garonne','31',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1146,74,'Gers','32',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1147,74,'Gironde','33',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1148,74,'H&eacute;rault','34',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1149,74,'Ille et Vilaine','35',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1150,74,'Indre','36',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1151,74,'Indre et Loire','37',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1152,74,'Is&eacute;re','38',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1153,74,'Jura','39',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1154,74,'Landes','40',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1155,74,'Loir et Cher','41',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1156,74,'Loire','42',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1157,74,'Haute Loire','43',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1158,74,'Loire Atlantique','44',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1159,74,'Loiret','45',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1160,74,'Lot','46',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1161,74,'Lot et Garonne','47',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1162,74,'Loz&egrave;re','48',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1163,74,'Maine et Loire','49',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1164,74,'Manche','50',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1165,74,'Marne','51',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1166,74,'Haute Marne','52',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1167,74,'Mayenne','53',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1168,74,'Meurthe et Moselle','54',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1169,74,'Meuse','55',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1170,74,'Morbihan','56',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1171,74,'Moselle','57',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1172,74,'Ni&egrave;vre','58',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1173,74,'Nord','59',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1174,74,'Oise','60',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1175,74,'Orne','61',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1176,74,'Pas de Calais','62',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1177,74,'Puy de D&ocirc;me','63',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1178,74,'Pyr&eacute;n&eacute;es Atlantiques','64',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1179,74,'Hautes Pyr&eacute;n&eacute;es','65',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1180,74,'Pyr&eacute;n&eacute;es Orientales','66',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1181,74,'Bas Rhin','67',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1182,74,'Haut Rhin','68',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1183,74,'Rh&ocirc;ne','69',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1184,74,'Haute Sa&ocirc;ne','70',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1185,74,'Sa&ocirc;ne et Loire','71',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1186,74,'Sarthe','72',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1187,74,'Savoie','73',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1188,74,'Haute Savoie','74',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1189,74,'Paris','75',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1190,74,'Seine Maritime','76',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1191,74,'Seine et Marne','77',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1192,74,'Yvelines','78',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1193,74,'Deux S&egrave;vres','79',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1194,74,'Somme','80',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1195,74,'Tarn','81',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1196,74,'Tarn et Garonne','82',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1197,74,'Var','83',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1198,74,'Vaucluse','84',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1199,74,'Vend&eacute;e','85',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1200,74,'Vienne','86',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1201,74,'Haute Vienne','87',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1202,74,'Vosges','88',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1203,74,'Yonne','89',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1204,74,'Territoire de Belfort','90',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1205,74,'Essonne','91',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1206,74,'Hauts de Seine','92',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1207,74,'Seine St-Denis','93',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1208,74,'Val de Marne','94',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1209,74,'Val d\'Oise','95',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1210,76,'Archipel des Marquises','M',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1211,76,'Archipel des Tuamotu','T',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1212,76,'Archipel des Tubuai','I',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1213,76,'Iles du Vent','V',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1214,76,'Iles Sous-le-Vent','S',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1215,77,'Iles Crozet','C',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1216,77,'Iles Kerguelen','K',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1217,77,'Ile Amsterdam','A',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1218,77,'Ile Saint-Paul','P',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1219,77,'Adelie Land','D',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1220,78,'Estuaire','ES',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1221,78,'Haut-Ogooue','HO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1222,78,'Moyen-Ogooue','MO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1223,78,'Ngounie','NG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1224,78,'Nyanga','NY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1225,78,'Ogooue-Ivindo','OI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1226,78,'Ogooue-Lolo','OL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1227,78,'Ogooue-Maritime','OM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1228,78,'Woleu-Ntem','WN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1229,79,'Banjul','BJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1230,79,'Basse','BS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1231,79,'Brikama','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1232,79,'Janjangbure','JA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1233,79,'Kanifeng','KA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1234,79,'Kerewan','KE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1235,79,'Kuntaur','KU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1236,79,'Mansakonko','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1237,79,'Lower River','LR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1238,79,'Central River','CR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1239,79,'North Bank','NB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1240,79,'Upper River','UR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1241,79,'Western','WE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1242,80,'Abkhazia','AB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1243,80,'Ajaria','AJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1244,80,'Tbilisi','TB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1245,80,'Guria','GU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1246,80,'Imereti','IM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1247,80,'Kakheti','KA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1248,80,'Kvemo Kartli','KK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1249,80,'Mtskheta-Mtianeti','MM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1250,80,'Racha Lechkhumi and Kvemo Svanet','RL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1251,80,'Samegrelo-Zemo Svaneti','SZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1252,80,'Samtskhe-Javakheti','SJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1253,80,'Shida Kartli','SK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1254,81,'Baden-Württemberg','BAW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1255,81,'Bayern','BAY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1256,81,'Berlin','BER',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1257,81,'Brandenburg','BRG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1258,81,'Bremen','BRE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1259,81,'Hamburg','HAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1260,81,'Hessen','HES',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1261,81,'Mecklenburg-Vorpommern','MEC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1262,81,'Niedersachsen','NDS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1263,81,'Nordrhein-Westfalen','NRW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1264,81,'Rheinland-Pfalz','RHE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1265,81,'Saarland','SAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1266,81,'Sachsen','SAS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1267,81,'Sachsen-Anhalt','SAC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1268,81,'Schleswig-Holstein','SCN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1269,81,'Thüringen','THE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1270,82,'Ashanti Region','AS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1271,82,'Brong-Ahafo Region','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1272,82,'Central Region','CE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1273,82,'Eastern Region','EA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1274,82,'Greater Accra Region','GA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1275,82,'Northern Region','NO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1276,82,'Upper East Region','UE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1277,82,'Upper West Region','UW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1278,82,'Volta Region','VO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1279,82,'Western Region','WE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1280,84,'Attica','AT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1281,84,'Central Greece','CN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1282,84,'Central Macedonia','CM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1283,84,'Crete','CR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1284,84,'East Macedonia and Thrace','EM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1285,84,'Epirus','EP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1286,84,'Ionian Islands','II',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1287,84,'North Aegean','NA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1288,84,'Peloponnesos','PP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1289,84,'South Aegean','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1290,84,'Thessaly','TH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1291,84,'West Greece','WG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1292,84,'West Macedonia','WM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1293,85,'Avannaa','A',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1294,85,'Tunu','T',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1295,85,'Kitaa','K',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1296,86,'Saint Andrew','A',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1297,86,'Saint David','D',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1298,86,'Saint George','G',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1299,86,'Saint John','J',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1300,86,'Saint Mark','M',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1301,86,'Saint Patrick','P',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1302,86,'Carriacou','C',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1303,86,'Petit Martinique','Q',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1304,89,'Alta Verapaz','AV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1305,89,'Baja Verapaz','BV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1306,89,'Chimaltenango','CM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1307,89,'Chiquimula','CQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1308,89,'El Peten','PE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1309,89,'El Progreso','PR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1310,89,'El Quiche','QC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1311,89,'Escuintla','ES',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1312,89,'Guatemala','GU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1313,89,'Huehuetenango','HU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1314,89,'Izabal','IZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1315,89,'Jalapa','JA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1316,89,'Jutiapa','JU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1317,89,'Quetzaltenango','QZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1318,89,'Retalhuleu','RE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1319,89,'Sacatepequez','ST',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1320,89,'San Marcos','SM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1321,89,'Santa Rosa','SR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1322,89,'Solola','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1323,89,'Suchitepequez','SU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1324,89,'Totonicapan','TO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1325,89,'Zacapa','ZA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1326,90,'Conakry','CNK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1327,90,'Beyla','BYL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1328,90,'Boffa','BFA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1329,90,'Boke','BOK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1330,90,'Coyah','COY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1331,90,'Dabola','DBL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1332,90,'Dalaba','DLB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1333,90,'Dinguiraye','DGR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1334,90,'Dubreka','DBR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1335,90,'Faranah','FRN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1336,90,'Forecariah','FRC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1337,90,'Fria','FRI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1338,90,'Gaoual','GAO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1339,90,'Gueckedou','GCD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1340,90,'Kankan','KNK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1341,90,'Kerouane','KRN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1342,90,'Kindia','KND',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1343,90,'Kissidougou','KSD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1344,90,'Koubia','KBA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1345,90,'Koundara','KDA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1346,90,'Kouroussa','KRA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1347,90,'Labe','LAB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1348,90,'Lelouma','LLM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1349,90,'Lola','LOL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1350,90,'Macenta','MCT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1351,90,'Mali','MAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1352,90,'Mamou','MAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1353,90,'Mandiana','MAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1354,90,'Nzerekore','NZR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1355,90,'Pita','PIT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1356,90,'Siguiri','SIG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1357,90,'Telimele','TLM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1358,90,'Tougue','TOG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1359,90,'Yomou','YOM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1360,91,'Bafata Region','BF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1361,91,'Biombo Region','BB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1362,91,'Bissau Region','BS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1363,91,'Bolama Region','BL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1364,91,'Cacheu Region','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1365,91,'Gabu Region','GA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1366,91,'Oio Region','OI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1367,91,'Quinara Region','QU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1368,91,'Tombali Region','TO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1369,92,'Barima-Waini','BW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1370,92,'Cuyuni-Mazaruni','CM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1371,92,'Demerara-Mahaica','DM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1372,92,'East Berbice-Corentyne','EC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1373,92,'Essequibo Islands-West Demerara','EW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1374,92,'Mahaica-Berbice','MB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1375,92,'Pomeroon-Supenaam','PM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1376,92,'Potaro-Siparuni','PI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1377,92,'Upper Demerara-Berbice','UD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1378,92,'Upper Takutu-Upper Essequibo','UT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1379,93,'Artibonite','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1380,93,'Centre','CE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1381,93,'Grand\'Anse','GA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1382,93,'Nord','ND',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1383,93,'Nord-Est','NE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1384,93,'Nord-Ouest','NO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1385,93,'Ouest','OU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1386,93,'Sud','SD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1387,93,'Sud-Est','SE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1388,94,'Flat Island','F',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1389,94,'McDonald Island','M',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1390,94,'Shag Island','S',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1391,94,'Heard Island','H',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1392,95,'Atlantida','AT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1393,95,'Choluteca','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1394,95,'Colon','CL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1395,95,'Comayagua','CM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1396,95,'Copan','CP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1397,95,'Cortes','CR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1398,95,'El Paraiso','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1399,95,'Francisco Morazan','FM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1400,95,'Gracias a Dios','GD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1401,95,'Intibuca','IN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1402,95,'Islas de la Bahia (Bay Islands)','IB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1403,95,'La Paz','PZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1404,95,'Lempira','LE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1405,95,'Ocotepeque','OC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1406,95,'Olancho','OL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1407,95,'Santa Barbara','SB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1408,95,'Valle','VA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1409,95,'Yoro','YO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1410,96,'Central and Western Hong Kong Island','HCW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1411,96,'Eastern Hong Kong Island','HEA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1412,96,'Southern Hong Kong Island','HSO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1413,96,'Wan Chai Hong Kong Island','HWC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1414,96,'Kowloon City Kowloon','KKC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1415,96,'Kwun Tong Kowloon','KKT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1416,96,'Sham Shui Po Kowloon','KSS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1417,96,'Wong Tai Sin Kowloon','KWT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1418,96,'Yau Tsim Mong Kowloon','KYT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1419,96,'Islands New Territories','NIS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1420,96,'Kwai Tsing New Territories','NKT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1421,96,'North New Territories','NNO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1422,96,'Sai Kung New Territories','NSK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1423,96,'Sha Tin New Territories','NST',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1424,96,'Tai Po New Territories','NTP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1425,96,'Tsuen Wan New Territories','NTW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1426,96,'Tuen Mun New Territories','NTM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1427,96,'Yuen Long New Territories','NYL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1467,98,'Austurland','AL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1468,98,'Hofuoborgarsvaeoi','HF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1469,98,'Norourland eystra','NE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1470,98,'Norourland vestra','NV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1471,98,'Suourland','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1472,98,'Suournes','SN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1473,98,'Vestfiroir','VF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1474,98,'Vesturland','VL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1475,99,'Andaman and Nicobar Islands','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1476,99,'Andhra Pradesh','AP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1477,99,'Arunachal Pradesh','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1478,99,'Assam','AS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1479,99,'Bihar','BI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1480,99,'Chandigarh','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1481,99,'Dadra and Nagar Haveli','DA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1482,99,'Daman and Diu','DM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1483,99,'Delhi','DE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1484,99,'Goa','GO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1485,99,'Gujarat','GU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1486,99,'Haryana','HA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1487,99,'Himachal Pradesh','HP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1488,99,'Jammu and Kashmir','JA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1489,99,'Karnataka','KA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1490,99,'Kerala','KE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1491,99,'Lakshadweep Islands','LI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1492,99,'Madhya Pradesh','MP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1493,99,'Maharashtra','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1494,99,'Manipur','MN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1495,99,'Meghalaya','ME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1496,99,'Mizoram','MI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1497,99,'Nagaland','NA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1498,99,'Orissa','OR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1499,99,'Puducherry','PO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1500,99,'Punjab','PU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1501,99,'Rajasthan','RA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1502,99,'Sikkim','SI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1503,99,'Tamil Nadu','TN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1504,99,'Tripura','TR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1505,99,'Uttar Pradesh','UP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1506,99,'West Bengal','WB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1507,100,'Aceh','AC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1508,100,'Bali','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1509,100,'Banten','BT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1510,100,'Bengkulu','BE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1511,100,'Kalimantan Utara','BD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1512,100,'Gorontalo','GO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1513,100,'Jakarta','JK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1514,100,'Jambi','JA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1515,100,'Jawa Barat','JB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1516,100,'Jawa Tengah','JT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1517,100,'Jawa Timur','JI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1518,100,'Kalimantan Barat','KB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1519,100,'Kalimantan Selatan','KS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1520,100,'Kalimantan Tengah','KT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1521,100,'Kalimantan Timur','KI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1522,100,'Kepulauan Bangka Belitung','BB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1523,100,'Lampung','LA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1524,100,'Maluku','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1525,100,'Maluku Utara','MU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1526,100,'Nusa Tenggara Barat','NB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1527,100,'Nusa Tenggara Timur','NT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1528,100,'Papua','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1529,100,'Riau','RI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1530,100,'Sulawesi Selatan','SN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1531,100,'Sulawesi Tengah','ST',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1532,100,'Sulawesi Tenggara','SG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1533,100,'Sulawesi Utara','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1534,100,'Sumatera Barat','SB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1535,100,'Sumatera Selatan','SS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1536,100,'Sumatera Utara','SU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1537,100,'Yogyakarta','YO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1538,101,'Tehran','TEH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1539,101,'Qom','QOM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1540,101,'Markazi','MKZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1541,101,'Qazvin','QAZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1542,101,'Gilan','GIL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1543,101,'Ardabil','ARD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1544,101,'Zanjan','ZAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1545,101,'East Azarbaijan','EAZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1546,101,'West Azarbaijan','WEZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1547,101,'Kurdistan','KRD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1548,101,'Hamadan','HMD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1549,101,'Kermanshah','KRM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1550,101,'Ilam','ILM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1551,101,'Lorestan','LRS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1552,101,'Khuzestan','KZT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1553,101,'Chahar Mahaal and Bakhtiari','CMB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1554,101,'Kohkiluyeh and Buyer Ahmad','KBA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1555,101,'Bushehr','BSH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1556,101,'Fars','FAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1557,101,'Hormozgan','HRM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1558,101,'Sistan and Baluchistan','SBL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1559,101,'Kerman','KRB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1560,101,'Yazd','YZD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1561,101,'Esfahan','EFH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1562,101,'Semnan','SMN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1563,101,'Mazandaran','MZD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1564,101,'Golestan','GLS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1565,101,'North Khorasan','NKH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1566,101,'Razavi Khorasan','RKH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1567,101,'South Khorasan','SKH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1568,102,'Baghdad','BD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1569,102,'Salah ad Din','SD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1570,102,'Diyala','DY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1571,102,'Wasit','WS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1572,102,'Maysan','MY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1573,102,'Al Basrah','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1574,102,'Dhi Qar','DQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1575,102,'Al Muthanna','MU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1576,102,'Al Qadisyah','QA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1577,102,'Babil','BB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1578,102,'Al Karbala','KB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1579,102,'An Najaf','NJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1580,102,'Al Anbar','AB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1581,102,'Ninawa','NN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1582,102,'Dahuk','DH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1583,102,'Arbil','AL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1584,102,'At Ta\'mim','TM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1585,102,'As Sulaymaniyah','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1586,103,'Carlow','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1587,103,'Cavan','CV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1588,103,'Clare','CL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1589,103,'Cork','CO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1590,103,'Donegal','DO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1591,103,'Dublin','DU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1592,103,'Galway','GA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1593,103,'Kerry','KE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1594,103,'Kildare','KI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1595,103,'Kilkenny','KL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1596,103,'Laois','LA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1597,103,'Leitrim','LE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1598,103,'Limerick','LI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1599,103,'Longford','LO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1600,103,'Louth','LU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1601,103,'Mayo','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1602,103,'Meath','ME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1603,103,'Monaghan','MO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1604,103,'Offaly','OF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1605,103,'Roscommon','RO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1606,103,'Sligo','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1607,103,'Tipperary','TI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1608,103,'Waterford','WA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1609,103,'Westmeath','WE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1610,103,'Wexford','WX',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1611,103,'Wicklow','WI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1612,104,'Be\'er Sheva','BS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1613,104,'Bika\'at Hayarden','BH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1614,104,'Eilat and Arava','EA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1615,104,'Galil','GA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1616,104,'Haifa','HA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1617,104,'Jehuda Mountains','JM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1618,104,'Jerusalem','JE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1619,104,'Negev','NE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1620,104,'Semaria','SE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1621,104,'Sharon','SH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1622,104,'Tel Aviv (Gosh Dan)','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1643,106,'Clarendon Parish','CLA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1644,106,'Hanover Parish','HAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1645,106,'Kingston Parish','KIN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1646,106,'Manchester Parish','MAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1647,106,'Portland Parish','POR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1648,106,'Saint Andrew Parish','AND',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1649,106,'Saint Ann Parish','ANN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1650,106,'Saint Catherine Parish','CAT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1651,106,'Saint Elizabeth Parish','ELI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1652,106,'Saint James Parish','JAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1653,106,'Saint Mary Parish','MAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1654,106,'Saint Thomas Parish','THO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1655,106,'Trelawny Parish','TRL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1656,106,'Westmoreland Parish','WML',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1657,107,'Aichi','AI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1658,107,'Akita','AK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1659,107,'Aomori','AO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1660,107,'Chiba','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1661,107,'Ehime','EH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1662,107,'Fukui','FK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1663,107,'Fukuoka','FU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1664,107,'Fukushima','FS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1665,107,'Gifu','GI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1666,107,'Gumma','GU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1667,107,'Hiroshima','HI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1668,107,'Hokkaido','HO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1669,107,'Hyogo','HY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1670,107,'Ibaraki','IB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1671,107,'Ishikawa','IS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1672,107,'Iwate','IW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1673,107,'Kagawa','KA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1674,107,'Kagoshima','KG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1675,107,'Kanagawa','KN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1676,107,'Kochi','KO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1677,107,'Kumamoto','KU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1678,107,'Kyoto','KY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1679,107,'Mie','MI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1680,107,'Miyagi','MY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1681,107,'Miyazaki','MZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1682,107,'Nagano','NA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1683,107,'Nagasaki','NG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1684,107,'Nara','NR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1685,107,'Niigata','NI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1686,107,'Oita','OI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1687,107,'Okayama','OK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1688,107,'Okinawa','ON',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1689,107,'Osaka','OS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1690,107,'Saga','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1691,107,'Saitama','SI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1692,107,'Shiga','SH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1693,107,'Shimane','SM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1694,107,'Shizuoka','SZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1695,107,'Tochigi','TO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1696,107,'Tokushima','TS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1697,107,'Tokyo','TK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1698,107,'Tottori','TT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1699,107,'Toyama','TY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1700,107,'Wakayama','WA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1701,107,'Yamagata','YA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1702,107,'Yamaguchi','YM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1703,107,'Yamanashi','YN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1704,108,'\'Amman','AM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1705,108,'Ajlun','AJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1706,108,'Al \'Aqabah','AA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1707,108,'Al Balqa\'','AB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1708,108,'Al Karak','AK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1709,108,'Al Mafraq','AL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1710,108,'At Tafilah','AT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1711,108,'Az Zarqa\'','AZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1712,108,'Irbid','IR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1713,108,'Jarash','JA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1714,108,'Ma\'an','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1715,108,'Madaba','MD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1716,109,'Almaty','AL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1717,109,'Almaty City','AC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1718,109,'Aqmola','AM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1719,109,'Aqtobe','AQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1720,109,'Astana City','AS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1721,109,'Atyrau','AT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1722,109,'Batys Qazaqstan','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1723,109,'Bayqongyr City','BY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1724,109,'Mangghystau','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1725,109,'Ongtustik Qazaqstan','ON',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1726,109,'Pavlodar','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1727,109,'Qaraghandy','QA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1728,109,'Qostanay','QO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1729,109,'Qyzylorda','QY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1730,109,'Shyghys Qazaqstan','SH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1731,109,'Soltustik Qazaqstan','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1732,109,'Zhambyl','ZH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1733,110,'Central','CE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1734,110,'Coast','CO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1735,110,'Eastern','EA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1736,110,'Nairobi Area','NA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1737,110,'North Eastern','NE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1738,110,'Nyanza','NY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1739,110,'Rift Valley','RV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1740,110,'Western','WE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1741,111,'Abaiang','AG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1742,111,'Abemama','AM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1743,111,'Aranuka','AK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1744,111,'Arorae','AO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1745,111,'Banaba','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1746,111,'Beru','BE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1747,111,'Butaritari','bT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1748,111,'Kanton','KA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1749,111,'Kiritimati','KR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1750,111,'Kuria','KU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1751,111,'Maiana','MI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1752,111,'Makin','MN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1753,111,'Marakei','ME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1754,111,'Nikunau','NI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1755,111,'Nonouti','NO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1756,111,'Onotoa','ON',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1757,111,'Tabiteuea','TT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1758,111,'Tabuaeran','TR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1759,111,'Tamana','TM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1760,111,'Tarawa','TW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1761,111,'Teraina','TE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1762,112,'Chagang-do','CHA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1763,112,'Hamgyong-bukto','HAB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1764,112,'Hamgyong-namdo','HAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1765,112,'Hwanghae-bukto','HWB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1766,112,'Hwanghae-namdo','HWN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1767,112,'Kangwon-do','KAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1768,112,'P\'yongan-bukto','PYB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1769,112,'P\'yongan-namdo','PYN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1770,112,'Ryanggang-do (Yanggang-do)','YAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1771,112,'Rason Directly Governed City','NAJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1772,112,'P\'yongyang Special City','PYO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1773,113,'Ch\'ungch\'ong-bukto','CO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1774,113,'Ch\'ungch\'ong-namdo','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1775,113,'Cheju-do','CD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1776,113,'Cholla-bukto','CB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1777,113,'Cholla-namdo','CN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1778,113,'Inch\'on-gwangyoksi','IG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1779,113,'Kangwon-do','KA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1780,113,'Kwangju-gwangyoksi','KG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1781,113,'Kyonggi-do','KD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1782,113,'Kyongsang-bukto','KB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1783,113,'Kyongsang-namdo','KN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1784,113,'Pusan-gwangyoksi','PG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1785,113,'Soul-t\'ukpyolsi','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1786,113,'Taegu-gwangyoksi','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1787,113,'Taejon-gwangyoksi','TG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1788,114,'Al \'Asimah','AL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1789,114,'Al Ahmadi','AA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1790,114,'Al Farwaniyah','AF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1791,114,'Al Jahra\'','AJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1792,114,'Hawalli','HA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1793,115,'Bishkek','GB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1794,115,'Batken','B',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1795,115,'Chu','C',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1796,115,'Jalal-Abad','J',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1797,115,'Naryn','N',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1798,115,'Osh','O',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1799,115,'Talas','T',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1800,115,'Ysyk-Kol','Y',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1801,116,'Vientiane','VT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1802,116,'Attapu','AT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1803,116,'Bokeo','BK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1804,116,'Bolikhamxai','BL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1805,116,'Champasak','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1806,116,'Houaphan','HO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1807,116,'Khammouan','KH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1808,116,'Louang Namtha','LM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1809,116,'Louangphabang','LP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1810,116,'Oudomxai','OU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1811,116,'Phongsali','PH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1812,116,'Salavan','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1813,116,'Savannakhet','SV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1814,116,'Vientiane','VI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1815,116,'Xaignabouli','XA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1816,116,'Xekong','XE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1817,116,'Xiangkhoang','XI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1818,116,'Xaisomboun','XN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1852,119,'Berea','BE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1853,119,'Butha-Buthe','BB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1854,119,'Leribe','LE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1855,119,'Mafeteng','MF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1856,119,'Maseru','MS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1857,119,'Mohale\'s Hoek','MH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1858,119,'Mokhotlong','MK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1859,119,'Qacha\'s Nek','QN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1860,119,'Quthing','QT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1861,119,'Thaba-Tseka','TT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1862,120,'Bomi','BI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1863,120,'Bong','BG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1864,120,'Grand Bassa','GB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1865,120,'Grand Cape Mount','CM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1866,120,'Grand Gedeh','GG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1867,120,'Grand Kru','GK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1868,120,'Lofa','LO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1869,120,'Margibi','MG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1870,120,'Maryland','ML',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1871,120,'Montserrado','MS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1872,120,'Nimba','NB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1873,120,'River Cess','RC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1874,120,'Sinoe','SN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1875,121,'Ajdabiya','AJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1876,121,'Al \'Aziziyah','AZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1877,121,'Al Fatih','FA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1878,121,'Al Jabal al Akhdar','JA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1879,121,'Al Jufrah','JU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1880,121,'Al Khums','KH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1881,121,'Al Kufrah','KU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1882,121,'An Nuqat al Khams','NK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1883,121,'Ash Shati\'','AS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1884,121,'Awbari','AW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1885,121,'Az Zawiyah','ZA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1886,121,'Banghazi','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1887,121,'Darnah','DA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1888,121,'Ghadamis','GD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1889,121,'Gharyan','GY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1890,121,'Misratah','MI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1891,121,'Murzuq','MZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1892,121,'Sabha','SB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1893,121,'Sawfajjin','SW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1894,121,'Surt','SU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1895,121,'Tarabulus (Tripoli)','TL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1896,121,'Tarhunah','TH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1897,121,'Tubruq','TU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1898,121,'Yafran','YA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1899,121,'Zlitan','ZL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1900,122,'Vaduz','V',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1901,122,'Schaan','A',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1902,122,'Balzers','B',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1903,122,'Triesen','N',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1904,122,'Eschen','E',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1905,122,'Mauren','M',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1906,122,'Triesenberg','T',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1907,122,'Ruggell','R',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1908,122,'Gamprin','G',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1909,122,'Schellenberg','L',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1910,122,'Planken','P',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1911,123,'Alytus','AL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1912,123,'Kaunas','KA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1913,123,'Klaipeda','KL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1914,123,'Marijampole','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1915,123,'Panevezys','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1916,123,'Siauliai','SI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1917,123,'Taurage','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1918,123,'Telsiai','TE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1919,123,'Utena','UT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1920,123,'Vilnius','VI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1921,124,'Diekirch','DD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1922,124,'Clervaux','DC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1923,124,'Redange','DR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1924,124,'Vianden','DV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1925,124,'Wiltz','DW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1926,124,'Grevenmacher','GG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1927,124,'Echternach','GE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1928,124,'Remich','GR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1929,124,'Luxembourg','LL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1930,124,'Capellen','LC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1931,124,'Esch-sur-Alzette','LE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1932,124,'Mersch','LM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1933,125,'Our Lady Fatima Parish','OLF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1934,125,'St. Anthony Parish','ANT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1935,125,'St. Lazarus Parish','LAZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1936,125,'Cathedral Parish','CAT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1937,125,'St. Lawrence Parish','LAW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1938,127,'Antananarivo','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1939,127,'Antsiranana','AS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1940,127,'Fianarantsoa','FN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1941,127,'Mahajanga','MJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1942,127,'Toamasina','TM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1943,127,'Toliara','TL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1944,128,'Balaka','BLK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1945,128,'Blantyre','BLT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1946,128,'Chikwawa','CKW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1947,128,'Chiradzulu','CRD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1948,128,'Chitipa','CTP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1949,128,'Dedza','DDZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1950,128,'Dowa','DWA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1951,128,'Karonga','KRG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1952,128,'Kasungu','KSG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1953,128,'Likoma','LKM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1954,128,'Lilongwe','LLG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1955,128,'Machinga','MCG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1956,128,'Mangochi','MGC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1957,128,'Mchinji','MCH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1958,128,'Mulanje','MLJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1959,128,'Mwanza','MWZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1960,128,'Mzimba','MZM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1961,128,'Ntcheu','NTU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1962,128,'Nkhata Bay','NKB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1963,128,'Nkhotakota','NKH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1964,128,'Nsanje','NSJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1965,128,'Ntchisi','NTI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1966,128,'Phalombe','PHL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1967,128,'Rumphi','RMP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1968,128,'Salima','SLM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1969,128,'Thyolo','THY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1970,128,'Zomba','ZBA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1971,129,'Johor','MY-01',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1972,129,'Kedah','MY-02',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1973,129,'Kelantan','MY-03',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1974,129,'Labuan','MY-15',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1975,129,'Melaka','MY-04',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1976,129,'Negeri Sembilan','MY-05',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1977,129,'Pahang','MY-06',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1978,129,'Perak','MY-08',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1979,129,'Perlis','MY-09',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1980,129,'Pulau Pinang','MY-07',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1981,129,'Sabah','MY-12',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1982,129,'Sarawak','MY-13',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1983,129,'Selangor','MY-10',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1984,129,'Terengganu','MY-11',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1985,129,'Kuala Lumpur','MY-14',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1986,130,'Thiladhunmathi Uthuru','THU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1987,130,'Thiladhunmathi Dhekunu','THD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1988,130,'Miladhunmadulu Uthuru','MLU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1989,130,'Miladhunmadulu Dhekunu','MLD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1990,130,'Maalhosmadulu Uthuru','MAU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1991,130,'Maalhosmadulu Dhekunu','MAD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1992,130,'Faadhippolhu','FAA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1993,130,'Male Atoll','MAA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1994,130,'Ari Atoll Uthuru','AAU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1995,130,'Ari Atoll Dheknu','AAD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1996,130,'Felidhe Atoll','FEA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1997,130,'Mulaku Atoll','MUA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1998,130,'Nilandhe Atoll Uthuru','NAU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(1999,130,'Nilandhe Atoll Dhekunu','NAD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2000,130,'Kolhumadulu','KLH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2001,130,'Hadhdhunmathi','HDH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2002,130,'Huvadhu Atoll Uthuru','HAU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2003,130,'Huvadhu Atoll Dhekunu','HAD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2004,130,'Fua Mulaku','FMU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2005,130,'Addu','ADD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2006,131,'Gao','GA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2007,131,'Kayes','KY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2008,131,'Kidal','KD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2009,131,'Koulikoro','KL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2010,131,'Mopti','MP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2011,131,'Segou','SG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2012,131,'Sikasso','SK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2013,131,'Tombouctou','TB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2014,131,'Bamako Capital District','CD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2015,132,'Attard','ATT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2016,132,'Balzan','BAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2017,132,'Birgu','BGU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2018,132,'Birkirkara','BKK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2019,132,'Birzebbuga','BRZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2020,132,'Bormla','BOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2021,132,'Dingli','DIN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2022,132,'Fgura','FGU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2023,132,'Floriana','FLO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2024,132,'Gudja','GDJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2025,132,'Gzira','GZR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2026,132,'Gargur','GRG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2027,132,'Gaxaq','GXQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2028,132,'Hamrun','HMR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2029,132,'Iklin','IKL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2030,132,'Isla','ISL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2031,132,'Kalkara','KLK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2032,132,'Kirkop','KRK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2033,132,'Lija','LIJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2034,132,'Luqa','LUQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2035,132,'Marsa','MRS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2036,132,'Marsaskala','MKL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2037,132,'Marsaxlokk','MXL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2038,132,'Mdina','MDN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2039,132,'Melliea','MEL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2040,132,'Mgarr','MGR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2041,132,'Mosta','MST',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2042,132,'Mqabba','MQA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2043,132,'Msida','MSI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2044,132,'Mtarfa','MTF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2045,132,'Naxxar','NAX',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2046,132,'Paola','PAO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2047,132,'Pembroke','PEM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2048,132,'Pieta','PIE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2049,132,'Qormi','QOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2050,132,'Qrendi','QRE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2051,132,'Rabat','RAB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2052,132,'Safi','SAF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2053,132,'San Giljan','SGI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2054,132,'Santa Lucija','SLU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2055,132,'San Pawl il-Bahar','SPB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2056,132,'San Gwann','SGW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2057,132,'Santa Venera','SVE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2058,132,'Siggiewi','SIG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2059,132,'Sliema','SLM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2060,132,'Swieqi','SWQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2061,132,'Ta Xbiex','TXB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2062,132,'Tarxien','TRX',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2063,132,'Valletta','VLT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2064,132,'Xgajra','XGJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2065,132,'Zabbar','ZBR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2066,132,'Zebbug','ZBG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2067,132,'Zejtun','ZJT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2068,132,'Zurrieq','ZRQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2069,132,'Fontana','FNT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2070,132,'Ghajnsielem','GHJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2071,132,'Gharb','GHR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2072,132,'Ghasri','GHS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2073,132,'Kercem','KRC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2074,132,'Munxar','MUN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2075,132,'Nadur','NAD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2076,132,'Qala','QAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2077,132,'Victoria','VIC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2078,132,'San Lawrenz','SLA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2079,132,'Sannat','SNT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2080,132,'Xagra','ZAG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2081,132,'Xewkija','XEW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2082,132,'Zebbug','ZEB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2083,133,'Ailinginae','ALG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2084,133,'Ailinglaplap','ALL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2085,133,'Ailuk','ALK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2086,133,'Arno','ARN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2087,133,'Aur','AUR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2088,133,'Bikar','BKR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2089,133,'Bikini','BKN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2090,133,'Bokak','BKK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2091,133,'Ebon','EBN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2092,133,'Enewetak','ENT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2093,133,'Erikub','EKB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2094,133,'Jabat','JBT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2095,133,'Jaluit','JLT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2096,133,'Jemo','JEM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2097,133,'Kili','KIL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2098,133,'Kwajalein','KWJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2099,133,'Lae','LAE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2100,133,'Lib','LIB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2101,133,'Likiep','LKP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2102,133,'Majuro','MJR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2103,133,'Maloelap','MLP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2104,133,'Mejit','MJT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2105,133,'Mili','MIL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2106,133,'Namorik','NMK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2107,133,'Namu','NAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2108,133,'Rongelap','RGL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2109,133,'Rongrik','RGK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2110,133,'Toke','TOK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2111,133,'Ujae','UJA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2112,133,'Ujelang','UJL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2113,133,'Utirik','UTK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2114,133,'Wotho','WTH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2115,133,'Wotje','WTJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2116,135,'Adrar','AD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2117,135,'Assaba','AS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2118,135,'Brakna','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2119,135,'Dakhlet Nouadhibou','DN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2120,135,'Gorgol','GO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2121,135,'Guidimaka','GM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2122,135,'Hodh Ech Chargui','HC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2123,135,'Hodh El Gharbi','HG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2124,135,'Inchiri','IN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2125,135,'Tagant','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2126,135,'Tiris Zemmour','TZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2127,135,'Trarza','TR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2128,135,'Nouakchott','NO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2129,136,'Beau Bassin-Rose Hill','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2130,136,'Curepipe','CU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2131,136,'Port Louis','PU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2132,136,'Quatre Bornes','QB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2133,136,'Vacoas-Phoenix','VP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2134,136,'Agalega Islands','AG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2135,136,'Cargados Carajos Shoals (Saint Brandon Islands)','CC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2136,136,'Rodrigues','RO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2137,136,'Black River','BL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2138,136,'Flacq','FL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2139,136,'Grand Port','GP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2140,136,'Moka','MO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2141,136,'Pamplemousses','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2142,136,'Plaines Wilhems','PW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2143,136,'Port Louis','PL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2144,136,'Riviere du Rempart','RR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2145,136,'Savanne','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2146,138,'Baja California Norte','BN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2147,138,'Baja California Sur','BS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2148,138,'Campeche','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2149,138,'Chiapas','CI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2150,138,'Chihuahua','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2151,138,'Coahuila de Zaragoza','CZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2152,138,'Colima','CL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2153,138,'Distrito Federal','DF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2154,138,'Durango','DU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2155,138,'Guanajuato','GA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2156,138,'Guerrero','GE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2157,138,'Hidalgo','HI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2158,138,'Jalisco','JA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2159,138,'Mexico','ME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2160,138,'Michoacan de Ocampo','MI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2161,138,'Morelos','MO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2162,138,'Nayarit','NA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2163,138,'Nuevo Leon','NL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2164,138,'Oaxaca','OA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2165,138,'Puebla','PU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2166,138,'Queretaro de Arteaga','QA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2167,138,'Quintana Roo','QR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2168,138,'San Luis Potosi','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2169,138,'Sinaloa','SI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2170,138,'Sonora','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2171,138,'Tabasco','TB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2172,138,'Tamaulipas','TM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2173,138,'Tlaxcala','TL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2174,138,'Veracruz-Llave','VE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2175,138,'Yucatan','YU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2176,138,'Zacatecas','ZA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2177,139,'Chuuk','C',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2178,139,'Kosrae','K',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2179,139,'Pohnpei','P',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2180,139,'Yap','Y',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2181,140,'Gagauzia','GA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2182,140,'Chisinau','CU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2183,140,'Balti','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2184,140,'Cahul','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2185,140,'Edinet','ED',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2186,140,'Lapusna','LA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2187,140,'Orhei','OR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2188,140,'Soroca','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2189,140,'Tighina','TI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2190,140,'Ungheni','UN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2191,140,'St‚nga Nistrului','SN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2192,141,'Fontvieille','FV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2193,141,'La Condamine','LC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2194,141,'Monaco-Ville','MV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2195,141,'Monte-Carlo','MC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2196,142,'Ulanbaatar','1',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2197,142,'Orhon','035',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2198,142,'Darhan uul','037',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2199,142,'Hentiy','039',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2200,142,'Hovsgol','041',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2201,142,'Hovd','043',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2202,142,'Uvs','046',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2203,142,'Tov','047',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2204,142,'Selenge','049',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2205,142,'Suhbaatar','051',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2206,142,'Omnogovi','053',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2207,142,'Ovorhangay','055',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2208,142,'Dzavhan','057',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2209,142,'DundgovL','059',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2210,142,'Dornod','061',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2211,142,'Dornogov','063',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2212,142,'Govi-Sumber','064',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2213,142,'Govi-Altay','065',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2214,142,'Bulgan','067',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2215,142,'Bayanhongor','069',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2216,142,'Bayan-Olgiy','071',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2217,142,'Arhangay','073',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2218,143,'Saint Anthony','A',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2219,143,'Saint Georges','G',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2220,143,'Saint Peter','P',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2221,144,'Agadir','AGD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2222,144,'Al Hoceima','HOC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2223,144,'Azilal','AZI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2224,144,'Beni Mellal','BME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2225,144,'Ben Slimane','BSL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2226,144,'Boulemane','BLM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2227,144,'Casablanca','CBL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2228,144,'Chaouen','CHA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2229,144,'El Jadida','EJA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2230,144,'El Kelaa des Sraghna','EKS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2231,144,'Er Rachidia','ERA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2232,144,'Essaouira','ESS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2233,144,'Fes','FES',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2234,144,'Figuig','FIG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2235,144,'Guelmim','GLM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2236,144,'Ifrane','IFR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2237,144,'Kenitra','KEN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2238,144,'Khemisset','KHM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2239,144,'Khenifra','KHN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2240,144,'Khouribga','KHO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2241,144,'Laayoune','LYN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2242,144,'Larache','LAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2243,144,'Marrakech','MRK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2244,144,'Meknes','MKN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2245,144,'Nador','NAD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2246,144,'Ouarzazate','ORZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2247,144,'Oujda','OUJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2248,144,'Rabat-Sale','RSA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2249,144,'Safi','SAF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2250,144,'Settat','SET',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2251,144,'Sidi Kacem','SKA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2252,144,'Tangier','TGR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2253,144,'Tan-Tan','TAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2254,144,'Taounate','TAO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2255,144,'Taroudannt','TRD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2256,144,'Tata','TAT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2257,144,'Taza','TAZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2258,144,'Tetouan','TET',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2259,144,'Tiznit','TIZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2260,144,'Ad Dakhla','ADK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2261,144,'Boujdour','BJD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2262,144,'Es Smara','ESM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2263,145,'Cabo Delgado','CD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2264,145,'Gaza','GZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2265,145,'Inhambane','IN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2266,145,'Manica','MN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2267,145,'Maputo (city)','MC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2268,145,'Maputo','MP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2269,145,'Nampula','NA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2270,145,'Niassa','NI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2271,145,'Sofala','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2272,145,'Tete','TE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2273,145,'Zambezia','ZA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2274,146,'Ayeyarwady','AY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2275,146,'Bago','BG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2276,146,'Magway','MG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2277,146,'Mandalay','MD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2278,146,'Sagaing','SG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2279,146,'Tanintharyi','TN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2280,146,'Yangon','YG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2281,146,'Chin State','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2282,146,'Kachin State','KC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2283,146,'Kayah State','KH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2284,146,'Kayin State','KN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2285,146,'Mon State','MN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2286,146,'Rakhine State','RK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2287,146,'Shan State','SH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2288,147,'Caprivi','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2289,147,'Erongo','ER',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2290,147,'Hardap','HA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2291,147,'Karas','KR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2292,147,'Kavango','KV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2293,147,'Khomas','KH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2294,147,'Kunene','KU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2295,147,'Ohangwena','OW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2296,147,'Omaheke','OK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2297,147,'Omusati','OT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2298,147,'Oshana','ON',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2299,147,'Oshikoto','OO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2300,147,'Otjozondjupa','OJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2301,148,'Aiwo','AO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2302,148,'Anabar','AA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2303,148,'Anetan','AT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2304,148,'Anibare','AI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2305,148,'Baiti','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2306,148,'Boe','BO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2307,148,'Buada','BU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2308,148,'Denigomodu','DE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2309,148,'Ewa','EW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2310,148,'Ijuw','IJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2311,148,'Meneng','ME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2312,148,'Nibok','NI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2313,148,'Uaboe','UA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2314,148,'Yaren','YA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2315,149,'Bagmati','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2316,149,'Bheri','BH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2317,149,'Dhawalagiri','DH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2318,149,'Gandaki','GA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2319,149,'Janakpur','JA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2320,149,'Karnali','KA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2321,149,'Kosi','KO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2322,149,'Lumbini','LU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2323,149,'Mahakali','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2324,149,'Mechi','ME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2325,149,'Narayani','NA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2326,149,'Rapti','RA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2327,149,'Sagarmatha','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2328,149,'Seti','SE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2329,150,'Drenthe','DR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2330,150,'Flevoland','FL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2331,150,'Friesland','FR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2332,150,'Gelderland','GE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2333,150,'Groningen','GR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2334,150,'Limburg','LI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2335,150,'Noord-Brabant','NB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2336,150,'Noord-Holland','NH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2337,150,'Overijssel','OV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2338,150,'Utrecht','UT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2339,150,'Zeeland','ZE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2340,150,'Zuid-Holland','ZH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2341,152,'Iles Loyaute','L',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2342,152,'Nord','N',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2343,152,'Sud','S',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2344,153,'Auckland','AUK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2345,153,'Bay of Plenty','BOP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2346,153,'Canterbury','CAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2347,153,'Coromandel','COR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2348,153,'Gisborne','GIS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2349,153,'Fiordland','FIO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2350,153,'Hawke\'s Bay','HKB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2351,153,'Marlborough','MBH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2352,153,'Manawatu-Wanganui','MWT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2353,153,'Mt Cook-Mackenzie','MCM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2354,153,'Nelson','NSN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2355,153,'Northland','NTL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2356,153,'Otago','OTA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2357,153,'Southland','STL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2358,153,'Taranaki','TKI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2359,153,'Wellington','WGN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2360,153,'Waikato','WKO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2361,153,'Wairarapa','WAI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2362,153,'West Coast','WTC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2363,154,'Atlantico Norte','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2364,154,'Atlantico Sur','AS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2365,154,'Boaco','BO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2366,154,'Carazo','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2367,154,'Chinandega','CI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2368,154,'Chontales','CO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2369,154,'Esteli','ES',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2370,154,'Granada','GR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2371,154,'Jinotega','JI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2372,154,'Leon','LE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2373,154,'Madriz','MD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2374,154,'Managua','MN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2375,154,'Masaya','MS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2376,154,'Matagalpa','MT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2377,154,'Nuevo Segovia','NS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2378,154,'Rio San Juan','RS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2379,154,'Rivas','RI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2380,155,'Agadez','AG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2381,155,'Diffa','DF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2382,155,'Dosso','DS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2383,155,'Maradi','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2384,155,'Niamey','NM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2385,155,'Tahoua','TH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2386,155,'Tillaberi','TL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2387,155,'Zinder','ZD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2388,156,'Abia','AB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2389,156,'Abuja Federal Capital Territory','CT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2390,156,'Adamawa','AD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2391,156,'Akwa Ibom','AK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2392,156,'Anambra','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2393,156,'Bauchi','BC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2394,156,'Bayelsa','BY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2395,156,'Benue','BN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2396,156,'Borno','BO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2397,156,'Cross River','CR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2398,156,'Delta','DE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2399,156,'Ebonyi','EB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2400,156,'Edo','ED',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2401,156,'Ekiti','EK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2402,156,'Enugu','EN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2403,156,'Gombe','GO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2404,156,'Imo','IM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2405,156,'Jigawa','JI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2406,156,'Kaduna','KD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2407,156,'Kano','KN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2408,156,'Katsina','KT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2409,156,'Kebbi','KE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2410,156,'Kogi','KO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2411,156,'Kwara','KW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2412,156,'Lagos','LA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2413,156,'Nassarawa','NA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2414,156,'Niger','NI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2415,156,'Ogun','OG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2416,156,'Ondo','ONG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2417,156,'Osun','OS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2418,156,'Oyo','OY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2419,156,'Plateau','PL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2420,156,'Rivers','RI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2421,156,'Sokoto','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2422,156,'Taraba','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2423,156,'Yobe','YO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2424,156,'Zamfara','ZA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2425,159,'Northern Islands','N',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2426,159,'Rota','R',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2427,159,'Saipan','S',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2428,159,'Tinian','T',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2429,160,'Akershus','AK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2430,160,'Aust-Agder','AA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2431,160,'Buskerud','BU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2432,160,'Finnmark','FM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2433,160,'Hedmark','HM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2434,160,'Hordaland','HL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2435,160,'More og Romdal','MR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2436,160,'Nord-Trondelag','NT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2437,160,'Nordland','NL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2438,160,'Ostfold','OF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2439,160,'Oppland','OP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2440,160,'Oslo','OL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2441,160,'Rogaland','RL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2442,160,'Sor-Trondelag','ST',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2443,160,'Sogn og Fjordane','SJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2444,160,'Svalbard','SV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2445,160,'Telemark','TM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2446,160,'Troms','TR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2447,160,'Vest-Agder','VA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2448,160,'Vestfold','VF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2449,161,'Ad Dakhiliyah','DA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2450,161,'Al Batinah','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2451,161,'Al Wusta','WU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2452,161,'Ash Sharqiyah','SH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2453,161,'Az Zahirah','ZA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2454,161,'Masqat','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2455,161,'Musandam','MU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2456,161,'Zufar','ZU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2457,162,'Balochistan','B',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2458,162,'Federally Administered Tribal Areas','T',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2459,162,'Islamabad Capital Territory','I',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2460,162,'North-West Frontier','N',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2461,162,'Punjab','P',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2462,162,'Sindh','S',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2463,163,'Aimeliik','AM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2464,163,'Airai','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2465,163,'Angaur','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2466,163,'Hatohobei','HA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2467,163,'Kayangel','KA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2468,163,'Koror','KO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2469,163,'Melekeok','ME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2470,163,'Ngaraard','NA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2471,163,'Ngarchelong','NG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2472,163,'Ngardmau','ND',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2473,163,'Ngatpang','NT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2474,163,'Ngchesar','NC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2475,163,'Ngeremlengui','NR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2476,163,'Ngiwal','NW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2477,163,'Peleliu','PE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2478,163,'Sonsorol','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2479,164,'Bocas del Toro','BT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2480,164,'Chiriqui','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2481,164,'Cocle','CC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2482,164,'Colon','CL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2483,164,'Darien','DA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2484,164,'Herrera','HE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2485,164,'Los Santos','LS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2486,164,'Panama','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2487,164,'San Blas','SB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2488,164,'Veraguas','VG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2489,165,'Bougainville','BV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2490,165,'Central','CE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2491,165,'Chimbu','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2492,165,'Eastern Highlands','EH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2493,165,'East New Britain','EB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2494,165,'East Sepik','ES',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2495,165,'Enga','EN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2496,165,'Gulf','GU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2497,165,'Madang','MD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2498,165,'Manus','MN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2499,165,'Milne Bay','MB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2500,165,'Morobe','MR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2501,165,'National Capital','NC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2502,165,'New Ireland','NI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2503,165,'Northern','NO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2504,165,'Sandaun','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2505,165,'Southern Highlands','SH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2506,165,'Western','WE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2507,165,'Western Highlands','WH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2508,165,'West New Britain','WB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2509,166,'Alto Paraguay','AG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2510,166,'Alto Parana','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2511,166,'Amambay','AM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2512,166,'Asuncion','AS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2513,166,'Boqueron','BO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2514,166,'Caaguazu','CG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2515,166,'Caazapa','CZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2516,166,'Canindeyu','CN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2517,166,'Central','CE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2518,166,'Concepcion','CC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2519,166,'Cordillera','CD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2520,166,'Guaira','GU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2521,166,'Itapua','IT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2522,166,'Misiones','MI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2523,166,'Neembucu','NE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2524,166,'Paraguari','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2525,166,'Presidente Hayes','PH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2526,166,'San Pedro','SP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2527,167,'Amazonas','AM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2528,167,'Ancash','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2529,167,'Apurimac','AP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2530,167,'Arequipa','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2531,167,'Ayacucho','AY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2532,167,'Cajamarca','CJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2533,167,'Callao','CL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2534,167,'Cusco','CU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2535,167,'Huancavelica','HV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2536,167,'Huanuco','HO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2537,167,'Ica','IC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2538,167,'Junin','JU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2539,167,'La Libertad','LD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2540,167,'Lambayeque','LY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2541,167,'Lima','LI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2542,167,'Loreto','LO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2543,167,'Madre de Dios','MD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2544,167,'Moquegua','MO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2545,167,'Pasco','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2546,167,'Piura','PI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2547,167,'Puno','PU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2548,167,'San Martin','SM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2549,167,'Tacna','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2550,167,'Tumbes','TU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2551,167,'Ucayali','UC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2552,168,'Abra','ABR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2553,168,'Agusan del Norte','ANO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2554,168,'Agusan del Sur','ASU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2555,168,'Aklan','AKL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2556,168,'Albay','ALB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2557,168,'Antique','ANT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2558,168,'Apayao','APY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2559,168,'Aurora','AUR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2560,168,'Basilan','BAS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2561,168,'Bataan','BTA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2562,168,'Batanes','BTE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2563,168,'Batangas','BTG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2564,168,'Biliran','BLR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2565,168,'Benguet','BEN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2566,168,'Bohol','BOL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2567,168,'Bukidnon','BUK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2568,168,'Bulacan','BUL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2569,168,'Cagayan','CAG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2570,168,'Camarines Norte','CNO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2571,168,'Camarines Sur','CSU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2572,168,'Camiguin','CAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2573,168,'Capiz','CAP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2574,168,'Catanduanes','CAT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2575,168,'Cavite','CAV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2576,168,'Cebu','CEB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2577,168,'Compostela','CMP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2578,168,'Davao del Norte','DNO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2579,168,'Davao del Sur','DSU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2580,168,'Davao Oriental','DOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2581,168,'Eastern Samar','ESA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2582,168,'Guimaras','GUI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2583,168,'Ifugao','IFU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2584,168,'Ilocos Norte','INO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2585,168,'Ilocos Sur','ISU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2586,168,'Iloilo','ILO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2587,168,'Isabela','ISA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2588,168,'Kalinga','KAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2589,168,'Laguna','LAG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2590,168,'Lanao del Norte','LNO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2591,168,'Lanao del Sur','LSU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2592,168,'La Union','UNI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2593,168,'Leyte','LEY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2594,168,'Maguindanao','MAG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2595,168,'Marinduque','MRN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2596,168,'Masbate','MSB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2597,168,'Mindoro Occidental','MIC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2598,168,'Mindoro Oriental','MIR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2599,168,'Misamis Occidental','MSC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2600,168,'Misamis Oriental','MOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2601,168,'Mountain','MOP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2602,168,'Negros Occidental','NOC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2603,168,'Negros Oriental','NOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2604,168,'North Cotabato','NCT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2605,168,'Northern Samar','NSM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2606,168,'Nueva Ecija','NEC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2607,168,'Nueva Vizcaya','NVZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2608,168,'Palawan','PLW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2609,168,'Pampanga','PMP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2610,168,'Pangasinan','PNG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2611,168,'Quezon','QZN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2612,168,'Quirino','QRN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2613,168,'Rizal','RIZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2614,168,'Romblon','ROM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2615,168,'Samar','SMR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2616,168,'Sarangani','SRG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2617,168,'Siquijor','SQJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2618,168,'Sorsogon','SRS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2619,168,'South Cotabato','SCO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2620,168,'Southern Leyte','SLE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2621,168,'Sultan Kudarat','SKU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2622,168,'Sulu','SLU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2623,168,'Surigao del Norte','SNO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2624,168,'Surigao del Sur','SSU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2625,168,'Tarlac','TAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2626,168,'Tawi-Tawi','TAW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2627,168,'Zambales','ZBL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2628,168,'Zamboanga del Norte','ZNO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2629,168,'Zamboanga del Sur','ZSU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2630,168,'Zamboanga Sibugay','ZSI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2631,170,'Dolnoslaskie','DO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2632,170,'Kujawsko-Pomorskie','KP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2633,170,'Lodzkie','LO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2634,170,'Lubelskie','LL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2635,170,'Lubuskie','LU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2636,170,'Malopolskie','ML',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2637,170,'Mazowieckie','MZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2638,170,'Opolskie','OP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2639,170,'Podkarpackie','PP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2640,170,'Podlaskie','PL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2641,170,'Pomorskie','PM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2642,170,'Slaskie','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2643,170,'Swietokrzyskie','SW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2644,170,'Warminsko-Mazurskie','WM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2645,170,'Wielkopolskie','WP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2646,170,'Zachodniopomorskie','ZA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2647,198,'Saint Pierre','P',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2648,198,'Miquelon','M',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2649,171,'A&ccedil;ores','AC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2650,171,'Aveiro','AV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2651,171,'Beja','BE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2652,171,'Braga','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2653,171,'Bragan&ccedil;a','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2654,171,'Castelo Branco','CB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2655,171,'Coimbra','CO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2656,171,'&Eacute;vora','EV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2657,171,'Faro','FA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2658,171,'Guarda','GU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2659,171,'Leiria','LE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2660,171,'Lisboa','LI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2661,171,'Madeira','ME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2662,171,'Portalegre','PO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2663,171,'Porto','PR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2664,171,'Santar&eacute;m','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2665,171,'Set&uacute;bal','SE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2666,171,'Viana do Castelo','VC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2667,171,'Vila Real','VR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2668,171,'Viseu','VI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2669,173,'Ad Dawhah','DW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2670,173,'Al Ghuwayriyah','GW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2671,173,'Al Jumayliyah','JM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2672,173,'Al Khawr','KR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2673,173,'Al Wakrah','WK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2674,173,'Ar Rayyan','RN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2675,173,'Jarayan al Batinah','JB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2676,173,'Madinat ash Shamal','MS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2677,173,'Umm Sa\'id','UD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2678,173,'Umm Salal','UL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2679,175,'Alba','AB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2680,175,'Arad','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2681,175,'Arges','AG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2682,175,'Bacau','BC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2683,175,'Bihor','BH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2684,175,'Bistrita-Nasaud','BN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2685,175,'Botosani','BT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2686,175,'Brasov','BV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2687,175,'Braila','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2688,175,'Bucuresti','B',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2689,175,'Buzau','BZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2690,175,'Caras-Severin','CS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2691,175,'Calarasi','CL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2692,175,'Cluj','CJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2693,175,'Constanta','CT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2694,175,'Covasna','CV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2695,175,'Dimbovita','DB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2696,175,'Dolj','DJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2697,175,'Galati','GL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2698,175,'Giurgiu','GR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2699,175,'Gorj','GJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2700,175,'Harghita','HR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2701,175,'Hunedoara','HD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2702,175,'Ialomita','IL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2703,175,'Iasi','IS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2704,175,'Ilfov','IF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2705,175,'Maramures','MM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2706,175,'Mehedinti','MH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2707,175,'Mures','MS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2708,175,'Neamt','NT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2709,175,'Olt','OT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2710,175,'Prahova','PH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2711,175,'Satu-Mare','SM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2712,175,'Salaj','SJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2713,175,'Sibiu','SB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2714,175,'Suceava','SV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2715,175,'Teleorman','TR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2716,175,'Timis','TM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2717,175,'Tulcea','TL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2718,175,'Vaslui','VS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2719,175,'Valcea','VL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2720,175,'Vrancea','VN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2721,176,'Abakan','AB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2722,176,'Aginskoye','AG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2723,176,'Anadyr','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2724,176,'Arkahangelsk','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2725,176,'Astrakhan','AS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2726,176,'Barnaul','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2727,176,'Belgorod','BE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2728,176,'Birobidzhan','BI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2729,176,'Blagoveshchensk','BL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2730,176,'Bryansk','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2731,176,'Cheboksary','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2732,176,'Chelyabinsk','CL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2733,176,'Cherkessk','CR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2734,176,'Chita','CI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2735,176,'Dudinka','DU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2736,176,'Elista','EL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2738,176,'Gorno-Altaysk','GA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2739,176,'Groznyy','GR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2740,176,'Irkutsk','IR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2741,176,'Ivanovo','IV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2742,176,'Izhevsk','IZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2743,176,'Kalinigrad','KA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2744,176,'Kaluga','KL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2745,176,'Kasnodar','KS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2746,176,'Kazan','KZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2747,176,'Kemerovo','KE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2748,176,'Khabarovsk','KH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2749,176,'Khanty-Mansiysk','KM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2750,176,'Kostroma','KO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2751,176,'Krasnodar','KR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2752,176,'Krasnoyarsk','KN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2753,176,'Kudymkar','KU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2754,176,'Kurgan','KG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2755,176,'Kursk','KK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2756,176,'Kyzyl','KY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2757,176,'Lipetsk','LI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2758,176,'Magadan','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2759,176,'Makhachkala','MK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2760,176,'Maykop','MY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2761,176,'Moscow','MO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2762,176,'Murmansk','MU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2763,176,'Nalchik','NA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2764,176,'Naryan Mar','NR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2765,176,'Nazran','NZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2766,176,'Nizhniy Novgorod','NI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2767,176,'Novgorod','NO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2768,176,'Novosibirsk','NV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2769,176,'Omsk','OM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2770,176,'Orel','OR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2771,176,'Orenburg','OE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2772,176,'Palana','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2773,176,'Penza','PE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2774,176,'Perm','PR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2775,176,'Petropavlovsk-Kamchatskiy','PK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2776,176,'Petrozavodsk','PT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2777,176,'Pskov','PS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2778,176,'Rostov-na-Donu','RO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2779,176,'Ryazan','RY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2780,176,'Salekhard','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2781,176,'Samara','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2782,176,'Saransk','SR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2783,176,'Saratov','SV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2784,176,'Smolensk','SM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2785,176,'St. Petersburg','SP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2786,176,'Stavropol','ST',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2787,176,'Syktyvkar','SY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2788,176,'Tambov','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2789,176,'Tomsk','TO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2790,176,'Tula','TU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2791,176,'Tura','TR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2792,176,'Tver','TV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2793,176,'Tyumen','TY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2794,176,'Ufa','UF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2795,176,'Ul\'yanovsk','UL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2796,176,'Ulan-Ude','UU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2797,176,'Ust\'-Ordynskiy','US',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2798,176,'Vladikavkaz','VL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2799,176,'Vladimir','VA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2800,176,'Vladivostok','VV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2801,176,'Volgograd','VG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2802,176,'Vologda','VD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2803,176,'Voronezh','VO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2804,176,'Vyatka','VY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2805,176,'Yakutsk','YA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2806,176,'Yaroslavl','YR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2807,176,'Yekaterinburg','YE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2808,176,'Yoshkar-Ola','YO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2809,177,'Butare','BU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2810,177,'Byumba','BY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2811,177,'Cyangugu','CY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2812,177,'Gikongoro','GK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2813,177,'Gisenyi','GS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2814,177,'Gitarama','GT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2815,177,'Kibungo','KG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2816,177,'Kibuye','KY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2817,177,'Kigali Rurale','KR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2818,177,'Kigali-ville','KV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2819,177,'Ruhengeri','RU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2820,177,'Umutara','UM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2821,178,'Christ Church Nichola Town','CCN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2822,178,'Saint Anne Sandy Point','SAS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2823,178,'Saint George Basseterre','SGB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2824,178,'Saint George Gingerland','SGG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2825,178,'Saint James Windward','SJW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2826,178,'Saint John Capesterre','SJC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2827,178,'Saint John Figtree','SJF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2828,178,'Saint Mary Cayon','SMC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2829,178,'Saint Paul Capesterre','CAP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2830,178,'Saint Paul Charlestown','CHA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2831,178,'Saint Peter Basseterre','SPB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2832,178,'Saint Thomas Lowland','STL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2833,178,'Saint Thomas Middle Island','STM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2834,178,'Trinity Palmetto Point','TPP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2835,179,'Anse-la-Raye','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2836,179,'Castries','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2837,179,'Choiseul','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2838,179,'Dauphin','DA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2839,179,'Dennery','DE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2840,179,'Gros-Islet','GI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2841,179,'Laborie','LA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2842,179,'Micoud','MI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2843,179,'Praslin','PR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2844,179,'Soufriere','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2845,179,'Vieux-Fort','VF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2846,180,'Charlotte','C',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2847,180,'Grenadines','R',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2848,180,'Saint Andrew','A',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2849,180,'Saint David','D',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2850,180,'Saint George','G',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2851,180,'Saint Patrick','P',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2852,181,'A\'ana','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2853,181,'Aiga-i-le-Tai','AI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2854,181,'Atua','AT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2855,181,'Fa\'asaleleaga','FA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2856,181,'Gaga\'emauga','GE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2857,181,'Gagaifomauga','GF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2858,181,'Palauli','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2859,181,'Satupa\'itea','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2860,181,'Tuamasaga','TU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2861,181,'Va\'a-o-Fonoti','VF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2862,181,'Vaisigano','VS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2863,182,'Acquaviva','AC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2864,182,'Borgo Maggiore','BM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2865,182,'Chiesanuova','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2866,182,'Domagnano','DO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2867,182,'Faetano','FA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2868,182,'Fiorentino','FI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2869,182,'Montegiardino','MO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2870,182,'Citta di San Marino','SM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2871,182,'Serravalle','SE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2872,183,'Sao Tome','S',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2873,183,'Principe','P',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2874,184,'Al Bahah','BH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2875,184,'Al Hudud ash Shamaliyah','HS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2876,184,'Al Jawf','JF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2877,184,'Al Madinah','MD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2878,184,'Al Qasim','QS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2879,184,'Ar Riyad','RD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2880,184,'Ash Sharqiyah (Eastern)','AQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2881,184,'\'Asir','AS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2882,184,'Ha\'il','HL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2883,184,'Jizan','JZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2884,184,'Makkah','ML',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2885,184,'Najran','NR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2886,184,'Tabuk','TB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2887,185,'Dakar','DA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2888,185,'Diourbel','DI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2889,185,'Fatick','FA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2890,185,'Kaolack','KA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2891,185,'Kolda','KO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2892,185,'Louga','LO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2893,185,'Matam','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2894,185,'Saint-Louis','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2895,185,'Tambacounda','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2896,185,'Thies','TH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2897,185,'Ziguinchor','ZI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2898,186,'Anse aux Pins','AP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2899,186,'Anse Boileau','AB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2900,186,'Anse Etoile','AE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2901,186,'Anse Louis','AL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2902,186,'Anse Royale','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2903,186,'Baie Lazare','BL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2904,186,'Baie Sainte Anne','BS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2905,186,'Beau Vallon','BV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2906,186,'Bel Air','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2907,186,'Bel Ombre','BO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2908,186,'Cascade','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2909,186,'Glacis','GL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2910,186,'Grand\' Anse (on Mahe)','GM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2911,186,'Grand\' Anse (on Praslin)','GP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2912,186,'La Digue','DG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2913,186,'La Riviere Anglaise','RA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2914,186,'Mont Buxton','MB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2915,186,'Mont Fleuri','MF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2916,186,'Plaisance','PL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2917,186,'Pointe La Rue','PR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2918,186,'Port Glaud','PG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2919,186,'Saint Louis','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2920,186,'Takamaka','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2921,187,'Eastern','E',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2922,187,'Northern','N',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2923,187,'Southern','S',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2924,187,'Western','W',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2925,189,'Banskobystrický','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2926,189,'Bratislavský','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2927,189,'Košický','KO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2928,189,'Nitriansky','NI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2929,189,'Prešovský','PR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2930,189,'Trenčiansky','TC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2931,189,'Trnavský','TV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2932,189,'Žilinský','ZI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2933,191,'Central','CE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2934,191,'Choiseul','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2935,191,'Guadalcanal','GC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2936,191,'Honiara','HO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2937,191,'Isabel','IS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2938,191,'Makira','MK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2939,191,'Malaita','ML',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2940,191,'Rennell and Bellona','RB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2941,191,'Temotu','TM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2942,191,'Western','WE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2943,192,'Awdal','AW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2944,192,'Bakool','BK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2945,192,'Banaadir','BN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2946,192,'Bari','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2947,192,'Bay','BY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2948,192,'Galguduud','GA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2949,192,'Gedo','GE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2950,192,'Hiiraan','HI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2951,192,'Jubbada Dhexe','JD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2952,192,'Jubbada Hoose','JH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2953,192,'Mudug','MU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2954,192,'Nugaal','NU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2955,192,'Sanaag','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2956,192,'Shabeellaha Dhexe','SD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2957,192,'Shabeellaha Hoose','SH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2958,192,'Sool','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2959,192,'Togdheer','TO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2960,192,'Woqooyi Galbeed','WG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2961,193,'Eastern Cape','EC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2962,193,'Free State','FS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2963,193,'Gauteng','GT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2964,193,'KwaZulu-Natal','KN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2965,193,'Limpopo','LP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2966,193,'Mpumalanga','MP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2967,193,'North West','NW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2968,193,'Northern Cape','NC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2969,193,'Western Cape','WC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2970,195,'La Coru&ntilde;a','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2971,195,'&Aacute;lava','AL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2972,195,'Albacete','AB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2973,195,'Alicante','AC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2974,195,'Almeria','AM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2975,195,'Asturias','AS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2976,195,'&Aacute;vila','AV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2977,195,'Badajoz','BJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2978,195,'Baleares','IB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2979,195,'Barcelona','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2980,195,'Burgos','BU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2981,195,'C&aacute;ceres','CC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2982,195,'C&aacute;diz','CZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2983,195,'Cantabria','CT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2984,195,'Castell&oacute;n','CL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2985,195,'Ceuta','CE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2986,195,'Ciudad Real','CR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2987,195,'C&oacute;rdoba','CD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2988,195,'Cuenca','CU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2989,195,'Girona','GI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2990,195,'Granada','GD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2991,195,'Guadalajara','GJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2992,195,'Guip&uacute;zcoa','GP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2993,195,'Huelva','HL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2994,195,'Huesca','HS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2995,195,'Ja&eacute;n','JN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2996,195,'La Rioja','RJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2997,195,'Las Palmas','PM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2998,195,'Leon','LE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(2999,195,'Lleida','LL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3000,195,'Lugo','LG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3001,195,'Madrid','MD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3002,195,'Malaga','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3003,195,'Melilla','ML',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3004,195,'Murcia','MU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3005,195,'Navarra','NV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3006,195,'Ourense','OU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3007,195,'Palencia','PL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3008,195,'Pontevedra','PO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3009,195,'Salamanca','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3010,195,'Santa Cruz de Tenerife','SC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3011,195,'Segovia','SG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3012,195,'Sevilla','SV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3013,195,'Soria','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3014,195,'Tarragona','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3015,195,'Teruel','TE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3016,195,'Toledo','TO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3017,195,'Valencia','VC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3018,195,'Valladolid','VD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3019,195,'Vizcaya','VZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3020,195,'Zamora','ZM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3021,195,'Zaragoza','ZR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3022,196,'Central','CE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3023,196,'Eastern','EA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3024,196,'North Central','NC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3025,196,'Northern','NO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3026,196,'North Western','NW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3027,196,'Sabaragamuwa','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3028,196,'Southern','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3029,196,'Uva','UV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3030,196,'Western','WE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3032,197,'Saint Helena','S',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3034,199,'A\'ali an Nil','ANL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3035,199,'Al Bahr al Ahmar','BAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3036,199,'Al Buhayrat','BRT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3037,199,'Al Jazirah','JZR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3038,199,'Al Khartum','KRT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3039,199,'Al Qadarif','QDR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3040,199,'Al Wahdah','WDH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3041,199,'An Nil al Abyad','ANB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3042,199,'An Nil al Azraq','ANZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3043,199,'Ash Shamaliyah','ASH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3044,199,'Bahr al Jabal','BJA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3045,199,'Gharb al Istiwa\'iyah','GIS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3046,199,'Gharb Bahr al Ghazal','GBG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3047,199,'Gharb Darfur','GDA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3048,199,'Gharb Kurdufan','GKU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3049,199,'Janub Darfur','JDA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3050,199,'Janub Kurdufan','JKU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3051,199,'Junqali','JQL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3052,199,'Kassala','KSL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3053,199,'Nahr an Nil','NNL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3054,199,'Shamal Bahr al Ghazal','SBG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3055,199,'Shamal Darfur','SDA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3056,199,'Shamal Kurdufan','SKU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3057,199,'Sharq al Istiwa\'iyah','SIS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3058,199,'Sinnar','SNR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3059,199,'Warab','WRB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3060,200,'Brokopondo','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3061,200,'Commewijne','CM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3062,200,'Coronie','CR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3063,200,'Marowijne','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3064,200,'Nickerie','NI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3065,200,'Para','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3066,200,'Paramaribo','PM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3067,200,'Saramacca','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3068,200,'Sipaliwini','SI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3069,200,'Wanica','WA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3070,202,'Hhohho','H',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3071,202,'Lubombo','L',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3072,202,'Manzini','M',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3073,202,'Shishelweni','S',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3074,203,'Blekinge','K',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3075,203,'Dalarna','W',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3076,203,'Gävleborg','X',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3077,203,'Gotland','I',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3078,203,'Halland','N',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3079,203,'Jämtland','Z',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3080,203,'Jönköping','F',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3081,203,'Kalmar','H',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3082,203,'Kronoberg','G',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3083,203,'Norrbotten','BD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3084,203,'Örebro','T',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3085,203,'Östergötland','E',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3086,203,'Sk&aring;ne','M',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3087,203,'Södermanland','D',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3088,203,'Stockholm','AB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3089,203,'Uppsala','C',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3090,203,'Värmland','S',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3091,203,'Västerbotten','AC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3092,203,'Västernorrland','Y',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3093,203,'Västmanland','U',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3094,203,'Västra Götaland','O',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3095,204,'Aargau','AG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3096,204,'Appenzell Ausserrhoden','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3097,204,'Appenzell Innerrhoden','AI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3098,204,'Basel-Stadt','BS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3099,204,'Basel-Landschaft','BL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3100,204,'Bern','BE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3101,204,'Fribourg','FR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3102,204,'Gen&egrave;ve','GE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3103,204,'Glarus','GL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3104,204,'Graubünden','GR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3105,204,'Jura','JU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3106,204,'Luzern','LU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3107,204,'Neuch&acirc;tel','NE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3108,204,'Nidwald','NW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3109,204,'Obwald','OW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3110,204,'St. Gallen','SG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3111,204,'Schaffhausen','SH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3112,204,'Schwyz','SZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3113,204,'Solothurn','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3114,204,'Thurgau','TG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3115,204,'Ticino','TI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3116,204,'Uri','UR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3117,204,'Valais','VS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3118,204,'Vaud','VD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3119,204,'Zug','ZG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3120,204,'Zürich','ZH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3121,205,'Al Hasakah','HA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3122,205,'Al Ladhiqiyah','LA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3123,205,'Al Qunaytirah','QU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3124,205,'Ar Raqqah','RQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3125,205,'As Suwayda','SU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3126,205,'Dara','DA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3127,205,'Dayr az Zawr','DZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3128,205,'Dimashq','DI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3129,205,'Halab','HL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3130,205,'Hamah','HM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3131,205,'Hims','HI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3132,205,'Idlib','ID',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3133,205,'Rif Dimashq','RD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3134,205,'Tartus','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3135,206,'Chang-hua','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3136,206,'Chia-i','CI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3137,206,'Hsin-chu','HS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3138,206,'Hua-lien','HL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3139,206,'I-lan','IL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3140,206,'Kao-hsiung county','KH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3141,206,'Kin-men','KM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3142,206,'Lien-chiang','LC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3143,206,'Miao-li','ML',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3144,206,'Nan-t\'ou','NT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3145,206,'P\'eng-hu','PH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3146,206,'P\'ing-tung','PT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3147,206,'T\'ai-chung','TG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3148,206,'T\'ai-nan','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3149,206,'T\'ai-pei county','TP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3150,206,'T\'ai-tung','TT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3151,206,'T\'ao-yuan','TY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3152,206,'Yun-lin','YL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3153,206,'Chia-i city','CC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3154,206,'Chi-lung','CL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3155,206,'Hsin-chu','HC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3156,206,'T\'ai-chung','TH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3157,206,'T\'ai-nan','TN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3158,206,'Kao-hsiung city','KC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3159,206,'T\'ai-pei city','TC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3160,207,'Gorno-Badakhstan','GB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3161,207,'Khatlon','KT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3162,207,'Sughd','SU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3163,208,'Arusha','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3164,208,'Dar es Salaam','DS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3165,208,'Dodoma','DO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3166,208,'Iringa','IR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3167,208,'Kagera','KA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3168,208,'Kigoma','KI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3169,208,'Kilimanjaro','KJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3170,208,'Lindi','LN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3171,208,'Manyara','MY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3172,208,'Mara','MR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3173,208,'Mbeya','MB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3174,208,'Morogoro','MO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3175,208,'Mtwara','MT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3176,208,'Mwanza','MW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3177,208,'Pemba North','PN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3178,208,'Pemba South','PS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3179,208,'Pwani','PW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3180,208,'Rukwa','RK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3181,208,'Ruvuma','RV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3182,208,'Shinyanga','SH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3183,208,'Singida','SI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3184,208,'Tabora','TB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3185,208,'Tanga','TN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3186,208,'Zanzibar Central/South','ZC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3187,208,'Zanzibar North','ZN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3188,208,'Zanzibar Urban/West','ZU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3189,209,'Amnat Charoen','Amnat Charoen',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3190,209,'Ang Thong','Ang Thong',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3191,209,'Ayutthaya','Ayutthaya',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3192,209,'Bangkok','Bangkok',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3193,209,'Buriram','Buriram',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3194,209,'Chachoengsao','Chachoengsao',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3195,209,'Chai Nat','Chai Nat',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3196,209,'Chaiyaphum','Chaiyaphum',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3197,209,'Chanthaburi','Chanthaburi',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3198,209,'Chiang Mai','Chiang Mai',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3199,209,'Chiang Rai','Chiang Rai',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3200,209,'Chon Buri','Chon Buri',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3201,209,'Chumphon','Chumphon',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3202,209,'Kalasin','Kalasin',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3203,209,'Kamphaeng Phet','Kamphaeng Phet',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3204,209,'Kanchanaburi','Kanchanaburi',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3205,209,'Khon Kaen','Khon Kaen',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3206,209,'Krabi','Krabi',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3207,209,'Lampang','Lampang',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3208,209,'Lamphun','Lamphun',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3209,209,'Loei','Loei',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3210,209,'Lop Buri','Lop Buri',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3211,209,'Mae Hong Son','Mae Hong Son',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3212,209,'Maha Sarakham','Maha Sarakham',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3213,209,'Mukdahan','Mukdahan',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3214,209,'Nakhon Nayok','Nakhon Nayok',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3215,209,'Nakhon Pathom','Nakhon Pathom',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3216,209,'Nakhon Phanom','Nakhon Phanom',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3217,209,'Nakhon Ratchasima','Nakhon Ratchasima',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3218,209,'Nakhon Sawan','Nakhon Sawan',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3219,209,'Nakhon Si Thammarat','Nakhon Si Thammarat',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3220,209,'Nan','Nan',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3221,209,'Narathiwat','Narathiwat',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3222,209,'Nong Bua Lamphu','Nong Bua Lamphu',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3223,209,'Nong Khai','Nong Khai',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3224,209,'Nonthaburi','Nonthaburi',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3225,209,'Pathum Thani','Pathum Thani',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3226,209,'Pattani','Pattani',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3227,209,'Phangnga','Phangnga',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3228,209,'Phatthalung','Phatthalung',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3229,209,'Phayao','Phayao',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3230,209,'Phetchabun','Phetchabun',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3231,209,'Phetchaburi','Phetchaburi',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3232,209,'Phichit','Phichit',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3233,209,'Phitsanulok','Phitsanulok',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3234,209,'Phrae','Phrae',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3235,209,'Phuket','Phuket',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3236,209,'Prachin Buri','Prachin Buri',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3237,209,'Prachuap Khiri Khan','Prachuap Khiri Khan',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3238,209,'Ranong','Ranong',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3239,209,'Ratchaburi','Ratchaburi',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3240,209,'Rayong','Rayong',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3241,209,'Roi Et','Roi Et',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3242,209,'Sa Kaeo','Sa Kaeo',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3243,209,'Sakon Nakhon','Sakon Nakhon',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3244,209,'Samut Prakan','Samut Prakan',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3245,209,'Samut Sakhon','Samut Sakhon',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3246,209,'Samut Songkhram','Samut Songkhram',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3247,209,'Sara Buri','Sara Buri',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3248,209,'Satun','Satun',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3249,209,'Sing Buri','Sing Buri',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3250,209,'Sisaket','Sisaket',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3251,209,'Songkhla','Songkhla',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3252,209,'Sukhothai','Sukhothai',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3253,209,'Suphan Buri','Suphan Buri',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3254,209,'Surat Thani','Surat Thani',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3255,209,'Surin','Surin',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3256,209,'Tak','Tak',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3257,209,'Trang','Trang',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3258,209,'Trat','Trat',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3259,209,'Ubon Ratchathani','Ubon Ratchathani',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3260,209,'Udon Thani','Udon Thani',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3261,209,'Uthai Thani','Uthai Thani',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3262,209,'Uttaradit','Uttaradit',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3263,209,'Yala','Yala',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3264,209,'Yasothon','Yasothon',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3265,210,'Kara','K',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3266,210,'Plateaux','P',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3267,210,'Savanes','S',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3268,210,'Centrale','C',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3269,210,'Maritime','M',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3270,211,'Atafu','A',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3271,211,'Fakaofo','F',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3272,211,'Nukunonu','N',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3273,212,'Ha\'apai','H',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3274,212,'Tongatapu','T',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3275,212,'Vava\'u','V',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3276,213,'Couva/Tabaquite/Talparo','CT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3277,213,'Diego Martin','DM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3278,213,'Mayaro/Rio Claro','MR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3279,213,'Penal/Debe','PD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3280,213,'Princes Town','PT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3281,213,'Sangre Grande','SG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3282,213,'San Juan/Laventille','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3283,213,'Siparia','SI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3284,213,'Tunapuna/Piarco','TP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3285,213,'Port of Spain','PS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3286,213,'San Fernando','SF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3287,213,'Arima','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3288,213,'Point Fortin','PF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3289,213,'Chaguanas','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3290,213,'Tobago','TO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3291,214,'Ariana','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3292,214,'Beja','BJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3293,214,'Ben Arous','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3294,214,'Bizerte','BI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3295,214,'Gabes','GB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3296,214,'Gafsa','GF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3297,214,'Jendouba','JE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3298,214,'Kairouan','KR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3299,214,'Kasserine','KS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3300,214,'Kebili','KB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3301,214,'Kef','KF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3302,214,'Mahdia','MH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3303,214,'Manouba','MN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3304,214,'Medenine','ME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3305,214,'Monastir','MO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3306,214,'Nabeul','NA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3307,214,'Sfax','SF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3308,214,'Sidi','SD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3309,214,'Siliana','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3310,214,'Sousse','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3311,214,'Tataouine','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3312,214,'Tozeur','TO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3313,214,'Tunis','TU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3314,214,'Zaghouan','ZA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3315,215,'Adana','ADA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3316,215,'Adıyaman','ADI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3317,215,'Afyonkarahisar','AFY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3318,215,'Ağrı','AGR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3319,215,'Aksaray','AKS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3320,215,'Amasya','AMA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3321,215,'Ankara','ANK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3322,215,'Antalya','ANT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3323,215,'Ardahan','ARD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3324,215,'Artvin','ART',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3325,215,'Aydın','AYI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3326,215,'Balıkesir','BAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3327,215,'Bartın','BAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3328,215,'Batman','BAT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3329,215,'Bayburt','BAY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3330,215,'Bilecik','BIL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3331,215,'Bingöl','BIN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3332,215,'Bitlis','BIT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3333,215,'Bolu','BOL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3334,215,'Burdur','BRD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3335,215,'Bursa','BRS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3336,215,'Çanakkale','CKL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3337,215,'Çankırı','CKR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3338,215,'Çorum','COR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3339,215,'Denizli','DEN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3340,215,'Diyarbakır','DIY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3341,215,'Düzce','DUZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3342,215,'Edirne','EDI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3343,215,'Elazığ','ELA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3344,215,'Erzincan','EZC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3345,215,'Erzurum','EZR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3346,215,'Eskişehir','ESK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3347,215,'Gaziantep','GAZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3348,215,'Giresun','GIR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3349,215,'Gümüşhane','GMS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3350,215,'Hakkari','HKR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3351,215,'Hatay','HTY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3352,215,'Iğdır','IGD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3353,215,'Isparta','ISP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3354,215,'İstanbul','IST',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3355,215,'İzmir','IZM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3356,215,'Kahramanmaraş','KAH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3357,215,'Karabük','KRB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3358,215,'Karaman','KRM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3359,215,'Kars','KRS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3360,215,'Kastamonu','KAS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3361,215,'Kayseri','KAY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3362,215,'Kilis','KLS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3363,215,'Kırıkkale','KRK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3364,215,'Kırklareli','KLR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3365,215,'Kırşehir','KRH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3366,215,'Kocaeli','KOC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3367,215,'Konya','KON',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3368,215,'Kütahya','KUT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3369,215,'Malatya','MAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3370,215,'Manisa','MAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3371,215,'Mardin','MAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3372,215,'Mersin','MER',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3373,215,'Muğla','MUG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3374,215,'Muş','MUS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3375,215,'Nevşehir','NEV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3376,215,'Niğde','NIG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3377,215,'Ordu','ORD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3378,215,'Osmaniye','OSM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3379,215,'Rize','RIZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3380,215,'Sakarya','SAK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3381,215,'Samsun','SAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3382,215,'Şanlıurfa','SAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3383,215,'Siirt','SII',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3384,215,'Sinop','SIN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3385,215,'Şırnak','SIR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3386,215,'Sivas','SIV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3387,215,'Tekirdağ','TEL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3388,215,'Tokat','TOK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3389,215,'Trabzon','TRA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3390,215,'Tunceli','TUN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3391,215,'Uşak','USK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3392,215,'Van','VAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3393,215,'Yalova','YAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3394,215,'Yozgat','YOZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3395,215,'Zonguldak','ZON',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3396,216,'Ahal Welayaty','A',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3397,216,'Balkan Welayaty','B',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3398,216,'Dashhowuz Welayaty','D',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3399,216,'Lebap Welayaty','L',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3400,216,'Mary Welayaty','M',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3401,217,'Ambergris Cays','AC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3402,217,'Dellis Cay','DC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3403,217,'French Cay','FC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3404,217,'Little Water Cay','LW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3405,217,'Parrot Cay','RC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3406,217,'Pine Cay','PN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3407,217,'Salt Cay','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3408,217,'Grand Turk','GT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3409,217,'South Caicos','SC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3410,217,'East Caicos','EC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3411,217,'Middle Caicos','MC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3412,217,'North Caicos','NC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3413,217,'Providenciales','PR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3414,217,'West Caicos','WC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3415,218,'Nanumanga','NMG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3416,218,'Niulakita','NLK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3417,218,'Niutao','NTO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3418,218,'Funafuti','FUN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3419,218,'Nanumea','NME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3420,218,'Nui','NUI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3421,218,'Nukufetau','NFT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3422,218,'Nukulaelae','NLL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3423,218,'Vaitupu','VAI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3424,219,'Kalangala','KAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3425,219,'Kampala','KMP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3426,219,'Kayunga','KAY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3427,219,'Kiboga','KIB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3428,219,'Luwero','LUW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3429,219,'Masaka','MAS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3430,219,'Mpigi','MPI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3431,219,'Mubende','MUB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3432,219,'Mukono','MUK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3433,219,'Nakasongola','NKS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3434,219,'Rakai','RAK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3435,219,'Sembabule','SEM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3436,219,'Wakiso','WAK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3437,219,'Bugiri','BUG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3438,219,'Busia','BUS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3439,219,'Iganga','IGA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3440,219,'Jinja','JIN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3441,219,'Kaberamaido','KAB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3442,219,'Kamuli','KML',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3443,219,'Kapchorwa','KPC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3444,219,'Katakwi','KTK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3445,219,'Kumi','KUM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3446,219,'Mayuge','MAY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3447,219,'Mbale','MBA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3448,219,'Pallisa','PAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3449,219,'Sironko','SIR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3450,219,'Soroti','SOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3451,219,'Tororo','TOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3452,219,'Adjumani','ADJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3453,219,'Apac','APC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3454,219,'Arua','ARU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3455,219,'Gulu','GUL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3456,219,'Kitgum','KIT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3457,219,'Kotido','KOT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3458,219,'Lira','LIR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3459,219,'Moroto','MRT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3460,219,'Moyo','MOY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3461,219,'Nakapiripirit','NAK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3462,219,'Nebbi','NEB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3463,219,'Pader','PAD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3464,219,'Yumbe','YUM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3465,219,'Bundibugyo','BUN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3466,219,'Bushenyi','BSH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3467,219,'Hoima','HOI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3468,219,'Kabale','KBL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3469,219,'Kabarole','KAR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3470,219,'Kamwenge','KAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3471,219,'Kanungu','KAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3472,219,'Kasese','KAS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3473,219,'Kibaale','KBA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3474,219,'Kisoro','KIS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3475,219,'Kyenjojo','KYE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3476,219,'Masindi','MSN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3477,219,'Mbarara','MBR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3478,219,'Ntungamo','NTU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3479,219,'Rukungiri','RUK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3480,220,'Cherkas\'ka Oblast\'','71',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3481,220,'Chernihivs\'ka Oblast\'','74',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3482,220,'Chernivets\'ka Oblast\'','77',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3483,220,'Crimea','43',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3484,220,'Dnipropetrovs\'ka Oblast\'','12',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3485,220,'Donets\'ka Oblast\'','14',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3486,220,'Ivano-Frankivs\'ka Oblast\'','26',1,'2017-10-06 10:23:43','2017-10-06 10:23:43');

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`, `date_added`, `date_modified`)
VALUES
	(3487,220,'Khersons\'ka Oblast\'','65',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3488,220,'Khmel\'nyts\'ka Oblast\'','68',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3489,220,'Kirovohrads\'ka Oblast\'','35',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3490,220,'Kyiv','30',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3491,220,'Kyivs\'ka Oblast\'','32',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3492,220,'Luhans\'ka Oblast\'','09',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3493,220,'L\'vivs\'ka Oblast\'','46',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3494,220,'Mykolayivs\'ka Oblast\'','48',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3495,220,'Odes\'ka Oblast\'','51',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3496,220,'Poltavs\'ka Oblast\'','53',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3497,220,'Rivnens\'ka Oblast\'','56',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3498,220,'Sevastopol\'','40',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3499,220,'Sums\'ka Oblast\'','59',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3500,220,'Ternopil\'s\'ka Oblast\'','61',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3501,220,'Vinnyts\'ka Oblast\'','05',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3502,220,'Volyns\'ka Oblast\'','07',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3503,220,'Zakarpats\'ka Oblast\'','21',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3504,220,'Zaporiz\'ka Oblast\'','23',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3505,220,'Zhytomyrs\'ka oblast\'','18',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3506,221,'Abu Dhabi','ADH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3507,221,'\'Ajman','AJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3508,221,'Al Fujayrah','FU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3509,221,'Ash Shariqah','SH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3510,221,'Dubai','DU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3511,221,'R\'as al Khaymah','RK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3512,221,'Umm al Qaywayn','UQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3513,222,'Aberdeen','ABN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3514,222,'Aberdeenshire','ABNS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3515,222,'Anglesey','ANG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3516,222,'Angus','AGS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3517,222,'Argyll and Bute','ARY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3518,222,'Bedfordshire','BEDS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3519,222,'Berkshire','BERKS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3520,222,'Blaenau Gwent','BLA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3521,222,'Bridgend','BRI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3522,222,'Bristol','BSTL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3523,222,'Buckinghamshire','BUCKS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3524,222,'Caerphilly','CAE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3525,222,'Cambridgeshire','CAMBS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3526,222,'Cardiff','CDF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3527,222,'Carmarthenshire','CARM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3528,222,'Ceredigion','CDGN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3529,222,'Cheshire','CHES',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3530,222,'Clackmannanshire','CLACK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3531,222,'Conwy','CON',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3532,222,'Cornwall','CORN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3533,222,'Denbighshire','DNBG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3534,222,'Derbyshire','DERBY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3535,222,'Devon','DVN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3536,222,'Dorset','DOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3537,222,'Dumfries and Galloway','DGL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3538,222,'Dundee','DUND',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3539,222,'Durham','DHM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3540,222,'East Ayrshire','ARYE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3541,222,'East Dunbartonshire','DUNBE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3542,222,'East Lothian','LOTE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3543,222,'East Renfrewshire','RENE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3544,222,'East Riding of Yorkshire','ERYS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3545,222,'East Sussex','SXE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3546,222,'Edinburgh','EDIN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3547,222,'Essex','ESX',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3548,222,'Falkirk','FALK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3549,222,'Fife','FFE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3550,222,'Flintshire','FLINT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3551,222,'Glasgow','GLAS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3552,222,'Gloucestershire','GLOS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3553,222,'Greater London','LDN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3554,222,'Greater Manchester','MCH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3555,222,'Gwynedd','GDD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3556,222,'Hampshire','HANTS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3557,222,'Herefordshire','HWR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3558,222,'Hertfordshire','HERTS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3559,222,'Highlands','HLD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3560,222,'Inverclyde','IVER',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3561,222,'Isle of Wight','IOW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3562,222,'Kent','KNT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3563,222,'Lancashire','LANCS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3564,222,'Leicestershire','LEICS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3565,222,'Lincolnshire','LINCS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3566,222,'Merseyside','MSY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3567,222,'Merthyr Tydfil','MERT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3568,222,'Midlothian','MLOT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3569,222,'Monmouthshire','MMOUTH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3570,222,'Moray','MORAY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3571,222,'Neath Port Talbot','NPRTAL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3572,222,'Newport','NEWPT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3573,222,'Norfolk','NOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3574,222,'North Ayrshire','ARYN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3575,222,'North Lanarkshire','LANN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3576,222,'North Yorkshire','YSN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3577,222,'Northamptonshire','NHM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3578,222,'Northumberland','NLD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3579,222,'Nottinghamshire','NOT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3580,222,'Orkney Islands','ORK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3581,222,'Oxfordshire','OFE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3582,222,'Pembrokeshire','PEM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3583,222,'Perth and Kinross','PERTH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3584,222,'Powys','PWS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3585,222,'Renfrewshire','REN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3586,222,'Rhondda Cynon Taff','RHON',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3587,222,'Rutland','RUT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3588,222,'Scottish Borders','BOR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3589,222,'Shetland Islands','SHET',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3590,222,'Shropshire','SPE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3591,222,'Somerset','SOM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3592,222,'South Ayrshire','ARYS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3593,222,'South Lanarkshire','LANS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3594,222,'South Yorkshire','YSS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3595,222,'Staffordshire','SFD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3596,222,'Stirling','STIR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3597,222,'Suffolk','SFK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3598,222,'Surrey','SRY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3599,222,'Swansea','SWAN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3600,222,'Torfaen','TORF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3601,222,'Tyne and Wear','TWR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3602,222,'Vale of Glamorgan','VGLAM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3603,222,'Warwickshire','WARKS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3604,222,'West Dunbartonshire','WDUN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3605,222,'West Lothian','WLOT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3606,222,'West Midlands','WMD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3607,222,'West Sussex','SXW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3608,222,'West Yorkshire','YSW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3609,222,'Western Isles','WIL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3610,222,'Wiltshire','WLT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3611,222,'Worcestershire','WORCS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3612,222,'Wrexham','WRX',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3613,223,'Alabama','AL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3614,223,'Alaska','AK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3615,223,'American Samoa','AS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3616,223,'Arizona','AZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3617,223,'Arkansas','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3618,223,'Armed Forces Africa','AF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3619,223,'Armed Forces Americas','AA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3620,223,'Armed Forces Canada','AC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3621,223,'Armed Forces Europe','AE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3622,223,'Armed Forces Middle East','AM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3623,223,'Armed Forces Pacific','AP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3624,223,'California','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3625,223,'Colorado','CO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3626,223,'Connecticut','CT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3627,223,'Delaware','DE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3628,223,'District of Columbia','DC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3629,223,'Federated States Of Micronesia','FM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3630,223,'Florida','FL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3631,223,'Georgia','GA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3632,223,'Guam','GU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3633,223,'Hawaii','HI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3634,223,'Idaho','ID',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3635,223,'Illinois','IL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3636,223,'Indiana','IN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3637,223,'Iowa','IA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3638,223,'Kansas','KS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3639,223,'Kentucky','KY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3640,223,'Louisiana','LA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3641,223,'Maine','ME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3642,223,'Marshall Islands','MH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3643,223,'Maryland','MD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3644,223,'Massachusetts','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3645,223,'Michigan','MI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3646,223,'Minnesota','MN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3647,223,'Mississippi','MS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3648,223,'Missouri','MO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3649,223,'Montana','MT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3650,223,'Nebraska','NE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3651,223,'Nevada','NV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3652,223,'New Hampshire','NH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3653,223,'New Jersey','NJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3654,223,'New Mexico','NM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3655,223,'New York','NY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3656,223,'North Carolina','NC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3657,223,'North Dakota','ND',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3658,223,'Northern Mariana Islands','MP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3659,223,'Ohio','OH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3660,223,'Oklahoma','OK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3661,223,'Oregon','OR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3662,223,'Palau','PW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3663,223,'Pennsylvania','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3664,223,'Puerto Rico','PR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3665,223,'Rhode Island','RI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3666,223,'South Carolina','SC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3667,223,'South Dakota','SD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3668,223,'Tennessee','TN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3669,223,'Texas','TX',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3670,223,'Utah','UT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3671,223,'Vermont','VT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3672,223,'Virgin Islands','VI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3673,223,'Virginia','VA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3674,223,'Washington','WA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3675,223,'West Virginia','WV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3676,223,'Wisconsin','WI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3677,223,'Wyoming','WY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3678,224,'Baker Island','BI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3679,224,'Howland Island','HI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3680,224,'Jarvis Island','JI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3681,224,'Johnston Atoll','JA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3682,224,'Kingman Reef','KR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3683,224,'Midway Atoll','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3684,224,'Navassa Island','NI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3685,224,'Palmyra Atoll','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3686,224,'Wake Island','WI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3687,225,'Artigas','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3688,225,'Canelones','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3689,225,'Cerro Largo','CL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3690,225,'Colonia','CO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3691,225,'Durazno','DU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3692,225,'Flores','FS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3693,225,'Florida','FA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3694,225,'Lavalleja','LA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3695,225,'Maldonado','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3696,225,'Montevideo','MO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3697,225,'Paysandu','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3698,225,'Rio Negro','RN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3699,225,'Rivera','RV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3700,225,'Rocha','RO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3701,225,'Salto','SL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3702,225,'San Jose','SJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3703,225,'Soriano','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3704,225,'Tacuarembo','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3705,225,'Treinta y Tres','TT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3706,226,'Andijon','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3707,226,'Buxoro','BU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3708,226,'Farg\'ona','FA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3709,226,'Jizzax','JI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3710,226,'Namangan','NG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3711,226,'Navoiy','NW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3712,226,'Qashqadaryo','QA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3713,226,'Qoraqalpog\'iston Republikasi','QR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3714,226,'Samarqand','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3715,226,'Sirdaryo','SI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3716,226,'Surxondaryo','SU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3717,226,'Toshkent City','TK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3718,226,'Toshkent Region','TO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3719,226,'Xorazm','XO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3720,227,'Malampa','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3721,227,'Penama','PE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3722,227,'Sanma','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3723,227,'Shefa','SH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3724,227,'Tafea','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3725,227,'Torba','TO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3726,229,'Amazonas','AM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3727,229,'Anzoategui','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3728,229,'Apure','AP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3729,229,'Aragua','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3730,229,'Barinas','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3731,229,'Bolivar','BO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3732,229,'Carabobo','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3733,229,'Cojedes','CO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3734,229,'Delta Amacuro','DA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3735,229,'Dependencias Federales','DF',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3736,229,'Distrito Federal','DI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3737,229,'Falcon','FA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3738,229,'Guarico','GU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3739,229,'Lara','LA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3740,229,'Merida','ME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3741,229,'Miranda','MI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3742,229,'Monagas','MO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3743,229,'Nueva Esparta','NE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3744,229,'Portuguesa','PO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3745,229,'Sucre','SU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3746,229,'Tachira','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3747,229,'Trujillo','TR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3748,229,'Vargas','VA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3749,229,'Yaracuy','YA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3750,229,'Zulia','ZU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3751,230,'An Giang','AG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3752,230,'Bac Giang','BG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3753,230,'Bac Kan','BK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3754,230,'Bac Lieu','BL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3755,230,'Bac Ninh','BC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3756,230,'Ba Ria-Vung Tau','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3757,230,'Ben Tre','BN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3758,230,'Binh Dinh','BH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3759,230,'Binh Duong','BU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3760,230,'Binh Phuoc','BP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3761,230,'Binh Thuan','BT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3762,230,'Ca Mau','CM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3763,230,'Can Tho','CT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3764,230,'Cao Bang','CB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3765,230,'Dak Lak','DL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3766,230,'Dak Nong','DG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3767,230,'Da Nang','DN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3768,230,'Dien Bien','DB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3769,230,'Dong Nai','DI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3770,230,'Dong Thap','DT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3771,230,'Gia Lai','GL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3772,230,'Ha Giang','HG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3773,230,'Hai Duong','HD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3774,230,'Hai Phong','HP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3775,230,'Ha Nam','HM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3776,230,'Ha Noi','HI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3777,230,'Ha Tay','HT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3778,230,'Ha Tinh','HH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3779,230,'Hoa Binh','HB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3780,230,'Ho Chi Minh City','HC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3781,230,'Hau Giang','HU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3782,230,'Hung Yen','HY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3783,232,'Saint Croix','C',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3784,232,'Saint John','J',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3785,232,'Saint Thomas','T',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3786,233,'Alo','A',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3787,233,'Sigave','S',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3788,233,'Wallis','W',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3789,235,'Abyan','AB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3790,235,'Adan','AD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3791,235,'Amran','AM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3792,235,'Al Bayda','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3793,235,'Ad Dali','DA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3794,235,'Dhamar','DH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3795,235,'Hadramawt','HD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3796,235,'Hajjah','HJ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3797,235,'Al Hudaydah','HU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3798,235,'Ibb','IB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3799,235,'Al Jawf','JA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3800,235,'Lahij','LA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3801,235,'Ma\'rib','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3802,235,'Al Mahrah','MR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3803,235,'Al Mahwit','MW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3804,235,'Sa\'dah','SD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3805,235,'San\'a','SN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3806,235,'Shabwah','SH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3807,235,'Ta\'izz','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3812,237,'Bas-Congo','BC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3813,237,'Bandundu','BN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3814,237,'Equateur','EQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3815,237,'Katanga','KA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3816,237,'Kasai-Oriental','KE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3817,237,'Kinshasa','KN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3818,237,'Kasai-Occidental','KW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3819,237,'Maniema','MA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3820,237,'Nord-Kivu','NK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3821,237,'Orientale','OR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3822,237,'Sud-Kivu','SK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3823,238,'Central','CE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3824,238,'Copperbelt','CB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3825,238,'Eastern','EA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3826,238,'Luapula','LP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3827,238,'Lusaka','LK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3828,238,'Northern','NO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3829,238,'North-Western','NW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3830,238,'Southern','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3831,238,'Western','WE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3832,239,'Bulawayo','BU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3833,239,'Harare','HA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3834,239,'Manicaland','ML',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3835,239,'Mashonaland Central','MC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3836,239,'Mashonaland East','ME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3837,239,'Mashonaland West','MW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3838,239,'Masvingo','MV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3839,239,'Matabeleland North','MN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3840,239,'Matabeleland South','MS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3841,239,'Midlands','MD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3842,105,'Agrigento','AG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3843,105,'Alessandria','AL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3844,105,'Ancona','AN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3845,105,'Aosta','AO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3846,105,'Arezzo','AR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3847,105,'Ascoli Piceno','AP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3848,105,'Asti','AT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3849,105,'Avellino','AV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3850,105,'Bari','BA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3851,105,'Belluno','BL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3852,105,'Benevento','BN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3853,105,'Bergamo','BG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3854,105,'Biella','BI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3855,105,'Bologna','BO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3856,105,'Bolzano','BZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3857,105,'Brescia','BS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3858,105,'Brindisi','BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3859,105,'Cagliari','CA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3860,105,'Caltanissetta','CL',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3861,105,'Campobasso','CB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3863,105,'Caserta','CE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3864,105,'Catania','CT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3865,105,'Catanzaro','CZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3866,105,'Chieti','CH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3867,105,'Como','CO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3868,105,'Cosenza','CS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3869,105,'Cremona','CR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3870,105,'Crotone','KR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3871,105,'Cuneo','CN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3872,105,'Enna','EN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3873,105,'Ferrara','FE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3874,105,'Firenze','FI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3875,105,'Foggia','FG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3876,105,'Forli-Cesena','FC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3877,105,'Frosinone','FR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3878,105,'Genova','GE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3879,105,'Gorizia','GO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3880,105,'Grosseto','GR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3881,105,'Imperia','IM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3882,105,'Isernia','IS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3883,105,'L&#39;Aquila','AQ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3884,105,'La Spezia','SP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3885,105,'Latina','LT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3886,105,'Lecce','LE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3887,105,'Lecco','LC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3888,105,'Livorno','LI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3889,105,'Lodi','LO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3890,105,'Lucca','LU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3891,105,'Macerata','MC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3892,105,'Mantova','MN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3893,105,'Massa-Carrara','MS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3894,105,'Matera','MT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3896,105,'Messina','ME',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3897,105,'Milano','MI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3898,105,'Modena','MO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3899,105,'Napoli','NA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3900,105,'Novara','NO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3901,105,'Nuoro','NU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3904,105,'Oristano','OR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3905,105,'Padova','PD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3906,105,'Palermo','PA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3907,105,'Parma','PR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3908,105,'Pavia','PV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3909,105,'Perugia','PG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3910,105,'Pesaro e Urbino','PU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3911,105,'Pescara','PE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3912,105,'Piacenza','PC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3913,105,'Pisa','PI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3914,105,'Pistoia','PT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3915,105,'Pordenone','PN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3916,105,'Potenza','PZ',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3917,105,'Prato','PO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3918,105,'Ragusa','RG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3919,105,'Ravenna','RA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3920,105,'Reggio Calabria','RC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3921,105,'Reggio Emilia','RE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3922,105,'Rieti','RI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3923,105,'Rimini','RN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3924,105,'Roma','RM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3925,105,'Rovigo','RO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3926,105,'Salerno','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3927,105,'Sassari','SS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3928,105,'Savona','SV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3929,105,'Siena','SI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3930,105,'Siracusa','SR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3931,105,'Sondrio','SO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3932,105,'Taranto','TA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3933,105,'Teramo','TE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3934,105,'Terni','TR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3935,105,'Torino','TO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3936,105,'Trapani','TP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3937,105,'Trento','TN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3938,105,'Treviso','TV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3939,105,'Trieste','TS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3940,105,'Udine','UD',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3941,105,'Varese','VA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3942,105,'Venezia','VE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3943,105,'Verbano-Cusio-Ossola','VB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3944,105,'Vercelli','VC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3945,105,'Verona','VR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3946,105,'Vibo Valentia','VV',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3947,105,'Vicenza','VI',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3948,105,'Viterbo','VT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3949,222,'County Antrim','ANT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3950,222,'County Armagh','ARM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3951,222,'County Down','DOW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3952,222,'County Fermanagh','FER',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3953,222,'County Londonderry','LDY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3954,222,'County Tyrone','TYR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3955,222,'Cumbria','CMA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3956,190,'Pomurska','1',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3957,190,'Podravska','2',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3958,190,'Koroška','3',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3959,190,'Savinjska','4',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3960,190,'Zasavska','5',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3961,190,'Spodnjeposavska','6',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3962,190,'Jugovzhodna Slovenija','7',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3963,190,'Osrednjeslovenska','8',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3964,190,'Gorenjska','9',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3965,190,'Notranjsko-kraška','10',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3966,190,'Goriška','11',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3967,190,'Obalno-kraška','12',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3968,33,'Ruse','',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3969,101,'Alborz','ALB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3970,21,'Brussels-Capital Region','BRU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3971,138,'Aguascalientes','AG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3973,242,'Andrijevica','01',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3974,242,'Bar','02',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3975,242,'Berane','03',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3976,242,'Bijelo Polje','04',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3977,242,'Budva','05',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3978,242,'Cetinje','06',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3979,242,'Danilovgrad','07',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3980,242,'Herceg-Novi','08',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3981,242,'Kolašin','09',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3982,242,'Kotor','10',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3983,242,'Mojkovac','11',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3984,242,'Nikšić','12',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3985,242,'Plav','13',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3986,242,'Pljevlja','14',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3987,242,'Plužine','15',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3988,242,'Podgorica','16',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3989,242,'Rožaje','17',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3990,242,'Šavnik','18',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3991,242,'Tivat','19',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3992,242,'Ulcinj','20',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3993,242,'Žabljak','21',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3994,243,'Belgrade','00',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3995,243,'North Bačka','01',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3996,243,'Central Banat','02',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3997,243,'North Banat','03',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3998,243,'South Banat','04',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(3999,243,'West Bačka','05',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4000,243,'South Bačka','06',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4001,243,'Srem','07',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4002,243,'Mačva','08',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4003,243,'Kolubara','09',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4004,243,'Podunavlje','10',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4005,243,'Braničevo','11',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4006,243,'Šumadija','12',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4007,243,'Pomoravlje','13',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4008,243,'Bor','14',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4009,243,'Zaječar','15',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4010,243,'Zlatibor','16',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4011,243,'Moravica','17',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4012,243,'Raška','18',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4013,243,'Rasina','19',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4014,243,'Nišava','20',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4015,243,'Toplica','21',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4016,243,'Pirot','22',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4017,243,'Jablanica','23',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4018,243,'Pčinja','24',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4020,245,'Bonaire','BO',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4021,245,'Saba','SA',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4022,245,'Sint Eustatius','SE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4023,248,'Central Equatoria','EC',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4024,248,'Eastern Equatoria','EE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4025,248,'Jonglei','JG',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4026,248,'Lakes','LK',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4027,248,'Northern Bahr el-Ghazal','BN',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4028,248,'Unity','UY',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4029,248,'Upper Nile','NU',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4030,248,'Warrap','WR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4031,248,'Western Bahr el-Ghazal','BW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4032,248,'Western Equatoria','EW',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4035,129,'Putrajaya','MY-16',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4036,117,'Ainaži, Salacgrīvas novads','0661405',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4037,117,'Aizkraukle, Aizkraukles novads','0320201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4038,117,'Aizkraukles novads','0320200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4039,117,'Aizpute, Aizputes novads','0640605',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4040,117,'Aizputes novads','0640600',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4041,117,'Aknīste, Aknīstes novads','0560805',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4042,117,'Aknīstes novads','0560800',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4043,117,'Aloja, Alojas novads','0661007',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4044,117,'Alojas novads','0661000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4045,117,'Alsungas novads','0624200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4046,117,'Alūksne, Alūksnes novads','0360201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4047,117,'Alūksnes novads','0360200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4048,117,'Amatas novads','0424701',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4049,117,'Ape, Apes novads','0360805',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4050,117,'Apes novads','0360800',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4051,117,'Auce, Auces novads','0460805',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4052,117,'Auces novads','0460800',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4053,117,'Ādažu novads','0804400',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4054,117,'Babītes novads','0804900',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4055,117,'Baldone, Baldones novads','0800605',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4056,117,'Baldones novads','0800600',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4057,117,'Baloži, Ķekavas novads','0800807',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4058,117,'Baltinavas novads','0384400',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4059,117,'Balvi, Balvu novads','0380201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4060,117,'Balvu novads','0380200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4061,117,'Bauska, Bauskas novads','0400201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4062,117,'Bauskas novads','0400200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4063,117,'Beverīnas novads','0964700',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4064,117,'Brocēni, Brocēnu novads','0840605',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4065,117,'Brocēnu novads','0840601',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4066,117,'Burtnieku novads','0967101',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4067,117,'Carnikavas novads','0805200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4068,117,'Cesvaine, Cesvaines novads','0700807',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4069,117,'Cesvaines novads','0700800',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4070,117,'Cēsis, Cēsu novads','0420201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4071,117,'Cēsu novads','0420200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4072,117,'Ciblas novads','0684901',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4073,117,'Dagda, Dagdas novads','0601009',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4074,117,'Dagdas novads','0601000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4075,117,'Daugavpils','0050000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4076,117,'Daugavpils novads','0440200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4077,117,'Dobele, Dobeles novads','0460201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4078,117,'Dobeles novads','0460200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4079,117,'Dundagas novads','0885100',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4080,117,'Durbe, Durbes novads','0640807',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4081,117,'Durbes novads','0640801',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4082,117,'Engures novads','0905100',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4083,117,'Ērgļu novads','0705500',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4084,117,'Garkalnes novads','0806000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4085,117,'Grobiņa, Grobiņas novads','0641009',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4086,117,'Grobiņas novads','0641000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4087,117,'Gulbene, Gulbenes novads','0500201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4088,117,'Gulbenes novads','0500200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4089,117,'Iecavas novads','0406400',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4090,117,'Ikšķile, Ikšķiles novads','0740605',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4091,117,'Ikšķiles novads','0740600',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4092,117,'Ilūkste, Ilūkstes novads','0440807',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4093,117,'Ilūkstes novads','0440801',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4094,117,'Inčukalna novads','0801800',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4095,117,'Jaunjelgava, Jaunjelgavas novads','0321007',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4096,117,'Jaunjelgavas novads','0321000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4097,117,'Jaunpiebalgas novads','0425700',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4098,117,'Jaunpils novads','0905700',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4099,117,'Jelgava','0090000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4100,117,'Jelgavas novads','0540200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4101,117,'Jēkabpils','0110000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4102,117,'Jēkabpils novads','0560200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4103,117,'Jūrmala','0130000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4104,117,'Kalnciems, Jelgavas novads','0540211',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4105,117,'Kandava, Kandavas novads','0901211',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4106,117,'Kandavas novads','0901201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4107,117,'Kārsava, Kārsavas novads','0681009',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4108,117,'Kārsavas novads','0681000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4109,117,'Kocēnu novads ,bij. Valmieras)','0960200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4110,117,'Kokneses novads','0326100',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4111,117,'Krāslava, Krāslavas novads','0600201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4112,117,'Krāslavas novads','0600202',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4113,117,'Krimuldas novads','0806900',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4114,117,'Krustpils novads','0566900',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4115,117,'Kuldīga, Kuldīgas novads','0620201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4116,117,'Kuldīgas novads','0620200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4117,117,'Ķeguma novads','0741001',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4118,117,'Ķegums, Ķeguma novads','0741009',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4119,117,'Ķekavas novads','0800800',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4120,117,'Lielvārde, Lielvārdes novads','0741413',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4121,117,'Lielvārdes novads','0741401',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4122,117,'Liepāja','0170000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4123,117,'Limbaži, Limbažu novads','0660201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4124,117,'Limbažu novads','0660200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4125,117,'Līgatne, Līgatnes novads','0421211',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4126,117,'Līgatnes novads','0421200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4127,117,'Līvāni, Līvānu novads','0761211',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4128,117,'Līvānu novads','0761201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4129,117,'Lubāna, Lubānas novads','0701413',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4130,117,'Lubānas novads','0701400',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4131,117,'Ludza, Ludzas novads','0680201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4132,117,'Ludzas novads','0680200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4133,117,'Madona, Madonas novads','0700201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4134,117,'Madonas novads','0700200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4135,117,'Mazsalaca, Mazsalacas novads','0961011',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4136,117,'Mazsalacas novads','0961000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4137,117,'Mālpils novads','0807400',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4138,117,'Mārupes novads','0807600',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4139,117,'Mērsraga novads','0887600',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4140,117,'Naukšēnu novads','0967300',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4141,117,'Neretas novads','0327100',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4142,117,'Nīcas novads','0647900',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4143,117,'Ogre, Ogres novads','0740201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4144,117,'Ogres novads','0740202',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4145,117,'Olaine, Olaines novads','0801009',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4146,117,'Olaines novads','0801000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4147,117,'Ozolnieku novads','0546701',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4148,117,'Pārgaujas novads','0427500',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4149,117,'Pāvilosta, Pāvilostas novads','0641413',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4150,117,'Pāvilostas novads','0641401',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4151,117,'Piltene, Ventspils novads','0980213',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4152,117,'Pļaviņas, Pļaviņu novads','0321413',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4153,117,'Pļaviņu novads','0321400',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4154,117,'Preiļi, Preiļu novads','0760201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4155,117,'Preiļu novads','0760202',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4156,117,'Priekule, Priekules novads','0641615',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4157,117,'Priekules novads','0641600',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4158,117,'Priekuļu novads','0427300',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4159,117,'Raunas novads','0427700',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4160,117,'Rēzekne','0210000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4161,117,'Rēzeknes novads','0780200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4162,117,'Riebiņu novads','0766300',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4163,117,'Rīga','0010000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4164,117,'Rojas novads','0888300',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4165,117,'Ropažu novads','0808400',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4166,117,'Rucavas novads','0648500',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4167,117,'Rugāju novads','0387500',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4168,117,'Rundāles novads','0407700',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4169,117,'Rūjiena, Rūjienas novads','0961615',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4170,117,'Rūjienas novads','0961600',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4171,117,'Sabile, Talsu novads','0880213',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4172,117,'Salacgrīva, Salacgrīvas novads','0661415',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4173,117,'Salacgrīvas novads','0661400',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4174,117,'Salas novads','0568700',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4175,117,'Salaspils novads','0801200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4176,117,'Salaspils, Salaspils novads','0801211',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4177,117,'Saldus novads','0840200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4178,117,'Saldus, Saldus novads','0840201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4179,117,'Saulkrasti, Saulkrastu novads','0801413',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4180,117,'Saulkrastu novads','0801400',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4181,117,'Seda, Strenču novads','0941813',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4182,117,'Sējas novads','0809200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4183,117,'Sigulda, Siguldas novads','0801615',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4184,117,'Siguldas novads','0801601',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4185,117,'Skrīveru novads','0328200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4186,117,'Skrunda, Skrundas novads','0621209',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4187,117,'Skrundas novads','0621200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4188,117,'Smiltene, Smiltenes novads','0941615',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4189,117,'Smiltenes novads','0941600',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4190,117,'Staicele, Alojas novads','0661017',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4191,117,'Stende, Talsu novads','0880215',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4192,117,'Stopiņu novads','0809600',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4193,117,'Strenči, Strenču novads','0941817',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4194,117,'Strenču novads','0941800',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4195,117,'Subate, Ilūkstes novads','0440815',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4196,117,'Talsi, Talsu novads','0880201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4197,117,'Talsu novads','0880200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4198,117,'Tērvetes novads','0468900',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4199,117,'Tukuma novads','0900200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4200,117,'Tukums, Tukuma novads','0900201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4201,117,'Vaiņodes novads','0649300',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4202,117,'Valdemārpils, Talsu novads','0880217',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4203,117,'Valka, Valkas novads','0940201',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4204,117,'Valkas novads','0940200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4205,117,'Valmiera','0250000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4206,117,'Vangaži, Inčukalna novads','0801817',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4207,117,'Varakļāni, Varakļānu novads','0701817',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4208,117,'Varakļānu novads','0701800',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4209,117,'Vārkavas novads','0769101',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4210,117,'Vecpiebalgas novads','0429300',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4211,117,'Vecumnieku novads','0409500',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4212,117,'Ventspils','0270000',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4213,117,'Ventspils novads','0980200',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4214,117,'Viesīte, Viesītes novads','0561815',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4215,117,'Viesītes novads','0561800',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4216,117,'Viļaka, Viļakas novads','0381615',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4217,117,'Viļakas novads','0381600',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4218,117,'Viļāni, Viļānu novads','0781817',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4219,117,'Viļānu novads','0781800',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4220,117,'Zilupe, Zilupes novads','0681817',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4221,117,'Zilupes novads','0681801',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4222,43,'Arica y Parinacota','AP',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4223,43,'Los Rios','LR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4224,220,'Kharkivs\'ka Oblast\'','63',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4225,118,'Beirut','LB-BR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4226,118,'Bekaa','LB-BE',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4227,118,'Mount Lebanon','LB-ML',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4228,118,'Nabatieh','LB-NB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4229,118,'North','LB-NR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4230,118,'South','LB-ST',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4231,99,'Telangana','TS',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4232,44,'Qinghai','QH',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4233,100,'Papua Barat','PB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4234,100,'Sulawesi Barat','SR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4235,100,'Kepulauan Riau','KR',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4236,105,'Barletta-Andria-Trani','BT',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4237,105,'Fermo','FM',1,'2017-10-06 10:23:43','2017-10-06 10:23:43'),
	(4238,105,'Monza Brianza','MB',1,'2017-10-06 10:23:43','2017-10-06 10:23:43');

/*!40000 ALTER TABLE `oc_zone` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oc_zone_to_geo_zone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;

CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oc_zone_to_geo_zone` WRITE;
/*!40000 ALTER TABLE `oc_zone_to_geo_zone` DISABLE KEYS */;

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`)
VALUES
	(1,222,0,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(2,222,3513,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(3,222,3514,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(4,222,3515,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(5,222,3516,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(6,222,3517,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(7,222,3518,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(8,222,3519,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(9,222,3520,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(10,222,3521,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(11,222,3522,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(12,222,3523,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(13,222,3524,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(14,222,3525,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(15,222,3526,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(16,222,3527,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(17,222,3528,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(18,222,3529,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(19,222,3530,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(20,222,3531,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(21,222,3532,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(22,222,3533,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(23,222,3534,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(24,222,3535,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(25,222,3536,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(26,222,3537,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(27,222,3538,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(28,222,3539,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(29,222,3540,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(30,222,3541,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(31,222,3542,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(32,222,3543,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(33,222,3544,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(34,222,3545,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(35,222,3546,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(36,222,3547,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(37,222,3548,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(38,222,3549,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(39,222,3550,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(40,222,3551,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(41,222,3552,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(42,222,3553,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(43,222,3554,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(44,222,3555,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(45,222,3556,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(46,222,3557,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(47,222,3558,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(48,222,3559,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(49,222,3560,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(50,222,3561,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(51,222,3562,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(52,222,3563,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(53,222,3564,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(54,222,3565,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(55,222,3566,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(56,222,3567,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(57,222,3568,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(58,222,3569,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(59,222,3570,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(60,222,3571,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(61,222,3572,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(62,222,3573,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(63,222,3574,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(64,222,3575,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(65,222,3576,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(66,222,3577,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(67,222,3578,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(68,222,3579,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(69,222,3580,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(70,222,3581,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(71,222,3582,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(72,222,3583,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(73,222,3584,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(74,222,3585,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(75,222,3586,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(76,222,3587,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(77,222,3588,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(78,222,3589,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(79,222,3590,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(80,222,3591,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(81,222,3592,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(82,222,3593,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(83,222,3594,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(84,222,3595,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(85,222,3596,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(86,222,3597,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(87,222,3598,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(88,222,3599,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(89,222,3600,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(90,222,3601,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(91,222,3602,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(92,222,3603,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(93,222,3604,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(94,222,3605,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(95,222,3606,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(96,222,3607,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(97,222,3608,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(98,222,3609,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(99,222,3610,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(100,222,3611,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(101,222,3612,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(102,222,3949,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(103,222,3950,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(104,222,3951,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(105,222,3952,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(106,222,3953,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(107,222,3954,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(108,222,3955,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(109,222,3972,3,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `oc_zone_to_geo_zone` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
