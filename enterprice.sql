/*
Navicat MySQL Data Transfer

Source Server         : MySQLDB
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : enterprice

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2016-06-18 15:27:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admintb`
-- ----------------------------
DROP TABLE IF EXISTS `admintb`;
CREATE TABLE `admintb` (
  `aid` varchar(30) NOT NULL,
  `aname` varchar(30) DEFAULT NULL,
  `apwd` varchar(20) DEFAULT NULL,
  `aper` int(11) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admintb
-- ----------------------------
INSERT INTO `admintb` VALUES ('101', 'admin', '12345', '1');
INSERT INTO `admintb` VALUES ('103', 'hcw', '12345', '2');
INSERT INTO `admintb` VALUES ('104', 'myadmin', '12345', '2');
INSERT INTO `admintb` VALUES ('105', 'guest', '12345', '2');

-- ----------------------------
-- Table structure for `indent`
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  `pid` varchar(30) NOT NULL,
  `sumprice` float DEFAULT NULL,
  `count` varchar(30) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_im` (`mid`),
  KEY `FK_ip` (`pid`),
  CONSTRAINT `FK_im` FOREIGN KEY (`mid`) REFERENCES `member` (`mid`),
  CONSTRAINT `FK_ip` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('3', '205', '303', '275', '5', '2016.6');
INSERT INTO `indent` VALUES ('501', '201', '301', '456', '1', '2015.6');
INSERT INTO `indent` VALUES ('503', '207', '309', '738', '2', '2016/6/18 上午10:14:25');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(30) DEFAULT NULL,
  `mpwd` varchar(20) DEFAULT NULL,
  `maddr` varchar(50) DEFAULT NULL,
  `mmail` varchar(30) DEFAULT NULL,
  `mphone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('201', '莫轻寒', '12345', '未知', '123@qq.com', '12345');
INSERT INTO `member` VALUES ('202', '叶秋', '12345', '打多', '123', '123');
INSERT INTO `member` VALUES ('205', '嬴政', '12345', null, null, null);
INSERT INTO `member` VALUES ('206', '段天涯', '12345', '未知', '', '');
INSERT INTO `member` VALUES ('207', 'hcw', '12345', null, null, null);
INSERT INTO `member` VALUES ('208', 'mqh', '12345', null, null, null);
INSERT INTO `member` VALUES ('212', 'cxc', '12345', '', '', '');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `img` varchar(2000) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '习近平：把科技创新摆在更重要位置', '习近平', '央视网消息(新闻联播)：中共中央总书记、国家主席、中央军委主席习近平3日上午在参观国家“十二五”科技创新 成就展时强调，在全党全国特别是广大科技工作者共同努力下，我国科技事业取得了长足发展，科技进步和创新取得了重大突破，为改革开放和社会主义现代化建设提供了有力科技支撑。新形势下，全国广大科技工作者要响应党中央号召，坚定信心，坚忍不拔，坚持不懈，把科技创新摆在更加重要的位置，实施好创新驱动发展战略，继续在加快推进创新型国家建设、世界科技强国建设的历史进程中建功立业，努力为实现“两个一百年”奋斗目标、实现中华民族伟大复兴的中国梦作出新的更大的贡献。\r\n\r\n　　中共中央政治局常委李克强、张德江、俞正声、刘云山、王岐山分别参观展览。\r\n\r\n　　上午9时30分，习近平来到北京展览馆，走进展厅参观展览。展览以“创新驱动发展，科技引领未来”为主题，共分总况、重大专项、基础研究、战略高技术、农业科技、民生科技、区域创新、大众创业万众创新、创新人才和融入全球创新网络等10个展区，通过800多件实物、120多件模型、近百项互动项目 等，全面系统展示了“十二五”特别是党的十八大以来，我国科技界和全社会深入学习贯彻习近平总书记系列重要讲话精神，坚持面向世界科技前沿、面向国家重大 需求、面向国民经济主战场，取得的一批重大标志性科技成果和重要工作进展', '');
INSERT INTO `news` VALUES ('2', '巴萨23冠功勋离队获官方证实 或将加盟尤文', '管理员1', '新浪体育讯　　北京时间6月2日，西甲冠军巴塞罗那召开发布会，俱乐部总监罗伯托-费尔南德斯证实，主力右后卫阿尔维斯将会离队。\r\n\r\n　　费尔南德斯在发布会上证实，阿尔维斯将在今夏离开巴塞罗那，并表示这是球员自己的意愿，俱乐部完全尊重这样一位功勋老将的选择。', '');
INSERT INTO `news` VALUES ('3', '直击“世界最大高考工厂”出征现场', '新闻极客 巴芮 ', '送考结束后，生活在这个镇子上的大部分考生陪读家长将搬离，前往考生的考试地，之后返回老家。在现场已有陪读家长带着行李准备随时离开。在19辆送考大巴依次开走后，街道上多出了许多搬家的小货车，上面装着被褥、书本和一些生活用品，准备跟着大巴车一起开走。\r\n\r\n　　陪读的日子也是家长们的煎熬，很多学生家长从孩子高一入学起便在此陪读。他们租住在这里的小单间中，一个学期的费用少说四五千，多的七八千。陪读家长每天的生活都围绕着孩子转。每天将做好的饭掐点儿送到校门口，手中还拿着小板凳。等孩子出来后狼吞虎咽的吃完再赶回教室学习，他们就在门口把剩下的饭吃光，之后回去洗洗涮涮或者做点零工。\r\n\r\n　　这所中学成为整个毛坦厂镇跳动的心脏。每个寒暑假，在学生和家长返乡的日子里，这个小镇安静的吓人，商店歇业，居民盖起的三层大楼大门紧闭空空荡荡。而一旦开学，这里便又是一片沸腾。', '');
INSERT INTO `news` VALUES ('7', '习近平从两个方面不断让人民有更多获得感', 'admin', '核心提示：“兴天下之利，除天下之害。” 为民除害、为民解忧是从另一方面增加人民的获得感。发展是为了人民多获利，改革是为给人民多解忧，让人民更方便。习近平在中央政治局第十六次集体学习时指出：“我们共产党人的忧患意识，就是忧党、忧国、忧民意识，这是一种责任，更是一种担当。”\n\n　　民惟邦本，本固邦宁。“人民对美好生活的向往，就是我们的奋斗目标。”“我们党和政府做一切工作出发点、落脚点都是让人民过上好日子。”党和政府的工作成效如何？谁来评判？如何评价？ 2015年2月27日，在中央全面深化改革领导小组第十次会议上，习近平总书记在公开场合第一次提出“让人民群众有更多获得感”，“人民获得感”这一短语通俗而形象地回答了这三个问题。“人民获得感”不仅是党和政府一切工作的最终检验标准，同时也是党和政府一切工作的最终目的。如何让人民群众不断有更多的获得感？2016年4月18日，习近平在主持召开中央全面深化改革领导小组第二十三次会议时指出：“要关注群众多方面、多层次需求，创新方式方法，多用善用会用多予少取、放活普惠的办法推进改革，多谋民生之利、多解民生之忧。”请随“学习中国”小编一起学习。', '\\NewEnterpriseProject\\uploadfiles\\1465721021769.jpg');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` varchar(30) NOT NULL,
  `pname` varchar(30) DEFAULT NULL,
  `pdec` varchar(100) DEFAULT NULL,
  `pprice` float DEFAULT NULL,
  `pcount` varchar(30) DEFAULT NULL,
  `img` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('301', '充电宝', '为你的手机充能！', '89', '36', '\\NewEnterpriseProject\\uploadfiles\\1466066791079.jpg');
INSERT INTO `product` VALUES ('303', '耳机', '无', '55', '25', '\\NewEnterpriseProject\\uploadfiles\\1466068444471.jpg');
INSERT INTO `product` VALUES ('309', '手机配件', '无', '369', '3', '\\NewEnterpriseProject\\uploadfiles\\1466067101281.jpg');

-- ----------------------------
-- Table structure for `tmessage`
-- ----------------------------
DROP TABLE IF EXISTS `tmessage`;
CREATE TABLE `tmessage` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  `content` varchar(1500) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `FK_tm` (`mid`),
  CONSTRAINT `FK_tm` FOREIGN KEY (`mid`) REFERENCES `member` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tmessage
-- ----------------------------
INSERT INTO `tmessage` VALUES ('302', '201', '差评！！哼哼', '2016.9');
INSERT INTO `tmessage` VALUES ('317', '208', '产品不错！！', '2016/6/16 上午9:44:40');
INSERT INTO `tmessage` VALUES ('321', '207', '你好', '2016/6/16 上午11:53:46');
INSERT INTO `tmessage` VALUES ('322', '207', 'nihao', '2016/6/17 上午10:24:30');
INSERT INTO `tmessage` VALUES ('323', '207', '继续加油！', '2016/6/18 上午10:25:22');
INSERT INTO `tmessage` VALUES ('324', '212', '我还会再来的！', '2016/6/18 上午11:00:37');
