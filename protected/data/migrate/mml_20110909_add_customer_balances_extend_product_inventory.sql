# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     mml
# Server version:               5.1.48-community
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2011-09-09 08:30:48
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping structure for table mml.customer_balances
DROP TABLE IF EXISTS `customer_balances`;
CREATE TABLE IF NOT EXISTS `customer_balances` (
  `id` int(10) DEFAULT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `debit` decimal(20,4) DEFAULT NULL,
  `credit` decimal(20,4) DEFAULT NULL,
  `balance` decimal(20,4) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table mml.customer_balances: 0 rows
/*!40000 ALTER TABLE `customer_balances` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_balances` ENABLE KEYS */;


# Dumping structure for table mml.product_inventory
DROP TABLE IF EXISTS `product_inventory`;
CREATE TABLE IF NOT EXISTS `product_inventory` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` int(10) NOT NULL,
  `unit_id` int(10) NOT NULL,
  `in` decimal(16,6) NOT NULL DEFAULT '0.000000',
  `out` decimal(16,6) NOT NULL DEFAULT '0.000000',
  `count` decimal(16,6) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remarks` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

# Dumping data for table mml.product_inventory: 12 rows
/*!40000 ALTER TABLE `product_inventory` DISABLE KEYS */;
INSERT INTO `product_inventory` (`id`, `product_id`, `unit_id`, `in`, `out`, `count`, `updated`, `remarks`) VALUES (4, 28, 1, 0.000000, 0.000000, 990.000000, '2011-08-04 11:54:18', 'First created'), (5, 29, 1, 0.000000, 0.000000, 5000.000000, '2011-08-10 10:57:35', 'First created'), (6, 30, 1, 0.000000, 0.000000, 100.000000, '2011-08-31 09:52:28', 'First created'), (7, 31, 1, 0.000000, 0.000000, 100.000000, '2011-09-01 09:06:53', 'First created'), (8, 32, 1, 0.000000, 0.000000, 1000.000000, '2011-09-01 09:08:03', 'First created'), (9, 33, 1, 0.000000, 0.000000, 1234.000000, '2011-09-01 09:09:42', 'First created'), (10, 34, 2, 0.000000, 0.000000, 1234.000000, '2011-09-01 10:46:15', 'First created'), (11, 35, 2, 0.000000, 0.000000, 1234.000000, '2011-09-01 10:46:54', 'First created'), (12, 36, 1, 0.000000, 0.000000, 53245.000000, '2011-09-01 10:48:38', 'First created'), (13, 37, 1, 0.000000, 0.000000, 53245.000000, '2011-09-01 10:49:20', 'First created'), (14, 38, 1, 0.000000, 0.000000, 4564.000000, '2011-09-01 10:50:52', 'First created'), (15, 39, 1, 0.000000, 0.000000, 345345.000000, '2011-09-04 01:52:04', 'First created');
/*!40000 ALTER TABLE `product_inventory` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
