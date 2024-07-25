/*
 Navicat Premium Data Transfer

 Source Server         : liyuan-wms
 Source Server Type    : MySQL
 Source Server Version : 50740
 Source Host           : 123.60.166.159:3306
 Source Schema         : liyuan-wms

 Target Server Type    : MySQL
 Target Server Version : 50740
 File Encoding         : 65001

 Date: 22/07/2024 15:50:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'wms_area', '库区', NULL, NULL, 'WmsArea', 'crud', 'element-ui', 'com.liyuan.wms.system', 'system', 'area', '库区', 'zhaoyss', '0', '/', '{\"parentMenuId\":\"2003\"}', 'admin', '2024-04-07 13:29:24', '', '2024-04-07 13:33:54', NULL);
INSERT INTO `gen_table` VALUES (2, 'wms_rack', '货架', NULL, NULL, 'WmsRack', 'crud', '', 'com.liyuan.wms.system', 'system', 'rack', '货架', 'zhaoyss', '0', '/', NULL, 'admin', '2024-04-07 13:29:24', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'wms_warehouse', '仓库', NULL, NULL, 'WmsWarehouse', 'crud', 'element-ui', 'com.liyuan.wms.system', 'system', 'warehouse', '仓库', 'zhaoyss', '0', '/', '{\"parentMenuId\":2003}', 'admin', '2024-04-07 13:29:24', '', '2024-04-07 13:32:34', NULL);
INSERT INTO `gen_table` VALUES (4, 'wms_item', '物料', NULL, NULL, 'WmsItem', 'crud', 'element-ui', 'com.liyuan.wms.wms', 'wms', 'item', '资产', 'zhaoyss', '0', '/', '{\"parentMenuId\":2002}', 'admin', '2024-04-08 11:04:38', '', '2024-04-09 09:50:47', NULL);
INSERT INTO `gen_table` VALUES (5, 'wms_item_type', '物料类型表', NULL, NULL, 'WmsItemType', 'crud', 'element-ui', 'com.liyuan.wms.wms', 'wms', 'itemType', '物料类型', 'zhaoyss', '0', '/', '{}', 'admin', '2024-04-08 11:04:39', '', '2024-04-08 11:12:21', NULL);
INSERT INTO `gen_table` VALUES (6, 'wms_receipt_order', '入库单', NULL, NULL, 'WmsReceiptOrder', 'crud', 'element-ui', 'com.liyuan.wms.wms', 'wms', 'inOrder', '入库单', 'zhaoyss', '0', '/', '{\"parentMenuId\":2011}', 'admin', '2024-04-28 15:31:06', '', '2024-04-28 15:33:20', NULL);
INSERT INTO `gen_table` VALUES (7, 'wms_receipt_order_detail', '入库单详情', NULL, NULL, 'WmsReceiptOrderDetail', 'crud', 'element-ui', 'com.liyuan.wms.wms', 'wms', 'inDetail', '入库单详情', 'zhaoyss', '0', '/', '{\"parentMenuId\":2011}', 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:37:26', NULL);
INSERT INTO `gen_table` VALUES (8, 'wms_shipment_order', '出库单', NULL, NULL, 'WmsShipmentOrder', 'crud', 'element-ui', 'com.liyuan.wms.system', 'system', 'order', '出库单', 'zhaoyss', '0', '/', '{\"parentMenuId\":2010}', 'admin', '2024-06-24 10:18:01', '', '2024-06-24 10:19:41', NULL);
INSERT INTO `gen_table` VALUES (9, 'wms_shipment_order_detail', '出库单详情', NULL, NULL, 'WmsShipmentOrderDetail', 'crud', 'element-ui', 'com.liyuan.wms.wms', 'wms', 'shipmentDetail', '出库单详情', 'zhaoyss', '0', '/', '{\"parentMenuId\":\"2010\"}', 'admin', '2024-06-24 10:25:17', '', '2024-06-27 16:45:58', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', NULL, 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-07 13:29:24', '', '2024-04-07 13:33:54');
INSERT INTO `gen_table_column` VALUES (2, 1, 'area_no', '编号', 'varchar(20)', 'String', 'areaNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-07 13:29:24', '', '2024-04-07 13:33:54');
INSERT INTO `gen_table_column` VALUES (3, 1, 'area_name', '名称', 'varchar(60)', 'String', 'areaName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-04-07 13:29:24', '', '2024-04-07 13:33:54');
INSERT INTO `gen_table_column` VALUES (4, 1, 'warehouse_id', '所属仓库ID', 'bigint(20)', 'Long', 'warehouseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-07 13:29:24', '', '2024-04-07 13:33:54');
INSERT INTO `gen_table_column` VALUES (5, 1, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2024-04-07 13:29:24', '', '2024-04-07 13:33:54');
INSERT INTO `gen_table_column` VALUES (6, 1, 'del_flag', '删除标识', 'tinyint(4)', 'Integer', 'delFlag', '0', '0', '1', '1', '0', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-04-07 13:29:24', '', '2024-04-07 13:33:54');
INSERT INTO `gen_table_column` VALUES (7, 1, 'create_by', '创建人', 'bigint(20)', 'Long', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-04-07 13:29:24', '', '2024-04-07 13:33:54');
INSERT INTO `gen_table_column` VALUES (8, 1, 'create_time', '创建时间', 'datetime(3)', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-04-07 13:29:24', '', '2024-04-07 13:33:54');
INSERT INTO `gen_table_column` VALUES (9, 1, 'update_by', '修改人', 'bigint(20)', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-04-07 13:29:24', '', '2024-04-07 13:33:54');
INSERT INTO `gen_table_column` VALUES (10, 1, 'update_time', '修改时间', 'datetime(3)', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-04-07 13:29:24', '', '2024-04-07 13:33:54');
INSERT INTO `gen_table_column` VALUES (11, 2, 'id', NULL, 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-07 13:29:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, 2, 'rack_no', '编号', 'varchar(20)', 'String', 'rackNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-07 13:29:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, 2, 'rack_name', '名称', 'varchar(60)', 'String', 'rackName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-04-07 13:29:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, 2, 'area_id', '所属库区', 'bigint(20)', 'Long', 'areaId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-07 13:29:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, 2, 'warehouse_id', '所属仓库', 'bigint(20)', 'Long', 'warehouseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-04-07 13:29:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, 2, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2024-04-07 13:29:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, 2, 'del_flag', '删除标识', 'tinyint(4)', 'Integer', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-04-07 13:29:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, 2, 'create_by', '创建人', 'bigint(20)', 'Long', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-04-07 13:29:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, 2, 'create_time', '创建时间', 'datetime(3)', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-04-07 13:29:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, 2, 'update_by', '修改人', 'bigint(20)', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-04-07 13:29:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, 2, 'update_time', '修改时间', 'datetime(3)', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2024-04-07 13:29:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, 3, 'id', NULL, 'bigint(20)', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-07 13:29:25', '', '2024-04-07 13:32:34');
INSERT INTO `gen_table_column` VALUES (23, 3, 'warehouse_no', '编号', 'varchar(20)', 'String', 'warehouseNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-07 13:29:25', '', '2024-04-07 13:32:34');
INSERT INTO `gen_table_column` VALUES (24, 3, 'warehouse_name', '名称', 'varchar(50)', 'String', 'warehouseName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-04-07 13:29:25', '', '2024-04-07 13:32:34');
INSERT INTO `gen_table_column` VALUES (25, 3, 'del_flag', '删除标识', 'tinyint(4)', 'Boolean', 'delFlag', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2024-04-07 13:29:25', '', '2024-04-07 13:32:34');
INSERT INTO `gen_table_column` VALUES (26, 3, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2024-04-07 13:29:25', '', '2024-04-07 13:32:34');
INSERT INTO `gen_table_column` VALUES (27, 3, 'create_by', '创建人', 'bigint(20)', 'Long', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-04-07 13:29:25', '', '2024-04-07 13:32:34');
INSERT INTO `gen_table_column` VALUES (28, 3, 'create_time', '创建时间', 'datetime(3)', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-04-07 13:29:25', '', '2024-04-07 13:32:34');
INSERT INTO `gen_table_column` VALUES (29, 3, 'update_by', '修改人', 'bigint(20)', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-04-07 13:29:25', '', '2024-04-07 13:32:35');
INSERT INTO `gen_table_column` VALUES (30, 3, 'update_time', '修改时间', 'datetime(3)', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-04-07 13:29:25', '', '2024-04-07 13:32:35');
INSERT INTO `gen_table_column` VALUES (31, 4, 'id', NULL, 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-08 11:04:38', '', '2024-04-09 09:50:47');
INSERT INTO `gen_table_column` VALUES (32, 4, 'item_no', '编号', 'varchar(20)', 'String', 'itemNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-08 11:04:38', '', '2024-04-09 09:50:47');
INSERT INTO `gen_table_column` VALUES (33, 4, 'item_name', '名称', 'varchar(60)', 'String', 'itemName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-04-08 11:04:38', '', '2024-04-09 09:50:47');
INSERT INTO `gen_table_column` VALUES (34, 4, 'specification', '规格', 'varchar(255)', 'String', 'specification', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-08 11:04:38', '', '2024-04-09 09:50:47');
INSERT INTO `gen_table_column` VALUES (35, 4, 'item_type', '分类', 'varchar(20)', 'String', 'itemType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2024-04-08 11:04:38', '', '2024-04-09 09:50:47');
INSERT INTO `gen_table_column` VALUES (36, 4, 'unit', '单位类别', 'varchar(20)', 'String', 'unit', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-04-08 11:04:38', '', '2024-04-09 09:50:47');
INSERT INTO `gen_table_column` VALUES (37, 4, 'unit_price', '单价', 'decimal(10,2)', 'BigDecimal', 'unitPrice', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-04-08 11:04:38', '', '2024-04-09 09:50:47');
INSERT INTO `gen_table_column` VALUES (38, 4, 'rack_id', '所属货架', 'bigint(20)', 'Long', 'rackId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-04-08 11:04:38', '', '2024-04-09 09:50:47');
INSERT INTO `gen_table_column` VALUES (39, 4, 'area_id', '所属库区', 'bigint(20)', 'Long', 'areaId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-04-08 11:04:38', '', '2024-04-09 09:50:47');
INSERT INTO `gen_table_column` VALUES (40, 4, 'warehouse_id', '所属仓库', 'bigint(20)', 'Long', 'warehouseId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-04-08 11:04:38', '', '2024-04-09 09:50:47');
INSERT INTO `gen_table_column` VALUES (41, 4, 'quantity', '现有库存', 'decimal(20,2)', 'Long', 'quantity', '0', '0', '0', '0', '0', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-04-08 11:04:38', '', '2024-04-09 09:50:47');
INSERT INTO `gen_table_column` VALUES (42, 4, 'production_date', '生产日期', 'datetime(3)', 'Date', 'productionDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 12, 'admin', '2024-04-08 11:04:38', '', '2024-04-09 09:50:47');
INSERT INTO `gen_table_column` VALUES (43, 4, 'expiry_date', '有效期', 'datetime(3)', 'Date', 'expiryDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 13, 'admin', '2024-04-08 11:04:39', '', '2024-04-09 09:50:47');
INSERT INTO `gen_table_column` VALUES (44, 4, 'batch', '批次', 'varchar(255)', 'String', 'batch', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-04-08 11:04:39', '', '2024-04-09 09:50:47');
INSERT INTO `gen_table_column` VALUES (45, 4, 'del_flag', '删除标识', 'tinyint(4)', 'Boolean', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2024-04-08 11:04:39', '', '2024-04-09 09:50:47');
INSERT INTO `gen_table_column` VALUES (46, 4, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 16, 'admin', '2024-04-08 11:04:39', '', '2024-04-09 09:50:47');
INSERT INTO `gen_table_column` VALUES (47, 4, 'create_by', '创建人', 'bigint(20)', 'Long', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2024-04-08 11:04:39', '', '2024-04-09 09:50:48');
INSERT INTO `gen_table_column` VALUES (48, 4, 'create_time', '创建时间', 'datetime(3)', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2024-04-08 11:04:39', '', '2024-04-09 09:50:48');
INSERT INTO `gen_table_column` VALUES (49, 4, 'update_by', '修改人', 'bigint(20)', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2024-04-08 11:04:39', '', '2024-04-09 09:50:48');
INSERT INTO `gen_table_column` VALUES (50, 4, 'update_time', '修改时间', 'datetime(3)', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 20, 'admin', '2024-04-08 11:04:39', '', '2024-04-09 09:50:48');
INSERT INTO `gen_table_column` VALUES (51, 5, 'item_type_id', '物料类型id', 'bigint(20)', 'Long', 'itemTypeId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-08 11:04:39', '', '2024-04-08 11:12:21');
INSERT INTO `gen_table_column` VALUES (52, 5, 'parent_id', '父物料类型id', 'bigint(20)', 'Long', 'parentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2024-04-08 11:04:39', '', '2024-04-08 11:12:21');
INSERT INTO `gen_table_column` VALUES (53, 5, 'ancestors', '祖级列表', 'varchar(50)', 'String', 'ancestors', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-08 11:04:39', '', '2024-04-08 11:12:21');
INSERT INTO `gen_table_column` VALUES (54, 5, 'type_name', '物料类型名称', 'varchar(30)', 'String', 'typeName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-04-08 11:04:39', '', '2024-04-08 11:12:21');
INSERT INTO `gen_table_column` VALUES (55, 5, 'order_num', '显示顺序', 'int(11)', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-04-08 11:04:39', '', '2024-04-08 11:12:21');
INSERT INTO `gen_table_column` VALUES (56, 5, 'status', '物料类型状态（0正常 1停用）', 'char(1)', 'Boolean', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2024-04-08 11:04:39', '', '2024-04-08 11:12:21');
INSERT INTO `gen_table_column` VALUES (57, 5, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'Boolean', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-04-08 11:04:39', '', '2024-04-08 11:12:21');
INSERT INTO `gen_table_column` VALUES (58, 5, 'create_by', '创建者', 'bigint(20)', 'Long', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-04-08 11:04:39', '', '2024-04-08 11:12:21');
INSERT INTO `gen_table_column` VALUES (59, 5, 'create_time', '创建时间', 'datetime(3)', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-04-08 11:04:39', '', '2024-04-08 11:12:21');
INSERT INTO `gen_table_column` VALUES (60, 5, 'update_by', '更新者', 'bigint(20)', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-04-08 11:04:39', '', '2024-04-08 11:12:21');
INSERT INTO `gen_table_column` VALUES (61, 5, 'update_time', '更新时间', 'datetime(3)', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2024-04-08 11:04:39', '', '2024-04-08 11:12:21');
INSERT INTO `gen_table_column` VALUES (62, 6, 'id', NULL, 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:33:20');
INSERT INTO `gen_table_column` VALUES (63, 6, 'receipt_order_no', '入库单号', 'varchar(32)', 'String', 'receiptOrderNo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:33:20');
INSERT INTO `gen_table_column` VALUES (64, 6, 'receipt_order_type', '入库类型', 'int(11)', 'Long', 'receiptOrderType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:33:20');
INSERT INTO `gen_table_column` VALUES (65, 6, 'receipt_order_status', '入库状态', 'tinyint(4)', 'Integer', 'receiptOrderStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:33:20');
INSERT INTO `gen_table_column` VALUES (66, 6, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:33:20');
INSERT INTO `gen_table_column` VALUES (67, 6, 'del_flag', '删除标识', 'tinyint(4)', 'Integer', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:33:20');
INSERT INTO `gen_table_column` VALUES (68, 6, 'create_by', '创建人', 'bigint(20)', 'Long', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:33:20');
INSERT INTO `gen_table_column` VALUES (69, 6, 'create_time', '创建时间', 'datetime(3)', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:33:20');
INSERT INTO `gen_table_column` VALUES (70, 6, 'update_by', '修改人', 'bigint(20)', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:33:20');
INSERT INTO `gen_table_column` VALUES (71, 6, 'update_time', '修改时间', 'datetime(3)', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:33:20');
INSERT INTO `gen_table_column` VALUES (72, 6, 'wave_no', '波次号', 'varchar(32)', 'String', 'waveNo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:33:20');
INSERT INTO `gen_table_column` VALUES (73, 7, 'id', NULL, 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:37:26');
INSERT INTO `gen_table_column` VALUES (74, 7, 'receipt_order_id', '入库单号', 'bigint(20)', 'Long', 'receiptOrderId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:37:26');
INSERT INTO `gen_table_column` VALUES (75, 7, 'item_id', '资产', 'bigint(20)', 'Long', 'itemId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:37:26');
INSERT INTO `gen_table_column` VALUES (76, 7, 'in_quantity', '入库数量', 'decimal(20,2)', 'BigDecimal', 'inQuantity', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:37:26');
INSERT INTO `gen_table_column` VALUES (77, 7, 'rack_id', '所属货架', 'bigint(20)', 'Long', 'rackId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:37:26');
INSERT INTO `gen_table_column` VALUES (78, 7, 'money', '金额', 'decimal(10,2)', 'BigDecimal', 'money', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:37:26');
INSERT INTO `gen_table_column` VALUES (79, 7, 'del_flag', '删除标识', 'tinyint(4)', 'Integer', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:37:26');
INSERT INTO `gen_table_column` VALUES (80, 7, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:37:27');
INSERT INTO `gen_table_column` VALUES (81, 7, 'create_by', '创建人', 'bigint(20)', 'Long', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:37:27');
INSERT INTO `gen_table_column` VALUES (82, 7, 'create_time', '创建时间', 'datetime(3)', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:37:27');
INSERT INTO `gen_table_column` VALUES (83, 7, 'update_by', '修改人', 'bigint(20)', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:37:27');
INSERT INTO `gen_table_column` VALUES (84, 7, 'update_time', '修改时间', 'datetime(3)', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:37:27');
INSERT INTO `gen_table_column` VALUES (85, 7, 'warehouse_id', '所属仓库', 'bigint(20)', 'Long', 'warehouseId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:37:27');
INSERT INTO `gen_table_column` VALUES (86, 7, 'area_id', '所属库区', 'bigint(20)', 'Long', 'areaId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:37:27');
INSERT INTO `gen_table_column` VALUES (87, 7, 'receipt_order_status', '入库状态', 'tinyint(4)', 'Integer', 'receiptOrderStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'receipt_order_status', 15, 'admin', '2024-04-28 15:31:07', '', '2024-04-28 15:37:27');
INSERT INTO `gen_table_column` VALUES (88, 8, 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-24 10:18:01', '', '2024-06-24 10:19:41');
INSERT INTO `gen_table_column` VALUES (89, 8, 'shipment_order_no', '出库单号，系统自动生成', 'varchar(255)', 'String', 'shipmentOrderNo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-06-24 10:18:01', '', '2024-06-24 10:19:41');
INSERT INTO `gen_table_column` VALUES (90, 8, 'shipment_order_type', '出库类型', 'int(11)', 'Long', 'shipmentOrderType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2024-06-24 10:18:01', '', '2024-06-24 10:19:41');
INSERT INTO `gen_table_column` VALUES (91, 8, 'recipient', '领取人', 'varchar(255)', 'String', 'recipient', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-06-24 10:18:01', '', '2024-06-24 10:19:41');
INSERT INTO `gen_table_column` VALUES (92, 8, 'shipment_order_status', '出库单状态', 'tinyint(4)', 'Integer', 'shipmentOrderStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2024-06-24 10:18:01', '', '2024-06-24 10:19:41');
INSERT INTO `gen_table_column` VALUES (93, 8, 'wave_no', '波次号', 'varchar(62)', 'String', 'waveNo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-06-24 10:18:01', '', '2024-06-24 10:19:41');
INSERT INTO `gen_table_column` VALUES (94, 8, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2024-06-24 10:18:02', '', '2024-06-24 10:19:41');
INSERT INTO `gen_table_column` VALUES (95, 8, 'create_by', '创建人', 'bigint(20)', 'Long', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-06-24 10:18:02', '', '2024-06-24 10:19:41');
INSERT INTO `gen_table_column` VALUES (96, 8, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-06-24 10:18:02', '', '2024-06-24 10:19:42');
INSERT INTO `gen_table_column` VALUES (97, 8, 'update_by', '修改人', 'bigint(20)', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-06-24 10:18:02', '', '2024-06-24 10:19:42');
INSERT INTO `gen_table_column` VALUES (98, 8, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2024-06-24 10:18:02', '', '2024-06-24 10:19:42');
INSERT INTO `gen_table_column` VALUES (99, 8, 'del_falg', '删除标记', 'tinyint(4)', 'Integer', 'delFalg', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-06-24 10:18:02', '', '2024-06-24 10:19:42');
INSERT INTO `gen_table_column` VALUES (100, 9, 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-24 10:25:17', '', '2024-06-27 16:45:58');
INSERT INTO `gen_table_column` VALUES (101, 9, 'shipment_order_no', '出库单编号', 'varchar(255)', 'String', 'shipmentOrderNo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-06-24 10:25:17', '', '2024-06-27 16:45:58');
INSERT INTO `gen_table_column` VALUES (102, 9, 'item_id', '资产', 'bigint(20)', 'Long', 'itemId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-06-24 10:25:17', '', '2024-06-27 16:45:58');
INSERT INTO `gen_table_column` VALUES (103, 9, 'shipment_quantity', '出库数量', 'bigint(20)', 'Long', 'shipmentQuantity', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-06-24 10:25:17', '', '2024-06-27 16:45:58');
INSERT INTO `gen_table_column` VALUES (104, 9, 'rack_id', '货架', 'bigint(20)', 'Long', 'rackId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-06-24 10:25:17', '', '2024-06-27 16:45:58');
INSERT INTO `gen_table_column` VALUES (105, 9, 'area_id', '库区', 'bigint(20)', 'Long', 'areaId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-06-24 10:25:18', '', '2024-06-27 16:45:58');
INSERT INTO `gen_table_column` VALUES (106, 9, 'warehouse_id', '仓库', 'bigint(20)', 'Long', 'warehouseId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-06-24 10:25:18', '', '2024-06-27 16:45:58');
INSERT INTO `gen_table_column` VALUES (107, 9, 'shipment_order_status', '出库状态', 'tinyint(4)', 'Integer', 'shipmentOrderStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2024-06-24 10:25:18', '', '2024-06-27 16:45:58');
INSERT INTO `gen_table_column` VALUES (108, 9, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2024-06-24 10:25:18', '', '2024-06-27 16:45:58');
INSERT INTO `gen_table_column` VALUES (109, 9, 'create_by', '创建人', 'bigint(20)', 'Long', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-06-24 10:25:18', '', '2024-06-27 16:45:58');
INSERT INTO `gen_table_column` VALUES (110, 9, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, '1', 'BETWEEN', 'datetime', '', 11, 'admin', '2024-06-24 10:25:18', '', '2024-06-27 16:45:58');
INSERT INTO `gen_table_column` VALUES (111, 9, 'update_by', '修改人', 'bigint(20)', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2024-06-24 10:25:18', '', '2024-06-27 16:45:58');
INSERT INTO `gen_table_column` VALUES (112, 9, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2024-06-24 10:25:18', '', '2024-06-27 16:45:58');
INSERT INTO `gen_table_column` VALUES (113, 9, 'del_flag', '删除标记', 'tinyint(4)', 'Integer', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2024-06-24 10:25:18', '', '2024-06-27 16:45:58');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-yellow', 'Y', 'admin', '2024-04-07 09:43:46', 'admin', '2024-04-08 16:34:22', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-04-07 09:43:46', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-04-07 09:43:46', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-04-07 09:43:46', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-04-07 09:43:46', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-04-07 09:43:46', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '力源科技', 0, 'admin', '15888888888', 'ly@qq.com', '0', '0', 'admin', '2024-04-07 09:43:45', 'admin', '2024-07-22 11:04:55');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '技术部', 1, 'admin', '15888888888', 'ly@qq.com', '0', '0', 'admin', '2024-04-07 09:43:45', 'admin', '2024-07-22 11:05:40');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-04-07 09:43:45', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '技术研发部', 1, 'admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-07 09:43:45', 'admin', '2024-07-22 11:06:16');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-07 09:43:45', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-07 09:43:45', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-07 09:43:45', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-07 09:43:45', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-04-07 09:43:45', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-04-07 09:43:45', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '文具用品', 'TYPE_1', 'wms_materiel_type', NULL, 'default', 'N', '0', 'admin', '2024-04-07 10:37:22', 'admin', '2024-04-07 10:39:17', NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, '打印耗材', 'TYPE_2', 'wms_materiel_type', NULL, 'default', 'N', '0', 'admin', '2024-04-07 10:39:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '清洁用品', 'TYPE_3', 'wms_materiel_type', NULL, 'default', 'N', '0', 'admin', '2024-04-07 10:40:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '正常', '1', 'wms_itemtype_status', NULL, 'primary', 'N', '0', 'admin', '2024-04-09 08:46:59', 'admin', '2024-04-10 09:35:54', NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, '停用', '0', 'wms_itemtype_status', NULL, 'danger', 'N', '0', 'admin', '2024-04-09 08:47:19', 'admin', '2024-04-10 09:35:59', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 0, '固定资产', '1', 'receipt_order_type', NULL, 'success', 'N', '0', 'admin', '2024-04-28 16:04:20', 'admin', '2024-04-28 16:37:33', NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, '劳保用品', '2', 'receipt_order_type', NULL, 'primary', 'N', '0', 'admin', '2024-04-28 16:04:34', 'admin', '2024-07-08 11:02:25', NULL);
INSERT INTO `sys_dict_data` VALUES (107, 0, '未入库', '1', 'receipt_order_status', NULL, 'primary', 'N', '0', 'admin', '2024-04-28 16:05:51', 'admin', '2024-04-28 16:37:55', NULL);
INSERT INTO `sys_dict_data` VALUES (108, 0, '入库完成', '2', 'receipt_order_status', NULL, 'success', 'N', '0', 'admin', '2024-04-28 16:06:00', 'admin', '2024-04-28 16:38:00', NULL);
INSERT INTO `sys_dict_data` VALUES (109, 0, '行政仓库', '3', 'receipt_order_type', NULL, 'info', 'N', '0', 'admin', '2024-04-28 16:37:14', 'admin', '2024-07-08 11:02:41', NULL);
INSERT INTO `sys_dict_data` VALUES (110, 1, '物资领取', '1', 'shipment_order_type', NULL, 'success', 'N', '0', 'admin', '2024-06-24 10:48:37', 'admin', '2024-06-28 15:26:06', NULL);
INSERT INTO `sys_dict_data` VALUES (111, 2, '活动领取', '2', 'shipment_order_type', NULL, 'primary', 'N', '0', 'admin', '2024-06-24 10:48:51', 'admin', '2024-06-28 15:26:09', NULL);
INSERT INTO `sys_dict_data` VALUES (112, 1, '未出库', '1', 'shipment_order_status', NULL, 'primary', 'N', '0', 'admin', '2024-06-24 10:49:52', 'admin', '2024-06-24 10:50:16', NULL);
INSERT INTO `sys_dict_data` VALUES (113, 2, '出库完成', '2', 'shipment_order_status', NULL, 'success', 'N', '0', 'admin', '2024-06-24 10:50:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 4, '酒水仓库', '4', 'receipt_order_type', NULL, 'primary', 'N', '0', 'admin', '2024-07-08 11:02:58', 'admin', '2024-07-08 11:03:08', NULL);
INSERT INTO `sys_dict_data` VALUES (115, 3, '会议领取', '3', 'shipment_order_type', NULL, 'info', 'N', '0', 'admin', '2024-07-08 11:05:43', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-04-07 09:43:46', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '物料类别', 'wms_materiel_type', '0', 'admin', '2024-04-07 10:22:51', 'admin', '2024-04-07 13:13:37', '物料类别');
INSERT INTO `sys_dict_type` VALUES (101, '物料类型状态', 'wms_itemtype_status', '0', 'admin', '2024-04-09 08:46:37', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '入库状态', 'receipt_order_status', '0', 'admin', '2024-04-28 15:35:37', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '入库类型', 'receipt_order_type', '0', 'admin', '2024-04-28 15:48:48', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '出库类型', 'shipment_order_type', '0', 'admin', '2024-06-24 10:48:27', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (105, '出库状态', 'shipment_order_status', '0', 'admin', '2024-06-24 10:49:25', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-04-07 09:43:46', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-04-07 09:43:46', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-04-07 09:43:46', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 210 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-07 09:46:46');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-07 11:26:56');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-07 13:12:56');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-07 14:36:02');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-07 16:12:31');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-07 18:14:41');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-07 19:08:40');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-08 08:45:50');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '192.168.10.49', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-08 11:13:14');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-08 11:42:07');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '192.168.10.49', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-08 12:03:59');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-08 13:06:29');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-08 13:23:50');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-08 14:54:15');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-08 15:09:56');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-08 15:11:01');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-08 15:11:14');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-08 16:08:32');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '192.168.10.49', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-08 16:32:46');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-08 16:58:04');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-09 08:38:57');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-09 13:24:54');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-09 14:46:26');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-09 18:37:25');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-10 08:40:01');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-10 09:34:34');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-10 09:44:29');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-10 09:44:34');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-10 10:16:56');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-10 15:54:43');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-15 08:48:45');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-15 11:27:33');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-15 13:15:15');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-15 16:09:08');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-17 13:44:06');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-17 16:50:12');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-28 14:06:39');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-28 15:29:07');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-28 16:08:39');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-14 13:09:57');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-14 13:30:50');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-14 15:10:00');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-14 15:10:04');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-14 15:43:48');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-15 13:40:13');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-15 13:41:22');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-17 09:42:12');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '192.168.10.49', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-17 09:46:35');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-17 13:06:19');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-17 13:17:32');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-17 13:17:36');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-17 14:49:39');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-06-17 16:43:07');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-24 09:14:14');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-24 09:30:49');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-24 10:17:44');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-24 10:28:32');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-24 10:28:35');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-24 13:11:46');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-24 13:43:51');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-24 15:19:46');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-27 08:59:03');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-27 13:03:26');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-27 16:43:44');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-27 16:43:47');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-27 17:04:38');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-27 17:04:44');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-28 10:29:57');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-28 10:59:31');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-28 10:59:36');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-28 15:03:19');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-28 15:03:23');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-28 15:16:03');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-01 08:37:55');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '192.168.10.157', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-01 08:38:38');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '192.168.10.157', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-01 08:38:45');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-01 08:48:58');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-01 14:22:28');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-01 15:17:56');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-01 16:11:46');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 10:57:41');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 09:59:47');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 13:10:08');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '192.168.10.21', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 13:51:54');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-22 13:59:07');
INSERT INTO `sys_logininfor` VALUES (185, 'shenfang', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 13:59:14');
INSERT INTO `sys_logininfor` VALUES (186, 'shenfang', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-22 14:01:02');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 14:01:06');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-22 14:01:50');
INSERT INTO `sys_logininfor` VALUES (189, 'shenfang', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 14:01:58');
INSERT INTO `sys_logininfor` VALUES (190, 'shenfang', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-22 14:02:17');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 14:02:21');
INSERT INTO `sys_logininfor` VALUES (192, 'shenfang', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 14:43:44');
INSERT INTO `sys_logininfor` VALUES (193, 'shenfang', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-22 14:44:00');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-07-22 14:47:06');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 14:47:09');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-22 15:07:21');
INSERT INTO `sys_logininfor` VALUES (197, 'shenfang', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 15:07:28');
INSERT INTO `sys_logininfor` VALUES (198, 'shenfang', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-22 15:07:39');
INSERT INTO `sys_logininfor` VALUES (199, 'shengfang', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-22 15:07:51');
INSERT INTO `sys_logininfor` VALUES (200, 'shenfang', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 15:08:00');
INSERT INTO `sys_logininfor` VALUES (201, 'shenfang', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-22 15:08:25');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 15:08:28');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-22 15:09:04');
INSERT INTO `sys_logininfor` VALUES (204, 'shenfang', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 15:09:13');
INSERT INTO `sys_logininfor` VALUES (205, 'shenfang', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-22 15:11:07');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 15:11:13');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-22 15:17:34');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-07-22 15:23:15');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '192.168.10.223', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 15:23:18');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2053 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-04-07 09:43:45', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-04-07 09:43:45', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-04-07 09:43:45', 'admin', '2024-04-07 10:08:18', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-04-07 09:43:45', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-04-07 09:43:45', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-04-07 09:43:45', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-04-07 09:43:45', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-04-07 09:43:45', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-04-07 09:43:45', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-04-07 09:43:45', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-04-07 09:43:45', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-04-07 09:43:45', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-04-07 09:43:45', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-04-07 09:43:45', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-04-07 09:43:45', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-04-07 09:43:45', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-04-07 09:43:45', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-04-07 09:43:45', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-04-07 09:43:45', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-04-07 09:43:45', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-04-07 09:43:45', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-04-07 09:43:45', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-04-07 09:43:45', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '资产', 0, 4, 'wms', NULL, NULL, 1, 0, 'M', '0', '0', '', 'svg-shopping-cart', 'admin', '2024-04-07 10:08:01', 'admin', '2024-04-09 09:19:44', '');
INSERT INTO `sys_menu` VALUES (2001, '分类管理', 2000, 1, 'itemType', 'wms/itemtype/index', NULL, 1, 0, 'C', '0', '0', 'wms:itemType:list', 'svg-materiel-type', 'admin', '2024-04-07 10:09:48', 'admin', '2024-04-08 11:41:53', '');
INSERT INTO `sys_menu` VALUES (2002, '资产管理', 2000, 2, 'master', 'wms/item/index', NULL, 1, 0, 'C', '0', '0', 'wms:item:list', 'svg-materiel-master', 'admin', '2024-04-07 10:11:08', 'admin', '2024-04-09 09:19:53', '');
INSERT INTO `sys_menu` VALUES (2003, '仓库/库区', 0, 4, 'warehouse', 'wms/warehouse/index', NULL, 1, 0, 'C', '0', '0', 'wms:warehouse:list', 'svg-warehouse', 'admin', '2024-04-07 10:46:53', 'admin', '2024-04-07 14:39:01', '');
INSERT INTO `sys_menu` VALUES (2004, '物料查询', 2001, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:itemType:query', '#', 'admin', '2024-04-08 11:31:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '导出物料', 2001, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:itemType:export', '#', 'admin', '2024-04-08 11:31:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '新增物料', 2001, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:itemType:add', '#', 'admin', '2024-04-08 11:31:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '编辑物料', 2001, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:itemType:edit', '#', 'admin', '2024-04-08 11:32:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '删除物料', 2001, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:itemType:remove', '#', 'admin', '2024-04-08 11:32:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '出入库', 0, 3, 'inAndOut', NULL, NULL, 1, 0, 'M', '0', '0', '', 'in_and_out', 'admin', '2024-04-28 14:34:57', 'admin', '2024-04-28 14:42:34', '');
INSERT INTO `sys_menu` VALUES (2010, '出库', 2009, 2, 'outorder', 'wms/outorder/index', NULL, 1, 0, 'C', '0', '0', '', 'out', 'admin', '2024-04-28 14:43:36', 'admin', '2024-06-24 09:20:16', '');
INSERT INTO `sys_menu` VALUES (2011, '入库', 2009, 1, 'inorder', 'wms/inorder/index', NULL, 1, 0, 'C', '0', '0', '', 'in', 'admin', '2024-04-28 14:43:56', 'admin', '2024-04-28 15:45:47', '');
INSERT INTO `sys_menu` VALUES (2012, '编辑入库单', 2009, 3, 'inedit', 'wms/inorder/edit', NULL, 1, 0, 'C', '1', '0', '', '#', 'admin', '2024-06-14 13:57:51', 'admin', '2024-06-24 09:20:38', '');
INSERT INTO `sys_menu` VALUES (2013, '编辑出库单', 2009, 4, 'outedit', 'wms/outorder/edit', NULL, 1, 0, 'C', '1', '0', '', '#', 'admin', '2024-06-24 09:17:27', 'admin', '2024-06-27 14:16:32', '');
INSERT INTO `sys_menu` VALUES (2014, '新增', 2002, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:item:add', '#', 'admin', '2024-07-22 14:03:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '修改', 2002, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:item:edit', '#', 'admin', '2024-07-22 14:03:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '删除', 2002, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:item:remove', '#', 'admin', '2024-07-22 14:04:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '新增仓库', 2003, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:warehouse:add', '#', 'admin', '2024-07-22 14:05:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '修改仓库', 2003, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:warehouse:edit', '#', 'admin', '2024-07-22 14:05:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '删除仓库', 2003, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:warehouse:remove', '#', 'admin', '2024-07-22 14:05:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '库区列表', 2003, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:area:list', '#', 'admin', '2024-07-22 14:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '新增库区', 2003, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:area:add', '#', 'admin', '2024-07-22 14:06:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '查询库区', 2003, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:area:query', '#', 'admin', '2024-07-22 14:07:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '查询仓库', 2003, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:warehouse:query', '#', 'admin', '2024-07-22 14:07:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '修改库区', 2003, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:area:edit', '#', 'admin', '2024-07-22 14:07:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '删除库区', 2003, 8, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:area:remove', '#', 'admin', '2024-07-22 14:08:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '货架列表', 2003, 9, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:rack:list', '#', 'admin', '2024-07-22 14:08:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '查询货架', 2003, 10, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:rack:query', '#', 'admin', '2024-07-22 14:09:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '新增货架', 2003, 11, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:rack:add', '#', 'admin', '2024-07-22 14:10:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '修改货架', 2003, 12, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:rack:edit', '#', 'admin', '2024-07-22 14:10:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '删除货架', 2003, 13, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:rack:remove', '#', 'admin', '2024-07-22 14:11:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '查询资产', 2002, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:item:query', '#', 'admin', '2024-07-22 14:11:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '列表-入库单', 2011, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inOrder:list', '#', 'admin', '2024-07-22 14:47:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '查询-入库单', 2011, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inOrder:query', '#', 'admin', '2024-07-22 14:48:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '新增-入库单', 2011, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inOrder:add', '#', 'admin', '2024-07-22 14:48:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '修改-入库单', 2011, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inOrder:edit', '#', 'admin', '2024-07-22 14:49:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '删除-入库单', 2011, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inOrder:remove', '#', 'admin', '2024-07-22 14:49:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '列表-入库单详情', 2011, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inDetail:list', '#', 'admin', '2024-07-22 14:51:12', 'admin', '2024-07-22 14:51:26', '');
INSERT INTO `sys_menu` VALUES (2039, '查询-入库单详情', 2011, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inDetail:query', '#', 'admin', '2024-07-22 14:51:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '新增-入库单详情', 2011, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inDetail:add', '#', 'admin', '2024-07-22 14:52:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '修改-入库单详情', 2011, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inDetail:edit', '#', 'admin', '2024-07-22 14:52:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '删除-入库单详情', 2011, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:inDetail:remove', '#', 'admin', '2024-07-22 14:52:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '列表-出库单', 2010, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:outOrder:list', '#', 'admin', '2024-07-22 15:03:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '增-出库单', 2010, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:outOrder:add', '#', 'admin', '2024-07-22 15:04:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '删-出库单', 2010, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:outOrder:remove', '#', 'admin', '2024-07-22 15:04:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '改-出库单', 2010, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:outOrder:edit', '#', 'admin', '2024-07-22 15:04:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '查-出库单', 2010, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:outOrder:query', '#', 'admin', '2024-07-22 15:05:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '列表-出库详情', 2010, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:outDetail:list', '#', 'admin', '2024-07-22 15:05:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '增-出库详情', 2010, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:outDetail:add', '#', 'admin', '2024-07-22 15:06:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '删-出库详情', 2010, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:outDetail:remove', '#', 'admin', '2024-07-22 15:06:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '改-出库详情', 2010, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:outDetail:edit', '#', 'admin', '2024-07-22 15:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '查-出库详情', 2010, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wms:outDetail:query', '#', 'admin', '2024-07-22 15:07:00', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-04-07 09:43:46', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-04-07 09:43:46', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 480 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 3, 'com.liyuan.wms.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-04-07 09:49:07', 46);
INSERT INTO `sys_oper_log` VALUES (101, '角色管理', 2, 'com.liyuan.wms.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-04-07 09:43:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 09:50:07', 205);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 3, 'com.liyuan.wms.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 09:50:14', 74);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"svg-shopping-cart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"物料\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"materiel\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 10:08:01', 60);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-07 09:43:45\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 10:08:19', 51);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"materiel/type/index\",\"createBy\":\"admin\",\"icon\":\"svg-materiel-type\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"分类管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"type\",\"perms\":\"materiel:type:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 10:09:49', 83);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"materiel/master/index\",\"createBy\":\"admin\",\"icon\":\"svg-materiel-master\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"物料管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"master\",\"perms\":\"materiel:master:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 10:11:08', 78);
INSERT INTO `sys_oper_log` VALUES (107, '字典类型', 1, 'com.liyuan.wms.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"物料类别\",\"dictType\":\"materiel_type\",\"params\":{},\"remark\":\"物料类别\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 10:22:51', 81);
INSERT INTO `sys_oper_log` VALUES (108, '字典数据', 1, 'com.liyuan.wms.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"固定资产\",\"dictSort\":0,\"dictType\":\"materiel_type\",\"dictValue\":\"TYPE_1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 10:37:22', 75);
INSERT INTO `sys_oper_log` VALUES (109, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-07 10:37:22\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"文具用品\",\"dictSort\":0,\"dictType\":\"materiel_type\",\"dictValue\":\"TYPE_1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 10:39:17', 50);
INSERT INTO `sys_oper_log` VALUES (110, '字典数据', 1, 'com.liyuan.wms.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"打印耗材\",\"dictSort\":0,\"dictType\":\"materiel_type\",\"dictValue\":\"TYPE_2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 10:39:38', 50);
INSERT INTO `sys_oper_log` VALUES (111, '字典数据', 1, 'com.liyuan.wms.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"清洁用品\",\"dictSort\":0,\"dictType\":\"materiel_type\",\"dictValue\":\"TYPE_3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 10:40:06', 111);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"materiel/warehouse/index\",\"createBy\":\"admin\",\"icon\":\"svg-warehouse\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"仓库/库区\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"warehouse\",\"perms\":\"materiel:warehouse:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 10:46:53', 60);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-07 10:08:01\",\"icon\":\"svg-shopping-cart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"物料\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"wms\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 11:29:06', 68);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/materiel/type/index\",\"createTime\":\"2024-04-07 10:09:48\",\"icon\":\"svg-materiel-type\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"分类管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"type\",\"perms\":\"materiel:type:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 11:30:00', 54);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/materiel/master/index\",\"createTime\":\"2024-04-07 10:11:08\",\"icon\":\"svg-materiel-master\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"物料管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"master\",\"perms\":\"materiel:master:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 11:30:14', 60);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/materiel/warehouse/index\",\"createTime\":\"2024-04-07 10:46:53\",\"icon\":\"svg-warehouse\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"仓库/库区\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"warehouse\",\"perms\":\"materiel:warehouse:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 11:30:21', 64);
INSERT INTO `sys_oper_log` VALUES (117, '字典类型', 2, 'com.liyuan.wms.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-07 10:22:51\",\"dictId\":100,\"dictName\":\"物料类别\",\"dictType\":\"wms_materiel_type\",\"params\":{},\"remark\":\"物料类别\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 13:13:37', 225);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/materiel/warehouse/index\",\"createTime\":\"2024-04-07 10:46:53\",\"icon\":\"svg-warehouse\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"仓库\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"warehouse\",\"perms\":\"materiel:warehouse:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 13:21:43', 67);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-07 10:46:53\",\"icon\":\"svg-warehouse\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"仓库\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"warehouse\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 13:22:14', 69);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 6, 'com.liyuan.wms.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"wms_warehouse,wms_rack,wms_area\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 13:29:25', 1263);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.liyuan.wms.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"warehouse\",\"className\":\"WmsWarehouse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 13:29:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"WarehouseNo\",\"columnComment\":\"编号\",\"columnId\":23,\"columnName\":\"warehouse_no\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 13:29:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"warehouseNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"WarehouseName\",\"columnComment\":\"名称\",\"columnId\":24,\"columnName\":\"warehouse_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 13:29:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"warehouseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DelFlag\",\"columnComment\":\"删除标识\",\"columnId\":25,\"columnName\":\"del_flag\",\"columnType\":\"tinyint(4)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 13:29:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"delFlag\",\"javaTy', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 13:32:09', 411);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.liyuan.wms.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"warehouse\",\"className\":\"WmsWarehouse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 13:29:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-07 13:32:08\",\"usableColumn\":false},{\"capJavaField\":\"WarehouseNo\",\"columnComment\":\"编号\",\"columnId\":23,\"columnName\":\"warehouse_no\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 13:29:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"warehouseNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-07 13:32:08\",\"usableColumn\":false},{\"capJavaField\":\"WarehouseName\",\"columnComment\":\"名称\",\"columnId\":24,\"columnName\":\"warehouse_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 13:29:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"warehouseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-07 13:32:08\",\"usableColumn\":false},{\"capJavaField\":\"DelFlag\",\"columnComment\":\"删除标识\",\"columnId\":25,\"columnName\":\"del_flag\",\"columnType\":\"tinyint(4)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 13:29:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":tru', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 13:32:35', 389);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 2, 'com.liyuan.wms.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"area\",\"className\":\"WmsArea\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 13:29:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AreaNo\",\"columnComment\":\"编号\",\"columnId\":2,\"columnName\":\"area_no\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 13:29:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"areaNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AreaName\",\"columnComment\":\"名称\",\"columnId\":3,\"columnName\":\"area_name\",\"columnType\":\"varchar(60)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 13:29:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"areaName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"WarehouseId\",\"columnComment\":\"所属仓库ID\",\"columnId\":4,\"columnName\":\"warehouse_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 13:29:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"warehouseId\",\"javaType\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 13:33:27', 417);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.liyuan.wms.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"area\",\"className\":\"WmsArea\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 13:29:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-04-07 13:33:27\",\"usableColumn\":false},{\"capJavaField\":\"AreaNo\",\"columnComment\":\"编号\",\"columnId\":2,\"columnName\":\"area_no\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 13:29:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"areaNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-04-07 13:33:27\",\"usableColumn\":false},{\"capJavaField\":\"AreaName\",\"columnComment\":\"名称\",\"columnId\":3,\"columnName\":\"area_name\",\"columnType\":\"varchar(60)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 13:29:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"areaName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-04-07 13:33:27\",\"usableColumn\":false},{\"capJavaField\":\"WarehouseId\",\"columnComment\":\"所属仓库ID\",\"columnId\":4,\"columnName\":\"warehouse_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 13:29:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 13:33:54', 415);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 8, 'com.liyuan.wms.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wms_warehouse\"}', NULL, 0, NULL, '2024-04-07 13:33:57', 100);
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 8, 'com.liyuan.wms.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wms_rack\"}', NULL, 0, NULL, '2024-04-07 13:35:09', 47);
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 8, 'com.liyuan.wms.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wms_area\"}', NULL, 0, NULL, '2024-04-07 13:35:20', 36);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/warehouse/index\",\"createTime\":\"2024-04-07 10:46:53\",\"icon\":\"svg-warehouse\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"仓库/库区\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"warehouse\",\"perms\":\"wms:warehouse:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 14:39:01', 72);
INSERT INTO `sys_oper_log` VALUES (129, '仓库', 1, 'com.liyuan.wms.wms.controller.WmsWarehouseController.add()', 'POST', 1, 'admin', '研发部门', '/system/warehouse', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-07 16:48:25\",\"id\":559,\"params\":{},\"warehouseName\":\"四楼氢能\",\"warehouseNo\":\"#A0ba-fasdf\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 16:48:24', 50);
INSERT INTO `sys_oper_log` VALUES (130, '仓库', 1, 'com.liyuan.wms.wms.controller.WmsWarehouseController.add()', 'POST', 1, 'admin', '研发部门', '/system/warehouse', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-07 16:49:31\",\"id\":560,\"params\":{},\"warehouseName\":\"二号楼四楼\",\"warehouseNo\":\"#0asdfas01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 16:49:30', 29);
INSERT INTO `sys_oper_log` VALUES (131, '仓库', 1, 'com.liyuan.wms.wms.controller.WmsWarehouseController.add()', 'POST', 1, 'admin', '研发部门', '/system/warehouse', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-07 18:06:28\",\"id\":561,\"params\":{},\"warehouseName\":\"二楼流水线\",\"warehouseNo\":\"#arafaa-adsaf111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 18:06:28', 60);
INSERT INTO `sys_oper_log` VALUES (132, '库区', 1, 'com.liyuan.wms.wms.controller.WmsAreaController.add()', 'POST', 1, 'admin', '研发部门', '/system/area', '127.0.0.1', '内网IP', '{\"areaName\":\"四楼氢能库区\",\"areaNo\":\"adfafafa\",\"createTime\":\"2024-04-07 18:58:41\",\"id\":677,\"params\":{},\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-07 18:58:40', 40);
INSERT INTO `sys_oper_log` VALUES (133, '库区', 1, 'com.liyuan.wms.wms.controller.WmsAreaController.add()', 'POST', 1, 'admin', '研发部门', '/system/area', '127.0.0.1', '内网IP', '{\"areaName\":\"二楼生产车间库区\",\"areaNo\":\"EK-1451-UI\",\"createTime\":\"2024-04-08 09:07:45\",\"id\":678,\"params\":{},\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 09:07:44', 52);
INSERT INTO `sys_oper_log` VALUES (134, '库区', 1, 'com.liyuan.wms.wms.controller.WmsAreaController.add()', 'POST', 1, 'admin', '研发部门', '/system/area', '127.0.0.1', '内网IP', '{\"areaName\":\"三楼空库区\",\"areaNo\":\"EK-1321-UA\",\"createTime\":\"2024-04-08 09:08:47\",\"id\":679,\"params\":{},\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 09:08:46', 41);
INSERT INTO `sys_oper_log` VALUES (135, '库区', 1, 'com.liyuan.wms.wms.controller.WmsAreaController.add()', 'POST', 1, 'admin', '研发部门', '/system/area', '127.0.0.1', '内网IP', '{\"areaName\":\"四楼库区啊\",\"areaNo\":\"EK-12311\",\"createTime\":\"2024-04-08 09:09:02\",\"id\":680,\"params\":{},\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 09:09:00', 37);
INSERT INTO `sys_oper_log` VALUES (136, '库区', 1, 'com.liyuan.wms.wms.controller.WmsAreaController.add()', 'POST', 1, 'admin', '研发部门', '/system/area', '127.0.0.1', '内网IP', '{\"areaName\":\"五楼库区啊啊\",\"areaNo\":\"EK-12343\",\"createTime\":\"2024-04-08 09:09:19\",\"id\":681,\"params\":{},\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 09:09:18', 37);
INSERT INTO `sys_oper_log` VALUES (137, '库区', 1, 'com.liyuan.wms.wms.controller.WmsAreaController.add()', 'POST', 1, 'admin', '研发部门', '/system/area', '127.0.0.1', '内网IP', '{\"areaName\":\"sfdaf\",\"areaNo\":\"EK0321321\",\"createTime\":\"2024-04-08 09:09:26\",\"id\":682,\"params\":{},\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 09:09:25', 35);
INSERT INTO `sys_oper_log` VALUES (138, '库区', 1, 'com.liyuan.wms.wms.controller.WmsAreaController.add()', 'POST', 1, 'admin', '研发部门', '/system/area', '127.0.0.1', '内网IP', '{\"areaName\":\"sdafsaf\",\"areaNo\":\"asfas\",\"createTime\":\"2024-04-08 09:09:30\",\"id\":683,\"params\":{},\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 09:09:29', 36);
INSERT INTO `sys_oper_log` VALUES (139, '仓库', 1, 'com.liyuan.wms.wms.controller.WmsWarehouseController.add()', 'POST', 1, 'admin', '研发部门', '/system/warehouse', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-08 09:18:27\",\"id\":562,\"params\":{},\"warehouseName\":\"二号楼仓库\",\"warehouseNo\":\"0adfsa\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 09:18:26', 42);
INSERT INTO `sys_oper_log` VALUES (140, '仓库', 2, 'com.liyuan.wms.wms.controller.WmsWarehouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/warehouse', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-07 16:48:25\",\"delFlag\":false,\"id\":559,\"params\":{},\"remark\":\"四楼氢能-A\",\"updateTime\":\"2024-04-08 09:25:26\",\"warehouseName\":\"四楼氢能-A\",\"warehouseNo\":\"AKK-4324-BB\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 09:25:24', 42);
INSERT INTO `sys_oper_log` VALUES (141, '仓库', 2, 'com.liyuan.wms.wms.controller.WmsWarehouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/warehouse', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-07 16:48:25\",\"delFlag\":false,\"id\":559,\"params\":{},\"remark\":\"四楼氢能-A\",\"updateTime\":\"2024-04-08 09:35:43\",\"warehouseName\":\"四楼氢能-A\",\"warehouseNo\":\"AKK-4324-BB\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 09:35:41', 42);
INSERT INTO `sys_oper_log` VALUES (142, '仓库', 2, 'com.liyuan.wms.wms.controller.WmsWarehouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/warehouse', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-07 16:48:25\",\"delFlag\":false,\"id\":559,\"params\":{},\"remark\":\"四楼氢能-A\",\"updateTime\":\"2024-04-08 09:39:27\",\"warehouseName\":\"四楼氢能-A\",\"warehouseNo\":\"AKK-4324-BB\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 09:39:26', 37);
INSERT INTO `sys_oper_log` VALUES (143, '库区', 1, 'com.liyuan.wms.wms.controller.WmsAreaController.add()', 'POST', 1, 'admin', '研发部门', '/system/area', '127.0.0.1', '内网IP', '{\"areaName\":\"二号楼四楼库区A\",\"areaNo\":\"EK-1k-111\",\"createTime\":\"2024-04-08 09:39:47\",\"id\":684,\"params\":{},\"warehouseId\":560}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 09:39:46', 37);
INSERT INTO `sys_oper_log` VALUES (144, '库区', 3, 'com.liyuan.wms.wms.controller.WmsAreaController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/area/677', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 10:33:32', 46);
INSERT INTO `sys_oper_log` VALUES (145, '库区', 2, 'com.liyuan.wms.wms.controller.WmsAreaController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/area', '127.0.0.1', '内网IP', '{\"areaName\":\"二楼生产车间库区\",\"areaNo\":\"EK-1451-UI\",\"createTime\":\"2024-04-08 09:07:45\",\"delFlag\":0,\"id\":678,\"params\":{},\"remark\":\"二楼生产车间库区\",\"updateTime\":\"2024-04-08 10:37:01\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 10:37:00', 46);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 6, 'com.liyuan.wms.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"wms_item,wms_item_type\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 11:04:39', 1316);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 2, 'com.liyuan.wms.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"itemType\",\"className\":\"WmsItemType\",\"columns\":[{\"capJavaField\":\"ItemTypeId\",\"columnComment\":\"物料类型id\",\"columnId\":51,\"columnName\":\"item_type_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-08 11:04:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"itemTypeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父物料类型id\",\"columnId\":52,\"columnName\":\"parent_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-08 11:04:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":true},{\"capJavaField\":\"Ancestors\",\"columnComment\":\"祖级列表\",\"columnId\":53,\"columnName\":\"ancestors\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-08 11:04:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ancestors\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TypeName\",\"columnComment\":\"物料类型名称\",\"columnId\":54,\"columnName\":\"type_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-08 11:04:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 11:12:21', 476);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 8, 'com.liyuan.wms.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wms_item_type\"}', NULL, 0, NULL, '2024-04-08 11:12:26', 144);
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/item/type/index\",\"createTime\":\"2024-04-07 10:09:48\",\"icon\":\"svg-materiel-type\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"分类管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"type\",\"perms\":\"item:type:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 11:23:00', 60);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/item/index\",\"createTime\":\"2024-04-07 10:11:08\",\"icon\":\"svg-materiel-master\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"物料管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"master\",\"perms\":\"wms:item:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 11:23:19', 51);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/itemtype/index\",\"createTime\":\"2024-04-07 10:09:48\",\"icon\":\"svg-materiel-type\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"分类管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"type\",\"perms\":\"item:type:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 11:25:18', 67);
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/itemtype/index\",\"createTime\":\"2024-04-07 10:09:48\",\"icon\":\"svg-materiel-type\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"分类管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"type\",\"perms\":\"wms:itemtype:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 11:25:41', 71);
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/itemtype/index\",\"createTime\":\"2024-04-07 10:09:48\",\"icon\":\"svg-materiel-type\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"分类管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"type\",\"perms\":\"wms:itemType:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 11:26:28', 66);
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"物料查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"perms\":\"wms:itemType:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 11:31:04', 66);
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出物料\",\"menuType\":\"F\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"perms\":\"wms:itemType:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 11:31:40', 71);
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增物料\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"perms\":\"wms:itemType:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 11:31:58', 65);
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑物料\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"perms\":\"wms:itemType:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 11:32:18', 70);
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除物料\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"perms\":\"wms:itemType:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 11:32:42', 63);
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/itemtype/index\",\"createTime\":\"2024-04-07 10:09:48\",\"icon\":\"svg-materiel-type\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"分类管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"itemtype\",\"perms\":\"wms:itemType:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 11:33:55', 50);
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/itemtype/index\",\"createTime\":\"2024-04-07 10:09:48\",\"icon\":\"svg-materiel-type\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"分类管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"itemType\",\"perms\":\"wms:itemType:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 11:34:40', 52);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/itemType/index\",\"createTime\":\"2024-04-07 10:09:48\",\"icon\":\"svg-materiel-type\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"分类管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"itemType\",\"perms\":\"wms:itemType:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 11:35:07', 58);
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/itemtype/index\",\"createTime\":\"2024-04-07 10:09:48\",\"icon\":\"svg-materiel-type\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"分类管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"itemType\",\"perms\":\"wms:itemType:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 11:41:53', 52);
INSERT INTO `sys_oper_log` VALUES (163, '物料类型', 5, 'com.liyuan.wms.wms.controller.WmsItemTypeController.export()', 'POST', 1, 'admin', '研发部门', '/wms/itemType/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-04-08 11:43:33', 363);
INSERT INTO `sys_oper_log` VALUES (164, '仓库', 1, 'com.liyuan.wms.wms.controller.WmsWarehouseController.add()', 'POST', 1, 'admin', '研发部门', '/system/warehouse', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-08 13:32:44\",\"id\":563,\"params\":{},\"warehouseName\":\"三号楼AA\",\"warehouseNo\":\"#NK-AA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 13:32:42', 28);
INSERT INTO `sys_oper_log` VALUES (165, '库区', 2, 'com.liyuan.wms.wms.controller.WmsAreaController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/area', '127.0.0.1', '内网IP', '{\"areaName\":\"三楼空库区\",\"areaNo\":\"EK-1321-UA\",\"createTime\":\"2024-04-08 09:08:47\",\"delFlag\":0,\"id\":679,\"params\":{},\"remark\":\"AA\",\"updateTime\":\"2024-04-08 13:33:53\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 13:33:51', 40);
INSERT INTO `sys_oper_log` VALUES (166, '库区', 3, 'com.liyuan.wms.wms.controller.WmsAreaController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/area/679', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 13:33:53', 35);
INSERT INTO `sys_oper_log` VALUES (167, '物料类型', 5, 'com.liyuan.wms.wms.controller.WmsItemTypeController.export()', 'POST', 1, 'admin', '研发部门', '/wms/itemType/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-04-08 13:43:40', 35);
INSERT INTO `sys_oper_log` VALUES (168, '物料类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-08 16:11:21\",\"itemTypeId\":442,\"orderNum\":1,\"params\":{},\"typeName\":\"固定资产\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 16:11:19', 48);
INSERT INTO `sys_oper_log` VALUES (169, '库区', 3, 'com.liyuan.wms.wms.controller.WmsAreaController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/area/683', '192.168.10.49', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 16:33:42', 48);
INSERT INTO `sys_oper_log` VALUES (170, '参数管理', 2, 'com.liyuan.wms.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '192.168.10.49', '内网IP', '{\"configId\":1,\"configKey\":\"sys.index.skinName\",\"configName\":\"主框架页-默认皮肤样式名称\",\"configType\":\"Y\",\"configValue\":\"skin-yellow\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 09:43:46\",\"params\":{},\"remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 16:34:23', 61);
INSERT INTO `sys_oper_log` VALUES (171, '物料类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-08 17:01:55\",\"itemTypeId\":443,\"orderNum\":1,\"params\":{},\"status\":true,\"typeName\":\"固定资产\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 17:01:53', 8201);
INSERT INTO `sys_oper_log` VALUES (172, '物料类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-08 17:01:55\",\"delFlag\":false,\"itemTypeId\":443,\"orderNum\":1,\"params\":{},\"parentId\":0,\"status\":true,\"typeName\":\"行政物资\",\"updateTime\":\"2024-04-08 17:02:15\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 17:02:13', 30);
INSERT INTO `sys_oper_log` VALUES (173, '物料类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-08 17:04:31\",\"itemTypeId\":444,\"orderNum\":1,\"params\":{},\"status\":true,\"typeName\":\"保洁物品\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 17:04:29', 30);
INSERT INTO `sys_oper_log` VALUES (174, '物料类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-08 17:04:42\",\"itemTypeId\":445,\"orderNum\":1,\"params\":{},\"parentId\":444,\"status\":true,\"typeName\":\"抹布\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 17:04:40', 30);
INSERT INTO `sys_oper_log` VALUES (175, '物料类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-08 17:11:36\",\"itemTypeId\":446,\"orderNum\":1,\"params\":{},\"parentId\":444,\"status\":true,\"typeName\":\"洗洁精\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 17:11:34', 35);
INSERT INTO `sys_oper_log` VALUES (176, '物料类型', 3, 'com.liyuan.wms.wms.controller.WmsItemTypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/wms/itemType/446', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 17:57:06', 38);
INSERT INTO `sys_oper_log` VALUES (177, '物料类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-08 17:57:22\",\"itemTypeId\":447,\"orderNum\":1,\"params\":{},\"parentId\":444,\"status\":true,\"typeName\":\"洗洁精\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-08 17:57:21', 37);
INSERT INTO `sys_oper_log` VALUES (178, '字典类型', 1, 'com.liyuan.wms.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"物料类型状态\",\"dictType\":\"wms_itemtype_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 08:46:37', 65);
INSERT INTO `sys_oper_log` VALUES (179, '字典数据', 1, 'com.liyuan.wms.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正常\",\"dictSort\":0,\"dictType\":\"wms_itemtype_status\",\"dictValue\":\"true\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 08:46:59', 48);
INSERT INTO `sys_oper_log` VALUES (180, '字典数据', 1, 'com.liyuan.wms.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"停用\",\"dictSort\":0,\"dictType\":\"wms_itemtype_status\",\"dictValue\":\"false\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 08:47:19', 49);
INSERT INTO `sys_oper_log` VALUES (181, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-09 08:46:59\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"正常\",\"dictSort\":0,\"dictType\":\"wms_itemtype_status\",\"dictValue\":\"true\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 08:47:30', 46);
INSERT INTO `sys_oper_log` VALUES (182, '物料类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-09 08:59:54\",\"itemTypeId\":448,\"orderNum\":1,\"params\":{},\"parentId\":442,\"status\":true,\"typeName\":\"胶带\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 08:59:54', 2034);
INSERT INTO `sys_oper_log` VALUES (183, '物料类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-08 16:11:21\",\"delFlag\":false,\"itemTypeId\":442,\"orderNum\":1,\"params\":{},\"parentId\":0,\"status\":true,\"typeName\":\"固定资产\",\"updateTime\":\"2024-04-09 09:00:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 09:00:04', 32);
INSERT INTO `sys_oper_log` VALUES (184, '物料类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-09 09:07:10\",\"itemTypeId\":449,\"orderNum\":1,\"params\":{},\"status\":true,\"typeName\":\"固定资产-A\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 09:07:10', 32);
INSERT INTO `sys_oper_log` VALUES (185, '物料类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-09 09:07:19\",\"itemTypeId\":450,\"orderNum\":1,\"params\":{},\"status\":true,\"typeName\":\"固定资产-B\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 09:07:19', 25);
INSERT INTO `sys_oper_log` VALUES (186, '物料类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-09 09:07:29\",\"itemTypeId\":451,\"orderNum\":1,\"params\":{},\"status\":true,\"typeName\":\"固定资产-C\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 09:07:29', 32);
INSERT INTO `sys_oper_log` VALUES (187, '物料类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-09 09:07:37\",\"itemTypeId\":452,\"orderNum\":1,\"params\":{},\"status\":true,\"typeName\":\"固定资产-D\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 09:07:37', 26);
INSERT INTO `sys_oper_log` VALUES (188, '物料类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-09 09:07:50\",\"itemTypeId\":453,\"orderNum\":1,\"params\":{},\"status\":true,\"typeName\":\"固定资产-E\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 09:07:50', 50);
INSERT INTO `sys_oper_log` VALUES (189, '物料类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-09 09:08:08\",\"itemTypeId\":454,\"orderNum\":1,\"params\":{},\"status\":true,\"typeName\":\"固定资产-F\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 09:08:08', 35);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-07 10:08:01\",\"icon\":\"svg-shopping-cart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"资产\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"wms\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 09:19:44', 63);
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/item/index\",\"createTime\":\"2024-04-07 10:11:08\",\"icon\":\"svg-materiel-master\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"资产管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"master\",\"perms\":\"wms:item:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 09:19:53', 64);
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 2, 'com.liyuan.wms.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"item\",\"className\":\"WmsItem\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-08 11:04:38\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ItemNo\",\"columnComment\":\"编号\",\"columnId\":32,\"columnName\":\"item_no\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-08 11:04:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"itemNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ItemName\",\"columnComment\":\"名称\",\"columnId\":33,\"columnName\":\"item_name\",\"columnType\":\"varchar(60)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-08 11:04:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"itemName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Specification\",\"columnComment\":\"规格\",\"columnId\":34,\"columnName\":\"specification\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-08 11:04:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"specification\",\"jav', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 09:50:48', 946);
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 8, 'com.liyuan.wms.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wms_item\"}', NULL, 0, NULL, '2024-04-09 09:50:55', 167);
INSERT INTO `sys_oper_log` VALUES (194, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-08 17:04:31\",\"delFlag\":false,\"itemTypeId\":444,\"orderNum\":1,\"params\":{},\"parentId\":0,\"status\":false,\"typeName\":\"保洁物品\",\"updateTime\":\"2024-04-09 11:24:23\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 11:24:23', 39);
INSERT INTO `sys_oper_log` VALUES (195, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-08 17:04:31\",\"delFlag\":false,\"itemTypeId\":444,\"orderNum\":1,\"params\":{},\"parentId\":0,\"status\":true,\"typeName\":\"保洁物品\",\"updateTime\":\"2024-04-09 11:24:26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 11:24:26', 36);
INSERT INTO `sys_oper_log` VALUES (196, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-08 17:57:22\",\"delFlag\":false,\"itemTypeId\":447,\"orderNum\":1,\"params\":{},\"parentId\":451,\"status\":true,\"typeName\":\"洗洁精\",\"updateTime\":\"2024-04-09 11:24:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 11:24:44', 35);
INSERT INTO `sys_oper_log` VALUES (197, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-09 08:46:59\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"正常\",\"dictSort\":0,\"dictType\":\"wms_itemtype_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-10 09:35:54', 70);
INSERT INTO `sys_oper_log` VALUES (198, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-09 08:47:19\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"停用\",\"dictSort\":0,\"dictType\":\"wms_itemtype_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-10 09:35:59', 58);
INSERT INTO `sys_oper_log` VALUES (199, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-09 08:59:54\",\"delFlag\":false,\"itemTypeId\":448,\"orderNum\":1,\"params\":{},\"parentId\":442,\"status\":false,\"typeName\":\"胶带\",\"updateTime\":\"2024-04-10 09:45:42\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-10 09:45:42', 38);
INSERT INTO `sys_oper_log` VALUES (200, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-08 17:04:42\",\"delFlag\":false,\"itemTypeId\":445,\"orderNum\":1,\"params\":{},\"parentId\":444,\"status\":false,\"typeName\":\"抹布\",\"updateTime\":\"2024-04-10 09:50:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-10 09:50:43', 33);
INSERT INTO `sys_oper_log` VALUES (201, '仓库', 2, 'com.liyuan.wms.wms.controller.WmsWarehouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/warehouse', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-07 16:48:25\",\"delFlag\":false,\"id\":559,\"params\":{},\"remark\":\"四楼氢能-A\",\"updateTime\":\"2024-04-15 08:49:38\",\"warehouseName\":\"四楼氢能-A\",\"warehouseNo\":\"AKK-4324-BB\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-15 08:49:38', 58);
INSERT INTO `sys_oper_log` VALUES (202, '仓库', 2, 'com.liyuan.wms.wms.controller.WmsWarehouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/warehouse', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-07 16:48:25\",\"delFlag\":false,\"id\":559,\"params\":{},\"remark\":\"四楼氢能-A\",\"updateTime\":\"2024-04-15 09:58:37\",\"warehouseName\":\"四楼氢能-A\",\"warehouseNo\":\"AKK-4324-BB\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-15 09:58:37', 51);
INSERT INTO `sys_oper_log` VALUES (203, '货架', 1, 'com.liyuan.wms.wms.controller.WmsRackController.add()', 'POST', 1, 'admin', '研发部门', '/system/rack', '127.0.0.1', '内网IP', '{\"areaId\":678,\"createTime\":\"2024-04-15 14:06:07\",\"params\":{},\"rackName\":\"四楼一号屋子-E5货架\",\"rackNo\":\"AK-312\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'warehouse_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workspaces\\background\\LiyYuanWMS\\liyuanwms-wms\\target\\classes\\mapper\\wms\\WmsRackMapper.xml]\r\n### The error may involve com.liyuan.wms.wms.mapper.WmsRackMapper.insertWmsRack-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into wms_rack          ( rack_no,             rack_name,             area_id,                                                                 create_time )           values ( ?,             ?,             ?,                                                                 ? )\r\n### Cause: java.sql.SQLException: Field \'warehouse_id\' doesn\'t have a default value\n; Field \'warehouse_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'warehouse_id\' doesn\'t have a default value', '2024-04-15 14:06:07', 66);
INSERT INTO `sys_oper_log` VALUES (204, '货架', 1, 'com.liyuan.wms.wms.controller.WmsRackController.add()', 'POST', 1, 'admin', '研发部门', '/system/rack', '127.0.0.1', '内网IP', '{\"areaId\":678,\"createTime\":\"2024-04-15 14:07:42\",\"id\":128,\"params\":{},\"rackName\":\"四楼一号屋子-E5货架\",\"rackNo\":\"AK-312\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-15 14:07:42', 71);
INSERT INTO `sys_oper_log` VALUES (205, '货架', 2, 'com.liyuan.wms.wms.controller.WmsRackController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/rack', '127.0.0.1', '内网IP', '{\"areaId\":678,\"createTime\":\"2024-04-15 14:07:42\",\"delFlag\":0,\"id\":128,\"params\":{},\"rackName\":\"四楼一号屋子-E5货架\",\"rackNo\":\"AK-31211\",\"updateTime\":\"2024-04-15 14:12:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-15 14:12:24', 84);
INSERT INTO `sys_oper_log` VALUES (206, '资产', 1, 'com.liyuan.wms.wms.controller.WmsItemController.add()', 'POST', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":678,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"rackId\":128,\"unit\":\"个\",\"unitPrice\":5,\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-15 15:13:31', 126);
INSERT INTO `sys_oper_log` VALUES (207, '资产', 1, 'com.liyuan.wms.wms.controller.WmsItemController.add()', 'POST', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":680,\"createTime\":\"2024-04-15 16:55:13\",\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"450\",\"params\":{},\"unit\":\"箱\",\"unitPrice\":2999,\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-15 16:55:12', 69);
INSERT INTO `sys_oper_log` VALUES (208, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":678,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"delFlag\":false,\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"rackId\":128,\"unit\":\"个\",\"unitPrice\":5,\"updateTime\":\"2024-04-15 17:02:33\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-15 17:02:32', 77);
INSERT INTO `sys_oper_log` VALUES (209, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":678,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"delFlag\":false,\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"rackId\":128,\"unit\":\"个\",\"unitPrice\":5,\"updateTime\":\"2024-04-15 17:03:23\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-15 17:03:22', 63);
INSERT INTO `sys_oper_log` VALUES (210, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":680,\"createTime\":\"2024-04-15 16:55:13\",\"delFlag\":false,\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"450\",\"params\":{},\"unit\":\"箱\",\"unitPrice\":2999,\"updateTime\":\"2024-04-15 17:03:27\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-15 17:03:27', 40);
INSERT INTO `sys_oper_log` VALUES (211, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":680,\"createTime\":\"2024-04-15 16:55:13\",\"delFlag\":false,\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"450\",\"params\":{},\"unit\":\"箱\",\"unitPrice\":2999,\"updateTime\":\"2024-04-15 17:03:34\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-15 17:03:34', 36);
INSERT INTO `sys_oper_log` VALUES (212, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":681,\"createTime\":\"2024-04-15 16:55:13\",\"delFlag\":false,\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"450\",\"params\":{},\"unit\":\"箱\",\"unitPrice\":2999,\"updateTime\":\"2024-04-15 17:05:46\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-15 17:05:45', 52);
INSERT INTO `sys_oper_log` VALUES (213, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":682,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"delFlag\":false,\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"rackId\":128,\"unit\":\"个\",\"unitPrice\":5,\"updateTime\":\"2024-04-15 17:05:58\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-15 17:05:58', 37);
INSERT INTO `sys_oper_log` VALUES (214, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":682,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"delFlag\":false,\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"rackId\":128,\"unit\":\"个\",\"unitPrice\":5,\"updateTime\":\"2024-04-15 17:06:06\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-15 17:06:06', 38);
INSERT INTO `sys_oper_log` VALUES (215, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":678,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"delFlag\":false,\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"rackId\":128,\"unit\":\"个\",\"unitPrice\":5,\"updateTime\":\"2024-04-15 17:06:10\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-15 17:06:10', 32);
INSERT INTO `sys_oper_log` VALUES (216, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":680,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"delFlag\":false,\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"rackId\":128,\"unit\":\"个\",\"unitPrice\":5,\"updateTime\":\"2024-04-15 17:09:16\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-15 17:09:16', 32);
INSERT INTO `sys_oper_log` VALUES (217, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":678,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"delFlag\":false,\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"rackId\":128,\"unit\":\"个\",\"unitPrice\":5,\"updateTime\":\"2024-04-15 17:09:25\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-15 17:09:24', 34);
INSERT INTO `sys_oper_log` VALUES (218, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":680,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"delFlag\":false,\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"rackId\":128,\"unit\":\"个\",\"unitPrice\":5,\"updateTime\":\"2024-04-17 13:46:05\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 13:46:05', 61);
INSERT INTO `sys_oper_log` VALUES (219, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":680,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"delFlag\":false,\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"rackId\":128,\"unit\":\"个\",\"unitPrice\":5,\"updateTime\":\"2024-04-17 13:49:27\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 13:49:27', 66);
INSERT INTO `sys_oper_log` VALUES (220, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":684,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"delFlag\":false,\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"unit\":\"个\",\"unitPrice\":5,\"updateTime\":\"2024-04-17 13:53:30\",\"warehouseId\":560}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 13:53:30', 39);
INSERT INTO `sys_oper_log` VALUES (221, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":684,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"delFlag\":false,\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"rackId\":0,\"unit\":\"个\",\"unitPrice\":5,\"updateTime\":\"2024-04-17 13:54:22\",\"warehouseId\":560}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 13:54:22', 43);
INSERT INTO `sys_oper_log` VALUES (222, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":678,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"delFlag\":false,\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"rackId\":128,\"unit\":\"个\",\"unitPrice\":5,\"updateTime\":\"2024-04-17 13:59:07\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 13:59:07', 47);
INSERT INTO `sys_oper_log` VALUES (223, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":680,\"createTime\":\"2024-04-15 16:55:13\",\"delFlag\":false,\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"450\",\"params\":{},\"unit\":\"箱\",\"unitPrice\":2999,\"updateTime\":\"2024-04-17 14:01:21\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 14:01:21', 40);
INSERT INTO `sys_oper_log` VALUES (224, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":684,\"createTime\":\"2024-04-15 16:55:13\",\"delFlag\":false,\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"450\",\"params\":{},\"unit\":\"箱\",\"unitPrice\":2999,\"updateTime\":\"2024-04-17 14:13:14\",\"warehouseId\":560}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 14:13:15', 36);
INSERT INTO `sys_oper_log` VALUES (225, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":680,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"delFlag\":false,\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"unit\":\"个\",\"unitPrice\":5,\"updateTime\":\"2024-04-17 14:14:10\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 14:14:11', 42);
INSERT INTO `sys_oper_log` VALUES (226, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":678,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"delFlag\":false,\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"rackId\":128,\"unit\":\"个\",\"unitPrice\":5,\"updateTime\":\"2024-04-17 14:15:17\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 14:15:17', 35);
INSERT INTO `sys_oper_log` VALUES (227, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":681,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"delFlag\":false,\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"unit\":\"个\",\"unitPrice\":5,\"updateTime\":\"2024-04-17 14:15:24\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 14:15:25', 57);
INSERT INTO `sys_oper_log` VALUES (228, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":684,\"batch\":\"11\",\"createTime\":\"2024-04-15 15:13:32\",\"delFlag\":false,\"expiryDate\":\"2024-04-17\",\"id\":417,\"itemName\":\"香皂\",\"itemNo\":\"XZ-1\",\"itemType\":\"444\",\"params\":{},\"productionDate\":\"2024-04-15\",\"unit\":\"个\",\"unitPrice\":5,\"updateTime\":\"2024-04-17 14:15:31\",\"warehouseId\":560}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 14:15:32', 35);
INSERT INTO `sys_oper_log` VALUES (229, '资产', 3, 'com.liyuan.wms.wms.controller.WmsItemController.remove()', 'DELETE', 1, 'admin', '研发部门', '/wms/item/417', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 14:18:00', 50);
INSERT INTO `sys_oper_log` VALUES (230, '资产', 1, 'com.liyuan.wms.wms.controller.WmsItemController.add()', 'POST', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":678,\"createTime\":\"2024-04-17 14:18:30\",\"expiryDate\":\"2024-04-18\",\"id\":419,\"itemName\":\"抹布\",\"itemNo\":\"AK-47\",\"itemType\":\"445\",\"params\":{},\"productionDate\":\"2024-04-17\",\"rackId\":128,\"unit\":\"个\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 14:18:30', 49);
INSERT INTO `sys_oper_log` VALUES (231, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":680,\"createTime\":\"2024-04-17 14:18:30\",\"delFlag\":false,\"expiryDate\":\"2024-04-18\",\"id\":419,\"itemName\":\"抹布\",\"itemNo\":\"AK-47\",\"itemType\":\"445\",\"params\":{},\"productionDate\":\"2024-04-17\",\"unit\":\"个\",\"updateTime\":\"2024-04-17 14:19:02\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 14:19:03', 44);
INSERT INTO `sys_oper_log` VALUES (232, '资产', 1, 'com.liyuan.wms.wms.controller.WmsItemController.add()', 'POST', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":678,\"createTime\":\"2024-04-17 14:55:04\",\"id\":420,\"itemName\":\"ak458\",\"itemNo\":\"AK-48\",\"itemType\":\"453\",\"params\":{},\"rackId\":128,\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 14:55:04', 65);
INSERT INTO `sys_oper_log` VALUES (233, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":678,\"createTime\":\"2024-04-15 16:55:13\",\"delFlag\":false,\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"450\",\"params\":{},\"rackId\":128,\"unit\":\"箱\",\"unitPrice\":2999,\"updateTime\":\"2024-04-17 15:05:58\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 15:05:58', 42);
INSERT INTO `sys_oper_log` VALUES (234, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":681,\"createTime\":\"2024-04-15 16:55:13\",\"delFlag\":false,\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"450\",\"params\":{},\"unit\":\"箱\",\"unitPrice\":2999,\"updateTime\":\"2024-04-17 15:06:09\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 15:06:09', 38);
INSERT INTO `sys_oper_log` VALUES (235, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":684,\"createTime\":\"2024-04-15 16:55:13\",\"delFlag\":false,\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"450\",\"params\":{},\"unit\":\"箱\",\"unitPrice\":2999,\"updateTime\":\"2024-04-17 15:15:30\",\"warehouseId\":560}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 15:15:30', 51);
INSERT INTO `sys_oper_log` VALUES (236, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":680,\"createTime\":\"2024-04-15 16:55:13\",\"delFlag\":false,\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"450\",\"params\":{},\"unit\":\"箱\",\"unitPrice\":2999,\"updateTime\":\"2024-04-17 15:18:31\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 15:18:31', 37);
INSERT INTO `sys_oper_log` VALUES (237, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":680,\"createTime\":\"2024-04-15 16:55:13\",\"delFlag\":false,\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"450\",\"params\":{},\"unit\":\"箱\",\"unitPrice\":2999,\"updateTime\":\"2024-04-17 15:20:04\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 15:20:26', 37597);
INSERT INTO `sys_oper_log` VALUES (238, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":684,\"createTime\":\"2024-04-15 16:55:13\",\"delFlag\":false,\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"450\",\"params\":{},\"rackId\":0,\"unit\":\"箱\",\"unitPrice\":2999,\"updateTime\":\"2024-04-17 15:25:41\",\"warehouseId\":560}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 15:25:41', 49);
INSERT INTO `sys_oper_log` VALUES (239, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":678,\"createTime\":\"2024-04-15 16:55:13\",\"delFlag\":false,\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"450\",\"params\":{},\"rackId\":128,\"unit\":\"箱\",\"unitPrice\":2999,\"updateTime\":\"2024-04-17 15:27:15\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 15:27:16', 65);
INSERT INTO `sys_oper_log` VALUES (240, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":681,\"createTime\":\"2024-04-17 14:18:30\",\"delFlag\":false,\"expiryDate\":\"2024-04-18\",\"id\":419,\"itemName\":\"抹布\",\"itemNo\":\"AK-47\",\"itemType\":\"445\",\"params\":{},\"productionDate\":\"2024-04-17\",\"rackId\":0,\"unit\":\"个\",\"updateTime\":\"2024-04-17 15:27:23\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 15:27:23', 47);
INSERT INTO `sys_oper_log` VALUES (241, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":682,\"createTime\":\"2024-04-17 14:55:04\",\"delFlag\":false,\"id\":420,\"itemName\":\"ak458\",\"itemNo\":\"AK-48\",\"itemType\":\"453\",\"params\":{},\"rackId\":0,\"updateTime\":\"2024-04-17 15:27:30\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 15:27:30', 47);
INSERT INTO `sys_oper_log` VALUES (242, '资产', 1, 'com.liyuan.wms.wms.controller.WmsItemController.add()', 'POST', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":684,\"createTime\":\"2024-04-17 15:28:25\",\"id\":421,\"itemName\":\"        console.log(this.form)\",\"itemNo\":\"AK-49\",\"itemType\":\"454\",\"params\":{},\"rackId\":0,\"warehouseId\":560}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 15:28:25', 56);
INSERT INTO `sys_oper_log` VALUES (243, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":684,\"createTime\":\"2024-04-17 15:28:25\",\"delFlag\":false,\"id\":421,\"itemName\":\"AK-49\",\"itemNo\":\"AK-49\",\"params\":{},\"rackId\":0,\"updateTime\":\"2024-04-17 15:29:08\",\"warehouseId\":560}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 15:29:08', 47);
INSERT INTO `sys_oper_log` VALUES (244, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":681,\"createTime\":\"2024-04-17 14:18:30\",\"delFlag\":false,\"expiryDate\":\"2024-04-18\",\"id\":419,\"itemName\":\"抹布\",\"itemNo\":\"AK-47\",\"itemType\":\"453\",\"params\":{},\"productionDate\":\"2024-04-17\",\"rackId\":0,\"unit\":\"个\",\"updateTime\":\"2024-04-17 15:30:17\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 15:30:17', 46);
INSERT INTO `sys_oper_log` VALUES (245, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":0,\"createTime\":\"2024-04-17 15:28:25\",\"delFlag\":false,\"id\":421,\"itemName\":\"AK-49\",\"itemNo\":\"AK-49\",\"itemType\":\"454\",\"params\":{},\"rackId\":0,\"updateTime\":\"2024-04-17 15:30:27\",\"warehouseId\":561}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 15:30:27', 47);
INSERT INTO `sys_oper_log` VALUES (246, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":0,\"createTime\":\"2024-04-17 15:28:25\",\"delFlag\":false,\"id\":421,\"itemName\":\"AK-49\",\"itemNo\":\"AK-49\",\"itemType\":\"450\",\"params\":{},\"rackId\":0,\"updateTime\":\"2024-04-17 15:30:33\",\"warehouseId\":561}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 15:30:33', 51);
INSERT INTO `sys_oper_log` VALUES (247, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":678,\"createTime\":\"2024-04-15 16:55:13\",\"delFlag\":false,\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"450\",\"params\":{},\"rackId\":128,\"unit\":\"箱\",\"unitPrice\":2999,\"updateTime\":\"2024-04-17 15:48:00\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 15:48:00', 40);
INSERT INTO `sys_oper_log` VALUES (248, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":678,\"createTime\":\"2024-04-15 16:55:13\",\"delFlag\":false,\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"450\",\"params\":{},\"rackId\":128,\"unit\":\"箱\",\"unitPrice\":2999,\"updateTime\":\"2024-04-17 15:51:15\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-17 15:51:15', 36);
INSERT INTO `sys_oper_log` VALUES (249, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":678,\"createTime\":\"2024-04-15 16:55:13\",\"delFlag\":false,\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"443\",\"params\":{},\"rackId\":128,\"unit\":\"箱\",\"unitPrice\":2999,\"updateTime\":\"2024-04-28 14:10:36\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 14:10:36', 66);
INSERT INTO `sys_oper_log` VALUES (250, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"出入库\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"inAndOut\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 14:34:57', 77);
INSERT INTO `sys_oper_log` VALUES (251, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-28 14:34:57\",\"icon\":\"in_and_out\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"出入库\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"inAndOut\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 14:42:34', 53);
INSERT INTO `sys_oper_log` VALUES (252, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"out\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"出库\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2009,\"path\":\"outWarehouse\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 14:43:36', 79);
INSERT INTO `sys_oper_log` VALUES (253, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"入库\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2009,\"path\":\"inWarehouse\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 14:43:56', 63);
INSERT INTO `sys_oper_log` VALUES (254, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/out/index\",\"createTime\":\"2024-04-28 14:43:36\",\"icon\":\"out\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"出库\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2009,\"path\":\"out\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 14:44:46', 56);
INSERT INTO `sys_oper_log` VALUES (255, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/in/index\",\"createTime\":\"2024-04-28 14:43:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"入库\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2009,\"path\":\"in\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 14:44:57', 56);
INSERT INTO `sys_oper_log` VALUES (256, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/in/index\",\"createTime\":\"2024-04-28 14:43:56\",\"icon\":\"in\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"入库\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2009,\"path\":\"in\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 14:45:22', 58);
INSERT INTO `sys_oper_log` VALUES (257, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/out/index\",\"createTime\":\"2024-04-28 14:43:36\",\"icon\":\"out\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"出库\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2009,\"path\":\"out\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 14:45:36', 73);
INSERT INTO `sys_oper_log` VALUES (258, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/in/index\",\"createTime\":\"2024-04-28 14:43:56\",\"icon\":\"in\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"入库\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2009,\"path\":\"in\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 14:45:45', 55);
INSERT INTO `sys_oper_log` VALUES (259, '代码生成', 6, 'com.liyuan.wms.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"wms_receipt_order,wms_receipt_order_detail\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 15:31:08', 1155);
INSERT INTO `sys_oper_log` VALUES (260, '代码生成', 2, 'com.liyuan.wms.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"inOrder\",\"className\":\"WmsReceiptOrder\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":62,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 15:31:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ReceiptOrderNo\",\"columnComment\":\"入库单号\",\"columnId\":63,\"columnName\":\"receipt_order_no\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 15:31:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"receiptOrderNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ReceiptOrderType\",\"columnComment\":\"入库类型\",\"columnId\":64,\"columnName\":\"receipt_order_type\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 15:31:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"receiptOrderType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ReceiptOrderStatus\",\"columnComment\":\"入库状态\",\"columnId\":65,\"columnName\":\"receipt_order_status\",\"columnType\":\"tinyint(4)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 15:31:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 15:33:20', 426);
INSERT INTO `sys_oper_log` VALUES (261, '代码生成', 8, 'com.liyuan.wms.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wms_receipt_order\"}', NULL, 0, NULL, '2024-04-28 15:33:26', 98);
INSERT INTO `sys_oper_log` VALUES (262, '字典类型', 1, 'com.liyuan.wms.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"入库状态\",\"dictType\":\"receipt_order_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 15:35:37', 58);
INSERT INTO `sys_oper_log` VALUES (263, '代码生成', 2, 'com.liyuan.wms.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"inDetail\",\"className\":\"WmsReceiptOrderDetail\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":73,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 15:31:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ReceiptOrderId\",\"columnComment\":\"入库单号\",\"columnId\":74,\"columnName\":\"receipt_order_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 15:31:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"receiptOrderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ItemId\",\"columnComment\":\"资产\",\"columnId\":75,\"columnName\":\"item_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 15:31:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"itemId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"InQuantity\",\"columnComment\":\"入库数量\",\"columnId\":76,\"columnName\":\"in_quantity\",\"columnType\":\"decimal(20,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-28 15:31:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 15:37:27', 564);
INSERT INTO `sys_oper_log` VALUES (264, '代码生成', 8, 'com.liyuan.wms.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wms_receipt_order_detail\"}', NULL, 0, NULL, '2024-04-28 15:37:30', 53);
INSERT INTO `sys_oper_log` VALUES (265, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/inorder/index\",\"createTime\":\"2024-04-28 14:43:56\",\"icon\":\"in\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"入库\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2009,\"path\":\"in\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 15:45:27', 60);
INSERT INTO `sys_oper_log` VALUES (266, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/outorder/index\",\"createTime\":\"2024-04-28 14:43:36\",\"icon\":\"out\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"出库\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2009,\"path\":\"out\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 15:45:40', 53);
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/inorder/index\",\"createTime\":\"2024-04-28 14:43:56\",\"icon\":\"in\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"入库\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2009,\"path\":\"inorder\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 15:45:47', 56);
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/outorder/index\",\"createTime\":\"2024-04-28 14:43:36\",\"icon\":\"out\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"出库\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2009,\"path\":\"outorder\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 15:45:53', 77);
INSERT INTO `sys_oper_log` VALUES (269, '字典类型', 1, 'com.liyuan.wms.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"入库类型\",\"dictType\":\"receipt_order_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 15:48:48', 76);
INSERT INTO `sys_oper_log` VALUES (270, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-08 16:11:21\",\"delFlag\":false,\"itemTypeId\":442,\"orderNum\":1,\"params\":{},\"parentId\":0,\"status\":true,\"typeName\":\"酒水\",\"updateTime\":\"2024-04-28 15:58:53\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 15:58:53', 51);
INSERT INTO `sys_oper_log` VALUES (271, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-09 08:59:54\",\"delFlag\":false,\"itemTypeId\":448,\"orderNum\":1,\"params\":{},\"parentId\":442,\"status\":false,\"typeName\":\"茅台\",\"updateTime\":\"2024-04-28 15:59:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 15:59:10', 47);
INSERT INTO `sys_oper_log` VALUES (272, '资产类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-28 15:59:19\",\"itemTypeId\":455,\"orderNum\":1,\"params\":{},\"parentId\":442,\"status\":true,\"typeName\":\"五粮液\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 15:59:18', 46);
INSERT INTO `sys_oper_log` VALUES (273, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-28 15:59:19\",\"delFlag\":false,\"itemTypeId\":455,\"orderNum\":1,\"params\":{},\"parentId\":442,\"status\":true,\"typeName\":\"五粮液\",\"updateTime\":\"2024-04-28 15:59:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 15:59:56', 56);
INSERT INTO `sys_oper_log` VALUES (274, '字典数据', 1, 'com.liyuan.wms.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"固定资产\",\"dictSort\":0,\"dictType\":\"receipt_order_type\",\"dictValue\":\"TYPE_1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:04:20', 89);
INSERT INTO `sys_oper_log` VALUES (275, '字典数据', 1, 'com.liyuan.wms.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"采矿入库\",\"dictSort\":0,\"dictType\":\"receipt_order_type\",\"dictValue\":\"TYPE_2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:04:34', 67);
INSERT INTO `sys_oper_log` VALUES (276, '字典数据', 1, 'com.liyuan.wms.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未入库\",\"dictSort\":0,\"dictType\":\"receipt_order_status\",\"dictValue\":\"TYPE_1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:05:51', 69);
INSERT INTO `sys_oper_log` VALUES (277, '字典数据', 1, 'com.liyuan.wms.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"入库完成\",\"dictSort\":0,\"dictType\":\"receipt_order_status\",\"dictValue\":\"TYPE_2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:06:00', 67);
INSERT INTO `sys_oper_log` VALUES (278, '资产类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-28 16:06:40\",\"itemTypeId\":456,\"orderNum\":1,\"params\":{},\"parentId\":442,\"status\":true,\"typeName\":\"哈尔滨\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:06:40', 38);
INSERT INTO `sys_oper_log` VALUES (279, '资产', 2, 'com.liyuan.wms.wms.controller.WmsItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/item', '127.0.0.1', '内网IP', '{\"areaId\":678,\"createTime\":\"2024-04-15 16:55:13\",\"delFlag\":false,\"id\":418,\"itemName\":\"酒\",\"itemNo\":\"Ek-a\",\"itemType\":\"455\",\"params\":{},\"quantity\":0,\"rackId\":128,\"unit\":\"箱\",\"unitPrice\":2999,\"updateTime\":\"2024-04-28 16:07:35\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:07:35', 45);
INSERT INTO `sys_oper_log` VALUES (280, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '127.0.0.1', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-09 08:59:54\",\"delFlag\":false,\"itemTypeId\":448,\"orderNum\":1,\"params\":{},\"parentId\":442,\"status\":true,\"typeName\":\"茅台\",\"updateTime\":\"2024-04-28 16:07:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:07:53', 42);
INSERT INTO `sys_oper_log` VALUES (281, '库区', 1, 'com.liyuan.wms.wms.controller.WmsAreaController.add()', 'POST', 1, 'admin', '研发部门', '/system/area', '127.0.0.1', '内网IP', '{\"areaName\":\"库区11\",\"areaNo\":\"EK-AKAK\",\"createTime\":\"2024-04-28 16:18:38\",\"id\":685,\"params\":{},\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:18:37', 48);
INSERT INTO `sys_oper_log` VALUES (282, '库区', 1, 'com.liyuan.wms.wms.controller.WmsAreaController.add()', 'POST', 1, 'admin', '研发部门', '/system/area', '127.0.0.1', '内网IP', '{\"areaName\":\"库区BB\",\"areaNo\":\"AAAA\",\"createTime\":\"2024-04-28 16:18:46\",\"id\":686,\"params\":{},\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:18:46', 43);
INSERT INTO `sys_oper_log` VALUES (283, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-28 16:04:34\",\"default\":false,\"dictCode\":106,\"dictLabel\":\"采购入库\",\"dictSort\":0,\"dictType\":\"receipt_order_type\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:37:02', 68);
INSERT INTO `sys_oper_log` VALUES (284, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-28 16:04:20\",\"default\":false,\"dictCode\":105,\"dictLabel\":\"固定资产\",\"dictSort\":0,\"dictType\":\"receipt_order_type\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:37:05', 64);
INSERT INTO `sys_oper_log` VALUES (285, '字典数据', 1, 'com.liyuan.wms.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"外协入库\",\"dictSort\":0,\"dictType\":\"receipt_order_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:37:14', 65);
INSERT INTO `sys_oper_log` VALUES (286, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-28 16:04:34\",\"default\":false,\"dictCode\":106,\"dictLabel\":\"采购入库\",\"dictSort\":0,\"dictType\":\"receipt_order_type\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:37:27', 65);
INSERT INTO `sys_oper_log` VALUES (287, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-28 16:04:20\",\"default\":false,\"dictCode\":105,\"dictLabel\":\"固定资产\",\"dictSort\":0,\"dictType\":\"receipt_order_type\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:37:33', 63);
INSERT INTO `sys_oper_log` VALUES (288, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-28 16:37:14\",\"default\":false,\"dictCode\":109,\"dictLabel\":\"外协入库\",\"dictSort\":0,\"dictType\":\"receipt_order_type\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:37:38', 68);
INSERT INTO `sys_oper_log` VALUES (289, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-28 16:05:51\",\"default\":false,\"dictCode\":107,\"dictLabel\":\"未入库\",\"dictSort\":0,\"dictType\":\"receipt_order_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:37:55', 64);
INSERT INTO `sys_oper_log` VALUES (290, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-28 16:06:00\",\"default\":false,\"dictCode\":108,\"dictLabel\":\"入库完成\",\"dictSort\":0,\"dictType\":\"receipt_order_status\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-28 16:38:01', 67);
INSERT INTO `sys_oper_log` VALUES (291, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '192.168.10.21', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑入库单\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2009,\"path\":\"edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 13:57:51', 85);
INSERT INTO `sys_oper_log` VALUES (292, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.10.21', '内网IP', '{\"children\":[],\"component\":\"wms/inorder/edit\",\"createTime\":\"2024-06-14 13:57:51\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"编辑入库单\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2009,\"path\":\"edit\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 13:58:02', 74);
INSERT INTO `sys_oper_log` VALUES (293, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.10.21', '内网IP', '{\"children\":[],\"component\":\"wms/inorder/edit\",\"createTime\":\"2024-06-14 13:57:51\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"编辑入库单\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2009,\"path\":\"edit\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 13:50:35', 71);
INSERT INTO `sys_oper_log` VALUES (294, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 14:49:01\",\"depositor\":\"张三\",\"id\":1406,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-144612\",\"receiptOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 14:49:01', 51);
INSERT INTO `sys_oper_log` VALUES (295, '入库单详情', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderDetailController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inDetail', '192.168.10.21', '内网IP', '{\"params\":{}}', NULL, 1, 'Source must not be null', '2024-06-15 14:49:01', 21);
INSERT INTO `sys_oper_log` VALUES (296, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 14:51:05\",\"depositor\":\"里斯\",\"id\":1407,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-145052\",\"receiptOrderStatus\":1,\"receiptOrderType\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 14:51:05', 40);
INSERT INTO `sys_oper_log` VALUES (297, '入库单详情', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderDetailController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inDetail', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 14:51:05\",\"id\":6044,\"inQuantity\":588,\"itemId\":418,\"money\":999,\"params\":{},\"warehouseId\":560}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 14:51:05', 152);
INSERT INTO `sys_oper_log` VALUES (298, '入库单', 2, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 14:49:01\",\"delFlag\":0,\"depositor\":\"张三\",\"id\":1406,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-144612\",\"receiptOrderType\":1,\"updateTime\":\"2024-06-15 15:56:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 15:56:25', 45);
INSERT INTO `sys_oper_log` VALUES (299, '入库单详情', 2, 'com.liyuan.wms.wms.controller.WmsReceiptOrderDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/inDetail', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 14:51:05\",\"delFlag\":0,\"id\":6044,\"inQuantity\":588,\"itemId\":418,\"money\":999,\"params\":{},\"updateTime\":\"2024-06-15 15:56:25\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 15:56:25', 37);
INSERT INTO `sys_oper_log` VALUES (300, '入库单', 2, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 14:49:01\",\"delFlag\":0,\"depositor\":\"张三\",\"id\":1406,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-144612\",\"receiptOrderType\":1,\"updateTime\":\"2024-06-15 15:57:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 15:57:04', 43);
INSERT INTO `sys_oper_log` VALUES (301, '入库单详情', 2, 'com.liyuan.wms.wms.controller.WmsReceiptOrderDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/inDetail', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 14:51:05\",\"delFlag\":0,\"id\":6044,\"inQuantity\":588,\"itemId\":418,\"money\":999,\"params\":{},\"updateTime\":\"2024-06-15 15:57:04\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 15:57:04', 45);
INSERT INTO `sys_oper_log` VALUES (302, '入库单', 2, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 14:49:01\",\"delFlag\":0,\"depositor\":\"张三\",\"id\":1406,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-144612\",\"receiptOrderType\":1,\"updateTime\":\"2024-06-15 15:57:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 15:57:39', 31);
INSERT INTO `sys_oper_log` VALUES (303, '入库单详情', 2, 'com.liyuan.wms.wms.controller.WmsReceiptOrderDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/inDetail', '192.168.10.21', '内网IP', '{\"areaId\":678,\"createTime\":\"2024-06-15 14:51:05\",\"delFlag\":0,\"id\":6044,\"inQuantity\":588,\"itemId\":418,\"money\":999,\"params\":{},\"rackId\":128,\"updateTime\":\"2024-06-15 15:57:39\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 15:57:39', 29);
INSERT INTO `sys_oper_log` VALUES (304, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:29:01\",\"depositor\":\"张三\",\"id\":1408,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-162828\",\"receiptOrderStatus\":1,\"receiptOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:29:00', 49);
INSERT INTO `sys_oper_log` VALUES (305, '入库单详情', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderDetailController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inDetail', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:29:01\",\"id\":6045,\"inQuantity\":20,\"itemId\":421,\"money\":452,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-162828\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:29:00', 108);
INSERT INTO `sys_oper_log` VALUES (306, '入库单详情', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderDetailController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inDetail', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:29:01\",\"id\":6047,\"inQuantity\":50,\"itemId\":418,\"money\":10,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-162828\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:29:00', 137);
INSERT INTO `sys_oper_log` VALUES (307, '入库单详情', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderDetailController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inDetail', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:29:01\",\"id\":6046,\"inQuantity\":40,\"itemId\":419,\"money\":20,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-162828\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:29:00', 137);
INSERT INTO `sys_oper_log` VALUES (308, '入库单详情', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderDetailController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inDetail', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:29:01\",\"id\":6048,\"inQuantity\":30,\"itemId\":420,\"money\":320,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-162828\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:29:00', 143);
INSERT INTO `sys_oper_log` VALUES (309, '入库单', 2, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:29:01\",\"delFlag\":0,\"depositor\":\"张三\",\"id\":1408,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-162828\",\"receiptOrderStatus\":1,\"receiptOrderType\":1,\"updateTime\":\"2024-06-15 16:31:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:31:01', 43);
INSERT INTO `sys_oper_log` VALUES (310, '入库单详情', 2, 'com.liyuan.wms.wms.controller.WmsReceiptOrderDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/inDetail', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:29:01\",\"delFlag\":0,\"id\":6048,\"inQuantity\":30,\"itemId\":420,\"money\":320,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-162828\",\"updateTime\":\"2024-06-15 16:31:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:31:01', 42);
INSERT INTO `sys_oper_log` VALUES (311, '入库单', 2, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:29:01\",\"delFlag\":0,\"depositor\":\"张三\",\"id\":1408,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-162828\",\"receiptOrderStatus\":1,\"receiptOrderType\":1,\"updateTime\":\"2024-06-15 16:33:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:33:02', 51);
INSERT INTO `sys_oper_log` VALUES (312, '入库单详情', 2, 'com.liyuan.wms.wms.controller.WmsReceiptOrderDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/inDetail', '192.168.10.21', '内网IP', '{\"areaId\":678,\"createTime\":\"2024-06-15 16:29:01\",\"delFlag\":0,\"id\":6048,\"inQuantity\":30,\"itemId\":420,\"money\":320,\"params\":{},\"rackId\":128,\"receiptOrderNo\":\"R-2024-06-15-162828\",\"updateTime\":\"2024-06-15 16:33:02\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:33:02', 45);
INSERT INTO `sys_oper_log` VALUES (313, '入库单', 2, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:29:01\",\"delFlag\":0,\"depositor\":\"张三\",\"id\":1408,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-162828\",\"receiptOrderStatus\":1,\"receiptOrderType\":1,\"updateTime\":\"2024-06-15 16:33:12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:33:12', 46);
INSERT INTO `sys_oper_log` VALUES (314, '入库单详情', 2, 'com.liyuan.wms.wms.controller.WmsReceiptOrderDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/inDetail', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:29:01\",\"delFlag\":0,\"id\":6048,\"inQuantity\":30,\"itemId\":420,\"money\":320,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-162828\",\"updateTime\":\"2024-06-15 16:33:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:33:12', 44);
INSERT INTO `sys_oper_log` VALUES (315, '入库单', 2, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:29:01\",\"delFlag\":0,\"depositor\":\"张三\",\"id\":1408,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-162828\",\"receiptOrderStatus\":1,\"receiptOrderType\":1,\"updateTime\":\"2024-06-15 16:34:26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:34:25', 33);
INSERT INTO `sys_oper_log` VALUES (316, '入库单详情', 2, 'com.liyuan.wms.wms.controller.WmsReceiptOrderDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/inDetail', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:29:01\",\"delFlag\":0,\"id\":6048,\"inQuantity\":30,\"itemId\":420,\"money\":320,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-162828\",\"updateTime\":\"2024-06-15 16:34:26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:34:25', 32);
INSERT INTO `sys_oper_log` VALUES (317, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:51:24\",\"depositor\":\"王五\",\"id\":1409,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-165059\",\"receiptOrderStatus\":1,\"receiptOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:51:23', 59);
INSERT INTO `sys_oper_log` VALUES (318, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:51:36\",\"depositor\":\"王五\",\"id\":1410,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-165059\",\"receiptOrderStatus\":1,\"receiptOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:51:36', 44);
INSERT INTO `sys_oper_log` VALUES (319, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:55:04\",\"depositor\":\"王虎\",\"id\":1411,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-165446\",\"receiptOrderStatus\":1,\"receiptOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:55:04', 41);
INSERT INTO `sys_oper_log` VALUES (320, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:55:21\",\"depositor\":\"王虎\",\"id\":1412,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-165446\",\"receiptOrderStatus\":1,\"receiptOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:55:32', 44);
INSERT INTO `sys_oper_log` VALUES (321, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-15 16:58:03\",\"depositor\":\"帐上来看\",\"id\":1413,\"params\":{},\"receiptOrderNo\":\"R-2024-06-15-165735\",\"receiptOrderStatus\":1,\"receiptOrderType\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-15 16:58:02', 61);
INSERT INTO `sys_oper_log` VALUES (322, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-17 14:45:38\",\"depositor\":\"沈芳\",\"id\":1414,\"params\":{},\"receiptOrderNo\":\"R-2024-06-17-144523\",\"receiptOrderStatus\":1,\"receiptOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 14:45:34', 57);
INSERT INTO `sys_oper_log` VALUES (323, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-17 15:04:20\",\"depositor\":\"上述\",\"id\":1415,\"params\":{},\"receiptOrderNo\":\"R-2024-06-17-150346\",\"receiptOrderStatus\":1,\"receiptOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 15:04:16', 39);
INSERT INTO `sys_oper_log` VALUES (324, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '192.168.10.21', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑出库单\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2009,\"path\":\"outorder\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 09:17:27', 76);
INSERT INTO `sys_oper_log` VALUES (325, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.10.21', '内网IP', '{\"children\":[],\"component\":\"wms/outorder/edit\",\"createTime\":\"2024-06-24 09:17:27\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"编辑出库单\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2009,\"path\":\"outorder\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 09:17:49', 64);
INSERT INTO `sys_oper_log` VALUES (326, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.10.21', '内网IP', '{\"children\":[],\"component\":\"wms/outorder/index\",\"createTime\":\"2024-04-28 14:43:36\",\"icon\":\"out\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"出库\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2009,\"path\":\"OutOrder\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 09:18:00', 55);
INSERT INTO `sys_oper_log` VALUES (327, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.10.21', '内网IP', '{\"children\":[],\"component\":\"wms/outorder/edit\",\"createTime\":\"2024-06-24 09:17:27\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"编辑出库单\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2009,\"path\":\"outorderedit\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 09:18:25', 76);
INSERT INTO `sys_oper_log` VALUES (328, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.10.21', '内网IP', '{\"children\":[],\"component\":\"wms/inorder/edit\",\"createTime\":\"2024-06-14 13:57:51\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"编辑入库单\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2009,\"path\":\"inorderedit\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 09:18:34', 64);
INSERT INTO `sys_oper_log` VALUES (329, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.10.21', '内网IP', '{\"children\":[],\"component\":\"wms/inorder/edit\",\"createTime\":\"2024-06-14 13:57:51\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"编辑入库单\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2009,\"path\":\"edit\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 09:19:33', 57);
INSERT INTO `sys_oper_log` VALUES (330, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.10.21', '内网IP', '{\"children\":[],\"component\":\"wms/outorder/edit\",\"createTime\":\"2024-06-24 09:17:27\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"编辑出库单\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2009,\"path\":\"edit\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 09:19:39', 55);
INSERT INTO `sys_oper_log` VALUES (331, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.10.21', '内网IP', '{\"children\":[],\"component\":\"wms/outorder/index\",\"createTime\":\"2024-04-28 14:43:36\",\"icon\":\"out\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"出库\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2009,\"path\":\"outorder\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 09:20:17', 54);
INSERT INTO `sys_oper_log` VALUES (332, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.10.21', '内网IP', '{\"children\":[],\"component\":\"wms/outorder/edit\",\"createTime\":\"2024-06-24 09:17:27\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"编辑出库单\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2009,\"path\":\"outedit\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 09:20:26', 70);
INSERT INTO `sys_oper_log` VALUES (333, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.10.21', '内网IP', '{\"children\":[],\"component\":\"wms/inorder/edit\",\"createTime\":\"2024-06-14 13:57:51\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"编辑入库单\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2009,\"path\":\"inedit\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 09:20:38', 54);
INSERT INTO `sys_oper_log` VALUES (334, '代码生成', 6, 'com.liyuan.wms.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '192.168.10.223', '内网IP', '{\"tables\":\"wms_shipment_order\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:18:02', 556);
INSERT INTO `sys_oper_log` VALUES (335, '代码生成', 2, 'com.liyuan.wms.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '192.168.10.223', '内网IP', '{\"businessName\":\"order\",\"className\":\"WmsShipmentOrder\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":88,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:18:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ShipmentOrderNo\",\"columnComment\":\"出库单号，系统自动生成\",\"columnId\":89,\"columnName\":\"shipment_order_no\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:18:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"shipmentOrderNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ShipmentOrderType\",\"columnComment\":\"出库类型\",\"columnId\":90,\"columnName\":\"shipment_order_type\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:18:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"shipmentOrderType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Recipient\",\"columnComment\":\"领取人\",\"columnId\":91,\"columnName\":\"recipient\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:18:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:19:42', 500);
INSERT INTO `sys_oper_log` VALUES (336, '代码生成', 8, 'com.liyuan.wms.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '192.168.10.223', '内网IP', '{\"tables\":\"wms_shipment_order\"}', NULL, 0, NULL, '2024-06-24 10:19:46', 150);
INSERT INTO `sys_oper_log` VALUES (337, '代码生成', 6, 'com.liyuan.wms.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '192.168.10.223', '内网IP', '{\"tables\":\"wms_shipment_order_detail\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:25:18', 698);
INSERT INTO `sys_oper_log` VALUES (338, '代码生成', 2, 'com.liyuan.wms.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '192.168.10.223', '内网IP', '{\"businessName\":\"shipmentDetail\",\"className\":\"WmsShipmentOrderDetail\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":100,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:25:17\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ShipmentOrderNo\",\"columnComment\":\"出库单编号\",\"columnId\":101,\"columnName\":\"shipment_order_no\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:25:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"shipmentOrderNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ItemId\",\"columnComment\":\"资产\",\"columnId\":102,\"columnName\":\"item_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:25:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"itemId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ShipmentQuantity\",\"columnComment\":\"出库数量\",\"columnId\":103,\"columnName\":\"shipment_quantity\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:25:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:30:40', 555);
INSERT INTO `sys_oper_log` VALUES (339, '代码生成', 8, 'com.liyuan.wms.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '192.168.10.223', '内网IP', '{\"tables\":\"wms_shipment_order_detail\"}', NULL, 0, NULL, '2024-06-24 10:30:44', 70);
INSERT INTO `sys_oper_log` VALUES (340, '字典类型', 1, 'com.liyuan.wms.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '192.168.10.21', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"出库类型\",\"dictType\":\"shipment_order_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:48:27', 62);
INSERT INTO `sys_oper_log` VALUES (341, '字典数据', 1, 'com.liyuan.wms.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '192.168.10.21', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"物资领取\",\"dictSort\":1,\"dictType\":\"shipment_order_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:48:37', 56);
INSERT INTO `sys_oper_log` VALUES (342, '字典数据', 1, 'com.liyuan.wms.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '192.168.10.21', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"活动领取\",\"dictSort\":2,\"dictType\":\"shipment_order_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:48:51', 60);
INSERT INTO `sys_oper_log` VALUES (343, '字典类型', 1, 'com.liyuan.wms.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '192.168.10.21', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"出库状态\",\"dictType\":\"shipment_order_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:49:26', 61);
INSERT INTO `sys_oper_log` VALUES (344, '字典数据', 1, 'com.liyuan.wms.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '192.168.10.21', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未出库\",\"dictSort\":1,\"dictType\":\"shipment_order_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:49:52', 61);
INSERT INTO `sys_oper_log` VALUES (345, '字典数据', 1, 'com.liyuan.wms.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '192.168.10.21', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"出库完成\",\"dictSort\":2,\"dictType\":\"shipment_order_status\",\"dictValue\":\"2\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:50:11', 57);
INSERT INTO `sys_oper_log` VALUES (346, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '192.168.10.21', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:49:52\",\"default\":false,\"dictCode\":112,\"dictLabel\":\"未出库\",\"dictSort\":1,\"dictType\":\"shipment_order_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 10:50:16', 63);
INSERT INTO `sys_oper_log` VALUES (347, '出库单详情', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderDetailController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outDetail', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-24 11:03:54\",\"id\":1,\"params\":{},\"shipmentOrderNo\":\"R-2024-06-24-110332\",\"shipmentOrderStatus\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 11:03:51', 40);
INSERT INTO `sys_oper_log` VALUES (348, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-24 11:12:32\",\"params\":{},\"recipient\":\"张三\",\"remark\":\"物资领取\",\"shipmentOrderNo\":\"R-2024-06-24-111203\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'update_time\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workspaces\\background\\LiyYuanWMS\\liyuanwms-wms\\target\\classes\\mapper\\wms\\WmsShipmentOrderMapper.xml]\r\n### The error may involve com.liyuan.wms.wms.mapper.WmsShipmentOrderMapper.insertWmsShipmentOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into wms_shipment_order          ( shipment_order_no,             shipment_order_type,             recipient,             shipment_order_status,                          remark,                          create_time )           values ( ?,             ?,             ?,             ?,                          ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'update_time\' doesn\'t have a default value\n; Field \'update_time\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'update_time\' doesn\'t have a default value', '2024-06-24 11:12:35', 5772);
INSERT INTO `sys_oper_log` VALUES (349, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-24 11:14:53\",\"params\":{},\"recipient\":\"张三\",\"remark\":\"物资领取\",\"shipmentOrderNo\":\"R-2024-06-24-111442\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'update_time\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workspaces\\background\\LiyYuanWMS\\liyuanwms-wms\\target\\classes\\mapper\\wms\\WmsShipmentOrderMapper.xml]\r\n### The error may involve com.liyuan.wms.wms.mapper.WmsShipmentOrderMapper.insertWmsShipmentOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into wms_shipment_order          ( shipment_order_no,             shipment_order_type,             recipient,             shipment_order_status,                          remark,                          create_time )           values ( ?,             ?,             ?,             ?,                          ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'update_time\' doesn\'t have a default value\n; Field \'update_time\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'update_time\' doesn\'t have a default value', '2024-06-24 11:14:51', 39);
INSERT INTO `sys_oper_log` VALUES (350, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-24 11:18:22\",\"params\":{},\"recipient\":\"张三\",\"remark\":\"物资领取\",\"shipmentOrderNo\":\"R-2024-06-24-111442\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'update_time\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workspaces\\background\\LiyYuanWMS\\liyuanwms-wms\\target\\classes\\mapper\\wms\\WmsShipmentOrderMapper.xml]\r\n### The error may involve com.liyuan.wms.wms.mapper.WmsShipmentOrderMapper.insertWmsShipmentOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into wms_shipment_order          ( shipment_order_no,             shipment_order_type,             recipient,             shipment_order_status,                          remark,                          create_time )           values ( ?,             ?,             ?,             ?,                          ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'update_time\' doesn\'t have a default value\n; Field \'update_time\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'update_time\' doesn\'t have a default value', '2024-06-24 11:18:19', 54);
INSERT INTO `sys_oper_log` VALUES (351, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-24 11:19:57\",\"depositor\":\"李四\",\"id\":1416,\"params\":{},\"receiptOrderNo\":\"R-2024-06-24-111943\",\"receiptOrderStatus\":1,\"receiptOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 11:20:09', 14821);
INSERT INTO `sys_oper_log` VALUES (352, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-24 11:22:42\",\"id\":1,\"params\":{},\"recipient\":\"张三\",\"shipmentOrderNo\":\"R-2024-06-24-112236\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 11:22:43', 3731);
INSERT INTO `sys_oper_log` VALUES (353, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-24 13:18:34\",\"id\":2,\"params\":{},\"recipient\":\"李晨\",\"shipmentOrderNo\":\"R-2024-06-24-131448\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 13:18:35', 61);
INSERT INTO `sys_oper_log` VALUES (354, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-24 13:44:06\",\"id\":3,\"params\":{},\"recipient\":\"望门\",\"shipmentOrderNo\":\"R-2024-06-24-134356\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 13:44:07', 44);
INSERT INTO `sys_oper_log` VALUES (355, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-24 13:57:38\",\"id\":4,\"params\":{},\"recipient\":\"王五\",\"shipmentOrderNo\":\"R-2024-06-24-135724\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 13:57:38', 54);
INSERT INTO `sys_oper_log` VALUES (356, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-24 14:01:21\",\"id\":5,\"params\":{},\"recipient\":\"王五\",\"shipmentOrderNo\":\"R-2024-06-24-135724\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 14:01:21', 65);
INSERT INTO `sys_oper_log` VALUES (357, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-24 14:19:41\",\"id\":6,\"params\":{},\"recipient\":\"里斯\",\"shipmentOrderNo\":\"R-2024-06-24-141926\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 14:19:41', 57);
INSERT INTO `sys_oper_log` VALUES (358, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-24 14:26:50\",\"id\":7,\"params\":{},\"recipient\":\"张三\",\"remark\":\"撒法发\",\"shipmentOrderNo\":\"R-2024-06-24-142635\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 14:26:50', 40);
INSERT INTO `sys_oper_log` VALUES (359, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-24 14:31:29\",\"id\":8,\"params\":{},\"recipient\":\"里斯\",\"shipmentOrderNo\":\"R-2024-06-24-143116\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 14:31:29', 40);
INSERT INTO `sys_oper_log` VALUES (360, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-24 14:33:02\",\"id\":9,\"params\":{},\"recipient\":\"坤坤\",\"shipmentOrderNo\":\"R-2024-06-24-143237\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 14:33:02', 40);
INSERT INTO `sys_oper_log` VALUES (361, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-24 14:35:05\",\"id\":10,\"params\":{},\"recipient\":\"里斯\",\"shipmentOrderNo\":\"R-2024-06-24-143452\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-24 14:35:05', 42);
INSERT INTO `sys_oper_log` VALUES (362, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-27 09:04:29\",\"id\":11,\"params\":{},\"recipient\":\"斯科拉计划\",\"shipmentOrderNo\":\"R-2024-06-27-090415\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-27 09:04:29', 60);
INSERT INTO `sys_oper_log` VALUES (363, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.10.21', '内网IP', '{\"children\":[],\"component\":\"wms/outorder/edit\",\"createTime\":\"2024-06-24 09:17:27\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"编辑出库单\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2009,\"path\":\"outedit\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-27 14:16:32', 70);
INSERT INTO `sys_oper_log` VALUES (364, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-27 14:33:49\",\"depositor\":\"赵银山\",\"id\":1417,\"params\":{},\"receiptOrderNo\":\"R-2024-06-27-143256\",\"receiptOrderStatus\":1,\"receiptOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-27 14:33:52', 3678);
INSERT INTO `sys_oper_log` VALUES (365, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-27 14:35:16\",\"id\":12,\"params\":{},\"recipient\":\"赵银山\",\"shipmentOrderNo\":\"R-2024-06-27-143456\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-27 14:35:16', 48);
INSERT INTO `sys_oper_log` VALUES (366, '代码生成', 8, 'com.liyuan.wms.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '192.168.10.21', '内网IP', '{\"tables\":\"wms_shipment_order\"}', NULL, 0, NULL, '2024-06-27 16:32:27', 143);
INSERT INTO `sys_oper_log` VALUES (367, '代码生成', 2, 'com.liyuan.wms.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '192.168.10.223', '内网IP', '{\"businessName\":\"shipmentDetail\",\"className\":\"WmsShipmentOrderDetail\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":100,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:25:17\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:30:40\",\"usableColumn\":false},{\"capJavaField\":\"ShipmentOrderNo\",\"columnComment\":\"出库单编号\",\"columnId\":101,\"columnName\":\"shipment_order_no\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:25:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"shipmentOrderNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:30:40\",\"usableColumn\":false},{\"capJavaField\":\"ItemId\",\"columnComment\":\"资产\",\"columnId\":102,\"columnName\":\"item_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:25:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"itemId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-06-24 10:30:40\",\"usableColumn\":false},{\"capJavaField\":\"ShipmentQuantity\",\"columnComment\":\"出库数量\",\"columnId\":103,\"columnName\":\"shipment_quantity\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:25:17\",\"dictType\":\"\",\"edit\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-27 16:44:47', 677);
INSERT INTO `sys_oper_log` VALUES (368, '代码生成', 8, 'com.liyuan.wms.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '192.168.10.223', '内网IP', '{\"tables\":\"wms_shipment_order_detail\"}', NULL, 0, NULL, '2024-06-27 16:44:53', 83);
INSERT INTO `sys_oper_log` VALUES (369, '代码生成', 2, 'com.liyuan.wms.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '192.168.10.223', '内网IP', '{\"businessName\":\"shipmentDetail\",\"className\":\"WmsShipmentOrderDetail\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":100,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:25:17\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-06-27 16:44:46\",\"usableColumn\":false},{\"capJavaField\":\"ShipmentOrderNo\",\"columnComment\":\"出库单编号\",\"columnId\":101,\"columnName\":\"shipment_order_no\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:25:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"shipmentOrderNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-06-27 16:44:46\",\"usableColumn\":false},{\"capJavaField\":\"ItemId\",\"columnComment\":\"资产\",\"columnId\":102,\"columnName\":\"item_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:25:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"itemId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-06-27 16:44:46\",\"usableColumn\":false},{\"capJavaField\":\"ShipmentQuantity\",\"columnComment\":\"出库数量\",\"columnId\":103,\"columnName\":\"shipment_quantity\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:25:17\",\"dictType\":\"\",\"edit\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-27 16:45:59', 457);
INSERT INTO `sys_oper_log` VALUES (370, '代码生成', 8, 'com.liyuan.wms.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '192.168.10.223', '内网IP', '{\"tables\":\"wms_shipment_order_detail\"}', NULL, 0, NULL, '2024-06-27 16:48:38', 73);
INSERT INTO `sys_oper_log` VALUES (371, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-28 11:00:23\",\"depositor\":\"李斯\",\"id\":1418,\"params\":{},\"receiptOrderNo\":\"R-2024-06-28-110010\",\"receiptOrderStatus\":1,\"receiptOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 11:00:22', 56);
INSERT INTO `sys_oper_log` VALUES (372, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-28 15:21:41\",\"depositor\":\"卡酷卡\",\"id\":1419,\"params\":{},\"receiptOrderNo\":\"R-2024-06-28-152123\",\"receiptOrderStatus\":1,\"receiptOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 15:21:40', 38);
INSERT INTO `sys_oper_log` VALUES (373, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-28 15:22:00\",\"depositor\":\"张三\",\"id\":1420,\"params\":{},\"receiptOrderNo\":\"R-2024-06-28-152151\",\"receiptOrderStatus\":1,\"receiptOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 15:21:59', 35);
INSERT INTO `sys_oper_log` VALUES (374, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-06-28 15:22:40\",\"depositor\":\"清水湾\",\"id\":1421,\"params\":{},\"receiptOrderNo\":\"R-2024-06-28-152227\",\"receiptOrderStatus\":1,\"receiptOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 15:22:39', 35);
INSERT INTO `sys_oper_log` VALUES (375, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '192.168.10.21', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:48:37\",\"default\":false,\"dictCode\":110,\"dictLabel\":\"物资领取\",\"dictSort\":1,\"dictType\":\"shipment_order_type\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 15:26:06', 53);
INSERT INTO `sys_oper_log` VALUES (376, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '192.168.10.21', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-06-24 10:48:51\",\"default\":false,\"dictCode\":111,\"dictLabel\":\"活动领取\",\"dictSort\":2,\"dictType\":\"shipment_order_type\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-28 15:26:09', 57);
INSERT INTO `sys_oper_log` VALUES (377, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-07-08 11:01:14\",\"depositor\":\"沈芳\",\"id\":1422,\"params\":{},\"receiptOrderNo\":\"R-2024-07-08-110100\",\"receiptOrderStatus\":1,\"receiptOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 11:01:10', 76);
INSERT INTO `sys_oper_log` VALUES (378, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '192.168.10.21', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-28 16:04:34\",\"default\":false,\"dictCode\":106,\"dictLabel\":\"劳保用品\",\"dictSort\":0,\"dictType\":\"receipt_order_type\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 11:02:25', 61);
INSERT INTO `sys_oper_log` VALUES (379, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '192.168.10.21', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-28 16:37:14\",\"default\":false,\"dictCode\":109,\"dictLabel\":\"行政仓库\",\"dictSort\":0,\"dictType\":\"receipt_order_type\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 11:02:41', 55);
INSERT INTO `sys_oper_log` VALUES (380, '字典数据', 1, 'com.liyuan.wms.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '192.168.10.21', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"酒水仓库\",\"dictSort\":4,\"dictType\":\"receipt_order_type\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 11:02:58', 63);
INSERT INTO `sys_oper_log` VALUES (381, '字典数据', 2, 'com.liyuan.wms.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '192.168.10.21', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-07-08 11:02:58\",\"default\":false,\"dictCode\":114,\"dictLabel\":\"酒水仓库\",\"dictSort\":4,\"dictType\":\"receipt_order_type\",\"dictValue\":\"4\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 11:03:08', 66);
INSERT INTO `sys_oper_log` VALUES (382, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-07-08 11:03:56\",\"id\":13,\"params\":{},\"recipient\":\"沈芳\",\"shipmentOrderNo\":\"R-2024-07-08-110332\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 11:03:52', 62);
INSERT INTO `sys_oper_log` VALUES (383, '字典数据', 1, 'com.liyuan.wms.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '192.168.10.21', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"会议领取\",\"dictSort\":3,\"dictType\":\"shipment_order_type\",\"dictValue\":\"3\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-08 11:05:43', 59);
INSERT INTO `sys_oper_log` VALUES (384, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.223', '内网IP', '{\"createTime\":\"2024-07-22 10:01:48\",\"id\":14,\"params\":{},\"recipient\":\"张三\",\"shipmentOrderNo\":\"R-2024-07-22-100131\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:01:44', 42);
INSERT INTO `sys_oper_log` VALUES (385, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.223', '内网IP', '{\"createTime\":\"2024-07-22 10:17:07\",\"id\":15,\"params\":{},\"recipient\":\"李四\",\"shipmentOrderNo\":\"R-2024-07-22-101653\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:17:04', 76);
INSERT INTO `sys_oper_log` VALUES (386, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.223', '内网IP', '{\"createTime\":\"2024-07-22 10:27:38\",\"id\":16,\"params\":{},\"recipient\":\"张思思\",\"shipmentOrderNo\":\"R-2024-07-22-102719\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:27:35', 53);
INSERT INTO `sys_oper_log` VALUES (387, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.223', '内网IP', '{\"createTime\":\"2024-07-22 10:29:14\",\"id\":17,\"params\":{},\"recipient\":\"张张\",\"shipmentOrderNo\":\"R-2024-07-22-102902\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:29:11', 41);
INSERT INTO `sys_oper_log` VALUES (388, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-08 17:01:55\",\"delFlag\":false,\"itemTypeId\":443,\"orderNum\":1,\"params\":{},\"parentId\":0,\"status\":true,\"typeName\":\"行政用品\",\"updateTime\":\"2024-07-22 10:32:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:32:36', 54);
INSERT INTO `sys_oper_log` VALUES (389, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-08 17:04:31\",\"delFlag\":false,\"itemTypeId\":444,\"orderNum\":1,\"params\":{},\"parentId\":0,\"status\":true,\"typeName\":\"固定资产\",\"updateTime\":\"2024-07-22 10:32:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:32:49', 38);
INSERT INTO `sys_oper_log` VALUES (390, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-08 17:04:42\",\"delFlag\":false,\"itemTypeId\":445,\"orderNum\":1,\"params\":{},\"parentId\":444,\"status\":true,\"typeName\":\"笔记本电脑\",\"updateTime\":\"2024-07-22 10:33:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:33:07', 53);
INSERT INTO `sys_oper_log` VALUES (391, '资产类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-22 10:33:31\",\"itemTypeId\":457,\"orderNum\":1,\"params\":{},\"parentId\":444,\"status\":true,\"typeName\":\"显示屏\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:33:27', 46);
INSERT INTO `sys_oper_log` VALUES (392, '资产类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-22 10:33:40\",\"itemTypeId\":458,\"orderNum\":1,\"params\":{},\"parentId\":444,\"status\":true,\"typeName\":\"主机\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:33:37', 42);
INSERT INTO `sys_oper_log` VALUES (393, '资产类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-22 10:33:47\",\"itemTypeId\":459,\"orderNum\":1,\"params\":{},\"parentId\":444,\"status\":true,\"typeName\":\"键盘\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:33:43', 42);
INSERT INTO `sys_oper_log` VALUES (394, '资产类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-22 10:33:55\",\"itemTypeId\":460,\"orderNum\":1,\"params\":{},\"parentId\":444,\"status\":true,\"typeName\":\"鼠标\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:33:51', 41);
INSERT INTO `sys_oper_log` VALUES (395, '资产类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-22 10:34:03\",\"itemTypeId\":461,\"orderNum\":1,\"params\":{},\"parentId\":444,\"status\":true,\"typeName\":\"U盘\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:33:59', 43);
INSERT INTO `sys_oper_log` VALUES (396, '资产类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-22 10:34:11\",\"itemTypeId\":462,\"orderNum\":1,\"params\":{},\"parentId\":444,\"status\":true,\"typeName\":\"移动硬盘\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:34:08', 85);
INSERT INTO `sys_oper_log` VALUES (397, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-09 09:07:10\",\"delFlag\":false,\"itemTypeId\":449,\"orderNum\":1,\"params\":{},\"parentId\":0,\"status\":true,\"typeName\":\"办公用品\",\"updateTime\":\"2024-07-22 10:34:26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:34:23', 98);
INSERT INTO `sys_oper_log` VALUES (398, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-09 09:07:19\",\"delFlag\":false,\"itemTypeId\":450,\"orderNum\":1,\"params\":{},\"parentId\":0,\"status\":true,\"typeName\":\"消耗品\",\"updateTime\":\"2024-07-22 10:34:34\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:34:31', 52);
INSERT INTO `sys_oper_log` VALUES (399, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-09 09:07:29\",\"delFlag\":false,\"itemTypeId\":451,\"orderNum\":1,\"params\":{},\"parentId\":0,\"status\":true,\"typeName\":\"劳保用品\",\"updateTime\":\"2024-07-22 10:34:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:34:41', 36);
INSERT INTO `sys_oper_log` VALUES (400, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-08 17:57:22\",\"delFlag\":false,\"itemTypeId\":447,\"orderNum\":1,\"params\":{},\"parentId\":451,\"status\":true,\"typeName\":\"工作服\",\"updateTime\":\"2024-07-22 10:34:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:34:48', 40);
INSERT INTO `sys_oper_log` VALUES (401, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-09 09:07:37\",\"delFlag\":false,\"itemTypeId\":452,\"orderNum\":1,\"params\":{},\"parentId\":0,\"status\":true,\"typeName\":\"保洁用品\",\"updateTime\":\"2024-07-22 10:35:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:34:58', 35);
INSERT INTO `sys_oper_log` VALUES (402, '资产类型', 3, 'com.liyuan.wms.wms.controller.WmsItemTypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/wms/itemType/453', '192.168.10.223', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:35:00', 43);
INSERT INTO `sys_oper_log` VALUES (403, '资产类型', 3, 'com.liyuan.wms.wms.controller.WmsItemTypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/wms/itemType/454', '192.168.10.223', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:35:02', 38);
INSERT INTO `sys_oper_log` VALUES (404, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-09 08:59:54\",\"delFlag\":false,\"itemTypeId\":448,\"orderNum\":1,\"params\":{},\"parentId\":442,\"status\":true,\"typeName\":\"红酒\",\"updateTime\":\"2024-07-22 10:35:16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:35:13', 41);
INSERT INTO `sys_oper_log` VALUES (405, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-28 15:59:19\",\"delFlag\":false,\"itemTypeId\":455,\"orderNum\":1,\"params\":{},\"parentId\":442,\"status\":true,\"typeName\":\"白酒\",\"updateTime\":\"2024-07-22 10:35:23\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:35:19', 41);
INSERT INTO `sys_oper_log` VALUES (406, '资产类型', 2, 'com.liyuan.wms.wms.controller.WmsItemTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"ancestors\":\"\",\"children\":[],\"createTime\":\"2024-04-28 16:06:40\",\"delFlag\":false,\"itemTypeId\":456,\"orderNum\":1,\"params\":{},\"parentId\":442,\"status\":true,\"typeName\":\"黄酒\",\"updateTime\":\"2024-07-22 10:35:32\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:35:29', 41);
INSERT INTO `sys_oper_log` VALUES (407, '资产类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-22 10:35:40\",\"itemTypeId\":463,\"orderNum\":1,\"params\":{},\"parentId\":442,\"status\":true,\"typeName\":\"啤酒\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:35:36', 42);
INSERT INTO `sys_oper_log` VALUES (408, '资产类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-22 10:35:46\",\"itemTypeId\":464,\"orderNum\":1,\"params\":{},\"parentId\":442,\"status\":true,\"typeName\":\"饮料\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:35:43', 243);
INSERT INTO `sys_oper_log` VALUES (409, '资产类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-22 10:35:51\",\"itemTypeId\":465,\"orderNum\":1,\"params\":{},\"parentId\":442,\"status\":true,\"typeName\":\"香烟\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:35:48', 43);
INSERT INTO `sys_oper_log` VALUES (410, '资产类型', 1, 'com.liyuan.wms.wms.controller.WmsItemTypeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/itemType', '192.168.10.223', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-22 10:35:57\",\"itemTypeId\":466,\"orderNum\":1,\"params\":{},\"parentId\":442,\"status\":true,\"typeName\":\"茶叶\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:35:54', 42);
INSERT INTO `sys_oper_log` VALUES (411, '资产', 1, 'com.liyuan.wms.wms.controller.WmsItemController.add()', 'POST', 1, 'admin', '研发部门', '/wms/item', '192.168.10.223', '内网IP', '{\"areaId\":681,\"createTime\":\"2024-07-22 10:53:35\",\"expiryDate\":\"2024-07-31\",\"id\":422,\"itemName\":\"雪花啤酒\",\"itemNo\":\"TK-202342\",\"itemType\":463,\"params\":{},\"productionDate\":\"2024-07-22\",\"rackId\":0,\"unit\":\"箱\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:53:32', 64);
INSERT INTO `sys_oper_log` VALUES (412, '资产', 1, 'com.liyuan.wms.wms.controller.WmsItemController.add()', 'POST', 1, 'admin', '研发部门', '/wms/item', '192.168.10.223', '内网IP', '{\"areaId\":681,\"createTime\":\"2024-07-22 10:54:16\",\"expiryDate\":\"2024-07-27\",\"id\":423,\"itemName\":\"崂山啤酒\",\"itemNo\":\"TK-203423\",\"itemType\":463,\"params\":{},\"productionDate\":\"2024-07-22\",\"rackId\":0,\"unit\":\"箱\",\"warehouseId\":559}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:54:13', 55);
INSERT INTO `sys_oper_log` VALUES (413, '入库单', 1, 'com.liyuan.wms.wms.controller.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/inOrder', '192.168.10.223', '内网IP', '{\"createTime\":\"2024-07-22 10:54:40\",\"depositor\":\"张三\",\"id\":1423,\"params\":{},\"receiptOrderNo\":\"R-2024-07-22-105421\",\"receiptOrderStatus\":1,\"receiptOrderType\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:54:37', 38);
INSERT INTO `sys_oper_log` VALUES (414, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.223', '内网IP', '{\"createTime\":\"2024-07-22 10:58:03\",\"id\":18,\"params\":{},\"recipient\":\"李四\",\"shipmentOrderNo\":\"R-2024-07-22-105748\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:57:59', 43);
INSERT INTO `sys_oper_log` VALUES (415, '出库单', 1, 'com.liyuan.wms.wms.controller.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.223', '内网IP', '{\"createTime\":\"2024-07-22 10:59:38\",\"id\":19,\"params\":{},\"recipient\":\"李四\",\"shipmentOrderNo\":\"R-2024-07-22-105926\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 10:59:35', 41);
INSERT INTO `sys_oper_log` VALUES (416, '部门管理', 2, 'com.liyuan.wms.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '192.168.10.223', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"力源科技\",\"email\":\"ly@qq.com\",\"leader\":\"admin\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 11:04:55', 85);
INSERT INTO `sys_oper_log` VALUES (417, '部门管理', 3, 'com.liyuan.wms.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '192.168.10.223', '内网IP', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2024-07-22 11:05:00', 19);
INSERT INTO `sys_oper_log` VALUES (418, '部门管理', 3, 'com.liyuan.wms.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/108', '192.168.10.223', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 11:05:02', 81);
INSERT INTO `sys_oper_log` VALUES (419, '部门管理', 3, 'com.liyuan.wms.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/109', '192.168.10.223', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 11:05:06', 69);
INSERT INTO `sys_oper_log` VALUES (420, '部门管理', 3, 'com.liyuan.wms.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '192.168.10.223', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 11:05:07', 91);
INSERT INTO `sys_oper_log` VALUES (421, '部门管理', 2, 'com.liyuan.wms.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '192.168.10.223', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"技术部\",\"email\":\"ly@qq.com\",\"leader\":\"admin\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"力源科技\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 11:05:40', 182);
INSERT INTO `sys_oper_log` VALUES (422, '部门管理', 2, 'com.liyuan.wms.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '192.168.10.223', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"技术研发部\",\"email\":\"ry@qq.com\",\"leader\":\"admin\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"技术部\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 11:06:16', 168);
INSERT INTO `sys_oper_log` VALUES (423, '出库单', 1, 'com.liyuan.wms.web.controller.wms.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.223', '内网IP', '{\"createTime\":\"2024-07-22 11:38:55\",\"deptId\":103,\"id\":20,\"params\":{},\"recipient\":\"李四\",\"shipmentOrderNo\":\"R-2024-07-22-113729\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 11:38:51', 47);
INSERT INTO `sys_oper_log` VALUES (424, '出库单', 1, 'com.liyuan.wms.web.controller.wms.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.223', '内网IP', '{\"createTime\":\"2024-07-22 11:41:05\",\"deptId\":103,\"id\":21,\"params\":{},\"recipient\":\"王五\",\"shipmentOrderNo\":\"R-2024-07-22-114038\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 11:41:38', 44539);
INSERT INTO `sys_oper_log` VALUES (425, '出库单', 1, 'com.liyuan.wms.web.controller.wms.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '研发部门', '/wms/outOrder', '192.168.10.223', '内网IP', '{\"createTime\":\"2024-07-22 11:42:00\",\"deptId\":103,\"id\":22,\"params\":{},\"recipient\":\"王五\",\"shipmentOrderNo\":\"R-2024-07-22-114038\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 11:41:57', 2873);
INSERT INTO `sys_oper_log` VALUES (426, '入库单', 1, 'com.liyuan.wms.web.controller.wms.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '技术研发部', '/wms/inOrder', '192.168.10.223', '内网IP', '{\"createTime\":\"2024-07-22 13:36:57\",\"depositor\":\"张三\",\"id\":1424,\"params\":{},\"receiptOrderNo\":\"R-2024-07-22-133644\",\"receiptOrderStatus\":1,\"receiptOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 13:36:54', 59);
INSERT INTO `sys_oper_log` VALUES (427, '出库单', 1, 'com.liyuan.wms.web.controller.wms.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '技术研发部', '/wms/outOrder', '192.168.10.223', '内网IP', '{\"createTime\":\"2024-07-22 13:45:57\",\"deptId\":104,\"id\":23,\"params\":{},\"recipient\":\"张山\",\"shipmentOrderNo\":\"R-2024-07-22-134536\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 13:45:54', 46);
INSERT INTO `sys_oper_log` VALUES (428, '入库单', 1, 'com.liyuan.wms.web.controller.wms.WmsReceiptOrderController.add()', 'POST', 1, 'admin', '技术研发部', '/wms/inOrder', '192.168.10.21', '内网IP', '{\"createTime\":\"2024-07-22 13:52:53\",\"depositor\":\"李斯\",\"id\":1425,\"params\":{},\"receiptOrderNo\":\"R-2024-07-22-135238\",\"receiptOrderStatus\":1,\"receiptOrderType\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 13:52:50', 48);
INSERT INTO `sys_oper_log` VALUES (429, '角色管理', 1, 'com.liyuan.wms.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '技术研发部', '/system/role', '192.168.10.223', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,109,1046,1047,1048,2009,2011,2010,2012,2013,2000,2001,2005,2004,2006,2008,2007,2002,2003],\"params\":{},\"roleId\":100,\"roleKey\":\"hr\",\"roleName\":\"hr\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 13:58:08', 182);
INSERT INTO `sys_oper_log` VALUES (430, '用户管理', 1, 'com.liyuan.wms.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '技术研发部', '/system/user', '192.168.10.223', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"沈芳\",\"params\":{},\"postIds\":[3],\"roleIds\":[100],\"sex\":\"1\",\"status\":\"0\",\"userId\":100,\"userName\":\"shenfang\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 13:59:03', 229);
INSERT INTO `sys_oper_log` VALUES (431, '角色管理', 2, 'com.liyuan.wms.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '技术研发部', '/system/role', '192.168.10.223', '内网IP', '{\"admin\":false,\"createTime\":\"2024-07-22 13:58:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,109,1046,1047,1048,2009,2011,2010,2012,2013,2000,2001,2005,2004,2006,2008,2007,2002,2003],\"params\":{},\"roleId\":100,\"roleKey\":\"hr\",\"roleName\":\"hr\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:01:41', 188);
INSERT INTO `sys_oper_log` VALUES (432, '角色管理', 2, 'com.liyuan.wms.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '技术研发部', '/system/role', '192.168.10.223', '内网IP', '{\"admin\":false,\"createTime\":\"2024-07-22 13:58:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,109,1046,1047,1048,2009,2011,2010,2012,2013,2000,2001,2005,2004,2006,2008,2007,2002,2003],\"params\":{},\"roleId\":100,\"roleKey\":\"hr\",\"roleName\":\"hr\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:02:58', 186);
INSERT INTO `sys_oper_log` VALUES (433, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":0,\"params\":{},\"parentId\":2002,\"perms\":\"wms:item:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:03:41', 60);
INSERT INTO `sys_oper_log` VALUES (434, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"perms\":\"wms:item:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:03:55', 58);
INSERT INTO `sys_oper_log` VALUES (435, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"perms\":\"wms:item:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:04:09', 62);
INSERT INTO `sys_oper_log` VALUES (436, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增仓库\",\"menuType\":\"F\",\"orderNum\":0,\"params\":{},\"parentId\":2003,\"perms\":\"wms:warehouse:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:05:11', 56);
INSERT INTO `sys_oper_log` VALUES (437, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改仓库\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"perms\":\"wms:warehouse:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:05:33', 53);
INSERT INTO `sys_oper_log` VALUES (438, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除仓库\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2003,\"perms\":\"wms:warehouse:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:05:51', 54);
INSERT INTO `sys_oper_log` VALUES (439, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"库区列表\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2003,\"perms\":\"wms:area:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:06:30', 56);
INSERT INTO `sys_oper_log` VALUES (440, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增库区\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2003,\"perms\":\"wms:area:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:06:50', 54);
INSERT INTO `sys_oper_log` VALUES (441, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询库区\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2003,\"perms\":\"wms:area:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:07:10', 54);
INSERT INTO `sys_oper_log` VALUES (442, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询仓库\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2003,\"perms\":\"wms:warehouse:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:07:35', 54);
INSERT INTO `sys_oper_log` VALUES (443, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改库区\",\"menuType\":\"F\",\"orderNum\":7,\"params\":{},\"parentId\":2003,\"perms\":\"wms:area:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:07:58', 57);
INSERT INTO `sys_oper_log` VALUES (444, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除库区\",\"menuType\":\"F\",\"orderNum\":8,\"params\":{},\"parentId\":2003,\"perms\":\"wms:area:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:08:14', 54);
INSERT INTO `sys_oper_log` VALUES (445, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"货架列表\",\"menuType\":\"F\",\"orderNum\":9,\"params\":{},\"parentId\":2003,\"perms\":\"wms:rack:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:08:31', 54);
INSERT INTO `sys_oper_log` VALUES (446, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询货架\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2003,\"perms\":\"wms:rack:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:09:55', 53);
INSERT INTO `sys_oper_log` VALUES (447, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增货架\",\"menuType\":\"F\",\"orderNum\":11,\"params\":{},\"parentId\":2003,\"perms\":\"wms:rack:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:10:10', 54);
INSERT INTO `sys_oper_log` VALUES (448, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改货架\",\"menuType\":\"F\",\"orderNum\":12,\"params\":{},\"parentId\":2003,\"perms\":\"wms:rack:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:10:33', 57);
INSERT INTO `sys_oper_log` VALUES (449, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除货架\",\"menuType\":\"F\",\"orderNum\":13,\"params\":{},\"parentId\":2016,\"perms\":\"wms:rack:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:10:53', 56);
INSERT INTO `sys_oper_log` VALUES (450, '菜单管理', 3, 'com.liyuan.wms.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '技术研发部', '/system/menu/2030', '192.168.10.223', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:11:06', 68);
INSERT INTO `sys_oper_log` VALUES (451, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除货架\",\"menuType\":\"F\",\"orderNum\":13,\"params\":{},\"parentId\":2003,\"perms\":\"wms:rack:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:11:32', 54);
INSERT INTO `sys_oper_log` VALUES (452, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询资产\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2002,\"perms\":\"wms:item:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:11:52', 56);
INSERT INTO `sys_oper_log` VALUES (453, '角色管理', 2, 'com.liyuan.wms.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '技术研发部', '/system/role', '192.168.10.223', '内网IP', '{\"admin\":false,\"createTime\":\"2024-07-22 13:58:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,109,1046,1047,1048,2009,2011,2010,2012,2013,2000,2001,2005,2004,2006,2008,2007,2002,2014,2015,2016,2032,2003,2017,2018,2019,2021,2020,2022,2023,2024,2025,2026,2027,2028,2029,2031],\"params\":{},\"roleId\":100,\"roleKey\":\"hr\",\"roleName\":\"hr\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:12:19', 186);
INSERT INTO `sys_oper_log` VALUES (454, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"列表-入库单\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2011,\"perms\":\"wms:inOrder:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:47:57', 44);
INSERT INTO `sys_oper_log` VALUES (455, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询-入库单\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2011,\"perms\":\"wms:inOrder:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:48:24', 46);
INSERT INTO `sys_oper_log` VALUES (456, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增-入库单\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2011,\"perms\":\"wms:inOrder:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:48:43', 45);
INSERT INTO `sys_oper_log` VALUES (457, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改-入库单\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2011,\"perms\":\"wms:inOrder:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:49:01', 45);
INSERT INTO `sys_oper_log` VALUES (458, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除-入库单\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2011,\"perms\":\"wms:inOrder:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:49:16', 45);
INSERT INTO `sys_oper_log` VALUES (459, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"列表-出库单详情\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2011,\"perms\":\"wms:inDetail:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:51:12', 59);
INSERT INTO `sys_oper_log` VALUES (460, '菜单管理', 2, 'com.liyuan.wms.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-22 14:51:12\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2038,\"menuName\":\"列表-入库单详情\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2011,\"path\":\"\",\"perms\":\"wms:inDetail:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:51:26', 50);
INSERT INTO `sys_oper_log` VALUES (461, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询-入库单详情\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2011,\"perms\":\"wms:inDetail:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:51:43', 46);
INSERT INTO `sys_oper_log` VALUES (462, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增-入库单详情\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2011,\"perms\":\"wms:inDetail:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:52:07', 46);
INSERT INTO `sys_oper_log` VALUES (463, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改-入库单详情\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2011,\"perms\":\"wms:inDetail:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:52:25', 48);
INSERT INTO `sys_oper_log` VALUES (464, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除-入库单详情\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2011,\"perms\":\"wms:inDetail:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 14:52:48', 44);
INSERT INTO `sys_oper_log` VALUES (465, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"列表-出库单\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2010,\"perms\":\"wms:outOrder:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 15:03:42', 71);
INSERT INTO `sys_oper_log` VALUES (466, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"增-出库单\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2010,\"perms\":\"wms:outOrder:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 15:04:07', 45);
INSERT INTO `sys_oper_log` VALUES (467, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删-出库单\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2010,\"perms\":\"wms:outOrder:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 15:04:30', 53);
INSERT INTO `sys_oper_log` VALUES (468, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"改-出库单\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2010,\"perms\":\"wms:outOrder:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 15:04:44', 44);
INSERT INTO `sys_oper_log` VALUES (469, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查-出库单\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2010,\"perms\":\"wms:outOrder:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 15:05:00', 49);
INSERT INTO `sys_oper_log` VALUES (470, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"列表-出库详情\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2010,\"perms\":\"wms:outDetail:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 15:05:38', 43);
INSERT INTO `sys_oper_log` VALUES (471, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"增-出库详情\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2010,\"perms\":\"wms:outDetail:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 15:06:12', 51);
INSERT INTO `sys_oper_log` VALUES (472, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删-出库详情\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2010,\"perms\":\"wms:outDetail:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 15:06:31', 44);
INSERT INTO `sys_oper_log` VALUES (473, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"改-出库详情\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2010,\"perms\":\"wms:outDetail:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 15:06:45', 69);
INSERT INTO `sys_oper_log` VALUES (474, '菜单管理', 1, 'com.liyuan.wms.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '技术研发部', '/system/menu', '192.168.10.223', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查-出库详情\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2010,\"perms\":\"wms:outDetail:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 15:07:00', 46);
INSERT INTO `sys_oper_log` VALUES (475, '角色管理', 2, 'com.liyuan.wms.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '技术研发部', '/system/role', '192.168.10.223', '内网IP', '{\"admin\":false,\"createTime\":\"2024-07-22 13:58:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,109,1046,1047,1048,2009,2011,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2010,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2012,2013,2000,2001,2005,2004,2006,2008,2007,2002,2014,2015,2016,2032,2003,2017,2018,2019,2021,2020,2022,2023,2024,2025,2026,2027,2028,2029,2031],\"params\":{},\"roleId\":100,\"roleKey\":\"hr\",\"roleName\":\"hr\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 15:07:18', 187);
INSERT INTO `sys_oper_log` VALUES (476, '角色管理', 2, 'com.liyuan.wms.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '技术研发部', '/system/role', '192.168.10.223', '内网IP', '{\"admin\":false,\"createTime\":\"2024-07-22 13:58:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,2,1000,103,1016,1017,1018,1019,109,1046,1047,1048,2009,2011,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2010,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2012,2013,2000,2001,2005,2004,2006,2008,2007,2002,2014,2015,2016,2032,2003,2017,2018,2019,2021,2020,2022,2023,2024,2025,2026,2027,2028,2029,2031],\"params\":{},\"roleId\":100,\"roleKey\":\"hr\",\"roleName\":\"hr\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 15:09:02', 175);
INSERT INTO `sys_oper_log` VALUES (477, '用户管理', 3, 'com.liyuan.wms.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '技术研发部', '/system/user/2', '192.168.10.223', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 15:11:20', 131);
INSERT INTO `sys_oper_log` VALUES (478, '角色管理', 3, 'com.liyuan.wms.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '技术研发部', '/system/role/2', '192.168.10.223', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 15:11:25', 176);
INSERT INTO `sys_oper_log` VALUES (479, '出库单', 1, 'com.liyuan.wms.web.controller.wms.WmsShipmentOrderController.add()', 'POST', 1, 'admin', '技术研发部', '/wms/outOrder', '192.168.10.223', '内网IP', '{\"createTime\":\"2024-07-22 15:31:48\",\"deptId\":105,\"id\":24,\"params\":{},\"recipient\":\"张三\",\"shipmentOrderNo\":\"R-2024-07-22-153131\",\"shipmentOrderStatus\":1,\"shipmentOrderType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-22 15:31:45', 39);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-04-07 09:43:45', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-04-07 09:43:45', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-04-07 09:43:45', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '2', 'admin', '2024-04-07 09:43:45', 'admin', '2024-04-07 09:50:07', '普通角色');
INSERT INTO `sys_role` VALUES (100, 'hr', 'hr', 3, '1', 1, 1, '0', '0', 'admin', '2024-07-22 13:58:08', 'admin', '2024-07-22 15:09:02', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2024);
INSERT INTO `sys_role_menu` VALUES (100, 2025);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2027);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2035);
INSERT INTO `sys_role_menu` VALUES (100, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2037);
INSERT INTO `sys_role_menu` VALUES (100, 2038);
INSERT INTO `sys_role_menu` VALUES (100, 2039);
INSERT INTO `sys_role_menu` VALUES (100, 2040);
INSERT INTO `sys_role_menu` VALUES (100, 2041);
INSERT INTO `sys_role_menu` VALUES (100, 2042);
INSERT INTO `sys_role_menu` VALUES (100, 2043);
INSERT INTO `sys_role_menu` VALUES (100, 2044);
INSERT INTO `sys_role_menu` VALUES (100, 2045);
INSERT INTO `sys_role_menu` VALUES (100, 2046);
INSERT INTO `sys_role_menu` VALUES (100, 2047);
INSERT INTO `sys_role_menu` VALUES (100, 2048);
INSERT INTO `sys_role_menu` VALUES (100, 2049);
INSERT INTO `sys_role_menu` VALUES (100, 2050);
INSERT INTO `sys_role_menu` VALUES (100, 2051);
INSERT INTO `sys_role_menu` VALUES (100, 2052);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '192.168.10.223', '2024-07-22 15:23:22', 'admin', '2024-04-07 09:43:45', '', '2024-07-22 15:23:18', '管理员');
INSERT INTO `sys_user` VALUES (100, 103, 'shenfang', '沈芳', '00', '', '', '1', '', '$2a$10$xMG1iSKUD.7aLCW/.HX/tO2UGZrdRNEML7oHzP2MGYzF25Ie/b0m.', '0', '0', '192.168.10.223', '2024-07-22 15:09:17', 'admin', '2024-07-22 13:59:03', '', '2024-07-22 15:09:13', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (100, 3);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 100);

-- ----------------------------
-- Table structure for wms_area
-- ----------------------------
DROP TABLE IF EXISTS `wms_area`;
CREATE TABLE `wms_area`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `area_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `warehouse_id` bigint(20) NOT NULL COMMENT '所属仓库ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 687 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库区' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_area
-- ----------------------------
INSERT INTO `wms_area` VALUES (678, 'EK-1451-UI', '二楼生产车间库区', 559, '二楼生产车间库区', 0, NULL, '2024-04-08 09:07:45.000', NULL, '2024-04-08 10:37:01.899');
INSERT INTO `wms_area` VALUES (680, 'EK-12311', '四楼库区啊', 559, NULL, 0, NULL, '2024-04-08 09:09:02.248', NULL, NULL);
INSERT INTO `wms_area` VALUES (681, 'EK-12343', '五楼库区啊啊', 559, NULL, 0, NULL, '2024-04-08 09:09:19.386', NULL, NULL);
INSERT INTO `wms_area` VALUES (682, 'EK0321321', 'sfdaf', 559, NULL, 0, NULL, '2024-04-08 09:09:26.900', NULL, NULL);
INSERT INTO `wms_area` VALUES (684, 'EK-1k-111', '二号楼四楼库区A', 560, NULL, 0, NULL, '2024-04-08 09:39:47.679', NULL, NULL);
INSERT INTO `wms_area` VALUES (685, 'EK-AKAK', '库区11', 559, NULL, 0, NULL, '2024-04-28 16:18:38.055', NULL, NULL);
INSERT INTO `wms_area` VALUES (686, 'AAAA', '库区BB', 559, NULL, 0, NULL, '2024-04-28 16:18:46.806', NULL, NULL);

-- ----------------------------
-- Table structure for wms_inventory
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory`;
CREATE TABLE `wms_inventory`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) NOT NULL COMMENT '物料ID',
  `rack_id` bigint(20) NULL DEFAULT NULL COMMENT '货架id',
  `quantity` decimal(20, 2) NULL DEFAULT NULL COMMENT '库存',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 918 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_inventory
-- ----------------------------

-- ----------------------------
-- Table structure for wms_item
-- ----------------------------
DROP TABLE IF EXISTS `wms_item`;
CREATE TABLE `wms_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `item_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `specification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
  `item_type` bigint(20) NULL DEFAULT NULL COMMENT '分类',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位类别',
  `unit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `rack_id` bigint(20) NULL DEFAULT NULL COMMENT '所属货架',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '所属库区',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `quantity` bigint(20) NULL DEFAULT 0 COMMENT '安全库存',
  `production_date` datetime(3) NULL DEFAULT NULL COMMENT '生产日期',
  `expiry_date` datetime(3) NULL DEFAULT NULL COMMENT '有效期',
  `batch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批次',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 424 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资产' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_item
-- ----------------------------
INSERT INTO `wms_item` VALUES (422, 'TK-202342', '雪花啤酒', NULL, 463, '箱', NULL, 0, 681, 559, 350, '2024-07-22 00:00:00.000', '2024-07-31 00:00:00.000', NULL, 0, NULL, NULL, '2024-07-22 10:53:35.531', NULL, '2024-07-22 13:52:57.492');
INSERT INTO `wms_item` VALUES (423, 'TK-203423', '崂山啤酒', NULL, 463, '箱', NULL, 0, 681, 559, 350, '2024-07-22 00:00:00.000', '2024-07-27 00:00:00.000', NULL, 0, NULL, NULL, '2024-07-22 10:54:16.782', NULL, '2024-07-22 13:53:06.269');

-- ----------------------------
-- Table structure for wms_item_type
-- ----------------------------
DROP TABLE IF EXISTS `wms_item_type`;
CREATE TABLE `wms_item_type`  (
  `item_type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资产类型id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父资产类型id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `type_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类型名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '类型状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`item_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 467 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资产类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_item_type
-- ----------------------------
INSERT INTO `wms_item_type` VALUES (442, 0, '', '酒水', 1, '1', '0', NULL, '2024-04-08 16:11:21.000', NULL, '2024-04-28 15:58:53.920');
INSERT INTO `wms_item_type` VALUES (443, 0, '', '行政用品', 1, '1', '0', NULL, '2024-04-08 17:01:55.000', NULL, '2024-07-22 10:32:39.582');
INSERT INTO `wms_item_type` VALUES (444, 0, '', '固定资产', 1, '1', '0', NULL, '2024-04-08 17:04:31.000', NULL, '2024-07-22 10:32:52.938');
INSERT INTO `wms_item_type` VALUES (445, 444, '', '笔记本电脑', 1, '1', '0', NULL, '2024-04-08 17:04:42.000', NULL, '2024-07-22 10:33:10.811');
INSERT INTO `wms_item_type` VALUES (447, 451, '', '工作服', 1, '1', '0', NULL, '2024-04-08 17:57:22.000', NULL, '2024-07-22 10:34:52.003');
INSERT INTO `wms_item_type` VALUES (448, 442, '', '红酒', 1, '1', '0', NULL, '2024-04-09 08:59:54.000', NULL, '2024-07-22 10:35:16.815');
INSERT INTO `wms_item_type` VALUES (449, 0, '', '办公用品', 1, '1', '0', NULL, '2024-04-09 09:07:10.000', NULL, '2024-07-22 10:34:26.824');
INSERT INTO `wms_item_type` VALUES (450, 0, '', '消耗品', 1, '1', '0', NULL, '2024-04-09 09:07:19.000', NULL, '2024-07-22 10:34:34.730');
INSERT INTO `wms_item_type` VALUES (451, 0, '', '劳保用品', 1, '1', '0', NULL, '2024-04-09 09:07:29.000', NULL, '2024-07-22 10:34:44.774');
INSERT INTO `wms_item_type` VALUES (452, 0, '', '保洁用品', 1, '1', '0', NULL, '2024-04-09 09:07:37.000', NULL, '2024-07-22 10:35:02.138');
INSERT INTO `wms_item_type` VALUES (455, 442, '', '白酒', 1, '1', '0', NULL, '2024-04-28 15:59:19.000', NULL, '2024-07-22 10:35:23.234');
INSERT INTO `wms_item_type` VALUES (456, 442, '', '黄酒', 1, '1', '0', NULL, '2024-04-28 16:06:40.000', NULL, '2024-07-22 10:35:32.878');
INSERT INTO `wms_item_type` VALUES (457, 444, '', '显示屏', 1, '1', '0', NULL, '2024-07-22 10:33:31.168', NULL, NULL);
INSERT INTO `wms_item_type` VALUES (458, 444, '', '主机', 1, '1', '0', NULL, '2024-07-22 10:33:40.941', NULL, NULL);
INSERT INTO `wms_item_type` VALUES (459, 444, '', '键盘', 1, '1', '0', NULL, '2024-07-22 10:33:47.451', NULL, NULL);
INSERT INTO `wms_item_type` VALUES (460, 444, '', '鼠标', 1, '1', '0', NULL, '2024-07-22 10:33:55.253', NULL, NULL);
INSERT INTO `wms_item_type` VALUES (461, 444, '', 'U盘', 1, '1', '0', NULL, '2024-07-22 10:34:03.504', NULL, NULL);
INSERT INTO `wms_item_type` VALUES (462, 444, '', '移动硬盘', 1, '1', '0', NULL, '2024-07-22 10:34:11.648', NULL, NULL);
INSERT INTO `wms_item_type` VALUES (463, 442, '', '啤酒', 1, '1', '0', NULL, '2024-07-22 10:35:40.205', NULL, NULL);
INSERT INTO `wms_item_type` VALUES (464, 442, '', '饮料', 1, '1', '0', NULL, '2024-07-22 10:35:46.577', NULL, NULL);
INSERT INTO `wms_item_type` VALUES (465, 442, '', '香烟', 1, '1', '0', NULL, '2024-07-22 10:35:51.693', NULL, NULL);
INSERT INTO `wms_item_type` VALUES (466, 442, '', '茶叶', 1, '1', '0', NULL, '2024-07-22 10:35:57.939', NULL, NULL);

-- ----------------------------
-- Table structure for wms_rack
-- ----------------------------
DROP TABLE IF EXISTS `wms_rack`;
CREATE TABLE `wms_rack`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rack_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `rack_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `area_id` bigint(20) NOT NULL COMMENT '所属库区',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '所属仓库',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '货架' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_rack
-- ----------------------------
INSERT INTO `wms_rack` VALUES (128, 'AK-31211', '四楼一号屋子-E5货架', 678, NULL, NULL, 0, NULL, '2024-04-15 14:07:42.000', NULL, '2024-04-15 14:12:24.721');

-- ----------------------------
-- Table structure for wms_receipt_order
-- ----------------------------
DROP TABLE IF EXISTS `wms_receipt_order`;
CREATE TABLE `wms_receipt_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receipt_order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库单号',
  `receipt_order_type` int(11) NULL DEFAULT NULL COMMENT '入库类型',
  `receipt_order_status` tinyint(4) NULL DEFAULT NULL COMMENT '入库状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  `wave_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '波次号',
  `depositor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1426 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '入库单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_receipt_order
-- ----------------------------
INSERT INTO `wms_receipt_order` VALUES (1424, 'R-2024-07-22-133644', 1, 2, NULL, 0, NULL, '2024-07-22 13:36:57.387', NULL, '2024-07-22 13:37:04.303', NULL, '张三');
INSERT INTO `wms_receipt_order` VALUES (1425, 'R-2024-07-22-135238', 4, 2, NULL, 0, NULL, '2024-07-22 13:52:53.740', NULL, '2024-07-22 13:53:06.375', NULL, '李斯');

-- ----------------------------
-- Table structure for wms_receipt_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_receipt_order_detail`;
CREATE TABLE `wms_receipt_order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receipt_order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库单号',
  `item_id` bigint(20) NULL DEFAULT NULL COMMENT '资产',
  `in_quantity` bigint(20) NULL DEFAULT NULL COMMENT '入库数量',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  `receipt_order_status` tinyint(4) NULL DEFAULT NULL COMMENT '入库状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6085 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '入库单详情' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_receipt_order_detail
-- ----------------------------
INSERT INTO `wms_receipt_order_detail` VALUES (6081, 'R-2024-07-22-133644', 422, 200, NULL, 0, NULL, NULL, '2024-07-22 13:36:57.000', NULL, '2024-07-22 13:37:04.091', 2);
INSERT INTO `wms_receipt_order_detail` VALUES (6082, 'R-2024-07-22-133644', 423, 200, NULL, 0, NULL, NULL, '2024-07-22 13:36:57.000', NULL, '2024-07-22 13:37:04.225', 2);
INSERT INTO `wms_receipt_order_detail` VALUES (6083, 'R-2024-07-22-135238', 422, 10, NULL, 0, NULL, NULL, '2024-07-22 13:52:53.000', NULL, '2024-07-22 13:52:57.528', 2);
INSERT INTO `wms_receipt_order_detail` VALUES (6084, 'R-2024-07-22-135238', 423, 10, NULL, 0, NULL, NULL, '2024-07-22 13:52:53.000', NULL, '2024-07-22 13:53:06.304', 2);

-- ----------------------------
-- Table structure for wms_shipment_order
-- ----------------------------
DROP TABLE IF EXISTS `wms_shipment_order`;
CREATE TABLE `wms_shipment_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `shipment_order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库单号，系统自动生成',
  `shipment_order_type` int(11) NULL DEFAULT NULL COMMENT '出库类型',
  `recipient` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领取人',
  `shipment_order_status` tinyint(4) NULL DEFAULT NULL COMMENT '出库单状态',
  `wave_no` varchar(62) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '波次号',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_falg` tinyint(4) NULL DEFAULT 0 COMMENT '删除标记',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '领取部门',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_shipment_order
-- ----------------------------
INSERT INTO `wms_shipment_order` VALUES (23, 'R-2024-07-22-134536', 1, '张山', 2, NULL, NULL, NULL, '2024-07-22 13:45:58', NULL, '2024-07-22 13:51:12', 0, 104);
INSERT INTO `wms_shipment_order` VALUES (24, 'R-2024-07-22-153131', 1, '张三', 1, NULL, NULL, NULL, '2024-07-22 15:31:49', NULL, NULL, 0, 105);

-- ----------------------------
-- Table structure for wms_shipment_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_shipment_order_detail`;
CREATE TABLE `wms_shipment_order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `shipment_order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库单编号',
  `item_id` bigint(20) NULL DEFAULT NULL COMMENT '资产',
  `shipment_quantity` bigint(20) NULL DEFAULT NULL COMMENT '出库数量',
  `shipment_order_status` tinyint(4) NULL DEFAULT NULL COMMENT '出库状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库单详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_shipment_order_detail
-- ----------------------------
INSERT INTO `wms_shipment_order_detail` VALUES (40, 'R-2024-07-22-134536', 422, 20, 2, NULL, NULL, '2024-07-22 13:45:58', NULL, '2024-07-22 13:51:11', 0);
INSERT INTO `wms_shipment_order_detail` VALUES (41, 'R-2024-07-22-134536', 423, 20, 2, NULL, NULL, '2024-07-22 13:45:58', NULL, '2024-07-22 13:51:12', 0);
INSERT INTO `wms_shipment_order_detail` VALUES (42, 'R-2024-07-22-153131', 422, 10, 1, NULL, NULL, '2024-07-22 15:31:49', NULL, NULL, 0);
INSERT INTO `wms_shipment_order_detail` VALUES (43, 'R-2024-07-22-153131', 423, 10, 1, NULL, NULL, '2024-07-22 15:31:49', NULL, NULL, 0);

-- ----------------------------
-- Table structure for wms_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `wms_warehouse`;
CREATE TABLE `wms_warehouse`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `warehouse_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `warehouse_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 564 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '仓库' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_warehouse
-- ----------------------------
INSERT INTO `wms_warehouse` VALUES (559, 'AKK-4324-BB', '四楼氢能-A', 0, '四楼氢能-A', NULL, '2024-04-07 16:48:25.000', NULL, '2024-04-15 09:58:37.021');
INSERT INTO `wms_warehouse` VALUES (560, '#0asdfas01', '二号楼四楼', 0, NULL, NULL, '2024-04-07 16:49:31.388', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (561, '#arafaa-adsaf111', '二楼流水线', 0, NULL, NULL, '2024-04-07 18:06:28.652', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (562, '0adfsa', '二号楼仓库', 0, NULL, NULL, '2024-04-08 09:18:27.820', NULL, NULL);
INSERT INTO `wms_warehouse` VALUES (563, '#NK-AA', '三号楼AA', 0, NULL, NULL, '2024-04-08 13:32:44.408', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
