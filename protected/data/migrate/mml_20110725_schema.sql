# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     mml
# Server version:               5.1.48-community
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2011-07-25 09:08:12
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping structure for table mml.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(11) NOT NULL DEFAULT '0',
  `parent_id` bigint(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sel_rank` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_categories_categories` (`parent_id`),
  CONSTRAINT `FK_categories_categories` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table mml.customers
DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `account_name` varchar(500) DEFAULT NULL,
  `billing_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_hospital` (`hospital_id`),
  CONSTRAINT `customer_hospital` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table mml.deliveries
DROP TABLE IF EXISTS `deliveries`;
CREATE TABLE IF NOT EXISTS `deliveries` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='D/O';

# Data exporting was unselected.


# Dumping structure for table mml.delivery_items
DROP TABLE IF EXISTS `delivery_items`;
CREATE TABLE IF NOT EXISTS `delivery_items` (
  `id` int(11) NOT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `manufacturing_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `do_item` (`delivery_id`),
  KEY `manufacturing_id` (`manufacturing_item_id`),
  CONSTRAINT `do_item` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `manufacturing_id` FOREIGN KEY (`manufacturing_item_id`) REFERENCES `manufacturing_items` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table mml.hospitals
DROP TABLE IF EXISTS `hospitals`;
CREATE TABLE IF NOT EXISTS `hospitals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `contact_person` varchar(500) DEFAULT NULL,
  `tel_1` varchar(500) DEFAULT NULL,
  `fax` varchar(500) DEFAULT NULL,
  `province` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table mml.inventory
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `product_id` int(10) DEFAULT NULL,
  `unit_id` int(10) DEFAULT NULL,
  `count` decimal(10,6) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table mml.manufacturing_items
DROP TABLE IF EXISTS `manufacturing_items`;
CREATE TABLE IF NOT EXISTS `manufacturing_items` (
  `id` int(11) NOT NULL,
  `request_id` int(11) DEFAULT NULL,
  `process_type` varchar(45) DEFAULT NULL,
  `output_unit` varchar(45) DEFAULT NULL,
  `output_count` varchar(45) DEFAULT NULL,
  `__label__` varchar(45) DEFAULT NULL,
  `transaction_items_transaction_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manufacturing_item_request` (`request_id`),
  KEY `fk_manufacturing_items_transaction_items1` (`transaction_items_transaction_id`),
  CONSTRAINT `fk_manufacturing_items_transaction_items1` FOREIGN KEY (`transaction_items_transaction_id`) REFERENCES `order_items` (`transaction_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `manufacturing_item_request` FOREIGN KEY (`request_id`) REFERENCES `manufacturing_requests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.

# Dumping structure for table mml.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL,
  `uuid` varchar(45) NOT NULL DEFAULT 'xx-xx-xxxxxx',
  `status` varchar(45) DEFAULT NULL,
  `request_received` timestamp NULL DEFAULT NULL,
  `quote_price` decimal(10,2) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `referrer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_patient` (`patient_id`),
  KEY `transaction_customer` (`customer_id`),
  KEY `transaction_hospital` (`hospital_id`),
  CONSTRAINT `transaction_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transaction_hospital` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transaction_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='(request, quotation)';

# Data exporting was unselected.


# Dumping structure for table mml.manufacturing_logs
DROP TABLE IF EXISTS `manufacturing_logs`;
CREATE TABLE IF NOT EXISTS `manufacturing_logs` (
  `request_id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `logs_manufacturing` (`request_id`),
  CONSTRAINT `logs_manufacturing` FOREIGN KEY (`request_id`) REFERENCES `manufacturing_requests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.



# Dumping structure for table mml.manufacturing_requests
DROP TABLE IF EXISTS `manufacturing_requests`;
CREATE TABLE IF NOT EXISTS `manufacturing_requests` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_manufacture` (`transaction_id`),
  CONSTRAINT `transaction_manufacture` FOREIGN KEY (`transaction_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table mml.order_items
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `transaction_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `item_price` decimal(10,2) DEFAULT NULL,
  `item_quantity` decimal(10,2) DEFAULT NULL,
  `__instruction on label__` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `transaction_items_transaction` (`transaction_id`),
  KEY `transaction_items_product` (`product_id`),
  CONSTRAINT `transaction_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transaction_items_transaction` FOREIGN KEY (`transaction_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table mml.order_logs
DROP TABLE IF EXISTS `order_logs`;
CREATE TABLE IF NOT EXISTS `order_logs` (
  `transaction_id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `logs_transaction` (`transaction_id`),
  CONSTRAINT `logs_transaction` FOREIGN KEY (`transaction_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table mml.patients
DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `hn` varchar(20) NOT NULL DEFAULT '0',
  `customer_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table mml.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL DEFAULT '0',
  `display_name` varchar(500) DEFAULT NULL,
  `recommended_dosage` varchar(45) DEFAULT NULL,
  `category_id` bigint(11) NOT NULL,
  `unit_id` int(10) NOT NULL,
  `recommended_price` varchar(45) DEFAULT NULL,
  `default_consume_time` varchar(100) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  KEY `FK_products_categories` (`category_id`),
  KEY `FK_products_product_unit` (`unit_id`),
  CONSTRAINT `FK_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_products_product_unit` FOREIGN KEY (`unit_id`) REFERENCES `product_unit` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table mml.product_unit
DROP TABLE IF EXISTS `product_unit`;
CREATE TABLE IF NOT EXISTS `product_unit` (
  `id` int(10) NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table mml.stock_cards
DROP TABLE IF EXISTS `stock_cards`;
CREATE TABLE IF NOT EXISTS `stock_cards` (
  `manufacturing_item_id` int(11) NOT NULL,
  `report_time` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `inventory_count` decimal(10,7) DEFAULT NULL,
  `inventory_unit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`manufacturing_item_id`),
  KEY `manufacturing_stock_card` (`manufacturing_item_id`),
  KEY `stock_card_roduct` (`product_id`),
  CONSTRAINT `manufacturing_stock_card` FOREIGN KEY (`manufacturing_item_id`) REFERENCES `manufacturing_items` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stock_card_roduct` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Inventory (FIFO)';

# Data exporting was unselected.


# Dumping structure for table mml.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `display_name` varchar(45) NOT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `salt` varchar(45) NOT NULL DEFAULT '1234',
  `email` varchar(45) DEFAULT NULL,
  `type` char(15) NOT NULL DEFAULT 'GUEST',
  `inactive` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='system user';

# Data exporting was unselected.


# Dumping structure for table mml.user_customer
DROP TABLE IF EXISTS `user_customer`;
CREATE TABLE IF NOT EXISTS `user_customer` (
  `user_id` int(10) DEFAULT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  KEY `customer_users` (`user_id`),
  KEY `user_customer_id` (`customer_id`),
  CONSTRAINT `customer_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table mml.user_logs
DROP TABLE IF EXISTS `user_logs`;
CREATE TABLE IF NOT EXISTS `user_logs` (
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  `message` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `logs_user` (`user_id`),
  CONSTRAINT `logs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='log user activity';

# Data exporting was unselected.
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
