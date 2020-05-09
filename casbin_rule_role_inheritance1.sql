
CREATE DATABASE `casbin4` DEFAULT CHARACTER SET = `utf8mb4`;
use `casbin4`;

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
INSERT INTO `casbin_rule` VALUES ('p', '1', '/news/:id', 'GET', NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('p', '2', '/news', 'POST', NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('p', '2', '/news/:id', 'PUT', NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('p', '1', '/news/:id', 'DELETE', NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('p', '1', '/news', 'GET', NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('g', 'uid:1', '1', NULL, NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('g', 'uid:1', '2', NULL, NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('g', 'root', '1', NULL, NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('g', 'root', '2', NULL, NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES ('g', 'uid:2', 'root', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

select * from `casbin_rule`;