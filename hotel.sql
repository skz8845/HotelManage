/*
Navicat MySQL Data Transfer

Source Server         : localhost_mysql
Source Server Version : 50557
Source Host           : localhost:3306
Source Database       : hotel

Target Server Type    : MYSQL
Target Server Version : 50557
File Encoding         : 65001

Date: 2018-06-11 18:46:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hotel_admin`
-- ----------------------------
DROP TABLE IF EXISTS `hotel_admin`;
CREATE TABLE `hotel_admin` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel_admin
-- ----------------------------
INSERT INTO `hotel_admin` VALUES ('1', '123', 'tom');
INSERT INTO `hotel_admin` VALUES ('2', '123', 'root');

-- ----------------------------
-- Table structure for `hotel_order`
-- ----------------------------
DROP TABLE IF EXISTS `hotel_order`;
CREATE TABLE `hotel_order` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `roomid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `FK8D2895035AD96D24` (`userid`),
  KEY `FK8D28950355859344` (`roomid`),
  CONSTRAINT `FK8D28950355859344` FOREIGN KEY (`roomid`) REFERENCES `hotel_room` (`roomid`),
  CONSTRAINT `FK8D2895035AD96D24` FOREIGN KEY (`userid`) REFERENCES `hotel_user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel_order
-- ----------------------------
INSERT INTO `hotel_order` VALUES ('9', '2', '2', '2018-06-05 00:32:53');
INSERT INTO `hotel_order` VALUES ('10', '3', '2', '2018-06-06 22:01:44');
INSERT INTO `hotel_order` VALUES ('11', '9', '2', '2018-06-06 22:02:23');

-- ----------------------------
-- Table structure for `hotel_room`
-- ----------------------------
DROP TABLE IF EXISTS `hotel_room`;
CREATE TABLE `hotel_room` (
  `roomid` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `status` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel_room
-- ----------------------------
INSERT INTO `hotel_room` VALUES ('1', '双人间', '12', '128', '1', null);
INSERT INTO `hotel_room` VALUES ('2', '单人间', '13', '99', '1', null);
INSERT INTO `hotel_room` VALUES ('3', '单人间', '14', '99', '1', '平顶山市');
INSERT INTO `hotel_room` VALUES ('4', '双人间', '15', '129', '0', '平顶山市');
INSERT INTO `hotel_room` VALUES ('5', '单人间', '11', '129', '0', '平顶山市');
INSERT INTO `hotel_room` VALUES ('6', '单人间', '18', '110', '0', '平顶山市');
INSERT INTO `hotel_room` VALUES ('7', '单人间', '19', '121', '0', '平顶山市');
INSERT INTO `hotel_room` VALUES ('8', '单人间', '20', '135', '0', '平顶山市');
INSERT INTO `hotel_room` VALUES ('9', '单人间', '21', '121', '1', '平顶山市');

-- ----------------------------
-- Table structure for `hotel_user`
-- ----------------------------
DROP TABLE IF EXISTS `hotel_user`;
CREATE TABLE `hotel_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel_user
-- ----------------------------
INSERT INTO `hotel_user` VALUES ('1', '', '1553978', '123', 'root');
INSERT INTO `hotel_user` VALUES ('2', null, null, '123', 'tom');
