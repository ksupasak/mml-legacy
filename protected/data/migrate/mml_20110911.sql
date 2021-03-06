-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- โฮสต์: localhost
-- เวลาในการสร้าง: 10 ก.ย. 2011  น.
-- รุ่นของเซิร์ฟเวอร์: 5.0.51
-- รุ่นของ PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- ฐานข้อมูล: `mml`
-- 

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `categories`
-- 

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(11) NOT NULL default '0',
  `parent_id` bigint(11) default NULL,
  `name` varchar(100) default NULL,
  `sel_rank` int(10) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_categories_categories` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- dump ตาราง `categories`
-- 

INSERT INTO `categories` (`id`, `parent_id`, `name`, `sel_rank`) VALUES (1, 0, 'Compounded', 1);
INSERT INTO `categories` (`id`, `parent_id`, `name`, `sel_rank`) VALUES (2, 0, 'Dispensed', 10);
INSERT INTO `categories` (`id`, `parent_id`, `name`, `sel_rank`) VALUES (3, 1, 'Vitamin', 2);
INSERT INTO `categories` (`id`, `parent_id`, `name`, `sel_rank`) VALUES (4, 1, 'Micronutrient', 3);
INSERT INTO `categories` (`id`, `parent_id`, `name`, `sel_rank`) VALUES (5, 1, 'Antioxidant', 4);
INSERT INTO `categories` (`id`, `parent_id`, `name`, `sel_rank`) VALUES (6, 1, 'Amino Acid', 5);
INSERT INTO `categories` (`id`, `parent_id`, `name`, `sel_rank`) VALUES (7, 1, 'Weight Loss', 6);
INSERT INTO `categories` (`id`, `parent_id`, `name`, `sel_rank`) VALUES (8, 1, 'Digestive Support', 7);
INSERT INTO `categories` (`id`, `parent_id`, `name`, `sel_rank`) VALUES (9, 1, 'Immune', 8);
INSERT INTO `categories` (`id`, `parent_id`, `name`, `sel_rank`) VALUES (10, 1, 'Herbal Extract', 9);

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `customers`
-- 

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL,
  `hospital_id` int(11) default NULL,
  `account_name` varchar(500) default NULL,
  `billing_address` varchar(45) default NULL,
  `clinician_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `customer_hospital` (`hospital_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- dump ตาราง `customers`
-- 

INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (12, 3, 'Some account', '112 ถ.ราชวิถี', 4);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (13, 4, 'ดร.ทวีศักดิ์ มหชวโรจน์  @ รพ.กรุงเทพคริสเตียน ', NULL, 5);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (14, 5, 'พล.ร.ต.นพ.สุรเชษฐ สู่พานิช  @ รพ.กรุงธน ', NULL, 6);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (15, 6, 'นพ.ไศล สุขพันธ์โพธาราม  @ รพ.กรุงธน2 ', NULL, 7);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (16, 7, 'นพ.สุวัฒน์ วิทยาคม  @ รพ.กรุณาพิทักษ์ ', NULL, 8);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (17, 8, 'คุณพูลชัย ชเนศร์  @ รพ.กล้วยน้ำไท ', NULL, 9);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (18, 9, 'นพ.ฐิติ พัฒนกำจร  @ รพ.เกษมราษฎร์สุขาภิบาล3 ', NULL, 10);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (19, 10, 'นพ.สุวิทย์ โฆษิตสุรังคกุล  @ รพ.เกษมราษฎร์ บางแค ', NULL, 11);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (20, 11, 'นพ.ธวัชชัย วานิชกร  @ รพ.เกษมราษฎร์ ประชาชื่น ', NULL, 12);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (21, 12, 'นพ.ชัยพฤกษ์ ปิยะเกศิน  @ รพ.คามิลเลียน ', NULL, 13);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (22, 13, 'นพ.นพรัตน์ สุจริตจันทร์  @ รพ.จักษุ รัตนิน ', NULL, 14);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (23, 14, 'นพ.จงเจตน์ อาวเจนพงษ์  @ รพ.เจตนิน ', NULL, 15);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (24, 15, 'นพ.จำเริญ สรพิพัฒน์  @ รพ.เจ้าพระยา ', NULL, 16);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (25, 16, 'นพ.สุชัย หยองอนุกูล์  @ รพ.เซนต์คาร์ลอส ', NULL, 17);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (26, 17, 'ศ.นพ.จิตร สิทธิอมร  @ รพ.เซนต์หลุยส์ ', NULL, 18);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (27, 18, 'พญ.ลักษมี ว่องกุศลกิจ  @ รพ.เซ็นทรัลเยนเนอรัล ', NULL, 19);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (28, 19, 'นพ.สราวุธ อนันต์เศรษฐกุล  @ รพ.เดชา ', NULL, 20);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (29, 20, 'นพ.ศุภชัย โชติบุตร  @ รพ.ตา หู คอ จมูก ', NULL, 21);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (30, 21, 'ศ.นพ.เทพ หิมะทองคำ  @ รพ.เทพธารินทร์ ', NULL, 22);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (31, 22, 'นพ.เจริญ มีนสุข  @ รพ.ไทยนครินทร์ ', NULL, 23);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (32, 23, 'คุณเฉลิมกุล อภิกุลโอภาส  @ รพ.ธนบุรี ', NULL, 24);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (33, 24, 'นพ.วิโรจน์ ตระการวิจิตร  @ รพ.นครธน ', NULL, 25);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (34, 25, 'นพ.ประจักษ์ บุญจิตต์พิมล  @ รพ.นวมินทร์ ', NULL, 26);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (35, 26, 'นพ.อรรคพาสน์ โอวาทตระกูล  @ รพ.นวมินทร์ 9 ', NULL, 27);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (36, 27, 'พญ..เจรียง จันทรกมล  @ รพ.บางกอก 9 อินเตอร์เนชั่นแนล ', NULL, 28);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (37, 28, 'พญ.ลินดา ไกรวิทย์  @ รพ.บางกอกเนอสซิ่งโฮม ', NULL, 29);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (38, 29, 'นพ.ชุตินันท์ พรมมินทร์  @ รพ.บางนา ', NULL, 30);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (39, 30, 'นพ.วีระ อิงคภาสกร  @ รพ.บางปะกอก 1 ', NULL, 31);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (40, 31, 'นพ.มานิตย์ จารุวรรณ  @ รพ.บางปะกอก 2 บางบอน ', NULL, 32);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (41, 32, 'พญ.ศศิธร พงษ์สามารถ  @ รพ.บางไผ่ ', NULL, 33);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (42, 33, 'นพ.เกตุ สายเพชร์  @ รพ.บางโพ ', NULL, 34);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (43, 34, 'นพ.สุรสิทธิ์ อัศดามงคล  @ รพ.บางมด ', NULL, 35);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (44, 35, 'คุณแม็ค แบนเนอร์  @ รพ.บำรุงราษฎร์ ', NULL, 36);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (45, 36, 'รออ.นพ.พิทักษ์ ฐานบัญชา  @ รพ.บีแคร์ ', NULL, 37);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (46, 37, '   @ รพ.ปิยะเวท ', NULL, 38);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (47, 38, 'นพ.พิชัย แพร่ภัทร  @ รพ.เปาโล เมโมเรียล ', NULL, 39);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (48, 39, 'นพ.นพรัตน์ โง้วจุงดี  @ รพ.เปาโล เมโมเรียล โชคชัย 4 ', NULL, 40);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (49, 40, 'คุณไกรวิน ศรีไกรวิน  @ รพ.พญาไท 1 ', NULL, 41);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (50, 41, 'คุณธนา ถิรมนัส  @ รพ.พญาไท 2 ', NULL, 42);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (51, 42, 'นพ.อนันตศักดิ์ อภัยรัตน์  @ รพ.พญาไท 3 ', NULL, 43);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (52, 43, 'นพ.ปรีชา เลิศศิวาพร  @ รพ.พระราม 2 ', NULL, 44);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (53, 44, 'นพ.เสถียร ภู่ประเสริฐ  @ รพ.พระรามเก้า ', NULL, 45);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (54, 45, 'นพ.พิชิต ยิ่งเจริญ  @ รพ.เพชรเกษม-บางแค ', NULL, 46);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (55, 46, 'นพ.ชนะ ตันจันทร์พงษ์  @ รพ.เพชรเวช ', NULL, 47);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (56, 47, 'นพ.สวัสดิ์ เถกิงเดช  @ รพ.แพทย์ปัญญา ', NULL, 48);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (57, 48, 'นพ.เหรียญทอง แน่นหนา  @ รพ.มงกุฎวัฒนะ ', NULL, 49);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (58, 49, 'นพ.ชูเกียรติ ศุภนันตฤกษ์  @ รพ.มเหสักข์ ', NULL, 50);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (59, 50, 'คุณสมชัย ชื่นจิตร  @ รพ.มิชชั่น ', NULL, 51);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (60, 51, 'นพ.ภาวิต ปุญญฤทธ์  @ รพ.เมโย ', NULL, 52);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (61, 52, 'นพ. เกริกยศ ชลายนเดชะ  @ รพ.ยันฮี ', NULL, 53);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (62, 53, 'นพ.ธวัชชัย เจริญวงศ์  @ รพ.เยาวรักษ์ ', NULL, 54);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (63, 54, 'ทพ.เจิมพล ภูมิตระกูล  @ รพ.รามคำแหง ', NULL, 55);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (64, 55, 'คุณนิตยา ปรีชายุทธ  @ รพ.ราษฎร์บูรณะ ', NULL, 56);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (65, 56, 'นพ.วรพงศ์ จูตะวิริยะ  @ รพ.ลาดพร้าว ', NULL, 57);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (66, 57, 'พล.ท.นพ.ณรงค์ รอดวรรณะ  @ รพ.วิชัยยุทธ ', NULL, 58);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (67, 58, 'พล.ท.นพ.พร้อมพงษ์ พีระบูล  @ รพ.วิภาวดี ', NULL, 59);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (68, 59, 'นพ.ไพบูลย์ เอกแสงศรี  @ รพ.วิภาราม ', NULL, 60);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (69, 60, 'ร.อ.ชาคริต ศึกษากิจ  @ รพ.เวชธานี ', NULL, 61);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (70, 61, 'นพ.ถนอมชัย คู่ทวีธรรม  @ รพ.ศรีวิชัย 1 ', NULL, 62);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (71, 62, 'นพ.สุรพล โล่สิริวัฒน์  @ รพ.ศรีวิชัย 2 ', NULL, 63);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (72, 63, 'นพ.นิพนธ์ ธีราโมก  @ รพ.เปาโลเมโมเรียล นวมินทร์ ', NULL, 64);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (73, 64, 'นพ.ธงชัย ฉัตรยิ่งมงคล  @ รพ.ศิครินทร์ ', NULL, 65);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (74, 65, 'นพ.เทอดศักดิ์ ปรมากูล  @ รพ.ศูนย์มะเร็งกรุงเทพฯ ', NULL, 66);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (75, 66, 'นพ.โชคชัย จารุศิริพิพัฒน์  @ รพ.สมิติเวช สุขุมวิท ', NULL, 67);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (76, 67, 'นพ.ดุลย์ ดำรงศักดิ์  @ รพ.สมิติเวชศรีนครินทร์ ', NULL, 68);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (77, 68, 'น.ท.พญ.ลักษมี ว่องกุศลกิจ  @ รพ.สายไหม ', NULL, 69);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (78, 69, 'นพ.ศิริพงษ์ เหลืองวารินกุล  @ รพ.สินแพทย์ ', NULL, 70);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (79, 70, 'นพ.ดาวิน นารูลา  @ รพ.สุขุมวิท ', NULL, 71);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (80, 71, 'นพ.พรชัย ตั้งลัคนวาณิชย์  @ รพ.หัวเฉียว ', NULL, 72);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (81, 72, 'นพ.ไกรสิทธิ์ นฤขัตพิชัย  @ รพ.มนารมย์ ', NULL, 73);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (82, 73, 'นพ.ตุลวรรธน์ พัชราภา  @ รพ.เกษมราษฎร์รัตนาธิฯ ', NULL, 74);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (83, 74, 'คุณกมลวรรณ ลักษณะกาญจน์  @ รพ.แม่น้ำ ', NULL, 75);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (84, 75, 'นพ.พรมพันธ์ พรมมาส  @ รพ.นนทเวช ', NULL, 76);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (85, 76, 'นพ.อนันต์ ธรรมจำรัสศรี  @ รพ.อนันต์พัฒนา 2 ', NULL, 77);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (86, 77, 'นพ.สุชัย หยองอนุกูล  @ รพ.กรุงสยามเซนต์คาร์ลอส ', NULL, 78);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (87, 78, 'นพ.กฤชรัตน์ ตระกูลช่าง  @ รพ.แพทย์รังสิต ', NULL, 79);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (88, 79, 'คุณพูนศักดิ์ จรูญศิริ  @ รพ.ภัทร-ธนบุรี ', NULL, 80);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (89, 80, 'นพ.สุนทร อันตรเสน  @ รพ.เอกปทุม ', NULL, 81);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (90, 81, 'นพ.ส่งเสริม พานิชาภรณ์  @ รพ.นวนครการแพทย์ ', NULL, 82);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (91, 82, 'นพ.สุธีร์ สทุมถิระ  @ รพ.ปทุมเวช ', NULL, 83);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (92, 83, 'นพ.บุญชัย อิศราพิสิษฐ์  @ รพ.ราชธานี ', NULL, 84);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (93, 84, 'คุณวิโรจน์ อภิสิทธิ์วิทยา  @ รพ.ศุภมิตรเสนา ', NULL, 85);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (94, 85, 'นพ.ณรงค์ฤทธิ์ ฮาวรังษี  @ รพ.กรุงเทพพระประแดง ', NULL, 86);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (95, 211, 'นพ.ณรงค์ฤทธิ์ ฮาวรังษี  @ รพ.กรุงเทพหาดใหญ่ ', NULL, 86);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (96, 86, 'นพ.กำพล พลัสสินทร์  @ รพ.จุฬารัตน์ ', NULL, 87);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (97, 87, 'นพ.กำพล พลัสสินทร์  @ รพ.จุฬารัตน์ 3 ', NULL, 87);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (98, 86, 'นพ.กำพล พลัสสินทร์  @ รพ.จุฬารัตน์ ', NULL, 88);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (99, 87, 'นพ.กำพล พลัสสินทร์  @ รพ.จุฬารัตน์ 3 ', NULL, 88);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (100, 88, 'นพ.ยุทธนา สงวนศักดิ์โกศล  @ รพ.จุฬารัตน์ 9 ', NULL, 89);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (101, 89, 'นพ.ภาสกร รักษ์กุล  @ รพ.ชัยปราการ ', NULL, 90);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (102, 90, 'นพ.อนันต์ อธิพันธุ์อำไพ  @ รพ.เซ็นทรัลปาร์ค ', NULL, 91);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (103, 91, 'นพ.นิคม ศิริชัย  @ รพ.บางปะกอก 3 ', NULL, 92);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (104, 92, 'นพ.ต่อพงศ์ อัศวิษณุ  @ รพ.ปิยะมินทร์ ', NULL, 93);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (105, 93, 'นพ.พิพัฒน์ พงศ์รัตนามาน  @ รพ.เมืองสมุทร ', NULL, 94);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (106, 94, 'นพ.พิพัฒน์ พงศ์รัตนามาน  @ รพ.เมืองสมุทรปู่เจ้าฯ ', NULL, 94);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (107, 93, 'นพ.พิพัฒน์ พงศ์รัตนามาน  @ รพ.เมืองสมุทร ', NULL, 95);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (108, 94, 'นพ.พิพัฒน์ พงศ์รัตนามาน  @ รพ.เมืองสมุทรปู่เจ้าฯ ', NULL, 95);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (109, 95, 'คุณธนวัฒน์ ทวีชัยถาวร  @ รพ.รวมชัยประชารักษ์ ', NULL, 96);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (110, 96, 'นพ.เขตโสภณ จัตวัฒนกุล  @ รพ.รัทรินทร์ ', NULL, 97);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (111, 97, 'นพ.โอภาส สินเพิ่มสุขสกุล  @ รพ.เปาโลเมโมเรียล สมุทรปราการ ', NULL, 98);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (112, 98, 'นพ.ศิริพงษ์ วิทยเลิศปัญญา  @ รพ.สำโรงการแพทย์ ', NULL, 99);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (113, 99, 'นพ.สุเทพ วัตถุศิลป์  @ รพ.รวมแพทย์ ชัยนาท ', NULL, 100);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (114, 100, 'นพ.พงษ์เทพ เลิศสุวรรณสิทธิ์  @ รพ.สุวรรณเวช ', NULL, 101);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (115, 101, 'นพ.วราศักดิ์ ไกรฤกษ์  @ รพ.เบญจรมย์ ', NULL, 102);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (116, 102, 'พญ.วรินทร อัศวนิก  @ รพ.เมืองนารายณ์ ', NULL, 103);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (117, 103, 'นพ.สมเจษฎ์ ไกรโรจนานันท์  @ รพ.เกษมราษฎร์ สระบุรี ', NULL, 104);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (118, 104, 'นพ.พนม สนิทประชากร  @ รพ.มิตรภาพ เมโมเรียล ', NULL, 105);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (119, 105, 'คุณไชยวัฒน์ วีระสมบัติ  @ รพ.คริสเตียนไชยวัฒน์ ', NULL, 106);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (120, 106, 'นพ.ประเจิด สุรีย์จามร  @ รพ.สิงห์บุรีเวชการ ', NULL, 107);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (121, 107, 'นพ.วิวัฒน์ กิตติวัฒนโชติ  @ รพ.ธนบุรี-อู่ทอง ', NULL, 108);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (122, 108, 'นพ.สำเริง ศรีผุดผ่อง  @ รพ.หมอสำเริง ', NULL, 109);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (123, 109, 'นพ.บุญชัย บุญแสง  @ รพ.พรชัย ', NULL, 110);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (124, 110, 'นพ.เมธ โชคชัยชาญ  @ รพ.ศุภมิตร ', NULL, 111);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (125, 111, 'นพ.ทรงกิจ สุทธิกาญจน์  @ รพ.ปิยราษฎร์ ', NULL, 112);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (126, 112, 'นพ.จารุวัฑ ใช้ความเพียร  @ รพ.กรุงเทพจันทบุรี ', NULL, 113);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (127, 113, 'นพ.กำธร ศิริธัญญาลักษณ์  @ รพ.สิริเวช ', NULL, 114);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (128, 114, 'พญ.ชุติมา ปิ่นเจริญ  @ รพ.จุฬารัตน์ 11 ', NULL, 115);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (129, 115, 'นพ.การุณ พุทธภาวนา  @ รพ.โสธราเวช ', NULL, 116);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (130, 116, 'นพ.พิชิต กังวลกิจ  @ รพ.กรุงเทพพัทยา ', NULL, 117);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (131, 117, 'พญ.วิมล สุรินทราบูรณ์  @ รพ.ชลเวช ', NULL, 118);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (132, 118, 'นพ.ธนาคม แมนธนานนท์  @ รพ.พญาไทศรีราชา ', NULL, 119);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (133, 119, 'นพ.สมเกียรติ ธนไพศาลพิพัฒน์  @ รพ.พัทยาเมโมเรียล ', NULL, 120);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (134, 120, 'คุณอุไรวรรณ เทพนมรัตน์  @ รพ.พัทยาอินเตอร์ ', NULL, 121);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (135, 121, 'นพ.ชัยรัตน์ ปัณฑุรอัมพร  @ รพ.สมิติเวช ศรีราชา ', NULL, 122);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (136, 122, 'ผศ.รังสรรค์ สุฉันทบุตร  @ รพ.แหลมฉบังอินเตอร์ ', NULL, 123);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (137, 123, 'นพ.จรัล ใจแพทย์  @ รพ.เอกชล ', NULL, 124);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (138, 124, 'นพ.สานิตย์ ชากฤษณ์  @ รพ.เอกชล 2 ', NULL, 125);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (139, 125, 'พญ.สุดจิต ลิขสิทธิ์ศุภการ  @ รพ.กรุงเทพตราด ', NULL, 126);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (140, 126, 'นพ.นิยม สลิสอำไพ  @ รพ.มงกุฎ ระยอง ', NULL, 127);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (141, 127, 'นพ.กริช สัตยบุตร  @ รพ.รวมแพทย์ระยอง ', NULL, 128);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (142, 128, 'นพ.วิโรจน์ ดิเรกสถาพร  @ รพ.กรุงเทพคริสเตียน ', NULL, 129);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (143, 129, 'นพ.วรวิทย์ วัชโรทยางกูร  @ รพ.เทพากร ', NULL, 130);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (144, 130, 'นพ.จรัสพงษ์ ทังสุบุตร  @ รพ.ศาลายา ', NULL, 131);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (145, 131, 'นพ.ทรงชัย ศรีโรจนกุล  @ รพ.สนามจันทร์ ', NULL, 132);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (146, 132, 'นพ.เอกลาภ ทองบริสุทธิ์  @ รพ.ซาน เปา โล หัวหิน ', NULL, 133);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (147, 133, 'ภญ.รพีพร กิตติวงศ์โสภณ  @ รพ.เมืองเพชร-ธนบุรี ', NULL, 134);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (148, 134, 'นพ.สัมฤทธิ์ สินธัญญาธรรม  @ รพ.เพชรรัชต์ ', NULL, 135);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (149, 135, 'คุณจิรวัฒน์ สุจิรานุธรรม  @ รพ.ซานคามิลโล ', NULL, 136);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (150, 136, 'นพ.ประสงค์ ประภาวงศ์  @ รพ.พร้อมแพทย์ ', NULL, 137);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (151, 137, 'นพ.กมิล ปั้นประสงค์  @ รพ.เมืองราช ', NULL, 138);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (152, 138, 'พญ.สุวรรณา ชูพิศาลยโรจน์  @ รพ.แม่กลอง 2 ', NULL, 139);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (153, 139, 'นพ.อิทธิ ฉันศิริกาญจน  @ รพ.มหาชัย ', NULL, 140);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (154, 140, 'พญ.ดาวัลย์ อนุวุฒินาวิน  @ รพ.มหาชัย 2 ', NULL, 141);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (155, 141, 'นพ.พงษ์ศักดิ์ วัฒนา  @ รพ.ศรีวิชัย 3 ', NULL, 142);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (156, 142, 'พญ.สายสุนี วรรณดุรงค์วรรณ  @ รพ.ศรีวิชัย 5 ', NULL, 143);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (157, 143, 'นพ.เกรียงไกร จีระแพทย์  @ รพ.เอกชัย ', NULL, 144);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (158, 144, 'นพ.โกวิท คำพิทักษ์  @ รพ.บัวใหญ่รวมแพทย์ ', NULL, 145);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (159, 145, 'นพ.ประณีต สงวนตระกูล  @ รพ.ป.แพทย์ ', NULL, 146);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (160, 146, 'นพ.ธนรัชต์ สมุทรเพชร  @ รพ.กรุงเทพราชสีมา ', NULL, 147);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (161, 147, 'นพ.บรรพต พึ่งชัยพัฒน์  @ รพ.เซ็นต์เมรี่ ', NULL, 148);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (162, 148, 'นพ.วรพงษ์ ศักดิ์ศิรินุกูล  @ รพ.เอกชนบุรีรัมย์ ', NULL, 149);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (163, 149, 'นพ.อิสระ อริยะชัยพาณิชย์  @ รพ.รวมแพทย์สุรินทร์(หมออนันต์) ', NULL, 150);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (164, 150, 'นพ.ธีรวัฒน์ ร่มไทรทอง  @ รพ.ธีรวัฒน์ ', NULL, 151);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (165, 151, 'นพ.สมชาย กิตติพงษ์หรรษา  @ รพ.ขอนแก่นราม ', NULL, 152);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (166, 152, 'นพ.ธีระวัฒน์ ศรีนัครินทร์  @ รพ.ราชพฤกษ์ ', NULL, 153);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (167, 153, 'คุณอนัญพร พูลนิติพร  @ รพ.เวชประสิทธิ์ ', NULL, 154);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (168, 154, 'นพ.บุญชัย จิตตนาสวัสดิ์  @ รพ.เมืองเลยราม ', NULL, 155);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (169, 155, 'คุณสมคิด ปิยะธรรมวุฒิกุล  @ รพ.รักษ์สกล ', NULL, 156);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (170, 156, 'พญ.ศุภวรรณ ตั้งสืบกุล  @ รพ.นอร์ทอีสเทร์น-วัฒนา ', NULL, 157);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (171, 157, 'นพ.ปัญญา อยู่ประเสริฐ  @ รพ.ปัญญาเวช ', NULL, 158);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (172, 158, 'คุณวิเชียร ชมดง  @ รพ.เอกอุดร ', NULL, 159);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (173, 159, 'นพ.ธีระยุทธ นิยากูล  @ รพ.มุกดาหารอินเตอร์ ', NULL, 160);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (174, 160, 'นพ.หาญ สุฉันทบุตร  @ รพ.นายแพทย์หาญ ', NULL, 161);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (175, 161, 'นพ.หาญ สุฉันทบุตร  @ รพ.ยโสธรรวมแพทย์ ', NULL, 161);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (176, 160, 'นพ.หาญ สุฉันทบุตร  @ รพ.นายแพทย์หาญ ', NULL, 162);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (177, 161, 'นพ.หาญ สุฉันทบุตร  @ รพ.ยโสธรรวมแพทย์ ', NULL, 162);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (178, 162, 'พญ.กฤษณา โฆษิตจิรนันท์  @ รพ.กรุงเทพจุรีเวช ', NULL, 163);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (179, 163, 'ภก.สมพร จึงศิรกุลวิทย์  @ รพ.ประชารักษ์ ', NULL, 164);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (180, 164, 'นพ.สุรชัย สุพันธมาตย์  @ รพ.อุบลรักษ์ ธนบุรี ', NULL, 165);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (181, 165, 'นพ.นภดล ลุประสงค์  @ รพ.แพทย์บัณฑิต ', NULL, 166);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (182, 166, 'นพ.กิตติ ตั้งบรรเจิดสุข  @ รพ.รวมแพทย์ นครสวรรค์ ', NULL, 167);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (183, 167, 'นพ.ชวลิต วิมลเฉลา  @ รพ.ศรีสวรรค์ ', NULL, 168);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (184, 168, 'นพ.วิสิทธิ์ อวิรุทธ์นันท์  @ รพ.ปากน้ำโพ ', NULL, 169);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (185, 169, 'นพ.พรชัย สัตยาประเสริฐ  @ รพ.ร่มฉัตร ', NULL, 170);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (186, 170, 'พญ.สุรางค์รัตน์ วรรธนภูติ  @ รพ.รัตนเวช นครสวรรค์ ', NULL, 171);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (187, 171, 'นพ.สุชาติ กุละพัฒน์  @ รพ.พัฒนเวชสุโขทัย ', NULL, 172);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (188, 172, 'นพ.พจนารถ จันทโรจวงศ์  @ รพ.รวมแพทย์สุโขทัย ', NULL, 173);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (189, 173, 'คุณบุญเลิศ คำนึงสิทธิ  @ รพ.ตะพานหินรวมแพทย์ ', NULL, 174);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (190, 174, 'นพ.เสริมสุข เหลาหชัยอรุณ  @ รพ.สหเวชพิจิตร ', NULL, 175);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (191, 175, 'นพ.สุเทพ นิ่มพิทักษ์พงศ์  @ รพ.พิษณุเวช ', NULL, 176);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (192, 176, 'นพ.พีระเชษฐ์ ภู่เกียรติ  @ รพ.รวมแพทย์ พิษณุโลก ', NULL, 177);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (193, 177, 'นพ.อุดม วาริทนันท์  @ รพ.รัตนเวช พิษณุโลก ', NULL, 178);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (194, 178, 'นพ.ยงยศ จริยวิทยาวัฒน์  @ รพ.อินเตอร์เวชการ ', NULL, 179);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (195, 179, 'นพ.พิเชษฐ์ อิศวสัมฤทธิ์  @ รพ.นครหล่ม ', NULL, 180);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (196, 180, 'ทพ.ประจวบ จันทรคิด  @ รพ.เพชรรัตน์ ', NULL, 181);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (197, 181, 'นพ.สถาปน์ ชินวงศ์  @ รพ.แพร่คริสเตียน ', NULL, 182);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (198, 182, 'นพ.วรชัย วงศ์วรกุล  @ รพ.แพร่-ราม ', NULL, 183);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (199, 183, 'นพ.สมชัย ตั้งพร้อมพันธ์  @ รพ.เกษมราษฎร์ศรีบุรินทร์ ', NULL, 184);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (200, 184, 'นพ.วิฑูรย์ ยงเมธาวุฒิ  @ รพ.โอเวอร์บรุ๊ค ', NULL, 185);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (201, 185, 'นพ.อำนวย ชิงชยานุรักษ์  @ รพ.ช้างเผือก ', NULL, 186);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (202, 186, 'นพ.ศยาม เวศกิจกุล  @ รพ.เชียงใหม่ใกล้หมอ ', NULL, 187);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (203, 187, 'นพ.วรพันธ์ อุณจักร  @ รพ.เชียงใหม่ราม ', NULL, 188);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (204, 189, 'นพ.วรพันธ์ อุณจักร  @ รพ.เทพปัญญา ', NULL, 188);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (205, 188, 'คุณวรัญญา เลี้ยงลักษณ์เลิศ  @ รพ.เซ็นทรัลเชียงใหม่ ', NULL, 189);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (206, 187, 'นพ.วรพันธ์ อุณจักร  @ รพ.เชียงใหม่ราม ', NULL, 190);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (207, 189, 'นพ.วรพันธ์ อุณจักร  @ รพ.เทพปัญญา ', NULL, 190);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (208, 190, 'tนพ.อดุล วรินทรเวช  @ รพ.แมคคอร์มิค ', NULL, 191);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (209, 191, 'นพ.สมชาย อบบุญ  @ รพ.แมคเคน ', NULL, 192);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (210, 192, 'นพ.สุมิน พฤกษิกานนท์  @ รพ.รวมแพทย์ เชียงใหม่ ', NULL, 193);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (211, 193, 'ศ.นพ.ชาลี พรพัฒน์กุล  @ รพ.ราชเวชเชียงใหม่ ', NULL, 194);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (212, 194, 'นพ.ดุสิต ศรีสกุล  @ รพ.ลานนา ', NULL, 195);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (213, 195, 'นพ.ฐานิสร์ กาญจนรัตนากร  @ รพ.พะเยาราม ', NULL, 196);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (214, 196, 'นพ.บุญจง ชูชัยแสงรัตน์  @ รพ.เขลางค์ ', NULL, 197);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (215, 197, 'นพ.วัชระ สนธิชัย  @ รพ.หริภุญชัยเมโมเรียล ', NULL, 198);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (216, 198, 'นพ.ประสิทธิ์ วิรัชสุขสมบัติ  @ รพ.วิรัชศิลป์ ', NULL, 199);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (217, 199, 'นพ.ปรีชา มิตรกูล  @ รพ.นครคริสเตียน ', NULL, 200);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (218, 200, 'นพ.พรชัย ลีานิพนธ์  @ รพ.นครพัฒน์ ', NULL, 201);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (219, 201, 'นพ.วิเชียร วิชานศวกุล  @ รพ.นครินทร์ ', NULL, 202);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (220, 202, 'พญ.กษมาพร เที่ยงธรรม  @ รพ.รวมแพทย์ทุ่งสง ', NULL, 203);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (221, 203, 'นพ.ก้องเกียรติ เกษเพ็ชร  @ รพ.กรุงเทพภูเก็ต ', NULL, 204);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (222, 204, 'นพ.อนุโรจน์ ธารสิริโรจน์  @ รพ.สิริโรจน์ ', NULL, 205);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (223, 205, 'นพ.บรรจบ มานะกุล  @ รพ.ทักษิณ ', NULL, 206);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (224, 206, 'คุณกริชพงศ์ เค้าอุทัย  @ รพ.ไทยอินเตอร์เนชั่นแนล ', NULL, 207);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (225, 207, 'นพ.ชุมโชค จันทร์วิเมลือง  @ รพ.บ้านดอนอินเตอร์ เกาะสมุย ', NULL, 208);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (226, 208, 'นพ.สมชัย เจียรนัยศิลป์  @ รพ.ตรังรวมแพทย์ ', NULL, 209);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (227, 209, 'นพ.วิศิษฐ์ อมรวิทยารักษ์  @ รพ.วัฒนแพทย์ตรัง ', NULL, 210);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (228, 210, 'พญ.ศศินี โภคโต  @ รพ.รวมแพทย์พัทลุง ', NULL, 211);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (229, 85, 'นพ.ณรงค์ฤทธิ์ ฮาวรังษี  @ รพ.กรุงเทพพระประแดง ', NULL, 212);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (230, 211, 'นพ.ณรงค์ฤทธิ์ ฮาวรังษี  @ รพ.กรุงเทพหาดใหญ่ ', NULL, 212);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (231, 212, 'นพ.จำลอง บ่อเกิด  @ รพ.มูลนิธิมิตรภาพสามัคคี ', NULL, 213);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (232, 213, 'คุณปิยพล ศรียะพันธุ์  @ รพ.ราษฎร์ยินดี ', NULL, 214);
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (233, 214, 'นพ.อาคเนย์ สุขอยู่  @ รพ.ศิครินทร์หาดใหญ่ ', NULL, 215);

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `deliveries`
-- 

DROP TABLE IF EXISTS `deliveries`;
CREATE TABLE IF NOT EXISTS `deliveries` (
  `id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='D/O';

-- 
-- dump ตาราง `deliveries`
-- 


-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `delivery_items`
-- 

DROP TABLE IF EXISTS `delivery_items`;
CREATE TABLE IF NOT EXISTS `delivery_items` (
  `id` int(11) NOT NULL,
  `delivery_id` int(11) default NULL,
  `manufacturing_item_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `do_item` (`delivery_id`),
  KEY `manufacturing_id` (`manufacturing_item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- dump ตาราง `delivery_items`
-- 


-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `hospitals`
-- 

DROP TABLE IF EXISTS `hospitals`;
CREATE TABLE IF NOT EXISTS `hospitals` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(500) default NULL,
  `contact_person` varchar(500) default NULL,
  `tel_1` varchar(500) default NULL,
  `fax` varchar(500) default NULL,
  `province` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=215 ;

-- 
-- dump ตาราง `hospitals`
-- 

INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (3, '﻿รพ.กรุงเทพ ', 'นพ.สมชาย จันทร์สว่าง ', 'โทร. 0-2318-0066 ', 'โทรสาร. 0-2310-3327 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (4, 'รพ.กรุงเทพคริสเตียน ', 'มัคนายก ดร.ทวีศักดิ์ มหชวโรจน์(รักษาการ) ', 'โทร. 0-2233-6981-7 ', 'โทรสาร. 0-2236-2911 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (5, 'รพ.กรุงธน ', 'พล.ร.ต.นพ.สุรเชษฐ สู่พานิช ', 'โทร. 0-2438-0041-5 ', 'โทรสาร. 0-2438-5642 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (6, 'รพ.กรุงธน2 ', 'นพ.ไศล สุขพันธ์โพธาราม ', 'โทร. 0-2847-6767 ', 'โทรสาร. 0-2427-4070 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (7, 'รพ.กรุณาพิทักษ์ ', 'นพ.สุวัฒน์ วิทยาคม ', 'โทร. 0-22866793-5 ', 'โทรสาร. 0-2678-3004 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (8, 'รพ.กล้วยน้ำไท ', 'คุณพูลชัย ชเนศร์ ', 'โทร. 0-2769-2000 ', 'โทรสาร. 0-2381-2769 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (9, 'รพ.เกษมราษฎร์สุขาภิบาล3 ', 'นพ.ฐิติ พัฒนกำจร ', 'โทร. 0-2729-3000 ', 'โทรสาร. 0-2729-5050 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (10, 'รพ.เกษมราษฎร์ บางแค ', 'นพ.สุวิทย์ โฆษิตสุรังคกุล ', 'โทร. 0-2454-1915-8 ', 'โทรสาร. 0-2454-1914 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (11, 'รพ.เกษมราษฎร์ ประชาชื่น ', 'นพ.ธวัชชัย วานิชกร ', 'โทร. 0-2910-1600 ', 'โทรสาร. 0-2910-1649 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (12, 'รพ.คามิลเลียน ', 'นพ.ชัยพฤกษ์ ปิยะเกศิน ', 'โทร. 0-2391-0136 ', 'โทรสาร. 0-2185-1403 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (13, 'รพ.จักษุ รัตนิน ', 'นพ.นพรัตน์ สุจริตจันทร์ ', 'โทร. 0-2258-0442-5 ', 'โทรสาร. 0-2259-0780 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (14, 'รพ.เจตนิน ', 'นพ.จงเจตน์ อาวเจนพงษ์ ', 'โทร. 0-2655-5300-10 ', 'โทรสาร. 0-2655-5313 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (15, 'รพ.เจ้าพระยา ', 'นพ.จำเริญ สรพิพัฒน์ ', 'โทร. 0-2434-6900 ', 'โทรสาร. 0-2434-6929 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (16, 'รพ.เซนต์คาร์ลอส ', 'นพ.สุชัย หยองอนุกูล์ ', 'โทร. 0-2274-0616-20 ', 'โทรสาร. 0-2274-0621 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (17, 'รพ.เซนต์หลุยส์ ', 'ศ.นพ.จิตร สิทธิอมร ', 'โทร. 0-2675-5000 ', 'โทรสาร. 0-2675-5200 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (18, 'รพ.เซ็นทรัลเยนเนอรัล ', 'พญ.ลักษมี ว่องกุศลกิจ ', 'โทร. 0-2552-8801-10 ', 'โทรสาร. 0-2552-0666 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (19, 'รพ.เดชา ', 'นพ.สราวุธ อนันต์เศรษฐกุล ', 'โทร. 0-2246-0137 ', 'โทรสาร. 0-2247-2089 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (20, 'รพ.ตา หู คอ จมูก ', 'นพ.ศุภชัย โชติบุตร ', 'โทร. 0-2433-3601-3 ', 'โทรสาร. 0-2433-3613 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (21, 'รพ.เทพธารินทร์ ', 'ศ.นพ.เทพ หิมะทองคำ ', 'โทร. 0-2240-2727 ', 'โทรสาร. 0-2249-8774 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (22, 'รพ.ไทยนครินทร์ ', 'นพ.เจริญ มีนสุข ', 'โทร. 0-2361-2727 ', 'โทรสาร. 0-2361-2777 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (23, 'รพ.ธนบุรี ', 'คุณเฉลิมกุล อภิกุลโอภาส ', 'โทร. 0-2411-0401-7 ', 'โทรสาร. 0-2412-8214 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (24, 'รพ.นครธน ', 'นพ.วิโรจน์ ตระการวิจิตร ', 'โทร. 0-2416-5454 ', 'โทรสาร. 0-2415-4340 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (25, 'รพ.นวมินทร์ ', 'นพ.ประจักษ์ บุญจิตต์พิมล ', 'โทร. 0-2918-7604-8 ', 'โทรสาร. 0-2918-9192 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (26, 'รพ.นวมินทร์ 9 ', 'นพ.อรรคพาสน์ โอวาทตระกูล ', 'โทร. 0-2518-1818 ', 'โทรสาร. 0-2518-2112 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (27, 'รพ.บางกอก 9 อินเตอร์เนชั่นแนล ', 'พญ..เจรียง จันทรกมล ', 'โทร. 0-2877-1111 ', 'โทรสาร. 0-2877-1111 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (28, 'รพ.บางกอกเนอสซิ่งโฮม ', 'พญ.ลินดา ไกรวิทย์ ', 'โทร. 0-2632-0550 ', 'โทรสาร. 0-2632-0578 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (29, 'รพ.บางนา ', 'นพ.ชุตินันท์ พรมมินทร์ ', 'โทร. 0-2393-8534 ', 'โทรสาร. 0-2398-9531 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (30, 'รพ.บางปะกอก 1 ', 'นพ.วีระ อิงคภาสกร ', 'โทร. 0-2872-1111 ', 'โทรสาร. 0-2872-1065 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (31, 'รพ.บางปะกอก 2 บางบอน ', 'นพ.มานิตย์ จารุวรรณ ', 'โทร. 0-2899-0130-9 ', 'โทรสาร. 0-2451-0357 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (32, 'รพ.บางไผ่ ', 'พญ.ศศิธร พงษ์สามารถ ', 'โทร. 0-2457-0086 ', 'โทรสาร. 0-2457-2215 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (33, 'รพ.บางโพ ', 'นพ.เกตุ สายเพชร์ ', 'โทร. 0-2587-0136 ', 'โทรสาร. 0-2586-0024 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (34, 'รพ.บางมด ', 'นพ.สุรสิทธิ์ อัศดามงคล ', 'โทร. 0-2416-0049 ', 'โทรสาร. 0-2415-6864 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (35, 'รพ.บำรุงราษฎร์ ', 'คุณแม็ค แบนเนอร์ ', 'โทร. 0-2667-1000 ', 'โทรสาร. 0-2667- 2525 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (36, 'รพ.บีแคร์ ', 'รออ.นพ.พิทักษ์ ฐานบัญชา ', 'โทร. 0-2523-3359-71 ', 'โทรสาร. 0-2523-3372 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (37, 'รพ.ปิยะเวท ', '  ', 'โทร. 0-2625-6500 ', 'โทรสาร. 0-2246-9253 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (38, 'รพ.เปาโล เมโมเรียล ', 'นพ.พิชัย แพร่ภัทร ', 'โทร. 0-2279-4302 ', 'โทรสาร. 0-2279-4303 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (39, 'รพ.เปาโล เมโมเรียล โชคชัย 4 ', 'นพ.นพรัตน์ โง้วจุงดี ', 'โทร. 0-2514-2273-5 ', 'โทรสาร. 0-2538-3606 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (40, 'รพ.พญาไท 1 ', 'คุณไกรวิน ศรีไกรวิน ', 'โทร. 0-2245-2620-8 ', 'โทรสาร. 0-2640-1109 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (41, 'รพ.พญาไท 2 ', 'คุณธนา ถิรมนัส ', 'โทร. 0-2617-2444 ', 'โทรสาร. 0-2619-8541 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (42, 'รพ.พญาไท 3 ', 'นพ.อนันตศักดิ์ อภัยรัตน์ ', 'โทร. 0-2869-1220-2 ', 'โทรสาร. 0-2467-6505 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (43, 'รพ.พระราม 2 ', 'นพ.ปรีชา เลิศศิวาพร ', 'โทร. 0-2451-4920 ', 'โทรสาร. 0-2451-4599 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (44, 'รพ.พระรามเก้า ', 'นพ.เสถียร ภู่ประเสริฐ ', 'โทร. 0-2248-8026 ', 'โทรสาร. 0-2248-8018 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (45, 'รพ.เพชรเกษม-บางแค ', 'นพ.พิชิต ยิ่งเจริญ ', 'โทร. 0-2801-1199 ', 'โทรสาร. 0-2801-2299 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (46, 'รพ.เพชรเวช ', 'นพ.ชนะ ตันจันทร์พงษ์ ', 'โทร. 0-2318-0080-1 ', 'โทรสาร. 0-2318-1986 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (47, 'รพ.แพทย์ปัญญา ', 'นพ.สวัสดิ์ เถกิงเดช ', 'โทร. 0-2314-0726-9 ', 'โทรสาร. 0-2319-6685 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (48, 'รพ.มงกุฎวัฒนะ ', 'นพ.เหรียญทอง แน่นหนา ', 'โทร. 0-2574-5000-9 ', 'โทรสาร. 0-2574-4856 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (49, 'รพ.มเหสักข์ ', 'นพ.ชูเกียรติ ศุภนันตฤกษ์ ', 'โทร. 0-2635-7123-7 ', 'โทรสาร. 0-2233-7433 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (50, 'รพ.มิชชั่น ', 'คุณสมชัย ชื่นจิตร ', 'โทร. 0-2281-1422 ', 'โทรสาร. 0-2628-1752 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (51, 'รพ.เมโย ', 'นพ.ภาวิต ปุญญฤทธ์ ', 'โทร. 0-2579-1770-4 ', 'โทรสาร. 0-2579-9676 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (52, 'รพ.ยันฮี ', 'นพ. เกริกยศ ชลายนเดชะ ', 'โทร. 0-2434-9196-9 ', 'โทรสาร. 0-2435-7545 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (53, 'รพ.เยาวรักษ์ ', 'นพ.ธวัชชัย เจริญวงศ์ ', 'โทร. 0-2466-1963 ', 'โทรสาร. 0-2465-5919 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (54, 'รพ.รามคำแหง ', 'ทพ.เจิมพล ภูมิตระกูล ', 'โทร. 0-2374-0200-16 ', 'โทรสาร. 0-2374-0804 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (55, 'รพ.ราษฎร์บูรณะ ', 'คุณนิตยา ปรีชายุทธ ', 'โทร. 0-2427-0175-9 ', 'โทรสาร. 0-2427-3030 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (56, 'รพ.ลาดพร้าว ', 'นพ.วรพงศ์ จูตะวิริยะ ', 'โทร. 0-2530-2244 ', 'โทรสาร. 0-2539-8490 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (57, 'รพ.วิชัยยุทธ ', 'พล.ท.นพ.ณรงค์ รอดวรรณะ ', 'โทร. 0-2271-0125-9 ', 'โทรสาร. 0-2272-2788 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (58, 'รพ.วิภาวดี ', 'พล.ท.นพ.พร้อมพงษ์ พีระบูล ', 'โทร. 0-2561-1258-67 ', 'โทรสาร. 0-2561-1462 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (59, 'รพ.วิภาราม ', 'นพ.ไพบูลย์ เอกแสงศรี ', 'โทร. 0-2722-2500 ', 'โทรสาร. 0-2722-2445 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (60, 'รพ.เวชธานี ', 'ร.อ.ชาคริต ศึกษากิจ ', 'โทร. 0-2734-0000 ', 'โทรสาร. 0-2734-0376 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (61, 'รพ.ศรีวิชัย 1 ', 'นพ.ถนอมชัย คู่ทวีธรรม ', 'โทร. 0-2412-0055-60 ', 'โทรสาร. 0-2412-7582 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (62, 'รพ.ศรีวิชัย 2 ', 'นพ.สุรพล โล่สิริวัฒน์ ', 'โทร. 0-2441-6999 ', 'โทรสาร. 0-2421-1784 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (63, 'รพ.เปาโลเมโมเรียล นวมินทร์ ', 'นพ.นิพนธ์ ธีราโมก ', 'โทร. 0-2944-7111 ', 'โทรสาร. 0-2944-8060 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (64, 'รพ.ศิครินทร์ ', 'นพ.ธงชัย ฉัตรยิ่งมงคล ', 'โทร. 0-2383-4391-9 ', 'โทรสาร. 0-2383-4414 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (65, 'รพ.ศูนย์มะเร็งกรุงเทพฯ ', 'นพ.เทอดศักดิ์ ปรมากูล ', 'โทร. 0-2278-5716 ', 'โทรสาร. 0-2278-0274 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (66, 'รพ.สมิติเวช สุขุมวิท ', 'นพ.โชคชัย จารุศิริพิพัฒน์ ', 'โทร. 0-2392-0011 ', 'โทรสาร. 0-2391-1290 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (67, 'รพ.สมิติเวชศรีนครินทร์ ', 'นพ.ดุลย์ ดำรงศักดิ์ ', 'โทร. 0-2378-9277 ', 'โทรสาร. 0-2731-7358 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (68, 'รพ.สายไหม ', 'น.ท.พญ.ลักษมี ว่องกุศลกิจ ', 'โทร. 0-2991-8999 ', 'โทรสาร. 0-2563-5222 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (69, 'รพ.สินแพทย์ ', 'นพ.ศิริพงษ์ เหลืองวารินกุล ', 'โทร. 0-2948-5380-90 ', 'โทรสาร. 0-2948-5816 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (70, 'รพ.สุขุมวิท ', 'นพ.ดาวิน นารูลา ', 'โทร. 0-2391-0011 ', 'โทรสาร. 0-2714-0081 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (71, 'รพ.หัวเฉียว ', 'นพ.พรชัย ตั้งลัคนวาณิชย์ ', 'โทร. 0-2223-1351 ', 'โทรสาร. 0-2223-1351 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (72, 'รพ.มนารมย์ ', 'นพ.ไกรสิทธิ์ นฤขัตพิชัย ', 'โทร. 0-2725-9595 ', 'โทรสาร. 0-2725-9599 ', 'กรุงเทพมหานคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (73, 'รพ.เกษมราษฎร์รัตนาธิฯ ', 'นพ.ตุลวรรธน์ พัชราภา ', 'โทร. 0-2594-0020-6 ', 'โทรสาร. 0-2594-0067 ', 'นนทบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (74, 'รพ.แม่น้ำ ', 'คุณกมลวรรณ ลักษณะกาญจน์ ', 'โทร. 0-2960-9655 ', 'โทรสาร. 0-2960-9666 ', 'นนทบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (75, 'รพ.นนทเวช ', 'นพ.พรมพันธ์ พรมมาส ', 'โทร. 0-2589-5490-1 ', 'โทรสาร. 0-2589-8753 ', 'นนทบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (76, 'รพ.อนันต์พัฒนา 2 ', 'นพ.อนันต์ ธรรมจำรัสศรี ', 'โทร. 0-2883-9922 ', 'โทรสาร. 0-2883-9990 ', 'นนทบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (77, 'รพ.กรุงสยามเซนต์คาร์ลอส ', 'นพ.สุชัย หยองอนุกูล ', 'โทร. 0-2975-6700 ', 'โทรสาร. 0-2998-9000 ', 'ปทุมธานี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (78, 'รพ.แพทย์รังสิต ', 'นพ.กฤชรัตน์ ตระกูลช่าง ', 'โทร. 0-2531-2151-60 ', 'โทรสาร. 0-2531-3589 ', 'ปทุมธานี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (79, 'รพ.ภัทร-ธนบุรี ', 'คุณพูนศักดิ์ จรูญศิริ ', 'โทร. 0-2901-8400-8 ', 'โทรสาร. 0-2901-8082 ', 'ปทุมธานี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (80, 'รพ.เอกปทุม ', 'นพ.สุนทร อันตรเสน ', 'โทร. 0-2996-2211-15 ', 'โทรสาร. 0-2996-2207 ', 'ปทุมธานี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (81, 'รพ.นวนครการแพทย์ ', 'นพ.ส่งเสริม พานิชาภรณ์ ', 'โทร. 0-2529-4533 ', 'โทรสาร. 0-2909-2223 ', 'ปทุมธานี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (82, 'รพ.ปทุมเวช ', 'นพ.สุธีร์ สทุมถิระ ', 'โทร. 0-2567-1991-9 ', 'โทรสาร. 0-2958-4528 ', 'ปทุมธานี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (83, 'รพ.ราชธานี ', 'นพ.บุญชัย อิศราพิสิษฐ์ ', 'โทร. 0-3533-5555 ', 'โทรสาร. 0-3533-5555 ', 'พระนครศรีอยุธยา\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (84, 'รพ.ศุภมิตรเสนา ', 'คุณวิโรจน์ อภิสิทธิ์วิทยา ', 'โทร. 0-3528-9572-7 ', 'โทรสาร. 0-3528-9583 ', 'พระนครศรีอยุธยา\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (85, 'รพ.กรุงเทพพระประแดง ', 'นพ.ณรงค์ฤทธิ์ ฮาวรังษี ', 'โทร. 0-2425-0029 ', 'โทรสาร. 0-2815-7151 ', 'สมุทรปราการ\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (86, 'รพ.จุฬารัตน์ ', 'นพ.กำพล พลัสสินทร์ ', 'โทร. 0-2316-6198-9 ', 'โทรสาร. 0-2750-5146 ', 'สมุทรปราการ\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (87, 'รพ.จุฬารัตน์ 3 ', 'นพ.กำพล พลัสสินทร์ ', 'โทร. 0-2769-2900 ', 'โทรสาร. 0-2769-2997 ', 'สมุทรปราการ\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (88, 'รพ.จุฬารัตน์ 9 ', 'นพ.ยุทธนา สงวนศักดิ์โกศล ', 'โทร. 0-2738-9900-9 ', 'โทรสาร. 0-2738-9740 ', 'สมุทรปราการ\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (89, 'รพ.ชัยปราการ ', 'นพ.ภาสกร รักษ์กุล ', 'โทร. 0-2363-9222 ', 'โทรสาร. 0-2394-4237 ', 'สมุทรปราการ\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (90, 'รพ.เซ็นทรัลปาร์ค ', 'นพ.อนันต์ อธิพันธุ์อำไพ ', 'โทร. 0-2312-7261-9 ', 'โทรสาร. 0-2750-9735 ', 'สมุทรปราการ\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (91, 'รพ.บางปะกอก 3 ', 'นพ.นิคม ศิริชัย ', 'โทร. 0-2818-7555 ', 'โทรสาร. 0-2818-7509 ', 'สมุทรปราการ\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (92, 'รพ.ปิยะมินทร์ ', 'นพ.ต่อพงศ์ อัศวิษณุ ', 'โทร. 0-2316-0026-7 ', 'โทรสาร. 0-2316-0062 ', 'สมุทรปราการ\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (93, 'รพ.เมืองสมุทร ', 'นพ.พิพัฒน์ พงศ์รัตนามาน ', 'โทร. 0-2173-7772 ', 'โทรสาร. 0-2173-7783 ', 'สมุทรปราการ\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (94, 'รพ.เมืองสมุทรปู่เจ้าฯ ', 'นพ.พิพัฒน์ พงศ์รัตนามาน ', 'โทร. 0-2754-2800-9 ', 'โทรสาร. 0-2754-2514 ', 'สมุทรปราการ\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (95, 'รพ.รวมชัยประชารักษ์ ', 'คุณธนวัฒน์ ทวีชัยถาวร ', 'โทร. 0-2708-7500-10 ', 'โทรสาร. 0-2708-7542 ', 'สมุทรปราการ\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (96, 'รพ.รัทรินทร์ ', 'นพ.เขตโสภณ จัตวัฒนกุล ', 'โทร. 0-2323-2991-9 ', 'โทรสาร. 0-23232985 ', 'สมุทรปราการ\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (97, 'รพ.เปาโลเมโมเรียล สมุทรปราการ ', 'นพ.โอภาส สินเพิ่มสุขสกุล ', 'โทร. 0-2389-2555 ', 'โทรสาร. 0-2389-4916 ', 'สมุทรปราการ\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (98, 'รพ.สำโรงการแพทย์ ', 'นพ.ศิริพงษ์ วิทยเลิศปัญญา ', 'โทร. 0-2361-0070-9 ', 'โทรสาร. 0-2756-8465 ', 'สมุทรปราการ\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (99, 'รพ.รวมแพทย์ ชัยนาท ', 'นพ.สุเทพ วัตถุศิลป์ ', 'โทร. 0-5641-3017-8 ', 'โทรสาร. 0-5641-3019 ', 'ชัยนาท\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (100, 'รพ.สุวรรณเวช ', 'นพ.พงษ์เทพ เลิศสุวรรณสิทธิ์ ', 'โทร. 0-5645-1400 ', 'โทรสาร. 056-451-440 ', 'ชัยนาท\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (101, 'รพ.เบญจรมย์ ', 'นพ.วราศักดิ์ ไกรฤกษ์ ', 'โทร. 0-3641-3933 ', 'โทรสาร. 0-3661-0515 ', 'ลพบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (102, 'รพ.เมืองนารายณ์ ', 'พญ.วรินทร อัศวนิก ', 'โทร. 0-3661-6300 ', 'โทรสาร. 0-3661-6301 ', 'ลพบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (103, 'รพ.เกษมราษฎร์ สระบุรี ', 'นพ.สมเจษฎ์ ไกรโรจนานันท์ ', 'โทร. 0-3631-5555 ', 'โทรสาร. 0-3631-5501 ', 'สระบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (104, 'รพ.มิตรภาพ เมโมเรียล ', 'นพ.พนม สนิทประชากร ', 'โทร. 0-3621-2131-4 ', 'โทรสาร. 0-3622-2197 ', 'สระบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (105, 'รพ.คริสเตียนไชยวัฒน์ ', 'คุณไชยวัฒน์ วีระสมบัติ ', 'โทร. 0-3658-1294 ', 'โทรสาร. 0-3658-1296 ', 'สิงหบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (106, 'รพ.สิงห์บุรีเวชการ ', 'นพ.ประเจิด สุรีย์จามร ', 'โทร. 0-3652-0517 ', 'โทรสาร. 0-3651-2784 ', 'สิงหบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (107, 'รพ.ธนบุรี-อู่ทอง ', 'นพ.วิวัฒน์ กิตติวัฒนโชติ ', 'โทร. 0-3540-4053-9 ', 'โทรสาร. 0-3555-2890 ', 'สุพรรณบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (108, 'รพ.หมอสำเริง ', 'นพ.สำเริง ศรีผุดผ่อง ', 'โทร. 0-3557-8959 ', 'โทรสาร. 0-3557-8959 ', 'สุพรรณบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (109, 'รพ.พรชัย ', 'นพ.บุญชัย บุญแสง ', 'โทร. 0-3550-3531-5 ', 'โทรสาร. 0-3550-3432 ', 'สุพรรณบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (110, 'รพ.ศุภมิตร ', 'นพ.เมธ โชคชัยชาญ ', 'โทร. 0-3550-0283-8 ', 'โทรสาร. 0-3550-1406 ', 'สุพรรณบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (111, 'รพ.ปิยราษฎร์ ', 'นพ.ทรงกิจ สุทธิกาญจน์ ', 'โทร. 0-3555-2724-8 ', 'โทรสาร. 0-3555-2665 ', 'สุพรรณบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (112, 'รพ.กรุงเทพจันทบุรี ', 'นพ.จารุวัฑ ใช้ความเพียร ', 'โทร. 0-3935-1467 ', 'โทรสาร. 0-3932-1202 ', 'จันทบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (113, 'รพ.สิริเวช ', 'นพ.กำธร ศิริธัญญาลักษณ์ ', 'โทร. 0-3934-4244 ', 'โทรสาร. 0-3932-2995 ', 'จันทบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (114, 'รพ.จุฬารัตน์ 11 ', 'พญ.ชุติมา ปิ่นเจริญ ', 'โทร. 0-3853-8511-3 ', 'โทรสาร. 0-3853-8798 ', 'ฉะเชิงเทรา\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (115, 'รพ.โสธราเวช ', 'นพ.การุณ พุทธภาวนา ', 'โทร. 0-3881-2702-19 ', 'โทรสาร. 0-3881-2720 ', 'ฉะเชิงเทรา\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (116, 'รพ.กรุงเทพพัทยา ', 'นพ.พิชิต กังวลกิจ ', 'โทร. 0-3825-9999 ', 'โทรสาร. 0-3872-7307 ', 'ชลบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (117, 'รพ.ชลเวช ', 'พญ.วิมล สุรินทราบูรณ์ ', 'โทร. 0-3828-4354-5 ', 'โทรสาร. 0-3827-1990 ', 'ชลบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (118, 'รพ.พญาไทศรีราชา ', 'นพ.ธนาคม แมนธนานนท์ ', 'โทร. 0-3877-0200-8 ', 'โทรสาร. 0-3877-0213 ', 'ชลบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (119, 'รพ.พัทยาเมโมเรียล ', 'นพ.สมเกียรติ ธนไพศาลพิพัฒน์ ', 'โทร. 0-3848-8777 ', 'โทรสาร. 0-3842-2740 ', 'ชลบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (120, 'รพ.พัทยาอินเตอร์ ', 'คุณอุไรวรรณ เทพนมรัตน์ ', 'โทร. 0-3842-8374-5 ', 'โทรสาร. 0-3842-2773 ', 'ชลบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (121, 'รพ.สมิติเวช ศรีราชา ', 'นพ.ชัยรัตน์ ปัณฑุรอัมพร ', 'โทร. 0-3832-4100-11 ', 'โทรสาร. 0-3832-4123 ', 'ชลบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (122, 'รพ.แหลมฉบังอินเตอร์ ', 'ผศ.รังสรรค์ สุฉันทบุตร ', 'โทร. 0-3849-1888 ', 'โทรสาร. 0-3849-1878 ', 'ชลบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (123, 'รพ.เอกชล ', 'นพ.จรัล ใจแพทย์ ', 'โทร. 0-3827-3840 ', 'โทรสาร. 0-3827-3848 ', 'ชลบุร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (124, 'รพ.เอกชล 2 ', 'นพ.สานิตย์ ชากฤษณ์ ', 'โทร. 0-3893-9888 ', 'โทรสาร. 0-3893-9800 ', 'ชลบุร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (125, 'รพ.กรุงเทพตราด ', 'พญ.สุดจิต ลิขสิทธิ์ศุภการ ', 'โทร. 0-3953-2735 ', 'โทรสาร. 0-3953-2599 ', 'ตราด\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (126, 'รพ.มงกุฎ ระยอง ', 'นพ.นิยม สลิสอำไพ ', 'โทร. 0-3868-2136-9 ', 'โทรสาร. 0-3868-1459 ', 'ระยอง\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (127, 'รพ.รวมแพทย์ระยอง ', 'นพ.กริช สัตยบุตร ', 'โทร. 0-3886-0890-3 ', 'โทรสาร. 0-3886-1279 ', 'ระยอง\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (128, 'รพ.กรุงเทพคริสเตียน ', 'นพ.วิโรจน์ ดิเรกสถาพร ', 'โทร. 0-3421-3453-60 ', 'โทรสาร. 0-3427-0088 ', 'นครปฐม\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (129, 'รพ.เทพากร ', 'นพ.วรวิทย์ วัชโรทยางกูร ', 'โทร. 0-3421-2718-26 ', 'โทรสาร. 0-34241-314 ', 'นครปฐม\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (130, 'รพ.ศาลายา ', 'นพ.จรัสพงษ์ ทังสุบุตร ', 'โทร. 0-2889-2601-7 ', 'โทรสาร. 0-2889-3550 ', 'นครปฐม\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (131, 'รพ.สนามจันทร์ ', 'นพ.ทรงชัย ศรีโรจนกุล ', 'โทร. 0-3421-9600 ', 'โทรสาร. 0-3421-7817 ', 'นครปฐม\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (132, 'รพ.ซาน เปา โล หัวหิน ', 'นพ.เอกลาภ ทองบริสุทธิ์ ', 'โทร. 0-3253-2576 ', 'โทรสาร. 0-3253-2582 ', 'ประจวบคีรีขันธ์\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (133, 'รพ.เมืองเพชร-ธนบุรี ', 'ภญ.รพีพร กิตติวงศ์โสภณ ', 'โทร. 0-3241-5191-9 ', 'โทรสาร. 0-3241-5188 ', 'เพชรบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (134, 'รพ.เพชรรัชต์ ', 'นพ.สัมฤทธิ์ สินธัญญาธรรม ', 'โทร. 0-3241-7070-9 ', 'โทรสาร. 0-3241-1689 ', 'เพชรบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (135, 'รพ.ซานคามิลโล ', 'คุณจิรวัฒน์ สุจิรานุธรรม ', 'โทร. 0-3221-1143 ', 'โทรสาร. 0-3220-1256 ', 'ราชบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (136, 'รพ.พร้อมแพทย์ ', 'นพ.ประสงค์ ประภาวงศ์ ', 'โทร. 0-3231-5234-9 ', 'โทรสาร. 0-3231-5385 ', 'ราชบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (137, 'รพ.เมืองราช ', 'นพ.กมิล ปั้นประสงค์ ', 'โทร. 0-3232-2274-80 ', 'โทรสาร. 0-3231-2685-6 ', 'ราชบุรี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (138, 'รพ.แม่กลอง 2 ', 'พญ.สุวรรณา ชูพิศาลยโรจน์ ', 'โทร. 0-3471-5001-5 ', 'โทรสาร. 0-34718679 ', 'สมุทรสงคราม\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (139, 'รพ.มหาชัย ', 'นพ.อิทธิ ฉันศิริกาญจน ', 'โทร. 0-3442-4990 ', 'โทรสาร. 0-3481-0778 ', 'สมุทรสาคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (140, 'รพ.มหาชัย 2 ', 'พญ.ดาวัลย์ อนุวุฒินาวิน ', 'โทร. 0-2810-3442 ', 'โทรสาร. 0-2420-0251 ', 'สมุทรสาคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (141, 'รพ.ศรีวิชัย 3 ', 'นพ.พงษ์ศักดิ์ วัฒนา ', 'โทร. 0-2431-0070 ', 'โทรสาร. 0-2431-0940 ', 'สมุทรสาคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (142, 'รพ.ศรีวิชัย 5 ', 'พญ.สายสุนี วรรณดุรงค์วรรณ ', 'โทร. 0-3482-6708 ', 'โทรสาร. 0-3482-6706 ', 'สมุทรสาคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (143, 'รพ.เอกชัย ', 'นพ.เกรียงไกร จีระแพทย์ ', 'โทร. 0-3441-7999 ', 'โทรสาร. 0-3441-7903 ', 'สมุทรสาคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (144, 'รพ.บัวใหญ่รวมแพทย์ ', 'นพ.โกวิท คำพิทักษ์ ', 'โทร. 0-4429-2249-53 ', 'โทรสาร. 0-4429-2252 ', 'นครราชสีมา\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (145, 'รพ.ป.แพทย์ ', 'นพ.ประณีต สงวนตระกูล ', 'โทร. 0-4423-0530-3 ', 'โทรสาร. 0-4425-1120 ', 'นครราชสีมา\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (146, 'รพ.กรุงเทพราชสีมา ', 'นพ.ธนรัชต์ สมุทรเพชร ', 'โทร. 0-4442-9999 ', 'โทรสาร. 0-4425-6421 ', 'นครราชสีมา\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (147, 'รพ.เซ็นต์เมรี่ ', 'นพ.บรรพต พึ่งชัยพัฒน์ ', 'โทร. 0-4424-2385 ', 'โทรสาร. 0-4425-6600 ', 'นครราชสีมา\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (148, 'รพ.เอกชนบุรีรัมย์ ', 'นพ.วรพงษ์ ศักดิ์ศิรินุกูล ', 'โทร. 0-4461-4100 ', 'โทรสาร. 0-4461-4110 ', 'บุรีรัมย์\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (149, 'รพ.รวมแพทย์สุรินทร์(หมออนันต์) ', 'นพ.อิสระ อริยะชัยพาณิชย์ ', 'โทร. 0-4451-5700 ', 'โทรสาร. 0-4451-2496 ', 'สุรินทร์\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (150, 'รพ.ธีรวัฒน์ ', 'นพ.ธีรวัฒน์ ร่มไทรทอง ', 'โทร. 0-4381-1757 ', 'โทรสาร. 0-4381-2142 ', 'กาฬสินธุ์\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (151, 'รพ.ขอนแก่นราม ', 'นพ.สมชาย กิตติพงษ์หรรษา ', 'โทร. 0-4333-3901 ', 'โทรสาร. 0-4333-3899 ', 'ขอนแก่น\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (152, 'รพ.ราชพฤกษ์ ', 'นพ.ธีระวัฒน์ ศรีนัครินทร์ ', 'โทร. 0-4333-3555 ', 'โทรสาร. 0-4323-8833 ', 'ขอนแก่น\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (153, 'รพ.เวชประสิทธิ์ ', 'คุณอนัญพร พูลนิติพร ', 'โทร. 0-4324-5544 ', 'โทรสาร. 0-4324-5644 ', 'ขอนแก่น\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (154, 'รพ.เมืองเลยราม ', 'นพ.บุญชัย จิตตนาสวัสดิ์ ', 'โทร. 0-4283-3400 ', 'โทรสาร. 0-4283-2522 ', 'เลย\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (155, 'รพ.รักษ์สกล ', 'คุณสมคิด ปิยะธรรมวุฒิกุล ', 'โทร. 0-4271-2800 ', 'โทรสาร. 0-4271-2584 ', 'สกลนคร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (156, 'รพ.นอร์ทอีสเทร์น-วัฒนา ', 'พญ.ศุภวรรณ ตั้งสืบกุล ', 'โทร. 0-4224-1031-3 ', 'โทรสาร. 0-4224-1956 ', 'อุดรธานี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (157, 'รพ.ปัญญาเวช ', 'นพ.ปัญญา อยู่ประเสริฐ ', 'โทร. 0-4234-3111 ', 'โทรสาร. 0-4234-3065 ', 'อุดรธานี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (158, 'รพ.เอกอุดร ', 'คุณวิเชียร ชมดง ', 'โทร. 0-4234-2555 ', 'โทรสาร. 0-4234-1033 ', 'อุดรธานี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (159, 'รพ.มุกดาหารอินเตอร์ ', 'นพ.ธีระยุทธ นิยากูล ', 'โทร. 0-4263-3301-9 ', 'โทรสาร. 0-4263-3310 ', 'มุกดาหาร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (160, 'รพ.นายแพทย์หาญ ', 'นพ.หาญ สุฉันทบุตร ', 'โทร. 0-4571-1356 ', 'โทรสาร. 0-4571-1020 ', 'ยโสธร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (161, 'รพ.ยโสธรรวมแพทย์ ', 'นพ.หาญ สุฉันทบุตร ', 'โทร. 0-4571-2141-2 ', 'โทรสาร. 0-4572-0378 ', 'ยโสธร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (162, 'รพ.กรุงเทพจุรีเวช ', 'พญ.กฤษณา โฆษิตจิรนันท์ ', 'โทร. 0-4352-7111 ', 'โทรสาร. 0-4352-7699 ', 'ร้อยเอ็ด\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (163, 'รพ.ประชารักษ์ ', 'ภก.สมพร จึงศิรกุลวิทย์ ', 'โทร. 0-4563-1313 ', 'โทรสาร. 0-4561-4202 ', 'ศรีสะเกษ\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (164, 'รพ.อุบลรักษ์ ธนบุรี ', 'นพ.สุรชัย สุพันธมาตย์ ', 'โทร. 0-4526-0285 ', 'โทรสาร. 0-4524-3654 ', 'อุบลราชธานี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (165, 'รพ.แพทย์บัณฑิต ', 'นพ.นภดล ลุประสงค์ ', 'โทร. 0-5572-2044 ', 'โทรสาร. 0-5572-2044 ', 'กำแพงเพชร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (166, 'รพ.รวมแพทย์ นครสวรรค์ ', 'นพ.กิตติ ตั้งบรรเจิดสุข ', 'โทร. 0-5622-3600 ', 'โทรสาร. 0-5622-5912 ', 'นครสวรรค์\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (167, 'รพ.ศรีสวรรค์ ', 'นพ.ชวลิต วิมลเฉลา ', 'โทร. 0-5631-1626 ', 'โทรสาร. 0-5622-2388 ', 'นครสวรรค์\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (168, 'รพ.ปากน้ำโพ ', 'นพ.วิสิทธิ์ อวิรุทธ์นันท์ ', 'โทร. 0-5622-5501 ', 'โทรสาร. 0-5622-7179 ', 'นครสวรรค์\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (169, 'รพ.ร่มฉัตร ', 'นพ.พรชัย สัตยาประเสริฐ ', 'โทร. 0-5631-2481-90 ', 'โทรสาร. 0-5622-8015 ', 'นครสวรรค์\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (170, 'รพ.รัตนเวช นครสวรรค์ ', 'พญ.สุรางค์รัตน์ วรรธนภูติ ', 'โทร. 0-5622-0320-8 ', 'โทรสาร. 0-5621-2164 ', 'นครสวรรค์\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (171, 'รพ.พัฒนเวชสุโขทัย ', 'นพ.สุชาติ กุละพัฒน์ ', 'โทร. 0-5562-1502-7 ', 'โทรสาร. 0-5561-2007 ', 'สุโขทัย\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (172, 'รพ.รวมแพทย์สุโขทัย ', 'นพ.พจนารถ จันทโรจวงศ์ ', 'โทร. 0-5561-2189-90 ', 'โทรสาร. 0-5561-2221 ', 'สุโขทัย\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (173, 'รพ.ตะพานหินรวมแพทย์ ', 'คุณบุญเลิศ คำนึงสิทธิ ', 'โทร. 0-5666-2678-80 ', 'โทรสาร. 0-5662-2208 ', 'พิจิตร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (174, 'รพ.สหเวชพิจิตร ', 'นพ.เสริมสุข เหลาหชัยอรุณ ', 'โทร. 0-5661-2791-3 ', 'โทรสาร. 0-5661-2794 ', 'พิจิตร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (175, 'รพ.พิษณุเวช ', 'นพ.สุเทพ นิ่มพิทักษ์พงศ์ ', 'โทร. 0-5524-4911-20 ', 'โทรสาร. 0-5525-2754 ', 'พิษณุโลก\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (176, 'รพ.รวมแพทย์ พิษณุโลก ', 'นพ.พีระเชษฐ์ ภู่เกียรติ ', 'โทร. 0-5521-9307 ', 'โทรสาร. 0-5524-1934 ', 'พิษณุโลก\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (177, 'รพ.รัตนเวช พิษณุโลก ', 'นพ.อุดม วาริทนันท์ ', 'โทร. 0-5521-0819-28 ', 'โทรสาร. 0-5521-1943 ', 'พิษณุโลก\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (178, 'รพ.อินเตอร์เวชการ ', 'นพ.ยงยศ จริยวิทยาวัฒน์ ', 'โทร. 0-5521-8777 ', 'โทรสาร. 0-5524-5678 ', 'พิษณุโลก\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (179, 'รพ.นครหล่ม ', 'นพ.พิเชษฐ์ อิศวสัมฤทธิ์ ', 'โทร. 0-5670-2015-7 ', 'โทรสาร. 0-5670-2018 ', 'เพชรบูรณ์\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (180, 'รพ.เพชรรัตน์ ', 'ทพ.ประจวบ จันทรคิด ', 'โทร. 0-5672-0600-4 ', 'โทรสาร. 0-5672-0679 ', 'เพชรบูรณ์\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (181, 'รพ.แพร่คริสเตียน ', 'นพ.สถาปน์ ชินวงศ์ ', 'โทร. 0-5451-1017 ', 'โทรสาร. 0-5452-2853 ', 'แพร่\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (182, 'รพ.แพร่-ราม ', 'นพ.วรชัย วงศ์วรกุล ', 'โทร. 0-5452-2911-3 ', 'โทรสาร. 0-5453-0007 ', 'แพร่\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (183, 'รพ.เกษมราษฎร์ศรีบุรินทร์ ', 'นพ.สมชัย ตั้งพร้อมพันธ์ ', 'โทร. 0-5371-7499 ', 'โทรสาร. 0-5371-7032 ', 'เชียงราย\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (184, 'รพ.โอเวอร์บรุ๊ค ', 'นพ.วิฑูรย์ ยงเมธาวุฒิ ', 'โทร. 0-5371-5830-4 ', 'โทรสาร. 0-5371-6755 ', 'เชียงราย\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (185, 'รพ.ช้างเผือก ', 'นพ.อำนวย ชิงชยานุรักษ์ ', 'โทร. 0-5322-0022 ', 'โทรสาร. 0-5321-8120 ', 'เชียงใหม่\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (186, 'รพ.เชียงใหม่ใกล้หมอ ', 'นพ.ศยาม เวศกิจกุล ', 'โทร. 0-5320-0002 ', 'โทรสาร. 0-5320-0002 ', 'เชียงใหม่\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (187, 'รพ.เชียงใหม่ราม ', 'นพ.วรพันธ์ อุณจักร ', 'โทร. 0-5322-4861 ', 'โทรสาร. 0-5322-4880 ', 'เชียงใหม่\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (188, 'รพ.เซ็นทรัลเชียงใหม่ ', 'คุณวรัญญา เลี้ยงลักษณ์เลิศ ', 'โทร. 0-5381-9333 ', 'โทรสาร. 0-5327-1624 ', 'เชียงใหม่\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (189, 'รพ.เทพปัญญา ', 'นพ.วรพันธ์ อุณจักร ', 'โทร. 0-5385-2590 ', 'โทรสาร. 0-5385-2590 ต่อ 3500 ', 'เชียงใหม่\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (190, 'รพ.แมคคอร์มิค ', 'tนพ.อดุล วรินทรเวช ', 'โทร. 0-5392-1777 ', 'โทรสาร. 0-5392-1734 ', 'เชียงใหม่\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (191, 'รพ.แมคเคน ', 'นพ.สมชาย อบบุญ ', 'โทร. 0-5381-7170 ', 'โทรสาร. 0-5312-4264 ', 'เชียงใหม่\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (192, 'รพ.รวมแพทย์ เชียงใหม่ ', 'นพ.สุมิน พฤกษิกานนท์ ', 'โทร. 0-5327-0144-8 ', 'โทรสาร. 0-5327-9256 ', 'เชียงใหม่\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (193, 'รพ.ราชเวชเชียงใหม่ ', 'ศ.นพ.ชาลี พรพัฒน์กุล ', 'โทร. 0-5380-1999 ', 'โทรสาร. 0-5380-1440 ', 'เชียงใหม่\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (194, 'รพ.ลานนา ', 'นพ.ดุสิต ศรีสกุล ', 'โทร. 0-5399-9701 ', 'โทรสาร. 0-5399-9799 ', 'เชียงใหม่\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (195, 'รพ.พะเยาราม ', 'นพ.ฐานิสร์ กาญจนรัตนากร ', 'โทร. 0-5441-1111-29 ', 'โทรสาร. 0-5441-1130 ', 'พะเยา\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (196, 'รพ.เขลางค์ ', 'นพ.บุญจง ชูชัยแสงรัตน์ ', 'โทร. 0-5422-5100 ', 'โทรสาร. 0-5422-5105 ', 'ลำปาง\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (197, 'รพ.หริภุญชัยเมโมเรียล ', 'นพ.วัชระ สนธิชัย ', 'โทร. 0-5358-1600-6 ', 'โทรสาร. 0-5358-1606 ', 'ลำพูน\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (198, 'รพ.วิรัชศิลป์ ', 'นพ.ประสิทธิ์ วิรัชสุขสมบัติ ', 'โทร. 0-7750-3238 ', 'โทรสาร. 0-7750-1163 ', 'ชุมพร\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (199, 'รพ.นครคริสเตียน ', 'นพ.ปรีชา มิตรกูล ', 'โทร. 0-7535-6214 ', 'โทรสาร. 0-7531-7110 ', 'นครศรีธรรมราช\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (200, 'รพ.นครพัฒน์ ', 'นพ.พรชัย ลีานิพนธ์ ', 'โทร. 0-7530-5999 ', 'โทรสาร. 0-7530-5954 ', 'นครศรีธรรมราช\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (201, 'รพ.นครินทร์ ', 'นพ.วิเชียร วิชานศวกุล ', 'โทร. 0-7531-2800-5 ', 'โทรสาร. 0-7531-7110 ', 'นครศรีธรรมราช\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (202, 'รพ.รวมแพทย์ทุ่งสง ', 'พญ.กษมาพร เที่ยงธรรม ', 'โทร. 0-7541-1330 ', 'โทรสาร. 0-7542-0685 ', 'นครศรีธรรมราช\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (203, 'รพ.กรุงเทพภูเก็ต ', 'นพ.ก้องเกียรติ เกษเพ็ชร ', 'โทร. 0-7625-4421-9 ', 'โทรสาร. 0-7625-4430 ', 'ภูเก็ต\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (204, 'รพ.สิริโรจน์ ', 'นพ.อนุโรจน์ ธารสิริโรจน์ ', 'โทร. 0-7624-9400 ', 'โทรสาร. 0-7621-0936 ', 'ภูเก็ต\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (205, 'รพ.ทักษิณ ', 'นพ.บรรจบ มานะกุล ', 'โทร. 0-7728-5701-5 ', 'โทรสาร. 0-7728-5701 ', 'สุราษฎร์ธานี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (206, 'รพ.ไทยอินเตอร์เนชั่นแนล ', 'คุณกริชพงศ์ เค้าอุทัย ', 'โทร. 0-7724-5721-6 ', 'โทรสาร. 0-7724-5690 ', 'สุราษฎร์ธานี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (207, 'รพ.บ้านดอนอินเตอร์ เกาะสมุย ', 'นพ.ชุมโชค จันทร์วิเมลือง ', 'โทร. 0-7724-5236 ', 'โทรสาร. 0-7748-5342 ', 'สุราษฎร์ธานี\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (208, 'รพ.ตรังรวมแพทย์ ', 'นพ.สมชัย เจียรนัยศิลป์ ', 'โทร. 0-7521-8988 ', 'โทรสาร. 0-7521-4684 ', 'ตรัง\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (209, 'รพ.วัฒนแพทย์ตรัง ', 'นพ.วิศิษฐ์ อมรวิทยารักษ์ ', 'โทร. 0-7520-5555 ', 'โทรสาร. 0-7520-5460 ', 'ตรัง\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (210, 'รพ.รวมแพทย์พัทลุง ', 'พญ.ศศินี โภคโต ', 'โทร. 0-7461-3166 ', 'โทรสาร. 0-7462-7370 ', 'พัทลุง\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (211, 'รพ.กรุงเทพหาดใหญ่ ', 'นพ.ณรงค์ฤทธิ์ ฮาวรังษี ', 'โทร. 0-7436-5780-9 ', 'โทรสาร. 0-7427-2840 ', 'สงขลา\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (212, 'รพ.มูลนิธิมิตรภาพสามัคคี ', 'นพ.จำลอง บ่อเกิด ', 'โทร. 0-7424-6446 ', 'โทรสาร. 0-7424-3549 ', 'สงขลา\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (213, 'รพ.ราษฎร์ยินดี ', 'คุณปิยพล ศรียะพันธุ์ ', 'โทร. 0-7420-0200 ', 'โทรสาร. 0-7420-0292 ', 'สงขลา\r');
INSERT INTO `hospitals` (`id`, `name`, `contact_person`, `tel_1`, `fax`, `province`) VALUES (214, 'รพ.ศิครินทร์หาดใหญ่ ', 'นพ.อาคเนย์ สุขอยู่ ', 'โทร. 0-7436-6966 ', 'โทรสาร. 0-7436-6955 ', 'สงขลา');

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `manufacturing_items`
-- 

DROP TABLE IF EXISTS `manufacturing_items`;
CREATE TABLE IF NOT EXISTS `manufacturing_items` (
  `id` int(11) NOT NULL,
  `request_id` int(11) default NULL,
  `process_type` varchar(45) default NULL,
  `output_unit` varchar(45) default NULL,
  `output_count` varchar(45) default NULL,
  `__label__` varchar(45) default NULL,
  `transaction_items_transaction_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `manufacturing_item_request` (`request_id`),
  KEY `fk_manufacturing_items_transaction_items1` (`transaction_items_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- dump ตาราง `manufacturing_items`
-- 


-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `manufacturing_logs`
-- 

DROP TABLE IF EXISTS `manufacturing_logs`;
CREATE TABLE IF NOT EXISTS `manufacturing_logs` (
  `request_id` int(11) NOT NULL,
  `timestamp` timestamp NULL default NULL,
  PRIMARY KEY  (`request_id`),
  KEY `logs_manufacturing` (`request_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- dump ตาราง `manufacturing_logs`
-- 


-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `manufacturing_requests`
-- 

DROP TABLE IF EXISTS `manufacturing_requests`;
CREATE TABLE IF NOT EXISTS `manufacturing_requests` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `transaction_manufacture` (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- dump ตาราง `manufacturing_requests`
-- 


-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `orders`
-- 

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL auto_increment,
  `uuid` varchar(45) NOT NULL default 'xx-xx-xxxxxx',
  `status_id` int(10) NOT NULL,
  `request_received` timestamp NULL default NULL,
  `quote_price` decimal(10,2) default NULL,
  `delivery_date` date default NULL,
  `customer_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `days` int(10) NOT NULL default '0',
  `amount` double default NULL,
  `amount_total` double default NULL,
  `additional_charge` double default NULL,
  `discount_factor` int(10) default NULL,
  `marketing_charge` varchar(45) default NULL,
  `monthly_price` decimal(20,4) default NULL,
  `daily_price` decimal(20,4) default NULL,
  `total_weight` double default NULL,
  `data` text,
  PRIMARY KEY  (`id`),
  KEY `transaction_patient` (`patient_id`),
  KEY `transaction_customer` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='(request, quotation)' AUTO_INCREMENT=98 ;

-- 
-- dump ตาราง `orders`
-- 

INSERT INTO `orders` (`id`, `uuid`, `status_id`, `request_received`, `quote_price`, `delivery_date`, `customer_id`, `patient_id`, `days`, `amount`, `amount_total`, `additional_charge`, `discount_factor`, `marketing_charge`, `monthly_price`, `daily_price`, `total_weight`, `data`) VALUES (90, '1111-016-00000090', 1, '2011-08-29 08:06:26', 4780.84, '0000-00-00', 16, 7, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `uuid`, `status_id`, `request_received`, `quote_price`, `delivery_date`, `customer_id`, `patient_id`, `days`, `amount`, `amount_total`, `additional_charge`, `discount_factor`, `marketing_charge`, `monthly_price`, `daily_price`, `total_weight`, `data`) VALUES (91, '1111-100-00000091', 1, '2011-08-29 08:07:33', 2573.60, '0000-00-00', 100, 7, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `uuid`, `status_id`, `request_received`, `quote_price`, `delivery_date`, `customer_id`, `patient_id`, `days`, `amount`, `amount_total`, `additional_charge`, `discount_factor`, `marketing_charge`, `monthly_price`, `daily_price`, `total_weight`, `data`) VALUES (92, '1111-023-000092', 5, '2011-08-29 08:08:30', 4252.72, '0000-00-00', 23, 9, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `uuid`, `status_id`, `request_received`, `quote_price`, `delivery_date`, `customer_id`, `patient_id`, `days`, `amount`, `amount_total`, `additional_charge`, `discount_factor`, `marketing_charge`, `monthly_price`, `daily_price`, `total_weight`, `data`) VALUES (93, '11-016-000093', 1, '2011-08-29 08:09:23', 0.00, '0000-00-00', 16, 12, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `uuid`, `status_id`, `request_received`, `quote_price`, `delivery_date`, `customer_id`, `patient_id`, `days`, `amount`, `amount_total`, `additional_charge`, `discount_factor`, `marketing_charge`, `monthly_price`, `daily_price`, `total_weight`, `data`) VALUES (94, 'xx-xx-xxxxxx', 1, NULL, NULL, '2011-09-16', 16, 7, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `uuid`, `status_id`, `request_received`, `quote_price`, `delivery_date`, `customer_id`, `patient_id`, `days`, `amount`, `amount_total`, `additional_charge`, `discount_factor`, `marketing_charge`, `monthly_price`, `daily_price`, `total_weight`, `data`) VALUES (95, '11-016-000095', 1, '2011-09-01 23:10:03', 100000.00, '0000-00-00', 16, 7, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `uuid`, `status_id`, `request_received`, `quote_price`, `delivery_date`, `customer_id`, `patient_id`, `days`, `amount`, `amount_total`, `additional_charge`, `discount_factor`, `marketing_charge`, `monthly_price`, `daily_price`, `total_weight`, `data`) VALUES (96, '11-100-000096', 7, '2011-09-01 23:58:35', 20.00, '0000-00-00', 100, 12, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` (`id`, `uuid`, `status_id`, `request_received`, `quote_price`, `delivery_date`, `customer_id`, `patient_id`, `days`, `amount`, `amount_total`, `additional_charge`, `discount_factor`, `marketing_charge`, `monthly_price`, `daily_price`, `total_weight`, `data`) VALUES (97, '1109-100-000097', 5, '2011-09-09 11:50:07', 2025.00, '2011-09-23', 100, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `order_items`
-- 

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) default NULL,
  `order_per_day` varchar(45) default NULL,
  `consume_time` varchar(45) default NULL,
  `price` decimal(10,4) default NULL,
  `quantity` decimal(10,6) default NULL,
  `weight` decimal(10,6) default NULL,
  `remarks` text,
  `unit_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_order_items_orders` (`order_id`),
  KEY `FK_order_items_products` (`product_id`),
  KEY `FK_order_items_product_unit` (`unit_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1035 ;

-- 
-- dump ตาราง `order_items`
-- 

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (538, 90, 1, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (539, 90, 9, '10', '["lunch"]', 29.9830, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (540, 90, 10, '05', '["lunch"]', 0.0540, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (541, 90, 13, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (542, 90, 29, '2000', '["morning_and_evening"]', 3010.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (543, 90, 7, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (544, 90, 8, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (545, 91, 1, '3000', '["morning_and_evening"]', 2543.7000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (546, 91, 9, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (547, 91, 10, '5', '["evening"]', 6.1735, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (548, 91, 13, '10', '["morning"]', 23.7290, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (549, 91, 29, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (550, 91, 7, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (551, 91, 8, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (552, 92, 1, '5000', '["morning_and_evening"]', 5000.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (553, 92, 9, '10', '["morning_and_evening"]', 10.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (554, 92, 10, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (555, 92, 13, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (556, 92, 29, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (557, 92, 7, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (558, 92, 8, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (559, 93, 1, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (560, 93, 9, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (561, 93, 10, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (562, 93, 13, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (563, 93, 29, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (564, 93, 7, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (565, 93, 8, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (566, 95, 1, '1000', '["morning_and_evening"]', 100000.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (567, 95, 9, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (568, 95, 10, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (569, 95, 13, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (570, 95, 29, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (571, 95, 31, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (572, 95, 34, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (573, 95, 35, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (574, 95, 7, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (575, 95, 8, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (576, 96, 1, '2000', '["evening","bedtime"]', 20.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (577, 96, 9, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (578, 96, 10, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (579, 96, 13, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (580, 96, 29, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (581, 96, 31, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (582, 96, 34, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (583, 96, 35, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (584, 96, 7, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (585, 96, 8, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (586, 97, 1, '2000', '["morning_and_evening"]', 2000.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (587, 97, 2, '10', '["evening","bedtime"]', 10.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (588, 97, 3, '05', '["morning_and_evening"]', 5.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (589, 97, 4, '10', '["lunch","evening"]', 10.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (590, 97, 5, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (591, 97, 6, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (592, 97, 7, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (593, 97, 8, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (594, 97, 9, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (595, 97, 10, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (596, 97, 11, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (597, 97, 12, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (598, 97, 13, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (599, 97, 14, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (600, 97, 15, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (601, 97, 115, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (602, 97, 116, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (603, 97, 117, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (604, 97, 118, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (605, 97, 119, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (606, 97, 120, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (607, 97, 121, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (608, 97, 122, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (609, 97, 123, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (610, 97, 124, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (611, 97, 125, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (612, 97, 126, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (613, 97, 127, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (614, 97, 128, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (615, 97, 129, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (616, 97, 16, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (617, 97, 17, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (618, 97, 18, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (619, 97, 19, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (620, 97, 20, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (621, 97, 21, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (622, 97, 22, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (623, 97, 23, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (624, 97, 24, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (625, 97, 25, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (626, 97, 26, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (627, 97, 27, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (628, 97, 28, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (629, 97, 29, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (630, 97, 130, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (631, 97, 131, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (632, 97, 132, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (633, 97, 133, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (634, 97, 134, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (635, 97, 135, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (636, 97, 136, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (637, 97, 137, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (638, 97, 138, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (639, 97, 139, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (640, 97, 140, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (641, 97, 141, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (642, 97, 142, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (643, 97, 143, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (644, 97, 30, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (645, 97, 31, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (646, 97, 32, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (647, 97, 33, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (648, 97, 34, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (649, 97, 144, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (650, 97, 145, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (651, 97, 146, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (652, 97, 147, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (653, 97, 148, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (654, 97, 35, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (655, 97, 36, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (656, 97, 37, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (657, 97, 38, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (658, 97, 39, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (659, 97, 40, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (660, 97, 41, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (661, 97, 42, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (662, 97, 43, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (663, 97, 44, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (664, 97, 45, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (665, 97, 46, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (666, 97, 47, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (667, 97, 48, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (668, 97, 49, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (669, 97, 50, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (670, 97, 149, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (671, 97, 150, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (672, 97, 151, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (673, 97, 152, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (674, 97, 153, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (675, 97, 154, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (676, 97, 155, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (677, 97, 156, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (678, 97, 157, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (679, 97, 158, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (680, 97, 159, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (681, 97, 160, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (682, 97, 161, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (683, 97, 162, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (684, 97, 163, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (685, 97, 164, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (686, 97, 51, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (687, 97, 52, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (688, 97, 53, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (689, 97, 54, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (690, 97, 55, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (691, 97, 56, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (692, 97, 57, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (693, 97, 58, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (694, 97, 59, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (695, 97, 60, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (696, 97, 61, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (697, 97, 62, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (698, 97, 63, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (699, 97, 165, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (700, 97, 166, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (701, 97, 167, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (702, 97, 168, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (703, 97, 169, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (704, 97, 170, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (705, 97, 171, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (706, 97, 172, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (707, 97, 173, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (708, 97, 174, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (709, 97, 175, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (710, 97, 176, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (711, 97, 177, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (712, 97, 64, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (713, 97, 65, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (714, 97, 66, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (715, 97, 178, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (716, 97, 179, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (717, 97, 180, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (718, 97, 67, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (719, 97, 68, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (720, 97, 69, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (721, 97, 181, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (722, 97, 182, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (723, 97, 183, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (724, 97, 70, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (725, 97, 71, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (726, 97, 72, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (727, 97, 73, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (728, 97, 74, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (729, 97, 75, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (730, 97, 76, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (731, 97, 77, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (732, 97, 78, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (733, 97, 79, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (734, 97, 80, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (735, 97, 81, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (736, 97, 82, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (737, 97, 83, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (738, 97, 84, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (739, 97, 85, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (740, 97, 86, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (741, 97, 87, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (742, 97, 88, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (743, 97, 89, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (744, 97, 90, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (745, 97, 91, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (746, 97, 92, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (747, 97, 93, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (748, 97, 94, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (749, 97, 95, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (750, 97, 96, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (751, 97, 97, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (752, 97, 98, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (753, 97, 99, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (754, 97, 100, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (755, 97, 101, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (756, 97, 102, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (757, 97, 103, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (758, 97, 104, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (759, 97, 105, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (760, 97, 106, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (761, 97, 107, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (762, 97, 108, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (763, 97, 184, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (764, 97, 185, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (765, 97, 186, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (766, 97, 187, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (767, 97, 188, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (768, 97, 189, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (769, 97, 190, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (770, 97, 191, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (771, 97, 192, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (772, 97, 193, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (773, 97, 194, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (774, 97, 195, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (775, 97, 196, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (776, 97, 197, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (777, 97, 198, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (778, 97, 199, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (779, 97, 200, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (780, 97, 201, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (781, 97, 202, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (782, 97, 203, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (783, 97, 204, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (784, 97, 205, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (785, 97, 206, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (786, 97, 207, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (787, 97, 208, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (788, 97, 209, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (789, 97, 210, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (790, 97, 211, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (791, 97, 212, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (792, 97, 213, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (793, 97, 214, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (794, 97, 215, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (795, 97, 216, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (796, 97, 217, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (797, 97, 218, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (798, 97, 219, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (799, 97, 220, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (800, 97, 221, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (801, 97, 222, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (802, 97, 109, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (803, 97, 110, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (804, 97, 111, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (805, 97, 112, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (806, 97, 113, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (807, 97, 114, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (808, 97, 223, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (809, 97, 224, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (810, 97, 225, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (811, 97, 226, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (812, 97, 227, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (813, 97, 228, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (814, 92, 2, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (815, 92, 3, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (816, 92, 4, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (817, 92, 5, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (818, 92, 6, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (819, 92, 11, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (820, 92, 12, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (821, 92, 14, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (822, 92, 15, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (823, 92, 115, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (824, 92, 116, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (825, 92, 117, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (826, 92, 118, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (827, 92, 119, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (828, 92, 120, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (829, 92, 121, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (830, 92, 122, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (831, 92, 123, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (832, 92, 124, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (833, 92, 125, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (834, 92, 126, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (835, 92, 127, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (836, 92, 128, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (837, 92, 129, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (838, 92, 16, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (839, 92, 17, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (840, 92, 18, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (841, 92, 19, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (842, 92, 20, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (843, 92, 21, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (844, 92, 22, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (845, 92, 23, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (846, 92, 24, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (847, 92, 25, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (848, 92, 26, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (849, 92, 27, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (850, 92, 28, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (851, 92, 130, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (852, 92, 131, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (853, 92, 132, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (854, 92, 133, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (855, 92, 134, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (856, 92, 135, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (857, 92, 136, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (858, 92, 137, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (859, 92, 138, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (860, 92, 139, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (861, 92, 140, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (862, 92, 141, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (863, 92, 142, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (864, 92, 143, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (865, 92, 30, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (866, 92, 31, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (867, 92, 32, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (868, 92, 33, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (869, 92, 34, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (870, 92, 144, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (871, 92, 145, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (872, 92, 146, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (873, 92, 147, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (874, 92, 148, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (875, 92, 35, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (876, 92, 36, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (877, 92, 37, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (878, 92, 38, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (879, 92, 39, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (880, 92, 40, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (881, 92, 41, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (882, 92, 42, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (883, 92, 43, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (884, 92, 44, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (885, 92, 45, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (886, 92, 46, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (887, 92, 47, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (888, 92, 48, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (889, 92, 49, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (890, 92, 50, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (891, 92, 149, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (892, 92, 150, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (893, 92, 151, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (894, 92, 152, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (895, 92, 153, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (896, 92, 154, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (897, 92, 155, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (898, 92, 156, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (899, 92, 157, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (900, 92, 158, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (901, 92, 159, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (902, 92, 160, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (903, 92, 161, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (904, 92, 162, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (905, 92, 163, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (906, 92, 164, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (907, 92, 51, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (908, 92, 52, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (909, 92, 53, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (910, 92, 54, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (911, 92, 55, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (912, 92, 56, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (913, 92, 57, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (914, 92, 58, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (915, 92, 59, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (916, 92, 60, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (917, 92, 61, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (918, 92, 62, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (919, 92, 63, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (920, 92, 165, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (921, 92, 166, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (922, 92, 167, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (923, 92, 168, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (924, 92, 169, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (925, 92, 170, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (926, 92, 171, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (927, 92, 172, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (928, 92, 173, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (929, 92, 174, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (930, 92, 175, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (931, 92, 176, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (932, 92, 177, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (933, 92, 64, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (934, 92, 65, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (935, 92, 66, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (936, 92, 178, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (937, 92, 179, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (938, 92, 180, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (939, 92, 67, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (940, 92, 68, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (941, 92, 69, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (942, 92, 181, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (943, 92, 182, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (944, 92, 183, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (945, 92, 70, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (946, 92, 71, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (947, 92, 72, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (948, 92, 73, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (949, 92, 74, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (950, 92, 75, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (951, 92, 76, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (952, 92, 77, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (953, 92, 78, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (954, 92, 79, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (955, 92, 80, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (956, 92, 81, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (957, 92, 82, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (958, 92, 83, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (959, 92, 84, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (960, 92, 85, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (961, 92, 86, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (962, 92, 87, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (963, 92, 88, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (964, 92, 89, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (965, 92, 90, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (966, 92, 91, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (967, 92, 92, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (968, 92, 93, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (969, 92, 94, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (970, 92, 95, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (971, 92, 96, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (972, 92, 97, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (973, 92, 98, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (974, 92, 99, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (975, 92, 100, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (976, 92, 101, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (977, 92, 102, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (978, 92, 103, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (979, 92, 104, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (980, 92, 105, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (981, 92, 106, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (982, 92, 107, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (983, 92, 108, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (984, 92, 184, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (985, 92, 185, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (986, 92, 186, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (987, 92, 187, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (988, 92, 188, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (989, 92, 189, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (990, 92, 190, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (991, 92, 191, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (992, 92, 192, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (993, 92, 193, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (994, 92, 194, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (995, 92, 195, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (996, 92, 196, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (997, 92, 197, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (998, 92, 198, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (999, 92, 199, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1000, 92, 200, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1001, 92, 201, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1002, 92, 202, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1003, 92, 203, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1004, 92, 204, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1005, 92, 205, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1006, 92, 206, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1007, 92, 207, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1008, 92, 208, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1009, 92, 209, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1010, 92, 210, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1011, 92, 211, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1012, 92, 212, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1013, 92, 213, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1014, 92, 214, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1015, 92, 215, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1016, 92, 216, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1017, 92, 217, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1018, 92, 218, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1019, 92, 219, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1020, 92, 220, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1021, 92, 221, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1022, 92, 222, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1023, 92, 109, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1024, 92, 110, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1025, 92, 111, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1026, 92, 112, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1027, 92, 113, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1028, 92, 114, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1029, 92, 223, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1030, 92, 224, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1031, 92, 225, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1032, 92, 226, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1033, 92, 227, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `order_per_day`, `consume_time`, `price`, `quantity`, `weight`, `remarks`, `unit_id`) VALUES (1034, 92, 228, '0', '["morning_and_evening"]', 0.0000, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `order_logs`
-- 

DROP TABLE IF EXISTS `order_logs`;
CREATE TABLE IF NOT EXISTS `order_logs` (
  `order_id` int(11) NOT NULL,
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `category` varchar(45) default NULL,
  `msg` varchar(200) NOT NULL,
  KEY `logs_transaction` (`order_id`),
  KEY `time` (`updated`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- dump ตาราง `order_logs`
-- 

INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (1, '2011-08-02 21:37:06', 'UPDATES', 'updated order 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (18, '2011-08-02 21:37:06', 'UPDATES', 'updated order 18');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (5, '2011-08-02 21:37:06', 'UPDATES', 'updated order 5');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (6, '2011-08-02 21:37:06', 'UPDATES', 'updated order 6');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (7, '2011-08-02 21:37:06', 'UPDATES', 'updated order 7');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (8, '2011-08-02 21:37:06', 'UPDATES', 'updated order 8');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (9, '2011-08-02 21:37:06', 'UPDATES', 'updated order 9');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (10, '2011-08-02 21:37:06', 'UPDATES', 'updated order 10');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (11, '2011-08-02 21:37:06', 'UPDATES', 'updated order 11');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (12, '2011-08-02 21:37:06', 'UPDATES', 'updated order 12');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (14, '2011-08-02 21:37:06', 'UPDATES', 'updated order 14');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (15, '2011-08-02 21:37:06', 'UPDATES', 'updated order 15');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (16, '2011-08-02 21:37:06', 'UPDATES', 'updated order 16');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (17, '2011-08-02 21:37:06', 'UPDATES', 'updated order 17');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (85, '2011-08-02 21:37:06', 'UPDATES', 'updated order 85');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (2, '2011-08-02 21:37:06', 'UPDATES', 'updated order 2');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (3, '2011-08-02 21:37:06', 'UPDATES', 'updated order 3');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (84, '2011-08-02 21:37:06', 'UPDATES', 'updated order 84');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (83, '2011-08-02 21:37:06', 'UPDATES', 'updated order 83');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (19, '2011-08-02 21:37:06', 'UPDATES', 'updated order 19');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (20, '2011-08-02 21:37:06', 'UPDATES', 'updated order 20');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (21, '2011-08-02 21:37:06', 'UPDATES', 'updated order 21');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (22, '2011-08-02 21:37:06', 'UPDATES', 'updated order 22');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (23, '2011-08-02 21:37:06', 'UPDATES', 'updated order 23');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (24, '2011-08-02 21:37:06', 'UPDATES', 'updated order 24');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (25, '2011-08-02 21:37:06', 'UPDATES', 'updated order 25');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (26, '2011-08-02 21:37:06', 'UPDATES', 'updated order 26');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (27, '2011-08-02 21:37:06', 'UPDATES', 'updated order 27');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (28, '2011-08-02 21:37:06', 'UPDATES', 'updated order 28');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (29, '2011-08-02 21:37:06', 'UPDATES', 'updated order 29');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (30, '2011-08-02 21:37:06', 'UPDATES', 'updated order 30');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (31, '2011-08-02 21:37:06', 'UPDATES', 'updated order 31');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (32, '2011-08-02 21:37:06', 'UPDATES', 'updated order 32');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (33, '2011-08-02 21:37:06', 'UPDATES', 'updated order 33');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (34, '2011-08-02 21:37:06', 'UPDATES', 'updated order 34');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (35, '2011-08-02 21:37:06', 'UPDATES', 'updated order 35');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (36, '2011-08-02 21:37:06', 'UPDATES', 'updated order 36');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (37, '2011-08-02 21:37:06', 'UPDATES', 'updated order 37');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (38, '2011-08-02 21:37:06', 'UPDATES', 'updated order 38');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (39, '2011-08-02 21:37:06', 'UPDATES', 'updated order 39');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (40, '2011-08-02 21:37:06', 'UPDATES', 'updated order 40');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (41, '2011-08-02 21:37:06', 'UPDATES', 'updated order 41');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (42, '2011-08-02 21:37:06', 'UPDATES', 'updated order 42');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (43, '2011-08-02 21:37:06', 'UPDATES', 'updated order 43');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (44, '2011-08-02 21:37:06', 'UPDATES', 'updated order 44');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (45, '2011-08-02 21:37:06', 'UPDATES', 'updated order 45');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (46, '2011-08-02 21:37:06', 'UPDATES', 'updated order 46');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (47, '2011-08-02 21:37:06', 'UPDATES', 'updated order 47');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (48, '2011-08-02 21:37:06', 'UPDATES', 'updated order 48');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (49, '2011-08-02 21:37:06', 'UPDATES', 'updated order 49');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (50, '2011-08-02 21:37:06', 'UPDATES', 'updated order 50');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (51, '2011-08-02 21:37:06', 'UPDATES', 'updated order 51');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (52, '2011-08-02 21:37:06', 'UPDATES', 'updated order 52');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (53, '2011-08-02 21:37:06', 'UPDATES', 'updated order 53');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (54, '2011-08-02 21:37:06', 'UPDATES', 'updated order 54');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (55, '2011-08-02 21:37:06', 'UPDATES', 'updated order 55');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (56, '2011-08-02 21:37:06', 'UPDATES', 'updated order 56');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (57, '2011-08-02 21:37:06', 'UPDATES', 'updated order 57');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (58, '2011-08-02 21:37:06', 'UPDATES', 'updated order 58');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (59, '2011-08-02 21:37:06', 'UPDATES', 'updated order 59');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (60, '2011-08-02 21:37:06', 'UPDATES', 'updated order 60');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (61, '2011-08-02 21:37:06', 'UPDATES', 'updated order 61');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (62, '2011-08-02 21:37:06', 'UPDATES', 'updated order 62');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (63, '2011-08-02 21:37:06', 'UPDATES', 'updated order 63');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (64, '2011-08-02 21:37:06', 'UPDATES', 'updated order 64');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (65, '2011-08-02 21:37:06', 'UPDATES', 'updated order 65');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (66, '2011-08-02 21:37:06', 'UPDATES', 'updated order 66');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (67, '2011-08-02 21:37:06', 'UPDATES', 'updated order 67');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (68, '2011-08-02 21:37:06', 'UPDATES', 'updated order 68');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (69, '2011-08-02 21:37:06', 'UPDATES', 'updated order 69');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (70, '2011-08-02 21:37:06', 'UPDATES', 'updated order 70');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (71, '2011-08-02 21:37:06', 'UPDATES', 'updated order 71');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (72, '2011-08-02 21:37:06', 'UPDATES', 'updated order 72');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (73, '2011-08-02 21:37:06', 'UPDATES', 'updated order 73');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (74, '2011-08-02 21:37:06', 'UPDATES', 'updated order 74');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (75, '2011-08-02 21:37:06', 'UPDATES', 'updated order 75');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (76, '2011-08-02 21:37:06', 'UPDATES', 'updated order 76');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (77, '2011-08-02 21:37:06', 'UPDATES', 'updated order 77');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (78, '2011-08-02 21:37:06', 'UPDATES', 'updated order 78');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (79, '2011-08-02 21:37:06', 'UPDATES', 'updated order 79');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (80, '2011-08-02 21:37:06', 'UPDATES', 'updated order 80');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (81, '2011-08-02 21:37:06', 'UPDATES', 'updated order 81');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (82, '2011-08-02 21:37:06', 'UPDATES', 'updated order 82');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (10, '2011-08-10 12:08:33', 'UPDATED', 'saved');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (10, '2011-08-10 12:09:45', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (10, '2011-08-10 12:11:27', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (9, '2011-08-10 12:20:35', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (9, '2011-08-10 12:21:29', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (9, '2011-08-10 12:32:24', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (28, '2011-08-10 12:33:07', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (1, '2011-08-10 12:39:49', 'APPROVED', 'approved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (1, '2011-08-10 12:39:49', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (5, '2011-08-10 12:41:33', 'APPROVED', 'approved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (5, '2011-08-10 12:41:33', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (12, '2011-08-10 12:41:49', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (18, '2011-08-10 12:42:09', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (17, '2011-08-10 12:42:17', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (15, '2011-08-10 12:42:24', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (22, '2011-08-10 12:42:32', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (29, '2011-08-10 12:42:39', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (37, '2011-08-10 12:42:47', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (35, '2011-08-10 12:42:56', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (42, '2011-08-10 12:43:03', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (38, '2011-08-10 12:43:12', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (32, '2011-08-10 12:43:20', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (39, '2011-08-10 12:43:31', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (49, '2011-08-10 12:43:41', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (54, '2011-08-10 12:43:50', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (16, '2011-08-10 12:45:16', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (58, '2011-08-10 12:45:25', 'APPROVED', 'approved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (58, '2011-08-10 12:45:25', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (86, '2011-08-10 12:45:48', 'DELETED', 'deleted by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (2, '2011-08-10 01:13:29', 'APPROVED', 'approved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (2, '2011-08-10 01:13:29', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (3, '2011-08-10 01:19:43', 'APPROVED', 'approved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (3, '2011-08-10 01:19:43', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (6, '2011-08-10 13:02:01', 'APPROVED', 'approved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (6, '2011-08-10 01:22:01', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (7, '2011-08-10 13:28:23', 'APPROVED', 'approved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (7, '2011-08-10 01:28:24', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (87, '2011-08-10 01:30:15', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (87, '2011-08-10 01:30:16', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (87, '2011-08-10 01:30:16', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (87, '2011-08-10 01:30:16', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (87, '2011-08-10 01:32:57', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (87, '2011-08-10 13:34:38', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (87, '2011-08-10 13:38:35', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (88, '2011-08-10 13:39:49', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (88, '2011-08-10 13:39:50', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (88, '2011-08-10 13:39:50', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (88, '2011-08-10 13:39:50', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (89, '2011-08-10 13:44:45', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (89, '2011-08-10 13:44:46', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (89, '2011-08-10 13:44:46', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (89, '2011-08-10 13:44:46', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (73, '2011-08-10 14:56:28', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (89, '2011-08-10 15:04:34', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (90, '2011-08-29 08:06:26', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (90, '2011-08-29 08:06:26', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (90, '2011-08-29 08:06:26', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (90, '2011-08-29 08:06:26', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (90, '2011-08-29 08:07:04', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (90, '2011-08-29 08:07:06', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (91, '2011-08-29 08:07:33', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (91, '2011-08-29 08:07:34', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (91, '2011-08-29 08:07:34', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (91, '2011-08-29 08:07:34', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (92, '2011-08-29 08:08:30', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (92, '2011-08-29 08:08:30', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (92, '2011-08-29 08:08:30', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (92, '2011-08-29 08:08:30', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (93, '2011-08-29 08:09:23', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (93, '2011-08-29 08:09:23', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (93, '2011-08-29 08:09:23', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (93, '2011-08-29 08:09:23', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (94, '2011-09-01 23:09:16', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (95, '2011-09-01 23:10:03', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (95, '2011-09-01 23:10:03', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (95, '2011-09-01 23:10:03', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (95, '2011-09-01 23:10:03', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (34, '2011-09-01 23:44:43', 'APPROVED', 'approved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (34, '2011-09-01 23:44:43', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (96, '2011-09-01 23:58:35', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (96, '2011-09-01 23:58:35', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (96, '2011-09-01 23:58:35', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (96, '2011-09-01 23:58:35', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (96, '2011-09-02 00:07:59', 'APPROVED', 'approved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (96, '2011-09-02 00:07:59', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (97, '2011-09-09 11:50:07', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (97, '2011-09-09 11:50:07', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (97, '2011-09-09 11:50:10', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (97, '2011-09-09 11:50:10', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (97, '2011-09-09 11:50:10', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (97, '2011-09-09 11:50:31', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (97, '2011-09-09 11:50:49', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (97, '2011-09-09 11:51:06', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (97, '2011-09-09 11:51:19', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (97, '2011-09-09 11:59:04', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (92, '2011-09-09 12:36:42', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (92, '2011-09-09 12:37:26', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (92, '2011-09-09 12:37:42', 'UPDATED', 'saved by 1');
INSERT INTO `order_logs` (`order_id`, `updated`, `category`, `msg`) VALUES (97, '2011-09-09 12:43:06', 'UPDATED', 'saved by 1');

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `patients`
-- 

DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `hn` varchar(20) NOT NULL default '0',
  `customer_id` int(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

-- 
-- dump ตาราง `patients`
-- 

INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (1, 'นางสุภมาส โรทินีลักษ์กุล', '7935161', 18);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (2, 'นายสมศักดิ์ ร่วมคิด', '4588933', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (3, 'นางวิภา เหลืองนฤมิตชัย', '9139183', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (4, 'นายสินธุ์ ตัณฑเสถียร', '1929117', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (5, 'นายสุนทร นามสระ', '2228038', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (6, 'นางสาวอำพร พวงศรี', '5352839', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (7, 'นายสยาม สุขสถาวรพันธ์', '0080080', 100);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (8, 'นายชำนาญ อิงศรีสว่าง', '4341886', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (9, 'นายวีระพันธุ์ หิรัญวิวัฒน์กุล', '1469189', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (10, 'นายธนวรรธ โพธิรัตนังกูร', '4320290', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (11, 'นายบุ้นเขี้ยง สุขสถาวรพันธุ์', '7193882', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (12, 'นางสาววลัย ศรีมณีรุ่งโรจน์', '3008540', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (13, 'คุณพูลชัย ชเนศร์ ', '4054035371', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (14, 'คุณเฉลิมกุล อภิกุลโอภาส ', '8716141803', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (15, 'คุณแม็ค แบนเนอร์ ', '1418603212', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (16, 'คุณไกรวิน ศรีไกรวิน ', '0944590960', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (17, 'คุณธนา ถิรมนัส ', '0467145471', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (18, 'คุณสมชัย ชื่นจิตร ', '9501954782', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (19, 'คุณนิตยา ปรีชายุทธ ', '6108337804', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (20, 'คุณกมลวรรณ ลักษณะกาญจน์ ', '2035824984', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (21, 'คุณพูนศักดิ์ จรูญศิริ ', '1854111814', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (22, 'คุณวิโรจน์ อภิสิทธิ์วิทยา ', '3163084427', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (23, 'คุณธนวัฒน์ ทวีชัยถาวร ', '0253087003', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (24, 'คุณไชยวัฒน์ วีระสมบัติ ', '1776182038', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (25, 'คุณอุไรวรรณ เทพนมรัตน์ ', '8121649490', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (26, 'คุณจิรวัฒน์ สุจิรานุธรรม ', '5279701645', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (27, 'คุณอนัญพร พูลนิติพร ', '2033560063', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (28, 'คุณสมคิด ปิยะธรรมวุฒิกุล ', '4328695688', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (29, 'คุณวิเชียร ชมดง ', '5542798559', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (30, 'คุณบุญเลิศ คำนึงสิทธิ ', '4727906039', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (31, 'คุณวรัญญา เลี้ยงลักษณ์เลิศ ', '7011134826', 126);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (32, 'คุณกริชพงศ์ เค้าอุทัย ', '0871956321', 82);
INSERT INTO `patients` (`id`, `name`, `hn`, `customer_id`) VALUES (33, 'คุณปิยพล ศรียะพันธุ์ ', '3326377434', 126);

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `products`
-- 

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL auto_increment,
  `code` varchar(10) NOT NULL default '0',
  `display_name` varchar(500) default NULL,
  `category_id` bigint(11) NOT NULL,
  `unit_id` int(10) NOT NULL,
  `default_consume_time` varchar(100) default NULL,
  `note` text,
  `recommended_dosage` varchar(200) default NULL,
  `inactive` tinyint(1) NOT NULL default '0',
  `price_base` double default NULL,
  `price_formula` varchar(1000) default NULL,
  `price_var` double default NULL,
  `volume_base` double default NULL,
  `volume_formula` varchar(1000) default NULL,
  `volume_var` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_products_categories` (`category_id`),
  KEY `FK_products_product_unit` (`unit_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=229 ;

-- 
-- dump ตาราง `products`
-- 

INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (1, '0', 'Vitamin A; IU', 3, 1, '["morning_and_evening"]', NULL, '2000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (2, '0', 'Thiamin Hydrochloride (B1); mg', 3, 1, '["morning_and_evening"]', NULL, '10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (3, '0', 'Riboflavin-5-Phosphate (B2); mg', 3, 1, '["morning_and_evening"]', NULL, '5', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (4, '0', 'Niacinamide (B3) ; mg', 3, 1, '["morning_and_evening"]', NULL, '10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (5, '0', 'Calcium-D-Pantothenate (B5) ; mg', 3, 1, '["morning_and_evening"]', NULL, '10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (6, '0', 'Pyridoxine Hydrochloride (B6) ; mg', 3, 1, '["morning_and_evening"]', NULL, '10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (7, '0', 'Biotin (Vit H) ; mcg', 3, 1, '["morning_and_evening"]', NULL, '300', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (8, '0', 'Folic Acid (B9) ; mcg', 3, 1, '["morning_and_evening"]', NULL, '400', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (9, '0', 'Cyanocobalamin (B12) ; mcg', 3, 1, '["morning_and_evening"]', NULL, '10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (10, '0', 'Inositol ; mg', 3, 1, '["morning_and_evening"]', NULL, '250-500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (11, '0', 'Vitamin C ; mg', 3, 1, '["morning_and_evening"]', NULL, '1000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (12, '0', 'Vitamin D3 ; IU', 3, 1, '["morning_and_evening"]', NULL, '400', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (13, '0', 'Vitamin E (Alpha Tocopheryl); IU', 3, 1, '["morning_and_evening"]', NULL, '400', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (14, '0', 'D-Gamma Tocopherol ; IU', 3, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (15, '0', 'Tocotrienol ; mg', 3, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (16, '0', 'Boron, Chelate ; mg', 4, 1, '["morning_and_evening"]', NULL, '1', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (17, '0', 'Calcium, Chalate ; mg', 4, 1, '["morning_and_evening"]', NULL, '1000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (18, '0', 'Chromium, Chelate ; mcg', 4, 1, '["morning_and_evening"]', NULL, '200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (19, '0', 'Copper ; mg', 4, 1, '["morning_and_evening"]', NULL, '2', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (20, '0', 'Iodine ; mcg', 4, 1, '["morning_and_evening"]', NULL, '150', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (21, '0', 'Iron, Chelate ; mg', 4, 1, '["morning_and_evening"]', NULL, 'M : 0 F : 10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (22, '0', 'Magnesium, Chelate ; mg', 4, 1, '["morning_and_evening"]', NULL, '250', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (23, '0', 'Manganese, Chelate ; mg', 4, 1, '["morning_and_evening"]', NULL, '4', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (24, '0', 'Molybdenum, Chelate ; mcg', 4, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (25, '0', 'Phosphorus ; mg', 4, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (26, '0', 'Potassium ; mg', 4, 1, '["morning_and_evening"]', NULL, '600', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (27, '0', 'Selenium, Chelate ; mcg', 4, 1, '["morning_and_evening"]', NULL, '200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (28, '0', 'Vanadium, Chelate ; mcg', 4, 1, '["morning_and_evening"]', NULL, '20', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (29, '0', 'Zinc, Chelate ; mg', 4, 1, '["morning_and_evening"]', NULL, '20', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (30, '0', 'Alpha Lipoic Acid ; mg', 5, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (31, '0', 'Coenzyme Q10 ; mg', 5, 1, '["morning_and_evening"]', NULL, '30', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (32, '0', 'L-Glutathione ; mg', 5, 1, '["morning_and_evening"]', NULL, '50', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (33, '0', 'Lycopene, Tomato Extract ; mg', 5, 1, '["morning_and_evening"]', NULL, '20', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (34, '0', 'Astaxanthin ; mg', 5, 1, '["morning_and_evening"]', NULL, '30', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (35, '0', 'L-Carnitine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (36, '0', 'L-Phenylalanine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (37, '0', 'N-Acetyl-L-Cysteine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (38, '0', 'L-Cystine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (39, '0', 'L-Lysine Monohydrochloride ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (40, '0', 'L-Methionine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (41, '0', 'L-Tyrosine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (42, '0', 'L-Arginine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (43, '0', 'L-Glutamine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (44, '0', 'L-Tryptophan ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (45, '0', 'L-Ornithine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (46, '0', 'L-Carnosine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (47, '0', 'L-Glutamic Acid ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (48, '0', 'Glycine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (49, '0', 'Taurine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (50, '0', 'Citicoline ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (51, '0', 'Black Ginger Extract ; mg', 7, 1, '["morning_and_evening"]', NULL, '500-3000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (52, '0', 'Capsicum Extract ; mg', 7, 1, '["morning_and_evening"]', NULL, '250-1,500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (53, '0', 'Citrin, Garcinia Cambogia ; mg', 7, 1, '["morning_and_evening"]', NULL, '250-2,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (54, '0', 'Conjugated Linoleic Acids ; mg', 7, 1, '["morning_and_evening"]', NULL, '400-800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (55, '0', 'Fabenol, White Kidney Bean ; mg', 7, 1, '["morning_and_evening"]', NULL, '100-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (56, '0', 'Forslean, Coleus Forskohlii ; mg', 7, 1, '["morning_and_evening"]', NULL, '50-500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (57, '0', 'Garcinia Extract ; mg', 7, 1, '["morning_and_evening"]', NULL, '500-2,800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (58, '0', 'Gaurana ; mg', 7, 1, '["morning_and_evening"]', NULL, '150-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (59, '0', 'Konjac ; mg', 7, 1, '["morning_and_evening"]', NULL, '500-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (60, '0', 'Green Tea Extract Decaff ; mg', 7, 1, '["morning_and_evening"]', NULL, '100-1,500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (61, '0', 'Senna Extract ; mg', 7, 1, '["morning_and_evening"]', NULL, '20-30', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (62, '0', 'Spirulina ; mg', 7, 1, '["morning_and_evening"]', NULL, '100-2,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (63, '0', 'Fiber Psyllium Husk ; mg', 7, 1, '["morning_and_evening"]', NULL, '1000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (64, '0', 'Digestzyme ; mg', 8, 1, '["morning_and_evening"]', NULL, '250-500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (65, '0', 'Fiber FOS ; mg', 8, 1, '["morning_and_evening"]', NULL, '3000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (66, '0', 'Lactobacillus Acidophilus ; mg', 8, 1, '["morning_and_evening"]', NULL, '150', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (67, '0', 'Ashibata, Japanese Angelica ; mg', 9, 1, '["morning_and_evening"]', NULL, '100-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (68, '0', 'Echinacea Extract l mg', 9, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (69, '0', 'Reishi ; mg', 9, 1, '["morning_and_evening"]', NULL, '100-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (70, '0', 'Ashwagandha Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '450', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (71, '0', 'Bacopin, Bacopa Monniera ; mg', 10, 1, '["morning_and_evening"]', NULL, '50-300', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (72, '0', 'Beta Glucan ; mg', 10, 1, '["morning_and_evening"]', NULL, '40-500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (73, '0', 'Butea, Red Kwao Krua ; mg', 10, 1, '["morning_and_evening"]', NULL, '300-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (74, '0', 'Bilberry ; mg', 10, 1, '["morning_and_evening"]', NULL, '80-200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (75, '0', 'BioPerine, Black Pepper ; mg', 10, 1, '["morning_and_evening"]', NULL, '5-100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (76, '0', 'Black Cohosh ; mg', 10, 1, '["morning_and_evening"]', NULL, '80', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (77, '0', 'Centellin, Gotu Kola ; mg', 10, 1, '["morning_and_evening"]', NULL, '60-350', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (78, '0', 'Citrus Bioflavonoids ; mg', 10, 1, '["morning_and_evening"]', NULL, '300-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (79, '0', 'Curbilene, Pumpkin Seed ; mg', 10, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (80, '0', 'Curcumin C3 ; mg', 10, 1, '["morning_and_evening"]', NULL, '100-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (81, '0', 'Emblic Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (82, '0', 'Garlic ; mg', 10, 1, '["morning_and_evening"]', NULL, '600', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (83, '0', 'Ginkgo Biloba Phytosome ; mg', 10, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (84, '0', 'Gingko Serine ; mg', 10, 1, '["morning_and_evening"]', NULL, '40', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (85, '0', 'Ginseng ; mg', 10, 1, '["morning_and_evening"]', NULL, '200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (86, '0', 'Glucosamine Hydrochoride ; mg', 10, 1, '["morning_and_evening"]', NULL, '1000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (87, '0', 'Chondroltin SCP ; mg', 10, 1, '["morning_and_evening"]', NULL, '800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (88, '0', 'Gamma Cryzanol, Rice Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '600', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (89, '0', 'Grape Seed Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '300', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (90, '0', 'Hawthron Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '100-1,200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (91, '0', 'Horsetail ; mg', 10, 1, '["morning_and_evening"]', NULL, '300-6,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (92, '0', 'Indole 3 Carbinot ; mg', 10, 1, '["morning_and_evening"]', NULL, '300', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (93, '0', 'Lecithin ; mg', 10, 1, '["morning_and_evening"]', NULL, '500-4,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (94, '0', 'Licorice ; mg', 10, 1, '["morning_and_evening"]', NULL, '500-4,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (95, '0', 'Madeglucyf ; mg', 10, 1, '["morning_and_evening"]', NULL, '1000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (96, '0', 'Milk Thistle Silymarin ; mg', 10, 1, '["morning_and_evening"]', NULL, '160-800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (97, '0', 'Cleaselect, Olive Pulp Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '25-100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (98, '0', 'Phytosterol ; mg', 10, 1, '["morning_and_evening"]', NULL, '800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (99, '0', 'Policosanot, Saccharum Officinarum ; mg', 10, 1, '["morning_and_evening"]', NULL, '18384', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (100, '0', 'Pycnogynol, Pine Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '50-360', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (101, '0', 'Rosemary ; mg', 10, 1, '["morning_and_evening"]', NULL, '5-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (102, '0', 'Safflower Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (103, '0', 'Saw Palmetto Serenoa ; mg', 10, 1, '["morning_and_evening"]', NULL, '320', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (104, '0', 'Soy Isoflavone ; mg', 10, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (105, '0', 'Soy Peptide ; mg', 10, 1, '["morning_and_evening"]', NULL, '200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (106, '0', 'Silyphos ; mg', 10, 1, '["morning_and_evening"]', NULL, '180-800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (107, '0', 'Triphala, Terminalia Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '150-500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (108, '0', 'Valerian Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '400-900', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (109, '0', 'Sustained Release Vit C (500mg)', 2, 1, '["morning_and_evening"]', NULL, '500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (110, '0', 'Fish Oil (1000 mg EPA180/DHA120)', 2, 1, '["morning_and_evening"]', NULL, '1000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (111, '0', 'Flax Seed Oil (1000 mg)', 2, 1, '["morning_and_evening"]', NULL, '1000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (112, '0', 'Evening Primrose Oil (500 mg)', 2, 1, '["morning_and_evening"]', NULL, '500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (113, '0', 'Vitamin K (100 mcg)', 2, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (114, '0', 'Whey Protein Isolate (31g)', 2, 1, '["morning_and_evening"]', NULL, '31', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (115, '0', 'Vitamin A; IU', 3, 1, '["morning_and_evening"]', NULL, '2000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (116, '0', 'Thiamin Hydrochloride (B1); mg', 3, 1, '["morning_and_evening"]', NULL, '10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (117, '0', 'Riboflavin-5-Phosphate (B2); mg', 3, 1, '["morning_and_evening"]', NULL, '5', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (118, '0', 'Niacinamide (B3) ; mg', 3, 1, '["morning_and_evening"]', NULL, '10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (119, '0', 'Calcium-D-Pantothenate (B5) ; mg', 3, 1, '["morning_and_evening"]', NULL, '10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (120, '0', 'Pyridoxine Hydrochloride (B6) ; mg', 3, 1, '["morning_and_evening"]', NULL, '10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (121, '0', 'Biotin (Vit H) ; mcg', 3, 1, '["morning_and_evening"]', NULL, '300', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (122, '0', 'Folic Acid (B9) ; mcg', 3, 1, '["morning_and_evening"]', NULL, '400', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (123, '0', 'Cyanocobalamin (B12) ; mcg', 3, 1, '["morning_and_evening"]', NULL, '10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (124, '0', 'Inositol ; mg', 3, 1, '["morning_and_evening"]', NULL, '250-500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (125, '0', 'Vitamin C ; mg', 3, 1, '["morning_and_evening"]', NULL, '1000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (126, '0', 'Vitamin D3 ; IU', 3, 1, '["morning_and_evening"]', NULL, '400', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (127, '0', 'Vitamin E (Alpha Tocopheryl); IU', 3, 1, '["morning_and_evening"]', NULL, '400', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (128, '0', 'D-Gamma Tocopherol ; IU', 3, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (129, '0', 'Tocotrienol ; mg', 3, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (130, '0', 'Boron, Chelate ; mg', 4, 1, '["morning_and_evening"]', NULL, '1', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (131, '0', 'Calcium, Chalate ; mg', 4, 1, '["morning_and_evening"]', NULL, '1000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (132, '0', 'Chromium, Chelate ; mcg', 4, 1, '["morning_and_evening"]', NULL, '200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (133, '0', 'Copper ; mg', 4, 1, '["morning_and_evening"]', NULL, '2', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (134, '0', 'Iodine ; mcg', 4, 1, '["morning_and_evening"]', NULL, '150', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (135, '0', 'Iron, Chelate ; mg', 4, 1, '["morning_and_evening"]', NULL, 'M : 0 F : 10', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (136, '0', 'Magnesium, Chelate ; mg', 4, 1, '["morning_and_evening"]', NULL, '250', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (137, '0', 'Manganese, Chelate ; mg', 4, 1, '["morning_and_evening"]', NULL, '4', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (138, '0', 'Molybdenum, Chelate ; mcg', 4, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (139, '0', 'Phosphorus ; mg', 4, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (140, '0', 'Potassium ; mg', 4, 1, '["morning_and_evening"]', NULL, '600', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (141, '0', 'Selenium, Chelate ; mcg', 4, 1, '["morning_and_evening"]', NULL, '200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (142, '0', 'Vanadium, Chelate ; mcg', 4, 1, '["morning_and_evening"]', NULL, '20', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (143, '0', 'Zinc, Chelate ; mg', 4, 1, '["morning_and_evening"]', NULL, '20', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (144, '0', 'Alpha Lipoic Acid ; mg', 5, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (145, '0', 'Coenzyme Q10 ; mg', 5, 1, '["morning_and_evening"]', NULL, '30', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (146, '0', 'L-Glutathione ; mg', 5, 1, '["morning_and_evening"]', NULL, '50', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (147, '0', 'Lycopene, Tomato Extract ; mg', 5, 1, '["morning_and_evening"]', NULL, '20', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (148, '0', 'Astaxanthin ; mg', 5, 1, '["morning_and_evening"]', NULL, '30', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (149, '0', 'L-Carnitine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (150, '0', 'L-Phenylalanine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (151, '0', 'N-Acetyl-L-Cysteine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (152, '0', 'L-Cystine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (153, '0', 'L-Lysine Monohydrochloride ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (154, '0', 'L-Methionine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (155, '0', 'L-Tyrosine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (156, '0', 'L-Arginine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (157, '0', 'L-Glutamine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (158, '0', 'L-Tryptophan ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (159, '0', 'L-Ornithine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (160, '0', 'L-Carnosine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (161, '0', 'L-Glutamic Acid ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (162, '0', 'Glycine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (163, '0', 'Taurine ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (164, '0', 'Citicoline ; mg', 6, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (165, '0', 'Black Ginger Extract ; mg', 7, 1, '["morning_and_evening"]', NULL, '500-3000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (166, '0', 'Capsicum Extract ; mg', 7, 1, '["morning_and_evening"]', NULL, '250-1,500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (167, '0', 'Citrin, Garcinia Cambogia ; mg', 7, 1, '["morning_and_evening"]', NULL, '250-2,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (168, '0', 'Conjugated Linoleic Acids ; mg', 7, 1, '["morning_and_evening"]', NULL, '400-800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (169, '0', 'Fabenol, White Kidney Bean ; mg', 7, 1, '["morning_and_evening"]', NULL, '100-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (170, '0', 'Forslean, Coleus Forskohlii ; mg', 7, 1, '["morning_and_evening"]', NULL, '50-500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (171, '0', 'Garcinia Extract ; mg', 7, 1, '["morning_and_evening"]', NULL, '500-2,800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (172, '0', 'Gaurana ; mg', 7, 1, '["morning_and_evening"]', NULL, '150-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (173, '0', 'Konjac ; mg', 7, 1, '["morning_and_evening"]', NULL, '500-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (174, '0', 'Green Tea Extract Decaff ; mg', 7, 1, '["morning_and_evening"]', NULL, '100-1,500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (175, '0', 'Senna Extract ; mg', 7, 1, '["morning_and_evening"]', NULL, '20-30', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (176, '0', 'Spirulina ; mg', 7, 1, '["morning_and_evening"]', NULL, '100-2,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (177, '0', 'Fiber Psyllium Husk ; mg', 7, 1, '["morning_and_evening"]', NULL, '1000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (178, '0', 'Digestzyme ; mg', 8, 1, '["morning_and_evening"]', NULL, '250-500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (179, '0', 'Fiber FOS ; mg', 8, 1, '["morning_and_evening"]', NULL, '3000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (180, '0', 'Lactobacillus Acidophilus ; mg', 8, 1, '["morning_and_evening"]', NULL, '150', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (181, '0', 'Ashibata, Japanese Angelica ; mg', 9, 1, '["morning_and_evening"]', NULL, '100-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (182, '0', 'Echinacea Extract l mg', 9, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (183, '0', 'Reishi ; mg', 9, 1, '["morning_and_evening"]', NULL, '100-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (184, '0', 'Ashwagandha Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '450', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (185, '0', 'Bacopin, Bacopa Monniera ; mg', 10, 1, '["morning_and_evening"]', NULL, '50-300', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (186, '0', 'Beta Glucan ; mg', 10, 1, '["morning_and_evening"]', NULL, '40-500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (187, '0', 'Butea, Red Kwao Krua ; mg', 10, 1, '["morning_and_evening"]', NULL, '300-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (188, '0', 'Bilberry ; mg', 10, 1, '["morning_and_evening"]', NULL, '80-200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (189, '0', 'BioPerine, Black Pepper ; mg', 10, 1, '["morning_and_evening"]', NULL, '5-100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (190, '0', 'Black Cohosh ; mg', 10, 1, '["morning_and_evening"]', NULL, '80', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (191, '0', 'Centellin, Gotu Kola ; mg', 10, 1, '["morning_and_evening"]', NULL, '60-350', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (192, '0', 'Citrus Bioflavonoids ; mg', 10, 1, '["morning_and_evening"]', NULL, '300-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (193, '0', 'Curbilene, Pumpkin Seed ; mg', 10, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (194, '0', 'Curcumin C3 ; mg', 10, 1, '["morning_and_evening"]', NULL, '100-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (195, '0', 'Emblic Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (196, '0', 'Garlic ; mg', 10, 1, '["morning_and_evening"]', NULL, '600', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (197, '0', 'Ginkgo Biloba Phytosome ; mg', 10, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (198, '0', 'Gingko Serine ; mg', 10, 1, '["morning_and_evening"]', NULL, '40', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (199, '0', 'Ginseng ; mg', 10, 1, '["morning_and_evening"]', NULL, '200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (200, '0', 'Glucosamine Hydrochoride ; mg', 10, 1, '["morning_and_evening"]', NULL, '1000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (201, '0', 'Chondroltin SCP ; mg', 10, 1, '["morning_and_evening"]', NULL, '800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (202, '0', 'Gamma Cryzanol, Rice Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '600', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (203, '0', 'Grape Seed Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '300', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (204, '0', 'Hawthron Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '100-1,200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (205, '0', 'Horsetail ; mg', 10, 1, '["morning_and_evening"]', NULL, '300-6,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (206, '0', 'Indole 3 Carbinot ; mg', 10, 1, '["morning_and_evening"]', NULL, '300', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (207, '0', 'Lecithin ; mg', 10, 1, '["morning_and_evening"]', NULL, '500-4,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (208, '0', 'Licorice ; mg', 10, 1, '["morning_and_evening"]', NULL, '500-4,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (209, '0', 'Madeglucyf ; mg', 10, 1, '["morning_and_evening"]', NULL, '1000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (210, '0', 'Milk Thistle Silymarin ; mg', 10, 1, '["morning_and_evening"]', NULL, '160-800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (211, '0', 'Cleaselect, Olive Pulp Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '25-100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (212, '0', 'Phytosterol ; mg', 10, 1, '["morning_and_evening"]', NULL, '800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (213, '0', 'Policosanot, Saccharum Officinarum ; mg', 10, 1, '["morning_and_evening"]', NULL, '18384', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (214, '0', 'Pycnogynol, Pine Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '50-360', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (215, '0', 'Rosemary ; mg', 10, 1, '["morning_and_evening"]', NULL, '5-3,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (216, '0', 'Safflower Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (217, '0', 'Saw Palmetto Serenoa ; mg', 10, 1, '["morning_and_evening"]', NULL, '320', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (218, '0', 'Soy Isoflavone ; mg', 10, 1, '["morning_and_evening"]', NULL, '100-1,000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (219, '0', 'Soy Peptide ; mg', 10, 1, '["morning_and_evening"]', NULL, '200', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (220, '0', 'Silyphos ; mg', 10, 1, '["morning_and_evening"]', NULL, '180-800', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (221, '0', 'Triphala, Terminalia Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '150-500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (222, '0', 'Valerian Extract ; mg', 10, 1, '["morning_and_evening"]', NULL, '400-900', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (223, '0', 'Sustained Release Vit C (500mg)', 2, 1, '["morning_and_evening"]', NULL, '500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (224, '0', 'Fish Oil (1000 mg EPA180/DHA120)', 2, 1, '["morning_and_evening"]', NULL, '1000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (225, '0', 'Flax Seed Oil (1000 mg)', 2, 1, '["morning_and_evening"]', NULL, '1000', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (226, '0', 'Evening Primrose Oil (500 mg)', 2, 1, '["morning_and_evening"]', NULL, '500', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (227, '0', 'Vitamin K (100 mcg)', 2, 1, '["morning_and_evening"]', NULL, '100', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);
INSERT INTO `products` (`id`, `code`, `display_name`, `category_id`, `unit_id`, `default_consume_time`, `note`, `recommended_dosage`, `inactive`, `price_base`, `price_formula`, `price_var`, `volume_base`, `volume_formula`, `volume_var`) VALUES (228, '0', 'Whey Protein Isolate (31g)', 2, 1, '["morning_and_evening"]', NULL, '31', 0, 1, '$PRICE * $QUANTITY;', NULL, 1, '$VOLUME * $QUANTITY;', NULL);

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `product_inventory`
-- 

DROP TABLE IF EXISTS `product_inventory`;
CREATE TABLE IF NOT EXISTS `product_inventory` (
  `id` int(10) NOT NULL auto_increment,
  `product_id` int(10) NOT NULL,
  `unit_id` int(10) NOT NULL,
  `count` decimal(16,6) NOT NULL,
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `remarks` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- 
-- dump ตาราง `product_inventory`
-- 

INSERT INTO `product_inventory` (`id`, `product_id`, `unit_id`, `count`, `updated`, `remarks`) VALUES (4, 28, 1, 990.000000, '2011-08-04 11:54:18', 'First created');
INSERT INTO `product_inventory` (`id`, `product_id`, `unit_id`, `count`, `updated`, `remarks`) VALUES (5, 29, 1, 5000.000000, '2011-08-10 10:57:35', 'First created');
INSERT INTO `product_inventory` (`id`, `product_id`, `unit_id`, `count`, `updated`, `remarks`) VALUES (6, 30, 1, 100.000000, '2011-08-31 09:52:28', 'First created');
INSERT INTO `product_inventory` (`id`, `product_id`, `unit_id`, `count`, `updated`, `remarks`) VALUES (7, 31, 1, 100.000000, '2011-09-01 09:06:53', 'First created');
INSERT INTO `product_inventory` (`id`, `product_id`, `unit_id`, `count`, `updated`, `remarks`) VALUES (8, 32, 1, 1000.000000, '2011-09-01 09:08:03', 'First created');
INSERT INTO `product_inventory` (`id`, `product_id`, `unit_id`, `count`, `updated`, `remarks`) VALUES (9, 33, 1, 1234.000000, '2011-09-01 09:09:42', 'First created');
INSERT INTO `product_inventory` (`id`, `product_id`, `unit_id`, `count`, `updated`, `remarks`) VALUES (10, 34, 2, 1234.000000, '2011-09-01 10:46:15', 'First created');
INSERT INTO `product_inventory` (`id`, `product_id`, `unit_id`, `count`, `updated`, `remarks`) VALUES (11, 35, 2, 1234.000000, '2011-09-01 10:46:54', 'First created');
INSERT INTO `product_inventory` (`id`, `product_id`, `unit_id`, `count`, `updated`, `remarks`) VALUES (12, 36, 1, 53245.000000, '2011-09-01 10:48:38', 'First created');
INSERT INTO `product_inventory` (`id`, `product_id`, `unit_id`, `count`, `updated`, `remarks`) VALUES (13, 37, 1, 53245.000000, '2011-09-01 10:49:20', 'First created');
INSERT INTO `product_inventory` (`id`, `product_id`, `unit_id`, `count`, `updated`, `remarks`) VALUES (14, 38, 1, 4564.000000, '2011-09-01 10:50:52', 'First created');

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `product_unit`
-- 

DROP TABLE IF EXISTS `product_unit`;
CREATE TABLE IF NOT EXISTS `product_unit` (
  `id` int(11) NOT NULL default '0',
  `display_rank` int(10) default NULL,
  `display_name` varchar(100) default NULL,
  `gram_conversion_factor` decimal(20,6) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- dump ตาราง `product_unit`
-- 

INSERT INTO `product_unit` (`id`, `display_rank`, `display_name`, `gram_conversion_factor`) VALUES (1, 1, 'mg', 1000.000000);
INSERT INTO `product_unit` (`id`, `display_rank`, `display_name`, `gram_conversion_factor`) VALUES (2, 2, 'g', 1.000000);
INSERT INTO `product_unit` (`id`, `display_rank`, `display_name`, `gram_conversion_factor`) VALUES (3, 3, 'nano gram', 1000000.000000);
INSERT INTO `product_unit` (`id`, `display_rank`, `display_name`, `gram_conversion_factor`) VALUES (4, 4, 'capsule', NULL);
INSERT INTO `product_unit` (`id`, `display_rank`, `display_name`, `gram_conversion_factor`) VALUES (5, 5, 'AU', NULL);
INSERT INTO `product_unit` (`id`, `display_rank`, `display_name`, `gram_conversion_factor`) VALUES (6, 6, 'softgel', NULL);
INSERT INTO `product_unit` (`id`, `display_rank`, `display_name`, `gram_conversion_factor`) VALUES (7, 7, 'box', NULL);

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `status`
-- 

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(10) NOT NULL default '0',
  `name` varchar(50) default NULL,
  `icon` varchar(100) default NULL,
  `html` varchar(100) default NULL,
  `remark` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- dump ตาราง `status`
-- 

INSERT INTO `status` (`id`, `name`, `icon`, `html`, `remark`) VALUES (0, 'na', 'negative.gif', NULL, 'test');
INSERT INTO `status` (`id`, `name`, `icon`, `html`, `remark`) VALUES (1, 'draft', 'action1.gif', NULL, NULL);
INSERT INTO `status` (`id`, `name`, `icon`, `html`, `remark`) VALUES (2, 'request', 'white_ico.png', NULL, NULL);
INSERT INTO `status` (`id`, `name`, `icon`, `html`, `remark`) VALUES (3, 'pending', 'new_messages.gif', NULL, NULL);
INSERT INTO `status` (`id`, `name`, `icon`, `html`, `remark`) VALUES (4, 'confirmed', 'sm_lk6.gif', NULL, NULL);
INSERT INTO `status` (`id`, `name`, `icon`, `html`, `remark`) VALUES (5, 'processing', 'status_pending.gif', NULL, NULL);
INSERT INTO `status` (`id`, `name`, `icon`, `html`, `remark`) VALUES (6, 'complete', 'green_ico.png', NULL, NULL);
INSERT INTO `status` (`id`, `name`, `icon`, `html`, `remark`) VALUES (7, 'approved', 'move2.gif', NULL, NULL);

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `stock_cards`
-- 

DROP TABLE IF EXISTS `stock_cards`;
CREATE TABLE IF NOT EXISTS `stock_cards` (
  `manufacturing_item_id` int(11) NOT NULL,
  `report_time` timestamp NULL default NULL,
  `product_id` int(11) default NULL,
  `inventory_count` decimal(10,7) default NULL,
  `inventory_unit` varchar(45) default NULL,
  PRIMARY KEY  (`manufacturing_item_id`),
  KEY `manufacturing_stock_card` (`manufacturing_item_id`),
  KEY `stock_card_roduct` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Inventory (FIFO)';

-- 
-- dump ตาราง `stock_cards`
-- 


-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `users`
-- 

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(45) NOT NULL,
  `display_name` varchar(45) NOT NULL,
  `full_name` varchar(45) default NULL,
  `password` varchar(45) NOT NULL,
  `salt` varchar(45) NOT NULL default '1234',
  `email` varchar(45) default NULL,
  `type` char(15) NOT NULL default 'GUEST',
  `inactive` tinyint(1) default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='system user' AUTO_INCREMENT=216 ;

-- 
-- dump ตาราง `users`
-- 

INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (1, 'admin', 'Admin', 'Admin Person', '78add250d97c13abd0028280d3969b49', '4e6b765c882253.06166798', 'chayapan@gmail.com', 'ADMIN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (2, 'test', 'tester1', 'Tester Number1', '''''', '1234', NULL, 'GUEST', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (3, 'demo', 'demo', 'demo', '2e5c7db760a33498023813489cfadc0b', '28b206548469ce62182048fd9cf91760', 'webmaster@example.com', 'GUEST', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (4, 'doctor1', 'doctor1', 'นพ.สมชาย จันทร์สว่าง ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml1@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (5, 'doctor2', 'doctor2', 'ดร.ทวีศักดิ์ มหชวโรจน์', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml2@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (6, 'doctor3', 'doctor3', 'พล.ร.ต.นพ.สุรเชษฐ สู่พานิช ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml3@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (7, 'doctor4', 'doctor4', 'นพ.ไศล สุขพันธ์โพธาราม ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml4@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (8, 'doctor5', 'doctor5', 'นพ.สุวัฒน์ วิทยาคม ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml5@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (9, 'doctor6', 'doctor6', 'คุณพูลชัย ชเนศร์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml6@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (10, 'doctor7', 'doctor7', 'นพ.ฐิติ พัฒนกำจร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml7@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (11, 'doctor8', 'doctor8', 'นพ.สุวิทย์ โฆษิตสุรังคกุล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml8@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (12, 'admin1', 'doctor9', 'นพ.ธวัชชัย วานิชกร ', '20349e69c2901e50fff1c27476659634', '4e6b768967ed97.69858354', 'mml9@spam.la', 'ADMIN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (13, 'admin2', 'doctor10', 'นพ.ชัยพฤกษ์ ปิยะเกศิน ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml10@spam.la', 'ADMIN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (14, 'admin3', 'doctor11', 'นพ.นพรัตน์ สุจริตจันทร์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml11@spam.la', 'ADMIN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (15, 'admin4', 'doctor12', 'นพ.จงเจตน์ อาวเจนพงษ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml12@spam.la', 'ADMIN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (16, 'manager1', 'manager1', 'นพ.จำเริญ สรพิพัฒน์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml13@spam.la', 'MANAGER', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (17, 'manager2', 'manager2', 'นพ.สุชัย หยองอนุกูล์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml14@spam.la', 'MANAGER', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (18, 'manager3', 'manager3', 'ศ.นพ.จิตร สิทธิอมร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml15@spam.la', 'MANAGER', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (19, 'manager4', 'manager4', 'พญ.ลักษมี ว่องกุศลกิจ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml16@spam.la', 'MANAGER', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (20, 'tester17', 'doctor17', 'นพ.สราวุธ อนันต์เศรษฐกุล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml17@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (21, 'operator1', 'operator1', 'นพ.ศุภชัย โชติบุตร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml18@spam.la', 'OPERATOR', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (22, 'operator2', 'operator2', 'ศ.นพ.เทพ หิมะทองคำ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml19@spam.la', 'OPERATOR', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (23, 'operator3', 'operator3', 'นพ.เจริญ มีนสุข ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml20@spam.la', 'OPERATOR', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (24, 'operator4', 'operator4', 'คุณเฉลิมกุล อภิกุลโอภาส ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml21@spam.la', 'OPERATOR', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (25, 'tester22', 'doctor22', 'นพ.วิโรจน์ ตระการวิจิตร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml22@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (26, 'tester23', 'doctor23', 'นพ.ประจักษ์ บุญจิตต์พิมล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml23@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (27, 'tester24', 'doctor24', 'นพ.อรรคพาสน์ โอวาทตระกูล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml24@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (28, 'tester25', 'doctor25', 'พญ..เจรียง จันทรกมล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml25@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (29, 'tester26', 'doctor26', 'พญ.ลินดา ไกรวิทย์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml26@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (30, 'tester27', 'doctor27', 'นพ.ชุตินันท์ พรมมินทร์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml27@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (31, 'sale1', 'sale1', 'นพ.วีระ อิงคภาสกร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml28@spam.la', 'SALE', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (32, 'sale3', 'sale3', 'นพ.มานิตย์ จารุวรรณ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml29@spam.la', 'SALE', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (33, 'sale4', 'sale4', 'พญ.ศศิธร พงษ์สามารถ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml30@spam.la', 'SALE', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (34, 'sale2', 'sale2', 'นพ.เกตุ สายเพชร์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml31@spam.la', 'SALE', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (35, 'tester32', 'doctor32', 'นพ.สุรสิทธิ์ อัศดามงคล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml32@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (36, 'tester33', 'doctor33', 'คุณแม็ค แบนเนอร์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml33@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (37, 'tester34', 'doctor34', 'รออ.นพ.พิทักษ์ ฐานบัญชา ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml34@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (38, 'tester35', 'doctor35', 'test doctor 35', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml35@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (39, 'tester36', 'doctor36', 'นพ.พิชัย แพร่ภัทร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml36@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (40, 'tester37', 'doctor37', 'นพ.นพรัตน์ โง้วจุงดี ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml37@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (41, 'manufacture2', 'manufacture2', 'คุณไกรวิน ศรีไกรวิน ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml38@spam.la', 'MANUFACTURE', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (42, 'manufacture3', 'manufacture3', 'คุณธนา ถิรมนัส ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml39@spam.la', 'MANUFACTURE', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (43, 'manufacture1', 'manufacture1', 'นพ.อนันตศักดิ์ อภัยรัตน์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml40@spam.la', 'MANUFACTURE', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (44, 'manufacture4', 'manufacture4', 'นพ.ปรีชา เลิศศิวาพร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml41@spam.la', 'MANUFACTURE', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (45, 'tester42', 'doctor42', 'นพ.เสถียร ภู่ประเสริฐ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml42@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (46, 'tester43', 'doctor43', 'นพ.พิชิต ยิ่งเจริญ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml43@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (47, 'tester44', 'doctor44', 'นพ.ชนะ ตันจันทร์พงษ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml44@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (48, 'tester45', 'doctor45', 'นพ.สวัสดิ์ เถกิงเดช ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml45@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (49, 'tester46', 'doctor46', 'นพ.เหรียญทอง แน่นหนา ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml46@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (50, 'tester47', 'doctor47', 'นพ.ชูเกียรติ ศุภนันตฤกษ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml47@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (51, 'staff1', 'staff1', 'คุณสมชัย ชื่นจิตร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml48@spam.la', 'CLINICIAN_STAFF', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (52, 'staff3', 'staff3', 'นพ.ภาวิต ปุญญฤทธ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml49@spam.la', 'CLINICIAN_STAFF', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (53, 'staff2', 'staff2', 'นพ. เกริกยศ ชลายนเดชะ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml50@spam.la', 'CLINICIAN_STAFF', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (54, 'staff4', 'staff4', 'นพ.ธวัชชัย เจริญวงศ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml51@spam.la', 'CLINICIAN_STAFF', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (55, 'tester52', 'doctor52', 'ทพ.เจิมพล ภูมิตระกูล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml52@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (56, 'tester53', 'doctor53', 'คุณนิตยา ปรีชายุทธ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml53@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (57, 'tester54', 'doctor54', 'นพ.วรพงศ์ จูตะวิริยะ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml54@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (58, 'tester55', 'doctor55', 'พล.ท.นพ.ณรงค์ รอดวรรณะ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml55@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (59, 'tester56', 'doctor56', 'พล.ท.นพ.พร้อมพงษ์ พีระบูล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml56@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (60, 'tester57', 'doctor57', 'นพ.ไพบูลย์ เอกแสงศรี ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml57@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (61, 'tester58', 'doctor58', 'ร.อ.ชาคริต ศึกษากิจ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml58@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (62, 'tester59', 'doctor59', 'นพ.ถนอมชัย คู่ทวีธรรม ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml59@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (63, 'tester60', 'doctor60', 'นพ.สุรพล โล่สิริวัฒน์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml60@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (64, 'tester61', 'doctor61', 'นพ.นิพนธ์ ธีราโมก ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml61@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (65, 'tester62', 'doctor62', 'นพ.ธงชัย ฉัตรยิ่งมงคล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml62@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (66, 'tester63', 'doctor63', 'นพ.เทอดศักดิ์ ปรมากูล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml63@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (67, 'tester64', 'doctor64', 'นพ.โชคชัย จารุศิริพิพัฒน์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml64@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (68, 'tester65', 'doctor65', 'นพ.ดุลย์ ดำรงศักดิ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml65@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (69, 'tester66', 'doctor66', 'น.ท.พญ.ลักษมี ว่องกุศลกิจ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml66@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (70, 'tester67', 'doctor67', 'นพ.ศิริพงษ์ เหลืองวารินกุล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml67@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (71, 'tester68', 'doctor68', 'นพ.ดาวิน นารูลา ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml68@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (72, 'tester69', 'doctor69', 'นพ.พรชัย ตั้งลัคนวาณิชย์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml69@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (73, 'tester70', 'doctor70', 'นพ.ไกรสิทธิ์ นฤขัตพิชัย ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml70@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (74, 'tester71', 'doctor71', 'นพ.ตุลวรรธน์ พัชราภา ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml71@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (75, 'tester72', 'doctor72', 'คุณกมลวรรณ ลักษณะกาญจน์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml72@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (76, 'tester73', 'doctor73', 'นพ.พรมพันธ์ พรมมาส ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml73@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (77, 'tester74', 'doctor74', 'นพ.อนันต์ ธรรมจำรัสศรี ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml74@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (78, 'tester75', 'doctor75', 'นพ.สุชัย หยองอนุกูล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml75@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (79, 'tester76', 'doctor76', 'นพ.กฤชรัตน์ ตระกูลช่าง ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml76@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (80, 'tester77', 'doctor77', 'คุณพูนศักดิ์ จรูญศิริ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml77@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (81, 'tester78', 'doctor78', 'นพ.สุนทร อันตรเสน ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml78@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (82, 'tester79', 'doctor79', 'นพ.ส่งเสริม พานิชาภรณ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml79@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (83, 'clinician4', 'clinician4', 'นพ.สุธีร์ สทุมถิระ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml80@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (84, 'clinician1', 'clinician1', 'นพ.บุญชัย อิศราพิสิษฐ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml81@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (85, 'clinician3', 'clinician3', 'คุณวิโรจน์ อภิสิทธิ์วิทยา ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml82@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (86, 'clinician2', 'clinician2', 'นพ.ณรงค์ฤทธิ์ ฮาวรังษี ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml83@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (87, 'tester84', 'doctor84', 'นพ.กำพล พลัสสินทร์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml84@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (88, 'tester85', 'doctor85', 'นพ.กำพล พลัสสินทร์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml85@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (89, 'clinician89', 'doctor86', 'นพ.ยุทธนา สงวนศักดิ์โกศล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml86@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (90, 'tester87', 'doctor87', 'นพ.ภาสกร รักษ์กุล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml87@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (91, 'tester88', 'doctor88', 'นพ.อนันต์ อธิพันธุ์อำไพ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml88@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (92, 'tester89', 'doctor89', 'นพ.นิคม ศิริชัย ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml89@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (93, 'tester90', 'doctor90', 'นพ.ต่อพงศ์ อัศวิษณุ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml90@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (94, 'tester91', 'doctor91', 'นพ.พิพัฒน์ พงศ์รัตนามาน ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml91@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (95, 'tester92', 'doctor92', 'นพ.พิพัฒน์ พงศ์รัตนามาน ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml92@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (96, 'tester93', 'doctor93', 'คุณธนวัฒน์ ทวีชัยถาวร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml93@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (97, 'tester94', 'doctor94', 'นพ.เขตโสภณ จัตวัฒนกุล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml94@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (98, 'tester95', 'doctor95', 'นพ.โอภาส สินเพิ่มสุขสกุล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml95@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (99, 'tester96', 'doctor96', 'นพ.ศิริพงษ์ วิทยเลิศปัญญา ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml96@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (100, 'tester97', 'doctor97', 'นพ.สุเทพ วัตถุศิลป์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml97@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (101, 'tester98', 'doctor98', 'นพ.พงษ์เทพ เลิศสุวรรณสิทธิ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml98@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (102, 'tester99', 'doctor99', 'นพ.วราศักดิ์ ไกรฤกษ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml99@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (103, 'tester100', 'doctor100', 'พญ.วรินทร อัศวนิก ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml100@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (104, 'tester101', 'doctor101', 'นพ.สมเจษฎ์ ไกรโรจนานันท์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml101@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (105, 'tester102', 'doctor102', 'นพ.พนม สนิทประชากร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml102@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (106, 'tester103', 'doctor103', 'คุณไชยวัฒน์ วีระสมบัติ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml103@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (107, 'tester104', 'doctor104', 'นพ.ประเจิด สุรีย์จามร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml104@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (108, 'tester105', 'doctor105', 'นพ.วิวัฒน์ กิตติวัฒนโชติ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml105@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (109, 'tester106', 'doctor106', 'นพ.สำเริง ศรีผุดผ่อง ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml106@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (110, 'tester107', 'doctor107', 'นพ.บุญชัย บุญแสง ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml107@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (111, 'tester108', 'doctor108', 'นพ.เมธ โชคชัยชาญ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml108@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (112, 'tester109', 'doctor109', 'นพ.ทรงกิจ สุทธิกาญจน์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml109@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (113, 'tester110', 'doctor110', 'นพ.จารุวัฑ ใช้ความเพียร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml110@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (114, 'tester111', 'doctor111', 'นพ.กำธร ศิริธัญญาลักษณ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml111@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (115, 'tester112', 'doctor112', 'พญ.ชุติมา ปิ่นเจริญ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml112@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (116, 'tester113', 'doctor113', 'นพ.การุณ พุทธภาวนา ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml113@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (117, 'tester114', 'doctor114', 'นพ.พิชิต กังวลกิจ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml114@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (118, 'tester115', 'doctor115', 'พญ.วิมล สุรินทราบูรณ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml115@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (119, 'tester116', 'doctor116', 'นพ.ธนาคม แมนธนานนท์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml116@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (120, 'tester117', 'doctor117', 'นพ.สมเกียรติ ธนไพศาลพิพัฒน์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml117@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (121, 'tester118', 'doctor118', 'คุณอุไรวรรณ เทพนมรัตน์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml118@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (122, 'tester119', 'doctor119', 'นพ.ชัยรัตน์ ปัณฑุรอัมพร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml119@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (123, 'tester120', 'doctor120', 'ผศ.รังสรรค์ สุฉันทบุตร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml120@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (124, 'tester121', 'doctor121', 'นพ.จรัล ใจแพทย์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml121@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (125, 'tester122', 'doctor122', 'นพ.สานิตย์ ชากฤษณ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml122@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (126, 'tester123', 'doctor123', 'พญ.สุดจิต ลิขสิทธิ์ศุภการ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml123@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (127, 'tester124', 'doctor124', 'นพ.นิยม สลิสอำไพ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml124@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (128, 'tester125', 'doctor125', 'นพ.กริช สัตยบุตร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml125@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (129, 'tester126', 'doctor126', 'นพ.วิโรจน์ ดิเรกสถาพร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml126@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (130, 'tester127', 'doctor127', 'นพ.วรวิทย์ วัชโรทยางกูร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml127@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (131, 'tester128', 'doctor128', 'นพ.จรัสพงษ์ ทังสุบุตร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml128@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (132, 'tester129', 'doctor129', 'นพ.ทรงชัย ศรีโรจนกุล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml129@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (133, 'tester130', 'doctor130', 'นพ.เอกลาภ ทองบริสุทธิ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml130@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (134, 'tester131', 'doctor131', 'ภญ.รพีพร กิตติวงศ์โสภณ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml131@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (135, 'tester132', 'doctor132', 'นพ.สัมฤทธิ์ สินธัญญาธรรม ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml132@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (136, 'tester133', 'doctor133', 'คุณจิรวัฒน์ สุจิรานุธรรม ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml133@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (137, 'tester134', 'doctor134', 'นพ.ประสงค์ ประภาวงศ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml134@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (138, 'tester135', 'doctor135', 'นพ.กมิล ปั้นประสงค์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml135@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (139, 'tester136', 'doctor136', 'พญ.สุวรรณา ชูพิศาลยโรจน์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml136@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (140, 'tester137', 'doctor137', 'นพ.อิทธิ ฉันศิริกาญจน ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml137@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (141, 'tester138', 'doctor138', 'พญ.ดาวัลย์ อนุวุฒินาวิน ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml138@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (142, 'tester139', 'doctor139', 'นพ.พงษ์ศักดิ์ วัฒนา ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml139@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (143, 'tester140', 'doctor140', 'พญ.สายสุนี วรรณดุรงค์วรรณ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml140@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (144, 'tester141', 'doctor141', 'นพ.เกรียงไกร จีระแพทย์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml141@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (145, 'tester142', 'doctor142', 'นพ.โกวิท คำพิทักษ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml142@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (146, 'tester143', 'doctor143', 'นพ.ประณีต สงวนตระกูล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml143@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (147, 'tester144', 'doctor144', 'นพ.ธนรัชต์ สมุทรเพชร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml144@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (148, 'tester145', 'doctor145', 'นพ.บรรพต พึ่งชัยพัฒน์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml145@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (149, 'tester146', 'doctor146', 'นพ.วรพงษ์ ศักดิ์ศิรินุกูล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml146@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (150, 'tester147', 'doctor147', 'นพ.อิสระ อริยะชัยพาณิชย์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml147@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (151, 'tester148', 'doctor148', 'นพ.ธีรวัฒน์ ร่มไทรทอง ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml148@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (152, 'tester149', 'doctor149', 'นพ.สมชาย กิตติพงษ์หรรษา ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml149@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (153, 'tester150', 'doctor150', 'นพ.ธีระวัฒน์ ศรีนัครินทร์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml150@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (154, 'tester151', 'doctor151', 'คุณอนัญพร พูลนิติพร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml151@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (155, 'tester152', 'doctor152', 'นพ.บุญชัย จิตตนาสวัสดิ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml152@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (156, 'tester153', 'doctor153', 'คุณสมคิด ปิยะธรรมวุฒิกุล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml153@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (157, 'tester154', 'doctor154', 'พญ.ศุภวรรณ ตั้งสืบกุล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml154@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (158, 'tester155', 'doctor155', 'นพ.ปัญญา อยู่ประเสริฐ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml155@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (159, 'tester156', 'doctor156', 'คุณวิเชียร ชมดง ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml156@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (160, 'tester157', 'doctor157', 'นพ.ธีระยุทธ นิยากูล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml157@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (161, 'tester158', 'doctor158', 'นพ.หาญ สุฉันทบุตร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml158@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (162, 'tester159', 'doctor159', 'นพ.หาญ สุฉันทบุตร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml159@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (163, 'tester160', 'doctor160', 'พญ.กฤษณา โฆษิตจิรนันท์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml160@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (164, 'tester161', 'doctor161', 'ภก.สมพร จึงศิรกุลวิทย์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml161@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (165, 'tester162', 'doctor162', 'นพ.สุรชัย สุพันธมาตย์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml162@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (166, 'tester163', 'doctor163', 'นพ.นภดล ลุประสงค์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml163@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (167, 'tester164', 'doctor164', 'นพ.กิตติ ตั้งบรรเจิดสุข ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml164@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (168, 'tester165', 'doctor165', 'นพ.ชวลิต วิมลเฉลา ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml165@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (169, 'tester166', 'doctor166', 'นพ.วิสิทธิ์ อวิรุทธ์นันท์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml166@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (170, 'tester167', 'doctor167', 'นพ.พรชัย สัตยาประเสริฐ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml167@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (171, 'tester168', 'doctor168', 'พญ.สุรางค์รัตน์ วรรธนภูติ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml168@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (172, 'tester169', 'doctor169', 'นพ.สุชาติ กุละพัฒน์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml169@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (173, 'tester170', 'doctor170', 'นพ.พจนารถ จันทโรจวงศ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml170@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (174, 'tester171', 'doctor171', 'คุณบุญเลิศ คำนึงสิทธิ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml171@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (175, 'tester172', 'doctor172', 'นพ.เสริมสุข เหลาหชัยอรุณ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml172@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (176, 'tester173', 'doctor173', 'นพ.สุเทพ นิ่มพิทักษ์พงศ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml173@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (177, 'tester174', 'doctor174', 'นพ.พีระเชษฐ์ ภู่เกียรติ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml174@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (178, 'tester175', 'doctor175', 'นพ.อุดม วาริทนันท์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml175@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (179, 'tester176', 'doctor176', 'นพ.ยงยศ จริยวิทยาวัฒน์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml176@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (180, 'tester177', 'doctor177', 'นพ.พิเชษฐ์ อิศวสัมฤทธิ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml177@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (181, 'tester178', 'doctor178', 'ทพ.ประจวบ จันทรคิด ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml178@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (182, 'tester179', 'doctor179', 'นพ.สถาปน์ ชินวงศ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml179@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (183, 'tester180', 'doctor180', 'นพ.วรชัย วงศ์วรกุล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml180@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (184, 'tester181', 'doctor181', 'นพ.สมชัย ตั้งพร้อมพันธ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml181@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (185, 'tester182', 'doctor182', 'นพ.วิฑูรย์ ยงเมธาวุฒิ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml182@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (186, 'tester183', 'doctor183', 'นพ.อำนวย ชิงชยานุรักษ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml183@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (187, 'tester184', 'doctor184', 'นพ.ศยาม เวศกิจกุล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml184@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (188, 'tester185', 'doctor185', 'นพ.วรพันธ์ อุณจักร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml185@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (189, 'tester186', 'doctor186', 'คุณวรัญญา เลี้ยงลักษณ์เลิศ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml186@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (190, 'tester187', 'doctor187', 'นพ.วรพันธ์ อุณจักร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml187@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (191, 'tester188', 'doctor188', 'tนพ.อดุล วรินทรเวช ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml188@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (192, 'tester189', 'doctor189', 'นพ.สมชาย อบบุญ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml189@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (193, 'tester190', 'doctor190', 'นพ.สุมิน พฤกษิกานนท์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml190@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (194, 'tester191', 'doctor191', 'ศ.นพ.ชาลี พรพัฒน์กุล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml191@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (195, 'tester192', 'doctor192', 'นพ.ดุสิต ศรีสกุล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml192@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (196, 'tester193', 'doctor193', 'นพ.ฐานิสร์ กาญจนรัตนากร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml193@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (197, 'tester194', 'doctor194', 'นพ.บุญจง ชูชัยแสงรัตน์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml194@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (198, 'tester195', 'doctor195', 'นพ.วัชระ สนธิชัย ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml195@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (199, 'tester196', 'doctor196', 'นพ.ประสิทธิ์ วิรัชสุขสมบัติ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml196@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (200, 'tester197', 'doctor197', 'นพ.ปรีชา มิตรกูล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml197@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (201, 'tester198', 'doctor198', 'นพ.พรชัย ลีานิพนธ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml198@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (202, 'tester199', 'doctor199', 'นพ.วิเชียร วิชานศวกุล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml199@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (203, 'tester200', 'doctor200', 'พญ.กษมาพร เที่ยงธรรม ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml200@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (204, 'tester201', 'doctor201', 'นพ.ก้องเกียรติ เกษเพ็ชร ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml201@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (205, 'tester202', 'doctor202', 'นพ.อนุโรจน์ ธารสิริโรจน์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml202@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (206, 'tester203', 'doctor203', 'นพ.บรรจบ มานะกุล ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml203@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (207, 'tester204', 'doctor204', 'คุณกริชพงศ์ เค้าอุทัย ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml204@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (208, 'tester205', 'doctor205', 'นพ.ชุมโชค จันทร์วิเมลือง ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml205@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (209, 'tester206', 'doctor206', 'นพ.สมชัย เจียรนัยศิลป์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml206@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (210, 'tester207', 'doctor207', 'นพ.วิศิษฐ์ อมรวิทยารักษ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml207@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (211, 'tester208', 'doctor208', 'พญ.ศศินี โภคโต ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml208@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (212, 'tester209', 'doctor209', 'นพ.ณรงค์ฤทธิ์ ฮาวรังษี ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml209@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (213, 'tester210', 'doctor210', 'นพ.จำลอง บ่อเกิด ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml210@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (214, 'tester211', 'doctor211', 'คุณปิยพล ศรียะพันธุ์ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml211@spam.la', 'CLINICIAN', 0);
INSERT INTO `users` (`id`, `username`, `display_name`, `full_name`, `password`, `salt`, `email`, `type`, `inactive`) VALUES (215, 'tester212', 'doctor212', 'นพ.อาคเนย์ สุขอยู่ ', 'ed2b1f468c5f915f3f1cf75d7068baae', '1234', 'mml212@spam.la', 'CLINICIAN', 0);

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `user_customer`
-- 

DROP TABLE IF EXISTS `user_customer`;
CREATE TABLE IF NOT EXISTS `user_customer` (
  `user_id` int(11) default NULL,
  `customer_id` int(11) default NULL,
  `role` varchar(10) default NULL,
  KEY `customer_users` (`user_id`),
  KEY `user_customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- dump ตาราง `user_customer`
-- 

INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (4, 12, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (5, 13, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (6, 14, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (7, 15, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (8, 16, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (9, 17, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (10, 18, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (11, 19, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (12, 20, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (13, 21, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (14, 22, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (15, 23, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (16, 24, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (17, 25, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (18, 26, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (19, 27, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (20, 28, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (21, 29, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (22, 30, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (23, 31, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (24, 32, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (25, 33, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (26, 34, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (27, 35, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (28, 36, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (29, 37, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (30, 38, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (31, 39, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (32, 40, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (33, 41, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (34, 42, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (35, 43, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (36, 44, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (37, 45, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (38, 46, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (39, 47, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (40, 48, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (41, 49, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (42, 50, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (43, 51, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (44, 52, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (45, 53, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (46, 54, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (47, 55, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (48, 56, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (49, 57, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (50, 58, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (51, 59, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (52, 60, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (53, 61, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (54, 62, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (55, 63, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (56, 64, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (57, 65, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (58, 66, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (59, 67, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (60, 68, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (61, 69, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (62, 70, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (63, 71, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (64, 72, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (65, 73, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (66, 74, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (67, 75, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (68, 76, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (69, 77, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (70, 78, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (71, 79, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (72, 80, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (73, 81, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (74, 82, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (75, 83, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (76, 84, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (77, 85, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (78, 86, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (79, 87, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (80, 88, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (81, 89, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (82, 90, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (83, 91, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (84, 92, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (85, 93, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (86, 94, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (86, 95, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (87, 96, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (87, 97, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (88, 98, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (88, 99, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (89, 100, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (90, 101, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (91, 102, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (92, 103, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (93, 104, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (94, 105, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (94, 106, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (95, 107, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (95, 108, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (96, 109, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (97, 110, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (98, 111, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (99, 112, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (100, 113, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (101, 114, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (102, 115, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (103, 116, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (104, 117, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (105, 118, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (106, 119, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (107, 120, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (108, 121, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (109, 122, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (110, 123, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (111, 124, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (112, 125, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (113, 126, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (114, 127, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (115, 128, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (116, 129, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (117, 130, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (118, 131, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (119, 132, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (120, 133, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (121, 134, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (122, 135, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (123, 136, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (124, 137, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (125, 138, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (126, 139, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (127, 140, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (128, 141, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (129, 142, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (130, 143, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (131, 144, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (132, 145, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (133, 146, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (134, 147, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (135, 148, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (136, 149, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (137, 150, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (138, 151, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (139, 152, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (140, 153, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (141, 154, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (142, 155, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (143, 156, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (144, 157, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (145, 158, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (146, 159, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (147, 160, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (148, 161, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (149, 162, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (150, 163, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (151, 164, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (152, 165, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (153, 166, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (154, 167, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (155, 168, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (156, 169, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (157, 170, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (158, 171, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (159, 172, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (160, 173, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (161, 174, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (161, 175, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (162, 176, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (162, 177, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (163, 178, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (164, 179, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (165, 180, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (166, 181, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (167, 182, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (168, 183, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (169, 184, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (170, 185, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (171, 186, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (172, 187, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (173, 188, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (174, 189, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (175, 190, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (176, 191, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (177, 192, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (178, 193, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (179, 194, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (180, 195, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (181, 196, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (182, 197, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (183, 198, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (184, 199, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (185, 200, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (186, 201, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (187, 202, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (188, 203, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (188, 204, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (189, 205, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (190, 206, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (190, 207, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (191, 208, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (192, 209, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (193, 210, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (194, 211, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (195, 212, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (196, 213, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (197, 214, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (198, 215, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (199, 216, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (200, 217, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (201, 218, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (202, 219, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (203, 220, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (204, 221, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (205, 222, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (206, 223, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (207, 224, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (208, 225, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (209, 226, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (210, 227, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (211, 228, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (212, 229, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (212, 230, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (213, 231, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (214, 232, 'OWNER');
INSERT INTO `user_customer` (`user_id`, `customer_id`, `role`) VALUES (215, 233, 'OWNER');

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `user_logs`
-- 

DROP TABLE IF EXISTS `user_logs`;
CREATE TABLE IF NOT EXISTS `user_logs` (
  `updated` timestamp NULL default CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `category` varchar(45) default NULL,
  `msg` varchar(500) default NULL,
  KEY `logs_user` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='log user activity';

-- 
-- dump ตาราง `user_logs`
-- 

INSERT INTO `user_logs` (`updated`, `user_id`, `category`, `msg`) VALUES ('2011-09-01 22:17:34', 1, 'DELETE_PRODUCT', 'product id 33 deleted by user 1');
INSERT INTO `user_logs` (`updated`, `user_id`, `category`, `msg`) VALUES ('2011-09-01 22:50:52', 1, 'PRODUCT_UPDATE', 'product id 38 created by user 1');
INSERT INTO `user_logs` (`updated`, `user_id`, `category`, `msg`) VALUES ('2011-09-01 22:51:29', 1, 'PRODUCT_UPDATE', 'product id 37 deleted by user 1');
INSERT INTO `user_logs` (`updated`, `user_id`, `category`, `msg`) VALUES ('2011-09-01 22:51:36', 1, 'PRODUCT_UPDATE', 'product id 38 deleted by user 1');
INSERT INTO `user_logs` (`updated`, `user_id`, `category`, `msg`) VALUES ('2011-09-01 22:51:43', 1, 'PRODUCT_UPDATE', 'product id 36 deleted by user 1');
INSERT INTO `user_logs` (`updated`, `user_id`, `category`, `msg`) VALUES ('2011-09-01 23:38:52', 1, 'PRODUCT_UPDATE', 'product id 1 updated by user 1');

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `user_pin`
-- 

DROP TABLE IF EXISTS `user_pin`;
CREATE TABLE IF NOT EXISTS `user_pin` (
  `id` bigint(20) NOT NULL auto_increment,
  `user_id` bigint(20) NOT NULL,
  `pin` varchar(4) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `pin` (`pin`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- dump ตาราง `user_pin`
-- 

INSERT INTO `user_pin` (`id`, `user_id`, `pin`) VALUES (1, 12, '0123');
INSERT INTO `user_pin` (`id`, `user_id`, `pin`) VALUES (2, 1, '8888');
