/*
Navicat MySQL Data Transfer

Source Server         : mysql_user
Source Server Version : 50529
Source Host           : mysql_user:3306
Source Database       : shirolay_ms

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2018-01-12 16:23:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '父ID',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `type` varchar(255) DEFAULT NULL COMMENT '权限类型',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `btn_key` varchar(255) DEFAULT NULL COMMENT '按钮类型',
  `levels` int(255) DEFAULT NULL COMMENT '所属层级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '0', '权限管理', '', '0', '2017-11-30 19:34:00', '', '1');
INSERT INTO `sys_permission` VALUES ('22', '29', '用户管理', 'views/user/user-list.html', '0', '2017-12-01 11:09:00', '', '2');
INSERT INTO `sys_permission` VALUES ('23', '29', '在线用户', 'views/user/online-user-list.html', '0', '2017-12-01 11:09:00', '', '2');
INSERT INTO `sys_permission` VALUES ('24', '1', '权限列表', 'views/role&authority/authority-list.html', '0', '2017-12-01 11:09:00', '', '2');
INSERT INTO `sys_permission` VALUES ('26', '1', '角色管理', 'views/role&authority/role-list.html', '0', '2017-12-01 11:09:00', '', '2');
INSERT INTO `sys_permission` VALUES ('29', '0', '用户管理', '', '0', '2017-12-01 11:09:00', '', '1');
INSERT INTO `sys_permission` VALUES ('31', '24', '添加', '', '1', '0000-00-00 00:00:00', 'add', '0');
INSERT INTO `sys_permission` VALUES ('32', '24', '编辑', '', '1', '0000-00-00 00:00:00', 'edit', '0');
INSERT INTO `sys_permission` VALUES ('33', '24', '删除', '', '1', '0000-00-00 00:00:00', 'delete', '0');
INSERT INTO `sys_permission` VALUES ('34', '26', '添加', '', '1', '0000-00-00 00:00:00', 'add', '0');
INSERT INTO `sys_permission` VALUES ('38', '22', '添加', '', '1', '0000-00-00 00:00:00', 'add', '0');
INSERT INTO `sys_permission` VALUES ('47', '24', '刷新', '', '1', '0000-00-00 00:00:00', 'refresh', '0');
INSERT INTO `sys_permission` VALUES ('48', '26', '刷新', '', '1', '0000-00-00 00:00:00', 'refresh', '0');
INSERT INTO `sys_permission` VALUES ('49', '22', '刷新', '', '1', '0000-00-00 00:00:00', 'refresh', '0');
INSERT INTO `sys_permission` VALUES ('50', '23', '刷新', '', '1', '0000-00-00 00:00:00', 'refresh', '0');
INSERT INTO `sys_permission` VALUES ('173', '26', '查看', '', '1', '0000-00-00 00:00:00', 'row-view-layui', '0');
INSERT INTO `sys_permission` VALUES ('174', '26', '编辑', '', '1', '0000-00-00 00:00:00', 'row-edit-layui', '0');
INSERT INTO `sys_permission` VALUES ('175', '26', '删除', '', '1', '0000-00-00 00:00:00', 'row-delete-layui', '0');
INSERT INTO `sys_permission` VALUES ('176', '22', '查看', '', '1', '0000-00-00 00:00:00', 'row-view-layui', '0');
INSERT INTO `sys_permission` VALUES ('177', '22', '编辑', '', '1', '0000-00-00 00:00:00', 'row-edit-layui', '0');
INSERT INTO `sys_permission` VALUES ('178', '22', '删除', '', '1', '0000-00-00 00:00:00', 'row-delete-layui', '0');
INSERT INTO `sys_permission` VALUES ('179', '23', '查看', '', '1', '0000-00-00 00:00:00', 'row-view-layui', '0');
INSERT INTO `sys_permission` VALUES ('180', '23', '剔除', '', '1', '0000-00-00 00:00:00', 'row-delete-layui', '0');
INSERT INTO `sys_permission` VALUES ('181', '1', '操作日志', 'views/role&authority/syslog-list.html', '0', '0000-00-00 00:00:00', '', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `code` varchar(32) DEFAULT NULL COMMENT '角色编码',
  `remark` varchar(200) DEFAULT NULL COMMENT '角色描述',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', 'sys', '法大无边___除了不能管程序猿', null);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rid` int(11) DEFAULT NULL COMMENT '角色ID',
  `pid` int(11) DEFAULT NULL COMMENT '权限ID',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_role_permission` (`rid`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=11032 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('11008', '1', '1', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11009', '1', '24', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11010', '1', '31', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11011', '1', '32', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11012', '1', '33', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11013', '1', '47', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11014', '1', '26', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11015', '1', '34', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11016', '1', '48', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11017', '1', '173', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11018', '1', '174', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11019', '1', '175', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11020', '1', '181', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11021', '1', '29', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11022', '1', '22', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11023', '1', '38', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11024', '1', '49', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11025', '1', '176', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11026', '1', '177', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11027', '1', '178', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11028', '1', '23', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11029', '1', '50', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11030', '1', '179', '2018-01-12 16:22:16');
INSERT INTO `sys_role_permission` VALUES ('11031', '1', '180', '2018-01-12 16:22:16');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名，登录账户',
  `real_name` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(15) DEFAULT NULL COMMENT '手机号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `user_status` int(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '管理员', 'admin@youguu.com', '18801156796', '1c63129ae9db9c60c3e8aa94d3e00495', '2016-06-16 11:15:33', '2018-01-12 16:15:09', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `rid` int(11) DEFAULT NULL COMMENT '角色ID',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uid_rid` (`uid`,`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('4', '1', '1', null);
