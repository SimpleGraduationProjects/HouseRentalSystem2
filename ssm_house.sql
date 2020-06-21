/*
Navicat MySQL Data Transfer

Source Server         : 47.107.227.121
Source Server Version : 50562
Source Host           : 47.107.227.121:3306
Source Database       : ssm_house

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2020-06-21 10:35:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for complain
-- ----------------------------
DROP TABLE IF EXISTS `complain`;
CREATE TABLE `complain` (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '报修id',
  `create_time` datetime NOT NULL,
  `customer_id` int(50) NOT NULL,
  `info` varchar(50) DEFAULT NULL COMMENT '描述',
  `title` varchar(50) DEFAULT NULL COMMENT '名称',
  `complainstatus` varchar(255) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='销售表';

-- ----------------------------
-- Records of complain
-- ----------------------------
INSERT INTO `complain` VALUES ('2', '2020-05-28 20:00:00', '2', '漏水', '绿化带水管漏了', '未处理');
INSERT INTO `complain` VALUES ('3', '2020-05-28 20:00:00', '2', '不能用了', '绿化带水管漏了', '未处理');
INSERT INTO `complain` VALUES ('8', '2020-05-28 00:00:00', '1', '不能用了', '绿化带水管漏了', '已处理');
INSERT INTO `complain` VALUES ('9', '2020-05-04 00:00:00', '2', '不能用了', '绿化带水管漏了', '已处理');
INSERT INTO `complain` VALUES ('21', '2020-05-10 22:20:09', '1', '555', '555', '未处理');
INSERT INTO `complain` VALUES ('22', '2020-05-11 13:56:26', '11', '小区噪音太大', '噪音', '未处理');
INSERT INTO `complain` VALUES ('23', '2020-05-11 00:00:00', '11', '小区噪音太大', '噪音', '已处理');

-- ----------------------------
-- Table structure for cost
-- ----------------------------
DROP TABLE IF EXISTS `cost`;
CREATE TABLE `cost` (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '付款id',
  `room_id` int(10) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `money` decimal(18,2) DEFAULT NULL,
  `paytype` varchar(50) DEFAULT NULL,
  `customer_id` int(50) NOT NULL,
  `info` varchar(50) DEFAULT NULL,
  `costname` varchar(50) DEFAULT NULL COMMENT '缴费名称',
  `costnumber` varchar(255) DEFAULT NULL COMMENT '数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='销售表';

-- ----------------------------
-- Records of cost
-- ----------------------------
INSERT INTO `cost` VALUES ('2', '2', '2020-05-28 20:00:00', '2000.00', '银行卡', '2', '已支付', '2020年1月电费', '200', '10.00');
INSERT INTO `cost` VALUES ('3', '2', '2020-05-28 20:00:00', '70.00', '现金', '2', '已退款', '2020年1月住宿费', '1', '70.00');
INSERT INTO `cost` VALUES ('4', '1', '2020-05-28 20:00:00', '70.00', '现金', '1', '已退款', '2020年2月住宿费', '1', '70.00');
INSERT INTO `cost` VALUES ('8', '17', '2020-05-28 20:00:00', '70.00', '现金', '1', '已退款', '2020年6月住宿费', '1', '70.00');
INSERT INTO `cost` VALUES ('9', '2', '2020-05-04 00:00:00', '70.00', '现金', '2', '已退款', '2020年7月住宿费', '1', '70.00');
INSERT INTO `cost` VALUES ('17', '3', '2020-05-10 00:00:00', '11.00', '现金', '3', '已退款', '111', '1', '11.00');
INSERT INTO `cost` VALUES ('18', '3', '2020-04-11 00:00:00', '210.00', '支票', '3', '待支付', '电费', '100', '2.10');
INSERT INTO `cost` VALUES ('20', '7', '2020-05-20 00:00:00', '1200.00', '现金', '12', '待支付', '电费', '100', '12.00');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `info` varchar(50) DEFAULT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `loginpassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='学生表';

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '张四', '男', '18', '13166665555', '无', 'test', '123456');
INSERT INTO `customer` VALUES ('2', '李三', '女', '18', '13344443335', '无', 'test2', '111111');
INSERT INTO `customer` VALUES ('3', '孙小小', '女', '18', '15444443333', '无', 'test3', '111111');
INSERT INTO `customer` VALUES ('10', '小明', '男', '14', '15957106484', '123', 'xm', '111111');
INSERT INTO `customer` VALUES ('11', '小王', '男', '34', '1234567890', '111111', 'xw', '111111');
INSERT INTO `customer` VALUES ('12', '小朱', '男', '14', '15957106484', '普通用户', 'zt', '111111');
INSERT INTO `customer` VALUES ('13', '张三', '男', '23', '12345667893', '123', '1234', '1234');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `number` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='部门表';

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('2', '收费部', '1124');
INSERT INTO `dept` VALUES ('3', '维修部', '1125');
INSERT INTO `dept` VALUES ('6', '后勤部', '1589172414033');
INSERT INTO `dept` VALUES ('7', '总部', '1589618487718');

-- ----------------------------
-- Table structure for education
-- ----------------------------
DROP TABLE IF EXISTS `education`;
CREATE TABLE `education` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学历id',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='学历表';

-- ----------------------------
-- Records of education
-- ----------------------------
INSERT INTO `education` VALUES ('1', '小学');
INSERT INTO `education` VALUES ('2', '初中');
INSERT INTO `education` VALUES ('3', '高中');
INSERT INTO `education` VALUES ('4', '中专');
INSERT INTO `education` VALUES ('5', '大专');
INSERT INTO `education` VALUES ('6', '本科');
INSERT INTO `education` VALUES ('7', '硕士研究生');
INSERT INTO `education` VALUES ('8', '博士研究生');
INSERT INTO `education` VALUES ('9', '博士后');

-- ----------------------------
-- Table structure for floor
-- ----------------------------
DROP TABLE IF EXISTS `floor`;
CREATE TABLE `floor` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `name` varchar(50) DEFAULT NULL,
  `info` varchar(5000) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  `addressLat` varchar(255) DEFAULT NULL,
  `addressLon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Records of floor
-- ----------------------------
INSERT INTO `floor` VALUES ('1', '新新小区6楼', '建于XXXX年', 'no', '113.015796', '28.091014');
INSERT INTO `floor` VALUES ('2', '湖畔小区2号楼', '建于XXXX年', 'no', '113.015796', '28.091014');
INSERT INTO `floor` VALUES ('3', '星月华庭3号楼', '建于XXXX年', 'no', '113.015796', '28.091014');
INSERT INTO `floor` VALUES ('4', '星月华庭4号楼', '建于XXXX年', 'no', '113.015796', '28.091014');
INSERT INTO `floor` VALUES ('5', '星月华庭5号楼', '建于XXXX年', 'no', '113.015796', '28.091014');
INSERT INTO `floor` VALUES ('6', '星月华庭6号楼', '建于XXXX年', 'no', '113.015796', '28.091014');
INSERT INTO `floor` VALUES ('7', '江干区桃李苑1幢', '学生生活区', null, '113.015796', '28.091014');
INSERT INTO `floor` VALUES ('13', '江干区成蹊苑51幢', '学生生活区', null, '113.015796', '28.091014');
INSERT INTO `floor` VALUES ('14', '广东省广州市越秀区越秀区北京路', 'rqe', null, '113.015796', '28.091014');
INSERT INTO `floor` VALUES ('15', '湖南省长沙市雨花区洞和路与高升路交叉口东南200米上海爱葛尼湖南销售服务中心', 'qew', null, '113.015796', '28.091014');

-- ----------------------------
-- Table structure for national
-- ----------------------------
DROP TABLE IF EXISTS `national`;
CREATE TABLE `national` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '民族id',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='民族表';

-- ----------------------------
-- Records of national
-- ----------------------------
INSERT INTO `national` VALUES ('1', '汉族');
INSERT INTO `national` VALUES ('2', '回族');
INSERT INTO `national` VALUES ('3', '哈萨克族');
INSERT INTO `national` VALUES ('4', '东乡族');
INSERT INTO `national` VALUES ('5', '维吾尔族');
INSERT INTO `national` VALUES ('6', '撒拉族');
INSERT INTO `national` VALUES ('7', '保安族');
INSERT INTO `national` VALUES ('8', '土族');
INSERT INTO `national` VALUES ('9', '壮族');
INSERT INTO `national` VALUES ('10', '布依族');
INSERT INTO `national` VALUES ('11', '彝族');
INSERT INTO `national` VALUES ('12', '水族');
INSERT INTO `national` VALUES ('13', '苗族');
INSERT INTO `national` VALUES ('14', '俄罗斯族');
INSERT INTO `national` VALUES ('15', '朝鲜族');
INSERT INTO `national` VALUES ('16', '蒙古族');
INSERT INTO `national` VALUES ('17', '裕固族');
INSERT INTO `national` VALUES ('18', '满族');
INSERT INTO `national` VALUES ('19', '瑶族');
INSERT INTO `national` VALUES ('20', '高山族');
INSERT INTO `national` VALUES ('21', '藏族');
INSERT INTO `national` VALUES ('22', '羌族');
INSERT INTO `national` VALUES ('23', '塔吉克族');
INSERT INTO `national` VALUES ('24', '黎族');
INSERT INTO `national` VALUES ('25', '侗族');
INSERT INTO `national` VALUES ('26', '仡佬族');
INSERT INTO `national` VALUES ('27', '傣族');
INSERT INTO `national` VALUES ('28', '哈尼族');
INSERT INTO `national` VALUES ('29', '佤族');
INSERT INTO `national` VALUES ('30', '纳西族');
INSERT INTO `national` VALUES ('31', '门巴族');
INSERT INTO `national` VALUES ('32', '乌孜别克族');
INSERT INTO `national` VALUES ('33', '基诺族');
INSERT INTO `national` VALUES ('34', '德昂族');
INSERT INTO `national` VALUES ('35', '塔塔尔族');
INSERT INTO `national` VALUES ('36', '鄂伦春族');
INSERT INTO `national` VALUES ('37', '布朗族');
INSERT INTO `national` VALUES ('38', '赫哲族');
INSERT INTO `national` VALUES ('39', '怒族');
INSERT INTO `national` VALUES ('40', '普米族');
INSERT INTO `national` VALUES ('41', '达翰尔族');
INSERT INTO `national` VALUES ('42', '锡伯族');
INSERT INTO `national` VALUES ('43', '毛南族');
INSERT INTO `national` VALUES ('44', '景颇族');
INSERT INTO `national` VALUES ('45', '珞巴族');
INSERT INTO `national` VALUES ('46', '京族');
INSERT INTO `national` VALUES ('47', '阿昌族');
INSERT INTO `national` VALUES ('48', '仫佬族');
INSERT INTO `national` VALUES ('49', '塔塔尔族');
INSERT INTO `national` VALUES ('50', '拉祜族');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='新闻公告表';

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '关于“元旦“放假的通知', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">各职能部门，各教学、教辅及附属单位：<span class=\"bjh-br\"></span></span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">根据国家法定节假日放假的有关规定，结合学校的工作实际，现将元旦放假及有关事项通知如下：</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">一、放假安排</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">12月30日—1月1日放假调休，共3天。1月2日(星期三)正常上班。教学安排由教务处统筹。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">二、相关事项</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">请各单位安排好值班人员，做好防火防盗等安全工作，并将值班表于12月29日前将电子版发送至@163.com，附属医院参照执行。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">此通知</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\"><span class=\"bjh-br\"></span></span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\"><span class=\"bjh-br\"></span></span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\"><span class=\"bjh-br\"></span></span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\"><span class=\"bjh-br\"></span></span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">12月25日</span></p><p><br/></p>', '1', '2020-05-14 18:17:39');
INSERT INTO `news` VALUES ('2', '劳动的目的是为了更美好的生活', '<p></p><p>当然当然，我这里说的都是笼统的情况，肯定有很多小伙伴会举出很多反例，比如正式工在减少，合同工在增加，毕竟资本家总能找到方法残害社畜。</p><p>但是我想说的是，现在大家可以转变思维，不要认为人均鹿小葵就解决一切问题。那些高精尖企业可以加班，他们高投入，高产出，高回报，而且很有成就感。</p><p>但这种头部企业不多的，大多数企业没必要996，对自己，对员工，甚至对国家经济都没什么好处。加出个泡沫经济，害人害己。</p><p>现在把劳动者们从无效劳动中解放出来，让他们充实自己……</p><p>或者消费报国！去撸串、去搞对象、去马杀鸡、去买买买。</p><p>少加班，多消费，心情好，不生病，不拖累国家的医保金，真的是超级爱国典范！</p><p>然后大家静心等待下一轮经济景气。</p><p>大家也不用担心中国人懒了，中国人很上进，但是没道理无效劳动。等到下一波景气到来的时候，大家又会重新披挂上阵的。</p><p>我也呼吁二流报纸多替劳动者发声，劳动的目的是为了更美好的生活，劳动的目的不是为了死亡。</p><p><br/></p>', '1', '2020-05-06 09:10:38');
INSERT INTO `news` VALUES ('3', '停水通知', '<p></p><p>当然当然，我这里说的都是笼统的情况，肯定有很多小伙伴会举出很多反例，比如正式工在减少，合同工在增加，毕竟资本家总能找到方法残害社畜。</p><p>但是我想说的是，现在大家可以转变思维，不要认为人均鹿小葵就解决一切问题。那些高精尖企业可以加班，他们高投入，高产出，高回报，而且很有成就感。</p><p>但这种头部企业不多的，大多数企业没必要996，对自己，对员工，甚至对国家经济都没什么好处。加出个泡沫经济，害人害己。</p><p>现在把劳动者们从无效劳动中解放出来，让他们充实自己……</p><p>或者消费报国！去撸串、去搞对象、去马杀鸡、去买买买。</p><p>少加班，多消费，心情好，不生病，不拖累国家的医保金，真的是超级爱国典范！</p><p>然后大家静心等待下一轮经济景气。</p><p>大家也不用担心中国人懒了，中国人很上进，但是没道理无效劳动。等到下一波景气到来的时候，大家又会重新披挂上阵的。</p><p>我也呼吁二流报纸多替劳动者发声，劳动的目的是为了更美好的生活，劳动的目的不是为了死亡。</p><p><br/></p>', '1', '2020-05-06 09:10:38');
INSERT INTO `news` VALUES ('4', '停电通知', '<p></p><p>当然当然，我这里说的都是笼统的情况，肯定有很多小伙伴会举出很多反例，比如正式工在减少，合同工在增加，毕竟资本家总能找到方法残害社畜。</p><p>但是我想说的是，现在大家可以转变思维，不要认为人均鹿小葵就解决一切问题。那些高精尖企业可以加班，他们高投入，高产出，高回报，而且很有成就感。</p><p>但这种头部企业不多的，大多数企业没必要996，对自己，对员工，甚至对国家经济都没什么好处。加出个泡沫经济，害人害己。</p><p>现在把劳动者们从无效劳动中解放出来，让他们充实自己……</p><p>或者消费报国！去撸串、去搞对象、去马杀鸡、去买买买。</p><p>少加班，多消费，心情好，不生病，不拖累国家的医保金，真的是超级爱国典范！</p><p>然后大家静心等待下一轮经济景气。</p><p>大家也不用担心中国人懒了，中国人很上进，但是没道理无效劳动。等到下一波景气到来的时候，大家又会重新披挂上阵的。</p><p>我也呼吁二流报纸多替劳动者发声，劳动的目的是为了更美好的生活，劳动的目的不是为了死亡。</p><p><br/></p>', '1', '2020-05-06 09:10:38');
INSERT INTO `news` VALUES ('5', '收取年度住宿费用', '<p></p><p>当然当然，我这里说的都是笼统的情况，肯定有很多小伙伴会举出很多反例，比如正式工在减少，合同工在增加，毕竟资本家总能找到方法残害社畜。</p><p>但是我想说的是，现在大家可以转变思维，不要认为人均鹿小葵就解决一切问题。那些高精尖企业可以加班，他们高投入，高产出，高回报，而且很有成就感。</p><p>但这种头部企业不多的，大多数企业没必要996，对自己，对员工，甚至对国家经济都没什么好处。加出个泡沫经济，害人害己。</p><p>现在把劳动者们从无效劳动中解放出来，让他们充实自己……</p><p>或者消费报国！去撸串、去搞对象、去马杀鸡、去买买买。</p><p>少加班，多消费，心情好，不生病，不拖累国家的医保金，真的是超级爱国典范！</p><p>然后大家静心等待下一轮经济景气。</p><p>大家也不用担心中国人懒了，中国人很上进，但是没道理无效劳动。等到下一波景气到来的时候，大家又会重新披挂上阵的。</p><p>我也呼吁二流报纸多替劳动者发声，劳动的目的是为了更美好的生活，劳动的目的不是为了死亡。</p><p><br/></p>', '1', '2020-05-06 09:10:38');
INSERT INTO `news` VALUES ('6', '禁止外来人员入内的通知', '<p></p><p>当然当然，我这里说的都是笼统的情况，肯定有很多小伙伴会举出很多反例，比如正式工在减少，合同工在增加，毕竟资本家总能找到方法残害社畜。</p><p>但是我想说的是，现在大家可以转变思维，不要认为人均鹿小葵就解决一切问题。那些高精尖企业可以加班，他们高投入，高产出，高回报，而且很有成就感。</p><p>但这种头部企业不多的，大多数企业没必要996，对自己，对员工，甚至对国家经济都没什么好处。加出个泡沫经济，害人害己。</p><p>现在把劳动者们从无效劳动中解放出来，让他们充实自己……</p><p>或者消费报国！去撸串、去搞对象、去马杀鸡、去买买买。</p><p>少加班，多消费，心情好，不生病，不拖累国家的医保金，真的是超级爱国典范！</p><p>然后大家静心等待下一轮经济景气。</p><p>大家也不用担心中国人懒了，中国人很上进，但是没道理无效劳动。等到下一波景气到来的时候，大家又会重新披挂上阵的。</p><p>我也呼吁二流报纸多替劳动者发声，劳动的目的是为了更美好的生活，劳动的目的不是为了死亡。</p><p><br/></p>', '1', '2020-05-06 09:10:38');
INSERT INTO `news` VALUES ('7', '疫情', '<p>疫情端设备撒发不发就金山词霸上传在上传在市场局还是数据库刚开始&nbsp; &nbsp;金卡是个大快速的公司扩大&nbsp; 国家氨基酸冈萨加噶手机打开吧<br/></p>', '1', '2020-05-11 19:18:57');
INSERT INTO `news` VALUES ('8', '健康码', '<p>“电子健康卡是……”</p><p><br/></p><p>不管是在门诊区还是在住院区，这些问答声在怀化市中医院随时随地都能够听到。</p><p><br/></p><p>当前，新冠肺炎疫情防控工作进入到常态化防控时期，怀化市中医院为加强新冠肺炎疫情防控工作，保障医疗安全有序，不断加大“电子健康卡”的宣传工作，将查验“电子健康码”工作落实到每一个细小环节。</p><p><br/></p><p>温馨提示</p><p><br/></p><p>怀化市中医院温馨提示您:进入医院，请您佩戴好口罩，积极配合体温测量，提前申请【电子健康卡】，凭电子健康卡、有效身份证件有序就诊。主动告知国(境)外旅居史和接触史。</p><p><br/></p><p>一、 什么是电子健康码(卡)?</p><p><br/></p><p>电子健康码(卡)是虚拟化的居民健康卡，是居民健康卡的线上应用形式，是全省通用的医疗健康服务凭证，用电子健康码(卡)可以在全省医疗健康机构接受全流程医疗健康服务，可以实现个人健康管理。新冠肺炎疫情防控期间，电子健康卡二维码加载红、黄、绿三种颜色，分别提示新冠肺炎病毒可能暴露风险，分别对应高风险、中风险、低风险。</p><p><br/></p>', '1', '2020-05-19 13:35:31');

-- ----------------------------
-- Table structure for repair
-- ----------------------------
DROP TABLE IF EXISTS `repair`;
CREATE TABLE `repair` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `room_id` int(10) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `customer_id` int(50) NOT NULL,
  `info` varchar(50) DEFAULT NULL COMMENT '描述',
  `title` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `repairstatus` varchar(255) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='报修表';

-- ----------------------------
-- Records of repair
-- ----------------------------
INSERT INTO `repair` VALUES ('2', '1', '2020-05-28 20:00:00', '0', '漏水', '水管漏了', '未处理');
INSERT INTO `repair` VALUES ('3', '17', '2020-05-28 20:00:00', '0', '不能用了', '门坏了', '未处理');
INSERT INTO `repair` VALUES ('4', '1', '2020-05-28 00:00:00', '0', '不能用了1', '管漏了1', '未处理');
INSERT INTO `repair` VALUES ('8', '3', '2020-05-28 20:00:00', '0', '不能用了', '水管漏了', '未处理');
INSERT INTO `repair` VALUES ('9', '1', '2020-05-04 00:00:00', '0', '不能用了', '水管漏了', '已处理');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '房间id',
  `floor_id` int(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '房户型',
  `house` varchar(50) DEFAULT NULL COMMENT '房号',
  `unit` varchar(50) DEFAULT NULL COMMENT ' 层数',
  `standard` varchar(50) DEFAULT NULL COMMENT ' 规格面积',
  `info` varchar(50) DEFAULT NULL COMMENT '备注',
  `customer_id` int(50) DEFAULT NULL,
  `photo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='宿舍表';

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', '1', '一室一居', '101', '一层', '112.36', '', '1', '/upload/1.jpg');
INSERT INTO `room` VALUES ('2', '3', '二室一居', '102', '一层', '112.36', null, '2', '/upload/1.jpg');
INSERT INTO `room` VALUES ('3', '7', '二室一居', '103', '一层', '112.36', null, '3', '/upload/1.jpg');
INSERT INTO `room` VALUES ('4', '3', '二室一居', '104', '二层', '112.36', null, '0', '/upload/1.jpg');
INSERT INTO `room` VALUES ('5', '6', '二室一居', '105', '一层', '112.36', null, '0', '/upload/1.jpg');
INSERT INTO `room` VALUES ('6', '7', '二室一居', '101', '二层', '112.36', null, '0', '/upload/1.jpg');
INSERT INTO `room` VALUES ('7', '3', '二室一居', '102', '三层', '112.36', null, '0', '/upload/1.jpg');
INSERT INTO `room` VALUES ('8', '7', '二室一居', '103', '三层', '112.36', null, '0', '/upload/1.jpg');
INSERT INTO `room` VALUES ('9', '3', '二室一居', '104', '四层', '112.36', null, '0', '/upload/1.jpg');
INSERT INTO `room` VALUES ('10', '1', '二室一居', '105', '三层', '112.36', null, '0', '/upload/1.jpg');
INSERT INTO `room` VALUES ('11', '7', '二室一居', '201', '五层', '112.36', null, '0', '/upload/1.jpg');
INSERT INTO `room` VALUES ('12', '3', '二室一居', '202', '四层', '112.36', null, '12', '/upload/1.jpg');
INSERT INTO `room` VALUES ('13', '7', '二室一居', '203', '六层', '112.36', null, '0', '/upload/1.jpg');
INSERT INTO `room` VALUES ('14', '3', '二室一居', '204', '一层', '112.36', null, '0', '/upload/1.jpg');
INSERT INTO `room` VALUES ('15', '7', '一室一居', '205', '一层', '112.36', null, '12', '/upload/1.jpg');
INSERT INTO `room` VALUES ('16', '7', '一室一居', '301', '一层', '112.36', '', '0', '/upload/1.jpg');
INSERT INTO `room` VALUES ('17', '4', '一室一居', '302', '一层', '112.36', '', '1', '/upload/1.jpg');
INSERT INTO `room` VALUES ('18', '6', '一室一居', '303', '二层', '112.36', '', '1', '/upload/1.jpg');
INSERT INTO `room` VALUES ('28', '7', '一室一居', '603', '一层', '106.32', '', '0', '/upload/1589867332337.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `account` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `number` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `dept_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `gender` int(11) NOT NULL DEFAULT '0',
  `telphone` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `id_card_no` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `national_id` int(11) NOT NULL DEFAULT '0',
  `education_id` int(11) NOT NULL DEFAULT '0',
  `institute` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `major` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('18', 'admin', '111111', '1589617926966', '王欢', '7', '0', '1', '15957106484', '江干区', '330145199703042134', '1', '6', '家里蹲', '其他');
INSERT INTO `user` VALUES ('2', 'sf', '111111', '1113', '李泪', '2', '1', '1', '13155552233', '北京市南路1209号', '148120199202030015', '9', '7', '北京理工大学', '计算机科学与技术');
INSERT INTO `user` VALUES ('3', 'wx', '111111', '1114', '李五', '3', '2', '0', '13155552234', '北京市南路1209号', '148120199202030019', '9', '7', '北京理工大学', '计算机科学与技术');
INSERT INTO `user` VALUES ('16', '12', '1234', '1589174999081', '王大麻子', '3', '0', '1', '1234567829742835', '江干区', '123456788999965444', '1', '1', '家里蹲', '电竞');
INSERT INTO `user` VALUES ('17', 'mla', '111111', '1589176801822', '马里奥', '3', '2', '1', '我好了', '浙江省', '进度款环境服务费', '1', '1', '家里蹲2', '其他');
