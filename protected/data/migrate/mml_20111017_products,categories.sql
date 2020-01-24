# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.8
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2011-10-18 00:51:31
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
  KEY `FK_categories_categories` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mml.categories: 13 rows
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT IGNORE INTO `categories` (`id`, `parent_id`, `name`, `sel_rank`) VALUES
	(1, 13, 'Amino Acid', 2),
	(2, 13, 'Antioxidants', 3),
	(3, 13, 'Bone & Joint Support', 4),
	(4, 13, 'Brain Support', 5),
	(5, 13, 'Fiber and Digestive Support', 6),
	(6, 13, 'Herbal and Phyto Extract', 7),
	(7, 13, 'Hormone Support', 8),
	(8, 13, 'Immune ', 9),
	(9, 13, 'Minerals', 10),
	(10, 13, 'Vitamins', 11),
	(11, 13, 'Weight and Glucose Management', 12),
	(12, 0, 'Dispensed', 13),
	(13, 0, 'Compound', 1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


# Dumping structure for table mml.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL DEFAULT '0',
  `display_name` varchar(500) DEFAULT NULL,
  `category_id` bigint(11) NOT NULL,
  `unit_id` int(10) NOT NULL,
  `default_consume_time` varchar(100) DEFAULT NULL,
  `note` text,
  `recommended_dosage` varchar(200) DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `price_base` double DEFAULT NULL,
  `price_formula` varchar(1000) DEFAULT NULL,
  `price_var` double DEFAULT NULL,
  `volume_base` double DEFAULT NULL,
  `volume_formula` varchar(1000) DEFAULT NULL,
  `volume_var` double DEFAULT NULL,
  `stock_balance` decimal(20,8) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_products_categories` (`category_id`),
  KEY `FK_products_product_unit` (`unit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

# Dumping data for table mml.products: 126 rows
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT IGNORE INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`, `stock_balance`, `description`) VALUES
	(1, '0', 'L-Arginine ; mg                                     ', 1, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(2, '0', 'L-Carnitine ; mg', 1, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(3, '0', 'L-Carnosine ; mg', 1, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(4, '0', 'L-Cystine ; mg                                  ', 1, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(5, '0', 'L-Glutamic Acid ; mg                                ', 1, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(6, '0', 'L-Glutamine ; mg                                 ', 1, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(7, '0', 'L-Lysine Monohydrochloride ; mg              ', 1, 1, '["morning_and_evening"]', NULL, '100-250', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(8, '0', 'L-Methionine ; mg                                    ', 1, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(9, '0', 'L-Ornithine ; mg', 1, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(10, '0', 'L-Phenylalanine ; mg                             ', 1, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(11, '0', 'L-Tryptophan ; mg                                     ', 1, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(12, '0', 'L-Tyrosine ; mg                                     ', 1, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(13, '0', 'Taurine ; mg                                           ', 1, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(14, '0', 'Alpha Lipoic Acid ; mg', 2, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(15, '0', 'Astaxanthin ; mg', 2, 1, '["morning_and_evening"]', NULL, '2-6', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(16, '0', 'Coenzyme Q10 ; mg', 2, 1, '["morning_and_evening"]', NULL, '30', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(17, '0', 'Grape Seed Extract ; mg', 2, 1, '["morning_and_evening"]', NULL, '300', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(18, '0', 'Green Tea Extract Decaff ; mg', 2, 1, '["morning_and_evening"]', NULL, '100-1,500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(19, '0', 'L-Glutathione ; mg                                   ', 2, 1, '["morning_and_evening"]', NULL, '50', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(20, '0', 'Lycopene, Tomato Extract ; mg                                        ', 2, 1, '["morning_and_evening"]', NULL, '20', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(21, '0', 'Milk Thistle Silymarin ; mg', 2, 1, '["morning_and_evening"]', NULL, '160-800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(22, '0', 'N-Acetyl-L-Cysteine ; mg                             ', 2, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(23, '0', 'Pomegranate ; mg', 2, 1, '["morning_and_evening"]', NULL, '500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(24, '0', 'Pycnogynol, Pine Extract ; mg', 2, 1, '["morning_and_evening"]', NULL, '50-360', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(25, '0', 'Resveratrol ; mg', 2, 1, '["morning_and_evening"]', NULL, '250', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(26, '0', 'Chondroitin SCP ; mg', 3, 1, '["morning_and_evening"]', NULL, '800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(27, '0', 'Glucosamine Hydrochoride ; mg                          ', 3, 1, '["morning_and_evening"]', NULL, '500-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(28, '0', 'Citicoline ; mg', 4, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(29, '0', 'Ginkgo Biloba Phytosome ; mg', 4, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(30, '0', 'Ginkgo Serine ; mg', 4, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(31, '0', 'Lecithin ; mg', 4, 1, '["morning_and_evening"]', NULL, '500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(32, '0', 'Digestzyme ; mg', 5, 1, '["morning_and_evening"]', NULL, '250-500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(33, '0', 'Fiber FOS ; mg', 5, 1, '["morning_and_evening"]', NULL, '3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(34, '0', 'Fiber Psyllium Husk ; mg', 5, 1, '["morning_and_evening"]', NULL, '1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(35, '0', 'Lactobacillus Acidophilus ; mg (6 billion units/g)', 5, 1, '["morning_and_evening"]', NULL, '150', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(36, '0', 'Ashwagandha Extract ; mg', 6, 1, '["morning_and_evening"]', NULL, '450', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(37, '0', 'Bacopin, Bacopa Monniera ; mg', 6, 1, '["morning_and_evening"]', NULL, '50-300', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(38, '0', 'Beta Glucan ; mg', 6, 1, '["morning_and_evening"]', NULL, '40-500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(39, '0', 'Butea, Red Kwao Krua ; mg', 6, 1, '["morning_and_evening"]', NULL, '300-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(40, '0', 'Bilberry ; mg', 6, 1, '["morning_and_evening"]', NULL, '80-200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(41, '0', 'BioPerine, Black Pepper ; mg', 6, 1, '["morning_and_evening"]', NULL, '5-100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(42, '0', 'Black Cohosh ; mg', 6, 1, '["morning_and_evening"]', NULL, '80', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(43, '0', 'Centellin, Gotu Kola ; mg', 6, 1, '["morning_and_evening"]', NULL, '60-350', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(44, '0', 'Chlorophyll ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(45, '0', 'Citrus Bioflavonoids ; mg', 6, 1, '["morning_and_evening"]', NULL, '300-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(46, '0', 'Curbilene, Pumpkin Seed ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(47, '0', 'Curcumin C3 ; mg', 6, 1, '["morning_and_evening"]', NULL, '100-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(48, '0', 'Emblic Extract ; mg', 6, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(49, '0', 'Gamma Oryzanol, Rice Extract ; mg', 6, 1, '["morning_and_evening"]', NULL, '600', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(50, '0', 'Garlic ; mg', 6, 1, '["morning_and_evening"]', NULL, '600', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(51, '0', 'Ginseng ; mg', 6, 1, '["morning_and_evening"]', NULL, '200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(52, '0', 'Hawthron Extract ; mg', 6, 1, '["morning_and_evening"]', NULL, '100-1,200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(53, '0', 'Horsetail ; mg', 6, 1, '["morning_and_evening"]', NULL, '300-6,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(54, '0', 'Indole-3-Carbinol ; mg', 6, 1, '["morning_and_evening"]', NULL, '300', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(55, '0', 'Licorice ; mg', 6, 1, '["morning_and_evening"]', NULL, '500-4,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(56, '0', 'Madeglucyl ; mg', 6, 1, '["morning_and_evening"]', NULL, '500-1,500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(57, '0', 'Oleaselect, Olive Pulp Extract ; mg', 6, 1, '["morning_and_evening"]', NULL, '25-100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(58, '0', 'Phytosterol ; mg', 6, 1, '["morning_and_evening"]', NULL, '800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(59, '0', 'Policosanol, Saccharum Officinarum ; mg', 6, 1, '["morning_and_evening"]', NULL, '5-50', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(60, '0', 'Rosemary ; mg', 6, 1, '["morning_and_evening"]', NULL, '5-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(61, '0', 'Safflower Extract ; mg', 6, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(62, '0', 'Saw Palmetto Serenoa ; mg ', 6, 1, '["morning_and_evening"]', NULL, '320', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(63, '0', 'Soy Isoflavone ; mg', 6, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(64, '0', 'Soy Peptide ; mg', 6, 1, '["morning_and_evening"]', NULL, '200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(65, '0', 'Silyphos ; mg', 6, 1, '["morning_and_evening"]', NULL, '180-600', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(66, '0', 'Triphala, Terminalia Extract ; mg', 6, 1, '["morning_and_evening"]', NULL, '150-500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(67, '0', 'Valerian Extract ; mg', 6, 1, '["morning_and_evening"]', NULL, '400-900', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(68, '0', 'Activator Formula (510 mg)', 7, 1, '["morning_and_evening"]', NULL, '510', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(69, '0', 'Adrenal Support Formula (15 mg)', 7, 1, '["morning_and_evening"]', NULL, '15', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(70, '0', 'Adrenal Support Advance Formula (25 mg)', 7, 1, '["morning_and_evening"]', NULL, '25', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(71, '0', 'Pregnenolone (100 mg)', 7, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(72, '0', 'Relax Formula (100 mg)', 7, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(73, '0', 'Sleep Junior Formula (1 mg)', 7, 1, '["morning_and_evening"]', NULL, '1', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(74, '0', 'Sleep Advance Formula (3 mg)', 7, 1, '["morning_and_evening"]', NULL, '3', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(75, '0', 'Slim Advance Formula (100 mg)', 7, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(76, '0', 'Ashitaba, Japanese Angelica ; mg', 8, 1, '["morning_and_evening"]', NULL, '100-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(77, '0', 'Echinacea Extract ; mg', 8, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(78, '0', 'AHCC Mushroom Mycelia Extract ; mg', 8, 1, '["morning_and_evening"]', NULL, '750', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(79, '0', 'Reishi ; mg', 8, 1, '["morning_and_evening"]', NULL, '100-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(80, '0', 'Boron, Chelate ; mg         ', 9, 1, '["morning_and_evening"]', NULL, '1', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(81, '0', 'Calcium, Chelate ; mg', 9, 1, '["morning_and_evening"]', NULL, '1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(82, '0', 'Chromium, Chelate ; mcg         ', 9, 1, '["morning_and_evening"]', NULL, '200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(83, '0', 'Copper ; mg        ', 9, 1, '["morning_and_evening"]', NULL, '2', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(84, '0', 'Iodine ; mcg', 9, 1, '["morning_and_evening"]', NULL, '150', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(85, '0', 'Iron, Chelate ; mg                 ', 9, 1, '["morning_and_evening"]', NULL, 'M : 0 F : 10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(86, '0', 'Magnesium, Chelate ; mg                              ', 9, 1, '["morning_and_evening"]', NULL, '250', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(87, '0', 'Manganese, Chelate ; mg  ', 9, 1, '["morning_and_evening"]', NULL, '4', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(88, '0', 'Molybdenum, Chelate ; mcg      ', 9, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(89, '0', 'Phosphorus ; mg', 9, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(90, '0', 'Potassium ; mg', 9, 1, '["morning_and_evening"]', NULL, '600', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(91, '0', 'Selenium, Chelate ; mcg         ', 9, 1, '["morning_and_evening"]', NULL, '200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(92, '0', 'Vanadium, Chelate ; mcg      ', 9, 1, '["morning_and_evening"]', NULL, '20', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(93, '0', 'Zinc, Chelate ; mg                                   ', 9, 1, '["morning_and_evening"]', NULL, '20', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(94, '0', 'Vitamin A ; IU                  ', 10, 1, '["morning_and_evening"]', NULL, '2,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(95, '0', 'Thiamin Hydrochloride (B1) ; mg         ', 10, 1, '["morning_and_evening"]', NULL, '10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(96, '0', 'Riboflavin-5-Phosphate (B2) ; mg        ', 10, 1, '["morning_and_evening"]', NULL, '5', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(97, '0', 'Niacinamide (B3) ; mg         ', 10, 1, '["morning_and_evening"]', NULL, '10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(98, '0', 'Calcium-D-Pantothenate (B5) ; mg      ', 10, 1, '["morning_and_evening"]', NULL, '10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(99, '0', 'Pyridoxine Hydrochloride (B6) ; mg         ', 10, 1, '["morning_and_evening"]', NULL, '10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(100, '0', 'Biotin (Vit H) ; mcg       ', 10, 1, '["morning_and_evening"]', NULL, '300', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(101, '0', 'Folic Acid (B9) ; mcg         ', 10, 1, '["morning_and_evening"]', NULL, '400', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(102, '0', 'Cyanocobalamin (B12) ; mcg       ', 10, 1, '["morning_and_evening"]', NULL, '10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(103, '0', 'Inositol ; mg', 10, 1, '["morning_and_evening"]', NULL, '250-500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(104, '0', 'Vitamin C ; mg', 10, 1, '["morning_and_evening"]', NULL, '1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(105, '0', 'Vitamin D3 ; IU                      ', 10, 1, '["morning_and_evening"]', NULL, '400', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(106, '0', 'Vitamin E ; IU', 10, 1, '["morning_and_evening"]', NULL, '400', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(107, '0', 'D-Gamma Tocopherol ; IU', 10, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(108, '0', 'Tocotrienol ; mg', 10, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(109, '0', 'Black Ginger Extract ; mg', 11, 1, '["morning_and_evening"]', NULL, '500-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(110, '0', 'Capsicum Extract ; mg', 11, 1, '["morning_and_evening"]', NULL, '250-1,500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(111, '0', 'Citrin, Garcinia Cambogia ; mg', 11, 1, '["morning_and_evening"]', NULL, '250-2,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(112, '0', 'Conjugated Linoleic Acids ; mg', 11, 1, '["morning_and_evening"]', NULL, '800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(113, '0', 'Fabenol, White Kidney Bean ; mg', 11, 1, '["morning_and_evening"]', NULL, '100-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(114, '0', 'Forslean, Coleus Forskohlii ; mg', 11, 1, '["morning_and_evening"]', NULL, '50-500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(115, '0', 'Garcinia Extract ; mg', 11, 1, '["morning_and_evening"]', NULL, '500-2,800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(116, '0', 'Gaurana ; mg', 11, 1, '["morning_and_evening"]', NULL, '150-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(117, '0', 'Konjac ; mg', 11, 1, '["morning_and_evening"]', NULL, '500-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(118, '0', 'Senna Extract ; mg', 11, 1, '["morning_and_evening"]', NULL, '20-30', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(119, '0', 'Spirulina ; mg', 11, 1, '["morning_and_evening"]', NULL, '100-2,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(120, '0', 'Evening Primrose Oil (500 mg)', 12, 1, '["morning_and_evening"]', NULL, '500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(121, '0', 'Fish Oil (1000 mg EPA180 / DHA120)', 12, 1, '["morning_and_evening"]', NULL, '1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(122, '0', 'Fish Oil (1000 mg EPA300 / DHA200)', 12, 1, '["morning_and_evening"]', NULL, '1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(123, '0', 'Flax Seed Oil (1000 mg) ', 12, 1, '["morning_and_evening"]', NULL, '1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(124, '0', 'Sustained Release Vit C (500 mg)', 12, 1, '["morning_and_evening"]', NULL, '500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(125, '0', 'Vitamin K (100 mcg)', 12, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL),
	(126, '0', 'Whey Protein Isolate (31g)', 12, 1, '["morning_and_evening"]', NULL, '31', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL, 0.00000000, NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
