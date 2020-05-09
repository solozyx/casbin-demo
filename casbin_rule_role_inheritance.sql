/*
 Navicat Premium Data Transfer

 Source Server         : A-localhost-mysql8.0
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : casbin

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 28/04/2020 15:45:50
*/

CREATE DATABASE `casbin3` DEFAULT CHARACTER SET = `utf8mb4`;
use `casbin3`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule`  (
  `p_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `v0` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `v1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `v2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `v3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `v4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `v5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'casbin 策略' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------
INSERT INTO `casbin_rule` VALUES ('p', 'admin', '/news/:id', 'GET', NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('p', 'editor', '/news', 'POST', NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('p', 'editor', '/news/:id', 'PUT', NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('p', 'admin', '/news/:id', 'DELETE', NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('p', 'admin', '/news', 'GET', NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('g', 'uid:1', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('g', 'uid:1', 'editor', NULL, NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('g', 'root', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('g', 'root', 'editor', NULL, NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('g', 'uid:2', 'root', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

select * from `casbin_rule`;