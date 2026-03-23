/*
 Navicat Premium Dump SQL

 Source Server         : zwx
 Source Server Type    : MySQL
 Source Server Version : 80043 (8.0.43)
 Source Host           : localhost:3306
 Source Schema         : ticket_booking

 Target Server Type    : MySQL
 Target Server Version : 80043 (8.0.43)
 File Encoding         : 65001

 Date: 20/09/2025 13:33:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for flights
-- ----------------------------
DROP TABLE IF EXISTS `flights`;
CREATE TABLE `flights`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `flight_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `airline` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `departure_city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `departure_airport` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `arrival_city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `arrival_airport` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `departure_time` datetime NOT NULL,
  `arrival_time` datetime NOT NULL,
  `duration` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `aircraft` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `economy_price` decimal(10, 2) NOT NULL,
  `business_price` decimal(10, 2) NULL DEFAULT NULL,
  `first_class_price` decimal(10, 2) NULL DEFAULT NULL,
  `seats_economy` int NOT NULL,
  `seats_business` int NULL DEFAULT NULL,
  `seats_first_class` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flights
-- ----------------------------
INSERT INTO `flights` VALUES (1, 'CA1234', '中国国际航空', '北京', '首都国际机场', '上海', '浦东国际机场', '2025-09-20 08:00:00', '2025-09-20 10:30:00', '2小时30分钟', '波音737', 680.00, 1500.00, 2800.00, 150, 30, 12);
INSERT INTO `flights` VALUES (2, 'MU5107', '东方航空', '北京', '首都国际机场', '上海', '浦东国际机场', '2025-09-20 10:45:00', '2025-09-20 13:00:00', '2小时15分钟', '空客A330', 720.00, 1600.00, 3000.00, 180, 40, 16);
INSERT INTO `flights` VALUES (3, 'CZ3101', '中国国际航空', '北京', '首都国际机场', '广州', '白云国际机场', '2025-09-20 09:00:00', '2025-09-20 12:00:00', '3小时0分钟', '波音787', 850.00, 2000.00, 3500.00, 200, 45, 15);
INSERT INTO `flights` VALUES (4, '3U8633', '东方航空', '上海', '浦东国际机场', '成都', '双流国际机场', '2025-09-20 11:00:00', '2025-09-20 14:30:00', '3小时30分钟', '空客A321', 900.00, 2200.00, 3800.00, 190, 40, 12);
INSERT INTO `flights` VALUES (5, 'CZ3456', '中国国际航空', '广州', '白云国际机场', '深圳', '宝安国际机场', '2025-09-20 13:30:00', '2025-09-20 14:45:00', '1小时15分钟', '波音737', 400.00, 1000.00, 1800.00, 160, 30, 10);
INSERT INTO `flights` VALUES (6, '3U8765', '海南航空', '成都', '双流国际机场', '杭州', '萧山国际机场', '2025-09-20 15:00:00', '2025-09-20 17:30:00', '2小时30分钟', '空客A320', 750.00, 1800.00, 3200.00, 180, 35, 10);
INSERT INTO `flights` VALUES (7, 'CA1301', '中国国际航空', '北京', '首都国际机场', '广州', '白云国际机场', '2025-09-20 07:30:00', '2025-09-20 10:45:00', '3小时15分钟', '波音777', 860.00, 2100.00, 3600.00, 220, 50, 18);
INSERT INTO `flights` VALUES (8, 'MU5305', '东方航空', '上海', '虹桥国际机场', '北京', '首都国际机场', '2025-09-20 08:15:00', '2025-09-20 10:50:00', '2小时35分钟', '空客A330', 750.00, 1700.00, 3100.00, 190, 45, 15);
INSERT INTO `flights` VALUES (9, 'CZ3531', '南方航空', '广州', '白云国际机场', '上海', '浦东国际机场', '2025-09-20 09:20:00', '2025-09-20 11:55:00', '2小时35分钟', '波音787', 800.00, 1900.00, 3300.00, 200, 48, 16);
INSERT INTO `flights` VALUES (10, 'HU7151', '海南航空', '深圳', '宝安国际机场', '北京', '首都国际机场', '2025-09-20 10:00:00', '2025-09-20 13:10:00', '3小时10分钟', '波音737', 880.00, 2000.00, 3500.00, 180, 40, 12);
INSERT INTO `flights` VALUES (11, 'CA1835', '中国国际航空', '北京', '首都国际机场', '杭州', '萧山国际机场', '2025-09-20 11:20:00', '2025-09-20 13:50:00', '2小时30分钟', '空客A320', 730.00, 1600.00, 2900.00, 170, 38, 10);
INSERT INTO `flights` VALUES (12, 'MU2451', '东方航空', '武汉', '天河国际机场', '上海', '虹桥国际机场', '2025-09-20 12:10:00', '2025-09-20 13:55:00', '1小时45分钟', '空客A321', 550.00, 1200.00, 2200.00, 160, 35, 8);
INSERT INTO `flights` VALUES (13, 'CZ3739', '南方航空', '广州', '白云国际机场', '成都', '双流国际机场', '2025-09-20 13:00:00', '2025-09-20 15:50:00', '2小时50分钟', '空客A330', 920.00, 2300.00, 4000.00, 210, 50, 18);
INSERT INTO `flights` VALUES (14, 'HU7387', '海南航空', '西安', '咸阳国际机场', '深圳', '宝安国际机场', '2025-09-20 14:15:00', '2025-09-20 17:05:00', '2小时50分钟', '波音737', 860.00, 2000.00, 3600.00, 180, 42, 12);
INSERT INTO `flights` VALUES (15, 'CA1551', '中国国际航空', '上海', '浦东国际机场', '哈尔滨', '太平国际机场', '2025-09-20 15:30:00', '2025-09-20 18:40:00', '3小时10分钟', '波音737', 950.00, 2200.00, 3900.00, 170, 40, 12);
INSERT INTO `flights` VALUES (16, 'MU5677', '东方航空', '杭州', '萧山国际机场', '广州', '白云国际机场', '2025-09-20 16:45:00', '2025-09-20 19:15:00', '2小时30分钟', '空客A320', 780.00, 1800.00, 3200.00, 180, 40, 10);
INSERT INTO `flights` VALUES (17, 'CA1633', '中国国际航空', '北京', '首都国际机场', '西安', '咸阳国际机场', '2025-09-21 07:00:00', '2025-09-21 09:40:00', '2小时40分钟', '波音737', 750.00, 1700.00, 3000.00, 180, 40, 12);
INSERT INTO `flights` VALUES (18, 'MU5135', '东方航空', '上海', '浦东国际机场', '广州', '白云国际机场', '2025-09-21 08:20:00', '2025-09-21 10:55:00', '2小时35分钟', '空客A330', 820.00, 1900.00, 3400.00, 200, 45, 16);
INSERT INTO `flights` VALUES (19, 'CZ3953', '南方航空', '深圳', '宝安国际机场', '上海', '虹桥国际机场', '2025-09-21 09:10:00', '2025-09-21 11:30:00', '2小时20分钟', '波音737', 760.00, 1800.00, 3200.00, 180, 40, 12);
INSERT INTO `flights` VALUES (20, 'HU7235', '海南航空', '成都', '双流国际机场', '北京', '首都国际机场', '2025-09-21 10:30:00', '2025-09-21 13:45:00', '3小时15分钟', '空客A330', 980.00, 2400.00, 4200.00, 210, 50, 18);
INSERT INTO `flights` VALUES (21, 'CA1751', '中国国际航空', '广州', '白云国际机场', '杭州', '萧山国际机场', '2025-09-21 11:15:00', '2025-09-21 13:35:00', '2小时20分钟', '空客A320', 790.00, 1800.00, 3200.00, 170, 38, 10);
INSERT INTO `flights` VALUES (22, 'MU2501', '东方航空', '南京', '禄口国际机场', '北京', '首都国际机场', '2025-09-21 12:40:00', '2025-09-21 14:50:00', '2小时10分钟', '波音737', 680.00, 1500.00, 2700.00, 160, 35, 10);
INSERT INTO `flights` VALUES (23, 'CZ3467', '南方航空', '武汉', '天河国际机场', '广州', '白云国际机场', '2025-09-21 13:20:00', '2025-09-21 15:00:00', '1小时40分钟', '空客A321', 520.00, 1100.00, 2000.00, 150, 30, 8);
INSERT INTO `flights` VALUES (24, 'HU7633', '海南航空', '重庆', '江北国际机场', '上海', '浦东国际机场', '2025-09-21 14:50:00', '2025-09-21 17:25:00', '2小时35分钟', '波音787', 850.00, 2000.00, 3500.00, 190, 45, 15);
INSERT INTO `flights` VALUES (25, 'CA1855', '中国国际航空', '杭州', '萧山国际机场', '西安', '咸阳国际机场', '2025-09-21 16:00:00', '2025-09-21 18:40:00', '2小时40分钟', '空客A320', 820.00, 1900.00, 3300.00, 170, 38, 10);
INSERT INTO `flights` VALUES (26, 'MU5737', '东方航空', '昆明', '长水国际机场', '广州', '白云国际机场', '2025-09-21 17:15:00', '2025-09-21 19:50:00', '2小时35分钟', '波音737', 880.00, 2100.00, 3700.00, 180, 42, 12);
INSERT INTO `flights` VALUES (27, 'CA1921', '中国国际航空', '北京', '首都国际机场', '重庆', '江北国际机场', '2025-09-22 07:20:00', '2025-09-22 10:15:00', '2小时55分钟', '波音737', 840.00, 2000.00, 3500.00, 180, 40, 12);
INSERT INTO `flights` VALUES (28, 'MU5501', '东方航空', '上海', '虹桥国际机场', '成都', '双流国际机场', '2025-09-22 08:30:00', '2025-09-22 11:45:00', '3小时15分钟', '空客A330', 950.00, 2300.00, 4000.00, 200, 48, 16);
INSERT INTO `flights` VALUES (29, 'CZ3191', '南方航空', '广州', '白云国际机场', '武汉', '天河国际机场', '2025-09-22 09:45:00', '2025-09-22 11:25:00', '1小时40分钟', '空客A321', 530.00, 1200.00, 2100.00, 160, 35, 8);
INSERT INTO `flights` VALUES (30, 'HU7051', '海南航空', '深圳', '宝安国际机场', '西安', '咸阳国际机场', '2025-09-22 10:50:00', '2025-09-22 13:30:00', '2小时40分钟', '波音737', 870.00, 2000.00, 3600.00, 170, 40, 12);
INSERT INTO `flights` VALUES (31, 'CA1431', '中国国际航空', '杭州', '萧山国际机场', '北京', '首都国际机场', '2025-09-22 11:30:00', '2025-09-22 13:55:00', '2小时25分钟', '空客A320', 740.00, 1600.00, 2900.00, 180, 40, 10);
INSERT INTO `flights` VALUES (32, 'MU2701', '东方航空', '西安', '咸阳国际机场', '上海', '虹桥国际机场', '2025-09-22 12:45:00', '2025-09-22 15:20:00', '2小时35分钟', '波音737', 810.00, 1900.00, 3300.00, 170, 38, 10);
INSERT INTO `flights` VALUES (33, 'CZ3653', '南方航空', '成都', '双流国际机场', '广州', '白云国际机场', '2025-09-22 13:50:00', '2025-09-22 16:30:00', '2小时40分钟', '空客A330', 930.00, 2200.00, 3900.00, 200, 45, 16);
INSERT INTO `flights` VALUES (34, 'HU7287', '海南航空', '北京', '首都国际机场', '昆明', '长水国际机场', '2025-09-22 14:30:00', '2025-09-22 17:50:00', '3小时20分钟', '波音787', 1020.00, 2500.00, 4400.00, 210, 50, 18);
INSERT INTO `flights` VALUES (35, 'CA1359', '中国国际航空', '上海', '浦东国际机场', '广州', '白云国际机场', '2025-09-22 15:45:00', '2025-09-22 18:20:00', '2小时35分钟', '空客A321', 800.00, 1800.00, 3200.00, 180, 42, 12);
INSERT INTO `flights` VALUES (36, 'MU5431', '东方航空', '广州', '白云国际机场', '南京', '禄口国际机场', '2025-09-22 16:50:00', '2025-09-22 19:05:00', '2小时15分钟', '波音737', 690.00, 1600.00, 2800.00, 160, 35, 10);
INSERT INTO `flights` VALUES (37, 'CA1521', '中国国际航空', '广州', '白云国际机场', '北京', '首都国际机场', '2025-09-23 07:10:00', '2025-09-23 10:20:00', '3小时10分钟', '波音777', 870.00, 2100.00, 3700.00, 220, 50, 18);
INSERT INTO `flights` VALUES (38, 'MU5119', '东方航空', '北京', '首都国际机场', '上海', '虹桥国际机场', '2025-09-23 08:00:00', '2025-09-23 10:30:00', '2小时30分钟', '空客A330', 740.00, 1600.00, 2900.00, 190, 45, 15);
INSERT INTO `flights` VALUES (39, 'CZ3553', '南方航空', '上海', '浦东国际机场', '深圳', '宝安国际机场', '2025-09-23 09:15:00', '2025-09-23 11:40:00', '2小时25分钟', '波音737', 780.00, 1800.00, 3200.00, 180, 40, 12);
INSERT INTO `flights` VALUES (40, 'HU7187', '海南航空', '成都', '双流国际机场', '上海', '浦东国际机场', '2025-09-23 10:25:00', '2025-09-23 13:40:00', '3小时15分钟', '空客A330', 960.00, 2300.00, 4100.00, 200, 48, 16);
INSERT INTO `flights` VALUES (41, 'CA1675', '中国国际航空', '西安', '咸阳国际机场', '北京', '首都国际机场', '2025-09-23 11:10:00', '2025-09-23 13:40:00', '2小时30分钟', '空客A320', 760.00, 1700.00, 3000.00, 170, 38, 10);
INSERT INTO `flights` VALUES (42, 'MU2901', '东方航空', '重庆', '江北国际机场', '广州', '白云国际机场', '2025-09-23 12:30:00', '2025-09-23 14:50:00', '2小时20分钟', '波音737', 790.00, 1800.00, 3200.00, 160, 35, 10);
INSERT INTO `flights` VALUES (43, 'CZ3875', '南方航空', '杭州', '萧山国际机场', '广州', '白云国际机场', '2025-09-23 13:20:00', '2025-09-23 15:45:00', '2小时25分钟', '空客A321', 770.00, 1800.00, 3200.00, 180, 40, 12);
INSERT INTO `flights` VALUES (44, 'HU7331', '海南航空', '南京', '禄口国际机场', '深圳', '宝安国际机场', '2025-09-23 14:10:00', '2025-09-23 16:25:00', '2小时15分钟', '波音737', 680.00, 1500.00, 2700.00, 170, 38, 10);
INSERT INTO `flights` VALUES (45, 'CA1783', '中国国际航空', '武汉', '天河国际机场', '北京', '首都国际机场', '2025-09-23 15:20:00', '2025-09-23 17:30:00', '2小时10分钟', '空客A320', 650.00, 1400.00, 2600.00, 160, 35, 8);
INSERT INTO `flights` VALUES (46, 'MU5719', '东方航空', '深圳', '宝安国际机场', '杭州', '萧山国际机场', '2025-09-23 16:30:00', '2025-09-23 18:45:00', '2小时15分钟', '空客A321', 750.00, 1700.00, 3000.00, 180, 40, 12);
INSERT INTO `flights` VALUES (47, 'CA1825', '中国国际航空', '昆明', '长水国际机场', '北京', '首都国际机场', '2025-09-23 08:50:00', '2025-09-23 12:10:00', '3小时20分钟', '波音787', 1050.00, 2600.00, 4500.00, 210, 50, 18);
INSERT INTO `flights` VALUES (48, 'MU5355', '东方航空', '广州', '白云国际机场', '西安', '咸阳国际机场', '2025-09-23 09:40:00', '2025-09-23 12:20:00', '2小时40分钟', '空客A330', 890.00, 2100.00, 3700.00, 200, 45, 16);
INSERT INTO `flights` VALUES (49, 'CZ3497', '南方航空', '北京', '首都国际机场', '南京', '禄口国际机场', '2025-09-23 10:55:00', '2025-09-23 13:05:00', '2小时10分钟', '波音737', 670.00, 1500.00, 2700.00, 170, 38, 10);
INSERT INTO `flights` VALUES (50, 'HU7673', '海南航空', '上海', '虹桥国际机场', '重庆', '江北国际机场', '2025-09-23 11:45:00', '2025-09-23 14:30:00', '2小时45分钟', '空客A320', 860.00, 2000.00, 3500.00, 180, 42, 12);
INSERT INTO `flights` VALUES (51, 'CA1935', '中国国际航空', '成都', '双流国际机场', '广州', '白云国际机场', '2025-09-23 12:50:00', '2025-09-23 15:30:00', '2小时40分钟', '波音737', 910.00, 2200.00, 3800.00, 190, 45, 15);
INSERT INTO `flights` VALUES (52, 'MU2345', '东方航空', '杭州', '萧山国际机场', '武汉', '天河国际机场', '2025-09-23 13:40:00', '2025-09-23 15:30:00', '1小时50分钟', '空客A321', 580.00, 1300.00, 2300.00, 160, 35, 8);
INSERT INTO `flights` VALUES (53, 'CZ3257', '南方航空', '西安', '咸阳国际机场', '广州', '白云国际机场', '2025-09-23 14:30:00', '2025-09-23 17:00:00', '2小时30分钟', '波音737', 830.00, 1900.00, 3300.00, 180, 40, 12);
INSERT INTO `flights` VALUES (54, 'HU7123', '海南航空', '北京', '首都国际机场', '成都', '双流国际机场', '2025-09-23 15:20:00', '2025-09-23 18:35:00', '3小时15分钟', '空客A330', 990.00, 2400.00, 4300.00, 210, 50, 18);
INSERT INTO `flights` VALUES (55, 'CA1623', '中国国际航空', '深圳', '宝安国际机场', '杭州', '萧山国际机场', '2025-09-23 16:10:00', '2025-09-23 18:20:00', '2小时10分钟', '空客A320', 740.00, 1700.00, 3000.00, 170, 38, 10);
INSERT INTO `flights` VALUES (56, 'MU5237', '东方航空', '重庆', '江北国际机场', '北京', '首都国际机场', '2025-09-23 17:00:00', '2025-09-23 19:50:00', '2小时50分钟', '波音737', 850.00, 2000.00, 3500.00, 180, 42, 12);
INSERT INTO `flights` VALUES (57, 'CA6547', '海南航空', '北京', '首都国际机场', '上海', '浦东国际机场', '2025-09-20 08:00:00', '2025-09-20 10:30:00', '2小时30分钟', '波音737', 680.00, 1500.00, 2800.00, 150, 30, 12);
INSERT INTO `flights` VALUES (58, 'CA65479', '南方航空', '北京', '首都国际机场', '上海', '浦东国际机场', '2025-09-20 08:00:00', '2025-09-20 10:30:00', '2小时30分钟', '波音737', 680.00, 1500.00, 2800.00, 150, 30, 12);

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `passenger_id` int NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id` ASC) USING BTREE,
  INDEX `passenger_id`(`passenger_id` ASC) USING BTREE,
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES (1, 1, 12, 680.00);
INSERT INTO `order_details` VALUES (2, 2, 12, 680.00);
INSERT INTO `order_details` VALUES (3, 3, 14, 680.00);
INSERT INTO `order_details` VALUES (4, 4, 12, 680.00);
INSERT INTO `order_details` VALUES (5, 5, 13, 720.00);
INSERT INTO `order_details` VALUES (6, 6, 14, 680.00);
INSERT INTO `order_details` VALUES (7, 7, 14, 720.00);
INSERT INTO `order_details` VALUES (8, 8, 14, 720.00);
INSERT INTO `order_details` VALUES (9, 9, 14, 720.00);
INSERT INTO `order_details` VALUES (10, 10, 15, 720.00);
INSERT INTO `order_details` VALUES (11, 11, 14, 680.00);
INSERT INTO `order_details` VALUES (12, 12, 12, 680.00);
INSERT INTO `order_details` VALUES (13, 13, 12, 680.00);
INSERT INTO `order_details` VALUES (14, 14, 14, 720.00);
INSERT INTO `order_details` VALUES (15, 15, 13, 2800.00);
INSERT INTO `order_details` VALUES (16, 16, 13, 1500.00);
INSERT INTO `order_details` VALUES (17, 17, 14, 1500.00);
INSERT INTO `order_details` VALUES (18, 18, 12, 2800.00);
INSERT INTO `order_details` VALUES (19, 19, 14, 1500.00);
INSERT INTO `order_details` VALUES (20, 20, 14, 2800.00);
INSERT INTO `order_details` VALUES (21, 21, 13, 680.00);
INSERT INTO `order_details` VALUES (22, 22, 13, 1500.00);
INSERT INTO `order_details` VALUES (23, 23, 12, 2800.00);
INSERT INTO `order_details` VALUES (24, 23, 13, 2800.00);
INSERT INTO `order_details` VALUES (25, 23, 14, 2800.00);
INSERT INTO `order_details` VALUES (26, 24, 13, 1600.00);
INSERT INTO `order_details` VALUES (27, 24, 14, 1600.00);
INSERT INTO `order_details` VALUES (28, 25, 13, 850.00);
INSERT INTO `order_details` VALUES (29, 26, 13, 1500.00);
INSERT INTO `order_details` VALUES (30, 26, 14, 1500.00);
INSERT INTO `order_details` VALUES (31, 27, 12, 3000.00);
INSERT INTO `order_details` VALUES (32, 27, 13, 3000.00);
INSERT INTO `order_details` VALUES (33, 27, 14, 3000.00);
INSERT INTO `order_details` VALUES (34, 28, 16, 720.00);
INSERT INTO `order_details` VALUES (35, 29, 16, 1500.00);
INSERT INTO `order_details` VALUES (36, 30, 13, 680.00);
INSERT INTO `order_details` VALUES (37, 31, 13, 680.00);
INSERT INTO `order_details` VALUES (38, 32, 12, 680.00);
INSERT INTO `order_details` VALUES (39, 33, 14, 680.00);
INSERT INTO `order_details` VALUES (40, 34, 12, 2900.00);
INSERT INTO `order_details` VALUES (41, 34, 13, 2900.00);
INSERT INTO `order_details` VALUES (42, 34, 14, 2900.00);
INSERT INTO `order_details` VALUES (43, 35, 12, 740.00);
INSERT INTO `order_details` VALUES (44, 35, 13, 740.00);
INSERT INTO `order_details` VALUES (45, 35, 14, 740.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int NOT NULL,
  `flight_id` int NOT NULL,
  `cabin_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '舱位类型（economy/business/first_class）',
  `total_price` decimal(10, 2) NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_number`(`order_number` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `flight_id`(`flight_id` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 'ORD202509181013347698', 1, 1, NULL, 680.00, 'paid', '2025-09-18 10:13:34');
INSERT INTO `orders` VALUES (2, 'ORD202509181016518959', 1, 1, NULL, 680.00, 'paid', '2025-09-18 10:16:51');
INSERT INTO `orders` VALUES (3, 'ORD202509181021484054', 1, 1, NULL, 680.00, 'paid', '2025-09-18 10:21:48');
INSERT INTO `orders` VALUES (4, 'ORD202509181031001709', 1, 1, NULL, 680.00, 'paid', '2025-09-18 10:31:00');
INSERT INTO `orders` VALUES (5, 'ORD202509181038173604', 1, 2, NULL, 720.00, 'paid', '2025-09-18 10:38:17');
INSERT INTO `orders` VALUES (6, 'ORD202509181039283884', 1, 1, NULL, 680.00, 'paid', '2025-09-18 10:39:28');
INSERT INTO `orders` VALUES (7, 'ORD202509181040115564', 1, 2, NULL, 720.00, 'paid', '2025-09-18 10:40:11');
INSERT INTO `orders` VALUES (8, 'ORD202509181040441588', 1, 2, NULL, 720.00, 'paid', '2025-09-18 10:40:44');
INSERT INTO `orders` VALUES (9, 'ORD202509181042593388', 1, 2, NULL, 720.00, 'paid', '2025-09-18 10:42:59');
INSERT INTO `orders` VALUES (10, 'ORD202509181054209666', 4, 2, NULL, 720.00, 'paid', '2025-09-18 10:54:20');
INSERT INTO `orders` VALUES (11, 'ORD202509181121531999', 1, 1, NULL, 680.00, 'paid', '2025-09-18 11:21:53');
INSERT INTO `orders` VALUES (12, 'ORD202509181355334840', 1, 1, NULL, 680.00, 'paid', '2025-09-18 13:55:33');
INSERT INTO `orders` VALUES (13, 'ORD202509181405517768', 1, 1, NULL, 680.00, 'paid', '2025-09-18 14:05:51');
INSERT INTO `orders` VALUES (14, 'ORD202509181406086760', 1, 2, NULL, 720.00, 'paid', '2025-09-18 14:06:08');
INSERT INTO `orders` VALUES (15, 'ORD202509181420591908', 1, 1, NULL, 2800.00, 'pending', '2025-09-18 14:20:59');
INSERT INTO `orders` VALUES (16, 'ORD202509181421234102', 1, 1, NULL, 1500.00, 'pending', '2025-09-18 14:21:23');
INSERT INTO `orders` VALUES (17, 'ORD202509181423478374', 1, 1, NULL, 1500.00, 'pending', '2025-09-18 14:23:47');
INSERT INTO `orders` VALUES (18, 'ORD202509181426161383', 1, 1, NULL, 2800.00, 'pending', '2025-09-18 14:26:16');
INSERT INTO `orders` VALUES (19, 'ORD202509181429067255', 1, 1, NULL, 1500.00, 'pending', '2025-09-18 14:29:06');
INSERT INTO `orders` VALUES (20, 'ORD202509181430027059', 1, 1, NULL, 2800.00, 'pending', '2025-09-18 14:30:02');
INSERT INTO `orders` VALUES (21, 'ORD202509181433419065', 1, 1, NULL, 680.00, 'pending', '2025-09-18 14:33:41');
INSERT INTO `orders` VALUES (22, 'ORD202509181439065314', 1, 1, NULL, 1500.00, 'pending', '2025-09-18 14:39:06');
INSERT INTO `orders` VALUES (23, 'ORD202509181446192979', 1, 1, NULL, 8400.00, 'pending', '2025-09-18 14:46:19');
INSERT INTO `orders` VALUES (24, 'ORD202509181505099654', 1, 2, NULL, 3200.00, 'paid', '2025-09-18 15:05:09');
INSERT INTO `orders` VALUES (25, 'ORD202509181507141037', 1, 3, NULL, 850.00, 'cancelled', '2025-09-18 15:07:14');
INSERT INTO `orders` VALUES (26, 'ORD202509181518431932', 1, 1, NULL, 3000.00, 'paid', '2025-09-18 15:18:43');
INSERT INTO `orders` VALUES (27, 'ORD202509181519021517', 1, 2, NULL, 9000.00, 'cancelled', '2025-09-18 15:19:02');
INSERT INTO `orders` VALUES (28, 'ORD202509182234194516', 3, 2, NULL, 720.00, 'pending', '2025-09-18 22:34:19');
INSERT INTO `orders` VALUES (29, 'ORD202509182234377179', 3, 1, NULL, 1500.00, 'paid', '2025-09-18 22:34:37');
INSERT INTO `orders` VALUES (30, 'ORD202509191438577762', 1, 1, NULL, 680.00, 'paid', '2025-09-19 14:38:57');
INSERT INTO `orders` VALUES (31, 'ORD202509191439343592', 1, 1, NULL, 680.00, 'cancelled', '2025-09-19 14:39:34');
INSERT INTO `orders` VALUES (32, 'ORD202509201257012027', 1, 1, NULL, 680.00, 'paid', '2025-09-20 12:57:01');
INSERT INTO `orders` VALUES (33, 'ORD202509201300249046', 1, 1, '经济舱', 680.00, 'paid', '2025-09-20 05:00:25');
INSERT INTO `orders` VALUES (34, 'ORD202509201302112406', 1, 38, NULL, 8700.00, 'cancelled', '2025-09-20 13:02:11');
INSERT INTO `orders` VALUES (35, 'ORD202509201302278674', 1, 38, NULL, 2220.00, 'refunding', '2025-09-20 13:02:27');

-- ----------------------------
-- Table structure for passengers
-- ----------------------------
DROP TABLE IF EXISTS `passengers`;
CREATE TABLE `passengers`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_card` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` enum('adult','child') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `passenger_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of passengers
-- ----------------------------
INSERT INTO `passengers` VALUES (12, 1, '123', '123', '123', 'child', '');
INSERT INTO `passengers` VALUES (13, 1, '测试乘客', '110101199001011234', '13800138000', 'adult', '成人');
INSERT INTO `passengers` VALUES (14, 1, '张文熙', '123', '123', 'adult', '成人');
INSERT INTO `passengers` VALUES (15, 4, 'asd', 'asd', 'asd', 'adult', 'asd');
INSERT INTO `passengers` VALUES (16, 3, 'asd', 'asd', 'asd', 'adult', 'asd');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `full_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '123', '123', '1', '1', '1', '2025-09-17 16:33:20');
INSERT INTO `users` VALUES (2, 'å¼ æç', '123456', 'å¼ æç', '3****5@qq.com', '1565951', '2025-09-17 17:05:39');
INSERT INTO `users` VALUES (3, '李佟', '666666', '李佟', '3084955365@qq.com', '15625715951', '2025-09-17 20:07:51');
INSERT INTO `users` VALUES (4, 'asd', 'asd', 'asd', '123@asd', 'asd', '2025-09-18 08:58:45');
INSERT INTO `users` VALUES (5, 'test', '123456', '测试用户', 'test@example.com', NULL, '2025-09-18 09:15:27');
INSERT INTO `users` VALUES (7, 'abc', 'abc', 'abc', 'a@1', 'a', '2025-09-19 14:07:46');

SET FOREIGN_KEY_CHECKS = 1;
