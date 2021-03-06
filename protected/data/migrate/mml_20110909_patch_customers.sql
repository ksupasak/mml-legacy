# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     mml
# Server version:               5.1.48-community
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2011-09-09 08:15:42
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping structure for table mml.customers
DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `account_name` varchar(500) DEFAULT NULL,
  `billing_address` varchar(45) DEFAULT NULL,
  `clinician_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_hospital` (`hospital_id`),
  CONSTRAINT `customer_hospital` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table mml.customers: 343 rows
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`id`, `hospital_id`, `account_name`, `billing_address`, `clinician_id`) VALUES (12, 3, 'Some account', '112 ถ.ราชวิถี', 4), (13, 4, 'ดร.ทวีศักดิ์ มหชวโรจน์  @ รพ.กรุงเทพคริสเตียน ', NULL, 5), (14, 5, 'พล.ร.ต.นพ.สุรเชษฐ สู่พานิช  @ รพ.กรุงธน ', NULL, 6), (15, 6, 'นพ.ไศล สุขพันธ์โพธาราม  @ รพ.กรุงธน2 ', NULL, 7), (16, 7, 'นพ.สุวัฒน์ วิทยาคม  @ รพ.กรุณาพิทักษ์ ', NULL, 8), (17, 8, 'คุณพูลชัย ชเนศร์  @ รพ.กล้วยน้ำไท ', NULL, 9), (18, 9, 'นพ.ฐิติ พัฒนกำจร  @ รพ.เกษมราษฎร์สุขาภิบาล3 ', NULL, 10), (19, 10, 'นพ.สุวิทย์ โฆษิตสุรังคกุล  @ รพ.เกษมราษฎร์ บางแค ', NULL, 11), (20, 11, 'นพ.ธวัชชัย วานิชกร  @ รพ.เกษมราษฎร์ ประชาชื่น ', NULL, 12), (21, 12, 'นพ.ชัยพฤกษ์ ปิยะเกศิน  @ รพ.คามิลเลียน ', NULL, 13), (22, 13, 'นพ.นพรัตน์ สุจริตจันทร์  @ รพ.จักษุ รัตนิน ', NULL, 14), (23, 14, 'นพ.จงเจตน์ อาวเจนพงษ์  @ รพ.เจตนิน ', NULL, 15), (24, 15, 'นพ.จำเริญ สรพิพัฒน์  @ รพ.เจ้าพระยา ', NULL, 16), (25, 16, 'นพ.สุชัย หยองอนุกูล์  @ รพ.เซนต์คาร์ลอส ', NULL, 17), (26, 17, 'ศ.นพ.จิตร สิทธิอมร  @ รพ.เซนต์หลุยส์ ', NULL, 18), (27, 18, 'พญ.ลักษมี ว่องกุศลกิจ  @ รพ.เซ็นทรัลเยนเนอรัล ', NULL, 19), (28, 19, 'นพ.สราวุธ อนันต์เศรษฐกุล  @ รพ.เดชา ', NULL, 20), (29, 20, 'นพ.ศุภชัย โชติบุตร  @ รพ.ตา หู คอ จมูก ', NULL, 21), (30, 21, 'ศ.นพ.เทพ หิมะทองคำ  @ รพ.เทพธารินทร์ ', NULL, 22), (31, 22, 'นพ.เจริญ มีนสุข  @ รพ.ไทยนครินทร์ ', NULL, 23), (32, 23, 'คุณเฉลิมกุล อภิกุลโอภาส  @ รพ.ธนบุรี ', NULL, 24), (33, 24, 'นพ.วิโรจน์ ตระการวิจิตร  @ รพ.นครธน ', NULL, 25), (34, 25, 'นพ.ประจักษ์ บุญจิตต์พิมล  @ รพ.นวมินทร์ ', NULL, 26), (35, 26, 'นพ.อรรคพาสน์ โอวาทตระกูล  @ รพ.นวมินทร์ 9 ', NULL, 27), (36, 27, 'พญ..เจรียง จันทรกมล  @ รพ.บางกอก 9 อินเตอร์เนชั่นแนล ', NULL, 28), (37, 28, 'พญ.ลินดา ไกรวิทย์  @ รพ.บางกอกเนอสซิ่งโฮม ', NULL, 29), (38, 29, 'นพ.ชุตินันท์ พรมมินทร์  @ รพ.บางนา ', NULL, 30), (39, 30, 'นพ.วีระ อิงคภาสกร  @ รพ.บางปะกอก 1 ', NULL, 31), (40, 31, 'นพ.มานิตย์ จารุวรรณ  @ รพ.บางปะกอก 2 บางบอน ', NULL, 32), (41, 32, 'พญ.ศศิธร พงษ์สามารถ  @ รพ.บางไผ่ ', NULL, 33), (42, 33, 'นพ.เกตุ สายเพชร์  @ รพ.บางโพ ', NULL, 34), (43, 34, 'นพ.สุรสิทธิ์ อัศดามงคล  @ รพ.บางมด ', NULL, 35), (44, 35, 'คุณแม็ค แบนเนอร์  @ รพ.บำรุงราษฎร์ ', NULL, 36), (45, 36, 'รออ.นพ.พิทักษ์ ฐานบัญชา  @ รพ.บีแคร์ ', NULL, 37), (46, 37, '   @ รพ.ปิยะเวท ', NULL, 38), (47, 38, 'นพ.พิชัย แพร่ภัทร  @ รพ.เปาโล เมโมเรียล ', NULL, 39), (48, 39, 'นพ.นพรัตน์ โง้วจุงดี  @ รพ.เปาโล เมโมเรียล โชคชัย 4 ', NULL, 40), (49, 40, 'คุณไกรวิน ศรีไกรวิน  @ รพ.พญาไท 1 ', NULL, 41), (50, 41, 'คุณธนา ถิรมนัส  @ รพ.พญาไท 2 ', NULL, 42), (51, 42, 'นพ.อนันตศักดิ์ อภัยรัตน์  @ รพ.พญาไท 3 ', NULL, 43), (52, 43, 'นพ.ปรีชา เลิศศิวาพร  @ รพ.พระราม 2 ', NULL, 44), (53, 44, 'นพ.เสถียร ภู่ประเสริฐ  @ รพ.พระรามเก้า ', NULL, 45), (54, 45, 'นพ.พิชิต ยิ่งเจริญ  @ รพ.เพชรเกษม-บางแค ', NULL, 46), (55, 46, 'นพ.ชนะ ตันจันทร์พงษ์  @ รพ.เพชรเวช ', NULL, 47), (56, 47, 'นพ.สวัสดิ์ เถกิงเดช  @ รพ.แพทย์ปัญญา ', NULL, 48), (57, 48, 'นพ.เหรียญทอง แน่นหนา  @ รพ.มงกุฎวัฒนะ ', NULL, 49), (58, 49, 'นพ.ชูเกียรติ ศุภนันตฤกษ์  @ รพ.มเหสักข์ ', NULL, 50), (59, 50, 'คุณสมชัย ชื่นจิตร  @ รพ.มิชชั่น ', NULL, 51), (60, 51, 'นพ.ภาวิต ปุญญฤทธ์  @ รพ.เมโย ', NULL, 52), (61, 52, 'นพ. เกริกยศ ชลายนเดชะ  @ รพ.ยันฮี ', NULL, 53), (62, 53, 'นพ.ธวัชชัย เจริญวงศ์  @ รพ.เยาวรักษ์ ', NULL, 54), (63, 54, 'ทพ.เจิมพล ภูมิตระกูล  @ รพ.รามคำแหง ', NULL, 55), (64, 55, 'คุณนิตยา ปรีชายุทธ  @ รพ.ราษฎร์บูรณะ ', NULL, 56), (65, 56, 'นพ.วรพงศ์ จูตะวิริยะ  @ รพ.ลาดพร้าว ', NULL, 57), (66, 57, 'พล.ท.นพ.ณรงค์ รอดวรรณะ  @ รพ.วิชัยยุทธ ', NULL, 58), (67, 58, 'พล.ท.นพ.พร้อมพงษ์ พีระบูล  @ รพ.วิภาวดี ', NULL, 59), (68, 59, 'นพ.ไพบูลย์ เอกแสงศรี  @ รพ.วิภาราม ', NULL, 60), (69, 60, 'ร.อ.ชาคริต ศึกษากิจ  @ รพ.เวชธานี ', NULL, 61), (70, 61, 'นพ.ถนอมชัย คู่ทวีธรรม  @ รพ.ศรีวิชัย 1 ', NULL, 62), (71, 62, 'นพ.สุรพล โล่สิริวัฒน์  @ รพ.ศรีวิชัย 2 ', NULL, 63), (72, 63, 'นพ.นิพนธ์ ธีราโมก  @ รพ.เปาโลเมโมเรียล นวมินทร์ ', NULL, 64), (73, 64, 'นพ.ธงชัย ฉัตรยิ่งมงคล  @ รพ.ศิครินทร์ ', NULL, 65), (74, 65, 'นพ.เทอดศักดิ์ ปรมากูล  @ รพ.ศูนย์มะเร็งกรุงเทพฯ ', NULL, 66), (75, 66, 'นพ.โชคชัย จารุศิริพิพัฒน์  @ รพ.สมิติเวช สุขุมวิท ', NULL, 67), (76, 67, 'นพ.ดุลย์ ดำรงศักดิ์  @ รพ.สมิติเวชศรีนครินทร์ ', NULL, 68), (77, 68, 'น.ท.พญ.ลักษมี ว่องกุศลกิจ  @ รพ.สายไหม ', NULL, 69), (78, 69, 'นพ.ศิริพงษ์ เหลืองวารินกุล  @ รพ.สินแพทย์ ', NULL, 70), (79, 70, 'นพ.ดาวิน นารูลา  @ รพ.สุขุมวิท ', NULL, 71), (80, 71, 'นพ.พรชัย ตั้งลัคนวาณิชย์  @ รพ.หัวเฉียว ', NULL, 72), (81, 72, 'นพ.ไกรสิทธิ์ นฤขัตพิชัย  @ รพ.มนารมย์ ', NULL, 73), (82, 73, 'นพ.ตุลวรรธน์ พัชราภา  @ รพ.เกษมราษฎร์รัตนาธิฯ ', NULL, 74), (83, 74, 'คุณกมลวรรณ ลักษณะกาญจน์  @ รพ.แม่น้ำ ', NULL, 75), (84, 75, 'นพ.พรมพันธ์ พรมมาส  @ รพ.นนทเวช ', NULL, 76), (85, 76, 'นพ.อนันต์ ธรรมจำรัสศรี  @ รพ.อนันต์พัฒนา 2 ', NULL, 77), (86, 77, 'นพ.สุชัย หยองอนุกูล  @ รพ.กรุงสยามเซนต์คาร์ลอส ', NULL, 78), (87, 78, 'นพ.กฤชรัตน์ ตระกูลช่าง  @ รพ.แพทย์รังสิต ', NULL, 79), (88, 79, 'คุณพูนศักดิ์ จรูญศิริ  @ รพ.ภัทร-ธนบุรี ', NULL, 80), (89, 80, 'นพ.สุนทร อันตรเสน  @ รพ.เอกปทุม ', NULL, 81), (90, 81, 'นพ.ส่งเสริม พานิชาภรณ์  @ รพ.นวนครการแพทย์ ', NULL, 82), (91, 82, 'นพ.สุธีร์ สทุมถิระ  @ รพ.ปทุมเวช ', NULL, 83), (92, 83, 'นพ.บุญชัย อิศราพิสิษฐ์  @ รพ.ราชธานี ', NULL, 84), (93, 84, 'คุณวิโรจน์ อภิสิทธิ์วิทยา  @ รพ.ศุภมิตรเสนา ', NULL, 85), (94, 85, 'นพ.ณรงค์ฤทธิ์ ฮาวรังษี  @ รพ.กรุงเทพพระประแดง ', NULL, 86), (95, 211, 'นพ.ณรงค์ฤทธิ์ ฮาวรังษี  @ รพ.กรุงเทพหาดใหญ่ ', NULL, 86), (96, 86, 'นพ.กำพล พลัสสินทร์  @ รพ.จุฬารัตน์ ', NULL, 87), (97, 87, 'นพ.กำพล พลัสสินทร์  @ รพ.จุฬารัตน์ 3 ', NULL, 87), (98, 86, 'นพ.กำพล พลัสสินทร์  @ รพ.จุฬารัตน์ ', NULL, 88), (99, 87, 'นพ.กำพล พลัสสินทร์  @ รพ.จุฬารัตน์ 3 ', NULL, 88), (100, 88, 'นพ.ยุทธนา สงวนศักดิ์โกศล  @ รพ.จุฬารัตน์ 9 ', NULL, 89), (101, 89, 'นพ.ภาสกร รักษ์กุล  @ รพ.ชัยปราการ ', NULL, 90), (102, 90, 'นพ.อนันต์ อธิพันธุ์อำไพ  @ รพ.เซ็นทรัลปาร์ค ', NULL, 91), (103, 91, 'นพ.นิคม ศิริชัย  @ รพ.บางปะกอก 3 ', NULL, 92), (104, 92, 'นพ.ต่อพงศ์ อัศวิษณุ  @ รพ.ปิยะมินทร์ ', NULL, 93), (105, 93, 'นพ.พิพัฒน์ พงศ์รัตนามาน  @ รพ.เมืองสมุทร ', NULL, 94), (106, 94, 'นพ.พิพัฒน์ พงศ์รัตนามาน  @ รพ.เมืองสมุทรปู่เจ้าฯ ', NULL, 94), (107, 93, 'นพ.พิพัฒน์ พงศ์รัตนามาน  @ รพ.เมืองสมุทร ', NULL, 95), (108, 94, 'นพ.พิพัฒน์ พงศ์รัตนามาน  @ รพ.เมืองสมุทรปู่เจ้าฯ ', NULL, 95), (109, 95, 'คุณธนวัฒน์ ทวีชัยถาวร  @ รพ.รวมชัยประชารักษ์ ', NULL, 96), (110, 96, 'นพ.เขตโสภณ จัตวัฒนกุล  @ รพ.รัทรินทร์ ', NULL, 97), (111, 97, 'นพ.โอภาส สินเพิ่มสุขสกุล  @ รพ.เปาโลเมโมเรียล สมุทรปราการ ', NULL, 98), (112, 98, 'นพ.ศิริพงษ์ วิทยเลิศปัญญา  @ รพ.สำโรงการแพทย์ ', NULL, 99), (113, 99, 'นพ.สุเทพ วัตถุศิลป์  @ รพ.รวมแพทย์ ชัยนาท ', NULL, 100), (114, 100, 'นพ.พงษ์เทพ เลิศสุวรรณสิทธิ์  @ รพ.สุวรรณเวช ', NULL, 101), (115, 101, 'นพ.วราศักดิ์ ไกรฤกษ์  @ รพ.เบญจรมย์ ', NULL, 102), (116, 102, 'พญ.วรินทร อัศวนิก  @ รพ.เมืองนารายณ์ ', NULL, 103), (117, 103, 'นพ.สมเจษฎ์ ไกรโรจนานันท์  @ รพ.เกษมราษฎร์ สระบุรี ', NULL, 104), (118, 104, 'นพ.พนม สนิทประชากร  @ รพ.มิตรภาพ เมโมเรียล ', NULL, 105), (119, 105, 'คุณไชยวัฒน์ วีระสมบัติ  @ รพ.คริสเตียนไชยวัฒน์ ', NULL, 106), (120, 106, 'นพ.ประเจิด สุรีย์จามร  @ รพ.สิงห์บุรีเวชการ ', NULL, 107), (121, 107, 'นพ.วิวัฒน์ กิตติวัฒนโชติ  @ รพ.ธนบุรี-อู่ทอง ', NULL, 108), (122, 108, 'นพ.สำเริง ศรีผุดผ่อง  @ รพ.หมอสำเริง ', NULL, 109), (123, 109, 'นพ.บุญชัย บุญแสง  @ รพ.พรชัย ', NULL, 110), (124, 110, 'นพ.เมธ โชคชัยชาญ  @ รพ.ศุภมิตร ', NULL, 111), (125, 111, 'นพ.ทรงกิจ สุทธิกาญจน์  @ รพ.ปิยราษฎร์ ', NULL, 112), (126, 112, 'นพ.จารุวัฑ ใช้ความเพียร  @ รพ.กรุงเทพจันทบุรี ', NULL, 113), (127, 113, 'นพ.กำธร ศิริธัญญาลักษณ์  @ รพ.สิริเวช ', NULL, 114), (128, 114, 'พญ.ชุติมา ปิ่นเจริญ  @ รพ.จุฬารัตน์ 11 ', NULL, 115), (129, 115, 'นพ.การุณ พุทธภาวนา  @ รพ.โสธราเวช ', NULL, 116), (130, 116, 'นพ.พิชิต กังวลกิจ  @ รพ.กรุงเทพพัทยา ', NULL, 117), (131, 117, 'พญ.วิมล สุรินทราบูรณ์  @ รพ.ชลเวช ', NULL, 118), (132, 118, 'นพ.ธนาคม แมนธนานนท์  @ รพ.พญาไทศรีราชา ', NULL, 119), (133, 119, 'นพ.สมเกียรติ ธนไพศาลพิพัฒน์  @ รพ.พัทยาเมโมเรียล ', NULL, 120), (134, 120, 'คุณอุไรวรรณ เทพนมรัตน์  @ รพ.พัทยาอินเตอร์ ', NULL, 121), (135, 121, 'นพ.ชัยรัตน์ ปัณฑุรอัมพร  @ รพ.สมิติเวช ศรีราชา ', NULL, 122), (136, 122, 'ผศ.รังสรรค์ สุฉันทบุตร  @ รพ.แหลมฉบังอินเตอร์ ', NULL, 123), (137, 123, 'นพ.จรัล ใจแพทย์  @ รพ.เอกชล ', NULL, 124), (138, 124, 'นพ.สานิตย์ ชากฤษณ์  @ รพ.เอกชล 2 ', NULL, 125), (139, 125, 'พญ.สุดจิต ลิขสิทธิ์ศุภการ  @ รพ.กรุงเทพตราด ', NULL, 126), (140, 126, 'นพ.นิยม สลิสอำไพ  @ รพ.มงกุฎ ระยอง ', NULL, 127), (141, 127, 'นพ.กริช สัตยบุตร  @ รพ.รวมแพทย์ระยอง ', NULL, 128), (142, 128, 'นพ.วิโรจน์ ดิเรกสถาพร  @ รพ.กรุงเทพคริสเตียน ', NULL, 129), (143, 129, 'นพ.วรวิทย์ วัชโรทยางกูร  @ รพ.เทพากร ', NULL, 130), (144, 130, 'นพ.จรัสพงษ์ ทังสุบุตร  @ รพ.ศาลายา ', NULL, 131), (145, 131, 'นพ.ทรงชัย ศรีโรจนกุล  @ รพ.สนามจันทร์ ', NULL, 132), (146, 132, 'นพ.เอกลาภ ทองบริสุทธิ์  @ รพ.ซาน เปา โล หัวหิน ', NULL, 133), (147, 133, 'ภญ.รพีพร กิตติวงศ์โสภณ  @ รพ.เมืองเพชร-ธนบุรี ', NULL, 134), (148, 134, 'นพ.สัมฤทธิ์ สินธัญญาธรรม  @ รพ.เพชรรัชต์ ', NULL, 135), (149, 135, 'คุณจิรวัฒน์ สุจิรานุธรรม  @ รพ.ซานคามิลโล ', NULL, 136), (150, 136, 'นพ.ประสงค์ ประภาวงศ์  @ รพ.พร้อมแพทย์ ', NULL, 137), (151, 137, 'นพ.กมิล ปั้นประสงค์  @ รพ.เมืองราช ', NULL, 138), (152, 138, 'พญ.สุวรรณา ชูพิศาลยโรจน์  @ รพ.แม่กลอง 2 ', NULL, 139), (153, 139, 'นพ.อิทธิ ฉันศิริกาญจน  @ รพ.มหาชัย ', NULL, 140), (154, 140, 'พญ.ดาวัลย์ อนุวุฒินาวิน  @ รพ.มหาชัย 2 ', NULL, 141), (155, 141, 'นพ.พงษ์ศักดิ์ วัฒนา  @ รพ.ศรีวิชัย 3 ', NULL, 142), (156, 142, 'พญ.สายสุนี วรรณดุรงค์วรรณ  @ รพ.ศรีวิชัย 5 ', NULL, 143), (157, 143, 'นพ.เกรียงไกร จีระแพทย์  @ รพ.เอกชัย ', NULL, 144), (158, 144, 'นพ.โกวิท คำพิทักษ์  @ รพ.บัวใหญ่รวมแพทย์ ', NULL, 145), (159, 145, 'นพ.ประณีต สงวนตระกูล  @ รพ.ป.แพทย์ ', NULL, 146), (160, 146, 'นพ.ธนรัชต์ สมุทรเพชร  @ รพ.กรุงเทพราชสีมา ', NULL, 147), (161, 147, 'นพ.บรรพต พึ่งชัยพัฒน์  @ รพ.เซ็นต์เมรี่ ', NULL, 148), (162, 148, 'นพ.วรพงษ์ ศักดิ์ศิรินุกูล  @ รพ.เอกชนบุรีรัมย์ ', NULL, 149), (163, 149, 'นพ.อิสระ อริยะชัยพาณิชย์  @ รพ.รวมแพทย์สุรินทร์(หมออนันต์) ', NULL, 150), (164, 150, 'นพ.ธีรวัฒน์ ร่มไทรทอง  @ รพ.ธีรวัฒน์ ', NULL, 151), (165, 151, 'นพ.สมชาย กิตติพงษ์หรรษา  @ รพ.ขอนแก่นราม ', NULL, 152), (166, 152, 'นพ.ธีระวัฒน์ ศรีนัครินทร์  @ รพ.ราชพฤกษ์ ', NULL, 153), (167, 153, 'คุณอนัญพร พูลนิติพร  @ รพ.เวชประสิทธิ์ ', NULL, 154), (168, 154, 'นพ.บุญชัย จิตตนาสวัสดิ์  @ รพ.เมืองเลยราม ', NULL, 155), (169, 155, 'คุณสมคิด ปิยะธรรมวุฒิกุล  @ รพ.รักษ์สกล ', NULL, 156), (170, 156, 'พญ.ศุภวรรณ ตั้งสืบกุล  @ รพ.นอร์ทอีสเทร์น-วัฒนา ', NULL, 157), (171, 157, 'นพ.ปัญญา อยู่ประเสริฐ  @ รพ.ปัญญาเวช ', NULL, 158), (172, 158, 'คุณวิเชียร ชมดง  @ รพ.เอกอุดร ', NULL, 159), (173, 159, 'นพ.ธีระยุทธ นิยากูล  @ รพ.มุกดาหารอินเตอร์ ', NULL, 160), (174, 160, 'นพ.หาญ สุฉันทบุตร  @ รพ.นายแพทย์หาญ ', NULL, 161), (175, 161, 'นพ.หาญ สุฉันทบุตร  @ รพ.ยโสธรรวมแพทย์ ', NULL, 161), (176, 160, 'นพ.หาญ สุฉันทบุตร  @ รพ.นายแพทย์หาญ ', NULL, 162), (177, 161, 'นพ.หาญ สุฉันทบุตร  @ รพ.ยโสธรรวมแพทย์ ', NULL, 162), (178, 162, 'พญ.กฤษณา โฆษิตจิรนันท์  @ รพ.กรุงเทพจุรีเวช ', NULL, 163), (179, 163, 'ภก.สมพร จึงศิรกุลวิทย์  @ รพ.ประชารักษ์ ', NULL, 164), (180, 164, 'นพ.สุรชัย สุพันธมาตย์  @ รพ.อุบลรักษ์ ธนบุรี ', NULL, 165), (181, 165, 'นพ.นภดล ลุประสงค์  @ รพ.แพทย์บัณฑิต ', NULL, 166), (182, 166, 'นพ.กิตติ ตั้งบรรเจิดสุข  @ รพ.รวมแพทย์ นครสวรรค์ ', NULL, 167), (183, 167, 'นพ.ชวลิต วิมลเฉลา  @ รพ.ศรีสวรรค์ ', NULL, 168), (184, 168, 'นพ.วิสิทธิ์ อวิรุทธ์นันท์  @ รพ.ปากน้ำโพ ', NULL, 169), (185, 169, 'นพ.พรชัย สัตยาประเสริฐ  @ รพ.ร่มฉัตร ', NULL, 170), (186, 170, 'พญ.สุรางค์รัตน์ วรรธนภูติ  @ รพ.รัตนเวช นครสวรรค์ ', NULL, 171), (187, 171, 'นพ.สุชาติ กุละพัฒน์  @ รพ.พัฒนเวชสุโขทัย ', NULL, 172), (188, 172, 'นพ.พจนารถ จันทโรจวงศ์  @ รพ.รวมแพทย์สุโขทัย ', NULL, 173), (189, 173, 'คุณบุญเลิศ คำนึงสิทธิ  @ รพ.ตะพานหินรวมแพทย์ ', NULL, 174), (190, 174, 'นพ.เสริมสุข เหลาหชัยอรุณ  @ รพ.สหเวชพิจิตร ', NULL, 175), (191, 175, 'นพ.สุเทพ นิ่มพิทักษ์พงศ์  @ รพ.พิษณุเวช ', NULL, 176), (192, 176, 'นพ.พีระเชษฐ์ ภู่เกียรติ  @ รพ.รวมแพทย์ พิษณุโลก ', NULL, 177), (193, 177, 'นพ.อุดม วาริทนันท์  @ รพ.รัตนเวช พิษณุโลก ', NULL, 178), (194, 178, 'นพ.ยงยศ จริยวิทยาวัฒน์  @ รพ.อินเตอร์เวชการ ', NULL, 179), (195, 179, 'นพ.พิเชษฐ์ อิศวสัมฤทธิ์  @ รพ.นครหล่ม ', NULL, 180), (196, 180, 'ทพ.ประจวบ จันทรคิด  @ รพ.เพชรรัตน์ ', NULL, 181), (197, 181, 'นพ.สถาปน์ ชินวงศ์  @ รพ.แพร่คริสเตียน ', NULL, 182), (198, 182, 'นพ.วรชัย วงศ์วรกุล  @ รพ.แพร่-ราม ', NULL, 183), (199, 183, 'นพ.สมชัย ตั้งพร้อมพันธ์  @ รพ.เกษมราษฎร์ศรีบุรินทร์ ', NULL, 184), (200, 184, 'นพ.วิฑูรย์ ยงเมธาวุฒิ  @ รพ.โอเวอร์บรุ๊ค ', NULL, 185), (201, 185, 'นพ.อำนวย ชิงชยานุรักษ์  @ รพ.ช้างเผือก ', NULL, 186), (202, 186, 'นพ.ศยาม เวศกิจกุล  @ รพ.เชียงใหม่ใกล้หมอ ', NULL, 187), (203, 187, 'นพ.วรพันธ์ อุณจักร  @ รพ.เชียงใหม่ราม ', NULL, 188), (204, 189, 'นพ.วรพันธ์ อุณจักร  @ รพ.เทพปัญญา ', NULL, 188), (205, 188, 'คุณวรัญญา เลี้ยงลักษณ์เลิศ  @ รพ.เซ็นทรัลเชียงใหม่ ', NULL, 189), (206, 187, 'นพ.วรพันธ์ อุณจักร  @ รพ.เชียงใหม่ราม ', NULL, 190), (207, 189, 'นพ.วรพันธ์ อุณจักร  @ รพ.เทพปัญญา ', NULL, 190), (208, 190, 'tนพ.อดุล วรินทรเวช  @ รพ.แมคคอร์มิค ', NULL, 191), (209, 191, 'นพ.สมชาย อบบุญ  @ รพ.แมคเคน ', NULL, 192), (210, 192, 'นพ.สุมิน พฤกษิกานนท์  @ รพ.รวมแพทย์ เชียงใหม่ ', NULL, 193), (211, 193, 'ศ.นพ.ชาลี พรพัฒน์กุล  @ รพ.ราชเวชเชียงใหม่ ', NULL, 194), (212, 194, 'นพ.ดุสิต ศรีสกุล  @ รพ.ลานนา ', NULL, 195), (213, 195, 'นพ.ฐานิสร์ กาญจนรัตนากร  @ รพ.พะเยาราม ', NULL, 196), (214, 196, 'นพ.บุญจง ชูชัยแสงรัตน์  @ รพ.เขลางค์ ', NULL, 197), (215, 197, 'นพ.วัชระ สนธิชัย  @ รพ.หริภุญชัยเมโมเรียล ', NULL, 198), (216, 198, 'นพ.ประสิทธิ์ วิรัชสุขสมบัติ  @ รพ.วิรัชศิลป์ ', NULL, 199), (217, 199, 'นพ.ปรีชา มิตรกูล  @ รพ.นครคริสเตียน ', NULL, 200), (218, 200, 'นพ.พรชัย ลีานิพนธ์  @ รพ.นครพัฒน์ ', NULL, 201), (219, 201, 'นพ.วิเชียร วิชานศวกุล  @ รพ.นครินทร์ ', NULL, 202), (220, 202, 'พญ.กษมาพร เที่ยงธรรม  @ รพ.รวมแพทย์ทุ่งสง ', NULL, 203), (221, 203, 'นพ.ก้องเกียรติ เกษเพ็ชร  @ รพ.กรุงเทพภูเก็ต ', NULL, 204), (222, 204, 'นพ.อนุโรจน์ ธารสิริโรจน์  @ รพ.สิริโรจน์ ', NULL, 205), (223, 205, 'นพ.บรรจบ มานะกุล  @ รพ.ทักษิณ ', NULL, 206), (224, 206, 'คุณกริชพงศ์ เค้าอุทัย  @ รพ.ไทยอินเตอร์เนชั่นแนล ', NULL, 207), (225, 207, 'นพ.ชุมโชค จันทร์วิเมลือง  @ รพ.บ้านดอนอินเตอร์ เกาะสมุย ', NULL, 208), (226, 208, 'นพ.สมชัย เจียรนัยศิลป์  @ รพ.ตรังรวมแพทย์ ', NULL, 209), (227, 209, 'นพ.วิศิษฐ์ อมรวิทยารักษ์  @ รพ.วัฒนแพทย์ตรัง ', NULL, 210), (228, 210, 'พญ.ศศินี โภคโต  @ รพ.รวมแพทย์พัทลุง ', NULL, 211), (229, 85, 'นพ.ณรงค์ฤทธิ์ ฮาวรังษี  @ รพ.กรุงเทพพระประแดง ', NULL, 212), (230, 211, 'นพ.ณรงค์ฤทธิ์ ฮาวรังษี  @ รพ.กรุงเทพหาดใหญ่ ', NULL, 212), (231, 212, 'นพ.จำลอง บ่อเกิด  @ รพ.มูลนิธิมิตรภาพสามัคคี ', NULL, 213), (232, 213, 'คุณปิยพล ศรียะพันธุ์  @ รพ.ราษฎร์ยินดี ', NULL, 214), (233, 214, 'นพ.อาคเนย์ สุขอยู่  @ รพ.ศิครินทร์หาดใหญ่ ', NULL, 215);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
