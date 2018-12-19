# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 0.0.0.0 (MySQL 5.7.24)
# Database: iboltt_new
# Generation Time: 2018-12-19 02:48:02 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table CategoriesProducts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CategoriesProducts`;

CREATE TABLE `CategoriesProducts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `CategoriesProducts` WRITE;
/*!40000 ALTER TABLE `CategoriesProducts` DISABLE KEYS */;

INSERT INTO `CategoriesProducts` (`id`, `company_id`, `name`, `created_at`, `updated_at`)
VALUES
	(2,6,'Hamburguers','2018-11-10 22:41:26','2018-11-10 22:41:26'),
	(3,6,'Pizzas','2018-11-10 22:42:41','2018-11-10 22:42:41'),
	(4,2,'Gourmet','2018-11-17 23:08:30','2018-11-17 23:08:30'),
	(5,5,'Hamburgueres','2018-11-18 22:41:49','2018-11-18 22:41:49'),
	(6,5,'Especiais da Casa','2018-11-18 22:42:06','2018-11-18 22:42:06'),
	(7,5,'Bebidas','2018-11-18 22:42:18','2018-11-18 22:42:18'),
	(8,6,'Ração para Pets','2018-11-19 20:56:03','2018-11-19 20:56:03'),
	(14,5,'Saladas','2018-12-03 03:19:03','2018-12-03 03:19:03');

/*!40000 ALTER TABLE `CategoriesProducts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Cities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Cities`;

CREATE TABLE `Cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Cities_country_id_foreign_idx` (`country_id`),
  KEY `Cities_state_id_foreign_idx` (`state_id`),
  CONSTRAINT `Cities_country_id_foreign_idx` FOREIGN KEY (`country_id`) REFERENCES `Countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Cities_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `Countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Cities_ibfk_2` FOREIGN KEY (`state_id`) REFERENCES `States` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Cities_state_id_foreign_idx` FOREIGN KEY (`state_id`) REFERENCES `States` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Cities` WRITE;
/*!40000 ALTER TABLE `Cities` DISABLE KEYS */;

INSERT INTO `Cities` (`id`, `name`, `lat`, `lng`, `status`, `created_at`, `updated_at`, `country_id`, `state_id`)
VALUES
	(1,'Recife','-8.0475622','-34.8769643',1,'2017-10-31 15:21:18','2017-10-31 15:21:18',1,1),
	(2,'Olinda','-7.9908056','-34.84162900000001',1,'2017-10-31 18:48:47','2017-10-31 18:48:47',1,1),
	(3,'Jaboatão dos Guararapes','-8.1693806','-34.93705879999999',1,'2017-12-29 14:42:07','2017-12-29 14:42:07',1,1),
	(4,'Paulista','-7.918190200000001','-34.820759699999996',1,'2017-10-31 18:49:56','2017-10-31 18:49:56',1,1),
	(5,'Cabo de Santo Agostinho','-8.2794398','-35.030421899999965',1,'2017-10-31 18:52:02','2017-10-31 18:52:02',1,1),
	(6,'Camaragibe','-8.023920700000001','-34.97846720000001',1,'2017-11-19 15:43:51','2017-11-19 15:43:51',1,1),
	(7,'São Paulo','-23.5505199','-46.63330939999997',1,'2017-11-19 15:44:24','2017-11-19 15:44:24',1,2),
	(8,'Abreu e Lima','-7.901149299999999','-34.898708599999964',1,'2018-02-06 15:43:32','2018-02-06 15:43:32',1,1),
	(9,'Belém','-1.4557794','-48.490196800000035',1,'2018-02-19 16:14:12','2018-02-19 16:14:12',1,3),
	(10,'Caruaru','-8.2849639','-35.970187399999986',1,'2018-04-05 20:31:02','2018-04-05 20:31:02',1,1),
	(11,'São Lourenço da Mata','-8.0075658','-35.02218949999997',1,'2018-04-13 16:00:22','2018-04-13 16:00:22',1,1),
	(12,'Maceió','-9.6498487','-35.708949200000006',1,'2018-05-15 16:07:52','2018-05-15 16:07:52',1,4),
	(13,'Rio Largo','-9.477877699999999','-35.83692689999998',1,'2018-06-09 15:15:46','2018-06-09 15:15:46',1,4),
	(14,'Marechal Deodoro','-9.766957399999999','-35.851086099999975',1,'2018-06-09 15:17:51','2018-06-09 15:17:51',1,4),
	(15,'Barra de Santo Antônio','-9.372019','-35.554842199999996',1,'2018-06-09 15:18:58','2018-06-09 15:18:58',1,4),
	(16,'Satuba','-9.571631799999999','-35.82488839999996',1,'2018-06-09 15:19:15','2018-06-09 15:19:15',1,4),
	(17,'Paripueira','-9.4635594','-35.55229859999997',1,'2018-06-09 15:19:37','2018-06-09 15:19:37',1,4),
	(18,'Barra de São Miguel','-9.834861900000002','-35.88688189999999',1,'2018-06-09 15:20:06','2018-06-09 15:20:06',1,4),
	(19,'Santa Luzia do Norte','-9.6042074','-35.822781099999986',1,'2018-06-09 15:20:34','2018-06-09 15:20:34',1,4),
	(20,'Coqueiro Seco','-9.6380585','-35.799777800000015',1,'2018-06-09 15:21:13','2018-06-09 15:21:13',1,4),
	(23,'Pilar Al','-9.598092399999999','-35.95676479999997',1,'2018-06-09 15:23:04','2018-06-09 15:23:04',1,4),
	(24,'Arapiraca','-9.755571999999999','-36.66395920000002',1,'2018-06-09 15:37:05','2018-06-09 15:37:05',1,4),
	(25,'Palmeira dos Indios','-9.406106','-36.63314330000003',1,'2018-06-09 15:37:42','2018-06-09 15:37:42',1,4),
	(26,'Porto de Galinhas','-8.4844765','-34.99969229999999',1,'2018-06-22 21:45:56','2018-06-22 21:45:56',1,1),
	(27,'Igarassu','-7.8292242','-34.90162040000001',1,'2018-06-22 21:52:28','2018-06-22 21:52:28',1,1),
	(28,'Ipojuca','-8.4627496','-35.0828588',1,'2018-06-22 22:24:34','2018-06-22 22:24:34',1,1),
	(29,'João Pessoa','-7.119495799999999','-34.84501180000001',1,'2018-06-26 12:04:14','2018-06-26 12:04:14',1,5),
	(30,'Bayeux','-7.131552900000001','-34.932277099999965',1,'2018-06-26 12:11:24','2018-06-26 12:11:24',1,5),
	(31,'Cabedelo','-7.0402624','-34.843009800000004',1,'2018-06-26 12:12:37','2018-06-26 12:12:37',1,5),
	(32,'Conde','-7.260824099999999','-34.90778790000002',1,'2018-06-26 12:13:23','2018-06-26 12:13:23',1,5),
	(33,'Lucena','-6.9029848','-34.87508249999996',1,'2018-06-26 12:13:49','2018-06-26 12:13:49',1,5),
	(34,'Santa Rita PB','-7.075819999999999','-34.99475100000001',1,'2018-06-26 12:14:31','2018-06-26 12:14:31',1,5),
	(35,'São Luis','-2.5391099','-44.282904599999995',1,'2018-07-16 22:52:01','2018-07-16 22:52:01',1,6),
	(36,'Porto Velho','-8.761160499999999','-63.90043029999998',1,'2018-07-16 22:52:38','2018-07-16 22:52:38',1,7),
	(37,'Salvador','-12.977749','-38.5016301',1,'2018-07-16 22:53:04','2018-07-16 22:53:04',1,9),
	(38,'Natal','-5.7792569','-35.20091600000001',1,'2018-07-16 22:53:19','2018-07-16 22:53:19',1,8),
	(39,'Fortaleza','-3.7327144','-38.526998100000014',1,'2018-07-16 22:53:39','2018-07-16 22:53:39',1,10),
	(40,'Teresina','-5.0920108','-42.8037597',1,'2018-07-16 22:54:12','2018-07-16 22:54:12',1,11),
	(41,'Aracaju','-10.9472468','-37.07308230000001',1,'2018-07-16 22:54:28','2018-07-16 22:54:28',1,12),
	(42,'Rio Branco','-9.975337399999999','-68.42932139999999',1,'2018-07-18 11:02:34','2018-07-18 11:02:34',1,13),
	(43,'Cruzeiro do Sul','-22.2263651','-54.81623209999998',1,'2018-07-18 11:12:40','2018-07-18 11:12:40',1,13),
	(44,'Macapá','0.0355735','-51.07053500000001',1,'2018-07-18 11:52:16','2018-07-18 11:52:16',1,14),
	(45,'Manaus','-3.1190275','-60.02173140000002',1,'2018-07-18 11:52:35','2018-07-18 11:52:35',1,15),
	(46,'Boa Vista','2.8235098','-60.67583309999998',1,'2018-07-18 11:52:58','2018-07-18 11:52:58',1,16),
	(47,'Palmas','-10.249091','-48.324285799999984',1,'2018-07-18 11:53:14','2018-07-18 11:53:14',1,17),
	(48,'Vitória','-20.2976178','-40.2957768',1,'2018-07-18 11:53:32','2018-07-18 11:53:32',1,18),
	(49,'Belo Horizonte','-19.9172987','-43.93455929999999',1,'2018-07-18 11:53:46','2018-07-18 11:53:46',1,19),
	(50,'Rio de Janeiro','-22.9068467','-43.17289649999998',1,'2018-07-18 11:54:12','2018-07-18 11:54:12',1,20),
	(51,'Curitiba','-25.4808762','-49.30442529999999',1,'2018-07-18 11:54:24','2018-07-18 11:54:24',1,21),
	(52,'Porto Alegre','-30.0346471','-51.217658400000005',1,'2018-07-18 11:54:44','2018-07-18 11:54:44',1,22),
	(53,'Florianopolis','-27.5948698','-48.54821949999996',1,'2018-07-18 11:55:12','2018-07-18 11:55:12',1,23),
	(54,'Brasilia','-15.826691','-47.9218204',1,'2018-07-18 11:55:33','2018-07-18 11:55:33',1,24),
	(55,'Goiania','-16.6868982','-49.264811399999985',1,'2018-07-18 11:56:05','2018-07-18 11:56:05',1,25),
	(56,'Cuiabá','-15.6014109','-56.09789169999999',1,'2018-07-18 11:56:27','2018-07-18 11:56:27',1,26),
	(57,'Campo Grande','-20.4697105','-54.620121100000006',1,'2018-07-18 11:56:43','2018-07-18 11:56:43',1,27),
	(58,'Paudalho','-7.899192200000001','-35.17305829999998',1,'2018-08-06 10:42:26','2018-08-06 10:42:26',1,1),
	(59,'Franca SP','-20.5393288','-47.401343699999984',1,'2018-08-31 17:10:18','2018-08-31 17:10:18',1,2);

/*!40000 ALTER TABLE `Cities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Companies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Companies`;

CREATE TABLE `Companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fantasy` varchar(255) NOT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `socialName` varchar(255) NOT NULL,
  `multiCompany` tinyint(1) DEFAULT NULL,
  `cnpj` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `responsible` varchar(255) NOT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `location` point DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type_company_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `commercialPhone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Companies` WRITE;
/*!40000 ALTER TABLE `Companies` DISABLE KEYS */;

INSERT INTO `Companies` (`id`, `fantasy`, `balance`, `socialName`, `multiCompany`, `cnpj`, `phone`, `responsible`, `zipCode`, `location`, `address`, `number`, `district`, `complement`, `created_at`, `updated_at`, `user_id`, `type_company_id`, `city_id`, `state_id`, `country_id`, `commercialPhone`)
VALUES
	(5,'Burgueria Gourmet',NULL,'Gourmet Burguer ME',NULL,'12345670001890','999995555','Antonio','50050000',NULL,'Av Agamenon Magalhães','1000','Derby','Loja1','2018-11-18 22:38:33','2018-11-18 22:38:33',20,1,1,1,1,'30305050');

/*!40000 ALTER TABLE `Companies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CompaniesCategories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CompaniesCategories`;

CREATE TABLE `CompaniesCategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `CompaniesCategories` WRITE;
/*!40000 ALTER TABLE `CompaniesCategories` DISABLE KEYS */;

INSERT INTO `CompaniesCategories` (`id`, `name`, `company_id`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'PROMOÇÃOOOOOOO!',1,1,'2018-11-08 00:00:00','2018-10-03 00:00:00'),
	(2,'Pratos de Entrada',1,1,'2018-11-08 00:00:00','2018-11-08 00:00:00'),
	(3,'Pizzas',1,1,'2018-11-09 00:00:00','2018-11-09 00:00:00');

/*!40000 ALTER TABLE `CompaniesCategories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CompaniesPayments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CompaniesPayments`;

CREATE TABLE `CompaniesPayments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) unsigned NOT NULL,
  `payment_id` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `CompaniesPayments` WRITE;
/*!40000 ALTER TABLE `CompaniesPayments` DISABLE KEYS */;

INSERT INTO `CompaniesPayments` (`id`, `company_id`, `payment_id`, `created_at`, `updated_at`)
VALUES
	(8,5,1,'2018-12-07 13:32:59','2018-12-07 13:32:59'),
	(9,5,2,'2018-12-08 19:20:19','2018-12-08 19:20:19');

/*!40000 ALTER TABLE `CompaniesPayments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ComplementsProducts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ComplementsProducts`;

CREATE TABLE `ComplementsProducts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `complement_category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ComplementsProducts` WRITE;
/*!40000 ALTER TABLE `ComplementsProducts` DISABLE KEYS */;

INSERT INTO `ComplementsProducts` (`id`, `product_id`, `complement_category_id`, `created_at`, `updated_at`, `status`)
VALUES
	(1,2,11,'2018-11-09 00:00:00','2018-11-09 00:00:00',1),
	(2,2,12,'2018-11-09 00:00:00','2018-11-09 00:00:00',1);

/*!40000 ALTER TABLE `ComplementsProducts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Countries`;

CREATE TABLE `Countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `initials` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Countries_name_unique` (`name`),
  UNIQUE KEY `Countries_initials_unique` (`initials`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Countries` WRITE;
/*!40000 ALTER TABLE `Countries` DISABLE KEYS */;

INSERT INTO `Countries` (`id`, `name`, `lat`, `lng`, `initials`, `created_at`, `updated_at`)
VALUES
	(1,'Brasil','-14.235004','-51.92527999999999','BR','2017-10-31 15:18:39','2017-10-31 15:18:39');

/*!40000 ALTER TABLE `Countries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table DaysWeek
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DaysWeek`;

CREATE TABLE `DaysWeek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `shortname` varchar(3) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `DaysWeek` WRITE;
/*!40000 ALTER TABLE `DaysWeek` DISABLE KEYS */;

INSERT INTO `DaysWeek` (`id`, `name`, `shortname`, `created_at`, `updated_at`)
VALUES
	(1,'SEGUNDA','SEG','2018-11-08 00:00:00','2018-11-08 00:00:00'),
	(2,'TERÇA','TER','2018-11-08 00:00:00','2018-11-08 00:00:00'),
	(3,'QUARTA','QUA','2018-11-08 00:00:00','2018-11-08 00:00:00'),
	(4,'QUINTA','QUI','2018-11-08 00:00:00','2018-11-08 00:00:00'),
	(5,'SEXTA','SEX','2018-11-08 00:00:00','2018-11-08 00:00:00'),
	(6,'SÁBADO','SAB','2018-11-08 00:00:00','2018-11-08 00:00:00'),
	(7,'DOMINGO','DOM','2018-11-08 00:00:00','2018-11-08 00:00:00');

/*!40000 ALTER TABLE `DaysWeek` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table IbolttShopParams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IbolttShopParams`;

CREATE TABLE `IbolttShopParams` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `delivery_time` int(2) NOT NULL,
  `store_is_open` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `IbolttShopParams` WRITE;
/*!40000 ALTER TABLE `IbolttShopParams` DISABLE KEYS */;

INSERT INTO `IbolttShopParams` (`id`, `company_id`, `delivery_time`, `store_is_open`, `created_at`, `updated_at`)
VALUES
	(1,24,90,1,'2018-11-08 00:00:00','2018-11-08 00:00:00');

/*!40000 ALTER TABLE `IbolttShopParams` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Orders`;

CREATE TABLE `Orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `observation` varchar(200) DEFAULT NULL,
  `order_status_id` tinyint(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;

INSERT INTO `Orders` (`id`, `company_id`, `user_id`, `observation`, `order_status_id`, `created_at`, `updated_at`)
VALUES
	(1,2,10,'',1,'2017-10-31 15:18:39','2018-11-09 04:40:21'),
	(2,1,1,'',1,'2018-11-09 04:39:22','2018-12-18 13:06:37'),
	(3,1,1,'',3,'2018-11-11 01:56:28','2018-12-18 13:04:40'),
	(4,1,15,'',4,'2018-11-11 21:11:04','2018-11-11 21:11:04'),
	(5,1,1,NULL,5,'2018-11-28 01:22:46','2018-11-28 01:29:50'),
	(6,1,1,'teste',1,'2018-12-18 13:09:04','2018-12-18 13:09:04');

/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table OrdersPayments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OrdersPayments`;

CREATE TABLE `OrdersPayments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL,
  `payment_id` int(11) unsigned NOT NULL,
  `value` double(10,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `OrdersPayments` WRITE;
/*!40000 ALTER TABLE `OrdersPayments` DISABLE KEYS */;

INSERT INTO `OrdersPayments` (`id`, `order_id`, `payment_id`, `value`, `created_at`, `updated_at`)
VALUES
	(1,1,1,12.00,'2017-10-31 15:18:39','2017-10-31 15:18:39'),
	(2,2,1,20.00,'2018-11-22 00:00:00','2018-11-22 00:00:00'),
	(3,3,2,15.00,'2018-11-22 00:00:00','2018-11-22 00:00:00'),
	(4,5,1,21.00,'2018-11-28 01:22:47','2018-11-28 01:22:47'),
	(5,6,1,21.00,'2018-12-18 13:09:04','2018-12-18 13:09:04');

/*!40000 ALTER TABLE `OrdersPayments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table OrdersProducts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OrdersProducts`;

CREATE TABLE `OrdersProducts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `price` double(10,2) NOT NULL,
  `quantity` mediumint(11) unsigned DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `OrdersProducts` WRITE;
/*!40000 ALTER TABLE `OrdersProducts` DISABLE KEYS */;

INSERT INTO `OrdersProducts` (`id`, `order_id`, `product_id`, `price`, `quantity`, `status`, `created_at`, `updated_at`)
VALUES
	(1,1,1,5.90,NULL,1,'2017-10-31 15:18:39','2017-10-31 15:18:39'),
	(2,1,2,6.50,21,1,'2017-10-31 15:18:39','2017-10-31 15:18:39'),
	(3,2,2,6.50,21,1,'2017-10-31 15:18:39','2017-10-31 15:18:39'),
	(4,3,1,21.21,12,1,'2018-11-11 01:56:28','2018-11-11 01:56:28'),
	(5,5,1,21.21,2,1,'2018-11-28 01:22:46','2018-11-28 01:22:46'),
	(6,6,1,12.50,3,1,'2018-12-18 13:09:04','2018-12-18 13:09:04');

/*!40000 ALTER TABLE `OrdersProducts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table OrdersStatus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OrdersStatus`;

CREATE TABLE `OrdersStatus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `order` tinyint(11) DEFAULT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `OrdersStatus` WRITE;
/*!40000 ALTER TABLE `OrdersStatus` DISABLE KEYS */;

INSERT INTO `OrdersStatus` (`id`, `name`, `order`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Pedido feito',1,'pedido-feito','2018-11-22 09:21:21','2018-11-22 09:21:21'),
	(2,'Em preparação',2,'em-preparacao','2018-11-22 09:21:21','2018-11-22 09:21:21'),
	(3,'Saiu para entrega',3,'saiu-para-entrega','2018-11-22 09:21:21','2018-11-22 09:21:21'),
	(4,'Entregue',4,'entregue','2018-11-22 09:21:21','2018-11-22 09:21:21'),
	(5,'Cancelado',5,'cancelado','2018-11-22 09:21:21','2018-11-22 09:21:21'),
	(6,'NOVO STAUS',7,'novo-staus','2018-12-18 13:20:19','2018-12-18 13:21:09');

/*!40000 ALTER TABLE `OrdersStatus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Payments`;

CREATE TABLE `Payments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `slug` varchar(50) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `Payments` WRITE;
/*!40000 ALTER TABLE `Payments` DISABLE KEYS */;

INSERT INTO `Payments` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'New!','new','2017-10-31 15:18:39','2018-12-18 13:20:51'),
	(2,'Cartão de Crédito (Máquina)','cartao-de-credito-maquina','2017-10-31 15:18:39','2018-12-04 14:28:28');

/*!40000 ALTER TABLE `Payments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Products`;

CREATE TABLE `Products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `category_product_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL,
  `image` longtext NOT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `promoting_active` tinyint(1) DEFAULT NULL,
  `promotional_price` decimal(6,2) DEFAULT NULL,
  `availability_day1` tinyint(1) DEFAULT '1',
  `availability_day2` tinyint(1) DEFAULT '1',
  `availability_day3` tinyint(1) DEFAULT '1',
  `availability_day4` tinyint(1) DEFAULT '1',
  `availability_day5` tinyint(1) DEFAULT '1',
  `availability_day6` tinyint(1) DEFAULT '1',
  `availability_day7` tinyint(1) DEFAULT '1',
  `free_delivery` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;

INSERT INTO `Products` (`id`, `company_id`, `category_product_id`, `name`, `description`, `image`, `price`, `promoting_active`, `promotional_price`, `availability_day1`, `availability_day2`, `availability_day3`, `availability_day4`, `availability_day5`, `availability_day6`, `availability_day7`, `free_delivery`, `status`, `created_at`, `updated_at`)
VALUES
	(1,1,2,'RL','Image test','20181125035854-5bfa1dfec8db1.jpg',9.90,0,0.00,1,1,1,1,1,0,0,0,1,'2018-11-08 00:00:00','2018-11-25 03:58:54'),
	(2,1,3,'Pizza Grande Calabresa','Pizza com queijo, tomate e calabresa. Especialidade da casa','http://www.urolcompletodaimagem/pizza.png',29.90,0,0.00,1,1,1,1,1,1,0,0,1,'2018-11-08 00:00:00','2018-11-08 00:00:00'),
	(3,2,3,'Temaki','Pizza com queijo, tomate e calabresa. Especialidade da casa','http://www.urolcompletodaimagem/pizza.png',29.90,0,0.00,1,1,1,1,1,1,0,0,1,'2018-11-08 00:00:00','2018-11-08 00:00:00'),
	(4,1,NULL,'Name','Description','image',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2018-11-10 03:40:56','2018-11-10 03:40:56'),
	(10,5,6,'X-Picanha','Hamburguer de picanha de 100g, pão grande, queijo e molho especial','20181203035840-5c04a9f0e56aa.jpg',20.00,0,20.99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,'2018-11-19 00:56:46','2018-12-03 04:03:04'),
	(11,5,5,'X-Bacon','Hamburguer bovino, pão, bacon e salada','20181203032926-5c04a316ee863.jpg',12.99,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,'2018-11-19 01:09:28','2018-12-03 03:29:26'),
	(12,5,7,'Coca-cola','Coca-cola em lata 350 ml','20181203032503-5c04a20f87eaf.jpg',4.00,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,'2018-11-19 01:32:59','2018-12-03 03:25:03'),
	(17,2,NULL,'RL','Image test','data:image/jpg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAAAeAAD/4QMfaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzE0MCA3OS4xNjA0NTEsIDIwMTcvMDUvMDYtMDE6MDg6MjEgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkM5RTExMkZBRTg4NzExRThBRkExRDVCMUFDRDQxRjgwIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkM5RTExMkY5RTg4NzExRThBRkExRDVCMUFDRDQxRjgwIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE4IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSIwQzI5MkUyMDY5RjZGMzQ1NjdEMzRCQzIxNTMxREI3NiIgc3RSZWY6ZG9jdW1lbnRJRD0iMEMyOTJFMjA2OUY2RjM0NTY3RDM0QkMyMTUzMURCNzYiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAAQCwsLDAsQDAwQFw8NDxcbFBAQFBsfFxcXFxcfHhca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',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2018-11-25 03:55:18','2018-11-25 03:55:18'),
	(18,1,NULL,'RL','Image test','20181125035743-5bfa1db7eef26.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2018-11-25 03:57:44','2018-11-25 03:57:44'),
	(19,1,NULL,'RL','Image test','20181128191354-5bfee8f25e5d9.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2018-11-28 19:13:54','2018-11-28 19:13:54'),
	(20,1,NULL,'RL','Image test','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2018-11-28 19:16:30','2018-11-28 19:16:30'),
	(21,1,NULL,'RL','Image test','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2018-11-28 19:16:49','2018-11-28 19:16:49'),
	(22,1,NULL,'RL','Image test','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2018-11-28 19:17:15','2018-11-28 19:17:15'),
	(23,1,NULL,'RL','Image test','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2018-11-28 19:17:22','2018-11-28 19:17:22'),
	(24,1,NULL,'RL','Image test','20181128192005-5bfeea6570de8.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2018-11-28 19:20:05','2018-11-28 19:20:05'),
	(25,5,14,'Salada Caesar','Salada Caesar','20181203034722-5c04a74a3392f.jpg',20.00,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,'2018-12-03 03:00:15','2018-12-03 03:47:22');

/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ProductsComplementCategories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ProductsComplementCategories`;

CREATE TABLE `ProductsComplementCategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` longtext,
  `itens_to_select` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ProductsComplementCategories` WRITE;
/*!40000 ALTER TABLE `ProductsComplementCategories` DISABLE KEYS */;

INSERT INTO `ProductsComplementCategories` (`id`, `company_id`, `name`, `description`, `image`, `itens_to_select`, `created_at`, `updated_at`, `status`)
VALUES
	(11,1,'Escolha o tipo de borda',NULL,NULL,1,'2018-11-09 00:00:00','2018-11-09 00:00:00',1),
	(12,1,'Escolha 2 sabores','Será 1 sabor para cada metade.',NULL,2,'2018-11-09 00:00:00','2018-11-09 00:00:00',1);

/*!40000 ALTER TABLE `ProductsComplementCategories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ProductsComplementItens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ProductsComplementItens`;

CREATE TABLE `ProductsComplementItens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complement_category_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `image` longtext NOT NULL,
  `price_to_add` decimal(6,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ProductsComplementItens` WRITE;
/*!40000 ALTER TABLE `ProductsComplementItens` DISABLE KEYS */;

INSERT INTO `ProductsComplementItens` (`id`, `complement_category_id`, `name`, `description`, `image`, `price_to_add`, `created_at`, `updated_at`, `status`)
VALUES
	(1,11,'Sem Borda','','',0.00,'2018-11-09 00:00:00','2018-11-09 00:00:00',1),
	(2,11,'Borda de Catupiri','','',3.90,'2018-11-09 00:00:00','2018-11-09 00:00:00',1),
	(3,11,'Borda de Cheedar','','',4.90,'2018-11-09 00:00:00','2018-11-09 00:00:00',1),
	(4,12,'1/2 Calabresa','','',15.00,'2018-11-09 00:00:00','2018-11-09 00:00:00',1),
	(5,12,'1/2 de Frango com Bacon','','',18.90,'2018-11-09 00:00:00','2018-11-09 00:00:00',1),
	(6,12,'1/2 de Perperoni','','',17.90,'2018-11-09 00:00:00','2018-11-09 00:00:00',1),
	(7,12,'1/2 de Portuguesa','','',15.90,'2018-11-09 00:00:00','2018-11-09 00:00:00',1);

/*!40000 ALTER TABLE `ProductsComplementItens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table States
# ------------------------------------------------------------

DROP TABLE IF EXISTS `States`;

CREATE TABLE `States` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `initials` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `States_name_unique` (`name`),
  KEY `States_country_id_foreign_idx` (`country_id`),
  CONSTRAINT `States_country_id_foreign_idx` FOREIGN KEY (`country_id`) REFERENCES `Countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `States_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `Countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `States` WRITE;
/*!40000 ALTER TABLE `States` DISABLE KEYS */;

INSERT INTO `States` (`id`, `name`, `lat`, `lng`, `initials`, `created_at`, `updated_at`, `country_id`)
VALUES
	(1,'Pernambuco','-8.8137173','-36.95410700000002','PE','2017-10-31 15:19:19','2017-10-31 15:19:19',1),
	(2,'São Paulo','-23.5505199','-46.63330939999997','SP','2017-11-19 15:44:12','2017-11-19 15:44:12',1),
	(3,'Pará','-1.9981271','-54.930615200000034','PA','2018-02-19 16:13:54','2018-02-19 16:13:54',1),
	(4,'Alagoas','-9.5713058','-36.781950499999994','AL','2018-05-15 16:07:27','2018-05-15 16:07:27',1),
	(5,'Paraíba','-7.239960900000001','-36.781950499999994','PB','2018-06-26 12:03:50','2018-06-26 12:03:50',1),
	(6,'Maranhão','-4.9609498','-45.27441590000001','MA','2018-07-16 22:32:40','2018-07-16 22:32:40',1),
	(7,'Rondônia','-11.5057341','-63.580610999999976','RO','2018-07-16 22:33:28','2018-07-16 22:33:28',1),
	(8,'Rio Grande do Norte','-5.402580299999999','-36.95410700000002','RN','2018-07-16 22:34:16','2018-07-16 22:34:16',1),
	(9,'Bahia','-12.579738','-41.70072720000002','BA','2018-07-16 22:35:15','2018-07-16 22:35:15',1),
	(10,'Ceará','-5.4983977','-39.32062410000003','CE','2018-07-16 22:35:33','2018-07-16 22:35:33',1),
	(11,'Piauí','-7.718340100000001','-42.72892359999997','PI','2018-07-16 22:35:58','2018-07-16 22:35:58',1),
	(12,'Sergipe','-10.5740934','-37.3856581','SE','2018-07-16 22:36:42','2018-07-16 22:36:42',1),
	(13,'Acre','-9.0237964','-70.81199529999998','AC','2018-07-18 11:02:09','2018-07-18 11:02:09',1),
	(14,'Amapá','0.9019925','-52.00295649999998','AP','2018-07-18 11:41:56','2018-07-18 11:41:56',1),
	(15,'Amazonas','-3.4168427','-65.85606459999997','AM','2018-07-18 11:42:11','2018-07-18 11:42:11',1),
	(16,'Roraima','2.7375971','-62.075099799999975','RR','2018-07-18 11:42:41','2018-07-18 11:42:41',1),
	(17,'Tocantins','-10.17528','-48.29824740000004','TO','2018-07-18 11:43:03','2018-07-18 11:43:03',1),
	(18,'Espirito Santo','-19.1834229','-40.3088626','ES','2018-07-18 11:48:19','2018-07-18 11:48:19',1),
	(19,'Minas Gerais','-18.512178','-44.5550308','MG','2018-07-18 11:48:34','2018-07-18 11:48:34',1),
	(20,'Rio de Janeiro','-22.9068467','-43.17289649999998','RJ','2018-07-18 11:48:47','2018-07-18 11:48:47',1),
	(21,'Paraná','-25.2520888','-52.02154150000001','PR','2018-07-18 11:49:04','2018-07-18 11:49:04',1),
	(22,'Rio Grande do Sul','-32.0395116','-52.10144500000001','RS','2018-07-18 11:49:22','2018-07-18 11:49:22',1),
	(23,'Santa Catarina','-27.2423392','-50.21885559999998','SC','2018-07-18 11:49:33','2018-07-18 11:49:33',1),
	(24,'Distrito Federal','-15.7997654','-47.864471500000036','DF','2018-07-18 11:50:54','2018-07-18 11:50:54',1),
	(25,'Goiás','-15.8270369','-49.836223700000005','GO','2018-07-18 11:51:08','2018-07-18 11:51:08',1),
	(26,'Mato Grosso','-12.6818712','-56.92109900000003','MT','2018-07-18 11:51:23','2018-07-18 11:51:23',1),
	(27,'Mato Grosso do Sul','-20.7722295','-54.7851531','MS','2018-07-18 11:51:38','2018-07-18 11:51:38',1);

/*!40000 ALTER TABLE `States` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table TypeCompanies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TypeCompanies`;

CREATE TABLE `TypeCompanies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `TypeCompanies` WRITE;
/*!40000 ALTER TABLE `TypeCompanies` DISABLE KEYS */;

INSERT INTO `TypeCompanies` (`id`, `name`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Restaurantes',1,'2017-10-31 15:46:00','2017-10-31 15:46:00'),
	(2,'Conveniências',1,'2018-10-03 00:00:00','2018-10-03 00:00:00'),
	(3,'Lojas',1,'2018-10-03 00:00:00','2018-10-03 00:00:00'),
	(4,'Farmácias',1,'2017-10-31 15:47:47','2017-10-31 15:47:47'),
	(5,'Autopeças',1,'2017-10-31 15:47:53','2017-10-31 15:47:53');

/*!40000 ALTER TABLE `TypeCompanies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table TypeCompaniesCategories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TypeCompaniesCategories`;

CREATE TABLE `TypeCompaniesCategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type_company_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Type_company_id_foreign_idx` (`type_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `TypeCompaniesCategories` WRITE;
/*!40000 ALTER TABLE `TypeCompaniesCategories` DISABLE KEYS */;

INSERT INTO `TypeCompaniesCategories` (`id`, `name`, `type_company_id`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Brasileira',1,1,'2018-10-03 00:00:00','2018-10-03 00:00:00'),
	(2,'Lanches',1,1,'2018-10-03 00:00:00','2018-10-03 00:00:00'),
	(3,'Italiana',1,1,'2018-10-03 00:00:00','2018-10-03 00:00:00'),
	(4,'Japonesa',1,1,'2018-10-03 00:00:00','2018-10-03 00:00:00'),
	(5,'Mexicana',1,1,'2018-10-03 00:00:00','2018-10-03 00:00:00'),
	(6,'Internacional',1,1,'2018-10-03 00:00:00','2018-10-03 00:00:00'),
	(7,'Carnes',1,1,'2018-10-03 00:00:00','2018-10-03 00:00:00'),
	(8,'Pizzas',1,1,'2018-10-03 00:00:00','2018-10-03 00:00:00'),
	(9,'Saudável',1,1,'2018-10-03 00:00:00','2018-10-03 00:00:00');

/*!40000 ALTER TABLE `TypeCompaniesCategories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table TypesUsers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TypesUsers`;

CREATE TABLE `TypesUsers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `TypesUsers` WRITE;
/*!40000 ALTER TABLE `TypesUsers` DISABLE KEYS */;

INSERT INTO `TypesUsers` (`id`, `name`, `alias`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'Usuario','user',1,'2017-10-29 19:54:51','2017-10-29 19:54:51'),
	(2,'Admnistrador','admin',1,'2017-10-29 19:56:20','2017-10-29 19:56:20'),
	(3,'Empresa','empresa',1,'2018-11-17 00:00:00','2018-11-17 00:00:00');

/*!40000 ALTER TABLE `TypesUsers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `token` text,
  `forgot` text,
  `active` text,
  `number` int(11) NOT NULL,
  `ddd` int(11) NOT NULL,
  `ddi` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `master` tinyint(1) DEFAULT '0',
  `avatar` longtext,
  `alias` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `first` tinyint(1) DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `types_user_id` int(11) DEFAULT NULL,
  `stage` int(11) DEFAULT NULL,
  `keyUpload` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Users_email_unique` (`email`),
  KEY `Users_types_user_id_foreign_idx` (`types_user_id`),
  CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`types_user_id`) REFERENCES `TypesUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Users_types_user_id_foreign_idx` FOREIGN KEY (`types_user_id`) REFERENCES `TypesUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;

INSERT INTO `Users` (`id`, `name`, `token`, `forgot`, `active`, `number`, `ddd`, `ddi`, `email`, `master`, `avatar`, `alias`, `password`, `birthday`, `cpf`, `first`, `status`, `created_at`, `updated_at`, `types_user_id`, `stage`, `keyUpload`)
VALUES
	(1,'Administrador','',NULL,NULL,0,0,'00','admin@iboltt.com',1,NULL,'Admin','e10adc3949ba59abbe56e057f20f883e','2017-11-09 00:00:00',NULL,0,1,'2017-11-09 00:00:00','2018-11-17 19:32:35',2,NULL,NULL),
	(6,'PIZZARIA IBOLTT','','','1',988297190,99,'81','luciano.thomaz@gmail.com',0,'iVBORw0KGgoAAAANSUhEUgAAAZAAAAGQCAYAAACAvzbMAAAgAElEQVR4XuydB5ycVbn/f2+b2U0jddN7QgJJQGoIvSiCCkpRERQuqIigfxHutV27oF7R68XGFQXpXmyABUU6CARIIIQQQhJI7wnpuzvzlvP//M7sWSabze6777wzOzs85368QPKWc77vmfOc81QriiIFaUJACAgBISAEukjAEgHSRWJyuRAQAkJACGgCIkBkIggBISAEhEAiAiJAEmGTm4SAEBACQkAEiMwBISAEhIAQSERABEgibHKTEBACQkAIiACROSAEhIAQEAKJCIgASYRNbhICQkAICAERIDIHhIAQEAJCIBEBESCJsMlNQkAICAEhIAJE5oAQEAJCQAgkIiACJBE2uUkICAEhIAREgMgcEAJCQAgIgUQERIAkwiY3CQEhIASEgAgQmQNCQAgIASGQiIAIkETY5CYhIASEgBAQASJzQAgIASEgBBIREAGSCJvcJASEgBAQAiJAZA4IASEgBIRAIgIiQBJhk5uEgBAQAkJABIjMASEgBISAEEhEQARIImxykxAQAkJACIgAkTkgBISAEBACiQiIAEmETW4SAkJACAgBESAyB4SAEBACQiARAREgibDJTUJACAgBISACROaAEBACQkAIJCIgAiQRNrlJCAgBISAERIDIHBACQkAICIFEBESAJMImNwkBISAEhIAIEJkDQkAICAEhkIiACJBE2OQmISAEhIAQEAEic0AICAEhIAQSERABkgib3CQEhIAQEAIiQGQOCAEhIASEQCICIkASYZObhIAQEAJCQASIzAEhIASEgBBIREAESCJscpMQEAJCQAiIAJE5IASEgBAQAokIiABJhE1uEgJCQAgIAREgMgeEgBAQAkIgEQERIImwyU1CQAgIASEgAkTmgBAQAkJACCQiIAIkETa5SQgIASEgBESAyBwQAkJACAiBRAREgCTCJjcJASEgBISACBCZA0JACAgBIZCIgAiQRNjkJiEgBISAEBABInNACAgBISAEEhEQAZIIm9wkBISAEBACIkBkDggBISAEhEAiAiJAEmGTm4SAEBACQkAEiMwBISAEhIAQSERABEgibHKTEBACQkAIiACROSAEhIAQEAKJCIgASYRNbhICQkAICAERIDIHhIAQEAJCIBEBESCJsMlNQkAICAEhIAJE5oAQEAJCQAgkIiACJBE2uUkICAEhIAREgMgcEAJCQAgIgUQERIAkwiY3CQEhIASEgAgQmQNCQAgIASGQiIAIkETY5CYhIASEgBAQASJzQAgIASEgBBIREAGSCJvcJASEgBAQAiJAZA4IASEgBIRAIgIiQBJhk5uEgBAQAkJABIjMASEgBISAEEhEQARIImxykxAQAkJACIgAkTkgBISAEBACiQiIAEmETW4SAkJACAgBESAyB4SAEBACQiARAREgibDJTUJACAgBISACROaAEBACQkAIJCIgAiQRNrlJCAgBISAERIDIHBACQkAICIFEBESAJMImNwkBISAEhIAIEJkDQkAICAEhkIiACJBE2OQmISAEhIAQEAEic0AICAEhIAQSERABkgib3CQEhIAQEAIiQGQOCAEhIASEQCICIkASYZObhIAQEAJCQASIzAEhIASEgBBIREAESCJscpMQEAJCQAiIAJE5IASEgBAQAokIiABJhE1uEgJCQAgIAREgMgeEgBAQAkIgEQERIImwyU1CQAgIASEgAkTmgBAQAkJACCQiIAIkETa5SQgIASEgBESAyBwQAkJACAiBRAREgCTCJjcJASEgBISACBCZA0JACAgBIZCIgAiQRNjkJiEgBISAEBABInNACAgBISAEEhEQAZIIm9wkBISAEBACIkBkDggBISAEhEAiAiJAEmGTm4SAEBACQkAEiMwBISAEhIAQSERABEgibHKTEBACQkAIiACROSAEhIAQEAKJCIgASYRNbhICQkAICAERIDIHhIAQEAJCIBEBESCJsMlNQkAICAEhIAJE5oAQEAJCQAgkIiACJBE2uUkICAEhIAREgMgcEAJCQAgIgUQERIAkwiY3CQEhIASEgAgQmQNCQAgIASGQiIAIkETY5CYhIASEgBAQASJzQAgIASEgBBIREAGSCJvcJASEgBAQAiJAZA4IASEgBIRAIgIiQBJhk5uEgBAQAkJABIjMASEgBISAEEhEQARIImxykxAQAkJACIgAkTkgBISAEBACiQiIAEmETW4SAkJACAgBESAyB4SAEBACQiARAREgibDJTUJACAgBISACROaAEBACQkAIJCIgAiQRNrlJCAgBISAERIDIHBACQkAICIFEBESAJMImNwkBISAEhIAIEJkDQkAICAEhkIiACJBE2OQmISAEhIAQEAEic0AICAEhIAQSERABkgib3CQEhIAQEAI9UoBYoYXIUQAULGXprxhZEfhv/J+KIli2jUjZsPmXQQjl2IhsC05kwbdDeLzSD6C8DO/Wd1qFR0LZhedIEwJCQAgIgX0T6JEChOu8Fhb8FzYKkRCIPIXQUnBCC0pZCMMIjqNgRRHsfJ5SBqjL6JsDO4KrrIKQcXifhcCykQmtNg+X6SMEhIAQEALtEeihAkTBVhYPCzDrfd6KUBdasKIQWLUWK355M1bdchP2awqwXy6ApxQCRAg8G81WBhuydRj7iUsw/hMXQI0bB+UCdqAQuIATRoDjyowRAkJACAiBDgj0SAFCycETSGArhFDI5EMoO0LT8y9i4TkXY8jWbYAK4UUObChEvMpSVHjBVq4+fWTCAIED5DI2dnv9MOaun2HACafCz7pwtApMlFjyyxECQkAIdESgRwoQnjzsyNICxFERrKYA86YfgX6bt6K+eTciW0FpQ4bRcQE2VVXKRmiH+o8pUPjfKuS/RwhcD2sbGjDrlX8h6tNPbCDyuxECQkAIdEKgRwqQkPaPKIAFF9HqlXhjxkz0afYRwYONEL4TwIlcuJGFZi+AHUXIBDYCeIi8ENm8Qi7jwA2VNotYCLUNhMIoZ/fBiBf+CmfKQXCtEKFy4FiUMo5Y1uXnJASEgBAoItAjBQiVUhEU/LnzsfqY09DX8eBHjXCjrFZY0cuqd95GkwfUBYDvFozrvhMi41uw6HVl23BD2lD4Xxl9asmGPgLPReB72O/B/0PfY2dRtMB2svp9nkwdISAEhIAQaCXQMwWIChEsWY8lRxyCQY0Kvu0Dtgs7chBZAeoA5Om2qzy8MagfRn3iYow76kg4AwegcclybHhhDjb+5g6M3tmMyCnYRzJ5IOfSuFJQezXb9dj/9TlQQ4bDUhFC26bMkSYEhIAQEAItBHqkALECHy80TMXQ3TsQ2BaydNMNHTR7PCcEsIIslgzZD6c89xCiYYNhuXWF4A4oqCiAsl0oP8Luxx/Fa+d+DKN9hoI0Q1kurNBGYAfI2jY21O+H6etfQpDJQIUOPDGsyw9HCAgBIdCzTyDbfvQzNH75G7SMg/63dOgNbQoPBdfKIP/lz2H01Z+DXd9bC43IBpSCDipUoWrxsAoR2gre1jz+OnkKjtoVoYlCxM7AifLIeA52BRFw+acw9rprYDkMNnRk6ggBISAEhEBPOYG0elw5PpB34QbNWDpgFOodDwgCLRQYC6KUDzuysfvfPob9b/yRPk3EbVZTM54dfhDG5rciCiP4DuBEDpzQxZu9FKZtXIUga4NOwdKEgBAQAkKgQKDqVViM9KBtg3aKvFLIvrYMKw+ZpeM77EjBsiwtQKiienPgIMxY8QICx4Nt0WYRL5ZDRXnY23ZgyZiD0DvIwaK7L99gB7D47t/fjlFnnApY8Z4nk0sICAEh8HYgUP0CpMWF1g4tBE6AOYefgjEvv1LIeaXeEiBR5GD0vPuhphwGWCFydoi6mH5TAR188y5evfxS9L39T1CuDdu3EbmNgMqi+cCDMW7ug6CyTJoQEAJCQAj0kBMIjRehbWmX2yjMY97IAzF8+/bW78c4Dlo3NmczOHjja4gyvZC3Fep0AsV4aiwdQRI4sDauw6qxB8NTBUO77+bgBh4298rioDeXQdniyCs/HCEgBISAIVD1JxCGbAROBCbftfIKzw4fh1G7m1u/oAVbe94uGdWA45a8DIVm2BYdeVsyLsb51opuuznUN1pY3DAR9WEzImXBpYoMLnb0cjB17TKoehEgcXDKNUJACLw9CFS9AKHvk60K6dYRRHihYTyGNTXt9XWWjRuNY199AZHFVCUFu0hcozc9tAKmeA8dLBo0Cn2b8jrNSSFFfICdbi9MXf86VJ/s22NWyCiFgBAQAjEIVL0A4QkkcgpuuG4uxOzh4zC68a0TiBnjsnFjcOzCuYiUgnIYbc7TQzybhcV7GJ9uWVi63yj0bWyEZTmIaERXLt6sy2L6lqVQrgiQGHNKLhECQuBtQqD6BYgu9OFqIWIHAeYcfDRGLH1jr8/z+tiROG7RCzpnFVOWeDrJVTwBEtEFGBlA+Xi13xj0D3K6ngi9sFw/g+VDB2HmqpcAm8WnpAkBISAEhIC2EkRR9FbK2ipkot14Q1enaw/oyvtfP8e2b3x7r56uGdAPR6x+FcrJaNWTw+jBePIDQeTDthw4O3ZgxehpgJ+HjUjXHLEiG/Z/fw9DL78EiOkWXIUYpUtCQAgIgdQJVL0AoXrJt2w4yodicN+bO7Bm9KS9QOSVjbFbXofdu48WIIwLiXkAYQ1cnYRxxU9uRPaq/0TOYdoS2l485JwAY1e+imDgIEllkvr0kwcKASHQkwlUvQBpD+7CgWPQK9eEuryNvJcvnDbsCKvfcSSOfPJviODAYilbemjR/s6SUrxEl8G1W4pLFeqBFIztIazdPuaOPhAjd+1E3ragoibYYRarBtVh1trVLFMIWJLKpCdPdum7EBAC6RLokQJk+TXXoP4b12v33tBx4bGMrbLR7NpouP9u9DnmeMBlrDpjSHS5dGR14ahC2hNdpdBScCOqxSydtmTdWR9C7oEH0Tt00eRF8CwPkQrR/NELMObG/4GrQm1YlyYEhIAQEAIFAj1SgGDrbiwaPR51foRsISZd57AKXIW8W4+Rj9yDzOGHw6WooMBQ0MkWLVYeVBYyTE+iAN+xkPGBRV+9BvU//RFs5WjvLSe0YcNFo5fD+FUrgf59EDisfhjTqCKzSwgIASHwNiDQIwWICgM8NWoGJm3ZpE8YWlllhVBRBjbyaHLr4P+/yzHlO1/UnzDvegWvLFtRYiIAEyVGsIKtmH/KBzHwxXlaQ8UqhjmPcSSF08v2YSMwfdmLFClasMQ1yr8N5o0MUQgIASHQM08gocph6+NzkTv9PXCDeviuDzdk4B8QIEQvx0EuDLGxT38MPPd9GHfNN6D69UaY9eA2RcDaDXj64gsxcM4CDFAO8vTCggvf2g1P9YKFPAIVouHP98M9bZY+uViRG98oLxNLCAgBIfA2INAjTyB0PHbCEHOGjsOIxhzCUJVWLVAfLixEdh6IesNCMzb3qcOMtSthZSP4yCAT+To/ljQhIAR6AIGIYWCh1k74tg2vJZlFdfc80PWNjKaclVC1xdZShaqolq3XqWoqKtEjBYieBCqPtd+/AflvfxP1SvtRJZ4btvbUcpDz8vACWk4CbHjve3DQH++ApXxYNKgzLjHxG+RGISAEKklAIQfApeJZ20C1D2Zsv/5K9vStdwXscYu9lhoVn0lkwawbHgLGqSmWsAih7Opx5umRAoQxGwzws3I+Fg0ZjgFM9V5COCQnWGGXQlddoNHxMHHjUqC+j05nEloOXC1Bkr/EpJ43/+yeKVraW9vre8RywlIsvjSwPfDuqp/POhFqi8t+FCCyXThVvgPUNU8jBd9R8AILyuLpyUImUIhYEbVFAMZN0VSJadUjBUiICG5YSFky95yPYuTf/smIj8S8eHqJnBD1voOcrTBn7Ci8f/GLOiOvPtuwcq7VYkhP+BYutCx+1RMXXC4WFBLFAqStMAnDUF/DMUqrLgL8Vmk3PtNx6M2Y/rPT6GsU8czhI9T6bk8vvtWzb9/HCBWQt4FMqBCpAM2Ohd56Z2wh70RwLVfHuDn6XFUdrUcKEOJj7LiFEM7mEIsmjETffPKFizl3LSsPBQ/NdgaTXp8PDBkE5TKgUOm0JoUjcPKP1tTUhN69WaO9ZzYuFhQSbJlMBkOGDMEJJ5yAO+64o2cO6G3Say7wo0ePxtq1a1MfMTdD1Xqitja/idknvx993386Dvj2l1u8KKvJetDe5wiglAed3NUKYK9uxLxTTsCBD/wO7rjJsCNudH1dYqJaWo8UIKEVwA2YYLEQEPj8QSdi5KKXUOfWw6cWiulPnAAuI9RjNCeykHNsuGEzlg0ajmNWvUr1aaqNP+BRo0al+sxqeRiFS0NDAxYvXoz6+np9EumJJ61q4Zl2P8pxUnBdF7lcrvwnTqYZatEeUyUVWdpSAEXHGYvxw3Swj3TZaysIEKxfjSdmnogD3tyN3ZaPSStWIBzWq8UOkvKPOu6H0hqMwsU0hut/Z6olbaDhVhg62ln5eTiOC3/JKsw94RSM3L4eOa83Jm5ZDivTB5GT10Z2UWHFBb+v6xS04LDDUKuW7O1bsXrktEK+rDDScR/ZgHrPeALEtyN9VNzpehg170l4kyahNLeuvTvOHxwX1VpuVF9ls1ls374dHK/+wYhKq1s/Oeec+RZpdmTAgAHYtGmT/r7l+sbG1hk40DbInA3UcaEFkHMinVHCDiK4UYhNj/wLb1zwSYxqakJecaGNdGE55scLevWGzUwS3eS/pBBo5UUhrRIN+8z0ndfG8bwKUUc1YGhh0x//grWf+jz657dr4cJUSlv6e5ix7nVoAw7V6FqjVYIqJM1J0GMj0XmUswsBf5xN3JX8fdJ0zFr1JnzbR4jCMTC2yol11wML66dMwsEvPcPNAVwrnvCJ+z34I+Zxv1p1xnHHEfe6H/3oR7jyyitbVRzlWmTi9uftet1tt92GSy65JLXNC78j5/D999+P0047rawqLC1AQhsUIB5zEPGs4YSw+PtneO/uJiz/wc+w9fpfYERjE/IZH65i8aAMclYe+QHDMGHtPNgqU1gP0v1Jx59SUeHMENgUetS/a6W5Votb23Zjxde+gV133o6Gxgh5XhMVCuKpKMSyiRNw3CtzAMcHoixrWmiP0WppPVKFVTBJRLSA6Ah0UFW1eR2Wjz0CbrQT2SiLZpe5ruJhjnisjLIY+cJDUDOmwqEESUnIG6FRjl1gvNF1z1VUY51//vm49dZbWzsgQqSy34Jz7+STT8bjjz+e2ouNADH2sPJ+0wi+5cALC1bPJidAfWDDaszh2Ys+jgEPPQw3oHE80PnsWInUYeyEFSIXAsve9x4cc++d8Kgz4uatmwQIy2xbKoNA21EVXGbB2NmIORdejMEPPQ4n5FpFpyBbn6a0jLEB2v9HPfwA7GMOgdLrHNX2hTIT1dJ6pABhmhGqsJzAgXLo752BHSo8PnYqxm/dDM/3NPC4nCNlY+uYwZjx2stQKgCcTCrywwiPHTt2YODAgdXyzSvaj6uuugrXXXdd2dQcFR1MD3xZ2vYPI0CMAb2sakptHGClUJ498nDXNuPp007GsCVr0SfysUvlUM+8dbaNZo/urjZCu1BdVAUKo1cvgNUwDKET6l19d6l+OAxt7ghDWKvW4alT3osJ6zfpfTAdgaLQ1//GDW/OLcSt0Ms0tBRGbXgDQf8+4BqVUQoR0zGlsjqlM5l7pABpb+hREMJZvQbLDzgIrqoHwiZYdN9r02jEorTPu3lYYR/YVhNykcK4VQsRDG6A4/JwTENV6c0IkMmTJ2PZsmWlP7CHPoHG9QkTJki8SIW+X7HbdblidEqx5+klviUyN6LKRnF37RVy1TGDttYwWLCCPGzLQrBsA5465p2YuGUDLHfv33R7WLc7wAFbVgLZQmqiyCqD8VkH/bEsBBUihbgNLSoKhgp9agpCHx5z7L34Al46/UMYubNRX8co+baNdzHrd6AceAix3e6Fyc2ry6omLHVK1o4A0SrOCE8e9S5MmbcAOYdp2vf+SNRDeiEjy32dJNG28ljZMBqzXn8ekVWPvBuiLrRTOe4ae0ddXR18n7uMt28LgkAESIU+P08JVDHNnj0bxx9/fOq2t5/+9Ke44oorEo+GXpRsrONTqM9DnX8ejvLQZEXIqghWk4U3//lPLLv4CjTktsH2Q1huX1iKGofO2/r9euPQtUsRMf7Dork9feNzYEWFFCksf20pBDbgaddmRo4H8JqbseWmP2LFf34FQ/KBPkXx70PGS9FW06YFFpCJFPKWhYyKsGBYA05ZvrCqT+81I0C4q6GvQ2b1eqwdP6NQD0Tnktmz8QTi2y7ciFdT6ngYsfwVqKGDuJ2A70bwWo7OnU/TeFekrUaI99bquYoL2t13342zzz5bhEgFP8t//Md/gM4MaTWjvqJL+rBhwxI/1gothHr9VLDCUKchsrWNwoHb6GPFt7+DN2/4BYb4jMHS+ivkHYWMr6CceAbkBWNH4d2vvghl5cGiD7YWWvHujT0wri9Mo8QuWoAbKIRuCHfHbrz+H99C7o7fYkCU0zmsfMUAwUI6lYIj1d6bWx7K3IiCiBVYgQG/vQl1Z50hJ5DYH6SkCwOd3oTue8+ffhaGPz67XZWnHbHIFCM9LXhQeGnYMJy0fB6ykad9yvl5fXphpRDsyWP+5s2bS/qxlYSkym42ag+JESnvhzFZD8px8qUQ4WmyNOM5XVhdbVSmoofpO6ydzXjq4xej4R+PoE6rgxx4gY+8VmsVTiu6rELL6aUzgiPnPgdMnUDfJwQO89sZz6fO7uzC37dsNCkC7TAPO5fDK++/CHVPP4c6RbVZHgHq0C+v0Nhi2wgZUR4yUHBvYWbr0tocY4Sc7WL0ojmwx1R37FjNnEAo1lVLLXR712asGHEIXJ+JyPZsOrdMlIdjZbE742L8wtnA8NHwGYxEv3LbKfhrp+CxQTXChz/8Ydx7772puVF2YXpX1aVccHbv3g3PK+iweSqTVh4CJjq8HPYPfrdS1bEFvYAFS4WwN23B0yeegWFrViCbC4AwhOs5UHRl1YeUQiYIrtW+jgeJ98McufF15Pv1hqdcvWGkkErbiK5PEpEPa8NOPH30KRi2brVWUVk6/qxgB2GQMiul1gUMICyMPKKNtV0bCDPuOrARYqfr4sD1y6F615dnkqT01JoRIFp2K2bJ8hCFzXjumLMxfO5jyLgDWFsQvmXDCQuufnnX15ktt0w7BNPnPAgr5ZgP8234Qx40aJBeOEv90aX0vbv1MT//+c9x6aWX6t1rORa3bh1cFb2cfJcuXQo6b6TdvvjFL+J73/teiY9lLIcLRE1Yut8kZIOcjipP3LR3UqQLwjF79manF6Y3rUn8uLg36uSH+RBLBw1B32a64RY0GEmbjqhXHkLHx8a6QThs4yIoN57ATPrOUu+rGQFSiA0J4MNFJgihco14Y/ABqFe7ecAsRICyMJTOGcDKgxEmrVkN1S+TznFjH1/i7W7/KMay3377YevWraXOWbm/EwJUYd18881aWKfdnn76aRx11FElPVYH9dFosGsnVgw9AF6wG8pJnmaEqh+6vBY8rSLMHjwA565aUlIfY90cKex+cTG2HTNLG8W1d1UJAkTbUkD7R4j6r34Ffb/yOXhVlLq9PSY1JEBYsjZAxJNG3kZzRmHFpVei/tab4UZZHaSTCQPG4oBGvK1nnon9f38jHOaWKWX3s4+ZxtMHF8vBgwfHmotJLjJGza7ea3JVdfW+Uq/v27cvtm3bph9Tmg691J7U9v2ce7169UI+n08980Ea3nSFJBER1t1xN4JPXg0POa1ATtoKO3cLoU1jvI1BD92L7LGzkj4u9n0BAuz+5s+w83vfhrI9HQRYcOVN1rRg1Qo7GwOe+AuyM49I2+yfrGMd3FU7AqTo5KjdsLnDye/GvKFTMDjMMY8AXOUjcGzsyjqYumIV1H4U+ZQoqXPVD6QHzBe+8IXUf8TFvU0iRJLckwYhJlrcuXOn5iE2kDSItv8M2t6YMbkcaXNKif8wvdWB5VBYfsEnkP3jX7VhvJQ8VaFF9RWNzwo+HIxe9jKs4UPKB7h1IHnMHjYVI3fuoLUDrop00GPSRk80qti3Z7KYsnkJwky26lW9NSNAAlo/GL3pMGN+iDwceJGFTXf+Ac2fvBT1gYfdmUAnX1tx7jk46q4b4CpGrFOtlXz309FkYfbddevWleWHzPcyPfy73vWuWPOVQoO7/7lz54KR8d0hRPr06aMTLcrpI9YnS3xRc3MzyDqNxb64E+95z3vw17/+tXS3Uu3+auHxYRMxZfuO1mjzxAPWN9qgINlluzhw8wqoeqqmy9uYUmX+iDFo2EVPrwyUHbRk/U32XvqbMZZkY30dDt+4HHBKqXKUrA9dvatmBEi7Aw8CujzgwSPeiQlLFjJsECuGDccJi54GMr10sI/LTG1lcAgqVxbU4nG++93vxt///veufnMdZGaM2Pvvv7+Okk97sWmvU/369dNCrFprSHQZZJXe8OSTT+paLWm3X/ziF7jssstKfqzv5+BGLlYOakBd3kbQ4j6f9MG0azKXnW01Y/GAgTh++SKgLl7Eetx30vE4G0JvUBl5zqA/Z91GrJo0A9nAQ85phBdmdEBh4qZC5Bj4+JHzMPamnyEf+PAy5ReEifvbY7Pxxhxxc9CIOtQBVh5oboYVZhD2pWdgb513Ju8VsneWI7dMJQpIlaKPNrEYXMxffPFFHH744TGpJr/sHe94hz4ByQkkOcM4d5r4jzRVWFQ5sv5HKt5zKsLWJ+ej6V0nQVk0npdmfKYWIbDoKgvYP/8hBn/yotS10roqKQoVA7OMSbSApj/cg+0XXwY/LBSksxlL1uKqG+c7tb2G8Wd8du/f/BS9P/Ih0Dm0XNqRJP1r757aPoFoZw8LTCLgqUKKAKq1mJWTvtaMSg8sN/UDCBfnRx55BDwhpPkj3mvC+X5iW0Lb8izFQPAAACAASURBVLTlqlpX3OdXX30VU6ZMSWvupvacuCeitt+yrSCM+5zUOt7Og8phXzLjNBl4S+6/FWDLFd9C469/rt1W+VssxfjMEwHVVypy0TD3EbgzpqWvlKZ9gylImJqdBets4O8j98fMzVu03cW2CkWt6E6ctLnKwk7HxaS1i5Ab0A8eU7qkP5Kk3Wv3vpoWIEyiRlGh6GnVkq+mECVIwcHcbTZs5qQp5di5jx/xAQccoCv0lauxcFNjY2Nqu/ldu3ahf//+ZVVlcQGqltOH6Yup9V6cgJDfzJzQivtbLECKr+c1jPPp7iJa7JMxoKc976ZPn4558+alcwIJc3hqyGSMbtqtEw3SI6s043OhKuE2L4sDNy9FlMm2BPOlRyHSAoI5rCz4VGMFPhb1HYuB9LzSySELRe5Kcul0XOyOHOy/c0WLWzNT05dglU9v+Pt8Uk0LENo/dP58GtcZjcpPrZgempGpLEpFtz/WwE3XiM7Fx3jBlOsEwpiKN998M7UFmSo3Gl7T7q+pWEcm5n+pqEFK/HEUp1NhtoA5c+ZonhTKVA12xIGCgm6yDBLlRuEvf/lL63forlOI6S/HMXPmzBLp7H07vQm///3vp/Jcq8nH/KEjMKwJaHZdOCyhUELjAp53PGzsncFR695oWXxLsEW0tynUrsI01DMNSQh3a4DVQ8dowcUoyGyg0OQVMn0nbY7jYeXMqTjiwUdbcoXRIUgESFKend7HHw0X6rSO1sXxEaUYlY0aoVyeTnwuffxNkGIau3ruoHmqKVc788wzdUqXSrXiEwbfaf6bsTms386WprA035pxP1TVUbgYQUSBk8Y36oidyX/FtPkrVqxIFTPTz9Czq9MxRKFOVOotX4UnjjsRoU+vpL0DBHurHIY0hfCYodZSyISFNCVJGxd0qo+2uDa21GdgOXX6VNC2sdgUkzIyYt0L8/AvuhAn/Og7e13H0hCbHnwa8y/5EGxQlcSCUIW6JHpDFEbIKBujd+5K2uV27wtChTfrHGzNekDG0XbaSO3tDMCM4q4KdAzbiF/diLFnHA/H6h5je48+gTBFCIPT0mpmt/y5z32upCymGzduxPDhw1NfpPhAs3vngt/pD7oLYLj75sJaiuDc1+so6Pj8NL9VZ0MzCyqve+yxx7S7s/kzIzjSFPDmWUYlxn9+/etfB1N/cPzljnsxBZ54Mko7bU78BIpMJWRh7XU/B752LVzaH62c3kOb5Vz/e+ShLmTWWYWcUyigxOyzSZtv28iGVIPRNhHBCyxEbiEJY/F7KWSUzfLVCiFcNMx7DNkDp+312ka/CWtPPA99nnsSGZVBo8dnFWwbVFgxIaujE/Gmq7kI4SMDlt91Cin4mSLe8fcaRzZgffhIJ2oct/olRIMbuu2c0mMFCAH/5Cc/wec//3n940zrFMJJwh0cjcpJGn/Ihx12GBYsWJBqn0xfjJAzi0SpQsQsqkcffTSeffbZJEPu9B7uyjds2JCqwCt+qREIxXYJ8vnIRz6iTz1GrVQOwdHe4I0wMf8855xz8Lvf/a5s4zd94LfkaSHNkxWfTcHP+J3OWshibYHCvw46EmNeX6YdV5S996nWt/KFbNe6TkehEh8znSdthUJMtGwyYaGCZzkI2lElFeK8fV32YbtXj+mrF0P13ztZoeWHmD90EvrndsBmfQ+mF6GHVUt8sooiODb7vndK9qRj4H0Rk0vSpUfXR+HbQrjR3ieLkHXRbWCLm8H0zUthub1hp2zHjTuOHilAzC6Zx/WVK1fGHWus6+LvtvZ+nFmozI+4HLt59o+7TEZ0p9GMXYKqwHKlOFm+fLkWyKUKu47GaxZNjocxEMzZVE2NY3/qqae0u7Q5jaTJg+Pnxoe/ibRbbAEYFErPzh80DkObfTS6Cr0CU53vrbMAF3mdY7dQ6kM7tTglFCynaorpP/g8Wg3o/OopOtDseQZpciP0CiLkbQeN2f0wdetrUFY7VUt3NuH1UZNQ39SsPa942mCd9b0N/SXo3dr5SHT2CW0KwUJdkEzI0hOFwrfFZyk/ArLKw5JpY3DM3Kd0+iY75dNQ3DnUIwWIWajTTlRodvfUXXe1FRtly2kkZh9ff/11jBs3rqtdbPd6snzhhRdwzDHH6BNTmic5vvDAAw/Eyy+/rN+d5oLZdjAcx6mnnoqHH354j79K+3RaCnT2ZerUqZg/f37qPDj+c889F/fcc08pXWz3XvN76HxeB7A2bcPakZN1yiBW62OCwLdyBRXOAIVmFmYmQizNXZWbb0ZwF+qGFE4MhXgMY4A276WR20bO8+CddhKG//HOdscbLl+FNdMOhRNGsKIMIiffWkFQO1q13FVS0GB7AoT91/mwtGkeSjv37D0OZTWjTvXD9v/4OCZ859st6rUSjnAlzJgeKUC4WHNSM2Aq7Xbeeefhzjvv7PJiZ1RBNG4z51O5GhdhegqVavA2RmU+rxz6eXOaKbfrLhfOLVu2tBrGy8U9zeeOGTMGPJWZOZOGYCUHetFx/qW9CTD2lc76mY+A3X/8ExovvBxAMyKV0Z6P1dK03cIO4asQ2bvvw5Azj4PF4nLM4svjhR3CCm08e84HMervj+ta6jm7DvVhe6ePbhyVipDzLEx4cR6iySNaSrCLAIn9RfhjYaBe3DxQsR8M4J///CdOPvnkLvu7GxXK+9//fp0vqFyNP+I0FghziuOiwwjjNJ7ZdszU+3NXXK7GMVx88cW47bbbWr9XOdSGafefwnXGjBmtUfmdLcxx35/2iVyfE2xbG+WL7Tr76g8D7F6YdgwGL3sdXuTr+CtFC3mVtMI5JESz42LCmqUI+/fVWXx5pNBKMF2fHZjTMB6jt+3UBeaaXA9eRHVYuuqqUpDwfJK3XUzY/Aai+j6FWijseDe0HnkC4cJBVcCSJenm/OePhIupCQjryvfQXhNKYciQIWWteUGDJj2a4p4aiuMSitOXrFq1SuvLTb+7MtY4137mM5/B9ddf3+WTXGfPLh5PORbMzt6f5t9//OMfx4033qgfGWeB3te7+V03bdrU6vmXVh/Jl6rNRx99NNZ3tHwfCwdPQd/cLqYF1HaNqIoC4SKldMr11X33w2GbXgNsT2fR5RY+snzYYQZWkMe6/mMQWj4c30Keqjjl61Kz1dJYAG/joEGYvvoluH4GQUYESJe/DRf5tHebRoCwM10VIuYEwvvS9oIphvOHP/wBZ511Voc/aLPIGj5GncR/fuc738FPf/pTLYTKwY/voMGcFfHMzjqtHTY5cGxcLEeOHFmWU1OXJ2IJN5DLmjVrMHTo0FgL9L5eVeyRWEJ39rqV/eN3HD9+fKzHWlu3YcnI/dFbx3UwxXohy1XVtDCC57pYO+tIHPTAnwoBxC4t+cxtVBAgWL8R68ZP1YKDhyfasHkSqSZByPQmr59zBo6661fw8hYi7WbcPZx77AnELPBpLtazZs0CM5kaY3pXJz77Evdk0NVnm+u52HR2aiiOSWAAGKPMqRs3QretgEnal/buO+KII/DMM8+0Miw+MZTyHpNBmJHWdDk2evlSnlkt98a1MbTXX2PgZqZjE+yX5m+C6qu4czp45XVsPPQIZJwMclGoDcJVtfAy5Qxlxde+hFFfuorl1gHLB1QGFnxEoYfVl14O987fa9VW4IS6xjnz5ZVSaTDteeZHFsa+9CSw/xT4bgSPdeK7R36gRwoQBuoNGzYs7e+igwcZV5K0MWjshz/8YVlPIEn7Vq77uLgYYzBTfVNtxQWsqye49vpXfIKiAKEb7IknnliuoXTbc//nf/4HV1xxRaJa8Ub4pF1AyjhXUKXb/gmSFXiYY445oCgsHDx6/Dsx+bl5cKwQAbLwVHUZny1F+4eDCSuWAgN7Q9mFKHkd2a19gPN4/oAjMHLlum6bC3FezJqeB25bDtT1gaXyiCyq4rqn9UgBQl96up6m3cwuPclzuWgedNBBeOWVV5Lc3qPv4QLDNO1M104OXNTi7lo7Grh5Fq+hKzADNNPcXVcLdOMYUewKHrdvPIHwhMncaGm3DhMosiiUDgRkVuuCr9W8hgkYuWsXVBAg59ID6y3317T7luR5oWK/emHylqVQ2XodvMgqgHSbZaoS+CFeGzoBfZuakjy+Yves6lOHmcz5lWF24Bbvq26yNfUYAVK8cDBQr21ailK+nlH5lOpy2tONup0xNJx4nfn3Cy+8ELfccktntyb+e373tWvXJs4MEOfFRmXZnk3I7L7LKbhoN/rb3/6mvQo7j7XYe0Q0cr/zne9MXbjed999eN/73tfuCcTUx4hsH06QAYIcVvUZCeWEyCgXOceCo/zW+Ik436ES12ydOBlTFz4BN/DguwqOogBknisLzrYmrBkxAYjSjTBPe1wrph+Io59/AspiLfksbDBurXuM/D1OgPAHzeO6iaBO4+PwR8vAPBoMkzbuBE1sRjkXm6T9S+s+Y5A//vjjdTVEfos0Thv76l+50nO0fV+xF1Tb71ec8j0tjsXPIT/mTkuaVYH3MlVM2o02FX7fdptiwB49mPKwAw9YvhJrph+CkFHRug5PIZq6mmwgTEGy4VOXYMZPrkNGZ+o2lRxo57Cw4pofwr3m+2CFkmpuI//1KNRh07WnW2CxtwzE7B4lVo8RIOZ4TzUTAwjTTLtBff1FF12kXSqTegz93//9H84///xqnneJ+2aYkPn//u//alb8M/MNyiVA+M1Z9516+HK2adOm4YEHHsCIESNaHRTMqYR1Us4++2w89NBD5eyCZsm5neQEQv7sb5pedZ3HGwU6U6xtBYhCFy+f+UEMfPgx1DPRnxvq6GhFG0kVBRI2hREmrVmMaNBgRI4PG65eeqlqozRZfOJ70fuZObC6ZzMfe36NfHMl8r2yhdTxTgg7tLUjWXe0HiNACIe7fAam/fnPf06dVfx0DXu+2gi2M844Q6sharmdfvrp+O1vf6sjns2uPKnA7YwTv8e//du/4a677urs0th/31ZVxTQrTCvS0aJtjNQUYozB4WKdJNVNnE4yRU1cl1nzPJP5IM1TLznxRM7+7MuLjiJCVxJkQbZwJ56cdgKGbNi45zB1pUBm42hCHx/IKEerjEo5ldDeQtGkMoCbt7Alm9HR5Hs0k36r+A8VsNPNYObq+Qjqe+nkg7QfvLVvb8ZzA45EXX4d3EybDBc6fUmIvo15neWXpXOZtt4qoXwt07fUhTaa7RA7s4OQU7uQbTHqt3ZbD4tZvphWEcizjG7o4+idbTjHmVxluqZHCRBOZnpfMQ4gzWZ2W0ldTnmfscuk2a9qfRYX3B/84AfaY61cAoTVHBks2pF9ohQ+TCXCE0dXvMUoOPap0imlMy02pauvvloXbeqKGznrm7D2SNrt29/+Nr761a+2VmZs+3yunUwLwrToOt5j9w4oj4kJudy9lTjRCpqAyMbSUVPQu5kqLRZwSx6dTqN3NnC0/WJ9XW8cvG4+lL33ews5pPbsC5BDVNePm3bd98BmJuBCfHpghfB2NUGxOEnEDMJtxrFrB14bNx19c8w97+ukjaUojdyQQZYKaw+bikMf+gcsnUSRXmFt3kvR0RJlrmxLux5bdeWr29PVedRjBIjZYZVDXcLcVVRVJF0Mjf0jzV1gVz9kd1xPQfKlL30J11xzTatTA/uRhGMxO95PgVyO9CrsM1OT85ubfnbU3+LofV53xx13gI4DZpxpfvMPfvCDoCo0jheb2ewwmwCFYZqNjFhrxwjL9vgUkv0FcOgFFNrIuUBdIbBiDwES8M9WbcGmiRMBOwOftVFYBTRhK4geCzknhz5nnoXBd90KnknavrcgxPbsi44lslxEuqhUIemikQJco7U6KwCsQvrdPTPgLtuAjQdOgaWyoOOAF7gISiliwmBLT8H/3Gcw8bvf0t1lXfW276WQoZGfqsAWf7GqqnLbYwSImW/l8HSiQThuuoa2856Tki6sRx11VMKfRM++zah/qEop9tJKoss3nnWf/exn8Ytf/CI1MOZ0yG9F4cF0+Ek3IuxjV04tXRkE+0mX3M7YGaFl7FBdeUfcazuzpzD5oLKZrTbU5aIZeGfiKorfkVN57LrvYTR9+DyuzMjo8tJxe7H3dVqAKBuWlYf1x9sx4l2nIcruXfWwvTdYUaEoVM4G6gIbgbZ1WC3qrJYsuBafvffd900/HEe+sRRW4OpMvwqMvSg8L0lzobCjzsPkxS8hahii63847RjvdTb3IlGmT1Ypl+BO0n9zT48SIKzLzEC9tBt/tPSgSqrCYgCdyWmUdt+q/Xlc7IzgeO2113R+rSQnEI6TUc9cRM0z9Q9H72rTacydRhtDZwt0R29jf/bff39tHyhH62zhbvvOYv5p9YdR7Zs3b+5EUL7lxqTTmutd8t6NRZIeHTkO0zeHCJx8S3R6cgmiizgpD44FDN++Bj7rkMcs50obAmuXBy5djNllH1boIOfayHJd5p9xxW7HIj1v4HA0NFlQYYDQi3QFxLAEa7tSAXbbfTBl6xuIsh0FAhZOQgUtVkGa0PpULa1HCZCDDz64tbZEmgDNjzZJIBf7YfJfpbnYpTm+Sj6Lha4ojJPu0mnYXrRoUepdPuWUU3Sm5aTCrbhD8+bNw6GHHpp6H/US0bJL7uzhJsiSAjfNRj6sq0IX7TSa1ZTHgiHj0DvIIQOeFJLv2vXiyaSlcLCmXz2OWL9MG7eVE+8EEnc8zHbL8reFYk42nHwT1vRLVqF0X++kAX/L0CE4cMVLLU4A9Fjrea3HCJByqA6MGoM736Snj3L0q+dNoz173JX8SeZOw7+U08G+uFGYmTxRaQgQqsEGDBhQls8UR4DwGqrjqDZ98cUXU+8Hv1/xKbCkF2zdiZUj9oetAtDnSatqSjhUKlYGVBnsPPpQTHnor1rdZKes0tF91B5aEVRowdq0FWvG718ShrY3+yrAsg+ciePu/k2hGmNxra1U31Teh/UIAWJ+MKUWUWqLkosJ0zXwR5h04SqXF0x5P3v5nk6mV111Fa677rouC2V6ITEvVNonOXoU/ed//mcqpw+SK6cAMY4DHQk68uH/WGt+2zZmRkq3lZqRobg34WuLse7g42Cz7EZEF15mjk2ugmE+q9CuQ/PXrsKEL18JSyc6TLm1BEJaLJUbKTx1ypmYOPu51F8yct0yRP17F1LKa9tG6iNJuc97P67qBYj5Qf3+979PPVCPP9KFCxdiypQpiUFfe+21+NrXvpb4/nLe2NYd1Kjo4uxyk/aruBKheV+cXT8XxKSG7X311fTFnIiSqijbPr9cAoRuy5yPnbVyeiTytEaHiLTaXWMn49j1W2AzBoQV/3TakOQCBGEA38li3PrXoPbrW3B7TXvd1ZorGsotIAwxZ8IMjNywOS0k+jnNbgbjNy+FnWFOLtqPCpE1Pa1VvQAhUAqRD3/4w/jTn/6UKl8uMDSgl6JHNieXYg+ktDppnplkweciQ7UNMxczzQVriKxbt07bJsoVCMdxG48nLtpscVWD7CPjMsgzTfdd2lQWLFig+5KWAOGuf+DAgWl95tbnXHrppTrSn+OPI0yTnpo76jhVc5wzaXl4vdh7JEZGzUDowneYOr206HQGJvqejYlbVkJ5WV09PO2Ft+ATQCcBSyeGXNIwAX2am1P93iv79cNRa16CcnohdJj2pQyCMNUet/+wqhcgxrUz7UA9sztnhHGcH2sxPqNC4A+4HD/i4nfdeuut+NjHPlbyVDB9vvvuu3HBBRfo55VD6JmOMriNnjzm++1rAGZRZ9Dad7/73ZLHWfwAflfml2KuqDTbzTffDC72SQR7e/0w34FBhPQ0jNMYpc+YlLT6YN5p8l/FFfzFfeXCy9ToTO2eUwHqmn2sGZCu8dlTDjZMHotpL7PmDH2y3NTrrvMs4FhMb+LB2rYD60YdiChMnk4nZFwTVW+wkWH0uRvglbFjcOqCF2G5PkIU6pE42smgZ7UeIUCINKlXT0efw6RriKNiaStAzI+ei1Saebna9pc7c5bJLbUV2xXoKdW/f/9SH9nh/XFVIaZQVFeFeNzOp73A8r20PbCiY9pt9erV+hTWWeO3LFfpAJO6xWwwOuvLHr8LfR6w4UbMDmsDy9djzYEHdeURnV5L9dey88/CrJtugMcTAqVW2rYDfQLhWIDnPnU1Rt98G2z6DSdtLYGAjJehgd6LgJGvvwoMGwrl5qGYl6WgMOtxrUcIEBq5Weku7Ua7yjnnnNPlx5rFmLEfn/70p8u6k0/ToGl2lfwna5bfcMMNXR57V26I2/fGxkadXyvtNnHiRDD2I81WnLYm7RNcXF4cTzlOvhTiXVU97smWubGYIyoHhBk8fszJmDzv5TTxa0vBmPVvINivHi7rkOjUKOlmP1TaTlOIE1l58DuRXfIqrLAE92NddAs6Aj/PIEZVh2Fvvg5keiH08rAjumLTy6AE97RUKcd/WNULEP6orrzySvz85z+PP6qYV1KXzQR5XT2B8PHcqY0dO1bXtC5XY7/StAcU95OpWxgwVs4Wx6OI73/sscdw8sknp96Ve+65Bx/4wAdS8eoywpf2I0ay8/unfbrhs+MIBuNwkKYAo/Dg9yppTKpQmzu0QthBhLkTpmH4xq2pftedbhZTNi0FGPhLY7yVfipzJlphqSzbz+O1geNR7zfDKaHeBs8yrBqYCfO6csemuj44eMfKlhTsLelL2ksAmSq58jys6gVIuRLY8cdn/N27itYsJuVIq1LcF7qefvOb3+yyjaaz8ZiFinaltF1mzbuN8OtMl85Fi5Hdy5Yt66zbXf576vM5xiQbhLYvM/mpduzYoav/pbl4813HHXccHn/88VhjvOmmm/DJT34y1T5wPKymSU+wpE2HMigfChkgvwuLBk9CP59LZnptxYD+mLXqJcDppWt4uDq7YHrP55MKgYQRsD2H10dPRB+f9UKSnw7oDhxYGbhWANgO5g4fhPe+tkBn9jWp2O2WCo/pjqT8T6t6AUIE5VioaeRlVt/OFrj2PkE53SiL3zd79mytuktjASx+bjmD9orfE3dHHWfXneSnYKK10+DHzQbtOkzVsmLFiiTd6fAezsU4WXU5JnrUlaOkAd2TeSJP2nTWGdvX6it721asGjYZdgmeqQX/qkBbB7KBiyZXYf640XjPKy9A2T4seLqglf5nii3SuXaBdf97G5q+8CVkGgNYbilSik66hQJbVLkNmv0MsockDx1IcaglP6rqBQgNvmnXe+aCdcUVV+DHP/5xLJVBe5TvvfdebT8p1w6e7+TunM9Pe4Hlc6m+S8M4v68ZyEXbuAt3tICXM5I/rgotzq/IeLGV49TGDRK9AeN853LEy3D8fDeFZCnC1iSTzdsKsz92OSbd/XuoEgzcTN3OlOts2oYQRRi1dBHC4Q2wnHxrQsO03Xi1HAxCLPjQRWi4/wHwTFXKMYfJV5hAkq66zY6NictegWpIPwV/nHmc9jVVK0DMLpmunSZQL83Fmjs++vIn/cGwBjV19yXpjDv4mmn8oDuaLHQAYBLIcjXaCWhn6eyEx0WLFSbT/LYcE+MZ+I3jLMpxGZhYlbT7yho3tKXFmYvlEiCp2NvovUQbiO1j2YRZ6LN+BVRYguoHIXzLgxdG8N0ILjyM3LIcQaYelp3XdUDsyNLuvGk2PwzgWgqzB03ChN07WUUErq45krAxcwAz+FoetsHFjK1LoerqEz6sum6rSgHSXpxFmjrnUn8sFBpMq1IOA7dxCabx949//KOeLXEWlq5MK/bf2AbKJQCNirCz4D0GcrJsbdptxowZYNLDtNhxTh577LF47rnnUv/uPGVT4HZ22uTf8/2zZs1KGxduueUWHW9UCi+6qLK5zTksHTQBXpiDW0KtVap7QiuLOj8PuA429tsPB2xYXCjlpEIo29E5pEpRLrUPUsFqzmHFgLFwVMEluZR3FAom+gjtLJb064+T1r4K5ZSg20v96yd/YFUKkOLhpLmDNEd1LljU9yZtFBylRK939F4jQMwPurNFJckY6NpaSvqWOO+ka65Jkd/RN6RRuhwxKYyTMIkGS1kUi8dqglnTOIGYPpmTpgm47Kyvn/rUp/CrX/0qzifo0jVMTz969OiS4q105AQ9sDbl8NrYCeiTD4GSFsoIITy4Vg6RcjFn/Gi8f+ELYCp0y2IKdO7sucCnHYAXYstDL6DxzHehzncR2HQXTu7Gy+h5B74uRmX/8kcYfNFHS/Dp6tJnLfvFVSlAzA/UqDfSpkCXUab2Tiqcnn/+ecycOTPtbunnUR/OxSSph1hHnSo2/hu3zXIMIm4QId9drrxSNHazLG7Sb2y4mDxajBD/yU9+krr77j/+8Q+dPj1OK0f9c/PetE6ijLfedMNvEF79JdjwoHRQYbJWqBjYBDfMIucoDHnuSdTPOCDZw7pyl7Kw4xOXYued1ACYGojJTww6KaNl65PT4EVz4Y5LNzq/K0NL+9qqFCBmkL/+9a91yog0G3d4jPil3rmz3V7b95pd4le+8hX813/9V5rd2uNZXPTSzldl1IIM2OOiWBxxnOZAzILNxc6cnjriXK68UqW4aRfz4GmTp6m0HTn4DvaRnOJG4Zfz5GtiQOL2pb05oyKly7LOPen9aJj9DJzAgirBe4n2FAd5+KiD7wATVy6GGlTe2CX9XQKF54eMx7DcLrghk7qXVgWwUMHQwo5MBtM2LINfx8oopSjF0vzFlvasqhUgXHwYqMfFPu0W17203R+JUlpnzx9+Wru2tu+h+oX6+7itWKViFuu2mXdpAB4zZoxe1MuZlZfvZ11veqhRmHRmRC9nQGMp38fYt7igsjY450yadjh+W8ZzMKdV3I0MWVGQpaFCM3OL7/73f//3VDZEEWMZVIB5g6ZgUG4HMpHTUsk77kze8zru/d0o1Jlrd7kOpm9cAVWXtrpq775ZOdpwJiITNMNhqV6dgj75gq+LYFkKi/vthxNWv4owIwIk2YyIeZdZ9EDMzQAAIABJREFUdKgKKWURaO91XNRM/e64P1zzHPPDTTuxY9t+futb3+pSinhzuuB42lvkTjjhBDzzzDOtC0/aTIv739VdNb8FvbDSbuzHI488Ata77+p3Zl/MJoPqJT6nHI2uu5zjcfvHcs5xky3G7S9/D//61790carSWwgr72N537GwnBAOPaRKeGhBgCjkbBtb6j0cvHkV7JJsKvE6E61dh9VTDoWdZ+BfQYXFmu9JG92RoRS2n3ISptx/NxXV5bD8J+1eSfdV5QnE7JBL1V+3R4aJ8JiuOmlbvny5DiYrVzOqFyMM4rzHCDazENE99/7778fatWtbs+EaocwdddrqseI+Mv8UbQ9xF8VyxoHw5MBde1cTcZpTGsvgPvHEE3E+QexrjIDnt2loaOiSjaYcvwduhugJ15X5tq/BstjTxtkvQ510CsIW76sS1t3Ca/gAS2Ft3wwO3bSmIhUzgj//A5vPOR++RSsOBYeFqEWQxP7QRRcyDoRCZPdll2LcT67VajFdYasGWlUKEHJlokPWAEm7UZ/NHW/cmgvF76ft4K677sLFF1+cdrd69POM3pyLEI3iXLC74qVWjoXRLIgMGL3++us13/ZcitsKX2MLOPzww/Hyy+kmAjQf+bDDDgMdMeK0YpVjKfaJ9t5lPP66ksSxoz5T07/t17ei6TP/DkXPKHpklRCioRPtMgjPCrHBG4BDty5C5GZgMbWIC2Tg6BQjtFF4LEFL5xPXgpu3+JexWiFoEMh7EdyWvj50wik46NmF2lW4mSrMiKGEyRM2koGCjx2nvhdT7rsdyo50JUWd7le/U+nkxRytHwEeM2aFLkKPb61uQVOVAoQ/mtNPP117SqXZjHqluAhUV59PIzSFkLS3CBhbB3fs9CrqikDgt6ZtplxJKdmXL3/5y2BZ232diszpjP/k6emAAw5orQmedqwPhQB3/PxnnFNasXqyHKUDjj76aK3CSqNxKV9w9OkY8vwcBI4HV7GEbfInc21lLQ2XddDRC0Mf+i2sI4+CY0eIlIJr24iiwhJrNTVi0+w5eOmqr+OUR+8GBsWrAaNjzFsEh64h5QCPDxmDSbsa4YYRcq6HbBiUVEUxgItslEOz0wvDFz0Ga/RYnXwlsmmgL2jJVODDaWzEpn/NwfzLrsTJy56FbfdDCWE0ycF34c6qFSD19fWpltbkQmLUQ13gs8elXEyoFknTiJm0L9V4n0m90hV1CFlyN56ODr59KsbO8Nvf/lbnkWovtoap7Znivu2JJO1vbWwrnTkXtB0J44IuueSS1D87HR4+9KEPpfNc5ePZQZMxdncj8raFTKhKUv3oE4iyEdm+tkFEyGDB8MGY8tEPIXJcuLkcFt/5B/Rp3oKhuwP0CizszNRh0oZFUL17xRsTXWxZGK7FXpO3IqyrHwFYOWRCIG878HQOq+SS0AsVdmcs9MqHaPTqsHHaFAw97b1QNIVs3Yglf7gHQ3fk0D/YDdvysMXthelvLgLsLOxSjnDxCJR0VVUKEBMpzUU/zR0gF7ZSnldOj6GSvmI338yd8d///ncwvUuSZr532ot1274U7/jL/a7id5v33n777TjvvPNaPdPinNRMP8vlkZimQ4XlB5jfMAaDmhhBHmm9f0lmdF3YiUcExlEUVD3Mh8XMtpnQQWCH8FQedtgPeYdR7xE29LJw8IZVUNlsvKmomGKE+iOmoY/g+QHW9xqh3Ya18Vsr0Uq1eYc6b1feiVAfMCKdT3S0hxcFJF8Q6THacEMbCwf0xYlrX4Xlsl/JVWfxAJR2VVUKkLlz55algBSfe8ghhyQm9vTTT4MeTaUIocQvr+IbmY590aJFnbrstjcEk+X2wgsvxJ133ln2UbbnpWYW+HIKlauvvho/+MEP9Cm4s/QubSGwXzxFlaN/aSactHYHeHn4UAxsdvVi7jsUH8mNIJYu7MRARAtO6OlocCYl9CKqliJdHjbQi3+o07oHloe1/VzMXL8aKqaRmkKDSQ4Zw6LsEPbOECuHjoAXero8rxeF8G1H1wdJ2ihGXRXovjoRx8HcvAXBVXgq/z+VWY4WWluOORzTHr6/kKYl5jiS9q3U+6pKgJjd0De+8Q1ce+21pY5tr/u3bNmik+x1tZkfPH3wmbdI2lsETNR5V1UybRlSkFBtaXT+tcSYBnmm5o9z4mhPeFDtxbQwaTfOZ5bmjWOLifNuq9HHy8PHo6GpGRFP+3QrL2HhjfNOXsM4C77PimysGtwPM9csiX1koN3GUg58uyCQ8OYOrBlVPi/LTsdkAU2f/jjG/fi/4DAJfJUbQapKgBAuF2sG6tFHPs2WNLrbeMHwR2bcQdMOKEtznJV8lsnjxHcaQ3op72eKGWY4rpVGJkceeSSeeuqp1tNZVxdrzj+qB88888zUY6K+973v4Ytf/GJquJmA8JWh49HHzyEb2NpuEKWcKbe9ztJNlvXRA9jIfOfzGPCFLyFuCXMjQHgqYFp4a/02rBk3OTUmXX0Q5YV7zTcx+KrP0MdMVFhdBWgWoyT3dXZPkt2t2VmXM41EZ/2uxr9v69Fm+tjVBdLcV6kgzUqyPP/883HbbbeVHGPxvve9TwuRNFVYxqEkyaloXwytXU1YOGIC+vh5OFq3X5k631T7FEpAhVC3/BLDP3w27LiqH9pAKDiUj8h24WzchdWjx6d2KuvKfOP3pRF/wuOPQM18B9ADqhRW1QmEAFetWoVx48Z1hXusa1lT/dOf/nSsa9u7aOnSpbr0qjSWo85i9+7dJS+MxSyNcGdZ1YMPPlifaNI08Fbyu7Hvv/zlL3W8kBGoSQUr+12Oipx8rsmHVkrfirlaTT5eGT4BA5tzyNkKmbCQBqTczYkUml0XbpjH4McfQ/bIGfED9RTtKrZ2OWbsirWrEWsGF1L+pMUl7vgpb5tthUmrV0IN6KWj11GC91fc95ZyXVUJEE7oO+64Q+cHSrtxYaJ/f1ebmUjTp0/HwoULu3p7zV1P9aKxA/FUZtyjSx2oURXyn1dddRUo8NPccZfav67cz5iWJMk69/WOcgkQk9InrW/IJIRzGsZiZGOzDvDTiQgr4IZKGcVyU5bVjJGbViHfuxe8uLV0aeyni78K4Pke4OSxpteIrnzu1K7lSajZAyatWQXVz205wSV3H06tYx08qKoECPtpJnPai4dJy50EKvvC6HU+4+3UjHrDZCFm8r+LLrpIIyjn7oz2r8mTJ5clkWa5vh95cI7Q1TsNNoY5Ny0sjpVmY/8Yoc/09Gm2IPKx6QOXIHjgb/oEwKXProARmAosN3KwK+Ng4rYVgBszDH0fg//H0EmYvnMrnNBC3mE99kKsSNlbpJB3bYzbvQmWxXLWTGdf9reW9IKqEiBcoMvhbUJCSd0VjSBLO41ESV+tgjdzsWHBp/Xr13cp8V+pXSR31lyZM2dO6llwS+1b2/vJ6PLLL9cLchrCg883J18aulnSOYn9bl/jZB9XrFiBUaNGpYrCDyL4S97A5sNmos7Pwnf8iqx/jKGgJ9XG+gwO3vwGlMMkJ8lbMHcBNsw6jiZ5+E6gXW+5oJe78bC2qV8fzNi4vGDPsUqrhFju/uqNZBRF5VdSxhxJc3Oz9sBK+/TBUp233nprIr0md4JMfMd0G2+XVrwIMlL53HPP1UMnCyNIK6UjZuwEU5GkPSeSfsu2HninnXYa/va3v6UmOEy/zAmkHBuXUgNq9ymY8grKy+HZd5yC0a8uBCyGWpd/C00VFj2xFvXvh5PWvgbY8TMctzcWK5fH3GFTMSS3DXV5m8VoAbf8aeRVFGH98cfh0AfvaeVWfnpJfwmF+6pKgKRd6c/82O+77z7Qk0UPOMGEZqoH1ievlkWstE/e+d2sz33PPffoyHLDMAm3zt/U8RVGSLEmzPjx41uFWHd9h2LhwQ3FCy+80BpXlDYfM/Y0vaTM/C8uaVDqNyq+n6FwvtqBus0KC8dPRT8aosMK7NxZhsRS2Hzs0Zjx4J+0ACmtBcgvXok1hx6LjK9guTkgLOVME683/OaLzz0HJ93xC4SWq4MXRYDEY6evKleiQlMMKKkAoQqHpyMaHWutmUVx6tSp+Mtf/qIXav5ZcXR22otjXIZtTznc6Z9xxhlxb0/1OsOJmQhMwkgTHc5+pn1S4DOpNmSd8rS90T74wQ+CecHSFk4aeMgkgUCwbDmWHTQLfYPkJW1jf0AFBE6I/GWXYdJ/X4tIWSVlS6dNxfZt7Prbfdh8/qVwA0aEJ6+JHnccSoXod9NN6HvBGTqqnuW4RIB0Qs8sElzkmagwzWbqi5eaeoQR0uxfqc9Jc2wdPau9QEcudlQPMs36Jz7xCV2Frjgqv7uERFeZcL48+OCDOrDOpCEv9uDq6vOKr9+X6zA3ELTFlLMOTNt+c0wUVBSYaQsQnsjf+973pi5AmFadwXgqjNDk+Oi9OcTzB07H4F3N6B0GCBwgDADXpsKpYOcp7LKZKHFvTTptAEyiqGyFMGK6dSY19JjgHayUGwYBlOtBhQHCeht13/g2Gq76DJTlw2Y6+YSNIo+pR3zLQmb1Frx4+PFoeHMTXJsJsmzk/Dxc1wMYO6Lf4eiMvhw77THFjfXQOULOLY41CAM4dFG3C3n5MranJW5gK/iOi3Er50L1HwzbshFy/AnHUKnbul2FZXS9hElbRRp+8wYeBQh31Kzwl7Tx1PHxj388VSNm0r50dh+FxDve8Q4d/cz0GcUCmVyLF6Ji1VRPER5m/MUleb/73e9q12/G6RjVVhIVV7HwGDRokK5kyCBAbh6KT2Nl2bW382E5xo9+9KOJVK4dzRM+l6eP8tiwdHJyMH1V5ERotgNkmxWiFSux8OLL0Xv+AnjNCnAK1TVsZsK1IgSOQiZoZ6nUtT5seMzIGwE5lwtvHtnIgW952DFiMLZOH4+DzvoI+n/wVKhsb1h2Vqc2KcX5izJAWcxdRTVSBMdvRPiveVh01VfRZ8kr+rTTO1ePMOJoOeZQ59HiWBjLwUqMTgQEtoWcYyETWLAoNCgM4YClf5ldK2e72D1qBDbNmIgTL7kAzokzoer6I3IcncaEkfwlJaPsbMFI4e+7XYBwDEaI8N/Njz+NH2rxQpJ0kTTPSHp/Ct8o9iOK+9reAtF2LD1pbMUQ2hunESqvvvqqrsbIHE8vvviizkG1bdu2vRhyY0F11MiRI7U3EmuZTJo0aa/rDMeeyqq9k0257Fpc7nmmyFsW6n0gtEMdWV0PF4FioacA2LUd/tOzsXz+y6jbtA1bnpuLN5et1Au2+f3rk4ljo+GA6ehz6DSoPn1QP3AQhh1+EKzJU4BeGSDrQdmZwvmFHlKhg8jR5xqdfLGUnXtBDDKjsA2H+bHYrEB7RdnNEbB5C7Y//QTefPVVOJu3Yd3s57Fj1VqKBq2+c5ickYK0PotRUybBmTEd6NUbvYc3YOhhBwETxwP1fYCshdBxdUZeasgoQ7X6rSBmCs+och1WVQiQ2CukXCgEOiHQVrjo3347v8JaEQjVNCFMdb/QLRTY0//duqazKBNFjMcDiK4iaFkK1PvbPF4YlVOLR5W2w7E2vcNduwVPZ+a1YQcKoWPprLysIMiFN3R8NMNBfaSLz+rlt6SFl3m1nAhuyDdHuiY7/4+ngkKKdxdBi+DSMitqybCsX1oQP8wGHPJaWyu29N2FtO2WFhTM3MUrebpiLRJdPyWKtLqOEeiBxVNIZZJRljKHRICUQk/urVoCxSewfam0jFovjdNu1YKoYMfob1XYr9MWUlhKuXyGltI2Ata/0A63XGi5uLYU2iiciFo6alEjATg24IcKGbuQz9ek1WI5WOqnjE2bKdeZd8sCqxY6eoF2dAqQ5AOnmKNdI6AoYlleemBp2wYTRJoKIcyU6yGMAthOi4eWfm9hrLTyWDrVvBajOjOx0qorVXiUFjIthxtt29FbHT0OpStN8VG03ie35SQnEP/ObhMgsgOM/5HkSiEgBIRANRLodgFSjVCkT0JACAiB7ibQE+yu3SZA+HGY0ZUeUj0BVHdPJnm/EBACbw8CRv36/e9/v+rXxm4VII8++qj2fpEmBISAEBACbxHgpro4ALpa2XSbACEcZi+ltE3it1+tQKVfQkAICIFSCFB4vOtd79KBpNXeulWApB15Xu2wpX9CoJIEuEHbV4oVBp1u3769kt2p6LuYdYGxQSwNsK9IfmYYMCUa2mZvMAXT0tzctpchYl9QKDxOPfXUijJL8rJuEyCsm8CI37dbjY0kH0nuEQJdIWAWKi6eFBT7ioNJO39XV/pY7mup4WB6fRYn21cjH9OY4sc03suyEm2zNyTtM5+9ePHi1oSgcZ7T1NSkM0lUu324ogLEqKvod8/suIwYliYEhEC6BEwyTC6ETMX/pz/9aZ8viLMrLk7lwgcV31O8wCXdrbd9flwabfthjM/8c6YgMkJhX/3i5pWVI7ds2bLHK00OPf5hR2PidXHy47HC6q9+9avW/nQ2PvafzzXZFTq7vjv/vqIChAMtZ52D7gQp7xYC1USAiTI3b96s69iwxO6+GjdzZmPH2i/89/PPP19fbhZkXsMF7eqrr9Z51v7whz/g97//fesj2xMARoiZ33vbhZh/z+ceeOCB+OpXv6oX/AsvvLD1nWb3b67j+1lS4Te/+Y2uv9I2xQzz6DHxJEsvGAN0RycsvpsCtrMgUvP3rCdEleAll1zSWtKZAIwQueCCC3SCTybd/OEPf7gHP54mFixYoPPTmT7tS/Dwffvvvz+YkocCjifIam4VFyDmwxcXJqpmQNI3IdDTCHDROfbYY/HII4/oBWtfu2hex0V048aNGDhw4B7qEiapZCVE00xJ6CeeeALHHXecLm9AOwMX69tvvx0f+chH9rC33HzzzVog8BSwr/fTBsMSDuyD6ecXv/hF/Pd//7d+bb9+/bQQZE6zww47TD+H/fjd736nF3IjnExtd51Dy7axbt06DBkyRCfC3Jf9gwk4zzvvvA77x7E9/PDDerzFwoj51Y4++mjdR16zY8cOLVyY5fiss87S7zT23WJPKgqNYlVZ23llhPnXv/518H/m+dU8/yoqQMxE4iQgcGlCQAiUhwCLsx166KGtO+HinTYXOAoP6vm5ED7wwAN6wTMLGF3r//nPf7buzmlsZnLK4mdwYWThMS7eXGAff/zx1r83JwDWtX/jjTfaHSB36VdeeWXrAs57eC37xqSWXCs++9nP4vrrrwdVQFzw+XdchFnI64gjjtDPNeqnhoaGVnUSr9u6dSuK/6xtJ1hrnu9pb4dvxjlr1iw9rr59+2pjPP+cKsE777xT82IfeVpYtGiRfo4RVuwjx0dhyMb1joKjM3Wh+Xsm/6Tw7AmtogLEABk3bhxWrlzZE/hIH4VAjyTAxYx1z2m85WJfvFBu2LBBL8rF6iVu6ChQhg4dqlVUzFDMUwkbBQUXNRa4ogqL/yxuRmdvCmzde++9upolF8H2VDXFtgOeEniS4XtffvllXevl3e9+t348+01nG/bDLM78p9nps787d+7U/eO1phnbgTlhtf2ARsBRYLW3DpnYNLOgs78UIvwfyytfdtllWiCYsfF9/B/XNaoLi9VrFDQ8rRULmM4mlKlz09l11fD3FRUgRtfKDx/H+FQNgKQPQqCnEeDCx13vFVdcgV/+8pcddp9eStddd12reojqIgoJqpG+8IUvtO6auVunfp+LPXfjVD2ZGirmfVwk6VlJldiIESNAQdVe4/U33ngjLr74Yv38xsZGnXb/pJNOwle+8hX84Ac/aBUgVKV985vfbPWIMuouXsA/p5qNC7xZ7Nkno27raOBci5jSf/ny5XtdZsZFN1o6+hiBs2TJEkybNk2fgGjPMIKCY+WJjwZ5nsgoaIx36V133YVzzjmnNeats7lkbFfV7n1lxlFxAcIX17L7YGcTRP5eCJSbgFE58VTRURlmbuQY70BV1/z581tVUFykadymaoaCYvr06XqBZzvggAP0SYGGYZ4wjN3BqLJYFpnPOvnkk1sFTNvx7rffflolxlMOTzNcLNkXnjaMMDCCoHinz+fwPca+cNNNN2khxP/mhpR9oTGbNpnicsPF7+dzaU959tln9cmFp4P2Tih8Fk8VdCi4++679SX8M76Hdg6Ok43sKFD4dzxN0R7CPhr7EE+B/HOq0+J4qbFS5J///Oeqd9/tFgHCl37605/udFdU7h+YPF8I1DIBVtCk22hnHkbGSF2cEYKnDC6KxqjNUwENyea/+U/aD8aOHdtqx6QAWLZsmd6Ff+ADH9ALpvFwas+IzR05F+VitRoN6lzQjW2h2O5iPLFuueUWbaw3hnku5DSo87+NWoyLNxdqCqT2BAP/jF5fzMHXER8jwIy2hM9khUh6Y/GUQEHBPm7atKlVoPEansB48jJj40mEfaZaME6j04BRHca5vruvqegJhIPlsZFSWZoQEALlIcDFm4vZvk76Z599NminYOMCz0WOifuo3+cCRntE8b0mJuHHP/4xTjvtNH0imTp1KqjSMbtqGrm5W+dCSVfajhoXZZ5guAgz2I8LOgUK7yu2o9AWUlxSeNWqVfq/uUizcZGnwOA/f/3rX2vPLF7D9eXEE0/cqwtGNUUvLY6R/egokNmowti/a665BmvXrtVqKvbRCCzaYHjaoNfZ8OHDtf2GQoZC3PAl47lz52LmzJmdfnBzkupM+Hf6oApdUFEB0tGkrtB45TVCoOYJ8NRgFrn21CZPPvmktmMYYy1jK7jr5U6Z9gjq/umZVVwnnoG/n/vc5/Ti/KlPfUozNHZMnhAuvfRS3HDDDZ2eegx8nhoYS0JVlnke+03vLz6PKjAKQnpBmcZ+UUAwRqK4b1y8eXJhLAgXcN5DAdW2GbsCr3nppZe0rWZftlhzLb3AKCz5bJ4seC/VeTwxkTHvP+SQQ3Dttddqgz6FoDmtkT1VgOwfbUrPPPNMh3OPTNhvE0PTEyZqRQSIMTZRglPvWfzxewIk6aMQeLsQKP5txnE7JRf+vrnYMwEgM2zHaXGeXezNFPf6OO/mNZ09L+5ziq8r9Zl0VKDXnBl3kj5U+p6KCBDjVsejII/K5mhX6cHK+4SAEEiPgFEh8YncOdP7SDaHyfnSjkTbkgiQdhjyqGcSlBkPh+So5U4hIAS6mwCFxYQJE7Qah4ufUenE8Tbq7r5X4/upVqQaqyfkwDL8KnICMS/jROspxqFqnGDSJyEgBGqXQE+J/dhDbRdFkSr3J+lJR7Jys5DnCwEhIARqhUBFTiAiQGplusg4hIAQEAJvEaiIABHgQkAICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO19UxmREBACQqAiBESAVASzvEQICAEhUHsERIDU3jeVEQkBISAEKkJABEhFMMtLhIAQEAK1R0AESO190//fXh3TAAAAIAzz7xoXO0gVEMqBRgQIEEgEHEjCLIQAAQJ/Ag7kb1ONCBAgkAg4kIRZCAECBP4EHMjfphoRIEAgEXAgCbMQAgQI/Ak4kL9NNSJAgEAi4EASZiEECBD4E3Agf5tqRIAAgUTAgSTMQggQIPAn4ED+NtWIAAECiYADSZiFECB05qHqAAAB10lEQVRA4E/AgfxtqhEBAgQSAQeSMAshQIDAn4AD+dtUIwIECCQCDiRhFkKAAIE/AQfyt6lGBAgQSAQcSMIshAABAn8CDuRvU40IECCQCDiQhFkIAQIE/gQcyN+mGhEgQCARcCAJsxACBAj8CTiQv001IkCAQCLgQBJmIQQIEPgTcCB/m2pEgACBRMCBJMxCCBAg8CfgQP421YgAAQKJgANJmIUQIEDgT8CB/G2qEQECBBIBB5IwCyFAgMCfgAP521QjAgQIJAIOJGEWQoAAgT8BB/K3qUYECBBIBBxIwiyEAAECfwIO5G9TjQgQIJAIOJCEWQgBAgT+BBzI36YaESBAIBFwIAmzEAIECPwJOJC/TTUiQIBAIuBAEmYhBAgQ+BNwIH+bakSAAIFEwIEkzEIIECDwJ+BA/jbViAABAomAA0mYhRAgQOBPwIH8baoRAQIEEgEHkjALIUCAwJ+AA/nbVCMCBAgkAg4kYRZCgACBPwEH8repRgQIEEgEHEjCLIQAAQJ/Ag7kb1ONCBAgkAg4kIRZCAECBP4EHMjfphoRIEAgEXAgCbMQAgQI/Ak4kL9NNSJAgEAi4EASZiEECBD4E3Agf5tqRIAAgUTAgSTMQggQIPAnMLRXp0TaK3HSAAAAAElFTkSuQmCC',NULL,'e10adc3949ba59abbe56e057f20f883e','1978-09-24 03:00:00','02486723471',0,1,'2018-03-21 14:44:14','2018-11-11 03:51:07',1,7,NULL),
	(10,'TIBÉRIUS LINS MACED','','','',982310130,81,'55','tiberius.lins@gmail.com',0,'https://iboltt.s3.amazonaws.com/6fe67be8ef5127cbba0827d51c0551ff.jpg','Tibeius','9ea0c1ab924fdd968172de6a23303bb9',NULL,'00000000191',0,1,'2018-01-19 03:34:22','2018-11-11 14:49:32',1,7,'6fe67be8ef5127cbba0827d51c0551ff.jpg'),
	(11,'OTAVIO AUGUSTO','',NULL,'',970484217,11,'55','otavio.teste@teste.com',0,'https://iboltt.s3.amazonaws.com/296ecdc2e3099551c6d347e907655536.png','OTAVIO','e10adc3949ba59abbe56e057f20f883e',NULL,'35458205057',0,1,'2017-11-30 13:20:50','2018-11-11 14:49:59',1,8,'296ecdc2e3099551c6d347e907655536.png'),
	(14,'LUCIANOT','',NULL,'',995457675,81,'55','luciano.thomaz@chegaja.com.br',0,'https://iboltt.s3.amazonaws.com/2d957d0f2ba1dc0eaf3a9440fe461fbb.jpg','lokao','c56d0e9a7ccec67b4ea131655038d604','1980-09-09 03:00:00','56773280222',0,1,'2017-11-20 11:05:57','2018-11-16 01:17:08',1,7,'2d957d0f2ba1dc0eaf3a9440fe461fbb.jpg'),
	(16,'Renato',NULL,NULL,NULL,123,123,'321','renato@email.com2',NULL,NULL,'admin','d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,NULL,1,'2018-11-17 12:10:24','2018-11-17 19:44:47',2,NULL,NULL),
	(20,'Burgueria Gourmet',NULL,NULL,NULL,0,0,'0','antonio@gourmet',0,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,NULL,1,0,'2018-11-18 22:38:33','2018-11-18 22:38:33',3,NULL,NULL),
	(21,'Bernardo',NULL,NULL,NULL,99995555,81,'55','bernardo@mail',NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,1,'2018-11-22 04:06:32','2018-11-22 04:06:32',1,NULL,NULL),
	(22,NULL,NULL,NULL,NULL,123,123,'321','renato@email.com3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2018-11-25 03:25:28','2018-11-25 03:25:28',1,NULL,NULL),
	(23,'David ',NULL,NULL,NULL,987014832,81,'55','davidemanuelbatista@gmail.com',NULL,NULL,NULL,'3c0855b189d8d38ba9c235bdbb6b30ab',NULL,NULL,NULL,1,'2018-11-26 01:06:50','2018-11-26 01:06:50',1,NULL,NULL);

/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Workshifts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Workshifts`;

CREATE TABLE `Workshifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `dayweek_id` int(11) NOT NULL,
  `quantity_shifts` int(2) NOT NULL,
  `shifts1_start` time NOT NULL,
  `shifts1_end` time NOT NULL,
  `shifts2_start` time NOT NULL,
  `shifts2_end` time NOT NULL,
  `shifts3_start` time NOT NULL,
  `shifts3_end` time NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Workshifts` WRITE;
/*!40000 ALTER TABLE `Workshifts` DISABLE KEYS */;

INSERT INTO `Workshifts` (`id`, `company_id`, `dayweek_id`, `quantity_shifts`, `shifts1_start`, `shifts1_end`, `shifts2_start`, `shifts2_end`, `shifts3_start`, `shifts3_end`, `created_at`, `updated_at`, `status`)
VALUES
	(1,1,1,2,'08:00:00','13:30:00','18:00:00','23:00:00','00:00:00','00:00:00','2018-11-09 00:00:00','2018-11-09 00:00:00',1);

/*!40000 ALTER TABLE `Workshifts` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
