# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     mml
# Server version:               5.1.48-community
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2011-09-04 14:53:38
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping structure for table mml.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL DEFAULT 'xx-xx-xxxxxx',
  `status_id` int(10) NOT NULL,
  `request_received` timestamp NULL DEFAULT NULL,
  `quote_price` decimal(10,2) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `days` int(10) NOT NULL DEFAULT '0',
  `amount` double DEFAULT NULL,
  `amount_total` double DEFAULT NULL,
  `additional_charge` double DEFAULT NULL,
  `discount_factor` int(10) DEFAULT NULL,
  `marketing_charge` varchar(45) DEFAULT NULL,
  `monthly_price` decimal(20,4) DEFAULT NULL,
  `daily_price` decimal(20,4) DEFAULT NULL,
  `total_weight` double DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `transaction_patient` (`patient_id`),
  KEY `transaction_customer` (`customer_id`),
  CONSTRAINT `transaction_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transaction_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='(request, quotation)';

# Dumping data for table mml.orders: 76 rows
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `uuid`, `status_id`, `request_received`, `quote_price`, `delivery_date`, `customer_id`, `patient_id`, `days`, `amount`, `amount_total`, `additional_charge`, `discount_factor`, `marketing_charge`, `monthly_price`, `daily_price`, `total_weight`, `data`) VALUES (90, '1111-016-00000090', 1, '2011-08-29 08:06:26', 4780.84, '0000-00-00', 16, 7, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), (91, '1111-100-00000091', 1, '2011-08-29 08:07:33', 2573.60, '0000-00-00', 100, 7, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), (92, '1111-023-000092', 1, '2011-08-29 08:08:30', 4252.72, '0000-00-00', 23, 9, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), (93, '11-016-000093', 1, '2011-08-29 08:09:23', 0.00, '0000-00-00', 16, 12, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), (94, 'xx-xx-xxxxxx', 1, NULL, NULL, '2011-09-16', 16, 7, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), (95, '11-016-000095', 1, '2011-09-01 23:10:03', 100000.00, '0000-00-00', 16, 7, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), (96, '11-100-000096', 7, '2011-09-01 23:58:35', 20.00, '0000-00-00', 100, 12, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


# Dumping structure for table mml.order_items
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_per_day` varchar(45) DEFAULT NULL,
  `consume_time` varchar(45) DEFAULT NULL,
  `price` decimal(10,4) DEFAULT NULL,
  `quantity` decimal(10,6) DEFAULT NULL,
  `weight` decimal(10,6) DEFAULT NULL,
  `remarks` text,
  `unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order_items_orders` (`order_id`),
  KEY `FK_order_items_products` (`product_id`),
  KEY `FK_order_items_product_unit` (`unit_id`),
  CONSTRAINT `FK_order_items_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_items_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_items_product_unit` FOREIGN KEY (`unit_id`) REFERENCES `product_unit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=586 DEFAULT CHARSET=utf8;

# Dumping data for table mml.order_items: 349 rows
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (538, 90, 1, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (539, 90, 9, '10', '["lunch"]', 29.9830, NULL, NULL, NULL, NULL), (540, 90, 10, '05', '["lunch"]', 0.0540, NULL, NULL, NULL, NULL), (541, 90, 13, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (542, 90, 29, '2000', '["morning_and_evening"]', 3010.0000, NULL, NULL, NULL, NULL), (543, 90, 7, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (544, 90, 8, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (545, 91, 1, '3000', '["morning_and_evening"]', 2543.7000, NULL, NULL, NULL, NULL), (546, 91, 9, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (547, 91, 10, '5', '["evening"]', 6.1735, NULL, NULL, NULL, NULL), (548, 91, 13, '10', '["morning"]', 23.7290, NULL, NULL, NULL, NULL), (549, 91, 29, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (550, 91, 7, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (551, 91, 8, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (552, 92, 1, '5000', '["morning_and_evening"]', 4252.5000, NULL, NULL, NULL, NULL), (553, 92, 9, '10', '["morning_and_evening"]', 0.2230, NULL, NULL, NULL, NULL), (554, 92, 10, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (555, 92, 13, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (556, 92, 29, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (557, 92, 7, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (558, 92, 8, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (559, 93, 1, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (560, 93, 9, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (561, 93, 10, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (562, 93, 13, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (563, 93, 29, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (564, 93, 7, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (565, 93, 8, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (566, 95, 1, '1000', '["morning_and_evening"]', 100000.0000, NULL, NULL, NULL, NULL), (567, 95, 9, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (568, 95, 10, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (569, 95, 13, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (570, 95, 29, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (571, 95, 31, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (572, 95, 34, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (573, 95, 35, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (574, 95, 7, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (575, 95, 8, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (576, 96, 1, '2000', '["evening","bedtime"]', 20.0000, NULL, NULL, NULL, NULL), (577, 96, 9, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (578, 96, 10, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (579, 96, 13, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (580, 96, 29, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (581, 96, 31, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (582, 96, 34, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (583, 96, 35, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (584, 96, 7, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL), (585, 96, 8, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
