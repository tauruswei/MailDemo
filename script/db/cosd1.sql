/*
 Navicat Premium Data Transfer

 Source Server         : cosd-3389
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : 127.0.0.1:3389
 Source Schema         : cosd

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 10/06/2023 07:37:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for asset
-- ----------------------------
DROP TABLE IF EXISTS `asset`;
CREATE TABLE `asset` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资产主键id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户主键id',
  `asset_type` tinyint(2) DEFAULT NULL COMMENT '资产类型1-EVIC; 2-SL;3-COSD',
  `asset_status` tinyint(255) DEFAULT NULL COMMENT '资产状态： 0-用户不具有玩星光的资格，1-用户具有玩星光的资格',
  `amount` decimal(25,0) DEFAULT NULL COMMENT '资产数量',
  `asset_attrs` text COLLATE utf8_bin COMMENT '资产属性：保留字段',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of asset
-- ----------------------------
BEGIN;
INSERT INTO `asset` VALUES (1, 10, 3, 0, 18000, NULL, '2023-06-08 09:37:28', '2023-06-08 18:59:33', NULL);
INSERT INTO `asset` VALUES (2, 10, 1, 0, 20020, NULL, '2023-06-08 09:40:50', '2023-06-08 10:21:07', NULL);
COMMIT;

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '合约名称',
  `network` int(255) DEFAULT NULL COMMENT '区块链网络：97-bsc test net',
  `address` varchar(255) DEFAULT NULL COMMENT '合约地址',
  `abi` text COMMENT 'abi 文件',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contract
-- ----------------------------
BEGIN;
INSERT INTO `contract` VALUES (1, 'sl', 97, '0x2795bA76b7f6665669FcBE3dA0B5e4e5FBdA634c', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nft
-- ----------------------------
DROP TABLE IF EXISTS `nft`;
CREATE TABLE `nft` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'NFT 主键id',
  `txid` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '交易id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户主键id',
  `token_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '链上token id',
  `game_type` tinyint(255) DEFAULT NULL COMMENT '游戏类型：0-自走棋',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0-已购买；1-已使用；2-已失效',
  `attr1` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '属性1，编号',
  `attr2` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '属性2，次数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `upchain_time` bigint(20) DEFAULT NULL COMMENT '上链时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of nft
-- ----------------------------
BEGIN;
INSERT INTO `nft` VALUES (1, '0x35ae609c5576d37c660b5bf431272c5ee5aff1373891c2a74f46e6af97114fab', 10, '62', 0, 0, '20002', '100', '2023-06-08 09:34:20', '2023-06-08 09:34:20', NULL, 1686188015);
INSERT INTO `nft` VALUES (2, '0xd8dd137bec81087177ad922630796af5684f41a8a3c2d5e81a73d1b799f91a05', 10, '63', 0, 0, '20001', '50', '2023-06-08 10:11:34', '2023-06-08 10:11:34', NULL, 1686190196);
INSERT INTO `nft` VALUES (3, '0xf8daee8c02e1bc287280ac4443e8dc91db88d3a69a9088f13b3aaa96892df08b', 10, '64', 0, 0, '20003', '100', '2023-06-08 10:12:39', '2023-06-08 10:12:39', NULL, 1686190316);
INSERT INTO `nft` VALUES (4, '0xb64364a94006c4601a0e8b49fe6a32b5bc0ba4338ddd460367dce2db61c81bbf', 10, '65', 0, 0, '10008', '50', '2023-06-08 10:19:51', '2023-06-08 10:19:51', NULL, 1686190343);
INSERT INTO `nft` VALUES (5, '0xaebf34e04296bcf0b39ee2c266431a27723f0414bc7c54829f3ab19208a84aec', 10, '70', 0, 1, '10007', '50', '2023-06-08 21:52:11', '2023-06-08 21:52:11', NULL, 1686232287);
COMMIT;

-- ----------------------------
-- Table structure for pool
-- ----------------------------
DROP TABLE IF EXISTS `pool`;
CREATE TABLE `pool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '质押池 类型：1-defi pool,2-sl pool,3-club',
  `term` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '标注池子是第几期',
  `start_time` bigint(20) DEFAULT NULL COMMENT '池子开始时间',
  `lock_time` bigint(20) DEFAULT NULL COMMENT '池子的锁仓时间/秒',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pool
-- ----------------------------
BEGIN;
INSERT INTO `pool` VALUES (1, '1', '1', 1685603888, 3600000, 'defi');
INSERT INTO `pool` VALUES (2, '2', '1', 1684841716, NULL, '星光');
INSERT INTO `pool` VALUES (3, '3', '1', 1684852716, 3600000, '俱乐部');
COMMIT;

-- ----------------------------
-- Table structure for pool_user
-- ----------------------------
DROP TABLE IF EXISTS `pool_user`;
CREATE TABLE `pool_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户主键id',
  `pool_id` bigint(20) DEFAULT NULL COMMENT '池子主键id',
  `amount` decimal(15,5) DEFAULT NULL COMMENT '数量，可以是负数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间\n',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pool_user
-- ----------------------------
BEGIN;
INSERT INTO `pool_user` VALUES (1, 10, 2, 400.00000, '2023-06-08 09:45:33', '2023-06-08 09:45:33', NULL);
INSERT INTO `pool_user` VALUES (2, 10, 3, 4000.00000, '2023-06-08 10:08:15', '2023-06-08 10:08:15', NULL);
COMMIT;

-- ----------------------------
-- Table structure for trans_game
-- ----------------------------
DROP TABLE IF EXISTS `trans_game`;
CREATE TABLE `trans_game` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of trans_game
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for trans_website
-- ----------------------------
DROP TABLE IF EXISTS `trans_website`;
CREATE TABLE `trans_website` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '交易id 主键',
  `txid` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '交易id',
  `trans_type` tinyint(2) DEFAULT NULL COMMENT '0-用户使用 USDT 购买 COSD、1-用户质押COSD 到 DEFI、2-用户质押 COSD到星光、3-质押 COSD 到俱乐部老板质押池、4-用户从 defi 提现 COSD、5-用户从 星光池中 提现 COSD、6-用户从 俱乐部老板质押池中 提现 COSD、7-用户使用USDT 购买 EVIC、8-用户提现EVIC、9-用户使用USDT 购买 NFT 盲盒、10-NFT交易\n',
  `from_user_id` int(11) DEFAULT NULL COMMENT '用户主键id',
  `from_asset_type` tinyint(2) DEFAULT NULL COMMENT '资产类型 0-USDT；1-COSD；2-NFT；3-EVIC；4-SL',
  `from_amount` decimal(15,5) DEFAULT NULL COMMENT '用户用 100 USDT 购买 COSD，from_amout 就是100',
  `to_asset_type` tinyint(2) DEFAULT NULL COMMENT '资产类型 0-USDT；1-COSD；2-NFT；3-EVIC；4-SL',
  `to_user_id` int(11) DEFAULT NULL COMMENT '用户主键id',
  `to_amount` decimal(15,5) DEFAULT NULL COMMENT '用户用 100 USDT 购买 COSD，COSD 单价 0.05USDT，to_amout 就是2000\n\n\n',
  `nft_token_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'nft 的token id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '状态：0-交易已上链；1-success；2-fail；3-用户取消',
  `upchain_time` bigint(20) DEFAULT NULL COMMENT '上链时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of trans_website
-- ----------------------------
BEGIN;
INSERT INTO `trans_website` VALUES (1, '0x35ae609c5576d37c660b5bf431272c5ee5aff1373891c2a74f46e6af97114fab', 9, 10, 0, 20.00000, 2, 10, 1.00000, '62', '2023-06-08 09:33:49', '2023-06-08 09:33:49', NULL, 1, 1686188015);
INSERT INTO `trans_website` VALUES (2, '0xbf207212d000ef9086eb7f0433f4b63baa3fe989611eae207ce03cd4f677266b', 7, 10, 0, 10.00000, 3, 10, 1000.00000, NULL, '2023-06-08 09:36:51', '2023-06-08 09:36:51', NULL, 1, 1686188207);
INSERT INTO `trans_website` VALUES (3, '0xec29405e44f8d3954b84aa16509eb8fc748dd5f32441c12685f007d071ac5853', 8, 10, 3, -1000.00000, 0, 10, -10.00000, NULL, '2023-06-08 09:37:53', '2023-06-08 09:37:53', NULL, 1, 1686188276);
INSERT INTO `trans_website` VALUES (4, '0x9ca68e544d609ddc19f0f6f4ba9b6374b386f4cdce27eadd350231a2f96afee8', 7, 10, 0, 100.00000, 3, 10, 10000.00000, NULL, '2023-06-08 09:38:42', '2023-06-08 09:38:42', NULL, 1, 1686188318);
INSERT INTO `trans_website` VALUES (5, '0xe1b3e0935b3ee20f94cb1efb8da14f6d4557412e00a1eb013760e1a6cf203e72', 0, 10, 0, 1000.00000, 1, 10, 20000.00000, NULL, '2023-06-08 09:40:14', '2023-06-08 09:40:14', NULL, 1, 1686188411);
INSERT INTO `trans_website` VALUES (6, '0xe5178f68ca4241e77d91e14401b76a2a6afe7215ec3127b8c738c14ef88d14db', 2, 10, 1, 400.00000, 1, 10, 400.00000, NULL, '2023-06-08 09:44:51', '2023-06-08 09:44:51', NULL, 1, 1686188690);
INSERT INTO `trans_website` VALUES (7, '0x4a9ea7aa026be2244206a0a6b576d358bd4b675b9887fccd904bd2195046f7c3', 3, 10, 1, 4000.00000, 1, 10, 4000.00000, NULL, '2023-06-08 10:07:33', '2023-06-08 10:07:33', NULL, 1, 1686190052);
INSERT INTO `trans_website` VALUES (8, '0x22a83cd4e34b2ad6cab12d3620cb8c484ca8147518efcab6de23c1a63dfeff18', 8, 10, 3, -10000.00000, 0, 10, -100.00000, NULL, '2023-06-08 10:08:45', '2023-06-08 10:08:45', NULL, 1, 1686190127);
INSERT INTO `trans_website` VALUES (9, '0xd8dd137bec81087177ad922630796af5684f41a8a3c2d5e81a73d1b799f91a05', 9, 10, 0, 20.00000, 2, 10, 1.00000, '63', '2023-06-08 10:11:32', '2023-06-08 10:11:32', NULL, 1, 1686190196);
INSERT INTO `trans_website` VALUES (10, '0xf8daee8c02e1bc287280ac4443e8dc91db88d3a69a9088f13b3aaa96892df08b', 9, 10, 0, 20.00000, 2, 10, 1.00000, '64', '2023-06-08 10:12:04', '2023-06-08 10:12:04', NULL, 1, 1686190316);
INSERT INTO `trans_website` VALUES (11, '0xb64364a94006c4601a0e8b49fe6a32b5bc0ba4338ddd460367dce2db61c81bbf', 9, 10, 0, 20.00000, 2, 10, 1.00000, '65', '2023-06-08 10:19:49', '2023-06-08 10:19:49', NULL, 1, 1686190343);
INSERT INTO `trans_website` VALUES (12, '0x30d3cfa94657ce7f733319cb524e2bcb517b6c0f8ea5080756ffb7cc047cfd1d', 0, 10, 0, 1.00000, 1, 10, 20.00000, NULL, '2023-06-08 10:20:26', '2023-06-08 10:20:26', NULL, 1, 1686190824);
INSERT INTO `trans_website` VALUES (13, '0xee2e08437380f20242ebee568023bbe4de78b975f0a5c5ac3cfda3b6f9ec9f52', 7, 10, 0, 100.00000, 3, 10, 10000.00000, NULL, '2023-06-08 10:21:07', '2023-06-08 10:21:07', NULL, 1, 1686190862);
INSERT INTO `trans_website` VALUES (14, '0xa98c04a23fb79646d20b560c22e02ce0aa501bd3a0f5d6c441ccccc8819d8e96', 7, 10, 0, 100.00000, 3, 10, 10000.00000, NULL, '2023-06-08 12:28:48', '2023-06-08 12:29:17', NULL, 1, 1686198518);
INSERT INTO `trans_website` VALUES (15, '0x4ac5bc6f5a65d371f2be26e6af62d798c2d5f17a3b4b2cd51e4f2fbcf7c43cb7', 8, 10, 3, -1000.00000, 0, 10, -10.00000, NULL, '2023-06-08 12:29:52', '2023-06-08 12:30:35', NULL, 1, 1686198593);
INSERT INTO `trans_website` VALUES (16, '0x6909dc20b1c489846c67a3573108bb3a1372b78d055ba492388bd7948650f7f8', 8, 10, 3, -1000.00000, 0, 10, -10.00000, NULL, '2023-06-08 18:59:36', '2023-06-08 19:00:17', NULL, 1, 1686221974);
INSERT INTO `trans_website` VALUES (17, '0xaebf34e04296bcf0b39ee2c266431a27723f0414bc7c54829f3ab19208a84aec', 9, 10, 0, 20.00000, 2, 10, 1.00000, '70', '2023-06-08 21:51:33', '2023-06-08 21:52:10', NULL, 1, 1686232287);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `wallet_address` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '用户钱包地址',
  `email` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '用户邮箱',
  `passwd` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `user_type` tinyint(2) DEFAULT NULL COMMENT '用户类型：0-渠道商；1-俱乐部老板；2-普通用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `user_relation_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '用户关系表主键id',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, NULL, '0xccb233A8269726c51265cff07fDC84110F5F3F4c', NULL, NULL, 0, '2023-06-06 23:07:47', '2023-06-06 23:07:47', NULL, NULL);
INSERT INTO `user` VALUES (2, 'cosd', '0x65B7F91FB4bDa26f712087E9152862D93b34c51d', '13156050650@163.com', '4a50b09dfbffdee13c91a581175480eb', 2, '2023-06-06 23:13:16', '2023-06-06 23:13:16', 'ee036e06-10dd-488c-b06d-7d5721c9e83e', NULL);
INSERT INTO `user` VALUES (3, 'user882926', NULL, NULL, 'f8eb754e6975d3b180ec9bb660a23c31', 99, '2023-06-07 21:48:41', '2023-06-07 21:48:41', NULL, NULL);
INSERT INTO `user` VALUES (4, 'Guest477306', NULL, NULL, '73b8d80eea89b36eb5f486d96bfcba70', 99, '2023-06-07 21:50:14', '2023-06-07 21:50:14', NULL, NULL);
INSERT INTO `user` VALUES (8, 'taurus1', NULL, '1009518255@qq.com', '66796dad19fd2c65ec419d5ed48ee58a', 2, '2023-06-07 22:27:43', '2023-06-07 22:27:43', '41dc4644-c170-4e2b-8e0f-2dc0584b0ec0', NULL);
INSERT INTO `user` VALUES (9, 'taurus2', NULL, 'rexuexdongman2022@163.com', '66796dad19fd2c65ec419d5ed48ee58a', 2, '2023-06-07 22:30:07', '2023-06-07 22:30:07', '275458ce-6a3d-46f3-96e3-2e6f1d124912', NULL);
INSERT INTO `user` VALUES (10, 'taurus3', '0x3249f5fb49982a927a566b2b8ad0ccf34d4f84ce', '3@qq.com', '66796dad19fd2c65ec419d5ed48ee58a', 1, '2023-06-07 22:38:28', '2023-06-08 10:08:15', '4ac8f3fe-9c69-429a-a77e-05dcabb7d992', NULL);
INSERT INTO `user` VALUES (11, 'taurus4', NULL, '4@qq.com', '66796dad19fd2c65ec419d5ed48ee58a', 2, '2023-06-07 22:42:49', '2023-06-07 22:42:49', '1ce8187a-978c-42a2-a376-09329405e1c6', NULL);
INSERT INTO `user` VALUES (12, 'Guest917062', NULL, NULL, '14b24bf1ab89d8befea2ae2864f7e303', 99, '2023-06-08 09:19:12', '2023-06-08 09:19:12', NULL, NULL);
INSERT INTO `user` VALUES (13, 'Guest754175', NULL, NULL, '47fd519ff22037bc1e0483f9649e62b8', 99, '2023-06-08 10:37:27', '2023-06-08 10:37:27', NULL, NULL);
INSERT INTO `user` VALUES (14, 'Guest644652', NULL, NULL, '924bdff865aec1325ace26718582bcc2', 99, '2023-06-08 10:51:00', '2023-06-08 10:51:00', NULL, NULL);
INSERT INTO `user` VALUES (15, 'Guest870575', NULL, NULL, '8d5001014d4fb29c42adfb5475f95dc6', 99, '2023-06-08 21:36:14', '2023-06-08 21:36:14', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_relation`;
CREATE TABLE `user_relation` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL,
  `level0` bigint(20) DEFAULT NULL COMMENT '用户主键id，level0 代表渠道商',
  `level1` bigint(20) DEFAULT NULL COMMENT '用户主键id，level1 代表俱乐部老板',
  `level2` bigint(20) DEFAULT NULL COMMENT '用户主键id，level2 代表普通用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_relation
-- ----------------------------
BEGIN;
INSERT INTO `user_relation` VALUES ('1ce8187a-978c-42a2-a376-09329405e1c6', NULL, NULL, 11, '2023-06-07 22:42:49', '2023-06-07 22:42:49', NULL);
INSERT INTO `user_relation` VALUES ('275458ce-6a3d-46f3-96e3-2e6f1d124912', NULL, NULL, 9, '2023-06-07 22:30:07', '2023-06-07 22:30:07', NULL);
INSERT INTO `user_relation` VALUES ('41dc4644-c170-4e2b-8e0f-2dc0584b0ec0', NULL, NULL, 8, '2023-06-07 22:27:43', '2023-06-07 22:27:43', NULL);
INSERT INTO `user_relation` VALUES ('4ac8f3fe-9c69-429a-a77e-05dcabb7d992', NULL, NULL, 10, '2023-06-07 22:38:28', '2023-06-07 22:38:28', NULL);
INSERT INTO `user_relation` VALUES ('ee036e06-10dd-488c-b06d-7d5721c9e83e', 1, NULL, 2, '2023-06-06 23:13:16', '2023-06-06 23:13:16', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
