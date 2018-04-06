/*
Navicat MySQL Data Transfer

Source Server         : MySql5.0
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : fancybbs

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2018-04-06 14:01:13
*/
DROP database IF EXISTS fancybbs;

CREATE database fancybbs;

USE fancybbs;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `tId` int(10) unsigned default NULL,
  `uId` int(10) unsigned default NULL,
  `content` text,
  `time` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `tId` (`tId`),
  KEY `uId` (`uId`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`tId`) REFERENCES `topic` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`uId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` char(50) NOT NULL,
  `masterId` int(10) unsigned default NULL,
  `profile` char(50) NOT NULL,
  `topicCount` int(11) default NULL,
  `clickCount` int(11) default NULL,
  `blank_1` text,
  `blank_2` text,
  PRIMARY KEY  (`id`),
  KEY `masterId` (`masterId`),
  CONSTRAINT `session_ibfk_1` FOREIGN KEY (`masterId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of session
-- ----------------------------

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `sId` int(10) unsigned default NULL,
  `uId` int(10) unsigned default NULL,
  `replyCount` int(11) default NULL,
  `topic` char(50) NOT NULL,
  `contents` text NOT NULL,
  `time` datetime default NULL,
  `flag` int(11) default '0',
  `clickCount` int(11) default NULL,
  `lastReplyUseID` int(10) unsigned default NULL,
  `lastReplayTime` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `uId` (`uId`),
  KEY `sId` (`sId`),
  KEY `lastReplyUseID` (`lastReplyUseID`),
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `topic_ibfk_2` FOREIGN KEY (`sId`) REFERENCES `session` (`id`) ON DELETE CASCADE,
  CONSTRAINT `topic_ibfk_3` FOREIGN KEY (`lastReplyUseID`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `account` char(20) NOT NULL,
  `password` char(20) NOT NULL,
  `nickName` char(20) NOT NULL,
  `email` char(50) default NULL,
  `photo` text,
  `sex` char(2) default NULL,
  `grade` int(11) NOT NULL,
  `registrationdate` date default NULL,
  `point` int(11) default '50',
  `blank_1` text,
  `blank_2` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', 'admin', '', 'img/UserPhoto/admin.jpg', '', '3', '2018-04-06', '9999', null, null);
INSERT INTO `user` VALUES ('2', 'account2', 'account2', 'user2', '', 'img/UserPhoto/2.jpg', '', '1', '2018-04-06', '50', null, null);
INSERT INTO `user` VALUES ('3', 'account3', 'account3', 'user3', '', 'img/UserPhoto/3.jpg', '', '1', '2018-04-06', '50', null, null);
INSERT INTO `user` VALUES ('4', 'account4', 'account4', 'user4', '', 'img/UserPhoto/4.jpg', '', '1', '2018-04-06', '50', null, null);
INSERT INTO `user` VALUES ('5', 'account5', 'account5', 'user5', '', 'img/UserPhoto/5.jpg', '', '1', '2018-04-06', '50', null, null);
INSERT INTO `user` VALUES ('6', 'account6', 'account6', 'user6', '', 'img/UserPhoto/6.jpg', '', '1', '2018-04-06', '50', null, null);
INSERT INTO `user` VALUES ('7', 'account7', 'account7', 'user7', '', 'img/UserPhoto/7.jpg', '', '1', '2018-04-06', '50', null, null);
INSERT INTO `user` VALUES ('8', 'account8', 'account8', 'user8', '', 'img/UserPhoto/8.jpg', '', '1', '2018-04-06', '50', null, null);
INSERT INTO `user` VALUES ('9', 'account9', 'account9', 'user9', '', 'img/UserPhoto/9.jpg', '', '1', '2018-04-06', '50', null, null);
SET FOREIGN_KEY_CHECKS=1;
