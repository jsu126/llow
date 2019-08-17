/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : 139.199.162.74:3306
 Source Schema         : db_llow

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 17/08/2019 08:52:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address`  (
  `address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址Id',
  `user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户Id',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货电话',
  `consingee` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `provide` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域',
  `detailAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`address_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `tb_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_address
-- ----------------------------
INSERT INTO `tb_address` VALUES (48, 'llowid_a3a42d08', '15274439866', '李维', '四川省', '德阳市', '绵竹市', '  搭嘎的德国法国', 1);
INSERT INTO `tb_address` VALUES (50, 'llowid_a3a42d08', '15274439867', '李仟仟', '天津市', '天津市辖区', '南开区', ' 搭嘎十多个', 0);
INSERT INTO `tb_address` VALUES (56, 'llowid_dac0048f', '15627561712', '两', '北京市', '北京市辖区', '西城区', ' 东城区的大门。', 1);
INSERT INTO `tb_address` VALUES (62, 'llowid_9828d300', '15236987453', '亮亮', '山西省', '太原市', '小店区', ' 兴业路22号', 1);
INSERT INTO `tb_address` VALUES (63, 'llowid_f2e4e788', '17374383221', 'ss', '北京市', '北京市辖区', '东城区', '撒旦撒旦撒旦撒', 1);
INSERT INTO `tb_address` VALUES (64, 'llowid_84690af2', '15627561712', '梁', '北京市', '北京市辖区', '东城区', '北京市区三环。', 1);
INSERT INTO `tb_address` VALUES (65, 'llowid_b2a54d16', '17655335511', '丽丽', '山西省', '长治市', '城区', '  对方水电费', 1);
INSERT INTO `tb_address` VALUES (68, 'llowid_f84541ae', '15274439866', '李薇', '河北省', '邯郸市', '肥乡区', ' 打广告撒大', 1);
INSERT INTO `tb_address` VALUES (69, 'llowid_c2aded43', '15236987963', '杜威', '山西省', '朔州市', '右玉县', ' 国庆路3号', 1);
INSERT INTO `tb_address` VALUES (70, 'llowid_e1d98847', '15236987452', '浏览', '山西省', '阳泉市', '郊区', ' 国庆路20号', 1);
INSERT INTO `tb_address` VALUES (71, 'llowid_7927fd89', '15274412345', '袁某', '湖南省', '郴州市', '北湖区', ' 万花冲壹号', 1);

-- ----------------------------
-- Table structure for tb_attributes
-- ----------------------------
DROP TABLE IF EXISTS `tb_attributes`;
CREATE TABLE `tb_attributes`  (
  `attributes_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性Id',
  `standard_id` int(11) NULL DEFAULT NULL COMMENT '规格Id',
  `attributes_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性名称',
  `stock` int(255) NULL DEFAULT NULL COMMENT '库存',
  PRIMARY KEY (`attributes_id`) USING BTREE,
  INDEX `standard_id`(`standard_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_attributes
-- ----------------------------
INSERT INTO `tb_attributes` VALUES (1, 1, '红色', 12);
INSERT INTO `tb_attributes` VALUES (2, 1, '绿色', 20);
INSERT INTO `tb_attributes` VALUES (3, 1, '黄色', 30);
INSERT INTO `tb_attributes` VALUES (4, 2, '黑色', 11);

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类目Id',
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  `category_status` int(11) NULL DEFAULT NULL COMMENT '是否停用',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES (1, '衣服', 1);
INSERT INTO `tb_category` VALUES (2, '手机1', 0);
INSERT INTO `tb_category` VALUES (3, '水果', 0);
INSERT INTO `tb_category` VALUES (4, '书籍', 1);
INSERT INTO `tb_category` VALUES (6, '零食', 1);
INSERT INTO `tb_category` VALUES (7, '水壶', 0);
INSERT INTO `tb_category` VALUES (8, '鼠标', 0);
INSERT INTO `tb_category` VALUES (9, '箱包', 1);
INSERT INTO `tb_category` VALUES (10, '手机', 1);
INSERT INTO `tb_category` VALUES (12, '养生', 1);
INSERT INTO `tb_category` VALUES (13, '鞋子', 1);
INSERT INTO `tb_category` VALUES (14, '饰品', 1);
INSERT INTO `tb_category` VALUES (16, '灯', 1);
INSERT INTO `tb_category` VALUES (17, '服饰', 0);

-- ----------------------------
-- Table structure for tb_certification
-- ----------------------------
DROP TABLE IF EXISTS `tb_certification`;
CREATE TABLE `tb_certification`  (
  `certification_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '实名认证Id',
  `user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户Id',
  `real_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实名姓名',
  `id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `nationality` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族',
  `brith_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生时间',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住址',
  `positive` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正面图片',
  `negative` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反面图片',
  `status` int(11) NULL DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`certification_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `tb_certification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_collection
-- ----------------------------
DROP TABLE IF EXISTS `tb_collection`;
CREATE TABLE `tb_collection`  (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏Id',
  `user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户Id',
  `product_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品Id',
  PRIMARY KEY (`collection_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `tb_collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_collection_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_collection
-- ----------------------------
INSERT INTO `tb_collection` VALUES (1, 'llowid_a3a42d08', 'P1565488006259');
INSERT INTO `tb_collection` VALUES (2, 'llowid_a3a42d08', 'P1565488284934');
INSERT INTO `tb_collection` VALUES (3, 'llowid_a3a42d08', 'P1565330709892');
INSERT INTO `tb_collection` VALUES (4, 'llowid_a3a42d08', 'P1565489823371');
INSERT INTO `tb_collection` VALUES (5, 'llowid_a3a42d08', 'P1565492491591');
INSERT INTO `tb_collection` VALUES (7, 'llowid_a3a42d08', 'P1565489153399');
INSERT INTO `tb_collection` VALUES (16, 'llowid_dac0048f', 'P1565660603968');
INSERT INTO `tb_collection` VALUES (50, 'llowid_84690af2', 'P1565615721820');
INSERT INTO `tb_collection` VALUES (51, 'llowid_b2a54d16', 'P1565617921887');
INSERT INTO `tb_collection` VALUES (58, 'llowid_a3a42d08', 'P1565677874201');
INSERT INTO `tb_collection` VALUES (59, 'llowid_a3a42d08', 'P1565680150049');
INSERT INTO `tb_collection` VALUES (61, 'llowid_a3a42d08', 'P1565657409571');
INSERT INTO `tb_collection` VALUES (62, 'llowid_f84541ae', 'P1565680150049');
INSERT INTO `tb_collection` VALUES (63, 'llowid_b2984bb0', 'P1565572147183');
INSERT INTO `tb_collection` VALUES (64, 'llowid_c2aded43', 'P1565660166443');
INSERT INTO `tb_collection` VALUES (65, 'llowid_f84541ae', 'P1565869599075');
INSERT INTO `tb_collection` VALUES (66, 'llowid_f84541ae', 'P1565680616069');
INSERT INTO `tb_collection` VALUES (67, 'llowid_f84541ae', 'P1565660603968');
INSERT INTO `tb_collection` VALUES (68, 'llowid_f84541ae', 'P1565658547120');
INSERT INTO `tb_collection` VALUES (69, 'llowid_f84541ae', 'P1565869120357');
INSERT INTO `tb_collection` VALUES (70, 'llowid_f84541ae', 'P1565677874201');
INSERT INTO `tb_collection` VALUES (76, 'llowid_9846b8a4', 'P1565661155548');

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论Id',
  `user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户Id',
  `product_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品Id',
  `star_count` int(11) NULL DEFAULT NULL COMMENT '服务星级数',
  `comment_conte` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `comment_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时间',
  `standard_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品类别',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `tb_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES (2, 'userid_1b8d36dd', 'P1565330709891', 1, '超级喜欢', '2019-07-04 20:13:59', '大');
INSERT INTO `tb_comment` VALUES (15, 'llowid_a3a42d08', 'P1565330709891', 3, '好', '2019-08-14 14:30:01', '大');
INSERT INTO `tb_comment` VALUES (16, 'llowid_a3a42d08', 'P1565333432132', 2, '蛮好', '2019-08-14 14:30:01', '蓝色');
INSERT INTO `tb_comment` VALUES (20, 'llowid_f2e4e788', 'P1565330709891', 2, '我觉的不错', '2019-08-15 16:51:09', '小');
INSERT INTO `tb_comment` VALUES (21, 'llowid_a3a42d08', 'P1565330709891', 3, '很好，非常好', '2019-08-15 17:28:58', '大');
INSERT INTO `tb_comment` VALUES (22, 'llowid_a3a42d08', 'P1565333432132', 3, '蛮好的', '2019-08-15 17:28:58', '蓝色');
INSERT INTO `tb_comment` VALUES (23, 'llowid_a3a42d08', 'P1565570245236', 3, '这本书蛮好看的。', '2019-08-15 17:29:14', '三本');
INSERT INTO `tb_comment` VALUES (24, 'llowid_a3a42d08', 'P1565445872151', 3, '保温效果很好', '2019-08-15 17:29:29', '500ml');
INSERT INTO `tb_comment` VALUES (25, 'llowid_a3a42d08', 'P1565658547120', 2, '质量很好，东西蛮好看的，就是太难了', '2019-08-15 17:32:26', '魔方紫');
INSERT INTO `tb_comment` VALUES (26, 'llowid_a3a42d08', 'P1565680150049', 3, '  表链的设计很好。调节很方便。实物与图片相符，没有色差，很精致，晚上还有夜光效果，很好看呢，玫瑰金的外观看着很高档，也很显气质，', '2019-08-15 17:35:06', '玫瑰金白面');
INSERT INTO `tb_comment` VALUES (27, 'llowid_a3a42d08', 'P1565765211538', 3, '东西已收到，包装很好，味道清新脱俗东西不错，很划算快递包装挺好的，没有破损漏液，香薰挺不错的，味道清淡不刺鼻，香味扩散的也广。放卧室放卫生间都可以，还送的有补充液，上面的泡沫花也好看。', '2019-08-15 17:43:33', '美-蓝海洋味');
INSERT INTO `tb_comment` VALUES (28, 'llowid_a3a42d08', 'P1565657409571', 3, '没啥特殊情况每天晚上都要跑上1万步左右，正常是叫不醒人的，感谢让我认识这款手环，这次买的是黑色表带,平时带着游泳都没有问题，主要是能时刻看着时间。而且充一次电特别快，还有就是支持支付宝付钱了，就是送的膜有点太大了边缘会有空气。刚刚散了步开运', '2019-08-15 17:44:57', '白栢');
INSERT INTO `tb_comment` VALUES (29, 'llowid_a3a42d08', 'P1565679487508', 3, '拼装很顺利 抽拉虽然没有塑料的好但是还是不错的 在上面放了两个本子也没什么影响 （四个格子装的是药品/速溶饮料包/钱包和零钱包/梳子头饰） 盒子不长 所以我后面放的是自己屯的抽纸 看起来比较整齐 整体还是很满意的 刚刚好塞满一层柜子 适合预算不高杂物多不太重的女孩子买~', '2019-08-15 17:47:18', '花开富贵');
INSERT INTO `tb_comment` VALUES (30, 'llowid_a3a42d08', 'P1565663930243', 3, '质量不错，很满意', '2019-08-15 17:48:34', '玫瑰之吻-蓝色');
INSERT INTO `tb_comment` VALUES (31, 'llowid_f84541ae', 'P1565660603968', 3, '做工很棒 很漂亮，包装很结实，很满意呀', '2019-08-15 20:33:09', '浪漫巴黎');
INSERT INTO `tb_comment` VALUES (32, 'llowid_f84541ae', 'P1565679058832', 3, '很有纪念意义的礼物，包装很好', '2019-08-15 20:33:09', '粉色刻字竹简');
INSERT INTO `tb_comment` VALUES (33, 'llowid_f84541ae', 'P1565680150049', 3, '  日盼夜盼终于把它盼来了，个人觉得实物比图片还要漂亮，非常喜欢，五一可以戴着它尽情的浪去啦，。开始不知道怎么佩戴怎么截短表链幸亏有客服细心的讲解，希望能戴的久一点！', '2019-08-15 20:33:09', '银带白面');
INSERT INTO `tb_comment` VALUES (34, 'llowid_f84541ae', 'P1565679487508', 3, '宝贝已收到，很漂亮，有淡淡的木香味，喜欢，包装特好，又送了古式牙签盒，东西和我们家具很配，全家都说好！谢谢。', '2019-08-15 20:33:09', '年年有余');
INSERT INTO `tb_comment` VALUES (35, 'llowid_f84541ae', 'P1565659148922', 3, '守望了好久终于还是下手了！拿回来打开很惊喜，店家还送了几片卸妆湿巾，唇釉包装很好！打开一边涂一边拍了视频，颜色真的太漂亮了，上色快，不干，确实是有丝绒的感觉，哑光的很自然，准备再多入手几款浅色的！！！卸妆湿巾也好用，轻轻一擦就特别干净！比我的卸妆水还要好用的多！', '2019-08-15 20:33:09', 'N325');
INSERT INTO `tb_comment` VALUES (36, 'llowid_f84541ae', 'P1565615721820', 3, '很信赖这家店的宝贝 质量真的很好 款式颜色也和图片毫无瑕疵 会再来的', '2019-08-15 20:33:10', '天使');
INSERT INTO `tb_comment` VALUES (37, 'llowid_f84541ae', 'P1565659611633', 3, '我第一次用这牌子的化妆品， 味道清淡，简单用了一下觉得水吸收特别快，霜一点也不油腻。这款套装性价比还是非常高的，洗面奶，水乳，精华霜都有，洗面奶洗的很干净，不紧绷，一套使用下来，真的很补水保湿，但是不油腻呢 是比较清爽的一款产品。我属于敏感性皮肤，但是用了这个套装之后，皮肤一点也不会过敏。而且一整天皮肤都水水嫩嫩的。而且分量都很足哦。', '2019-08-15 20:33:10', '全明星润漾盒');
INSERT INTO `tb_comment` VALUES (38, 'llowid_f84541ae', 'P1565572147183', 3, '东西做工算好，包装妥帖，发货速度快，免费刻字这个噱头也不错，但是能不能多加几种字体如：小篆或者其他，不能因为免费刻字就让顾客的选择面太狭窄，换言之，多种字体的选择，你即使收费，我想顾客也能接受，现在免费刻字的噱头满大街都是，转变思路，做别人不能做的才致胜之道。个人观点望店家采纳。', '2019-08-15 20:33:10', '8cm');
INSERT INTO `tb_comment` VALUES (39, 'llowid_f84541ae', 'P1565680616069', 3, '很喜欢，玉色光滑，色泽很美很透彻。', '2019-08-15 20:33:10', '升级版单独吊坠送黑绳');
INSERT INTO `tb_comment` VALUES (40, 'llowid_f84541ae', 'P1565869120357', 3, '东西到手啦，满满的回忆感，质感也超级棒呢，昨天朋友来我家里看到这个游戏机吵着要我把链接分享给她，他也要自己买一个在家玩，真的是暑假必备神器啊！', '2019-08-15 20:33:10', 'SUP单人版红色（400游戏）');
INSERT INTO `tb_comment` VALUES (45, 'llowid_a3a42d08', 'P1565618352736', 3, '完美，真的很好看', '2019-08-15 21:18:38', '飘逸紫');
INSERT INTO `tb_comment` VALUES (46, 'llowid_a3a42d08', 'P1565665533029', 3, '挺好看，挺有感觉，推荐，客服态度很好', '2019-08-15 21:18:38', '魅影黑平衡灯椭圆款');
INSERT INTO `tb_comment` VALUES (47, 'llowid_a3a42d08', 'P1565659148922', 3, '便宜实用，好看，第一次涂有点手缠党，多练应该就好了', '2019-08-15 21:18:38', 'N204');
INSERT INTO `tb_comment` VALUES (48, 'llowid_a3a42d08', 'P1565678746335', 3, '有效舒缓工作疲劳，眼部完全包裹，好舒服～这款硅胶材质加热是确实让人感到很放松贴心的感觉，挺人性化的，音乐可以蓝牙链接听歌非常喜欢这种舒适的，缓解眼睛干涩', '2019-08-15 21:18:38', 'GE10(高配版-时尚白');
INSERT INTO `tb_comment` VALUES (49, 'llowid_a3a42d08', 'P1565679772028', 3, '颜色非常好看。想不到这么实惠价买到这么好看的指甲油。下次再回购', '2019-08-15 21:18:38', '都市粉');
INSERT INTO `tb_comment` VALUES (50, 'llowid_a3a42d08', 'P1565572147183', 3, '挺好的，很高大上的感觉～', '2019-08-15 21:18:38', '6cm');
INSERT INTO `tb_comment` VALUES (51, 'llowid_a3a42d08', 'P1565617921887', 3, '物美价廉...很好的一次购物', '2019-08-15 21:18:38', '女孩');
INSERT INTO `tb_comment` VALUES (52, 'llowid_a3a42d08', 'P1565869120357', 3, '便宜 小小的 很方便携带', '2019-08-15 21:18:38', 'SUP单人版红色（400游戏）');
INSERT INTO `tb_comment` VALUES (53, 'llowid_a3a42d08', 'P1565618352736', 3, '回来后，刻完才来评价，效果很好，质量也不错，晚上的效果应该更好', '2019-08-15 21:18:38', '冰凌蓝');
INSERT INTO `tb_comment` VALUES (54, 'llowid_a3a42d08', 'P1565660603968', 2, '灯没有图片那么有意境。', '2019-08-15 21:18:38', '白首');
INSERT INTO `tb_comment` VALUES (55, 'llowid_a3a42d08', 'P1565659611633', 3, '这个套装已经是第五次购买了，和女儿都用的这个，值得无限回购，而且清润型的更适用。喜欢', '2019-08-15 21:18:38', '全明星焕颜盒');
INSERT INTO `tb_comment` VALUES (56, 'llowid_a3a42d08', 'P1565617921887', 3, '非常好，不懂店家也耐心的解释，很好', '2019-08-15 21:18:38', '双人');
INSERT INTO `tb_comment` VALUES (57, 'llowid_a3a42d08', 'P1565677874201', 3, '朋友送的小鱼木梳很不错，大小刚好放包包里出门携带方便，颜色也好看好评', '2019-08-15 21:18:38', '古宣非洲小叶紫檀木梳 孔雀彩绘款 玉石四季豆吊坠款');
INSERT INTO `tb_comment` VALUES (58, 'llowid_a3a42d08', 'P1565869948629', 3, '完美的一次购物！一看包装就上档次！物超所值！服务好物流快。五星好评！', '2019-08-15 21:18:38', '黑冰');
INSERT INTO `tb_comment` VALUES (59, 'llowid_a3a42d08', 'P1565869599075', 3, '想了很久才下手，送的东西也很好，附上我第一次拍的两张照片，而且还是很上手的呢，其实很早就想买了，看有些评论怕成相有问题，所以拿舍友试了一下。', '2019-08-15 21:18:38', '10张内【玫瑰红】');
INSERT INTO `tb_comment` VALUES (60, 'llowid_a3a42d08', 'P1565849192045', 3, '宝贝挺好白色沙子,一点杂质也没有,快递也很快,客服服务态度也很好,好评', '2019-08-15 21:18:38', '钻石沙漏灯');
INSERT INTO `tb_comment` VALUES (61, 'llowid_c2aded43', 'P1565659148922', 3, '口红非常好', '2019-08-15 21:24:55', 'N325');
INSERT INTO `tb_comment` VALUES (62, 'llowid_c2aded43', 'P1565658547120', 2, '非常好', '2019-08-15 21:24:55', '魔方蓝');
INSERT INTO `tb_comment` VALUES (63, 'llowid_c2aded43', 'P1565618352736', 3, '是谁好jhfasghhaafk', '2019-08-15 21:30:07', '冰凌蓝');
INSERT INTO `tb_comment` VALUES (64, 'llowid_c2aded43', 'P1565656881629', 3, '手表非常好', '2019-08-15 21:35:14', '亮黄');
INSERT INTO `tb_comment` VALUES (65, 'llowid_c2aded43', 'P1565660166443', 3, '非常好', '2019-08-16 08:52:57', '藏蓝灰');
INSERT INTO `tb_comment` VALUES (66, 'llowid_c2aded43', 'P1565661155548', 2, '挺满意的', '2019-08-16 08:52:57', '方块手链');
INSERT INTO `tb_comment` VALUES (67, 'llowid_e1d98847', 'P1565663930243', 3, '非常喜欢', '2019-08-16 14:55:36', '渐变加珍珠-红');
INSERT INTO `tb_comment` VALUES (68, 'llowid_7927fd89', 'P1565663930243', 3, '非常好', '2019-08-16 16:12:15', '玫瑰之吻-粉色');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单Id',
  `user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户Id',
  `address_id` int(11) NULL DEFAULT NULL COMMENT '收货Id',
  `order_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价格',
  `order_time` datetime NULL DEFAULT NULL COMMENT '下单时间',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '付款时间',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '成交时间',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `address_id`(`address_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `tb_order_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `tb_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 174 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES (2, 'llowid_a3a42d08', 48, '201908101527121234', 863.00, '2019-08-06 20:15:36', '2019-08-06 20:15:36', '2019-08-10 21:19:06', '2019-08-10 21:19:06', 4);
INSERT INTO `tb_order` VALUES (77, 'llowid_dac0048f', 56, '201908141110424668923', 600.00, '2019-08-14 11:10:42', '2019-08-14 11:10:56', '2019-08-14 16:59:56', NULL, 0);
INSERT INTO `tb_order` VALUES (78, 'llowid_a3a42d08', 50, '201908141522097192598', 72.50, '2019-08-14 15:22:09', '2019-08-14 15:22:20', '2019-08-14 17:01:19', '2019-08-15 17:28:20', 4);
INSERT INTO `tb_order` VALUES (79, 'llowid_a3a42d08', 50, '201908141525379333773', 70.00, '2019-08-14 15:25:37', '2019-08-14 15:25:42', '2019-08-14 17:01:18', '2019-08-15 17:28:25', 4);
INSERT INTO `tb_order` VALUES (111, 'llowid_9828d300', 62, '201908142040341566416', 72.50, '2019-08-14 20:40:34', '2019-08-14 20:40:52', '2019-08-15 14:59:31', NULL, 2);
INSERT INTO `tb_order` VALUES (124, 'llowid_f2e4e788', 63, '201908151649285894944', 100.00, '2019-08-15 16:49:28', '2019-08-15 16:49:37', '2019-08-15 16:50:44', '2019-08-15 16:50:56', 4);
INSERT INTO `tb_order` VALUES (139, 'llowid_a3a42d08', 50, '201908151709229892989', 128.00, '2019-08-15 17:09:22', '2019-08-15 17:13:55', '2019-08-15 17:33:20', '2019-08-15 17:33:29', 4);
INSERT INTO `tb_order` VALUES (145, 'llowid_a3a42d08', 50, '2019081517243017130', 58.00, '2019-08-15 17:24:30', '2019-08-15 17:24:36', '2019-08-15 17:30:43', '2019-08-15 17:30:57', 4);
INSERT INTO `tb_order` VALUES (148, 'llowid_9828d300', 62, '201908151729419087875', 230.00, '2019-08-15 17:29:41', '2019-08-15 17:29:49', '2019-08-15 17:30:36', '2019-08-15 17:41:02', 3);
INSERT INTO `tb_order` VALUES (150, 'llowid_9828d300', 62, '201908151734301858457', 991.00, '2019-08-15 17:34:30', '2019-08-15 17:34:34', NULL, NULL, 1);
INSERT INTO `tb_order` VALUES (151, 'llowid_a3a42d08', 48, '20190815173611476241', 58.00, '2019-08-15 17:36:11', '2019-08-15 17:36:17', '2019-08-15 17:37:15', '2019-08-15 17:37:31', 4);
INSERT INTO `tb_order` VALUES (152, 'llowid_a3a42d08', 50, '20190815173743622680', 159.00, '2019-08-15 17:37:43', '2019-08-15 17:37:47', '2019-08-15 17:38:29', '2019-08-15 17:41:40', 4);
INSERT INTO `tb_order` VALUES (153, 'llowid_a3a42d08', 48, '201908151739485856767', 799.00, '2019-08-15 17:39:48', '2019-08-15 17:40:04', '2019-08-15 17:42:30', '2019-08-15 17:42:47', 4);
INSERT INTO `tb_order` VALUES (154, 'llowid_a3a42d08', 50, '201908151740472631457', 69.00, '2019-08-15 17:40:47', '2019-08-15 17:40:51', '2019-08-15 17:41:53', '2019-08-15 17:42:50', 4);
INSERT INTO `tb_order` VALUES (155, 'llowid_9828d300', 62, '2019081517414961361', 100.00, '2019-08-15 17:41:49', '2019-08-15 17:42:09', NULL, NULL, 1);
INSERT INTO `tb_order` VALUES (159, 'llowid_9828d300', 62, '201908151758393044536', 297.00, '2019-08-15 17:58:39', '2019-08-15 17:58:54', NULL, NULL, 1);
INSERT INTO `tb_order` VALUES (160, 'llowid_f84541ae', NULL, '201908151949250049139', 908.00, '2019-08-15 19:49:25', NULL, NULL, NULL, 0);
INSERT INTO `tb_order` VALUES (161, 'llowid_f84541ae', 68, '201908152007561614555', 3021.00, '2019-08-15 20:07:56', '2019-08-15 20:08:49', '2019-08-15 20:10:03', '2019-08-15 20:10:11', 4);
INSERT INTO `tb_order` VALUES (162, 'llowid_a3a42d08', 48, '201908152039304962061', 4382.00, '2019-08-15 20:39:30', '2019-08-15 20:40:32', '2019-08-15 20:42:13', '2019-08-15 20:42:26', 4);
INSERT INTO `tb_order` VALUES (163, 'llowid_c2aded43', 69, '201908152118379832775', 544.00, '2019-08-15 21:18:37', '2019-08-15 21:18:45', '2019-08-15 21:19:46', '2019-08-15 21:20:04', 4);
INSERT INTO `tb_order` VALUES (164, 'llowid_c2aded43', 69, '201908152126454848656', 65.00, '2019-08-15 21:26:45', '2019-08-15 21:26:53', '2019-08-15 21:27:29', '2019-08-15 21:27:41', 4);
INSERT INTO `tb_order` VALUES (165, 'llowid_c2aded43', 69, '201908152133431614443', 266.00, '2019-08-15 21:33:43', '2019-08-15 21:33:47', '2019-08-15 21:34:42', '2019-08-15 21:34:50', 4);
INSERT INTO `tb_order` VALUES (166, 'llowid_c2aded43', 69, '201908160845339918114', 836.00, '2019-08-16 08:45:33', '2019-08-16 08:47:15', '2019-08-16 08:51:19', '2019-08-16 08:52:28', 4);
INSERT INTO `tb_order` VALUES (167, 'llowid_c2aded43', 69, '201908161112137897703', 66.00, '2019-08-16 11:12:13', NULL, NULL, NULL, 0);
INSERT INTO `tb_order` VALUES (169, 'llowid_c2aded43', 69, '20190816111531065140', 78.00, '2019-08-16 11:15:31', '2019-08-16 11:16:50', NULL, NULL, 1);
INSERT INTO `tb_order` VALUES (170, 'llowid_f84541ae', NULL, '201908161147062579811', 72.50, '2019-08-16 11:47:06', NULL, NULL, NULL, 0);
INSERT INTO `tb_order` VALUES (171, 'llowid_e1d98847', 70, '201908161452570037895', 69.00, '2019-08-16 14:52:57', '2019-08-16 14:53:42', '2019-08-16 14:54:30', '2019-08-16 14:55:12', 4);
INSERT INTO `tb_order` VALUES (172, 'llowid_7927fd89', 71, '201908161609496199468', 69.00, '2019-08-16 16:09:49', '2019-08-16 16:10:32', '2019-08-16 16:11:51', '2019-08-16 16:11:59', 4);
INSERT INTO `tb_order` VALUES (173, 'llowid_7927fd89', 71, '201908161613440819834', 223.00, '2019-08-16 16:13:44', '2019-08-16 16:14:38', '2019-08-16 16:15:25', NULL, 2);

-- ----------------------------
-- Table structure for tb_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_detail`;
CREATE TABLE `tb_order_detail`  (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情Id',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单Id',
  `product_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_count` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `product_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `standard_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格名称',
  PRIMARY KEY (`order_detail_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `product_id`(`product_id`(4)) USING BTREE,
  CONSTRAINT `tb_order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_order_detail
-- ----------------------------
INSERT INTO `tb_order_detail` VALUES (2, 2, 'P1565330709891', '【良品铺子旗舰店】手剥松子218g 坚果炒货零食新货巴西松子包邮', 2, 90.00, 'http://image.stodger.club/images/adedfdb8f26b4c0c8a67d93e9767f982.jpg', '大');
INSERT INTO `tb_order_detail` VALUES (3, 2, 'P1565333432132', '礼来', 2, 99.00, 'http://image.stodger.club/images/599d7771bca94783993f5ecc42f90ee0.jpg', '蓝色');
INSERT INTO `tb_order_detail` VALUES (32, 77, 'P1565659148922', 'Givenchy/纪梵希高定香榭天鹅绒唇膏小羊皮口红304 306 305口红 ', 2, 300.00, 'http://image.stodger.club/images/f3b1748a60524373afd39b5a91997b2c.jpg', 'N204');
INSERT INTO `tb_order_detail` VALUES (33, 78, 'P1565570245236', '幸福是，最重要的小事 表白送礼套装3册', 1, 72.50, 'http://image.stodger.club/images/ef1c61fad9c1432ab9ba48ad2544b058.jpg', '三本');
INSERT INTO `tb_order_detail` VALUES (34, 79, 'P1565445872151', '漫威系列音乐保温杯', 1, 70.00, 'http://image.stodger.club/images/a6c732bd602e47909278304d4b67bf09.jpg', '500ml');
INSERT INTO `tb_order_detail` VALUES (52, 111, 'P1565570245236', '幸福是，最重要的小事 表白送礼套装3册', 1, 72.50, 'http://image.stodger.club/images/ef1c61fad9c1432ab9ba48ad2544b058.jpg', '三本');
INSERT INTO `tb_order_detail` VALUES (62, 124, 'P1565330709891', '【良品铺子旗舰店】手剥松子218g 坚果炒货零食新货巴西松子包邮', 1, 100.00, 'https://gd2.alicdn.com/imgextra/i1/921599056/TB2Nu1MiLiSBuNkSnhJXXbDcpXa_!!921599056.jpg_400x400.jpg', '小');
INSERT INTO `tb_order_detail` VALUES (67, 139, 'P1565680150049', '链条手表女款防水时尚款玫瑰金手表女石英表钢带气质女表潮流休闲', 1, 128.00, 'http://image.stodger.club/images/4d9e569f63124a60bfb4e8b596a1208b.jpg', '玫瑰金白面');
INSERT INTO `tb_order_detail` VALUES (70, 145, 'P1565658547120', '水晶装饰摆件情人节创意礼物旋转发光diy定制照片礼品生日送女友 ', 1, 58.00, 'http://image.stodger.club/images/3617740d77004689bd0cacf809e0f732.jpg', '魔方紫');
INSERT INTO `tb_order_detail` VALUES (73, 148, 'P1565572147183', 'NBA水晶篮球迷用品', 1, 53.00, 'http://image.stodger.club/images/f27515ca327e475393fe0c40c2dd07af.jpg', '8cm');
INSERT INTO `tb_order_detail` VALUES (75, 150, 'P1565659611633', '欧莱雅小美盒 全明星焕颜盒 赫莲娜绿宝瓶 至美眼霜T', 2, 458.00, 'http://image.stodger.club/images/cd1a62747bfb4531bc342e8bf5a40d76.jpg', '全明星润漾盒');
INSERT INTO `tb_order_detail` VALUES (76, 151, 'P1565765211538', '正想木瓶无火香薰精油礼盒套装挥发藤条香薰室内卧室房间檀香熏香 ', 1, 58.00, 'http://image.stodger.club/images/f9122b4fde344984bd92ce2b1238c384.jpg', '美-蓝海洋味');
INSERT INTO `tb_order_detail` VALUES (77, 152, 'P1565657409571', '时硕 智能手环多功能运动健身游泳手环测心率量血压手环电子计步器男女学生防水心电图手环VIVO小米手表', 1, 159.00, 'http://image.stodger.club/images/433a27f920d749ecaa202794c717c566.jpg', '白栢');
INSERT INTO `tb_order_detail` VALUES (78, 153, 'P1565679487508', '弘艺堂木质首饰盒手饰品珠宝项链收纳盒中式古风复古大容量中国风', 1, 799.00, 'http://image.stodger.club/images/d0e751283db849b2aa6aa175facb7868.jpg', '花开富贵');
INSERT INTO `tb_order_detail` VALUES (79, 154, 'P1565663930243', '中秋节表白礼物香皂肥皂花玫瑰礼盒女友女生老婆闺蜜生日礼品包邮 ', 1, 69.00, 'http://image.stodger.club/images/57bc38e5caa240e48149df5b4bc43cb5.jpg', '玫瑰之吻-蓝色');
INSERT INTO `tb_order_detail` VALUES (80, 155, 'P1565615721820', '小灯塔', 1, 100.00, 'http://image.stodger.club/images/c72a26deb9274bcaa42d31e998d3552e.jpg', '小花仙');
INSERT INTO `tb_order_detail` VALUES (85, 159, 'P1565617921887', '雪人灯|生日礼物送男友小孩女生朋友闺蜜儿童创意浪漫情侣异地恋 ', 1, 99.00, 'http://image.stodger.club/images/11bbeadd3e6e45f0a8ce82017acdb53b.jpg', '双人');
INSERT INTO `tb_order_detail` VALUES (86, 159, 'P1565849192045', '沙漏伴睡灯创意睡眠网红音乐台灯卧室床头小夜灯浪漫生日礼物灯', 1, 198.00, 'http://image.stodger.club/images/e1f2a193becb40f3bb815f0c0452191d.jpg', '钻石沙漏灯');
INSERT INTO `tb_order_detail` VALUES (87, 160, 'P1565665533029', '智能磁吸灯磁力平衡灯浪漫网红台灯家居创意小夜灯结婚生日礼物女 ', 1, 908.00, 'http://image.stodger.club/images/1e7054902dfa48e18250a0f677c7e3a1.jpg', '魅影黑平衡灯椭圆款');
INSERT INTO `tb_order_detail` VALUES (88, 161, 'P1565660603968', '创意生日中秋礼物光影纸雕成品剪纸卧室灯调光遥控3D立体抖音新品 ', 2, 56.00, 'http://image.stodger.club/images/718f2f365fa941878ac94b8eafad1c73.jpg', '浪漫巴黎');
INSERT INTO `tb_order_detail` VALUES (89, 161, 'P1565679058832', '七夕情人节礼物生日礼物女生竹简情书玫瑰花创意浪漫新奇结婚纪念 ', 1, 256.00, 'http://image.stodger.club/images/3a1fb2e648254364a58ed0093a275f2b.jpg', '粉色刻字竹简');
INSERT INTO `tb_order_detail` VALUES (90, 161, 'P1565680150049', '链条手表女款防水时尚款玫瑰金手表女石英表钢带气质女表潮流休闲', 1, 128.00, 'http://image.stodger.club/images/4d9e569f63124a60bfb4e8b596a1208b.jpg', '银带白面');
INSERT INTO `tb_order_detail` VALUES (91, 161, 'P1565679487508', '弘艺堂木质首饰盒手饰品珠宝项链收纳盒中式古风复古大容量中国风', 1, 799.00, 'http://image.stodger.club/images/d0e751283db849b2aa6aa175facb7868.jpg', '年年有余');
INSERT INTO `tb_order_detail` VALUES (92, 161, 'P1565659148922', 'Givenchy/纪梵希高定香榭天鹅绒唇膏小羊皮口红304 306 305口红 ', 1, 428.00, 'http://image.stodger.club/images/f3b1748a60524373afd39b5a91997b2c.jpg', 'N325');
INSERT INTO `tb_order_detail` VALUES (93, 161, 'P1565615721820', '小灯塔', 1, 100.00, 'http://image.stodger.club/images/c72a26deb9274bcaa42d31e998d3552e.jpg', '天使');
INSERT INTO `tb_order_detail` VALUES (94, 161, 'P1565659611633', '欧莱雅小美盒 全明星焕颜盒 赫莲娜绿宝瓶 至美眼霜T', 1, 458.00, 'http://image.stodger.club/images/cd1a62747bfb4531bc342e8bf5a40d76.jpg', '全明星润漾盒');
INSERT INTO `tb_order_detail` VALUES (95, 161, 'P1565572147183', 'NBA水晶篮球迷用品', 1, 53.00, 'http://image.stodger.club/images/f27515ca327e475393fe0c40c2dd07af.jpg', '8cm');
INSERT INTO `tb_order_detail` VALUES (96, 161, 'P1565680616069', '傲薇{莲佑平安}秋冬新品长款毛衣链项链女玉髓平安扣吊坠银莲花', 1, 588.00, 'http://image.stodger.club/images/be95f83c6cb44ed7b5458c4a7438328f.jpg', '升级版单独吊坠送黑绳');
INSERT INTO `tb_order_detail` VALUES (97, 161, 'P1565869120357', '掌上游戏机FC掌机怀旧款psp游戏机充电宝sup怀旧便携式韩商言同款 ', 1, 99.00, 'http://image.stodger.club/images/f7316663b1c54febbbfd2d3624657019.jpg', 'SUP单人版红色（400游戏）');
INSERT INTO `tb_order_detail` VALUES (98, 162, 'P1565618352736', '水晶玫瑰花3D内雕照片摆件开学生日结婚创意男送女朋友情人节礼物 ', 1, 45.00, 'http://image.stodger.club/images/91dbf8f17382443aa313d4d78c061af3.jpg', '飘逸紫');
INSERT INTO `tb_order_detail` VALUES (99, 162, 'P1565665533029', '智能磁吸灯磁力平衡灯浪漫网红台灯家居创意小夜灯结婚生日礼物女 ', 1, 908.00, 'http://image.stodger.club/images/1e7054902dfa48e18250a0f677c7e3a1.jpg', '魅影黑平衡灯椭圆款');
INSERT INTO `tb_order_detail` VALUES (100, 162, 'P1565659148922', 'Givenchy/纪梵希高定香榭天鹅绒唇膏小羊皮口红304 306 305口红 ', 1, 300.00, 'http://image.stodger.club/images/f3b1748a60524373afd39b5a91997b2c.jpg', 'N204');
INSERT INTO `tb_order_detail` VALUES (101, 162, 'P1565678746335', '德国DEDAKJ眼部按摩仪护眼仪眼睛按摩器眼保仪热敷去黑眼圈美眼仪 ', 1, 899.00, 'http://image.stodger.club/images/031ee4300249479f8748ef7aa2c29612.jpg', 'GE10(高配版-时尚白');
INSERT INTO `tb_order_detail` VALUES (102, 162, 'P1565679772028', 'NailEasy健康水性无味指甲油可撕拉夏季持久显白 指甲油套装 全套', 1, 540.00, 'http://image.stodger.club/images/4c932947d4be40b8b924500568e6fb26.jpg', '都市粉');
INSERT INTO `tb_order_detail` VALUES (103, 162, 'P1565572147183', 'NBA水晶篮球迷用品', 1, 38.00, 'http://image.stodger.club/images/f27515ca327e475393fe0c40c2dd07af.jpg', '6cm');
INSERT INTO `tb_order_detail` VALUES (104, 162, 'P1565617921887', '雪人灯|生日礼物送男友小孩女生朋友闺蜜儿童创意浪漫情侣异地恋 ', 1, 66.00, 'http://image.stodger.club/images/11bbeadd3e6e45f0a8ce82017acdb53b.jpg', '女孩');
INSERT INTO `tb_order_detail` VALUES (105, 162, 'P1565869120357', '掌上游戏机FC掌机怀旧款psp游戏机充电宝sup怀旧便携式韩商言同款 ', 1, 99.00, 'http://image.stodger.club/images/f7316663b1c54febbbfd2d3624657019.jpg', 'SUP单人版红色（400游戏）');
INSERT INTO `tb_order_detail` VALUES (106, 162, 'P1565618352736', '水晶玫瑰花3D内雕照片摆件开学生日结婚创意男送女朋友情人节礼物 ', 1, 65.00, 'http://image.stodger.club/images/91dbf8f17382443aa313d4d78c061af3.jpg', '冰凌蓝');
INSERT INTO `tb_order_detail` VALUES (107, 162, 'P1565660603968', '创意生日中秋礼物光影纸雕成品剪纸卧室灯调光遥控3D立体抖音新品 ', 1, 56.00, 'http://image.stodger.club/images/718f2f365fa941878ac94b8eafad1c73.jpg', '白首');
INSERT INTO `tb_order_detail` VALUES (108, 162, 'P1565659611633', '欧莱雅小美盒 全明星焕颜盒 赫莲娜绿宝瓶 至美眼霜T', 1, 328.00, 'http://image.stodger.club/images/cd1a62747bfb4531bc342e8bf5a40d76.jpg', '全明星焕颜盒');
INSERT INTO `tb_order_detail` VALUES (109, 162, 'P1565617921887', '雪人灯|生日礼物送男友小孩女生朋友闺蜜儿童创意浪漫情侣异地恋 ', 1, 99.00, 'http://image.stodger.club/images/11bbeadd3e6e45f0a8ce82017acdb53b.jpg', '双人');
INSERT INTO `tb_order_detail` VALUES (110, 162, 'P1565677874201', '古宣天然正品小叶紫檀木梳子定制刻字生日七夕情人礼物送老婆女友 ', 1, 588.00, 'http://image.stodger.club/images/4a23e943004845d191635c639c203dc2.jpg', '古宣非洲小叶紫檀木梳 孔雀彩绘款 玉石四季豆吊坠款');
INSERT INTO `tb_order_detail` VALUES (111, 162, 'P1565869948629', '生日礼物男生实用个性七夕情人节送男友朋友男士特别创意惊喜高档', 1, 99.00, 'http://image.stodger.club/images/1ff5184efc4448b29ca21ca442ddc3d2.jpg', '黑冰');
INSERT INTO `tb_order_detail` VALUES (112, 162, 'P1565869599075', '私定记忆胶卷相册定制diy创意浪漫生日礼物送闺蜜女朋友情侣礼品', 1, 54.00, 'http://image.stodger.club/images/ff45b69d19694db1950de106d50db7cb.jpg', '10张内【玫瑰红】');
INSERT INTO `tb_order_detail` VALUES (113, 162, 'P1565849192045', '沙漏伴睡灯创意睡眠网红音乐台灯卧室床头小夜灯浪漫生日礼物灯', 1, 198.00, 'http://image.stodger.club/images/e1f2a193becb40f3bb815f0c0452191d.jpg', '钻石沙漏灯');
INSERT INTO `tb_order_detail` VALUES (114, 163, 'P1565659148922', 'Givenchy/纪梵希高定香榭天鹅绒唇膏小羊皮口红304 306 305口红 ', 1, 428.00, 'http://image.stodger.club/images/f3b1748a60524373afd39b5a91997b2c.jpg', 'N325');
INSERT INTO `tb_order_detail` VALUES (115, 163, 'P1565658547120', '水晶装饰摆件情人节创意礼物旋转发光diy定制照片礼品生日送女友 ', 2, 58.00, 'http://image.stodger.club/images/3617740d77004689bd0cacf809e0f732.jpg', '魔方蓝');
INSERT INTO `tb_order_detail` VALUES (116, 164, 'P1565618352736', '水晶玫瑰花3D内雕照片摆件开学生日结婚创意男送女朋友情人节礼物 ', 1, 65.00, 'http://image.stodger.club/images/91dbf8f17382443aa313d4d78c061af3.jpg', '冰凌蓝');
INSERT INTO `tb_order_detail` VALUES (117, 165, 'P1565656881629', '飞亚达JV唯路时手表男士潮流DW石英男表防水正品学生手表2019新款 ', 1, 266.00, 'http://image.stodger.club/images/2550e16014e1468fa649ea8cc5925949.jpg', '亮黄');
INSERT INTO `tb_order_detail` VALUES (118, 166, 'P1565660166443', '凌克加厚羊毛夏季空调房披肩办公室斗篷外套女披风围巾冬季两用厚', 1, 568.00, 'http://image.stodger.club/images/6cf2ff0bb816422d97dd317f26077561.jpg', '藏蓝灰');
INSERT INTO `tb_order_detail` VALUES (119, 166, 'P1565661155548', '夏夕银手链女四叶草s925银饰品日韩简约时尚学生送女友生日礼物 ', 1, 268.00, 'http://image.stodger.club/images/5bf23f5258904a4eb451381c4c9c1989.jpg', '方块手链');
INSERT INTO `tb_order_detail` VALUES (120, 167, 'P1565617921887', '雪人灯|生日礼物送男友小孩女生朋友闺蜜儿童创意浪漫情侣异地恋 ', 1, 66.00, 'http://image.stodger.club/images/11bbeadd3e6e45f0a8ce82017acdb53b.jpg', '女孩');
INSERT INTO `tb_order_detail` VALUES (121, 169, 'P1565572147183', 'NBA水晶篮球迷用品', 1, 78.00, 'http://image.stodger.club/images/f27515ca327e475393fe0c40c2dd07af.jpg', '20cm');
INSERT INTO `tb_order_detail` VALUES (122, 170, 'P1565570245236', '幸福是，最重要的小事 表白送礼套装3册', 1, 72.50, 'http://image.stodger.club/images/ef1c61fad9c1432ab9ba48ad2544b058.jpg', '三本');
INSERT INTO `tb_order_detail` VALUES (123, 171, 'P1565663930243', '中秋节表白礼物香皂肥皂花玫瑰礼盒女友女生老婆闺蜜生日礼品包邮 ', 1, 69.00, 'http://image.stodger.club/images/57bc38e5caa240e48149df5b4bc43cb5.jpg', '渐变加珍珠-红');
INSERT INTO `tb_order_detail` VALUES (124, 172, 'P1565663930243', '中秋节表白礼物香皂肥皂花玫瑰礼盒女友女生老婆闺蜜生日礼品包邮 ', 1, 69.00, 'http://image.stodger.club/images/57bc38e5caa240e48149df5b4bc43cb5.jpg', '玫瑰之吻-粉色');
INSERT INTO `tb_order_detail` VALUES (125, 173, 'P1565618352736', '水晶玫瑰花3D内雕照片摆件开学生日结婚创意男送女朋友情人节礼物 ', 3, 55.00, 'http://image.stodger.club/images/91dbf8f17382443aa313d4d78c061af3.jpg', '梦幻绿');
INSERT INTO `tb_order_detail` VALUES (126, 173, 'P1565658547120', '水晶装饰摆件情人节创意礼物旋转发光diy定制照片礼品生日送女友 ', 1, 58.00, 'http://image.stodger.club/images/3617740d77004689bd0cacf809e0f732.jpg', '魔方紫');

-- ----------------------------
-- Table structure for tb_product
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product`  (
  `product_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品Id',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '类目Id',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `main_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图',
  `small_picture` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '副图',
  `friend_status` int(11) NULL DEFAULT NULL COMMENT '好友状态',
  `lover_status` int(11) NULL DEFAULT NULL COMMENT '恋人状态',
  `holiday_status` int(11) NULL DEFAULT NULL COMMENT '节日状态',
  `kinsfolk_status` int(11) NULL DEFAULT NULL COMMENT '亲人状态',
  `status` int(255) NULL DEFAULT NULL COMMENT '上架/下架状态',
  `details` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情',
  `second_category_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `tb_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_product
-- ----------------------------
INSERT INTO `tb_product` VALUES ('P1565330709891', 6, '【良品铺子旗舰店】手剥松子218g 坚果炒货零食新货巴西松子包邮', 'https://gd2.alicdn.com/imgextra/i1/921599056/TB2Nu1MiLiSBuNkSnhJXXbDcpXa_!!921599056.jpg_400x400.jpg', 'https://gd2.alicdn.com/imgextra/i1/921599056/TB2Nu1MiLiSBuNkSnhJXXbDcpXa_!!921599056.jpg_400x400.jpg,http://image.stodger.club/images/ab19e62a105747d3bcd09933d522b1e0.jpg,', NULL, NULL, NULL, NULL, 0, 'http://image.stodger.club/images/0dc391e75335456d9d2ba88629a114f6.jpg,http://image.stodger.club/images/5f9d9cf9e82149de84f827b1c7510a03.jpg,http://image.stodger.club/images/9552a03d65414fedb1bea307eb8222e0.jpg,http://image.stodger.club/images/06d547c73cc24140be70d81b1000c40f.jpg,http://image.stodger.club/images/a6d258b1c4844f0fa532122d741f789c.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565330709892', 10, '华为手机', 'http://image.stodger.club/images/adedfdb8f26b4c0c8a67d93e9767f982.jpg', 'http://image.stodger.club/images/adedfdb8f26b4c0c8a67d93e9767f982.jpg', NULL, NULL, NULL, NULL, 1, '华为手机', NULL);
INSERT INTO `tb_product` VALUES ('P1565330709893', 10, 'vivo手机', 'http://image.stodger.club/images/adedfdb8f26b4c0c8a67d93e9767f982.jpg', 'http://image.stodger.club/images/adedfdb8f26b4c0c8a67d93e9767f982.jpg', NULL, NULL, NULL, NULL, 1, 'vivo手机', NULL);
INSERT INTO `tb_product` VALUES ('P1565330709895', 1, '红衣服', 'http://image.stodger.club/images/cd39881bb3cb4a65a14d0e02d6a06861.jpg', 'http://image.stodger.club/images/cd39881bb3cb4a65a14d0e02d6a06861.jpg,http://image.stodger.club/images/ab19e62a105747d3bcd09933d522b1e0.jpg,', 0, 0, 0, 1, 0, 'http://image.stodger.club/images/f8c70b140ae94b5198edf5c9bb608c61.jpg,http://image.stodger.club/images/701381f0ea5b42ada44788740bd2db1d.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565333432132', 3, '礼来', 'http://image.stodger.club/images/599d7771bca94783993f5ecc42f90ee0.jpg', 'http://image.stodger.club/images/599d7771bca94783993f5ecc42f90ee0.jpg,', 1, 0, 0, 0, 0, 'http://image.stodger.club/images/0dc391e75335456d9d2ba88629a114f6.jpg,http://image.stodger.club/images/5f9d9cf9e82149de84f827b1c7510a03.jpg,http://image.stodger.club/images/9552a03d65414fedb1bea307eb8222e0.jpg,http://image.stodger.club/images/06d547c73cc24140be70d81b1000c40f.jpg,http://image.stodger.club/images/a6d258b1c4844f0fa532122d741f789c.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565445872151', 7, '漫威系列音乐保温杯', 'http://image.stodger.club/images/a6c732bd602e47909278304d4b67bf09.jpg', 'http://image.stodger.club/images/a6c732bd602e47909278304d4b67bf09.jpg,http://image.stodger.club/images/4bed3171f1c24148bade5458844e8788.jpg,http://image.stodger.club/images/319bd4f6d8a14d5f8c314274eb01d68e.jpg,', 0, 0, 0, 1, 0, 'http://image.stodger.club/images/64b07371a5e7468b803ac4f5cca1369a.jpg,http://image.stodger.club/images/be3da0b95f684e8aae00216f6ab8e1f4.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565446638768', 3, '会理突尼斯软籽石榴', 'http://image.stodger.club/images/909c8f53d3624a01a4479cbb60b96107.jpg', 'http://image.stodger.club/images/909c8f53d3624a01a4479cbb60b96107.jpg,http://image.stodger.club/images/77f11fce4cd24f07a5c75fc28764035e.jpg,http://image.stodger.club/images/3362b047f73b4366906e2bfc7fa62f62.jpg,', 1, 1, 1, 1, 1, 'http://image.stodger.club/images/07b6c7963a594192897c2bfbeddc48de.jpg,http://image.stodger.club/images/46232932d63d4cef95aa37ab51019566.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565488006259', 6, '三只松鼠_每日坚果', 'http://image.stodger.club/images/bcc7f7492a654a4b98a54c3fdf31e9e0.jpg', 'http://image.stodger.club/images/bcc7f7492a654a4b98a54c3fdf31e9e0.jpg,http://image.stodger.club/images/a6e768ec48504dbea9f8d111697a40cc.jpg,', 1, 1, 1, 1, 1, 'http://image.stodger.club/images/7cdfb22460b3466093994d2e20549842.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565488284934', 6, '稻香村糕点礼盒', 'http://image.stodger.club/images/39a4814b7017445dbbe5c0cb02d4a9c9.jpg', 'http://image.stodger.club/images/39a4814b7017445dbbe5c0cb02d4a9c9.jpg,http://image.stodger.club/images/3b4e42a8ac124db38683277c6deb8508.jpg,', 1, 1, 1, 1, 1, 'http://image.stodger.club/images/1c4120b139c744569f9a8dcbd5ec6d0e.jpg,http://image.stodger.club/images/c7a0a97ccb0f4c0c9c3bfa878ea2101c.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565489051294', 1, '吉林敖东长白山西洋参切片', 'http://image.stodger.club/images/7db26258a17c424fbc4bc56378b16c3f.jpg', 'http://image.stodger.club/images/7db26258a17c424fbc4bc56378b16c3f.jpg,http://image.stodger.club/images/19894b0541404e9786abe7bfa6ec16ca.jpg,', 1, 1, 1, 1, 1, 'http://image.stodger.club/images/943843fddaa04738840885cbd9d924c9.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565489153399', 12, '西洋参礼盒', 'http://image.stodger.club/images/4fbb9367e0024ef69dd130cce4a2e118.jpg', 'http://image.stodger.club/images/4fbb9367e0024ef69dd130cce4a2e118.jpg,http://image.stodger.club/images/8376498462194ba5bd2801980de0b7df.jpg,', 1, 1, 1, 1, 1, 'http://image.stodger.club/images/8a2e9858f2394016a8dd55503d9f5cb6.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565489577749', 12, '洪湖莲子送礼佳品礼盒装', 'http://image.stodger.club/images/31ad579ba3dc4c31a1c27e34526cfdf9.jpg', 'http://image.stodger.club/images/31ad579ba3dc4c31a1c27e34526cfdf9.jpg,http://image.stodger.club/images/b57f23a9fe554af9845a296a50c49486.jpg,', 1, 1, 1, 1, 1, 'http://image.stodger.club/images/34e298df5c7040bc96c50ae0a9f1e0c4.png,http://image.stodger.club/images/412defedcddb47bdad854a00a54ecffa.png,', NULL);
INSERT INTO `tb_product` VALUES ('P1565489823371', 12, '极边青茶青心礼盒装', 'http://image.stodger.club/images/8316c9fcc19d4d81bfb565bd385f12ae.jpg', 'http://image.stodger.club/images/8316c9fcc19d4d81bfb565bd385f12ae.jpg,http://image.stodger.club/images/38766b8e693841c9b91fee6e89d17813.jpg,http://image.stodger.club/images/3ae90666fddd4a93afd8ae4325955273.jpg,', 1, 1, 1, 1, 1, 'http://image.stodger.club/images/87fc40d95422456e95d9558c369a0dfd.jpg,http://image.stodger.club/images/e8c09e6e48e346369b0bacd0fd30bcc2.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565490042571', 12, '大红袍茶叶礼盒装', 'http://image.stodger.club/images/64b1c3d71e314804b474424672264b79.jpg', 'http://image.stodger.club/images/64b1c3d71e314804b474424672264b79.jpg,', 1, 1, 1, 1, 1, 'http://image.stodger.club/images/d5c96e3c41994c5ab24ef6d51eb68654.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565490260938', 12, '宣威火腿老浦家年货送礼佳品', 'http://image.stodger.club/images/9bb7d959bc9b46f28a7f0cc23cece77d.jpg', 'http://image.stodger.club/images/9bb7d959bc9b46f28a7f0cc23cece77d.jpg,http://image.stodger.club/images/a88509b3e275423c8b996d0cbbf20743.jpg,', 1, 1, 1, 1, 1, 'http://image.stodger.club/images/88b2204941574488864fcaf3ec3643d1.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565490503473', 12, '东阿阿胶块片250g铁盒装', 'http://image.stodger.club/images/3c34967e34e342c1bd68bd866ca3ca18.png', 'http://image.stodger.club/images/3c34967e34e342c1bd68bd866ca3ca18.png,http://image.stodger.club/images/9568a109a33a42b5817d3e32220203e6.jpg,', 1, 1, 1, 1, 1, '', NULL);
INSERT INTO `tb_product` VALUES ('P1565491073109', 14, '一鹿携手 创意装饰品摆件', 'http://image.stodger.club/images/42a00684080041b5a0d0e83f3d2f4e79.jpg', 'http://image.stodger.club/images/42a00684080041b5a0d0e83f3d2f4e79.jpg,', 1, 1, 1, 1, 1, 'http://image.stodger.club/images/57612467905947c7abbb479c691fe7a3.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565491498947', 12, '初元复合肽营养饮品口服液', 'http://image.stodger.club/images/5614dbc0c1744d0393abfbf7f534e065.jpg', 'http://image.stodger.club/images/5614dbc0c1744d0393abfbf7f534e065.jpg,http://image.stodger.club/images/16576234783843cba9c140a63eef889e.jpg,', 1, 1, 1, 1, 1, 'http://image.stodger.club/images/442d552e50d34ba6adff36e0e8a4e8e9.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565491856893', 1, '中老年人补品营养品', 'http://image.stodger.club/images/5442580037cb4ffcbba398072e7d4bf5.jpg', 'http://image.stodger.club/images/5442580037cb4ffcbba398072e7d4bf5.jpg,http://image.stodger.club/images/82aca75cc71848bc97f4f4862fa43da4.jpg,', 1, 1, 1, 1, 1, '', NULL);
INSERT INTO `tb_product` VALUES ('P1565492491591', 8, '赛睿 sensei raw霜冻之蓝V2游戏鼠标rgb背光有线宏编程绝地求生吃鸡新款光学光电电竞lol英雄联盟 ', 'http://image.stodger.club/images/d6617fadd34c4a709e6b48b90a652334.jpg', 'http://image.stodger.club/images/d6617fadd34c4a709e6b48b90a652334.jpg,', 1, 1, 1, 1, 1, 'http://image.stodger.club/images/30b51985ac7141ae8dc2a1f140d42d50.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565492676927', 8, '送礼 罗技M558/M557无线蓝牙鼠标4.0', 'http://image.stodger.club/images/58c12f11aad04708a951fe741a9b2813.jpg', 'http://image.stodger.club/images/58c12f11aad04708a951fe741a9b2813.jpg,http://image.stodger.club/images/1ae80cd8719a4d039ccaf532512ed12e.jpg,', 1, 1, 1, 1, 1, 'http://image.stodger.club/images/e8496580357b48e4b637cd5277417835.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565493174210', 2, 'HUAWEI  华为P30 PRO', 'http://image.stodger.club/images/271173f72bb145c7b88b095bc6096b6a.jpg', 'http://image.stodger.club/images/271173f72bb145c7b88b095bc6096b6a.jpg,http://image.stodger.club/images/bed6c2e3260048018bc60a43b444149f.jpg,', 1, 1, 1, 1, 1, 'http://image.stodger.club/images/8dc7b799bd8e4da4b1338d3313b29192.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565569967871', 14, '招财生肖纯铜马摆件', 'http://image.stodger.club/images/ee8028b93248494290860d22d2417126.jpg', 'http://image.stodger.club/images/ee8028b93248494290860d22d2417126.jpg,http://image.stodger.club/images/fb030a57bc18432aa06d78cbcd3d69ab.jpg,', 1, 0, 0, 1, 1, '', NULL);
INSERT INTO `tb_product` VALUES ('P1565570132094', 1, '哈利波特1-7 精装豪华珍藏纪念版送礼佳品 ', 'http://image.stodger.club/images/2f91d2cb314342d4ad41adfb956eb532.jpg', 'http://image.stodger.club/images/2f91d2cb314342d4ad41adfb956eb532.jpg,http://image.stodger.club/images/1947b362df7547d7a1178cf9805a5b84.jpg,', 1, 0, 0, 1, 1, 'http://image.stodger.club/images/a35df9c17ef7413abc5427d6d1d97c07.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565570245236', 4, '幸福是，最重要的小事 表白送礼套装3册', 'http://image.stodger.club/images/ef1c61fad9c1432ab9ba48ad2544b058.jpg', 'http://image.stodger.club/images/ef1c61fad9c1432ab9ba48ad2544b058.jpg,', 1, 1, 0, 1, 0, '', NULL);
INSERT INTO `tb_product` VALUES ('P1565570421198', 4, '中国少年儿童百科全书全套4册', 'http://image.stodger.club/images/5e90fdc4ed03421f90d666e314c26731.jpg', 'http://image.stodger.club/images/5e90fdc4ed03421f90d666e314c26731.jpg,http://image.stodger.club/images/0ab18a5d7503448093a9905d950df3e7.jpg,', 1, 1, 0, 1, 1, '', NULL);
INSERT INTO `tb_product` VALUES ('P1565570563897', 1, '为你写下情书字帖', 'http://image.stodger.club/images/870d3517a8b64e5fa071e932a6ecb14e.jpg', 'http://image.stodger.club/images/870d3517a8b64e5fa071e932a6ecb14e.jpg,', 1, 1, 0, 1, 1, '', NULL);
INSERT INTO `tb_product` VALUES ('P1565571388139', 4, '零食大礼包一整箱', 'http://image.stodger.club/images/abc902a8718d473da11fc2d1cdbb6ceb.jpg', 'http://image.stodger.club/images/abc902a8718d473da11fc2d1cdbb6ceb.jpg,http://image.stodger.club/images/1d0c222742ce4f2c9e1725e22191f5a3.jpg,', 1, 1, 0, 0, 1, 'http://image.stodger.club/images/911f86a37ca5452589ba0579cea824b8.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565571861311', 1, '生日礼物送女友女朋友女生创意定制', 'http://image.stodger.club/images/04a3fe918efa489abdfbf86df6baa986.jpg', 'http://image.stodger.club/images/04a3fe918efa489abdfbf86df6baa986.jpg,', 0, 0, 0, 0, 1, 'http://image.stodger.club/images/d0d73e3c52a14bff990ffd0316280a10.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565572147183', 14, 'NBA水晶篮球迷用品', 'http://image.stodger.club/images/f27515ca327e475393fe0c40c2dd07af.jpg', 'http://image.stodger.club/images/f27515ca327e475393fe0c40c2dd07af.jpg,', 1, 0, 0, 0, 0, '', NULL);
INSERT INTO `tb_product` VALUES ('P1565572538244', 12, '燕天滋冰糖即食燕窝正品送礼', 'http://image.stodger.club/images/6889640b34294abd9b8ca72c91246572.jpg', 'http://image.stodger.club/images/6889640b34294abd9b8ca72c91246572.jpg,http://image.stodger.club/images/c2b29fa0a88743368433a09d2f7c2dbc.jpg,', 1, 1, 0, 0, 1, '', NULL);
INSERT INTO `tb_product` VALUES ('P1565613207327', 7, '定制七夕情人节礼物男送女友女朋友浪漫创意diy手工自制爱情生日 ', 'http://image.stodger.club/images/ce37ae8f72374298a66092b6d620efbc.jpg', 'http://image.stodger.club/images/ce37ae8f72374298a66092b6d620efbc.jpg,http://image.stodger.club/images/987d8e071d16408d8f0ba10116296eec.jpg,http://image.stodger.club/images/c93f18d9b488439eba8466688cc943cb.jpg,', 0, 1, 1, 0, 0, 'http://image.stodger.club/images/b742d57513d843b7abe8b0aa2f02eaa9.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565615721820', 14, '小灯塔', 'http://image.stodger.club/images/c72a26deb9274bcaa42d31e998d3552e.jpg', 'http://image.stodger.club/images/c72a26deb9274bcaa42d31e998d3552e.jpg,http://image.stodger.club/images/234ed12162c24c278c59e5e2861d2399.jpg,http://image.stodger.club/images/ce0f4a85b4ea44acac24736190970136.jpg,', 1, 0, 0, 1, 0, 'http://image.stodger.club/images/d3da1104cca948a886affde46381edcf.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565616677034', 14, '创意新中式仿古台灯客厅书房卧室装饰床头灯现代桌面茶几禅意台灯 ', 'http://image.stodger.club/images/94b63b94672a47eab87c75c9f5d28f0e.jpg', 'http://image.stodger.club/images/94b63b94672a47eab87c75c9f5d28f0e.jpg,http://image.stodger.club/images/14ee1231c45948ae9f650f9a40882225.jpg,http://image.stodger.club/images/91d27502268d42d3a29545bdec36a384.jpg,', 1, 0, 0, 0, 0, 'http://image.stodger.club/images/e27635d0cd614528b49887b0358a7fac.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565617921887', 14, '雪人灯|生日礼物送男友小孩女生朋友闺蜜儿童创意浪漫情侣异地恋 ', 'http://image.stodger.club/images/11bbeadd3e6e45f0a8ce82017acdb53b.jpg', 'http://image.stodger.club/images/11bbeadd3e6e45f0a8ce82017acdb53b.jpg,http://image.stodger.club/images/00ef11ad6bb248efaa551bf9e61fdae1.jpg,http://image.stodger.club/images/b9464846869a49e5aecc229ae8ff71f7.jpg,', 0, 1, 1, 0, 0, 'http://image.stodger.club/images/4e7ab2b7f33e47428d5a38f8d015d62c.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565618352736', 14, '水晶玫瑰花3D内雕照片摆件开学生日结婚创意男送女朋友情人节礼物 ', 'http://image.stodger.club/images/91dbf8f17382443aa313d4d78c061af3.jpg', 'http://image.stodger.club/images/91dbf8f17382443aa313d4d78c061af3.jpg,http://image.stodger.club/images/fe9474820e534d5aafa2aefc2f49345f.jpg,http://image.stodger.club/images/d06eddc630ce4c08bbfb6a636be16126.jpg,', 0, 1, 1, 0, 0, 'http://image.stodger.club/images/12c29f3a34974eafa1739a513d74a4bb.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565620130441', 14, '炭雕工艺品218家和福顺摆设碳雕乔迁礼品 电视柜客厅酒柜摆件', 'http://image.stodger.club/images/91bdee3dd45f4bf2a98934388e824c4f.jpg', 'http://image.stodger.club/images/91bdee3dd45f4bf2a98934388e824c4f.jpg,http://image.stodger.club/images/36cc47dba6d24f81a26e2742d25c35fa.jpg,http://image.stodger.club/images/5b3ed5644e7b4d78ae4d83ca5d26132b.jpg,http://image.stodger.club/images/b163624df0d24a57b5d586804c452f51.jpg,', 0, 0, 0, 1, 0, 'http://image.stodger.club/images/9856dc5beff843b5b69ae2eb6bcececf.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565656881629', 14, '飞亚达JV唯路时手表男士潮流DW石英男表防水正品学生手表2019新款 ', 'http://image.stodger.club/images/2550e16014e1468fa649ea8cc5925949.jpg', 'http://image.stodger.club/images/2550e16014e1468fa649ea8cc5925949.jpg,http://image.stodger.club/images/d6746b7f087441019b67b2d6962e1f91.jpg,http://image.stodger.club/images/a9ee0432c2d944ff8767b19e8e782f6e.jpg,http://image.stodger.club/images/1eb81a0e126e4d9291d24e9d6615fc00.jpg,', 1, 0, 0, 0, 0, 'http://image.stodger.club/images/4b36685cd08242f9b2b7f4b8445addd9.jpg,http://image.stodger.club/images/0096ac4501d54e8b97500697e6105ca4.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565657409571', 14, '时硕 智能手环多功能运动健身游泳手环测心率量血压手环电子计步器男女学生防水心电图手环VIVO小米手表', 'http://image.stodger.club/images/433a27f920d749ecaa202794c717c566.jpg', 'http://image.stodger.club/images/433a27f920d749ecaa202794c717c566.jpg,http://image.stodger.club/images/5f9a6b9251574ab6a356adcb0a8c4158.jpg,http://image.stodger.club/images/433a27f920d749ecaa202794c717c566.jpg,http://image.stodger.club/images/3f6aae30cae44181ac0120eee00e86cb.jpg,', 1, 0, 0, 1, 0, 'http://image.stodger.club/images/27c8d9e4ce9d438f9ac72d68e359fc3e.jpg,http://image.stodger.club/images/2778ab37f8614a62ac9e4b95a7e9416a.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565658547120', 14, '水晶装饰摆件情人节创意礼物旋转发光diy定制照片礼品生日送女友 ', 'http://image.stodger.club/images/3617740d77004689bd0cacf809e0f732.jpg', 'http://image.stodger.club/images/3617740d77004689bd0cacf809e0f732.jpg,http://image.stodger.club/images/49b2cce4ca3e40029f998fb82756effc.jpg,http://image.stodger.club/images/681e4e7c3b00440780830f84ccdf05ab.jpg,', 0, 1, 1, 1, 0, 'http://image.stodger.club/images/7ae12bf637e4453b8fe79d729fc21fed.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565659148922', 14, 'Givenchy/纪梵希高定香榭天鹅绒唇膏小羊皮口红304 306 305口红 ', 'http://image.stodger.club/images/f3b1748a60524373afd39b5a91997b2c.jpg', 'http://image.stodger.club/images/f3b1748a60524373afd39b5a91997b2c.jpg,http://image.stodger.club/images/d742105f5d054c9b816f94eedcdcd133.jpg,http://image.stodger.club/images/5b1ad7ce41fb4ee88a5b1b9aec73b505.jpg,http://image.stodger.club/images/b76457bb8288488b8fdc2c9b41b79d0b.jpg,', 1, 1, 1, 1, 0, 'http://image.stodger.club/images/79ed92d487a744fc9a4ed4d7d7f77aba.jpg,http://image.stodger.club/images/4ad3a28bb302476fba1f53a2c058ac7e.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565659611633', 14, '欧莱雅小美盒 全明星焕颜盒 赫莲娜绿宝瓶 至美眼霜T', 'http://image.stodger.club/images/cd1a62747bfb4531bc342e8bf5a40d76.jpg', 'http://image.stodger.club/images/cd1a62747bfb4531bc342e8bf5a40d76.jpg,http://image.stodger.club/images/65bb0fd760534e5d817b1a3f5088c444.jpg,http://image.stodger.club/images/ac4dab670bba4afda8550d46f40feb9d.jpg,http://image.stodger.club/images/7d744c67f6fd41e59a1ba5abc350fb11.jpg,', 1, 1, 1, 1, 0, 'http://image.stodger.club/images/51d80b64e12b48289b50e7072d3f5cdb.jpg,http://image.stodger.club/images/0b8b2ad19c0e4ae6a1c4d24b4c071330.jpg,http://image.stodger.club/images/b869e5493fdc4e22a99094ca4cbac18a.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565660166443', 1, '凌克加厚羊毛夏季空调房披肩办公室斗篷外套女披风围巾冬季两用厚', 'http://image.stodger.club/images/6cf2ff0bb816422d97dd317f26077561.jpg', 'http://image.stodger.club/images/6cf2ff0bb816422d97dd317f26077561.jpg,http://image.stodger.club/images/d0ac82944b944269aba7da76e0655173.jpg,http://image.stodger.club/images/85219498930148c28cc1b4e4eb1acd4a.jpg,http://image.stodger.club/images/2fa8e57d4f974713ba58720d06f8607f.jpg,', 1, 0, 0, 1, 0, 'http://image.stodger.club/images/858f1a3954214501a0730287d4300a40.jpg,http://image.stodger.club/images/5546b47afc2b4f3da4fc9e149e594ddb.jpg,http://image.stodger.club/images/d55d98287d774209a0317cf896d3231d.jpg,http://image.stodger.club/images/7b55150edd5a44e8b2bcd8f4d49d3f5b.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565660603968', 14, '创意生日中秋礼物光影纸雕成品剪纸卧室灯调光遥控3D立体抖音新品 ', 'http://image.stodger.club/images/718f2f365fa941878ac94b8eafad1c73.jpg', 'http://image.stodger.club/images/718f2f365fa941878ac94b8eafad1c73.jpg,http://image.stodger.club/images/7cb8a81646994a078f1d8c244abc5059.jpg,http://image.stodger.club/images/457321f9a95949b1abb6f59e8d6dad08.jpg,http://image.stodger.club/images/38c012dd94664d1d98cf8e16d7f2547c.jpg,', 1, 1, 1, 1, 0, 'http://image.stodger.club/images/7bbe4da7f8f14004b35d2743c2842179.jpg,http://image.stodger.club/images/d7ce11e4f8c145b1b0fd1baf58109ec0.jpg,http://image.stodger.club/images/d1ea86c461ea4dd3b929554bc95d2ba0.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565661155548', 14, '夏夕银手链女四叶草s925银饰品日韩简约时尚学生送女友生日礼物 ', 'http://image.stodger.club/images/5bf23f5258904a4eb451381c4c9c1989.jpg', 'http://image.stodger.club/images/5bf23f5258904a4eb451381c4c9c1989.jpg,http://image.stodger.club/images/2031fa7bd5dc49c4aaf0e16c11e9ff43.jpg,http://image.stodger.club/images/7afcd7d2714f44b3aff4e2a602024952.jpg,http://image.stodger.club/images/44d4ff74e8c74c77aa008841bb27fb2a.jpg,', 0, 1, 0, 0, 0, 'http://image.stodger.club/images/e87703efc42f4cee998bb461328c192c.jpg,http://image.stodger.club/images/6a4e32e0bc6d4cb5904351b0deb3d0d1.jpg,http://image.stodger.club/images/db00a22adaa84603b0ee3a6e87809b6e.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565663930243', 14, '中秋节表白礼物香皂肥皂花玫瑰礼盒女友女生老婆闺蜜生日礼品包邮 ', 'http://image.stodger.club/images/57bc38e5caa240e48149df5b4bc43cb5.jpg', 'http://image.stodger.club/images/57bc38e5caa240e48149df5b4bc43cb5.jpg,http://image.stodger.club/images/785c0a82dbde4c57af218f1e0ccdab44.jpg,http://image.stodger.club/images/e46ab66509324e8a8c2b0dd4f6c906fe.jpg,http://image.stodger.club/images/c8b95d13d3c449df9bb3b0a619069d67.jpg,', 0, 1, 1, 1, 0, 'http://image.stodger.club/images/8b2b7376701346a588dfbaa4a9e48083.jpg,http://image.stodger.club/images/f61dfe42b2344b6b8515602cdcd7f0c9.jpg,http://image.stodger.club/images/050655516ad04e329c006593b32a3afe.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565664951417', 14, '父亲节礼物送爸爸妈妈母爱如伞水晶创意礼物七彩发光个性生日礼品 ', 'http://image.stodger.club/images/709c2a3c691940f2a6633afb6969261a.jpg', 'http://image.stodger.club/images/709c2a3c691940f2a6633afb6969261a.jpg,http://image.stodger.club/images/5062ca8c7c774f75b3838c3044ec6a0f.jpg,', 0, 0, 1, 1, 0, 'http://image.stodger.club/images/13782f8c028740f1a3587e991ead0772.gif,', NULL);
INSERT INTO `tb_product` VALUES ('P1565665533029', 14, '智能磁吸灯磁力平衡灯浪漫网红台灯家居创意小夜灯结婚生日礼物女 ', 'http://image.stodger.club/images/1e7054902dfa48e18250a0f677c7e3a1.jpg', 'http://image.stodger.club/images/1e7054902dfa48e18250a0f677c7e3a1.jpg,http://image.stodger.club/images/8505ba3f6ba643a78c1b45f50bffe8cb.jpg,http://image.stodger.club/images/dc121c0069b64f73a34dd81454323fe1.jpg,http://image.stodger.club/images/b84a8971f63548f88a458845df476e28.jpg,', 1, 1, 1, 1, 0, 'http://image.stodger.club/images/ec7e502cc8904fe49d52ac37aec6b041.gif,http://image.stodger.club/images/953540c12eb04cd19a181de32c6ff08b.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565665948374', 14, '木头钟闹钟表电子可爱时钟静音床头夜光创意座钟客厅闹铃石英简约 ', 'http://image.stodger.club/images/ec77c08c1b91464dba69dd1d5379fab8.jpg', 'http://image.stodger.club/images/ec77c08c1b91464dba69dd1d5379fab8.jpg,http://image.stodger.club/images/432b1954c9064d8d926cb2ae566d883b.jpg,http://image.stodger.club/images/d020f025874245578db0060e80de1d5b.jpg,http://image.stodger.club/images/abd4c7c0ab3f417dbd4480a08d4966e7.jpg,', 1, 0, 0, 1, 0, 'http://image.stodger.club/images/cdc185da5e6f47cabd6b1a1d9c5f8b9c.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565677874201', 14, '古宣天然正品小叶紫檀木梳子定制刻字生日七夕情人礼物送老婆女友 ', 'http://image.stodger.club/images/4a23e943004845d191635c639c203dc2.jpg', 'http://image.stodger.club/images/4a23e943004845d191635c639c203dc2.jpg,http://image.stodger.club/images/42872d4562f0437aa7bf6234ba5f1e8c.jpg,http://image.stodger.club/images/c31fae3e302642c1b355c7c74894c072.jpg,http://image.stodger.club/images/01bfd3e377664a6bb170dc6fce8869f4.jpg,', 0, 1, 1, 1, 0, '', NULL);
INSERT INTO `tb_product` VALUES ('P1565678426996', 14, '香山电子秤家用精准人体秤体重秤智能健康电子称女生小型秤充电', 'http://image.stodger.club/images/02811d27d293488f9e3878ad83090e21.jpg', 'http://image.stodger.club/images/02811d27d293488f9e3878ad83090e21.jpg,http://image.stodger.club/images/02b4036ee9b0483d952d2f77a2b4d0bb.jpg,http://image.stodger.club/images/b109cf3e42464de092626c10f6419f7e.jpg,', 1, 0, 0, 1, 0, 'http://image.stodger.club/images/95707fba6ab047cab44ca28cc086a511.jpg,http://image.stodger.club/images/3ba9aab3356847eb8a9cdc82f6392596.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565678746335', 12, '德国DEDAKJ眼部按摩仪护眼仪眼睛按摩器眼保仪热敷去黑眼圈美眼仪 ', 'http://image.stodger.club/images/031ee4300249479f8748ef7aa2c29612.jpg', 'http://image.stodger.club/images/031ee4300249479f8748ef7aa2c29612.jpg,http://image.stodger.club/images/f413e8d6504647ae94b8d5a80854d405.jpg,', 1, 0, 0, 1, 0, 'http://image.stodger.club/images/0c78582a729b454b9ab00cbbc0768650.jpg,http://image.stodger.club/images/b225434cb52643c5ae92248543f27279.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565679058832', 14, '七夕情人节礼物生日礼物女生竹简情书玫瑰花创意浪漫新奇结婚纪念 ', 'http://image.stodger.club/images/3a1fb2e648254364a58ed0093a275f2b.jpg', 'http://image.stodger.club/images/3a1fb2e648254364a58ed0093a275f2b.jpg,http://image.stodger.club/images/f1a73fb222ea47a0a9df6d177a1b60f2.jpg,', 0, 1, 1, 1, 0, 'http://image.stodger.club/images/28b9cfc3eac44e64ac02ffecd8c52cf2.jpg,http://image.stodger.club/images/8a81ead57cad4f1b9c8b882071900ef6.jpg,http://image.stodger.club/images/eb7271a7ef6041839cd95050dd6efb94.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565679487508', 14, '弘艺堂木质首饰盒手饰品珠宝项链收纳盒中式古风复古大容量中国风', 'http://image.stodger.club/images/d0e751283db849b2aa6aa175facb7868.jpg', 'http://image.stodger.club/images/d0e751283db849b2aa6aa175facb7868.jpg,http://image.stodger.club/images/fedb1476fe2945fea0ccc0a33f66c6ad.jpg,', 0, 0, 0, 1, 0, 'http://image.stodger.club/images/518615d7da45491390771da537f6a819.jpg,http://image.stodger.club/images/904d4aabe7314dc284d0bc1632be9fe7.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565679772028', 14, 'NailEasy健康水性无味指甲油可撕拉夏季持久显白 指甲油套装 全套', 'http://image.stodger.club/images/4c932947d4be40b8b924500568e6fb26.jpg', 'http://image.stodger.club/images/4c932947d4be40b8b924500568e6fb26.jpg,http://image.stodger.club/images/6630c52ca11745b29bdb5a0073df4a11.jpg,', 1, 1, 1, 1, 0, 'http://image.stodger.club/images/33a84f04266444a8a8b60cad47479c15.jpg,http://image.stodger.club/images/fdd5ff0dc13e4226824a452db3b8f061.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565680150049', 14, '链条手表女款防水时尚款玫瑰金手表女石英表钢带气质女表潮流休闲', 'http://image.stodger.club/images/4d9e569f63124a60bfb4e8b596a1208b.jpg', 'http://image.stodger.club/images/4d9e569f63124a60bfb4e8b596a1208b.jpg,http://image.stodger.club/images/43943bf451e64281ab9b72c8c890f6c4.jpg,http://image.stodger.club/images/9cc612ea35aa4f6c9a96fa1c32487582.jpg,http://image.stodger.club/images/18e23b923b924759bb559b9d44ceb8d7.jpg,', 1, 1, 1, 1, 0, 'http://image.stodger.club/images/57620dde94064ba5a1c797692016ef67.jpg,http://image.stodger.club/images/556d1e6b771a450db4710089ffa61da5.jpg,http://image.stodger.club/images/32f98ead655c43a99832c8003ef1126b.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565680616069', 14, '傲薇{莲佑平安}秋冬新品长款毛衣链项链女玉髓平安扣吊坠银莲花', 'http://image.stodger.club/images/be95f83c6cb44ed7b5458c4a7438328f.jpg', 'http://image.stodger.club/images/be95f83c6cb44ed7b5458c4a7438328f.jpg,http://image.stodger.club/images/a791213ca0ef4fedac6ad49784f18d4a.jpg,', 1, 1, 1, 1, 0, 'http://image.stodger.club/images/ef6e3871d0f14180b78f62e1a9c8c043.jpg,http://image.stodger.club/images/cb248fa9e0fd40c081fd4e3e87a928c2.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565681626660', 9, '搜索 天猫 商品/品牌/店铺 本店所有商品      首页  ELLE女包19新款92114时尚个性金属色翻盖小方包链条包斜挎包包女 ', 'http://image.stodger.club/images/970db5febf0643fe8460771bc69ecb78.jpg', 'http://image.stodger.club/images/970db5febf0643fe8460771bc69ecb78.jpg,http://image.stodger.club/images/9026cf9a48f3444e944ce85ab1abbfe9.jpg,', 1, 1, 0, 0, 0, 'http://image.stodger.club/images/131a280c31aa4d59863400798e4ecac1.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565754745412', 7, 'Diller保温杯套装1314情侣保温杯一对套装情侣对杯表白生日礼物女', 'http://image.stodger.club/images/4623ffa2b4f840618516855c3aa6652a.jpg', 'http://image.stodger.club/images/4623ffa2b4f840618516855c3aa6652a.jpg,http://image.stodger.club/images/9911521bf0cd46cc80abe507d48fee88.jpg,', 0, 1, 0, 0, 0, 'http://image.stodger.club/images/cd4c89f32014482f85b3b3e8a437f0f3.jpg,http://image.stodger.club/images/bfbab415fa4d41dca2e0fc21d0f7ba47.jpg,http://image.stodger.club/images/288bd1d5c3e84e4c89f2ff9450e153a0.jpg,http://image.stodger.club/images/0553e761d3e14bec83506d36906a0623.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565765211538', 14, '正想木瓶无火香薰精油礼盒套装挥发藤条香薰室内卧室房间檀香熏香 ', 'http://image.stodger.club/images/f9122b4fde344984bd92ce2b1238c384.jpg', 'http://image.stodger.club/images/f9122b4fde344984bd92ce2b1238c384.jpg,http://image.stodger.club/images/13ffab72a5374bd7bec4e87010fd378b.jpg,', 1, 0, 0, 1, 0, 'http://image.stodger.club/images/3bc620872ee84ff0b7758951bc9042bc.jpg,http://image.stodger.club/images/fbef2fea1b174f659168f0dd9b9442d3.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565839644563', 16, '化妆镜台式led灯日光镜学生宿舍桌面可立梳妆镜大号充电家用网红', 'http://image.stodger.club/images/230032dd7b404b7d904bf1f0a082f2db.jpg', 'http://image.stodger.club/images/230032dd7b404b7d904bf1f0a082f2db.jpg,http://image.stodger.club/images/e3320957f5054e98b35fcc15e3294f13.jpg,', 0, 1, 0, 0, 0, 'http://image.stodger.club/images/2ae9d1cb89704ca09d0197209254b4b6.jpg,http://image.stodger.club/images/f7be47e103664092be295f30f588ecc6.jpg,http://image.stodger.club/images/eb8211380dec472a9a0bd22b4714219d.jpg,http://image.stodger.club/images/d0a46c95eda6489699aa720abc477c8f.jpg,http://image.stodger.club/images/e0a06c8109c549ff975d91cd38d32e11.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565849192045', 16, '沙漏伴睡灯创意睡眠网红音乐台灯卧室床头小夜灯浪漫生日礼物灯', 'http://image.stodger.club/images/e1f2a193becb40f3bb815f0c0452191d.jpg', 'http://image.stodger.club/images/e1f2a193becb40f3bb815f0c0452191d.jpg,http://image.stodger.club/images/19165b6a2deb403985e6ac2af1d28609.jpg,http://image.stodger.club/images/b9bf750f579343f29606a5919761b5f0.jpg,', 1, 1, 0, 0, 0, 'http://image.stodger.club/images/9ec2c79e9277438d89819f1335fc01a1.jpg,http://image.stodger.club/images/6f6983b434d04b71aaacfe9f2b6853f8.jpg,http://image.stodger.club/images/2e3733e3ee48451c92ce69832afc0185.jpg,http://image.stodger.club/images/73f8061d9e654cd39de6d43bf4354466.jpg,http://image.stodger.club/images/3b69a9618bf14ec1bd4873e6a04aeb60.jpg,http://image.stodger.club/images/934bc428c4dd44e78c5d2b977574ecb3.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565869120357', 14, '掌上游戏机FC掌机怀旧款psp游戏机充电宝sup怀旧便携式韩商言同款 ', 'http://image.stodger.club/images/f7316663b1c54febbbfd2d3624657019.jpg', 'http://image.stodger.club/images/f7316663b1c54febbbfd2d3624657019.jpg,http://image.stodger.club/images/c56ee4e23ede4f5ebfcb2cb8171d69ce.jpg,', 1, 0, 1, 0, 0, 'http://image.stodger.club/images/de2aa0d5b3054e97b4eb62e009363b83.jpg,http://image.stodger.club/images/65b5ba0f93f94d98b06520b684d2aee3.jpg,http://image.stodger.club/images/77f64604c80145a88c44488d65f699d9.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565869599075', 14, '私定记忆胶卷相册定制diy创意浪漫生日礼物送闺蜜女朋友情侣礼品', 'http://image.stodger.club/images/ff45b69d19694db1950de106d50db7cb.jpg', 'http://image.stodger.club/images/ff45b69d19694db1950de106d50db7cb.jpg,http://image.stodger.club/images/eb90fc7e12944157b830d990318b6c41.jpg,', 1, 1, 1, 0, 0, 'http://image.stodger.club/images/c9bcbfc95faa4adcbcbaac5bdb9eb862.jpg,http://image.stodger.club/images/78ce0109d3294c1a910c6a9546b75a02.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565869948629', 6, '生日礼物男生实用个性七夕情人节送男友朋友男士特别创意', 'http://image.stodger.club/images/1ff5184efc4448b29ca21ca442ddc3d2.jpg', 'http://image.stodger.club/images/1ff5184efc4448b29ca21ca442ddc3d2.jpg,http://image.stodger.club/images/6eb7e1f9b84e4642b40eb63f6e0ab771.jpg,', 1, 1, 1, 1, 0, 'http://image.stodger.club/images/b86bf33ee08e4a8d8e66de8f4385bf09.jpg,http://image.stodger.club/images/2f2ac21704ba4a45ab391852afdc5e7e.jpg,http://image.stodger.club/images/c48238419b234ab194f441e94fbf1381.jpg,', NULL);
INSERT INTO `tb_product` VALUES ('P1565943543395', 14, '格调时光', 'http://image.stodger.club/images/40bdce0f76f74e59ba8e9e4f43f972eb.jpg', 'http://image.stodger.club/images/40bdce0f76f74e59ba8e9e4f43f972eb.jpg,http://image.stodger.club/images/53ecbc8665a544c18ed1c88f2df48c9d.jpg,http://image.stodger.club/images/c0cd854be4174621b68bdaf7658ee9c5.png,', 1, 1, 1, 1, 0, 'http://image.stodger.club/images/c6fd4718dbd949e1bb3842a2e4dfe7bc.png,http://image.stodger.club/images/6cc7629ee4694a688f2b5130578aa763.png,http://image.stodger.club/images/365504621da24853a558672a9504da3b.png,http://image.stodger.club/images/dcd9a03cf23846c986956956de932f98.png,', NULL);

-- ----------------------------
-- Table structure for tb_sales
-- ----------------------------
DROP TABLE IF EXISTS `tb_sales`;
CREATE TABLE `tb_sales`  (
  `sales_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销量Id',
  `product_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品Id',
  `sale_count` int(11) NULL DEFAULT NULL COMMENT '销量',
  `year` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年份',
  `month` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月份',
  `day` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sales_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_sales
-- ----------------------------
INSERT INTO `tb_sales` VALUES (1, 'P1565330709891', 20, '2019', '03', NULL);
INSERT INTO `tb_sales` VALUES (2, 'P1565330709892', 30, '2018', '05', NULL);
INSERT INTO `tb_sales` VALUES (3, 'P1565330709893', 10, '2017', '04', NULL);
INSERT INTO `tb_sales` VALUES (4, 'P1565330709891', 30, '2019', '05', NULL);
INSERT INTO `tb_sales` VALUES (5, 'P1565615721820', 4, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (6, 'P1565330709891', 21, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (7, 'P1565333432132', 2, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (8, 'P1565330709895', 6, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (9, 'P1565617921887', 49, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (10, 'P1565659611633', 84, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (11, 'P1565659148922', 8, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (12, 'P1565570245236', 4, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (13, 'P1565445872151', 3, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (14, 'P1565613207327', 3, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (15, 'P1565680150049', 3, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (16, 'P1565660603968', 5, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (17, 'P1565616677034', 55, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (18, 'P1565657409571', 2, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (19, 'P1565572147183', 54, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (20, 'P1565620130441', 40, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (21, 'P1565656881629', 3, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (22, 'P1565677874201', 6, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (23, 'P1565680616069', 3, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (24, 'P1565658547120', 5, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (25, 'P1565765211538', 1, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (26, 'P1565679487508', 34, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (27, 'P1565663930243', 3, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (28, 'P1565665533029', 4, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (29, 'P1565849192045', 3, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (30, 'P1565679058832', 1, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (31, 'P1565869120357', 2, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (32, 'P1565618352736', 6, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (33, 'P1565678746335', 1, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (34, 'P1565679772028', 1, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (35, 'P1565869948629', 1, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (36, 'P1565869599075', 1, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (37, 'P1565660166443', 1, '2019', '08', NULL);
INSERT INTO `tb_sales` VALUES (38, 'P1565661155548', 1, '2019', '08', NULL);

-- ----------------------------
-- Table structure for tb_second_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_second_category`;
CREATE TABLE `tb_second_category`  (
  `second_category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '子类目Id',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '类目Id',
  `second_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  PRIMARY KEY (`second_category_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `tb_second_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_shop_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_cart`;
CREATE TABLE `tb_shop_cart`  (
  `shop_cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车Id',
  `user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户Id',
  `product_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品Id',
  `product_count` int(11) NULL DEFAULT NULL COMMENT '此商品购物车数量',
  `standard_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`shop_cart_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `tb_shop_cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 224 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_shop_cart
-- ----------------------------
INSERT INTO `tb_shop_cart` VALUES (60, 'llowid_8ba061d1', 'P1565615721820', 1, '美人鱼');
INSERT INTO `tb_shop_cart` VALUES (61, 'llowid_8ba061d1', 'P1565615721820', 1, '小花仙');
INSERT INTO `tb_shop_cart` VALUES (139, 'llowid_ae576758', 'P1565615721820', 1, '天使');
INSERT INTO `tb_shop_cart` VALUES (140, 'llowid_ae576758', 'P1565660166443', 1, '驼灰双面');
INSERT INTO `tb_shop_cart` VALUES (141, 'llowid_ae576758', 'P1565570245236', 1, '三本');
INSERT INTO `tb_shop_cart` VALUES (181, 'llowid_7281e648', 'P1565839644563', 1, '樱花粉');
INSERT INTO `tb_shop_cart` VALUES (186, 'llowid_f84541ae', 'P1565663930243', 1, '渐变加珍珠-红');
INSERT INTO `tb_shop_cart` VALUES (199, 'llowid_a3a42d08', 'P1565615721820', 1, '天使');
INSERT INTO `tb_shop_cart` VALUES (202, 'llowid_f84541ae', 'P1565617921887', 1, '女孩');
INSERT INTO `tb_shop_cart` VALUES (209, 'llowid_f84541ae', 'P1565665948374', 1, '3角黑木白字');
INSERT INTO `tb_shop_cart` VALUES (210, 'llowid_f84541ae', 'P1565618352736', 1, '梦幻绿');
INSERT INTO `tb_shop_cart` VALUES (213, 'llowid_f84541ae', 'P1565849192045', 1, '钻石沙漏灯');
INSERT INTO `tb_shop_cart` VALUES (214, 'llowid_f84541ae', 'P1565849192045', 1, '沙漏伴睡灯');
INSERT INTO `tb_shop_cart` VALUES (215, 'llowid_f84541ae', 'P1565681626660', 1, 'GD香槟金');
INSERT INTO `tb_shop_cart` VALUES (216, 'llowid_9846b8a4', 'P1565661155548', 3, '方块手链');
INSERT INTO `tb_shop_cart` VALUES (217, 'llowid_9846b8a4', 'P1565661155548', 2, '链恋不忘手链');

-- ----------------------------
-- Table structure for tb_standard
-- ----------------------------
DROP TABLE IF EXISTS `tb_standard`;
CREATE TABLE `tb_standard`  (
  `standard_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格Id',
  `product_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品Id',
  `standard_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `stock` int(255) NULL DEFAULT NULL COMMENT '库存',
  PRIMARY KEY (`standard_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `tb_standard_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 189 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_standard
-- ----------------------------
INSERT INTO `tb_standard` VALUES (1, 'P1565330709891', '中', 90.12, 8);
INSERT INTO `tb_standard` VALUES (2, 'P1565330709891', '小', 100.00, 14);
INSERT INTO `tb_standard` VALUES (3, 'P1565330709891', '大', 50.00, 27);
INSERT INTO `tb_standard` VALUES (4, 'P1565330709892', '绿的', 60.00, 39);
INSERT INTO `tb_standard` VALUES (10, 'P1565330709895', '红的', 96.00, 2);
INSERT INTO `tb_standard` VALUES (11, 'P1565330709895', '黑的', 63.00, 7450);
INSERT INTO `tb_standard` VALUES (12, 'P1565330709895', '白的', 78.00, 48);
INSERT INTO `tb_standard` VALUES (13, 'P1565330709895', '蓝色', 99.00, 75691);
INSERT INTO `tb_standard` VALUES (14, 'P1565333432132', '黑的', 63.00, 7459);
INSERT INTO `tb_standard` VALUES (15, 'P1565333432132', '红的', 78.00, 454);
INSERT INTO `tb_standard` VALUES (16, 'P1565333432132', '蓝色', 99.00, 75696);
INSERT INTO `tb_standard` VALUES (17, 'P1565330709893', 'm', 10.00, 10);
INSERT INTO `tb_standard` VALUES (18, 'P1565330709893', 's', 30.00, 800);
INSERT INTO `tb_standard` VALUES (19, 'P1565330709893', 'xl', 90.00, 600);
INSERT INTO `tb_standard` VALUES (20, 'P1565445872151', '500ml', 70.00, 25);
INSERT INTO `tb_standard` VALUES (21, 'P1565445872151', '600ml', 75.00, 46);
INSERT INTO `tb_standard` VALUES (22, 'P1565446638768', '2斤', 20.00, 40);
INSERT INTO `tb_standard` VALUES (23, 'P1565446638768', '4斤', 36.00, 20);
INSERT INTO `tb_standard` VALUES (33, 'P1565488006259', '750g/ 30天装', 499.00, 457);
INSERT INTO `tb_standard` VALUES (34, 'P1565488284934', '糕点礼盒1.5kg', 186.00, 454);
INSERT INTO `tb_standard` VALUES (35, 'P1565488284934', '糖醇礼盒1.5kg', 186.00, 354);
INSERT INTO `tb_standard` VALUES (36, 'P1565488284934', '糕点礼盒复古款1.5kg', 199.00, 653);
INSERT INTO `tb_standard` VALUES (37, 'P1565489051294', '西洋参礼盒', 798.00, 2343);
INSERT INTO `tb_standard` VALUES (38, 'P1565489153399', '西洋参礼盒', 798.00, 4323);
INSERT INTO `tb_standard` VALUES (39, 'P1565489577749', '红莲子礼盒', 160.00, 342);
INSERT INTO `tb_standard` VALUES (40, 'P1565489577749', '磨皮莲子礼盒', 160.00, 543);
INSERT INTO `tb_standard` VALUES (41, 'P1565489577749', '莲子组合装', 165.00, 654);
INSERT INTO `tb_standard` VALUES (42, 'P1565489823371', '260g', 450.00, 4254);
INSERT INTO `tb_standard` VALUES (43, 'P1565489823371', '520g', 800.00, 3254);
INSERT INTO `tb_standard` VALUES (44, 'P1565490042571', '200g', 450.00, 560);
INSERT INTO `tb_standard` VALUES (45, 'P1565490042571', '400g', 899.00, 234);
INSERT INTO `tb_standard` VALUES (46, 'P1565490260938', '2000g', 428.80, 232);
INSERT INTO `tb_standard` VALUES (47, 'P1565490260938', '4000g', 800.00, 543);
INSERT INTO `tb_standard` VALUES (48, 'P1565490503473', '250g/盒 原品1盒', 1299.00, 123);
INSERT INTO `tb_standard` VALUES (49, 'P1565491073109', '母鹿藤球折纸鹿台灯', 159.00, 508);
INSERT INTO `tb_standard` VALUES (50, 'P1565491073109', '父鹿藤球折纸鹿台灯', 159.00, 698);
INSERT INTO `tb_standard` VALUES (51, 'P1565491073109', '母鹿+父鹿藤球折纸鹿台灯', 309.00, 595);
INSERT INTO `tb_standard` VALUES (52, 'P1565491498947', '单盒装 ', 188.00, 863);
INSERT INTO `tb_standard` VALUES (53, 'P1565491498947', '礼盒装（2盒）', 376.00, 859);
INSERT INTO `tb_standard` VALUES (54, 'P1565491498947', '原箱装（6盒） ', 1128.00, 696);
INSERT INTO `tb_standard` VALUES (55, 'P1565491856893', '冬虫夏草菌丝体口服液', 128.00, 423);
INSERT INTO `tb_standard` VALUES (56, 'P1565492491591', 'Rival', 239.00, 414);
INSERT INTO `tb_standard` VALUES (57, 'P1565492491591', 'Sensei RAW光学V2', 339.00, 247);
INSERT INTO `tb_standard` VALUES (58, 'P1565492491591', 'Sensei 310', 369.00, 129);
INSERT INTO `tb_standard` VALUES (59, 'P1565492676927', 'M557黑色', 149.00, 409);
INSERT INTO `tb_standard` VALUES (60, 'P1565492676927', 'M558白色', 129.00, 456);
INSERT INTO `tb_standard` VALUES (61, 'P1565493174210', '亮黑色 8+128GB', 4988.00, 660);
INSERT INTO `tb_standard` VALUES (62, 'P1565493174210', '极光色 8+128GB', 4988.00, 794);
INSERT INTO `tb_standard` VALUES (63, 'P1565493174210', '赤茶橘 8+128GB', 4988.00, 817);
INSERT INTO `tb_standard` VALUES (64, 'P1565493174210', '珠光贝母 8+128GB', 4988.00, 717);
INSERT INTO `tb_standard` VALUES (65, 'P1565493174210', '天空之境 8+128GB', 4988.00, 851);
INSERT INTO `tb_standard` VALUES (66, 'P1565569967871', '小号', 998.88, 82);
INSERT INTO `tb_standard` VALUES (67, 'P1565569967871', '中号', 1688.88, 92);
INSERT INTO `tb_standard` VALUES (68, 'P1565569967871', '大号', 2688.88, 21);
INSERT INTO `tb_standard` VALUES (69, 'P1565570132094', '7本', 880.00, 60);
INSERT INTO `tb_standard` VALUES (70, 'P1565570245236', '三本', 72.50, 112);
INSERT INTO `tb_standard` VALUES (71, 'P1565570421198', '四册', 65.00, 45);
INSERT INTO `tb_standard` VALUES (72, 'P1565570563897', '全套', 54.90, 68);
INSERT INTO `tb_standard` VALUES (73, 'P1565571388139', '世界那么大（大礼盒）', 128.00, 1377);
INSERT INTO `tb_standard` VALUES (74, 'P1565571388139', '猪饲料（大礼盒）', 128.00, 5820);
INSERT INTO `tb_standard` VALUES (75, 'P1565571861311', '金箔玫瑰+底座+竹简情书 ', 248.00, 759);
INSERT INTO `tb_standard` VALUES (76, 'P1565571861311', '金箔玫瑰+竹简情书 ', 218.00, 965);
INSERT INTO `tb_standard` VALUES (77, 'P1565572147183', '6cm', 38.00, 154);
INSERT INTO `tb_standard` VALUES (78, 'P1565572147183', '8cm', 53.00, 133);
INSERT INTO `tb_standard` VALUES (79, 'P1565572147183', '20cm', 78.00, 101);
INSERT INTO `tb_standard` VALUES (80, 'P1565572538244', '一件', 368.00, 1168);
INSERT INTO `tb_standard` VALUES (81, 'P1565613207327', '遇见你', 50.00, 100);
INSERT INTO `tb_standard` VALUES (82, 'P1565613207327', '小白', 60.00, 47);
INSERT INTO `tb_standard` VALUES (83, 'P1565613207327', '一辈子', 45.00, 39);
INSERT INTO `tb_standard` VALUES (84, 'P1565615721820', '天使', 100.00, 99);
INSERT INTO `tb_standard` VALUES (85, 'P1565615721820', '小花仙', 100.00, 98);
INSERT INTO `tb_standard` VALUES (86, 'P1565615721820', '美人鱼', 100.00, 99);
INSERT INTO `tb_standard` VALUES (87, 'P1565616677034', '元空', 69.00, 100);
INSERT INTO `tb_standard` VALUES (88, 'P1565616677034', '寂灵', 69.00, 97);
INSERT INTO `tb_standard` VALUES (89, 'P1565616677034', '萧瑟', 69.00, 98);
INSERT INTO `tb_standard` VALUES (90, 'P1565617921887', '男孩', 66.00, 48);
INSERT INTO `tb_standard` VALUES (91, 'P1565617921887', '女孩', 66.00, 62);
INSERT INTO `tb_standard` VALUES (92, 'P1565617921887', '双人', 99.00, 62);
INSERT INTO `tb_standard` VALUES (93, 'P1565618352736', '飘逸紫', 45.00, 99);
INSERT INTO `tb_standard` VALUES (94, 'P1565618352736', '梦幻绿', 55.00, 97);
INSERT INTO `tb_standard` VALUES (95, 'P1565618352736', '冰凌蓝', 65.00, 48);
INSERT INTO `tb_standard` VALUES (96, 'P1565620130441', '家', 55.00, 55);
INSERT INTO `tb_standard` VALUES (97, 'P1565620130441', '和', 55.00, 65);
INSERT INTO `tb_standard` VALUES (98, 'P1565620130441', '福', 55.00, 34);
INSERT INTO `tb_standard` VALUES (99, 'P1565620130441', '顺', 60.00, 44);
INSERT INTO `tb_standard` VALUES (100, 'P1565656881629', '逸白', 266.00, 11);
INSERT INTO `tb_standard` VALUES (101, 'P1565656881629', '耀黑', 266.00, 41);
INSERT INTO `tb_standard` VALUES (102, 'P1565656881629', '辉绿', 266.00, 23);
INSERT INTO `tb_standard` VALUES (103, 'P1565656881629', '亮黄', 266.00, 64);
INSERT INTO `tb_standard` VALUES (104, 'P1565657409571', '白栢', 159.00, 13);
INSERT INTO `tb_standard` VALUES (105, 'P1565657409571', '徽黑', 159.00, 30);
INSERT INTO `tb_standard` VALUES (106, 'P1565657409571', '簺绿', 159.00, 43);
INSERT INTO `tb_standard` VALUES (107, 'P1565657409571', '星红', 159.00, 71);
INSERT INTO `tb_standard` VALUES (108, 'P1565658547120', '魔方紫', 58.00, 31);
INSERT INTO `tb_standard` VALUES (109, 'P1565658547120', '魔方绿', 58.00, 41);
INSERT INTO `tb_standard` VALUES (110, 'P1565658547120', '魔方蓝', 58.00, 23);
INSERT INTO `tb_standard` VALUES (111, 'P1565659148922', 'N324', 328.00, 45);
INSERT INTO `tb_standard` VALUES (112, 'P1565659148922', 'N204', 300.00, 53);
INSERT INTO `tb_standard` VALUES (113, 'P1565659148922', 'N325', 428.00, 35);
INSERT INTO `tb_standard` VALUES (114, 'P1565659148922', 'N327', 288.00, 23);
INSERT INTO `tb_standard` VALUES (115, 'P1565659611633', '全明星焕颜盒', 328.00, 41);
INSERT INTO `tb_standard` VALUES (116, 'P1565659611633', '全明星润漾盒', 458.00, 33);
INSERT INTO `tb_standard` VALUES (117, 'P1565659611633', '轻颜潮妆盒', 528.00, 69);
INSERT INTO `tb_standard` VALUES (118, 'P1565659611633', '净妍发光盒', 840.00, 167);
INSERT INTO `tb_standard` VALUES (119, 'P1565660166443', '驼灰双面', 588.00, 45);
INSERT INTO `tb_standard` VALUES (120, 'P1565660166443', '酒红黑双面', 588.00, 48);
INSERT INTO `tb_standard` VALUES (121, 'P1565660166443', '藏蓝灰', 568.00, 24);
INSERT INTO `tb_standard` VALUES (122, 'P1565660166443', '藏蓝驼', 588.00, 58);
INSERT INTO `tb_standard` VALUES (123, 'P1565660603968', '白首', 56.00, 33);
INSERT INTO `tb_standard` VALUES (124, 'P1565660603968', '两小无猜', 58.00, 44);
INSERT INTO `tb_standard` VALUES (125, 'P1565660603968', '牵鹿', 65.00, 76);
INSERT INTO `tb_standard` VALUES (126, 'P1565660603968', '浪漫巴黎', 56.00, 96);
INSERT INTO `tb_standard` VALUES (131, 'P1565663930243', '渐变加珍珠-红', 69.00, 99);
INSERT INTO `tb_standard` VALUES (132, 'P1565663930243', '玫瑰之吻-蓝色', 69.00, 233);
INSERT INTO `tb_standard` VALUES (133, 'P1565663930243', '玫瑰之吻-红色', 69.00, 22);
INSERT INTO `tb_standard` VALUES (134, 'P1565663930243', '玫瑰之吻-粉色', 69.00, 44);
INSERT INTO `tb_standard` VALUES (135, 'P1565664951417', '母爱如伞', 88.00, 100);
INSERT INTO `tb_standard` VALUES (136, 'P1565664951417', '父爱如山', 88.00, 100);
INSERT INTO `tb_standard` VALUES (137, 'P1565665533029', '魅影黑平衡灯椭圆款', 908.00, 96);
INSERT INTO `tb_standard` VALUES (138, 'P1565665533029', '魅影黑平衡灯椭圆款', 888.00, 134);
INSERT INTO `tb_standard` VALUES (139, 'P1565665533029', '纯洁白平衡灯椭圆款', 1080.00, 234);
INSERT INTO `tb_standard` VALUES (140, 'P1565665533029', '榉木色平衡灯椭圆款', 958.00, 344);
INSERT INTO `tb_standard` VALUES (141, 'P1565665948374', '3角黑木白字', 58.00, 100);
INSERT INTO `tb_standard` VALUES (142, 'P1565665948374', '厚款黑木白字', 45.00, 322);
INSERT INTO `tb_standard` VALUES (143, 'P1565665948374', '长款木色白字', 65.00, 543);
INSERT INTO `tb_standard` VALUES (144, 'P1565665948374', '长款黑木绿字', 87.00, 554);
INSERT INTO `tb_standard` VALUES (145, 'P1565677874201', '古宣非洲小叶紫檀木梳 孔雀彩绘款 玉石四季豆吊坠款', 588.00, 166);
INSERT INTO `tb_standard` VALUES (146, 'P1565677874201', '古宣非洲小叶紫檀木梳 孔雀彩绘款 玉石平安吊坠款', 588.00, 345);
INSERT INTO `tb_standard` VALUES (147, 'P1565677874201', '古宣非洲小叶紫檀木梳 孔雀彩绘款 玉石年年有余吊坠款', 588.00, 233);
INSERT INTO `tb_standard` VALUES (148, 'P1565677874201', '古宣正品非洲小叶紫檀梳子 孔雀彩绘款 红色流苏吊坠款', 588.00, 563);
INSERT INTO `tb_standard` VALUES (149, 'P1565678426996', '爵士黑', 169.00, 145);
INSERT INTO `tb_standard` VALUES (150, 'P1565678426996', '轻盈白', 169.00, 345);
INSERT INTO `tb_standard` VALUES (151, 'P1565678426996', '玫瑰金', 169.00, 23);
INSERT INTO `tb_standard` VALUES (152, 'P1565678746335', 'GE10(高配版-时尚白', 899.00, 177);
INSERT INTO `tb_standard` VALUES (153, 'P1565678746335', 'GE20 (触控版-香槟金）', 799.00, 145);
INSERT INTO `tb_standard` VALUES (154, 'P1565679058832', '金色刻字竹简', 256.00, 234);
INSERT INTO `tb_standard` VALUES (155, 'P1565679058832', '粉色刻字竹简', 256.00, 344);
INSERT INTO `tb_standard` VALUES (156, 'P1565679487508', '年年有余', 799.00, 165);
INSERT INTO `tb_standard` VALUES (157, 'P1565679487508', '花开富贵', 799.00, 44);
INSERT INTO `tb_standard` VALUES (158, 'P1565679772028', '都市粉', 540.00, 155);
INSERT INTO `tb_standard` VALUES (159, 'P1565679772028', '优雅粉', 520.00, 244);
INSERT INTO `tb_standard` VALUES (160, 'P1565680150049', '玫瑰金白面', 128.00, 232);
INSERT INTO `tb_standard` VALUES (161, 'P1565680150049', '银带白面', 128.00, 219);
INSERT INTO `tb_standard` VALUES (162, 'P1565680150049', '金带白面', 128.00, 320);
INSERT INTO `tb_standard` VALUES (163, 'P1565680150049', '玫瑰金红面', 128.00, 123);
INSERT INTO `tb_standard` VALUES (164, 'P1565680616069', '升级版吊坠配珠链款  ', 588.00, 111);
INSERT INTO `tb_standard` VALUES (165, 'P1565680616069', '升级版单独吊坠送黑绳', 588.00, 120);
INSERT INTO `tb_standard` VALUES (166, 'P1565681626660', 'BK黑色', 798.00, 133);
INSERT INTO `tb_standard` VALUES (167, 'P1565681626660', 'GD香槟金', 798.00, 122);
INSERT INTO `tb_standard` VALUES (168, 'P1565754745412', '黑白', 99.00, 100);
INSERT INTO `tb_standard` VALUES (169, 'P1565765211538', '美-蓝海洋味', 58.00, 99);
INSERT INTO `tb_standard` VALUES (170, 'P1565765211538', '唯美-木棉橄榄花味', 58.00, 200);
INSERT INTO `tb_standard` VALUES (171, 'P1565839644563', '象牙白', 360.00, 200);
INSERT INTO `tb_standard` VALUES (172, 'P1565839644563', '樱花粉', 360.00, 200);
INSERT INTO `tb_standard` VALUES (173, 'P1565849192045', '沙漏伴睡灯', 198.00, 200);
INSERT INTO `tb_standard` VALUES (174, 'P1565849192045', '钻石沙漏灯', 198.00, 198);
INSERT INTO `tb_standard` VALUES (175, 'P1565661155548', '爱心手链', 288.00, 44);
INSERT INTO `tb_standard` VALUES (176, 'P1565661155548', '方块手链', 268.00, 34);
INSERT INTO `tb_standard` VALUES (177, 'P1565661155548', '链恋不忘手链', 288.00, 76);
INSERT INTO `tb_standard` VALUES (178, 'P1565661155548', '竹节手链', 288.00, 34);
INSERT INTO `tb_standard` VALUES (179, 'P1565869120357', 'SUP单人版红色（400游戏）', 99.00, 164);
INSERT INTO `tb_standard` VALUES (180, 'P1565869120357', 'SUP单人版黑色（400游戏）', 99.00, 134);
INSERT INTO `tb_standard` VALUES (181, 'P1565869599075', '10张内【少女粉】', 54.00, 55);
INSERT INTO `tb_standard` VALUES (182, 'P1565869599075', '10张内【玫瑰红】', 54.00, 43);
INSERT INTO `tb_standard` VALUES (185, 'P1565943543395', '尊贵-黑色', 159.00, 200);
INSERT INTO `tb_standard` VALUES (186, 'P1565943543395', '百搭-白色', 159.00, 200);
INSERT INTO `tb_standard` VALUES (187, 'P1565869948629', '蓝冰', 99.00, 33);
INSERT INTO `tb_standard` VALUES (188, 'P1565869948629', '黑冰', 99.00, 43);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户Id',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名 昵称',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `register_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('llowid_0011e4c7', 'user_1a486180', '141C4F5AE99EA0DED964E1E866711674', '1565596619263@qq.com', '17374383223', NULL, '女', NULL, '吉林', NULL, '2019-08-12 15:56:59', 1);
INSERT INTO `tb_user` VALUES ('llowid_040dc5e4', 'user_db8ad522', 'BBD39D4BFA8EF65CD7902F6722A4EDC9', '33@qq.com', '17374383221', 'http://image.stodger.club/images/716a061faa2e486db44ad6d9f1f9df9e.jpg', '保密', NULL, '内蒙古', '2019-09-14', '2019-08-15 20:02:40', 1);
INSERT INTO `tb_user` VALUES ('llowid_7281e648', 'user_42b142d4', '253AC1C328F9D9A616CBD936646E58DD', '1@qq.com', NULL, NULL, '女', NULL, '重庆', NULL, '2019-08-15 19:23:00', 1);
INSERT INTO `tb_user` VALUES ('llowid_76c4740f', 'user_10624441', 'FAD1B6F88A823D6CF58A1AE2CC6545A0', '1565595387590@qq.com', NULL, NULL, '女', NULL, '安徽', NULL, '2019-08-12 15:36:27', 1);
INSERT INTO `tb_user` VALUES ('llowid_76cb9ed1', 'user_861b3acd', '87871FB0BD8C7A2C4DA72CE477BD0146', '1565595386628@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:36:26', 1);
INSERT INTO `tb_user` VALUES ('llowid_76de86cf', 'user_4e178a12', 'F4BD9A7365F1E90D0487C17ED6532255', '1565596616213@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:56:56', 1);
INSERT INTO `tb_user` VALUES ('llowid_776c2129', 'user_54ee3aa1', '2604CEB52831929915B195089B88217F', '1565596611118@qq.com', NULL, NULL, '女', NULL, '安徽', NULL, '2019-08-12 15:56:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_77862491', 'user_4cda8487', '4699A9DD63B4E95BC5C749B6DB8BC1E4', '1565595115837@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:31:55', 1);
INSERT INTO `tb_user` VALUES ('llowid_7789723a', 'user_463dba2f', 'EBEC8008B6721084A3F017220373B3AC', '1565595385893@qq.com', NULL, NULL, '男', NULL, '山东', NULL, '2019-08-12 15:36:25', 1);
INSERT INTO `tb_user` VALUES ('llowid_77a27567', 'user_740a4969', '58D1D4F1F32C5AA22497D7264F9FB6EB', '1565596612283@qq.com', NULL, NULL, '女', NULL, '台湾', NULL, '2019-08-12 15:56:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_78028644', 'user_2ba81522', '209139B2C0A831D2AE6EC16B51986BD2', '1565595365189@qq.com', NULL, NULL, '男', NULL, '天津', NULL, '2019-08-12 15:36:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_782401d4', 'user_72b8b8be', 'D328E7802EFA7A71BCBF6B4A0898C328', '1565595379810@qq.com', NULL, NULL, '男', NULL, '陕西', NULL, '2019-08-12 15:36:19', 1);
INSERT INTO `tb_user` VALUES ('llowid_7840c459', 'user_124d69e4', '40C340FEDA4C457523ACD1F877BE34CD', '1565595365487@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:36:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_784ce399', 'user_2d39569b', '675FF045084B5DF6BA5BBF24FCB55B1B', '1565596616902@qq.com', NULL, NULL, '女', NULL, '贵州', NULL, '2019-08-12 15:56:56', 1);
INSERT INTO `tb_user` VALUES ('llowid_784e52bb', 'user_4d50a3d2', 'AB50F0D6613AE4628B3D2692997342E0', '1565595380595@qq.com', NULL, NULL, '女', NULL, '福建', NULL, '2019-08-12 15:36:20', 1);
INSERT INTO `tb_user` VALUES ('llowid_787a8e85', 'user_6e97ba19', '1C40717D7342AE5E4842F0CBC3FB3EF8', '1565595368512@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:36:08', 1);
INSERT INTO `tb_user` VALUES ('llowid_787f9acf', 'user_dc06d4e7', '76189C658692ED6DC4DCAE9A99E40428', '1565596606209@qq.com', NULL, NULL, '女', NULL, '辽宁', NULL, '2019-08-12 15:56:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_7883b6eb', 'user_cd4494e8', '886B57712C8635BE35CA170600B22053', '1565596621709@qq.com', NULL, NULL, '女', NULL, '澳门', NULL, '2019-08-12 15:57:01', 1);
INSERT INTO `tb_user` VALUES ('llowid_788c4ca4', 'user_23c9d230', '03FB4945B244EE6A51BCE6ADB392E442', '1565595363093@qq.com', NULL, NULL, '男', NULL, '河南', NULL, '2019-08-12 15:36:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_78938191', 'user_4e219182', 'A3CB4C359BDA60CE73D57FF99917D591', '1565595362538@qq.com', NULL, NULL, '女', NULL, '辽宁', NULL, '2019-08-12 15:36:02', 1);
INSERT INTO `tb_user` VALUES ('llowid_78a3bdd3', 'user_b149bbb7', '7196CC4A8A5540D2F3A25C3D0ED7DE5D', '1565595364271@qq.com', NULL, NULL, '男', NULL, '湖南', NULL, '2019-08-12 15:36:04', 1);
INSERT INTO `tb_user` VALUES ('llowid_78a9c4ed', 'user_dbf01f4d', 'ECFAB10CC5F05D44646F3FDDF980BDA5', '1565596621575@qq.com', NULL, NULL, '女', NULL, '辽宁', NULL, '2019-08-12 15:57:01', 1);
INSERT INTO `tb_user` VALUES ('llowid_78d5d546', 'user_fca6b108', '4661036F7861B8D38155DB8EC7C015DA', '1565595370756@qq.com', NULL, NULL, '男', NULL, '北京', NULL, '2019-08-12 15:36:10', 1);
INSERT INTO `tb_user` VALUES ('llowid_78ea8807', 'user_a18da828', '022FED694E03D975935CA48CE9BA8499', '1565595270120@qq.com', NULL, NULL, '男', NULL, '北京', NULL, '2019-08-12 15:34:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_7927fd89', 'user_1b6ffe70', '253AC1C328F9D9A616CBD936646E58DD', '1739434147@qq.com', '15343057724', 'http://image.stodger.club/images/c89ead6c6f33485a824d119d4f46c1ea.jpg', '女', NULL, '山东', '2019-08-01', '2019-08-16 16:04:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_7939b05c', 'user_74d8952f', 'F910FAB0057F2C6C79A77887FC4737AC', '1565596624649@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:57:04', 1);
INSERT INTO `tb_user` VALUES ('llowid_795aa04a', 'user_df634db1', '475583EF2F1119485715CA5B6A38B52C', '1565595171378@qq.com', NULL, NULL, '男', NULL, '台湾', NULL, '2019-08-12 15:32:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_79636ab7', 'user_81be9d0f', '5719742A7D9AFC185187FD6AAE106160', '1565596609171@qq.com', NULL, NULL, '女', NULL, '台湾', NULL, '2019-08-12 15:56:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_7a040431', 'user_67b3a359', '8BAFD887115851714928DDF3F8D11BDF', '1565595374389@qq.com', NULL, NULL, '男', NULL, '澳门', NULL, '2019-08-12 15:36:14', 1);
INSERT INTO `tb_user` VALUES ('llowid_7a04d75b', 'user_c32b40bf', '8256942F1A402F8B7A32A56F758BBDCE', '1565595366303@qq.com', NULL, NULL, '女', NULL, '云南', NULL, '2019-08-12 15:36:06', 1);
INSERT INTO `tb_user` VALUES ('llowid_84690af2', 'user_f31eff5d', '5634B31543ABE466F59F5786D4EC350D', '3@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-14 16:07:32', 1);
INSERT INTO `tb_user` VALUES ('llowid_848848d9', 'user_e5489bbb', 'D6F6E22CC7E89479EBA2AECE670BAA90', '1565595114199@qq.com', NULL, NULL, '女', NULL, '内蒙古', NULL, '2019-08-12 15:31:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_8496b75c', 'user_732841c8', '46CBA5DD583BCC7CA573340A3BC39589', '1565595269963@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:34:29', 1);
INSERT INTO `tb_user` VALUES ('llowid_84a70978', 'user_0a8ff244', '4696F895B028FA9EA07B312946DB2FB0', '1565594632737@qq.com', NULL, NULL, '男', NULL, '浙江', NULL, '2019-08-12 15:23:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_84b60be3', 'user_d3d57e74', '9064E8B408FDE6F28C924268347D6C5E', '1565594929420@qq.com', NULL, NULL, '男', NULL, '广东', NULL, '2019-08-12 15:28:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_84bcbb9a', 'user_5c0ce4c2', 'E28E98356D7247FBCAE2176A26017E21', '1565596605856@qq.com', NULL, NULL, '女', NULL, '上海', NULL, '2019-08-12 15:56:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_84cef80e', 'user_e8b788c9', 'ADEA93703E0D9F8B1D8D3A76690368FC', '1565595389573@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:36:29', 1);
INSERT INTO `tb_user` VALUES ('llowid_84fba8ff', 'user_c82bebb8', '6DE4294C2A0A3A26952C0F904FE6FDB5', '1565596612895@qq.com', NULL, NULL, '女', NULL, '西藏', NULL, '2019-08-12 15:56:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_8535e447', 'user_0ae8e3fd', 'E7645C78A7028B68F1D98C5139FCA842', '1565595376780@qq.com', NULL, NULL, '男', NULL, '新疆', NULL, '2019-08-12 15:36:16', 1);
INSERT INTO `tb_user` VALUES ('llowid_853e43c7', 'user_272eac88', 'D1A077B1C4EB162702B87FF7FE95F5F4', '1565596609905@qq.com', NULL, NULL, '女', NULL, '河南', NULL, '2019-08-12 15:56:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_854a482a', 'user_dd96474f', '43458891F8A6BB7E09DC26FD2FB8EBFC', '1565596611770@qq.com', NULL, NULL, '女', NULL, '云南', NULL, '2019-08-12 15:56:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_855f7789', 'user_61b0f769', '9A7C585AC29FD7B2138C8D171F1AB8DC', '1565595173718@qq.com', NULL, NULL, '女', NULL, '上海', NULL, '2019-08-12 15:32:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_8567c485', 'user_84896aac', 'A9603969F781C80EE9D63807D6240094', '1565595114049@qq.com', NULL, NULL, '女', NULL, '陕西', NULL, '2019-08-12 15:31:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_8584c9d2', 'user_314aaf88', '19A0272F5786C2ED9A263416A1900B18', '1565595361335@qq.com', NULL, NULL, '女', NULL, '澳门', NULL, '2019-08-12 15:36:01', 1);
INSERT INTO `tb_user` VALUES ('llowid_858c9c93', 'user_1d84b1d9', '42BD6F2883EC1604CE3818C1483D5702', '1565595383331@qq.com', NULL, NULL, '男', NULL, '北京', NULL, '2019-08-12 15:36:23', 1);
INSERT INTO `tb_user` VALUES ('llowid_8592a89e', 'user_40994a65', '35FE315AF469503EBAAA39D00F5D2009', '1565595393430@qq.com', NULL, NULL, '男', NULL, '天津', NULL, '2019-08-12 15:36:33', 1);
INSERT INTO `tb_user` VALUES ('llowid_86179f4d', 'user_7314ec54', 'BF129A3D7808ABFC907D1EC94C49B206', '1565595384096@qq.com', NULL, NULL, '女', NULL, '湖南', NULL, '2019-08-12 15:36:24', 1);
INSERT INTO `tb_user` VALUES ('llowid_8667b64c', 'user_e9daadca', '5D4CFF166967DF44F6BD74640868129A', '1565595378413@qq.com', NULL, NULL, '男', NULL, '西藏', NULL, '2019-08-12 15:36:18', 1);
INSERT INTO `tb_user` VALUES ('llowid_86bb4226', 'user_bf439492', 'A775E61925663106892B850CC8513EFE', '1565594672080@qq.com', NULL, NULL, '男', NULL, '陕西', NULL, '2019-08-12 15:24:32', 1);
INSERT INTO `tb_user` VALUES ('llowid_86e124f1', 'user_7cfff94d', '0BC6895CBEC404C681DDF99A8632CE41', '1565596609938@qq.com', NULL, NULL, '女', NULL, '安徽', NULL, '2019-08-12 15:56:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_86e399b7', 'user_1f229990', 'DF298BE20D2E7E12A7616FA32BAE5848', '1565595383055@qq.com', NULL, NULL, '女', NULL, '香港', NULL, '2019-08-12 15:36:23', 1);
INSERT INTO `tb_user` VALUES ('llowid_871444d8', 'user_41a65f5c', 'F5D5EEA0ADADC9D4C1A42E6EAE540586', '1565596616706@qq.com', NULL, NULL, '女', NULL, '海南', NULL, '2019-08-12 15:56:56', 1);
INSERT INTO `tb_user` VALUES ('llowid_873b4c83', 'user_a225f4df', 'AE87095E1100D7C0BC58C29549663268', '1565595112287@qq.com', NULL, NULL, '女', NULL, '福建', NULL, '2019-08-12 15:31:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_874d8d32', 'user_47c9551a', '4FD4F94EC9AAB08AF2FB5BBB387B9AA8', '1565595390338@qq.com', NULL, NULL, '女', NULL, '上海', NULL, '2019-08-12 15:36:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_87588ba1', 'user_f67328af', 'FE3D6505A1DB95A5024AF39624F95176', '1565595389512@qq.com', NULL, NULL, '女', NULL, '西藏', NULL, '2019-08-12 15:36:29', 1);
INSERT INTO `tb_user` VALUES ('llowid_876543db', 'user_b4d28442', 'EE9C8DDCFECD9394FE37E54279132C4B', '1565595361953@qq.com', NULL, NULL, '女', NULL, '云南', NULL, '2019-08-12 15:36:01', 1);
INSERT INTO `tb_user` VALUES ('llowid_8777caa3', 'user_21f50f66', '2699F81C4C2444DE902D8CC93BCB46BC', '1565596618160@qq.com', NULL, NULL, '女', NULL, '广西', NULL, '2019-08-12 15:56:58', 1);
INSERT INTO `tb_user` VALUES ('llowid_879aa7e9', 'user_5b74ac3a', '5578ABCC0A7B17FBA3B733C35C500105', '1565596610626@qq.com', NULL, NULL, '女', NULL, '海南', NULL, '2019-08-12 15:56:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_87a84634', 'user_de418696', 'B53A14A0D394840E2C40598698569C0C', '1565594867438@qq.com', NULL, NULL, '男', NULL, '福建', NULL, '2019-08-12 15:27:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_87e1833d', 'user_9f46d8cf', '2981A4973F3D8981FD26F368FE277A62', '1565594867236@qq.com', NULL, NULL, '男', NULL, '重庆', NULL, '2019-08-12 15:27:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_87f9ecae', 'user_77abe7a2', '5551B66ECB6EFD6E0C1545A44924B0FF', '1565595370601@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:36:10', 1);
INSERT INTO `tb_user` VALUES ('llowid_88017ab6', 'user_4f46b6b5', 'C9F709479BF74D3624A618DAD1967F3B', '1565594930243@qq.com', NULL, NULL, '男', NULL, '辽宁', NULL, '2019-08-12 15:28:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_882df7a5', 'user_e803ed2c', 'C98BFB11CE3CB66DBF33240D63727136', '1565596615090@qq.com', NULL, NULL, '女', NULL, '广东', NULL, '2019-08-12 15:56:55', 1);
INSERT INTO `tb_user` VALUES ('llowid_886a3614', 'user_15850132', '5FCAECE0344AA701AA1254243D17A896', '1565595379167@qq.com', NULL, NULL, '男', NULL, '河南', NULL, '2019-08-12 15:36:19', 1);
INSERT INTO `tb_user` VALUES ('llowid_8871ad54', 'user_204256bc', '658A0D71BDCE92FD915A772FE8D0A31C', '1565596619330@qq.com', NULL, NULL, '女', NULL, '山西', NULL, '2019-08-12 15:56:59', 1);
INSERT INTO `tb_user` VALUES ('llowid_888a3d92', 'user_87451281', '7FA55679B8060282AD4B9DBCD6D7448D', '1565595369492@qq.com', NULL, NULL, '男', NULL, '海南', NULL, '2019-08-12 15:36:09', 1);
INSERT INTO `tb_user` VALUES ('llowid_88adabb4', 'user_5345648d', '0690D578E4AF2DAAF83A99A666CFEFF0', '1565595391936@qq.com', NULL, NULL, '女', NULL, '河北', NULL, '2019-08-12 15:36:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_88e52774', 'user_58ee2d48', '6E861072A21CFAFDD30C38BCC5ADE149', '1565595389993@qq.com', NULL, NULL, '男', NULL, '广西', NULL, '2019-08-12 15:36:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_88f449db', 'user_9ebc4029', 'DA539292265C49178F2E604BE5BB7FB5', '1565595173236@qq.com', NULL, NULL, '女', NULL, '陕西', NULL, '2019-08-12 15:32:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_89034c00', 'user_70760acc', '4CC6C0A1E3113E294F6774CE166CEB22', '1565596610350@qq.com', NULL, NULL, '女', NULL, '广西', NULL, '2019-08-12 15:56:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_890ef1e9', 'user_47384258', '0774A8D97D5B105554176CD0D96F999A', '1565595378020@qq.com', NULL, NULL, '男', NULL, '湖北', NULL, '2019-08-12 15:36:18', 1);
INSERT INTO `tb_user` VALUES ('llowid_892d06ff', 'user_122a4d93', '6511623B6604D5E4CF34FF91A4BDEEB5', '1565595364239@qq.com', NULL, NULL, '女', NULL, '上海', NULL, '2019-08-12 15:36:04', 1);
INSERT INTO `tb_user` VALUES ('llowid_89616cc9', 'user_56f6034c', '9789E0F428F37FA45A84039B969F46B6', '1565594931436@qq.com', NULL, NULL, '女', NULL, '安徽', NULL, '2019-08-12 15:28:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_89c47d19', 'user_c4c5abde', '3BBB557491A8577D8C92F8A820E076B7', '1565595393246@qq.com', NULL, NULL, '女', NULL, '重庆', NULL, '2019-08-12 15:36:33', 1);
INSERT INTO `tb_user` VALUES ('llowid_89cc0513', 'user_0570dd54', '1BBF34A2A828369DA1FFDF070A620174', '1565595392025@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:36:32', 1);
INSERT INTO `tb_user` VALUES ('llowid_89f0804a', 'user_5a32a4df', '4688EE0C8725494B4DF6377462DB63B0', '1565595112010@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:31:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_8a21136e', 'user_5ae43b59', '05291B498D95A7939D6B3435EA1D902E', '1565594865167@qq.com', NULL, NULL, '女', NULL, '广西', NULL, '2019-08-12 15:27:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_8a483294', 'user_bd3d7d98', 'C4D717B9ADE10AAA528B99E292B12122', '1565595393584@qq.com', NULL, NULL, '男', NULL, '上海', NULL, '2019-08-12 15:36:33', 1);
INSERT INTO `tb_user` VALUES ('llowid_8a54ddd9', 'user_4d628adf', '0B097587E8319CF77A23EE1AFA4C7B47', '1565595370106@qq.com', NULL, NULL, '女', NULL, '湖南', NULL, '2019-08-12 15:36:10', 1);
INSERT INTO `tb_user` VALUES ('llowid_8a555934', 'user_43f9b180', 'E598E6C437984E5BF588950B63193A61', '1565595386177@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:36:26', 1);
INSERT INTO `tb_user` VALUES ('llowid_8a5d5f77', 'user_cc9ea98e', 'A1979A716D310CB9589C7FE7C1E4CAF7', '1565595174633@qq.com', NULL, NULL, '女', NULL, '广东', NULL, '2019-08-12 15:32:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_8a6c60d9', 'user_a516104f', '0FE7E91F5FE20258696DC4D93CAEB955', '1565595172214@qq.com', NULL, NULL, '男', NULL, '云南', NULL, '2019-08-12 15:32:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_8a704f26', 'user_20153a9c', 'EEA72BAF64E73C01E6281F5098F6423C', '1565596620281@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:57:00', 1);
INSERT INTO `tb_user` VALUES ('llowid_8aa68064', 'user_74e6eb58', '97F33AC0FD7E2EA05883201FC8C5630D', '1565596612612@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:56:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_8add2991', 'user_47c5b961', '981EF2227E095681601C28DCB6984BB7', '1565596605996@qq.com', NULL, NULL, '女', NULL, '四川', NULL, '2019-08-12 15:56:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_8ade9da2', 'user_f4ef347d', 'ABC1B74F577B9C9056A3FF095E594255', '1565594671054@qq.com', NULL, NULL, '男', NULL, '贵州', NULL, '2019-08-12 15:24:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_8af26a54', 'user_a845eb8d', '9FBC80A0E1940A8EDFC48E213BBCE88E', '1565594931116@qq.com', NULL, NULL, '男', NULL, '江西', NULL, '2019-08-12 15:28:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_8afba4cc', 'user_0b10e17f', '942EC3E7275EA568AD3E5433BEABD7C8', '1565594867368@qq.com', NULL, NULL, '男', NULL, '广东', NULL, '2019-08-12 15:27:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_8b4d0684', 'user_35e30a67', '0DFB2192145C9D07D944C59C83593406', '1565595377641@qq.com', NULL, NULL, '女', NULL, '海南', NULL, '2019-08-12 15:36:17', 1);
INSERT INTO `tb_user` VALUES ('llowid_8b64564e', 'user_86604c24', '99BF7F85418278EF90A87696592AF905', '1565595381161@qq.com', NULL, NULL, '男', NULL, '贵州', NULL, '2019-08-12 15:36:21', 1);
INSERT INTO `tb_user` VALUES ('llowid_8b8fa70d', 'user_45509708', 'BEE2BD4FAE1A375B99623287275E9A0F', '1565595372108@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:36:12', 1);
INSERT INTO `tb_user` VALUES ('llowid_8b9495c2', 'user_6ad4563b', '8E5D0684352B41E95D75697A8939DCA2', '1565595374948@qq.com', NULL, NULL, '女', NULL, '香港', NULL, '2019-08-12 15:36:14', 1);
INSERT INTO `tb_user` VALUES ('llowid_8b94edc7', 'user_fb52ab9d', 'DDCD9168EBF858FD07A6C986F202EF88', '1565595383270@qq.com', NULL, NULL, '男', NULL, '重庆', NULL, '2019-08-12 15:36:23', 1);
INSERT INTO `tb_user` VALUES ('llowid_8ba061d1', 'user_7b8a8471', '5634B31543ABE466F59F5786D4EC350D', NULL, '', 'http://image.stodger.club/images/b019b818013348b5a5ca2be6fda1fc33.jpg', '保密', NULL, '天津', '2019-08-14', '2019-08-14 11:27:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_8ba7b6bd', 'user_74a26849', '0DEB50977D6C14152656DCBD026F3868', '1565596610141@qq.com', NULL, NULL, '女', NULL, '四川', NULL, '2019-08-12 15:56:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_8bb81cec', 'user_394302a3', '581A99DFA9744B4FD3F1652110C974C8', '1565596614155@qq.com', NULL, NULL, '女', NULL, '福建', NULL, '2019-08-12 15:56:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_8be7e9ba', 'user_16daa834', '3A7DB8CCE799D263449A89BF6942BD84', '1565596608577@qq.com', NULL, NULL, '女', NULL, '重庆', NULL, '2019-08-12 15:56:48', 1);
INSERT INTO `tb_user` VALUES ('llowid_8c0916ef', 'user_79af00ab', '5BC0B4749B4FB20C22B8DDDCC3B76137', '1565595385315@qq.com', NULL, NULL, '男', NULL, '北京', NULL, '2019-08-12 15:36:25', 1);
INSERT INTO `tb_user` VALUES ('llowid_8c47d566', 'user_3ecf0f82', 'E3A508D7F35CAABBC8085CCE8081B312', '1565596615509@qq.com', NULL, NULL, '女', NULL, '山东', NULL, '2019-08-12 15:56:55', 1);
INSERT INTO `tb_user` VALUES ('llowid_8c4ceca9', 'user_4e56bc23', '7BD9FBFB9CD81214C52A47DF9DC87B9E', '1565595369057@qq.com', NULL, NULL, '女', NULL, '内蒙古', NULL, '2019-08-12 15:36:09', 1);
INSERT INTO `tb_user` VALUES ('llowid_8c8f5829', 'user_558d5eb1', '1CB34FD8E74FAFE088E3CDC891FE7FF1', '1565595111154@qq.com', NULL, NULL, '男', NULL, '青海', NULL, '2019-08-12 15:31:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_8c93a06b', 'user_51da6e58', '5C497866A34CF2B611F8A4AB948E7C0F', '1565594866117@qq.com', NULL, NULL, '男', NULL, '台湾', NULL, '2019-08-12 15:27:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_8c98c475', 'user_543809df', '836145F41B6F8ED09C6E85E6360E1AFF', '1565594671156@qq.com', NULL, NULL, '男', NULL, '澳门', NULL, '2019-08-12 15:24:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_8caac487', 'user_a5ec2318', '439E9674A6DEB7670C81921556672851', '1565594633206@qq.com', NULL, NULL, '男', NULL, '甘肃', NULL, '2019-08-12 15:23:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_8cc114cb', 'user_f88ee451', '3777FD1C35AC7C464545D881CE028772', '1565596623919@qq.com', NULL, NULL, '女', NULL, '江苏', NULL, '2019-08-12 15:57:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_8ccb44f0', 'user_28c7df2e', '283C6708A3D40859B7A3E903DD73635D', '1565595364872@qq.com', NULL, NULL, '男', NULL, '海南', NULL, '2019-08-12 15:36:04', 1);
INSERT INTO `tb_user` VALUES ('llowid_8cccd4ad', 'user_14336a20', '762624ECB770C7BA5C9B322F78BFCADA', '1565594931010@qq.com', NULL, NULL, '男', NULL, '重庆', NULL, '2019-08-12 15:28:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_8d1954d2', 'user_ae85206c', '708099A58BA252A309ED1B0A86EB0E78', '1565595365528@qq.com', NULL, NULL, '女', NULL, '贵州', NULL, '2019-08-12 15:36:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_8d4bb121', 'user_c8757dbb', '9BD2300A8E2EBC58A6F6127359843D9D', '1565595115061@qq.com', NULL, NULL, '女', NULL, '湖南', NULL, '2019-08-12 15:31:55', 1);
INSERT INTO `tb_user` VALUES ('llowid_8d4bb4ce', 'user_efe0a4be', 'E14F2F87B022B3F0C0C94641334D7D04', '1565596618803@qq.com', NULL, NULL, '女', NULL, '吉林', NULL, '2019-08-12 15:56:58', 1);
INSERT INTO `tb_user` VALUES ('llowid_8d63dfae', 'user_42bc975e', '6DC2FC0DC157B9F68E00ADCEEEC1ABB3', '1565595368284@qq.com', NULL, NULL, '男', NULL, '广西', NULL, '2019-08-12 15:36:08', 1);
INSERT INTO `tb_user` VALUES ('llowid_8d833d3a', 'user_4a95bc6e', '9862CD20FB37A8761F454E68C04ACB54', '1565595365817@qq.com', NULL, NULL, '男', NULL, '安徽', NULL, '2019-08-12 15:36:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_8d8ae0c8', 'user_1a5a41be', 'F0F0B1DB276FBC6BAD816A657FB0ED33', '1565595115460@qq.com', NULL, NULL, '男', NULL, '宁夏', NULL, '2019-08-12 15:31:55', 1);
INSERT INTO `tb_user` VALUES ('llowid_8db43ad6', 'user_9b0c2173', '4C3A098546A50638598018AA931E1DC4', '1565595372318@qq.com', NULL, NULL, '男', NULL, '云南', NULL, '2019-08-12 15:36:12', 1);
INSERT INTO `tb_user` VALUES ('llowid_8ebd1f2d', 'user_a3d6398b', 'C81821FA6EDAF09AE6B4560069AC8974', '1565595386085@qq.com', NULL, NULL, '男', NULL, '澳门', NULL, '2019-08-12 15:36:26', 1);
INSERT INTO `tb_user` VALUES ('llowid_8eda205e', 'user_2a0efb4a', 'FA960EF560F902B1DAED142AF96AB72E', '1565595382860@qq.com', NULL, NULL, '男', NULL, '贵州', NULL, '2019-08-12 15:36:22', 1);
INSERT INTO `tb_user` VALUES ('llowid_8ef37b84', 'user_9f6da87d', '8F71EC6B58D48F7379A0D3F7D89E8399', '1565596605534@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:56:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_8f568d44', 'user_f4aefa88', 'A47D6F33C2E74BC89359171989B26AF9', '1565595370528@qq.com', NULL, NULL, '男', NULL, '台湾', NULL, '2019-08-12 15:36:10', 1);
INSERT INTO `tb_user` VALUES ('llowid_8f9b43c8', 'user_4e4d9168', '6B883A23E196D06CF337041CD3879445', '1565596611936@qq.com', NULL, NULL, '女', NULL, '新疆', NULL, '2019-08-12 15:56:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_904440ea', 'user_ec9bb425', 'A59A02F96BF976C72AAD73D453E259FC', '1565595113860@qq.com', NULL, NULL, '男', NULL, '西藏', NULL, '2019-08-12 15:31:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_90548dfa', 'user_35facdab', '92224AD004B8A26E06C707634C03D14D', '1565596611152@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:56:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_9064f5dd', 'user_46afb683', 'B93510E7BCCFDBEDF5234D35435A1B54', '1565595394055@qq.com', NULL, NULL, '男', NULL, '江苏', NULL, '2019-08-12 15:36:34', 1);
INSERT INTO `tb_user` VALUES ('llowid_90af3853', 'user_de3a584a', '532F0BB32153971B260012380A573D54', '1565596618697@qq.com', NULL, NULL, '女', NULL, '河北', NULL, '2019-08-12 15:56:58', 1);
INSERT INTO `tb_user` VALUES ('llowid_90b4a3b8', 'user_6412da98', '0EA93B50FC4952B1D38DBC3B500BDDA4', '1565595270083@qq.com', NULL, NULL, '男', NULL, '北京', NULL, '2019-08-12 15:34:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_90dbec4d', 'user_c4478d8b', 'C9853BADDA533993138CE1CFAD0B8502', '1565595391799@qq.com', NULL, NULL, '男', NULL, '天津', NULL, '2019-08-12 15:36:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_90fc164f', 'user_fb9bcb1c', 'CD30752A0FCE774966E664405274245A', '1565595368189@qq.com', NULL, NULL, '女', NULL, '山西', NULL, '2019-08-12 15:36:08', 1);
INSERT INTO `tb_user` VALUES ('llowid_91004873', 'user_87cf4d94', 'D6F6CF86AA09A33058AF530CB17B7057', '1565595115598@qq.com', NULL, NULL, '男', NULL, '香港', NULL, '2019-08-12 15:31:55', 1);
INSERT INTO `tb_user` VALUES ('llowid_911da9bf', 'user_b62274c0', '5453AB90CBC8EB16F4AF924EE4D2023F', '1565595111010@qq.com', NULL, NULL, '男', NULL, '内蒙古', NULL, '2019-08-12 15:31:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_9128bdcd', 'user_a078ebd4', 'D75A36445016AA66FF2BB2FF56C947CA', '1565595375264@qq.com', NULL, NULL, '男', NULL, '北京', NULL, '2019-08-12 15:36:15', 1);
INSERT INTO `tb_user` VALUES ('llowid_9175578b', 'user_544b3ff4', '167630D59AD2FD1EFF639DDBD1585AAA', '1565596610594@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:56:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_918bb6b7', 'user_5bbe420e', '5A7ACDFF431A32CC55F2220C6D450B9D', '1565594670634@qq.com', NULL, NULL, '男', NULL, '吉林', NULL, '2019-08-12 15:24:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_919b4dd6', 'user_a462784b', '475BE1FE128E9BF83B0C439EF4F3C2D6', '1565594931185@qq.com', NULL, NULL, '男', NULL, '湖北', NULL, '2019-08-12 15:28:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_91cd3455', 'user_b940f195', 'EEC80376AD06B9BBD3D1952787BD3C1D', '1565595110964@qq.com', NULL, NULL, '男', NULL, '上海', NULL, '2019-08-12 15:31:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_91dec439', 'user_1b4be196', '5634B31543ABE466F59F5786D4EC350D', '', '17666336633', NULL, NULL, NULL, NULL, NULL, '2019-08-14 17:58:39', 1);
INSERT INTO `tb_user` VALUES ('llowid_91e2ae64', 'user_4f8f8d0f', '00C89E798FBBA3343EE80AC9EC379759', '1565595391429@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:36:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_9205e793', 'user_ddfa7477', '4F78C9B9749099C8CEA6BC0EC01A7259', '1565595389739@qq.com', NULL, NULL, '女', NULL, '河北', NULL, '2019-08-12 15:36:29', 1);
INSERT INTO `tb_user` VALUES ('llowid_921e70a4', 'user_23eca480', '9ABD6A6DA10B4180AFA1E133613221C3', '1565595382476@qq.com', NULL, NULL, '男', NULL, '河北', NULL, '2019-08-12 15:36:22', 1);
INSERT INTO `tb_user` VALUES ('llowid_92242e2a', 'user_271f4231', '3B1BD6903B0830335B310E466DFE5BAB', '1565595376084@qq.com', NULL, NULL, '女', NULL, '四川', NULL, '2019-08-12 15:36:16', 1);
INSERT INTO `tb_user` VALUES ('llowid_92704f96', 'user_02f34dbc', '66DFE750FF13A4FF5FCA52745FC5AA29', '1565595367995@qq.com', NULL, NULL, '男', NULL, '甘肃', NULL, '2019-08-12 15:36:08', 1);
INSERT INTO `tb_user` VALUES ('llowid_927beee3', 'user_0d75133d', '689CCC68014966A8112C93F011F7D8B0', '1565595377312@qq.com', NULL, NULL, '男', NULL, '西藏', NULL, '2019-08-12 15:36:17', 1);
INSERT INTO `tb_user` VALUES ('llowid_92aaf1dd', 'user_868202b4', '342CCA93EE421F26B2E0CAA5B55AEEFA', '1565594863639@qq.com', NULL, NULL, '女', NULL, '山西', NULL, '2019-08-12 15:27:43', 1);
INSERT INTO `tb_user` VALUES ('llowid_92c4df4a', 'user_2b5b2241', '08F5FAC4FB2324AF8265832EADB57BA4', '1565595383554@qq.com', NULL, NULL, '男', NULL, '江苏', NULL, '2019-08-12 15:36:23', 1);
INSERT INTO `tb_user` VALUES ('llowid_92f95af0', 'user_f82d8e1e', '92D7F9885C9831645FD439F4A68249F4', '1565595387651@qq.com', NULL, NULL, '男', NULL, '山西', NULL, '2019-08-12 15:36:27', 1);
INSERT INTO `tb_user` VALUES ('llowid_93476db8', 'user_61a7cc78', '7FBAD41E1984FB601B51DB61CE253D16', '1565596624572@qq.com', NULL, NULL, '女', NULL, '福建', NULL, '2019-08-12 15:57:04', 1);
INSERT INTO `tb_user` VALUES ('llowid_93d061bf', 'user_c740a472', '6C3F4D24F02679808B21596FE5CBB183', '1565594670764@qq.com', NULL, NULL, '男', NULL, '贵州', NULL, '2019-08-12 15:24:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_94001ba2', 'user_4a2a9d30', '0B88930D49959130DA17054E1376157E', '1565595363421@qq.com', NULL, NULL, '女', NULL, '吉林', NULL, '2019-08-12 15:36:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_940b6aec', 'user_fb1c7909', 'DB92C8FF48F420145EA855BA94CB9670', '1565595387426@qq.com', NULL, NULL, '女', NULL, '内蒙古', NULL, '2019-08-12 15:36:27', 1);
INSERT INTO `tb_user` VALUES ('llowid_940e1b56', 'user_0dd4270a', 'D606F625B0A08FB4DC962DED6EA60CBC', '1565596608973@qq.com', NULL, NULL, '女', NULL, '西藏', NULL, '2019-08-12 15:56:48', 1);
INSERT INTO `tb_user` VALUES ('llowid_943d4877', 'user_d4812744', '20B44FB344CAE7A0C158A0BF9A247BE4', '1565594932019@qq.com', NULL, NULL, '男', NULL, '辽宁', NULL, '2019-08-12 15:28:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_9478039b', 'user_6e048134', '7D5E435DA78284F6A667A980049D2DCD', '1565596621676@qq.com', NULL, NULL, '女', NULL, '山东', NULL, '2019-08-12 15:57:01', 1);
INSERT INTO `tb_user` VALUES ('llowid_947a88e9', 'user_9d0630f4', 'AA08509594299878BDBD925184F3AA35', '1565595114883@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:31:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_947fa548', 'user_1440f8e4', '37A3E760984E48DCD70FC1E45641674D', '1565595170675@qq.com', NULL, NULL, '男', NULL, '青海', NULL, '2019-08-12 15:32:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_94a44c4b', 'user_1e24343d', '5141156C6A204FAB7F2F302A8196A0AE', '1565595111961@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:31:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_94a62891', 'user_bec0dfc4', '07F3461C7233FDB1D41343EC367BDF75', '1565594633127@qq.com', NULL, NULL, '男', NULL, '辽宁', NULL, '2019-08-12 15:23:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_94b00b94', 'user_e29cfeda', '2310C00E86198EA3A8DF786838308F1B', '1565596624725@qq.com', NULL, NULL, '女', NULL, '江苏', NULL, '2019-08-12 15:57:04', 1);
INSERT INTO `tb_user` VALUES ('llowid_94b1db9c', 'user_4457788c', '9000368BDA47C234DCCB7D3CD03AED1D', '1565595389299@qq.com', NULL, NULL, '男', NULL, '甘肃', NULL, '2019-08-12 15:36:29', 1);
INSERT INTO `tb_user` VALUES ('llowid_94c0845e', 'user_c2c31954', '12D90332094354EA1B3939F97D2D8D3A', '1565595112793@qq.com', NULL, NULL, '女', NULL, '甘肃', NULL, '2019-08-12 15:31:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_94c52b72', 'user_d6843e6a', 'FE060BB1CD9980C16337EE03C97E3B47', '1565596615159@qq.com', NULL, NULL, '女', NULL, '香港', NULL, '2019-08-12 15:56:55', 1);
INSERT INTO `tb_user` VALUES ('llowid_94c8487e', 'user_4e15ae0b', 'EB24BAEA4BF7B8E2040223B2914BB9F7', '1565595377607@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:36:17', 1);
INSERT INTO `tb_user` VALUES ('llowid_94d6a9c6', 'user_eac32cd3', 'C6D6DAD4B5A3B674DD310C186F48322A', '1565594932422@qq.com', NULL, NULL, '女', NULL, '河北', NULL, '2019-08-12 15:28:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_94f8b4e3', 'user_dc851d4d', 'FCAFF3D1373956DC88A424397C7881F6', '1565596606032@qq.com', NULL, NULL, '女', NULL, '吉林', NULL, '2019-08-12 15:56:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_950c4704', 'user_2ac66c41', 'D81BC281FBC7FA6AB0600151586D24BD', NULL, '15274454193', NULL, '男', NULL, '四川', NULL, '2019-08-07 21:17:22', 1);
INSERT INTO `tb_user` VALUES ('llowid_955355fc', 'user_d038aab7', '74B19C6617516C84E38CAA4F39A34734', '1565595377221@qq.com', NULL, NULL, '男', NULL, '江苏', NULL, '2019-08-12 15:36:17', 1);
INSERT INTO `tb_user` VALUES ('llowid_958c401e', 'user_663f6c80', '6B6D39BCF418A4B453DBD4053C921E54', '1565596619363@qq.com', NULL, NULL, '女', NULL, '重庆', NULL, '2019-08-12 15:56:59', 1);
INSERT INTO `tb_user` VALUES ('llowid_95a441f6', 'user_a084448d', 'EA2B314FF3FF4D299000E08C6583E13D', '1565596611250@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:56:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_95ab8906', 'user_d6342bd9', '0C3DF18C357250A4DB8D65ADD351B616', '1565595369966@qq.com', NULL, NULL, '女', NULL, '上海', NULL, '2019-08-12 15:36:09', 1);
INSERT INTO `tb_user` VALUES ('llowid_95f4cc04', 'user_32476db9', 'CBAB56F7F6FBA7A89B21E01D26E7A209', '1565595380414@qq.com', NULL, NULL, '男', NULL, '河北', NULL, '2019-08-12 15:36:20', 1);
INSERT INTO `tb_user` VALUES ('llowid_96696496', 'user_bbe20324', '19D2E9D91D6A5C437356F51A1858244D', '1565594671783@qq.com', NULL, NULL, '男', NULL, '甘肃', NULL, '2019-08-12 15:24:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_9670f43d', 'user_ce6a5548', '5DA6141134FCC8FF537FD421C8685859', '1565594865236@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:27:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_967d8947', 'user_3a1deb53', 'C92AD67FB740CB930F05DBDCAB80FD10', '1565596605960@qq.com', NULL, NULL, '女', NULL, '澳门', NULL, '2019-08-12 15:56:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_970a70fc', 'user_c8fa8fea', '4017A50E2CF55786BB31193242CC6BE2', '1565595371157@qq.com', NULL, NULL, '男', NULL, '云南', NULL, '2019-08-12 15:36:11', 1);
INSERT INTO `tb_user` VALUES ('llowid_974c679f', 'user_514ee0ba', '08FF4500455B707244DCD325F621AC99', '1565596611968@qq.com', NULL, NULL, '女', NULL, '青海', NULL, '2019-08-12 15:56:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_97992541', 'user_1a014fd4', 'D81BC281FBC7FA6AB0600151586D24BD', NULL, '15274454192', NULL, NULL, NULL, NULL, NULL, '2019-08-12 15:14:13', 1);
INSERT INTO `tb_user` VALUES ('llowid_97dba1f4', 'user_cf22257e', '8A8B614A6A0B3F1863A279A56B4E6E67', '1565595366564@qq.com', NULL, NULL, '男', NULL, '四川', NULL, '2019-08-12 15:36:06', 1);
INSERT INTO `tb_user` VALUES ('llowid_981b4152', 'user_4846f78b', '17AB8825A8160A1A3F47E6116137231D', '1565596623816@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:57:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_9828d300', 'jsu', '253AC1C328F9D9A616CBD936646E58DD', NULL, '15343057723', 'http://image.stodger.club/images/9854a062d39c42028dd3090882286e0d.jpg', '男', NULL, '重庆', '1997-08-14', '2019-08-07 21:03:18', 1);
INSERT INTO `tb_user` VALUES ('llowid_98435691', 'user_7ebbdbc1', '3FFC8DA24E1A465F2C953B39D2900036', '1565596612782@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:56:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_9846b8a4', 'user_3cb20a15', '5634B31543ABE466F59F5786D4EC350D', '992279357@qq.com', '15627561712', NULL, NULL, NULL, NULL, NULL, '2019-08-16 09:37:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_98570922', 'user_38986014', '1F436B2C34DF0A120507D11855A61703', '1565595385924@qq.com', NULL, NULL, '男', NULL, '澳门', NULL, '2019-08-12 15:36:25', 1);
INSERT INTO `tb_user` VALUES ('llowid_987a4bea', 'user_31849af8', '2F2F2938A1ED490C14027973FA8BC1A0', '1565595391490@qq.com', NULL, NULL, '男', NULL, '西藏', NULL, '2019-08-12 15:36:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_989f19a4', 'user_13be998f', '7009B5DBD87A2EBFC9E33EF1CE03C9DB', '1565594865797@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:27:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_98b3eb61', 'user_0814c773', 'E09ED2DE392A91140E988CD9625A45A7', '1565595384813@qq.com', NULL, NULL, '女', NULL, '新疆', NULL, '2019-08-12 15:36:24', 1);
INSERT INTO `tb_user` VALUES ('llowid_98b44094', 'user_eaa04c28', 'FD5855468294D3D6A6FE537D612C5E3F', '1565596613436@qq.com', NULL, NULL, '女', NULL, '上海', NULL, '2019-08-12 15:56:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_98f637f3', 'user_c17f4f8b', 'B7DBA3763839DCFB93EFAAE3D4A494A0', '1565595375517@qq.com', NULL, NULL, '男', NULL, '北京', NULL, '2019-08-12 15:36:15', 1);
INSERT INTO `tb_user` VALUES ('llowid_9957ef6b', 'user_ca945b99', '6AE04145CAAABCB6FF1713833EB4443F', '1565595364511@qq.com', NULL, NULL, '女', NULL, '青海', NULL, '2019-08-12 15:36:04', 1);
INSERT INTO `tb_user` VALUES ('llowid_9964caa8', 'user_603401e8', '71722A54C3F0C5D83B4C5FCBF983A479', '1565595173309@qq.com', NULL, NULL, '女', NULL, '内蒙古', NULL, '2019-08-12 15:32:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_99a66f6c', 'user_828589fd', '4AF0837B8D02A9EB077ADF4AE2437D3A', '1565595367959@qq.com', NULL, NULL, '女', NULL, '四川', NULL, '2019-08-12 15:36:07', 1);
INSERT INTO `tb_user` VALUES ('llowid_99ff69c3', 'user_4dd99f38', '6DF7087CAEE1F124DF032B38494C0371', '1565595369459@qq.com', NULL, NULL, '男', NULL, '天津', NULL, '2019-08-12 15:36:09', 1);
INSERT INTO `tb_user` VALUES ('llowid_9a354350', 'user_cd277247', 'A4D824489554A5462C1C8279AA654318', '1565595269694@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:34:29', 1);
INSERT INTO `tb_user` VALUES ('llowid_9a41ac99', 'user_edb8e848', '356E791368973BD55E23F986E6EFA6AE', '1565596618600@qq.com', NULL, NULL, '女', NULL, '江苏', NULL, '2019-08-12 15:56:58', 1);
INSERT INTO `tb_user` VALUES ('llowid_9a4cb9b1', 'user_f57b25b4', 'AD308957538B763D3E317A878C11EF9F', '1565595390546@qq.com', NULL, NULL, '女', NULL, '广东', NULL, '2019-08-12 15:36:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_9a7737c9', 'user_10d8ad3d', '151EB4B31C6437FA4E311082940F65B3', '1565595376414@qq.com', NULL, NULL, '男', NULL, '江苏', NULL, '2019-08-12 15:36:16', 1);
INSERT INTO `tb_user` VALUES ('llowid_9a944a49', 'user_2a95d64a', 'E7CD7D5BD979CF8DF0266EBC37187B48', '1565594931332@qq.com', NULL, NULL, '男', NULL, '湖北', NULL, '2019-08-12 15:28:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_9a949d39', 'user_6466595b', '0DA81656F4E2657D6DCD2ED546E652F6', '1565596611427@qq.com', NULL, NULL, '女', NULL, '青海', NULL, '2019-08-12 15:56:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_9a98cd54', 'user_d4570aff', '1397AB0A985773BF07F995F4C0C49DCD', '1565595367613@qq.com', NULL, NULL, '男', NULL, '四川', NULL, '2019-08-12 15:36:07', 1);
INSERT INTO `tb_user` VALUES ('llowid_9aa9b89f', 'user_9e160a40', '547A8BF8050DED1F2DAD3EEF8E722054', '1565596622079@qq.com', NULL, NULL, '女', NULL, '吉林', NULL, '2019-08-12 15:57:02', 1);
INSERT INTO `tb_user` VALUES ('llowid_9ae55fb0', 'user_ac59bbb5', '5634B31543ABE466F59F5786D4EC350D', '12@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 17:40:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_9b3e7c5e', 'user_4ee68963', 'A096925E0DF64FA6FE7B6C92F18C2C23', '1565594867140@qq.com', NULL, NULL, '女', NULL, '辽宁', NULL, '2019-08-12 15:27:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_9b48cd96', 'user_480f7a98', 'A7F8869302F8BF8A5F22E7E6451D58F4', '1565594633400@qq.com', NULL, NULL, '男', NULL, '山东', NULL, '2019-08-12 15:23:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_9b4a3680', 'user_34a1c4d2', '834BAE757726FCFC090E746F48631CE4', '1565595384360@qq.com', NULL, NULL, '男', NULL, '西藏', NULL, '2019-08-12 15:36:24', 1);
INSERT INTO `tb_user` VALUES ('llowid_9bcd69c5', 'user_d8fe6159', '262711661898D33B0FDD0B10E09934E6', '1565595269883@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:34:29', 1);
INSERT INTO `tb_user` VALUES ('llowid_9bf9d417', 'user_c7ff6604', '181D694893838ADAAC5CF49DEC651A8F', '1565596606349@qq.com', NULL, NULL, '女', NULL, '河北', NULL, '2019-08-12 15:56:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_9c41c4ed', 'user_699b61bc', 'CA1DA5D716EA10CC5C9038ACBC5E95EF', '1565596613268@qq.com', NULL, NULL, '女', NULL, '重庆', NULL, '2019-08-12 15:56:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_9c6bda4f', 'user_50bc2ac0', 'DE6E7F3E4098E5C7AE014A2175BCF27C', '1565595386569@qq.com', NULL, NULL, '男', NULL, '广东', NULL, '2019-08-12 15:36:26', 1);
INSERT INTO `tb_user` VALUES ('llowid_9ca4dc7d', 'user_3a36648d', '3874B83D29AFF6E211EA716486D42F93', '1565595112148@qq.com', NULL, NULL, '男', NULL, '西藏', NULL, '2019-08-12 15:31:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_9ca9bea4', 'user_7525e042', 'DA3A956A13439C5A903693DF1A08593B', '1565595375389@qq.com', NULL, NULL, '女', NULL, '云南', NULL, '2019-08-12 15:36:15', 1);
INSERT INTO `tb_user` VALUES ('llowid_9cc08e9c', 'user_b2e52622', '88E5A4815C41F1CA6D678649134B8C59', '1565595172140@qq.com', NULL, NULL, '男', NULL, '青海', NULL, '2019-08-12 15:32:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_9cec7f44', 'user_6c89db78', '1ED0CA677B818D74411FAE0E896B3A88', '1565595387520@qq.com', NULL, NULL, '女', NULL, '山西', NULL, '2019-08-12 15:36:27', 1);
INSERT INTO `tb_user` VALUES ('llowid_9d1a16b6', 'user_babc44a4', '7380A0156C6595E73A2C84F419671E16', '1565595392659@qq.com', NULL, NULL, '女', NULL, '甘肃', NULL, '2019-08-12 15:36:32', 1);
INSERT INTO `tb_user` VALUES ('llowid_9d48637e', 'user_4ec1e05b', '8AE4F6422AB703E1EB4CC463394AB0FB', '1565596620384@qq.com', NULL, NULL, '女', NULL, '云南', NULL, '2019-08-12 15:57:00', 1);
INSERT INTO `tb_user` VALUES ('llowid_9d4a51a4', 'user_aa4bfa94', 'A01BAAED24744526B61FCA2B2D8C9472', '1565596617256@qq.com', NULL, NULL, '女', NULL, '辽宁', NULL, '2019-08-12 15:56:57', 1);
INSERT INTO `tb_user` VALUES ('llowid_9d557197', 'user_26b9aef4', 'F8F5FFB09AA3936D9D383E119075A53A', '1565594930017@qq.com', NULL, NULL, '女', NULL, '重庆', NULL, '2019-08-12 15:28:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_9d88bfdc', 'user_62aa48b5', '6B6A3C0E008D6ACA07A1F26E9DEC82F9', '1565595382350@qq.com', NULL, NULL, '男', NULL, '海南', NULL, '2019-08-12 15:36:22', 1);
INSERT INTO `tb_user` VALUES ('llowid_9d9a6b84', 'user_9cfccb03', 'F713E96049515A19059DE9D8F0EAD991', '1565595371264@qq.com', NULL, NULL, '男', NULL, '湖北', NULL, '2019-08-12 15:36:11', 1);
INSERT INTO `tb_user` VALUES ('llowid_9da33f29', 'user_da09d431', '78340AA111C03A187038CAF8CACBCD4E', '1565595392494@qq.com', NULL, NULL, '男', NULL, '河北', NULL, '2019-08-12 15:36:32', 1);
INSERT INTO `tb_user` VALUES ('llowid_9e25ed64', 'user_a80486b9', '9BDE330CA594D2404EA0D1FEE78F7857', '1565595367519@qq.com', NULL, NULL, '男', NULL, '广东', NULL, '2019-08-12 15:36:07', 1);
INSERT INTO `tb_user` VALUES ('llowid_9e2b0d04', 'user_f546ac26', '3DB9EBF09933EC555292E70B11DE8D9C', '1565594671022@qq.com', NULL, NULL, '男', NULL, '福建', NULL, '2019-08-12 15:24:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_9ecbc4c4', 'user_a15ea4d8', '4563762700D8A665596ADC0FBC255BFE', '1565595364449@qq.com', NULL, NULL, '女', NULL, '香港', NULL, '2019-08-12 15:36:04', 1);
INSERT INTO `tb_user` VALUES ('llowid_9ee76c4c', 'user_30a8a9c7', '3895F92E3E526A3F9239F89EBE07A75B', '1565595370943@qq.com', NULL, NULL, '男', NULL, '重庆', NULL, '2019-08-12 15:36:10', 1);
INSERT INTO `tb_user` VALUES ('llowid_9ee77a14', 'user_c4174bc8', 'E865452930F5F29A7818CC4502BF7EB1', '1565595387149@qq.com', NULL, NULL, '男', NULL, '河北', NULL, '2019-08-12 15:36:27', 1);
INSERT INTO `tb_user` VALUES ('llowid_9f0534cd', 'user_f8375841', '91015ECF1C6CF5E966CDE163FB2103D0', '1565596616641@qq.com', NULL, NULL, '女', NULL, '辽宁', NULL, '2019-08-12 15:56:56', 1);
INSERT INTO `tb_user` VALUES ('llowid_9f1e24d4', 'user_6a3d5e48', '8510220599911E5CF4D7939E258AB9B1', '1565596623203@qq.com', NULL, NULL, '女', NULL, '西藏', NULL, '2019-08-12 15:57:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_9f2adbf3', 'user_4c4b8f0f', '206DC6C4343FB24B75300D7C17E6498B', '1565596616475@qq.com', NULL, NULL, '女', NULL, '四川', NULL, '2019-08-12 15:56:56', 1);
INSERT INTO `tb_user` VALUES ('llowid_9f996540', 'user_7dbcab48', '05490323F3ABF7090151960CA31CEED5', '1565595111245@qq.com', NULL, NULL, '男', NULL, '安徽', NULL, '2019-08-12 15:31:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_9fa52304', 'user_2949348d', 'C6A9C95D5B5B5A1EADEF1204BC6D8AF9', '1565594931756@qq.com', NULL, NULL, '男', NULL, '山西', NULL, '2019-08-12 15:28:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_9fada03c', 'user_1920e884', '21BBEA4AF88A76207241880B29806DA9', '1565595365717@qq.com', NULL, NULL, '男', NULL, '山西', NULL, '2019-08-12 15:36:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_9fb943b8', 'user_d6418d9f', 'BE63E3E2071F75782451CA910CF4DC50', '1565596619000@qq.com', NULL, NULL, '女', NULL, '新疆', NULL, '2019-08-12 15:56:59', 1);
INSERT INTO `tb_user` VALUES ('llowid_9fc4bcb8', 'user_70568879', '42347EEB0BD133DF7A459EA7E61B8997', '1565595364110@qq.com', NULL, NULL, '女', NULL, '台湾', NULL, '2019-08-12 15:36:04', 1);
INSERT INTO `tb_user` VALUES ('llowid_9fcd2fdc', 'user_c79d8ce2', '4DD0DB6AE3382FE26870272F1BD5DD13', '1565595363349@qq.com', NULL, NULL, '女', NULL, '广西', NULL, '2019-08-12 15:36:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_a0040ffa', 'user_67d54b5f', 'FB8C859D2F98301AE7D9F6A093153FAD', '1565595375899@qq.com', NULL, NULL, '男', NULL, '宁夏', NULL, '2019-08-12 15:36:15', 1);
INSERT INTO `tb_user` VALUES ('llowid_a048aecd', 'user_69644f8a', 'FE59175DD1D28A862A549E9742EBB026', '1565594866287@qq.com', NULL, NULL, '女', NULL, '吉林', NULL, '2019-08-12 15:27:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_a04b438a', 'user_7d5c55ea', '5634B31543ABE466F59F5786D4EC350D', '1234566@qq.com', '17666336633', NULL, NULL, NULL, NULL, NULL, '2019-08-14 17:53:58', 1);
INSERT INTO `tb_user` VALUES ('llowid_a0909dda', 'user_c4745416', '4EDE23C320B814956D6F3F66945F1E3A', '1565595368379@qq.com', NULL, NULL, '男', NULL, '吉林', NULL, '2019-08-12 15:36:08', 1);
INSERT INTO `tb_user` VALUES ('llowid_a0a6444b', 'user_99d54879', '8B3282610E263F709E8A2A579421C4D2', '1565595387333@qq.com', NULL, NULL, '女', NULL, '安徽', NULL, '2019-08-12 15:36:27', 1);
INSERT INTO `tb_user` VALUES ('llowid_a11a5e7d', 'user_afe6cce4', 'B410E10FE4D059877B2FE50F604D1D1E', '1565595390309@qq.com', NULL, NULL, '男', NULL, '上海', NULL, '2019-08-12 15:36:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_a11b9f60', 'user_c26f2aa5', '00D158A3351B8B0CC743C1043CE45CEF', '1565596623303@qq.com', NULL, NULL, '女', NULL, '云南', NULL, '2019-08-12 15:57:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_a13b3e02', 'user_e8f9830c', '1FE39D30E4DB4AC6A4B48239CBA53F44', '1565595386357@qq.com', NULL, NULL, '女', NULL, '辽宁', NULL, '2019-08-12 15:36:26', 1);
INSERT INTO `tb_user` VALUES ('llowid_a1681914', 'user_9fd4be94', 'F34E0A8A3EC990993B76B0E9CE60291B', '1565595365296@qq.com', NULL, NULL, '男', NULL, '西藏', NULL, '2019-08-12 15:36:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_a1ab2c62', 'user_1438fb75', '9CB2A53D52BC8C7FC5BA64EEB7AA0FA8', '1565595377153@qq.com', NULL, NULL, '女', NULL, '青海', NULL, '2019-08-12 15:36:17', 1);
INSERT INTO `tb_user` VALUES ('llowid_a1b24334', 'user_337e1db3', '338FBA851074AF878195A746BBE7C893', '1565596614746@qq.com', NULL, NULL, '女', NULL, '上海', NULL, '2019-08-12 15:56:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_a1c32754', 'user_614eb397', 'F8B2B98042F74085D9A0AC0CE63EBE7F', '1565595385111@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:36:25', 1);
INSERT INTO `tb_user` VALUES ('llowid_a1ea4482', 'user_8153e184', '741A0BD33D4C75466F8B478401A6C53B', '1565596618502@qq.com', NULL, NULL, '女', NULL, '河南', NULL, '2019-08-12 15:56:58', 1);
INSERT INTO `tb_user` VALUES ('llowid_a22af7c7', 'user_bf9e3bf9', 'B3DFED1AEE4CEF8B8A96AFC5638D373C', '1565595381259@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:36:21', 1);
INSERT INTO `tb_user` VALUES ('llowid_a2327478', 'user_7a146018', 'A44BCCFBF2CB9113CA42E8BC713D8CCC', '1565595364836@qq.com', NULL, NULL, '男', NULL, '山东', NULL, '2019-08-12 15:36:04', 1);
INSERT INTO `tb_user` VALUES ('llowid_a234e617', 'user_dc9614ee', '110982AEF3AF67ACFB82CBB65557F31E', '1565594671483@qq.com', NULL, NULL, '男', NULL, '贵州', NULL, '2019-08-12 15:24:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_a242fa68', 'user_cfc465ab', '253AC1C328F9D9A616CBD936646E58DD', 'admin@qq.com', NULL, NULL, '女', NULL, '澳门', NULL, '2019-08-15 19:16:25', 1);
INSERT INTO `tb_user` VALUES ('llowid_a2764156', 'user_5bc9b8eb', '8F15E2421469DD9FFDE448F4B0757C78', '1565596607851@qq.com', NULL, NULL, '女', NULL, '上海', NULL, '2019-08-12 15:56:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_a27b7f67', 'user_c554519b', '32923F182F5D64899403058B96A25E89', '1565595174598@qq.com', NULL, NULL, '女', NULL, '河南', NULL, '2019-08-12 15:32:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_a27b8c1e', 'user_022b1473', 'A838A0E0F1E0DF7ABBE5B149D27703C2', '1565595388017@qq.com', NULL, NULL, '女', NULL, '河北', NULL, '2019-08-12 15:36:28', 1);
INSERT INTO `tb_user` VALUES ('llowid_a2bea324', 'user_703a48c8', '4D1FF3162442E63FC0453D2C639CAE66', '1565596614226@qq.com', NULL, NULL, '女', NULL, '吉林', NULL, '2019-08-12 15:56:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_a3318a88', 'user_49ccad35', '883F624EFD1B122976F037003632B781', '1565596623987@qq.com', NULL, NULL, '女', NULL, '广东', NULL, '2019-08-12 15:57:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_a359b243', 'user_f0942509', '307FEAAD8D93380FE4C0B857DDD6BE79', '1565595171416@qq.com', NULL, NULL, '男', NULL, '澳门', NULL, '2019-08-12 15:32:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_a364013c', 'user_fd47bba2', 'C04E9D29A0F5B332F3D8DCA14B1C02FF', '1565595366861@qq.com', NULL, NULL, '男', NULL, '云南', NULL, '2019-08-12 15:36:06', 1);
INSERT INTO `tb_user` VALUES ('llowid_a3a42d08', 'user_049b78c2', '5634B31543ABE466F59F5786D4EC350D', '3219492508@qq.com', '', 'http://image.stodger.club/images/7dd91b9e2fd6405c86d6cc216584014d.jpg', '女', NULL, '湖北', '2019-08-08', '2019-08-08 08:47:02', 1);
INSERT INTO `tb_user` VALUES ('llowid_a3aa3b94', 'user_c5a4a1c1', '00437E34BBF56E157291F4395CE76948', '1565595376670@qq.com', NULL, NULL, '男', NULL, '辽宁', NULL, '2019-08-12 15:36:16', 1);
INSERT INTO `tb_user` VALUES ('llowid_a3d2e151', 'user_7dff4dc4', 'A0BEA32A3EA2C5AC6E9446E38D0653F5', '1565595370390@qq.com', NULL, NULL, '女', NULL, '湖南', NULL, '2019-08-12 15:36:10', 1);
INSERT INTO `tb_user` VALUES ('llowid_a3d8b249', 'user_9536413d', 'DDE3C810EE580377D92BFD6486424845', '1565595366924@qq.com', NULL, NULL, '男', NULL, '广东', NULL, '2019-08-12 15:36:06', 1);
INSERT INTO `tb_user` VALUES ('llowid_a3fc49fc', 'user_da49eea3', '8CE4FD76700D8984D459325C9B333094', '1565595377251@qq.com', NULL, NULL, '男', NULL, '河北', NULL, '2019-08-12 15:36:17', 1);
INSERT INTO `tb_user` VALUES ('llowid_a42a20d3', 'user_2fc57a14', '63705B7252A46D74603A82FF450CFCED', '1565595370426@qq.com', NULL, NULL, '女', NULL, '西藏', NULL, '2019-08-12 15:36:10', 1);
INSERT INTO `tb_user` VALUES ('llowid_a474eb1a', 'user_7907b014', 'AE73F8B96E6B544EB0E585F12269D0C1', '1565596617852@qq.com', NULL, NULL, '女', NULL, '内蒙古', NULL, '2019-08-12 15:56:57', 1);
INSERT INTO `tb_user` VALUES ('llowid_a484a6bf', 'user_15d418ca', '2223D1BAB00BCCAB4E06240FECB7B47F', '1565595171879@qq.com', NULL, NULL, '女', NULL, '广西', NULL, '2019-08-12 15:32:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_a487cb41', 'user_5860c1ea', '29230DBCBF109A85D7BE955B8F083432', '1565596619199@qq.com', NULL, NULL, '女', NULL, '台湾', NULL, '2019-08-12 15:56:59', 1);
INSERT INTO `tb_user` VALUES ('llowid_a4918ca5', 'user_34dd7849', 'CD23461BF18D5B6EA5F38A89E3D1FFCD', '1565595365456@qq.com', NULL, NULL, '男', NULL, '湖北', NULL, '2019-08-12 15:36:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_a496c81c', 'user_c95dee18', 'B17704CA768196782B71AB8A3F10BB62', '1565595269733@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:34:29', 1);
INSERT INTO `tb_user` VALUES ('llowid_a49e4d16', 'user_400b9508', '395F2606E4FA62FC0B59D349C42A10BF', '1565595387055@qq.com', NULL, NULL, '男', NULL, '澳门', NULL, '2019-08-12 15:36:27', 1);
INSERT INTO `tb_user` VALUES ('llowid_a4bebb35', 'user_e83d89be', '7D48ACC0709177484A65D566E991452C', '1565594866995@qq.com', NULL, NULL, '男', NULL, '台湾', NULL, '2019-08-12 15:27:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_a4c2a8ed', 'user_178cd646', '096B129C7F949CEE2DEDC6B0E433A2D4', '1565595371511@qq.com', NULL, NULL, '女', NULL, '山西', NULL, '2019-08-12 15:36:11', 1);
INSERT INTO `tb_user` VALUES ('llowid_a4c7ea2f', 'user_ed8065d0', '97E9F38C3539140C744ED9905EE8EBB2', '1565595383624@qq.com', NULL, NULL, '女', NULL, '浙江', NULL, '2019-08-12 15:36:23', 1);
INSERT INTO `tb_user` VALUES ('llowid_a4ebaafa', 'user_a041f6bd', 'A5EA3B4810B2907A080DA0713F146BD9', '1565595379335@qq.com', NULL, NULL, '女', NULL, '香港', NULL, '2019-08-12 15:36:19', 1);
INSERT INTO `tb_user` VALUES ('llowid_a502074d', 'user_bad14af4', '4A6DF4C413EBB657EE9FA0FC1AE76375', '1565595365061@qq.com', NULL, NULL, '男', NULL, '浙江', NULL, '2019-08-12 15:36:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_a508ac40', 'user_bdf9d046', 'D15057543DFC46A6E7AB8138D012C5F3', '1565596612543@qq.com', NULL, NULL, '女', NULL, '山西', NULL, '2019-08-12 15:56:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_a5a06953', 'user_a1e4d6ea', '4498499AB766C3FF77037F94FCADED82', '1565595369013@qq.com', NULL, NULL, '女', NULL, '四川', NULL, '2019-08-12 15:36:09', 1);
INSERT INTO `tb_user` VALUES ('llowid_a5e8144e', 'user_a48647df', '248E0DA0E3FA4D8B60D61FE3ADE47E5E', '1565596609038@qq.com', NULL, NULL, '女', NULL, '湖南', NULL, '2019-08-12 15:56:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_a65e06bb', 'user_0e6143bd', '43601CFD753D20582174C5631B1578F0', '1565595387364@qq.com', NULL, NULL, '女', NULL, '江苏', NULL, '2019-08-12 15:36:27', 1);
INSERT INTO `tb_user` VALUES ('llowid_a66342c4', 'user_0404ba89', 'BB537903B179E19C3E52ABCE6B099738', '1565594930864@qq.com', NULL, NULL, '女', NULL, '上海', NULL, '2019-08-12 15:28:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_a6771024', 'user_126da188', '914F607276319C557C9714328FD9F970', '1565594930174@qq.com', NULL, NULL, '男', NULL, '四川', NULL, '2019-08-12 15:28:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_a6ae2d94', 'user_440e7eb4', '982C57199D192EF91E9DA357C33F7B9C', '1565596621744@qq.com', NULL, NULL, '女', NULL, '香港', NULL, '2019-08-12 15:57:01', 1);
INSERT INTO `tb_user` VALUES ('llowid_a6b974eb', 'user_871f6c98', '0E22625C96B3CB24F5392D5F38B77E18', '1565595391061@qq.com', NULL, NULL, '女', NULL, '浙江', NULL, '2019-08-12 15:36:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_a6eb9fb5', 'user_d618e33e', '7F627E37BCFC73D40B35F5F3AD5952F4', '1565595388551@qq.com', NULL, NULL, '女', NULL, '甘肃', NULL, '2019-08-12 15:36:28', 1);
INSERT INTO `tb_user` VALUES ('llowid_a7df4cfa', 'user_c9648429', 'E525B2027DDE9EF53E82BF53CA8527C4', '1565596609578@qq.com', NULL, NULL, '女', NULL, '上海', NULL, '2019-08-12 15:56:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_a837c6b4', 'user_4ef5d149', '8813A114B526CF546673C3F222156C69', '1565595173909@qq.com', NULL, NULL, '女', NULL, '陕西', NULL, '2019-08-12 15:32:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_a8448f6b', 'user_d922655c', '061F285DB79A30D7C933449BF59BBFC5', '1565595378578@qq.com', NULL, NULL, '女', NULL, '浙江', NULL, '2019-08-12 15:36:18', 1);
INSERT INTO `tb_user` VALUES ('llowid_a84b32d5', 'user_8fb52de3', '5D5077F067DB8C05C851B2D7544CC081', '1565595366175@qq.com', NULL, NULL, '女', NULL, '山东', NULL, '2019-08-12 15:36:06', 1);
INSERT INTO `tb_user` VALUES ('llowid_a88b1dd0', 'user_9346d994', '5634B31543ABE466F59F5786D4EC350D', '99227@dd567d.com', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-14 09:07:32', 1);
INSERT INTO `tb_user` VALUES ('llowid_a8b4c4ee', 'user_7a5ba684', '99C93CDADFAECCBE20960F3DAD74EBE5', '1565595379306@qq.com', NULL, NULL, '男', NULL, '四川', NULL, '2019-08-12 15:36:19', 1);
INSERT INTO `tb_user` VALUES ('llowid_a8d0445f', 'user_6763f2c9', '93EBCCCFD32AF689127DB3D1A02DF705', '1565596607372@qq.com', NULL, NULL, '女', NULL, '上海', NULL, '2019-08-12 15:56:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_a8ed8d81', 'user_8fc5a71e', '53CAB719042370320A759CC7DF6CB5A2', '1565595172515@qq.com', NULL, NULL, '女', NULL, '四川', NULL, '2019-08-12 15:32:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_a9023d69', 'user_66ae2e95', 'F31ED5407619BF43122144D958B5BBED', '1565594633250@qq.com', NULL, NULL, '男', NULL, '陕西', NULL, '2019-08-12 15:23:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_a90d15e7', 'user_4c255a49', '9B01300F9D2E92EBCBC92047F9154994', '1565595391028@qq.com', NULL, NULL, '女', NULL, '新疆', NULL, '2019-08-12 15:36:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_a925e9f6', 'user_2d8e92c7', 'A12226E49F295175201BA1209F445111', '1565596623645@qq.com', NULL, NULL, '女', NULL, '澳门', NULL, '2019-08-12 15:57:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_a9367ea7', 'user_26c467c8', '331AFF31A1DEBD64261921ADA946D588', '1565595388460@qq.com', NULL, NULL, '男', NULL, '浙江', NULL, '2019-08-12 15:36:28', 1);
INSERT INTO `tb_user` VALUES ('llowid_a9492ab7', 'user_3c54dcf8', '0A1886B0DFAF34F9D69C2063D9B74803', '1565596620898@qq.com', NULL, NULL, '女', NULL, '辽宁', NULL, '2019-08-12 15:57:00', 1);
INSERT INTO `tb_user` VALUES ('llowid_a94a105c', 'user_30800b6e', 'CFA406D7BF2087C832B599761AD52DD4', '1565595374791@qq.com', NULL, NULL, '女', NULL, '山东', NULL, '2019-08-12 15:36:14', 1);
INSERT INTO `tb_user` VALUES ('llowid_a94b8fed', 'user_8a3c9440', 'B2A8211D75778308D959EA710E7158C9', '1565596614119@qq.com', NULL, NULL, '女', NULL, '贵州', NULL, '2019-08-12 15:56:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_a94de460', 'user_41e69906', '005A4D1A09F8CDE931E80476E6CE7B4E', '1565594931800@qq.com', NULL, NULL, '女', NULL, '海南', NULL, '2019-08-12 15:28:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_a964443b', 'user_4156b931', 'F086DE3C2E94B72FCD25A032FFE4CA7D', '1565595387394@qq.com', NULL, NULL, '女', NULL, '四川', NULL, '2019-08-12 15:36:27', 1);
INSERT INTO `tb_user` VALUES ('llowid_a98b49c5', 'user_97c06f13', 'B9788BC015ED294C2C92E9D493BFE9A6', '1565595384633@qq.com', NULL, NULL, '男', NULL, '辽宁', NULL, '2019-08-12 15:36:24', 1);
INSERT INTO `tb_user` VALUES ('llowid_a9d4e97a', 'user_3892b73f', '0F40E0CDAA20977198ABF53C7DB3C8F6', '1565596618769@qq.com', NULL, NULL, '女', NULL, '西藏', NULL, '2019-08-12 15:56:58', 1);
INSERT INTO `tb_user` VALUES ('llowid_a9e60a04', 'user_f99aec58', '6D02FCDDCA380A075391D3DCC1586797', '1565595380162@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:36:20', 1);
INSERT INTO `tb_user` VALUES ('llowid_aa01842b', 'user_0db26d42', '34B82B62890EED3C3C9F1AEF61487A70', '1565595173464@qq.com', NULL, NULL, '女', NULL, '西藏', NULL, '2019-08-12 15:32:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_aa15495b', 'user_492ba58c', 'B6BD66790F043070475FE807017BC723', '1565594865381@qq.com', NULL, NULL, '男', NULL, '广东', NULL, '2019-08-12 15:27:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_aa3afa78', 'user_4f97906c', '8A3895A96587A562AA96F19D0DAB6BEF', '1565595386963@qq.com', NULL, NULL, '女', NULL, '香港', NULL, '2019-08-12 15:36:26', 1);
INSERT INTO `tb_user` VALUES ('llowid_aa6f46ba', 'user_61a2d069', '135CC06872F81AB9316FAC9EEF544A47', '1565595362093@qq.com', NULL, NULL, '男', NULL, '山西', NULL, '2019-08-12 15:36:02', 1);
INSERT INTO `tb_user` VALUES ('llowid_aa9e86aa', 'user_498017af', '5D7D32F2A27A443E61E0D2F92A39EC50', '1565595364575@qq.com', NULL, NULL, '女', NULL, '澳门', NULL, '2019-08-12 15:36:04', 1);
INSERT INTO `tb_user` VALUES ('llowid_aab233f6', 'user_06d742bd', '8D59EB27FA1C7359BA6E9612E310E68E', '1565595378145@qq.com', NULL, NULL, '男', NULL, '内蒙古', NULL, '2019-08-12 15:36:18', 1);
INSERT INTO `tb_user` VALUES ('llowid_aad0121e', 'user_443ca961', '17671AB0F02935BD055730697F2785A6', '1565595377797@qq.com', NULL, NULL, '男', NULL, '河北', NULL, '2019-08-12 15:36:17', 1);
INSERT INTO `tb_user` VALUES ('llowid_aae42b45', 'user_1a54f77c', 'A7B065DD97449DAA2347AAD169BD2E4C', '1565595371478@qq.com', NULL, NULL, '女', NULL, '新疆', NULL, '2019-08-12 15:36:11', 1);
INSERT INTO `tb_user` VALUES ('llowid_ab25932b', 'user_11a5c292', '9A99F8C2BF21372AC60A4927A8664F18', '1565595379264@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:36:19', 1);
INSERT INTO `tb_user` VALUES ('llowid_ab90e4b8', 'user_b64b6085', 'F7C10CCF44E4A9284C38C0AE1EB41DD4', '1565596607290@qq.com', NULL, NULL, '女', NULL, '云南', NULL, '2019-08-12 15:56:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_aba34cfa', 'user_253bf40b', '94351DE2B23738C7AD108504A4C61B5F', '1565595368889@qq.com', NULL, NULL, '女', NULL, '河北', NULL, '2019-08-12 15:36:08', 1);
INSERT INTO `tb_user` VALUES ('llowid_abbae1b7', 'user_e5996308', 'D01041600C8F5F4DC239296B56FDE369', '1565595362344@qq.com', NULL, NULL, '男', NULL, '河北', NULL, '2019-08-12 15:36:02', 1);
INSERT INTO `tb_user` VALUES ('llowid_abd6b59d', 'user_888ced5b', '8936C63E8F51EED6FC0DD89EF2EAB549', '1565595387680@qq.com', NULL, NULL, '男', NULL, '内蒙古', NULL, '2019-08-12 15:36:27', 1);
INSERT INTO `tb_user` VALUES ('llowid_abf963a4', 'user_ac87feab', '02318F081E7FF5A851CDA5B29267C5D4', '1565595386664@qq.com', NULL, NULL, '男', NULL, '澳门', NULL, '2019-08-12 15:36:26', 1);
INSERT INTO `tb_user` VALUES ('llowid_ac014e84', 'user_a84f6483', '0749B4170F29DE1EC02B944DCBEB9D81', '1565595378237@qq.com', NULL, NULL, '男', NULL, '新疆', NULL, '2019-08-12 15:36:18', 1);
INSERT INTO `tb_user` VALUES ('llowid_ac862b89', 'user_f172ac63', 'EB0060C5438F0CE8BF471EA2005E5906', '1565594931839@qq.com', NULL, NULL, '女', NULL, '湖北', NULL, '2019-08-12 15:28:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_ace004ed', 'user_5c4f73aa', '36D1844CB60E64BA5A028269D8DF550D', '1565595365749@qq.com', NULL, NULL, '男', NULL, '西藏', NULL, '2019-08-12 15:36:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_acf5e973', 'user_8b75b02b', '7B3BE363DC4A2DD9769728B826EF471C', '1565595379108@qq.com', NULL, NULL, '男', NULL, '广西', NULL, '2019-08-12 15:36:19', 1);
INSERT INTO `tb_user` VALUES ('llowid_ad021afb', 'user_b88dbe8d', 'BF43AABD2AD8DEA9CD7F82F59CFC56AD', '1565594864852@qq.com', NULL, NULL, '男', NULL, '云南', NULL, '2019-08-12 15:27:44', 1);
INSERT INTO `tb_user` VALUES ('llowid_ad052437', 'user_4a2541f1', 'D35AF716C450126F4D7CC1FA12F316CD', '1565594633324@qq.com', NULL, NULL, '男', NULL, '安徽', NULL, '2019-08-12 15:23:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_ad1f894f', 'user_5e879c53', 'B21ED8F134FA617DE2989BDB29C6B80D', '1565595366656@qq.com', NULL, NULL, '女', NULL, '海南', NULL, '2019-08-12 15:36:06', 1);
INSERT INTO `tb_user` VALUES ('llowid_ad35e65a', 'user_03161c5d', '812881BE18A9B418DBECDEA9C23C8AB9', '1565596623371@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:57:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_ad4979ef', 'user_460e3706', 'F35959495560F2662E5616B09596D4B2', '1565595370358@qq.com', NULL, NULL, '女', NULL, '宁夏', NULL, '2019-08-12 15:36:10', 1);
INSERT INTO `tb_user` VALUES ('llowid_ad86f508', 'user_df824414', 'E7B21F012DC5BAE266E188FE4FCF3786', '1565595171796@qq.com', NULL, NULL, '男', NULL, '广西', NULL, '2019-08-12 15:32:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_adcc94b6', 'user_94311a8c', '5D6EB36E570CCC291A42F49451D0A1E4', '1565595383149@qq.com', NULL, NULL, '男', NULL, '福建', NULL, '2019-08-12 15:36:23', 1);
INSERT INTO `tb_user` VALUES ('llowid_add72c46', 'user_bae28fda', '695C4FCACE8958372E426BF1B2B4DE29', '1565596607718@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:56:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_ae0a0e14', 'user_d21c4919', '50B04F6958D8A52EA71AC2AB647918FF', '1565596618125@qq.com', NULL, NULL, '女', NULL, '台湾', NULL, '2019-08-12 15:56:58', 1);
INSERT INTO `tb_user` VALUES ('llowid_ae409b38', 'user_437d9b07', 'B7085B30166846C8F0EB6CE1C0CF57CF', '1565595377894@qq.com', NULL, NULL, '女', NULL, '海南', NULL, '2019-08-12 15:36:17', 1);
INSERT INTO `tb_user` VALUES ('llowid_ae576758', 'user_9ce8bcbd', '5634B31543ABE466F59F5786D4EC350D', '123455@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 16:50:16', 1);
INSERT INTO `tb_user` VALUES ('llowid_ae6e41e4', 'user_e2889497', 'FC67E9390E46F5998F54AD477E174E01', '1565595391518@qq.com', NULL, NULL, '男', NULL, '西藏', NULL, '2019-08-12 15:36:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_ae858f65', 'user_1ab7e912', '1D932457F4A46D2043DC107492D5F9FB', '1565595385592@qq.com', NULL, NULL, '女', NULL, '浙江', NULL, '2019-08-12 15:36:25', 1);
INSERT INTO `tb_user` VALUES ('llowid_aeaba54f', 'user_48b58509', '53B0E22E6C97D2AFE160108341C66EAC', '1565595378340@qq.com', NULL, NULL, '女', NULL, '云南', NULL, '2019-08-12 15:36:18', 1);
INSERT INTO `tb_user` VALUES ('llowid_aecad854', 'user_4e5f2ea4', '5B2F51FB4D50A811984B3E8EFECD55CA', '1565595377767@qq.com', NULL, NULL, '女', NULL, '江苏', NULL, '2019-08-12 15:36:17', 1);
INSERT INTO `tb_user` VALUES ('llowid_aee5e94c', 'user_a2c893ea', 'C1C5313E9CA2387F85ABA9F76296ADF2', '1565594930904@qq.com', NULL, NULL, '男', NULL, '吉林', NULL, '2019-08-12 15:28:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_af440b7d', 'user_74c3ca0d', 'B812F98F92DAD865ABD41CFBBB871230', '1565596614809@qq.com', NULL, NULL, '女', NULL, '宁夏', NULL, '2019-08-12 15:56:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_af5b1030', 'user_f92499c8', '77FE97962DC0D62142D2ECFC15937849', '1565595373511@qq.com', NULL, NULL, '男', NULL, '西藏', NULL, '2019-08-12 15:36:13', 1);
INSERT INTO `tb_user` VALUES ('llowid_afb28959', 'user_49c5ad8b', 'DB27961760F5527ABFC5C30EF40E4088', '1565595380866@qq.com', NULL, NULL, '男', NULL, '陕西', NULL, '2019-08-12 15:36:20', 1);
INSERT INTO `tb_user` VALUES ('llowid_aff994ef', 'user_31cf1085', 'C321315AF0C0802C82B6C54A06432D51', '1565595366143@qq.com', NULL, NULL, '男', NULL, '湖南', NULL, '2019-08-12 15:36:06', 1);
INSERT INTO `tb_user` VALUES ('llowid_affa37f1', 'user_6049bb9f', '2583E80551342C0B4D6E4F3E61639DC9', '1565596617360@qq.com', NULL, NULL, '女', NULL, '云南', NULL, '2019-08-12 15:56:57', 1);
INSERT INTO `tb_user` VALUES ('llowid_affab976', 'user_1e015514', '772D9A1333F33EE55BC001D969B885FA', '1565594932718@qq.com', NULL, NULL, '女', NULL, '浙江', NULL, '2019-08-12 15:28:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_afface04', 'user_6645e2b4', 'A52798E2A2744021527B560198655D84', '1565596617015@qq.com', NULL, NULL, '女', NULL, '江苏', NULL, '2019-08-12 15:56:57', 1);
INSERT INTO `tb_user` VALUES ('llowid_b0491254', 'user_401bd42c', '39CF5481021CC24737F6B514186D306A', '1565595114154@qq.com', NULL, NULL, '女', NULL, '贵州', NULL, '2019-08-12 15:31:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_b07114f2', 'user_50f4f6c8', '371E2EA296A1A09ECDFA5564DA699C46', '1565595375483@qq.com', NULL, NULL, '男', NULL, '山西', NULL, '2019-08-12 15:36:15', 1);
INSERT INTO `tb_user` VALUES ('llowid_b076f840', 'user_763d1c74', '07BE45C4C7197C72582752052D0931E7', '1565595378667@qq.com', NULL, NULL, '女', NULL, '新疆', NULL, '2019-08-12 15:36:18', 1);
INSERT INTO `tb_user` VALUES ('llowid_b08e141a', 'user_f2a5a644', 'C042CF745A2934411B9618AF1439494D', '1565596607584@qq.com', NULL, NULL, '女', NULL, '内蒙古', NULL, '2019-08-12 15:56:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_b0b88ae9', 'user_f7984b9d', '9BDBE03DF57D1D201987A155369DBEE3', '1565595389542@qq.com', NULL, NULL, '男', NULL, '四川', NULL, '2019-08-12 15:36:29', 1);
INSERT INTO `tb_user` VALUES ('llowid_b0bc3b7d', 'user_28446c89', '2DED21F91FE4BCE18E86D088B79C24DD', '1565595270404@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:34:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_b0c84248', 'user_434d7b9f', 'A49533AD715380C3F0C77FC923180A6D', '1565595172956@qq.com', NULL, NULL, '女', NULL, '湖南', NULL, '2019-08-12 15:32:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_b0dc14a7', 'user_49ea6a22', 'C129B1800EDC4DDB194F31E9DA4FCD2F', '1565595385197@qq.com', NULL, NULL, '男', NULL, '安徽', NULL, '2019-08-12 15:36:25', 1);
INSERT INTO `tb_user` VALUES ('llowid_b0e4490a', 'user_e2675a4d', '3D766FFBA3BD2B30DE7BAA21A0A000B9', '1565595389454@qq.com', NULL, NULL, '女', NULL, '台湾', NULL, '2019-08-12 15:36:29', 1);
INSERT INTO `tb_user` VALUES ('llowid_b0fe4d7d', 'user_20172562', '4EC1BC5A867FFD4DCE8A41054E59FD42', '1565596617188@qq.com', NULL, NULL, '女', NULL, '贵州', NULL, '2019-08-12 15:56:57', 1);
INSERT INTO `tb_user` VALUES ('llowid_b123d048', 'user_79a58400', 'BED8361B2BD5055B72DC9DDB136BADD8', '1565595174821@qq.com', NULL, NULL, '男', NULL, '重庆', NULL, '2019-08-12 15:32:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_b134f2f2', 'user_849bcbb2', 'FF445C98C5811C249DBAA0A0F02BF79A', '1565596609973@qq.com', NULL, NULL, '女', NULL, '新疆', NULL, '2019-08-12 15:56:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_b1411344', 'user_6ea0b217', '30112889D265F3981B361DB3FCDC7865', '1565594929344@qq.com', NULL, NULL, '男', NULL, '新疆', NULL, '2019-08-12 15:28:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_b1613bd4', 'user_a8587035', '0C01E23CD4787330598235E1A9E1EC02', '1565594671946@qq.com', NULL, NULL, '男', NULL, '浙江', NULL, '2019-08-12 15:24:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_b1af8b42', 'user_4d6270c4', 'CC5C816DB61CE36D3065FACB9EC20C92', '1565596609105@qq.com', NULL, NULL, '女', NULL, '湖南', NULL, '2019-08-12 15:56:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_b1e41451', 'user_4ec7bb70', '9B7BF609A74830D2E5344B40A217915A', '1565595365159@qq.com', NULL, NULL, '男', NULL, '内蒙古', NULL, '2019-08-12 15:36:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_b1e5834f', 'user_c806b864', 'DC44F860814CC93393C02B984EBFD7F5', '1565595115553@qq.com', NULL, NULL, '男', NULL, '北京', NULL, '2019-08-12 15:31:55', 1);
INSERT INTO `tb_user` VALUES ('llowid_b2694484', 'user_9ebd8ca9', '2146254584ED97102E61CF0DD84A17C5', '1565595391550@qq.com', NULL, NULL, '女', NULL, '广东', NULL, '2019-08-12 15:36:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_b2984bb0', '我要买东西', '2A1773EE6EDBE63B3F997BD017C658E6', '957847427@qq.com', NULL, NULL, '男', NULL, '四川', '', '2019-08-15 19:25:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_b2a54d16', 'user_5edb1574', '5634B31543ABE466F59F5786D4EC350D', '1233@qq.com', '15277496832', NULL, NULL, NULL, NULL, NULL, '2019-08-15 08:12:24', 1);
INSERT INTO `tb_user` VALUES ('llowid_b2dcb246', 'user_92740628', '2063B74C1BB1B9B307B1D40394F868B6', '1565596611870@qq.com', NULL, NULL, '女', NULL, '云南', NULL, '2019-08-12 15:56:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_b2f51466', 'user_0cac29fe', '631A66200753F8F30D72EC1F8BFE80AE', '1565594864543@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:27:44', 1);
INSERT INTO `tb_user` VALUES ('llowid_b36a3278', 'user_468b0645', 'EBC90EC5CCE7F694347D008A26A469E2', '1565595393796@qq.com', NULL, NULL, '女', NULL, '宁夏', NULL, '2019-08-12 15:36:33', 1);
INSERT INTO `tb_user` VALUES ('llowid_b3925937', 'user_e4237886', '631FA1FAA46F1D0B3D2A301A15230FE2', '1565595369858@qq.com', NULL, NULL, '男', NULL, '宁夏', NULL, '2019-08-12 15:36:09', 1);
INSERT INTO `tb_user` VALUES ('llowid_b3979614', 'user_64bae83e', '048E06B9E1BC3E418EC41915F3570CB1', '1565596618236@qq.com', NULL, NULL, '女', NULL, '香港', NULL, '2019-08-12 15:56:58', 1);
INSERT INTO `tb_user` VALUES ('llowid_b399c4f2', 'user_dc841828', 'D14295DBA70C84C47A083445A4941AD4', '1565596613092@qq.com', NULL, NULL, '女', NULL, '新疆', NULL, '2019-08-12 15:56:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_b3b726a3', 'user_36e55463', '8DE4F5882AA1D16D1C97796EF108969E', '1565596606975@qq.com', NULL, NULL, '女', NULL, '湖南', NULL, '2019-08-12 15:56:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_b3d41e49', 'user_041471e9', '96BE6E0BBA7B886F67C548B2B815200A', '1565595381102@qq.com', NULL, NULL, '男', NULL, '山西', NULL, '2019-08-12 15:36:21', 1);
INSERT INTO `tb_user` VALUES ('llowid_b3f35368', 'user_5ed892e4', '8946954663822EAE8CEB623F4A969EAA', '1565594866185@qq.com', NULL, NULL, '男', NULL, '海南', NULL, '2019-08-12 15:27:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_b40508c1', 'user_79af723d', '4D88A85E0960FCD38A50620DCDEE767F', '1565595112747@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:31:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_b415fbdf', 'user_1ed9512f', '8133B93FB96830CAB4186137FE842B1A', '1565594930461@qq.com', NULL, NULL, '男', NULL, '江西', NULL, '2019-08-12 15:28:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_b41f7a5a', 'user_78499bfd', 'EDF6DA3C360BBDCAEF9A4D569A377470', '1565595384061@qq.com', NULL, NULL, '女', NULL, '山西', NULL, '2019-08-12 15:36:24', 1);
INSERT INTO `tb_user` VALUES ('llowid_b43878b9', 'user_00384d4c', '5B31694EDDB3CA3945236D500A7D3ACB', '1565595392329@qq.com', NULL, NULL, '男', NULL, '海南', NULL, '2019-08-12 15:36:32', 1);
INSERT INTO `tb_user` VALUES ('llowid_b444db45', 'user_ce884578', '55F3E1C784F85779DF331D5E80E04C58', '1565595392853@qq.com', NULL, NULL, '男', NULL, '澳门', NULL, '2019-08-12 15:36:32', 1);
INSERT INTO `tb_user` VALUES ('llowid_b448395e', 'user_75b05c64', '0A94A109BE359D26FBD365F294EAE254', '1565595387087@qq.com', NULL, NULL, '女', NULL, '浙江', NULL, '2019-08-12 15:36:27', 1);
INSERT INTO `tb_user` VALUES ('llowid_b4521b7d', 'user_4b2f36b9', '9C513CE0C821787C8176D54C559FA9EF', '1565594864720@qq.com', NULL, NULL, '男', NULL, '内蒙古', NULL, '2019-08-12 15:27:44', 1);
INSERT INTO `tb_user` VALUES ('llowid_b45b149b', 'user_dad65308', '4CDE9E2D2F4C3AB91632311EF1A24EC0', '1565596607009@qq.com', NULL, NULL, '女', NULL, '内蒙古', NULL, '2019-08-12 15:56:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_b4904941', 'user_de7d403c', '96EF06735D5B65ADB0113A7F66C33781', '1565596609503@qq.com', NULL, NULL, '女', NULL, '台湾', NULL, '2019-08-12 15:56:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_b4a42b90', 'user_7e3471d5', '3B37D46ED2FFEB09F6523EB8D61BB386', '1565595379015@qq.com', NULL, NULL, '女', NULL, '陕西', NULL, '2019-08-12 15:36:19', 1);
INSERT INTO `tb_user` VALUES ('llowid_b4b15b7c', 'user_5067a4fe', '5E440C8F8D68A1D0D4E3B47140687354', '1565596618339@qq.com', NULL, NULL, '女', NULL, '上海', NULL, '2019-08-12 15:56:58', 1);
INSERT INTO `tb_user` VALUES ('llowid_b4c5d449', 'user_01cf4624', '5F2DE828FBD7ED362EF781520E2395DB', '1565594929631@qq.com', NULL, NULL, '男', NULL, '湖南', NULL, '2019-08-12 15:28:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_b4fe19e9', 'user_eaf785f7', '68D400924B12CE4804F1BD3E87BA8D25', '1565595388808@qq.com', NULL, NULL, '女', NULL, '四川', NULL, '2019-08-12 15:36:28', 1);
INSERT INTO `tb_user` VALUES ('llowid_b53ad76c', 'user_4eb6b3fd', '747585AED5CB16DA251A1D9BA9E174A2', '1565595371297@qq.com', NULL, NULL, '男', NULL, '宁夏', NULL, '2019-08-12 15:36:11', 1);
INSERT INTO `tb_user` VALUES ('llowid_b54876a6', 'user_47b5b342', '21F7535D22ABC4AA13B47463059FFA4D', '1565595393216@qq.com', NULL, NULL, '男', NULL, '江苏', NULL, '2019-08-12 15:36:33', 1);
INSERT INTO `tb_user` VALUES ('llowid_b610caf6', 'user_ef4fe89a', 'EA0C39654418307E90C13055C90A0742', '1565595114743@qq.com', NULL, NULL, '男', NULL, '广西', NULL, '2019-08-12 15:31:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_b6944565', 'user_c95ccff7', 'B71E1A91CDE2222DC82B2E23B50271D2', '1565595270911@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:34:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_b6b4aad8', 'user_464d1880', 'EB4BA8CA468F123E46373B4668EB50A1', '1565595368254@qq.com', NULL, NULL, '女', NULL, '上海', NULL, '2019-08-12 15:36:08', 1);
INSERT INTO `tb_user` VALUES ('llowid_b6db4765', 'user_704dcebe', '56DC979146F359F25FB5594C223790FE', '1565594932900@qq.com', NULL, NULL, '女', NULL, '河北', NULL, '2019-08-12 15:28:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_b6df5578', 'user_5926c214', '6FF460763EB80A47E744EBC505E7124F', '1565596612861@qq.com', NULL, NULL, '女', NULL, '澳门', NULL, '2019-08-12 15:56:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_b6fb394b', 'user_92dd91f1', '4DD8856F022CE7484F4AC4378B016EC1', '1565596609612@qq.com', NULL, NULL, '女', NULL, '山东', NULL, '2019-08-12 15:56:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_b6fde492', 'user_f34a0d8b', 'E9E270B34623275E874A193BB4CEE1AB', '1565595377281@qq.com', NULL, NULL, '女', NULL, '西藏', NULL, '2019-08-12 15:36:17', 1);
INSERT INTO `tb_user` VALUES ('llowid_b72d4311', 'user_5346b9b2', '60D792235BFB5FADB0F8235B2417390B', '1565596614713@qq.com', NULL, NULL, '女', NULL, '海南', NULL, '2019-08-12 15:56:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_b744d49e', 'user_4a68b91c', '3478901BC3136883D05893B19380C572', '1565595375992@qq.com', NULL, NULL, '女', NULL, '陕西', NULL, '2019-08-12 15:36:15', 1);
INSERT INTO `tb_user` VALUES ('llowid_b797e670', 'user_45184cd1', '3C37B06208BA458E27F4978692FF27F5', '1565596616935@qq.com', NULL, NULL, '女', NULL, '江苏', NULL, '2019-08-12 15:56:56', 1);
INSERT INTO `tb_user` VALUES ('llowid_b7ca44e0', 'user_754448d0', 'E95188BB60119ED3E357C755B0D7192D', '1565596618371@qq.com', NULL, NULL, '女', NULL, '广西', NULL, '2019-08-12 15:56:58', 1);
INSERT INTO `tb_user` VALUES ('llowid_b7ce0f0b', 'user_040a4b39', 'F150EB473C03F0EA3DB91AF6AFB68224', '1565594633163@qq.com', NULL, NULL, '男', NULL, '天津', NULL, '2019-08-12 15:23:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_b85a7e81', 'user_d0cf71f4', 'DE37A87501034007722F98110EC4F1C6', '1565595378176@qq.com', NULL, NULL, '女', NULL, '湖北', NULL, '2019-08-12 15:36:18', 1);
INSERT INTO `tb_user` VALUES ('llowid_b8775afb', 'user_6ba7d14b', '16046ACC31E94BF837525E1F2854CC8B', '1565595390399@qq.com', NULL, NULL, '男', NULL, '广西', NULL, '2019-08-12 15:36:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_b8b040cc', 'user_529b3ea9', '4B19C92C1B66A36E58ADFDF2589AD7C3', '1565595383392@qq.com', NULL, NULL, '女', NULL, '湖北', NULL, '2019-08-12 15:36:23', 1);
INSERT INTO `tb_user` VALUES ('llowid_b8eee246', 'user_68667f99', '5B0ED4F91692B64799A5FFC3222FEF5D', '1565596605574@qq.com', NULL, NULL, '女', NULL, '安徽', NULL, '2019-08-12 15:56:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_b93111c9', 'user_3e7684b2', 'CA1A7CAC23454C2F0312ADE140F01A32', '1565595113956@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:31:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_b956a1bf', 'user_48fbb8e7', '4EDE92D4288F38E86BDA6952748A9EFF', '1565595362998@qq.com', NULL, NULL, '男', NULL, '广东', NULL, '2019-08-12 15:36:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_b98e924d', 'user_3b82dbb5', '7E2C729E2940EA294FD95BAC7430269A', '1565595364208@qq.com', NULL, NULL, '男', NULL, '广西', NULL, '2019-08-12 15:36:04', 1);
INSERT INTO `tb_user` VALUES ('llowid_b994799a', 'user_fb057b9c', '7304BE108E34A29983117548A76A339E', '1565595375959@qq.com', NULL, NULL, '男', NULL, '重庆', NULL, '2019-08-12 15:36:15', 1);
INSERT INTO `tb_user` VALUES ('llowid_b998cd4a', 'user_27ba0da7', 'F451A0B944050026D864C81FCCBD6844', '1565595388143@qq.com', NULL, NULL, '男', NULL, '西藏', NULL, '2019-08-12 15:36:28', 1);
INSERT INTO `tb_user` VALUES ('llowid_b9a350d5', 'user_db46a0a1', '69A4CCA6619839CE0A350FD32222D591', '1565596616079@qq.com', NULL, NULL, '女', NULL, '重庆', NULL, '2019-08-12 15:56:56', 1);
INSERT INTO `tb_user` VALUES ('llowid_b9cd7456', 'user_4f6fb912', '0D20866523DF37173A4C4FBCCB6D98D5', '1565594863169@qq.com', NULL, NULL, '女', NULL, '海南', NULL, '2019-08-12 15:27:43', 1);
INSERT INTO `tb_user` VALUES ('llowid_b9f408ba', 'user_456084e0', '6B206BAA33AC58F381DD341E75F24AF4', '1565595376179@qq.com', NULL, NULL, '男', NULL, '香港', NULL, '2019-08-12 15:36:16', 1);
INSERT INTO `tb_user` VALUES ('llowid_ba049a46', 'user_7a1f4c4e', '003EF58B704361BAA3DC53503ECBE998', '1565595372808@qq.com', NULL, NULL, '男', NULL, '云南', NULL, '2019-08-12 15:36:12', 1);
INSERT INTO `tb_user` VALUES ('llowid_ba0d4b5e', 'user_fc18f784', '1B1CAAD752106762E8605A6886A4A335', '1565595368698@qq.com', NULL, NULL, '女', NULL, '上海', NULL, '2019-08-12 15:36:08', 1);
INSERT INTO `tb_user` VALUES ('llowid_ba2c6964', 'user_be505f02', '5CC698BA3313903FDB856814560AEDAF', '1565595368920@qq.com', NULL, NULL, '女', NULL, '湖南', NULL, '2019-08-12 15:36:08', 1);
INSERT INTO `tb_user` VALUES ('llowid_ba3aa0f1', 'user_ca64c979', 'DBD120B031A6E531BF5FB9E209678249', '1565595376341@qq.com', NULL, NULL, '男', NULL, '香港', NULL, '2019-08-12 15:36:16', 1);
INSERT INTO `tb_user` VALUES ('llowid_ba42ed98', 'user_17856428', '1826F4F8D54B51EFDD016B76EFD15A79', '1565595172027@qq.com', NULL, NULL, '女', NULL, '辽宁', NULL, '2019-08-12 15:32:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_bab0a9f5', 'user_4e42b345', '1DB1196E975EAC7C38804AF9828063D0', '1565596613503@qq.com', NULL, NULL, '女', NULL, '四川', NULL, '2019-08-12 15:56:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_bac91f3b', 'user_b36ae4ca', '6CDCE41120666B915781508E72411993', '1565595173872@qq.com', NULL, NULL, '男', NULL, '宁夏', NULL, '2019-08-12 15:32:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_bac94789', 'user_4d6443ba', '2A920D40CFDE2DC326F0489A95053200', '1565596612579@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:56:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_bad99f4e', 'user_4f8f8637', '46B684E82B9B0D0BE312554A60CAAD4A', '1565595363249@qq.com', NULL, NULL, '男', NULL, '湖南', NULL, '2019-08-12 15:36:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_bae9e650', 'user_22fc6df6', 'CFE5913FED80A947B06DFDF526B1FE5D', '1565596611322@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:56:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_baea943c', 'user_09cd3bd8', '9A0B7768CBA9C6C9ACE8E27D29BAF646', '1565596619496@qq.com', NULL, NULL, '女', NULL, '广西', NULL, '2019-08-12 15:56:59', 1);
INSERT INTO `tb_user` VALUES ('llowid_bb072677', 'user_0c967a41', '08DF213D9DF11C447C05DC7BEEB4BA59', '1565595371224@qq.com', NULL, NULL, '女', NULL, '河南', NULL, '2019-08-12 15:36:11', 1);
INSERT INTO `tb_user` VALUES ('llowid_bb2b3010', 'user_d41a8a71', 'DBAA56A950EA3939B22783B04B6BF7AD', '1565594930759@qq.com', NULL, NULL, '男', NULL, '新疆', NULL, '2019-08-12 15:28:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_bb402f9b', 'user_af02e45c', 'EA26EB8F879FA8153C72A6412EBC3A88', '1565595386206@qq.com', NULL, NULL, '男', NULL, '甘肃', NULL, '2019-08-12 15:36:26', 1);
INSERT INTO `tb_user` VALUES ('llowid_bb4427bb', 'user_15be04cf', '71532D6CBA26B6AD9E5AE602D02E92A4', '1565596607686@qq.com', NULL, NULL, '女', NULL, '河北', NULL, '2019-08-12 15:56:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_bb5a89f6', 'user_7e842f2d', '9185543C317601EC4B8EC207EF8610BF', '1565595376703@qq.com', NULL, NULL, '女', NULL, '贵州', NULL, '2019-08-12 15:36:16', 1);
INSERT INTO `tb_user` VALUES ('llowid_bb8dcf46', 'user_4e4bc468', 'C345B2AC0750F70FA0061C03BCA4EDDD', '1565596624165@qq.com', NULL, NULL, '女', NULL, '贵州', NULL, '2019-08-12 15:57:04', 1);
INSERT INTO `tb_user` VALUES ('llowid_bb9d7d54', 'user_3babef30', '256B32AB935BD3AF6ADF876234257E38', '1565595369929@qq.com', NULL, NULL, '女', NULL, '陕西', NULL, '2019-08-12 15:36:09', 1);
INSERT INTO `tb_user` VALUES ('llowid_bbacd9a4', 'user_228baf4d', '0C4645DBA56D01A6619C91637C73C52F', '1565595386598@qq.com', NULL, NULL, '女', NULL, '广东', NULL, '2019-08-12 15:36:26', 1);
INSERT INTO `tb_user` VALUES ('llowid_bbae12f1', 'user_0b741bcb', 'B2B69E85CDAF348F1B8A9C4A2F2283F3', '1565594932599@qq.com', NULL, NULL, '女', NULL, '青海', NULL, '2019-08-12 15:28:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_bbb8fc29', 'user_67a94e36', 'C32FB3E0BACA9DC9E895919006421D74', '1565595391125@qq.com', NULL, NULL, '男', NULL, '吉林', NULL, '2019-08-12 15:36:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_bbb918ef', 'user_3687a5de', '56C37E9A5F8617353397AE5A83644DB6', '1565596622547@qq.com', NULL, NULL, '女', NULL, '西藏', NULL, '2019-08-12 15:57:02', 1);
INSERT INTO `tb_user` VALUES ('llowid_bbbe42a7', 'user_a6421c9b', '14A9C1BF146895D38F249279E4E8588E', '1565595366205@qq.com', NULL, NULL, '男', NULL, '浙江', NULL, '2019-08-12 15:36:06', 1);
INSERT INTO `tb_user` VALUES ('llowid_bbc31b48', 'user_23a91111', '21B761902863F0708B90EFADE30A245A', '1565595369428@qq.com', NULL, NULL, '男', NULL, '四川', NULL, '2019-08-12 15:36:09', 1);
INSERT INTO `tb_user` VALUES ('llowid_bc08dd41', 'user_8aaa331a', '2F5EC950259FEF9237001ADC6F8FF2A6', '1565595174432@qq.com', NULL, NULL, '女', NULL, '江苏', NULL, '2019-08-12 15:32:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_bc16661e', 'user_4f37db89', '9CF095D666354432196C2C971B3AD837', '1565594671088@qq.com', NULL, NULL, '男', NULL, '辽宁', NULL, '2019-08-12 15:24:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_bc3f44f3', 'user_abd89c5c', 'CFB02EC8A728FB7FD982247612C916FC', '1565594932097@qq.com', NULL, NULL, '女', NULL, '山东', NULL, '2019-08-12 15:28:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_bc43e8bf', 'user_dea9b434', 'B479AA3491EA46D9D93C1947DBD568E4', '1565595389269@qq.com', NULL, NULL, '男', NULL, '云南', NULL, '2019-08-12 15:36:29', 1);
INSERT INTO `tb_user` VALUES ('llowid_bc49404a', 'user_92bc7269', '0E43A029219A93E23A272AD7C1F85052', '1565596607149@qq.com', NULL, NULL, '女', NULL, '宁夏', NULL, '2019-08-12 15:56:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_bc5e5ad5', 'user_79f4c848', 'C826C43ED5865B98C6601E501136D5D3', '1565595375173@qq.com', NULL, NULL, '女', NULL, '河北', NULL, '2019-08-12 15:36:15', 1);
INSERT INTO `tb_user` VALUES ('llowid_bcabe248', 'user_ff6ffef1', '052E7946AB132A73BE52065EC777E943', '1565595382040@qq.com', NULL, NULL, '女', NULL, '吉林', NULL, '2019-08-12 15:36:22', 1);
INSERT INTO `tb_user` VALUES ('llowid_bcadb409', 'user_046eabe1', '8ADE3879943A4639EEF9B0EF5C06FB9D', '1565595393186@qq.com', NULL, NULL, '男', NULL, '辽宁', NULL, '2019-08-12 15:36:33', 1);
INSERT INTO `tb_user` VALUES ('llowid_bcfc12e1', 'user_1bde1363', '4455CAC65A7113399DF61FAFE27E951A', '1565595376746@qq.com', NULL, NULL, '男', NULL, '浙江', NULL, '2019-08-12 15:36:16', 1);
INSERT INTO `tb_user` VALUES ('llowid_bd2084df', 'user_23428942', '3385756FDCB555FDC3E96431FB3B9B57', '1565596606694@qq.com', NULL, NULL, '女', NULL, '湖北', NULL, '2019-08-12 15:56:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_bd48729e', 'user_bc968ac4', '75308C03FEFB9A3FD264EA1F1EFECCC0', '1565595385403@qq.com', NULL, NULL, '男', NULL, '河南', NULL, '2019-08-12 15:36:25', 1);
INSERT INTO `tb_user` VALUES ('llowid_bd8d44a9', 'user_173cec42', '0010DFC64B807CB413922F8EFE431594', '1565596617720@qq.com', NULL, NULL, '女', NULL, '辽宁', NULL, '2019-08-12 15:56:57', 1);
INSERT INTO `tb_user` VALUES ('llowid_bda8cd30', 'user_740c1407', '2FEDF1839C7B86007A852485F33A08E0', '1565595380030@qq.com', NULL, NULL, '男', NULL, '浙江', NULL, '2019-08-12 15:36:20', 1);
INSERT INTO `tb_user` VALUES ('llowid_bdac4b34', 'user_abbb49c6', 'BA9C9DCEB10E83ADCB024A070F260E55', '1565595391579@qq.com', NULL, NULL, '男', NULL, '天津', NULL, '2019-08-12 15:36:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_be396b44', 'user_a9c4dd48', 'CD55FE857E3AB0174B08A66E15D80CD7', '1565595380346@qq.com', NULL, NULL, '男', NULL, '上海', NULL, '2019-08-12 15:36:20', 1);
INSERT INTO `tb_user` VALUES ('llowid_be3d264e', 'user_ba15285c', 'FC7CF97CAE8051181FAC600C99204CE2', '1565595377378@qq.com', NULL, NULL, '男', NULL, '新疆', NULL, '2019-08-12 15:36:17', 1);
INSERT INTO `tb_user` VALUES ('llowid_be6cb0b6', 'user_ebf2b0c7', '39DC439965E8E6E704B44B8557F5759F', '1565595393156@qq.com', NULL, NULL, '女', NULL, '台湾', NULL, '2019-08-12 15:36:33', 1);
INSERT INTO `tb_user` VALUES ('llowid_befd10b6', 'user_2023a041', 'D3CA600D786A9D9874ACEC12824B1F53', '1565595390210@qq.com', NULL, NULL, '男', NULL, '宁夏', NULL, '2019-08-12 15:36:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_bf03b46d', 'user_b11e59a5', 'D7F1BFECF4DADF3126CA912CA2C6348A', '1565596614300@qq.com', NULL, NULL, '女', NULL, '河南', NULL, '2019-08-12 15:56:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_bf107ebc', 'user_ba042b79', '83FDBC1B96168C6256181E168A5BFDA0', '1565595391995@qq.com', NULL, NULL, '男', NULL, '重庆', NULL, '2019-08-12 15:36:32', 1);
INSERT INTO `tb_user` VALUES ('llowid_bf314cc0', 'user_824fd459', '095DD06F149F6F844C5C23F07E5F1253', '1565594671913@qq.com', NULL, NULL, '男', NULL, '广东', NULL, '2019-08-12 15:24:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_bf4215b9', 'user_2440a886', 'B06934881902AC0E6FB4CBC877872C02', '1565595371573@qq.com', NULL, NULL, '男', NULL, '辽宁', NULL, '2019-08-12 15:36:11', 1);
INSERT INTO `tb_user` VALUES ('llowid_bf4f5486', 'user_4400b765', '56417A55E36BA82BAB7CEBF55D000380', '1565594931685@qq.com', NULL, NULL, '男', NULL, '云南', NULL, '2019-08-12 15:28:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_bf544d93', 'user_13854141', '08A27BC8242D702EC7173C97A0D46C7C', '1565596616976@qq.com', NULL, NULL, '女', NULL, '福建', NULL, '2019-08-12 15:56:56', 1);
INSERT INTO `tb_user` VALUES ('llowid_bf64e12a', 'user_235e9d21', '9970D34DC4BE8C602953FA1C221AE4E2', '1565595174255@qq.com', NULL, NULL, '女', NULL, '河南', NULL, '2019-08-12 15:32:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_bfa4472c', 'user_e8789465', 'ACBA9AC3F77CCC125FC9D13C27D0BB4E', '1565595172364@qq.com', NULL, NULL, '女', NULL, '湖北', NULL, '2019-08-12 15:32:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_bfa81694', 'user_1018bece', '10B4C90567D1D843386DCE7EF0A8F8B5', '1565596617623@qq.com', NULL, NULL, '女', NULL, '海南', NULL, '2019-08-12 15:56:57', 1);
INSERT INTO `tb_user` VALUES ('llowid_bfaacf8a', 'user_b0bb7599', '733A6DB23FBCC5027D7430CEE86D1B4A', '1565595390966@qq.com', NULL, NULL, '女', NULL, '山西', NULL, '2019-08-12 15:36:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_bfec1e3f', 'user_40f6bf11', 'FAAC598B937BE2ECB69029236D250A7F', '1565595113807@qq.com', NULL, NULL, '男', NULL, '贵州', NULL, '2019-08-12 15:31:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_bff0c41f', 'user_873977f8', 'AE03C03B86F45173B0FADF4A30A3AC39', '1565595365092@qq.com', NULL, NULL, '女', NULL, '云南', NULL, '2019-08-12 15:36:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_c04d30b2', 'user_a2eff620', '35FAFE497946877EBEACE32D03E11A7C', '1565595377478@qq.com', NULL, NULL, '女', NULL, '辽宁', NULL, '2019-08-12 15:36:17', 1);
INSERT INTO `tb_user` VALUES ('llowid_c04f927e', 'user_ad18c176', '70F77000F275FC31B62F0CC86BAC26DA', '1565596615645@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:56:55', 1);
INSERT INTO `tb_user` VALUES ('llowid_c09f533e', 'user_cf30b520', 'ABAB4B65A6083683606491E059E74260', '1565595174913@qq.com', NULL, NULL, '男', NULL, '江苏', NULL, '2019-08-12 15:32:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_c1120e49', 'user_d34d8a89', '8E597EC4D544AF25A347ADA1AD97DE04', '1565596607751@qq.com', NULL, NULL, '女', NULL, '台湾', NULL, '2019-08-12 15:56:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_c15bb444', 'user_f741439a', '812DB3256BA48F76F8088CB9D77F1DE6', '1565594931257@qq.com', NULL, NULL, '男', NULL, '甘肃', NULL, '2019-08-12 15:28:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_c164b14f', 'user_2a4fdfa5', '61B52007611B3E209A43BB44E61DCBED', '1565595112557@qq.com', NULL, NULL, '女', NULL, '广西', NULL, '2019-08-12 15:31:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_c1e17f68', 'user_8354b0da', '1CC9CCB0DB35C4E6F8047080225E7553', '1565596611803@qq.com', NULL, NULL, '女', NULL, '山东', NULL, '2019-08-12 15:56:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_c1fb3ab8', 'user_082a8a9c', '220A40D546A77F263F6BB8C4502CA607', '1565596614036@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:56:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_c24114af', 'user_6b45dcbe', '10D290C414543A2F88E4AE915FE5E5CB', '1565595372713@qq.com', NULL, NULL, '男', NULL, '澳门', NULL, '2019-08-12 15:36:12', 1);
INSERT INTO `tb_user` VALUES ('llowid_c242629e', 'user_696f403f', 'E6BFA94DF5A3D0E7F58B5EE4ABCBEB16', '1565596620459@qq.com', NULL, NULL, '女', NULL, '海南', NULL, '2019-08-12 15:57:00', 1);
INSERT INTO `tb_user` VALUES ('llowid_c2aded43', 'user_aaa4438e', '253AC1C328F9D9A616CBD936646E58DD', '1739434143@qq.com', '15343057723', 'http://image.stodger.club/images/dfcfdcfc208047548d3346c8ad4a79f5.png', '男', NULL, '浙江', '1995-08-17', '2019-08-15 21:09:26', 1);
INSERT INTO `tb_user` VALUES ('llowid_c2aeb64a', 'user_3b0d3414', 'CDA6D47F5F0FACCABD6A4F6AC4D25D7C', '1565596605284@qq.com', NULL, NULL, '女', NULL, '山东', NULL, '2019-08-12 15:56:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_c31cbf65', 'user_5d04458a', '750AB282AA7CDAB47E1838378E344E52', '1565594930352@qq.com', NULL, NULL, '女', NULL, '山东', NULL, '2019-08-12 15:28:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_c33fcbb9', 'user_b9e7fc75', '293EE0ECB174071D8E462AD53301750D', '1565595371186@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:36:11', 1);
INSERT INTO `tb_user` VALUES ('llowid_c35d0919', 'user_62716f44', '6FD08569EBD0ABC8378B683643E354A3', '1565594633050@qq.com', NULL, NULL, '男', NULL, '重庆', NULL, '2019-08-12 15:23:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_c37a496a', 'user_74687ac1', '071150B9C72431569FB08F5BAC472D4B', '1565595377861@qq.com', NULL, NULL, '女', NULL, '广东', NULL, '2019-08-12 15:36:17', 1);
INSERT INTO `tb_user` VALUES ('llowid_c38ba4a4', 'user_b9d85e76', '44AD5D0DFFD9794A4A8717C169C363CB', '1565595366500@qq.com', NULL, NULL, '男', NULL, '湖南', NULL, '2019-08-12 15:36:06', 1);
INSERT INTO `tb_user` VALUES ('llowid_c3adae7c', 'user_04a73993', '23D9FD210AFAFA762377D3D971F6B65A', '1565595362683@qq.com', NULL, NULL, '男', NULL, '云南', NULL, '2019-08-12 15:36:02', 1);
INSERT INTO `tb_user` VALUES ('llowid_c4076b25', 'user_423d7ed0', 'E8333FE873D41E9BF567295143F79B9D', '1565595382895@qq.com', NULL, NULL, '男', NULL, '四川', NULL, '2019-08-12 15:36:22', 1);
INSERT INTO `tb_user` VALUES ('llowid_c409daa1', 'user_74781994', '7492CFC9A678A5F3CABA7FAE99F9151B', '1565595371359@qq.com', NULL, NULL, '男', NULL, '江苏', NULL, '2019-08-12 15:36:11', 1);
INSERT INTO `tb_user` VALUES ('llowid_c412f45d', 'user_c99340a7', '9EB85EC4CF5BBCDBA0CF3B3B6625B951', '1565596606907@qq.com', NULL, NULL, '女', NULL, '湖北', NULL, '2019-08-12 15:56:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_c43cf955', 'user_51e88aad', '95A71D578171E55AB86336F40C4BBA6F', '1565594865698@qq.com', NULL, NULL, '女', NULL, '宁夏', NULL, '2019-08-12 15:27:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_c4545937', 'user_b1028049', '0823783CF84E6A613F0F6F40140941EA', '1565595373116@qq.com', NULL, NULL, '男', NULL, '四川', NULL, '2019-08-12 15:36:13', 1);
INSERT INTO `tb_user` VALUES ('llowid_c462d910', 'user_1a51658d', '5E4D95E9AF6FE14A5F58BD177CC9A1FC', '1565595385227@qq.com', NULL, NULL, '女', NULL, '湖北', NULL, '2019-08-12 15:36:25', 1);
INSERT INTO `tb_user` VALUES ('llowid_c4c11999', 'user_aa084482', '67F12CE8B3AA218CA5CEA297AE2F33F8', '1565596612466@qq.com', NULL, NULL, '女', NULL, '广西', NULL, '2019-08-12 15:56:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_c4d46944', 'user_947bad43', '04F051F247501546CE5AA6F6259E3D04', '1565596614777@qq.com', NULL, NULL, '女', NULL, '内蒙古', NULL, '2019-08-12 15:56:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_c4fb898d', 'user_98ea90fa', '9E586984EC28A3DE7C25C6C5D478979C', '1565595373816@qq.com', NULL, NULL, '男', NULL, '海南', NULL, '2019-08-12 15:36:13', 1);
INSERT INTO `tb_user` VALUES ('llowid_c55b7f46', 'user_17437db1', 'D6D2696C0E65D42252BDE95C84E796B6', '1565595392884@qq.com', NULL, NULL, '男', NULL, '台湾', NULL, '2019-08-12 15:36:32', 1);
INSERT INTO `tb_user` VALUES ('llowid_d849d29f', 'user_45d26d86', '74FF1599DBB07FCC466A5E4C3D941377', '1565595392691@qq.com', NULL, NULL, '男', NULL, '重庆', NULL, '2019-08-12 15:36:32', 1);
INSERT INTO `tb_user` VALUES ('llowid_d84dacae', 'user_09837a5f', '33C1FF2F4362B6651B0FD4164B4024CE', '1565595373310@qq.com', NULL, NULL, '男', NULL, '江西', NULL, '2019-08-12 15:36:13', 1);
INSERT INTO `tb_user` VALUES ('llowid_dac0048f', 'user_c8de9ab7', '5634B31543ABE466F59F5786D4EC350D', '992279356@qq.com', NULL, NULL, '保密', NULL, '山西', '2019-09-20', '2019-08-14 10:05:36', 1);
INSERT INTO `tb_user` VALUES ('llowid_e15dafe6', 'jsu1235', '253AC1C328F9D9A616CBD936646E58DD', NULL, '15627561711', NULL, '女', NULL, '广东', NULL, '2019-08-07 10:52:16', 1);
INSERT INTO `tb_user` VALUES ('llowid_e19ca47a', 'user_9f2443fa', 'EBEAFF13306C80D1BEA6EC2C55E5752A', '1565595361987@qq.com', NULL, NULL, '男', NULL, '宁夏', NULL, '2019-08-12 15:36:01', 1);
INSERT INTO `tb_user` VALUES ('llowid_e1b4f629', 'user_34ae8285', '311F08FD4AA76868875311E8C2FB0ED9', '1565595382447@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:36:22', 1);
INSERT INTO `tb_user` VALUES ('llowid_e1d98847', 'user_a04aabbf', '5634B31543ABE466F59F5786D4EC350D', '1739434143@qq.com', '15343057728', 'http://image.stodger.club/images/276e996bf79d42c6858106c4242073ec.png', '男', NULL, '江苏', '2019-08-07', '2019-08-16 14:42:27', 1);
INSERT INTO `tb_user` VALUES ('llowid_e25bd253', 'user_050ffa9a', 'CB9B067F9650537D879D9DE19529EBD9', '1565595370326@qq.com', NULL, NULL, '男', NULL, '新疆', NULL, '2019-08-12 15:36:10', 1);
INSERT INTO `tb_user` VALUES ('llowid_e2855ad4', 'user_974066a7', '452CD909208A6E143DB527EAD310B173', '1565594930136@qq.com', NULL, NULL, '男', NULL, '吉林', NULL, '2019-08-12 15:28:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_e2a413ab', 'user_58d42d1a', 'B8A8F8066BD7356965EBD336E1590D63', '1565595387866@qq.com', NULL, NULL, '男', NULL, '青海', NULL, '2019-08-12 15:36:27', 1);
INSERT INTO `tb_user` VALUES ('llowid_e2cb6f49', 'user_c4b1b0c2', 'A8DF4BDD92E8C6F27A4322D978A8E095', '1565595384184@qq.com', NULL, NULL, '女', NULL, '台湾', NULL, '2019-08-12 15:36:24', 1);
INSERT INTO `tb_user` VALUES ('llowid_e300c47e', 'user_71f88e7b', 'F46D4C095C022679DF8EDFDF5DD07DE1', '1565595382570@qq.com', NULL, NULL, '女', NULL, '吉林', NULL, '2019-08-12 15:36:22', 1);
INSERT INTO `tb_user` VALUES ('llowid_e306d022', 'user_4887ad62', 'F4C51F555C48B73D0C59A717293577C7', '1565594865979@qq.com', NULL, NULL, '女', NULL, '云南', NULL, '2019-08-12 15:27:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_e32b35ec', 'user_9db97f90', '002C5A9A83584F8C71F83A16491A83F6', '1565595374585@qq.com', NULL, NULL, '男', NULL, '西藏', NULL, '2019-08-12 15:36:14', 1);
INSERT INTO `tb_user` VALUES ('llowid_e36a9294', 'user_e25a3745', '16C9E48022C7A53A550191839AB3517A', '1565594864991@qq.com', NULL, NULL, '女', NULL, '河南', NULL, '2019-08-12 15:27:44', 1);
INSERT INTO `tb_user` VALUES ('llowid_e3f02f68', 'user_354cbe47', '69C2ABE35456CAE45086959FE208CC2E', '1565594929456@qq.com', NULL, NULL, '女', NULL, '台湾', NULL, '2019-08-12 15:28:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_e3f9a474', 'user_e74ad34a', '289EB6187F5FA84B05025F660B311AA0', '1565595391613@qq.com', NULL, NULL, '女', NULL, '江苏', NULL, '2019-08-12 15:36:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_e406443d', 'user_c865a9a0', 'E7F6A0117FFC3F96AAFB5814B424E4C7', '1565596618470@qq.com', NULL, NULL, '女', NULL, '西藏', NULL, '2019-08-12 15:56:58', 1);
INSERT INTO `tb_user` VALUES ('llowid_e41e1642', 'user_4b0b8ad8', 'C9A650DE7D7BDFDB59CA6D1BB78E6C95', '1565594866016@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:27:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_e426e761', 'user_42b9a3f7', '51221CD7B20EDD96C6C6C88AC15EF31E', '1565595384031@qq.com', NULL, NULL, '男', NULL, '台湾', NULL, '2019-08-12 15:36:24', 1);
INSERT INTO `tb_user` VALUES ('llowid_e42c0898', 'user_b16a4dda', 'C9F3C037EC0AA6D3A51631E94BCB8199', '1565596608477@qq.com', NULL, NULL, '女', NULL, '澳门', NULL, '2019-08-12 15:56:48', 1);
INSERT INTO `tb_user` VALUES ('llowid_e440fe97', 'user_0164e3db', '4B08DA7825B526856852EACDC7B7F472', '1565596612994@qq.com', NULL, NULL, '女', NULL, '湖北', NULL, '2019-08-12 15:56:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_e4419b1b', 'user_a29cc926', '9C5FC3AA06B852D765E0586DB9EF49FC', '1565595376307@qq.com', NULL, NULL, '男', NULL, '辽宁', NULL, '2019-08-12 15:36:16', 1);
INSERT INTO `tb_user` VALUES ('llowid_e44bcd8b', 'user_1098e251', '265ED3683F9E1F1D6E7095D0516A9FA4', '1565596613303@qq.com', NULL, NULL, '女', NULL, '山东', NULL, '2019-08-12 15:56:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_e44cc465', 'user_ea463cbe', '0349618AE87AE75691A7E5F2FE21D956', '1565595363611@qq.com', NULL, NULL, '女', NULL, '广西', NULL, '2019-08-12 15:36:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_e467ce44', 'user_9a227741', 'C04DBE22F74175745F6740820DDAB509', '1565594930975@qq.com', NULL, NULL, '男', NULL, '甘肃', NULL, '2019-08-12 15:28:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_e46a2581', 'user_91e9e85b', '9472501FDAC200EDA086C2E01E21B27B', '1565594671189@qq.com', NULL, NULL, '男', NULL, '西藏', NULL, '2019-08-12 15:24:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_e4a3c0f0', 'user_d42292b7', '5C65AC5577BDD9AAE9F2AE6BB04E7FAB', '1565596610207@qq.com', NULL, NULL, '女', NULL, '安徽', NULL, '2019-08-12 15:56:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_e4a86a35', 'user_7eee2644', '20B1853B29872AA0E4503B285DEF6E81', '1565596625128@qq.com', NULL, NULL, '女', NULL, '重庆', NULL, '2019-08-12 15:57:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_e4beaabf', 'user_5efcd473', 'C5C74AA9A38A8EA9B511888470E085D5', '1565595370914@qq.com', NULL, NULL, '女', NULL, '澳门', NULL, '2019-08-12 15:36:10', 1);
INSERT INTO `tb_user` VALUES ('llowid_e4c2eb82', 'user_c0847cb5', '5634B31543ABE466F59F5786D4EC350D', '123456741@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-15 10:56:00', 1);
INSERT INTO `tb_user` VALUES ('llowid_e4c70bdf', 'user_9278f406', '8CD9495618DA31E572BE8C4F76654381', '1565596609869@qq.com', NULL, NULL, '女', NULL, '安徽', NULL, '2019-08-12 15:56:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_e4d07d4a', 'user_4f899982', '713F90B5E288410CD185284F72D9B67E', '1565596616674@qq.com', NULL, NULL, '女', NULL, '湖南', NULL, '2019-08-12 15:56:56', 1);
INSERT INTO `tb_user` VALUES ('llowid_e4da691f', 'user_c3004727', '6FE734EFDB01CD9D287BBFDA1EFE5F2B', '1565595386298@qq.com', NULL, NULL, '男', NULL, '山东', NULL, '2019-08-12 15:36:26', 1);
INSERT INTO `tb_user` VALUES ('llowid_e4dd1a72', 'user_4fcca0ec', '65EBB4A7B6106C85735DC043F2FDC7E1', '1565594633010@qq.com', NULL, NULL, '男', NULL, '新疆', NULL, '2019-08-12 15:23:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_e4e8259c', 'user_4a5af986', 'F946BD9C783C6F16D45F91A25D921790', '1565595376609@qq.com', NULL, NULL, '男', NULL, '青海', NULL, '2019-08-12 15:36:16', 1);
INSERT INTO `tb_user` VALUES ('llowid_e5399bcb', 'user_feb03fa1', 'E0981BCAFD2A73BF23748F18491834A6', '1565595376830@qq.com', NULL, NULL, '女', NULL, '宁夏', NULL, '2019-08-12 15:36:16', 1);
INSERT INTO `tb_user` VALUES ('llowid_e549b99e', 'user_8eb57684', '49AACBCC1114F103642488E1948B60FE', '1565595383585@qq.com', NULL, NULL, '女', NULL, '广东', NULL, '2019-08-12 15:36:23', 1);
INSERT INTO `tb_user` VALUES ('llowid_e56d7260', 'user_5ab1781f', '4461C90971C3417AEB5C89AC2C879A05', '1565596617049@qq.com', NULL, NULL, '女', NULL, '贵州', NULL, '2019-08-12 15:56:57', 1);
INSERT INTO `tb_user` VALUES ('llowid_e56f928f', 'user_67bf0b3b', 'CD752DD2BA93E86E64E5FD8319B57EB7', '1565594864788@qq.com', NULL, NULL, '男', NULL, '江苏', NULL, '2019-08-12 15:27:44', 1);
INSERT INTO `tb_user` VALUES ('llowid_e574c744', 'user_19a0ce32', '0010E59DB02F17351D31AB746EA9BC1B', '1565596620072@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:57:00', 1);
INSERT INTO `tb_user` VALUES ('llowid_e579d4e4', 'user_4904ae8b', 'E3F273C09FB524CA3CE54733635CE4BC', '1565596609687@qq.com', NULL, NULL, '女', NULL, '湖南', NULL, '2019-08-12 15:56:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_e58cf8a7', 'jsu123123', '253AC1C328F9D9A616CBD936646E58DD', NULL, NULL, NULL, '女', NULL, '浙江', NULL, '2019-08-07 21:05:06', 1);
INSERT INTO `tb_user` VALUES ('llowid_e599f739', 'user_9841d65d', 'E3F74B08304B112D5A743C6E529024F4', '1565595378309@qq.com', NULL, NULL, '女', NULL, '河北', NULL, '2019-08-12 15:36:18', 1);
INSERT INTO `tb_user` VALUES ('llowid_e5f79464', 'user_fa49d084', '9FB5512968729BF45D14A1AADAAF09A5', '1565594863884@qq.com', NULL, NULL, '男', NULL, '河北', NULL, '2019-08-12 15:27:43', 1);
INSERT INTO `tb_user` VALUES ('llowid_e60046d2', 'user_e9930fc0', 'EC9A265F7198CBEC2B086A75FE49485D', '1565596616442@qq.com', NULL, NULL, '女', NULL, '甘肃', NULL, '2019-08-12 15:56:56', 1);
INSERT INTO `tb_user` VALUES ('llowid_e64844a3', 'user_a6179a49', 'E7A9F84E1BFAE028F2B7903FCB349ECA', '1565595365592@qq.com', NULL, NULL, '男', NULL, '广东', NULL, '2019-08-12 15:36:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_e669814a', 'user_736e8849', '278C089CFD4ABE51872814A93673177C', '1565594671653@qq.com', NULL, NULL, '男', NULL, '江苏', NULL, '2019-08-12 15:24:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_e67c95c8', 'user_e61dace4', 'AD3E128C5E41EDCA284D7BB177EC9BF3', '1565596610561@qq.com', NULL, NULL, '女', NULL, '浙江', NULL, '2019-08-12 15:56:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_e682186f', 'user_180c4442', 'D4F60B3ADB8C764CD7061FBAFDE08840', '1565595363836@qq.com', NULL, NULL, '女', NULL, '澳门', NULL, '2019-08-12 15:36:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_e683a563', 'user_10c0c696', '9B32ECE2144D1ADF4A38BD5BC66A8196', '1565595174324@qq.com', NULL, NULL, '女', NULL, '澳门', NULL, '2019-08-12 15:32:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_e6a08cf4', 'user_de713dce', '4AAAE5A5CF6B6900377E4FE5CF0C6A17', '1565594866218@qq.com', NULL, NULL, '男', NULL, '山西', NULL, '2019-08-12 15:27:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_e6a48cd7', 'user_2db2d98c', 'B9F3E274B6CE850D6345225DE31F832B', '1565595371540@qq.com', NULL, NULL, '男', NULL, '湖南', NULL, '2019-08-12 15:36:11', 1);
INSERT INTO `tb_user` VALUES ('llowid_e6bc1784', 'user_fd4f9993', '34A0B9DBA4F1F7BAFC4F0030EC7810B5', '1565594866150@qq.com', NULL, NULL, '男', NULL, '江苏', NULL, '2019-08-12 15:27:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_e6df5e47', 'user_df869b46', '82585CAC763B897DDCB2DA89782C17CE', '1565594632779@qq.com', NULL, NULL, '男', NULL, '吉林', NULL, '2019-08-12 15:23:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_e72647b7', 'user_4576b3f2', 'D30AAB5499C3ECE0D3DFB86126AA8455', '1565595365944@qq.com', NULL, NULL, '男', NULL, '河南', NULL, '2019-08-12 15:36:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_e73bb9ec', 'user_6b97c166', '418AA00ECA70C01C89B23460E8A8C652', '1565594865935@qq.com', NULL, NULL, '女', NULL, '陕西', NULL, '2019-08-12 15:27:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_e7401da4', 'user_cecad174', '8D5B62C6FCF2D6652485D35A7A1B93B6', '1565595388337@qq.com', NULL, NULL, '男', NULL, '香港', NULL, '2019-08-12 15:36:28', 1);
INSERT INTO `tb_user` VALUES ('llowid_e75503fd', 'user_7d8bb676', '395F4230AA2FA6087181C150E68CA361', '1565596606590@qq.com', NULL, NULL, '女', NULL, '澳门', NULL, '2019-08-12 15:56:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_e79b953d', 'user_23d5a184', 'B6DB6B8A44C28A4A4DCCF85D01A3EDE3', '1565596609006@qq.com', NULL, NULL, '女', NULL, '重庆', NULL, '2019-08-12 15:56:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_e7b1bd2a', 'user_84f28966', '5416B7F645036ACBEB3B6033F4DF0FC4', '1565595171953@qq.com', NULL, NULL, '男', NULL, '陕西', NULL, '2019-08-12 15:32:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_e7c15040', 'user_4b9b2154', '575BF2DCCE0ADE7ACAE12000910F7B3F', '1565595385861@qq.com', NULL, NULL, '男', NULL, '海南', NULL, '2019-08-12 15:36:25', 1);
INSERT INTO `tb_user` VALUES ('llowid_e7f96532', 'user_71458d83', 'C932D578C96EF227AEF98588A59A4D8F', '1565595382789@qq.com', NULL, NULL, '男', NULL, '广东', NULL, '2019-08-12 15:36:22', 1);
INSERT INTO `tb_user` VALUES ('llowid_e81d522d', 'user_47f88771', '1B97B240D5CBDACC54FFCD35F410AB2F', '1565596622861@qq.com', NULL, NULL, '女', NULL, '山西', NULL, '2019-08-12 15:57:02', 1);
INSERT INTO `tb_user` VALUES ('llowid_e8341c88', 'user_69d14f48', '4FD1441F308AD4FBE6196BBBE5EBA9CC', '1565595115687@qq.com', NULL, NULL, '女', NULL, '河北', NULL, '2019-08-12 15:31:55', 1);
INSERT INTO `tb_user` VALUES ('llowid_e8870ace', 'user_2cb44f47', '3813B00A9D0BF81C485E918B822AD973', '1565596624020@qq.com', NULL, NULL, '女', NULL, '浙江', NULL, '2019-08-12 15:57:04', 1);
INSERT INTO `tb_user` VALUES ('llowid_e88846b3', 'user_be278874', '0A2F780DF1CE8CEB4FA8E095EDF63AE0', '1565596622827@qq.com', NULL, NULL, '女', NULL, '宁夏', NULL, '2019-08-12 15:57:02', 1);
INSERT INTO `tb_user` VALUES ('llowid_e8bdcb18', 'user_60b9a307', 'E950B07140BAAF36D91C188391D8BD79', '1565595390180@qq.com', NULL, NULL, '女', NULL, '山东', NULL, '2019-08-12 15:36:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_e8dbdf44', 'user_1b4a1b83', '6AFDA7142BE8A59FD51A17B025A52507', '1565595393065@qq.com', NULL, NULL, '女', NULL, '海南', NULL, '2019-08-12 15:36:33', 1);
INSERT INTO `tb_user` VALUES ('llowid_e95015fa', 'user_9890b498', 'F42B5AE71CB26515986EBBD9E192E538', '1565595383993@qq.com', NULL, NULL, '男', NULL, '内蒙古', NULL, '2019-08-12 15:36:24', 1);
INSERT INTO `tb_user` VALUES ('llowid_e979d363', 'user_1e89fad4', '6849E6D004DFD0DEF39CA6586AA47DF6', '1565594929774@qq.com', NULL, NULL, '男', NULL, '云南', NULL, '2019-08-12 15:28:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_e9bd4cfe', 'user_6af264aa', 'C8068B570C6129982588A983134CC1A0', '1565595111106@qq.com', NULL, NULL, '男', NULL, '北京', NULL, '2019-08-12 15:31:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_e9c479c6', 'user_cc9a8328', 'E7304B4BFC4899143747B55C49643365', '1565595366268@qq.com', NULL, NULL, '男', NULL, '内蒙古', NULL, '2019-08-12 15:36:06', 1);
INSERT INTO `tb_user` VALUES ('llowid_e9faa747', 'user_3398c302', 'B282752C2EF511F4D9FDEA8D9A4AD141', '1565596612716@qq.com', NULL, NULL, '女', NULL, '宁夏', NULL, '2019-08-12 15:56:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_ea4082a3', 'user_cc5a32c7', '6726C820E56C534AAC5781CB2478206F', '1565594930208@qq.com', NULL, NULL, '男', NULL, '浙江', NULL, '2019-08-12 15:28:50', 1);
INSERT INTO `tb_user` VALUES ('llowid_ea4c7474', 'user_41837f84', 'A75C5E94C063BE32A4A505A1877E555D', '1565595373390@qq.com', NULL, NULL, '女', NULL, '湖北', NULL, '2019-08-12 15:36:13', 1);
INSERT INTO `tb_user` VALUES ('llowid_ea5c1448', 'user_7914a9d8', '8B8E1E8182D37711B121060E37DC3BA1', '1565595173948@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:32:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_ea69fd15', 'user_1e84ca36', 'FAF547373498C83355D5EB01DE7CDF8E', '1565595367219@qq.com', NULL, NULL, '女', NULL, '广东', NULL, '2019-08-12 15:36:07', 1);
INSERT INTO `tb_user` VALUES ('llowid_ea6fdf4b', 'user_672e3e93', '2CCE05638188C36927FB5858A8645E6A', '1565595383963@qq.com', NULL, NULL, '女', NULL, '广西', NULL, '2019-08-12 15:36:23', 1);
INSERT INTO `tb_user` VALUES ('llowid_ea7279eb', 'user_4da3ab14', 'D7E23452B7D2B8256AC05CBADC746105', '1565594864444@qq.com', NULL, NULL, '男', NULL, '甘肃', NULL, '2019-08-12 15:27:44', 1);
INSERT INTO `tb_user` VALUES ('llowid_ea79e475', 'user_128b0788', 'E3880B16F2B8CB611DFC3873A27335D8', '1565595393889@qq.com', NULL, NULL, '女', NULL, '新疆', NULL, '2019-08-12 15:36:33', 1);
INSERT INTO `tb_user` VALUES ('llowid_ea810488', 'user_79463d98', '877586078F4C0D9E1B7CA475603E15AF', '1565594866511@qq.com', NULL, NULL, '女', NULL, '重庆', NULL, '2019-08-12 15:27:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_eab84bac', 'user_fb9cc4c0', '3CFE58C18AAA1FE5833DAE3413EA2F9A', '1565596622016@qq.com', NULL, NULL, '女', NULL, '辽宁', NULL, '2019-08-12 15:57:02', 1);
INSERT INTO `tb_user` VALUES ('llowid_eabfd549', 'user_18ab4ad0', '4B9BB28C789CC2DF2183E630303381F4', '1565595375672@qq.com', NULL, NULL, '男', NULL, '浙江', NULL, '2019-08-12 15:36:15', 1);
INSERT INTO `tb_user` VALUES ('llowid_eac24164', 'user_e39645b6', '6D16F54854D7D23AE12845CAB68C4A28', '1565594863707@qq.com', NULL, NULL, '女', NULL, '吉林', NULL, '2019-08-12 15:27:43', 1);
INSERT INTO `tb_user` VALUES ('llowid_eaccfbfb', 'user_4d639bfa', 'F193CE0EF4766954A8AF0B2BF39B56CE', '1565594670954@qq.com', NULL, NULL, '男', NULL, '河北', NULL, '2019-08-12 15:24:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_ead4dd4b', 'user_00634b90', 'CCF12C0DD72F7CFAE606165F0A1CF16D', '1565595384573@qq.com', NULL, NULL, '女', NULL, '安徽', NULL, '2019-08-12 15:36:24', 1);
INSERT INTO `tb_user` VALUES ('llowid_eb08fec9', 'user_f6b13f9d', 'ADD1B41289B7ED5C1598414D0E1B93EC', '1565595362929@qq.com', NULL, NULL, '男', NULL, '贵州', NULL, '2019-08-12 15:36:02', 1);
INSERT INTO `tb_user` VALUES ('llowid_eb40f34b', 'user_ea45379f', '885558211792B66D23AEA7B848EBF767', '1565595111201@qq.com', NULL, NULL, '男', NULL, '云南', NULL, '2019-08-12 15:31:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_eb7a89ac', 'user_82e0ba68', 'AA237D7D5C2CB49DF93E9651CEEE2639', '1565596619908@qq.com', NULL, NULL, '女', NULL, '山西', NULL, '2019-08-12 15:56:59', 1);
INSERT INTO `tb_user` VALUES ('llowid_ebe4a9c8', 'user_0d194470', '5795ACE55450E01EE4DE5E9F77EB3AF1', '1565595367124@qq.com', NULL, NULL, '男', NULL, '台湾', NULL, '2019-08-12 15:36:07', 1);
INSERT INTO `tb_user` VALUES ('llowid_ec0a4e41', 'user_a9645e68', '7613FE9E3B38DA0F53A9A3C2F8AE3F6B', '1565594931291@qq.com', NULL, NULL, '女', NULL, '澳门', NULL, '2019-08-12 15:28:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_ec0de201', 'user_a3d91f43', 'FE6B922E49D11C9A60B4D08E63C51C4F', '1565594670530@qq.com', NULL, NULL, '男', NULL, '澳门', NULL, '2019-08-12 15:24:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_ec1505f4', 'user_d8ab9d97', '2CBAAB82D9D4DCF502C52F2B0A5A915C', '1565595393705@qq.com', NULL, NULL, '男', NULL, '安徽', NULL, '2019-08-12 15:36:33', 1);
INSERT INTO `tb_user` VALUES ('llowid_ec746759', 'user_b5077384', 'D5EFF14E616E47701D0D3B5D7EB18C33', '1565595173344@qq.com', NULL, NULL, '男', NULL, '辽宁', NULL, '2019-08-12 15:32:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_ec84a8fb', 'user_d601acb2', '08C9D7F58CF509B53536DBF3497E8D47', '1565596611086@qq.com', NULL, NULL, '女', NULL, '台湾', NULL, '2019-08-12 15:56:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_ec90eacf', 'user_e06cd4cc', '269E9AA0D95490CD19CA6F71D7370B7B', '1565594867106@qq.com', NULL, NULL, '男', NULL, '吉林', NULL, '2019-08-12 15:27:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_ed00240f', 'user_3348e181', 'DCA4CE4FEBED67DDE1019F3A40CD2513', '1565596618089@qq.com', NULL, NULL, '女', NULL, '河北', NULL, '2019-08-12 15:56:58', 1);
INSERT INTO `tb_user` VALUES ('llowid_ed1c8942', 'user_9c931dfb', '3B1BBFA47B8D45D3533CE9499659CF49', '1565595366043@qq.com', NULL, NULL, '男', NULL, '山西', NULL, '2019-08-12 15:36:06', 1);
INSERT INTO `tb_user` VALUES ('llowid_ed2061c5', 'user_31031d29', '2F68E5EF34145B6219EEB9473EEF2EB1', '1565595362963@qq.com', NULL, NULL, '女', NULL, '西藏', NULL, '2019-08-12 15:36:02', 1);
INSERT INTO `tb_user` VALUES ('llowid_ed9d6e7e', 'user_afc7a452', 'D8AE263E6BC0D84894C08F12FAF17CD3', '1565595377349@qq.com', NULL, NULL, '男', NULL, '内蒙古', NULL, '2019-08-12 15:36:17', 1);
INSERT INTO `tb_user` VALUES ('llowid_eded8bcd', 'user_8f924b03', 'FAE551B56DC826C5EF110ECFCAB4FC5D', '1565594633090@qq.com', NULL, NULL, '男', NULL, '湖南', NULL, '2019-08-12 15:23:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_ee18cab9', 'user_8d4c2093', '2DF8A7814385829FC65577EA1EA118C1', '1565595375420@qq.com', NULL, NULL, '女', NULL, '湖北', NULL, '2019-08-12 15:36:15', 1);
INSERT INTO `tb_user` VALUES ('llowid_ee45e5bf', 'user_d4decb37', '94EDA3FBE45F82230021AA4E69F4A241', '1565595113259@qq.com', NULL, NULL, '男', NULL, '海南', NULL, '2019-08-12 15:31:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_ee492191', 'user_648e6ae8', 'F7BC13BD302398A6D2DF32335772C7D7', '1565596613337@qq.com', NULL, NULL, '女', NULL, '宁夏', NULL, '2019-08-12 15:56:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_ee54c80b', 'user_230a4369', 'B2FE315404C8AEC4E3B2B05254F9CFE4', '1565595384513@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:36:24', 1);
INSERT INTO `tb_user` VALUES ('llowid_ee5a4ca1', 'user_52c43033', 'CCE4C0593890A3311426B6FACD490934', '1565595385713@qq.com', NULL, NULL, '男', NULL, '西藏', NULL, '2019-08-12 15:36:25', 1);
INSERT INTO `tb_user` VALUES ('llowid_ee83a671', 'user_b96f25b8', '0B62EAF7F0ADC47477EF6BF82A4ED2CE', '1565595113397@qq.com', NULL, NULL, '女', NULL, '重庆', NULL, '2019-08-12 15:31:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_ee874abb', 'user_6cb4425a', '6D5809988AC7696164FBA4E102551BF7', '1565595391399@qq.com', NULL, NULL, '女', NULL, '台湾', NULL, '2019-08-12 15:36:31', 1);
INSERT INTO `tb_user` VALUES ('llowid_ee91a646', 'user_1cea24dd', '6E571E8407953A11D12BC2BE2C0F9252', '1565595379650@qq.com', NULL, NULL, '男', NULL, '重庆', NULL, '2019-08-12 15:36:19', 1);
INSERT INTO `tb_user` VALUES ('llowid_ef233fef', 'user_c4ef9c0f', '9BB52350D8F5845174001118DBD7B695', '1565595365653@qq.com', NULL, NULL, '男', NULL, '青海', NULL, '2019-08-12 15:36:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_ef4e1681', 'user_46c68951', '5DED2A2F2BEAC3A8A7419FBE8D152579', '1565595375232@qq.com', NULL, NULL, '男', NULL, '广西', NULL, '2019-08-12 15:36:15', 1);
INSERT INTO `tb_user` VALUES ('llowid_ef923471', 'user_bdbe4f16', 'AA9EE069612FDBFAFB95193EBBCB20C9', '1565595371124@qq.com', NULL, NULL, '男', NULL, '吉林', NULL, '2019-08-12 15:36:11', 1);
INSERT INTO `tb_user` VALUES ('llowid_efd04eed', 'user_3dcae16d', '1985D25DFF5197084D89E5B6CF31CE14', '1565596615369@qq.com', NULL, NULL, '女', NULL, '浙江', NULL, '2019-08-12 15:56:55', 1);
INSERT INTO `tb_user` VALUES ('llowid_f00f134a', 'user_ce34afc6', 'DB543F294587AEA152E15AE2660EF1E1', '1565595172716@qq.com', NULL, NULL, '男', NULL, '山东', NULL, '2019-08-12 15:32:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_f043f0a2', 'user_43cab38d', 'EEDA6071E3762D69B37CB749539AA7A7', '1565596605319@qq.com', NULL, NULL, '女', NULL, '香港', NULL, '2019-08-12 15:56:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_f04faff9', 'user_205ee004', 'FE887D47E35BD506E82665ABB7BB0C32', '1565595384751@qq.com', NULL, NULL, '女', NULL, '香港', NULL, '2019-08-12 15:36:24', 1);
INSERT INTO `tb_user` VALUES ('llowid_f0f46422', 'user_b0532501', '498E2699D2473D009048676A2CBDCB5E', '1565595383179@qq.com', NULL, NULL, '女', NULL, '湖南', NULL, '2019-08-12 15:36:23', 1);
INSERT INTO `tb_user` VALUES ('llowid_f184f079', 'user_2dbc5488', '5809B64870662E94E1EEBF09D6C0CAB6', '1565595382220@qq.com', NULL, NULL, '女', NULL, '青海', NULL, '2019-08-12 15:36:22', 1);
INSERT INTO `tb_user` VALUES ('llowid_f1ad0ef8', 'user_83974648', '2D955E11B461AAC0D099FF271B2D8708', '1565595171760@qq.com', NULL, NULL, '男', NULL, '台湾', NULL, '2019-08-12 15:32:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_f1c8597e', 'user_293ca904', '8C31139DB2B5AD8C6E6F9D1F7D3477D9', '1565595171108@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:32:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_f1cc84cd', 'user_060da144', 'C304F3C3F6E0017C9634C565972D3F2E', '1565596615543@qq.com', NULL, NULL, '女', NULL, '海南', NULL, '2019-08-12 15:56:55', 1);
INSERT INTO `tb_user` VALUES ('llowid_f1f63946', 'user_058d9fbe', 'CB7E3A2CF80F040BA653490AFA68758C', '1565596621030@qq.com', NULL, NULL, '女', NULL, '山西', NULL, '2019-08-12 15:57:01', 1);
INSERT INTO `tb_user` VALUES ('llowid_f209c4c2', 'user_94b34643', '1A521AAB943FAD0DE379CF95BCF3CA99', '1565596615054@qq.com', NULL, NULL, '女', NULL, '陕西', NULL, '2019-08-12 15:56:55', 1);
INSERT INTO `tb_user` VALUES ('llowid_f21444db', 'user_9a1950cc', '8C41263726C12DDCEB3A5A609AA67AD4', '1565595368349@qq.com', NULL, NULL, '男', NULL, '湖南', NULL, '2019-08-12 15:36:08', 1);
INSERT INTO `tb_user` VALUES ('llowid_f21bd845', 'user_c96a4447', '90D134F256E6738E3DED2D55F12279AE', '1565595365976@qq.com', NULL, NULL, '女', NULL, '福建', NULL, '2019-08-12 15:36:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_f245febb', 'user_fc4f8eda', 'C8FE5A0525385423DA9941A70B287892', '1565595172257@qq.com', NULL, NULL, '女', NULL, '海南', NULL, '2019-08-12 15:32:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_f2bbe519', 'user_6d4119b2', '48865C0C59D8E1F16875A026A2D3EB31', '1565595380062@qq.com', NULL, NULL, '男', NULL, '北京', NULL, '2019-08-12 15:36:20', 1);
INSERT INTO `tb_user` VALUES ('llowid_f2e4e788', 'user_2aad5049', '5634B31543ABE466F59F5786D4EC350D', '2@qq.com', NULL, NULL, '保密', NULL, '黑龙江', '2019-08-08', '2019-08-14 15:37:00', 1);
INSERT INTO `tb_user` VALUES ('llowid_f340309c', 'user_b172f759', '55D6DD327A0247A82F30508993541976', '1565595373145@qq.com', NULL, NULL, '女', NULL, '陕西', NULL, '2019-08-12 15:36:13', 1);
INSERT INTO `tb_user` VALUES ('llowid_f36ae2b6', 'user_c9d4496b', 'DC4D9BE80948AF3F83AE632D87A95851', '1565595111385@qq.com', NULL, NULL, '女', NULL, '安徽', NULL, '2019-08-12 15:31:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_f3ad5adc', 'user_442a840c', '8DD3C1E413B61A660A62DFC25CF7C733', '1565594865565@qq.com', NULL, NULL, '男', NULL, '山西', NULL, '2019-08-12 15:27:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_f40a0832', 'user_6be34414', '3686624B59D752D97E68BF4197AA4D02', '1565595364912@qq.com', NULL, NULL, '男', NULL, '安徽', NULL, '2019-08-12 15:36:04', 1);
INSERT INTO `tb_user` VALUES ('llowid_f42d5996', 'user_5df3e44a', '57D98183A05CB8ECBF4D51F04E875DA4', '1565595386760@qq.com', NULL, NULL, '男', NULL, '湖南', NULL, '2019-08-12 15:36:26', 1);
INSERT INTO `tb_user` VALUES ('llowid_f445dcb0', 'user_ed69385c', 'AD295C46842062FC65CE5E8BE60033B0', '1565595382382@qq.com', NULL, NULL, '女', NULL, '贵州', NULL, '2019-08-12 15:36:22', 1);
INSERT INTO `tb_user` VALUES ('llowid_f446bb61', 'user_6a87f0aa', '6CA999F6E613F26D334A93AE6F468F0A', '1565595387741@qq.com', NULL, NULL, '女', NULL, '广西', NULL, '2019-08-12 15:36:27', 1);
INSERT INTO `tb_user` VALUES ('llowid_f44ac994', 'user_69204631', 'B109421DD61906CEC31A10E160674B15', '1565595373420@qq.com', NULL, NULL, '女', NULL, '上海', NULL, '2019-08-12 15:36:13', 1);
INSERT INTO `tb_user` VALUES ('llowid_f4753f39', 'user_a460e967', '02AACAD4EB8AF3002B5E3D8CBA87ECC1', '1565595389770@qq.com', NULL, NULL, '女', NULL, '新疆', NULL, '2019-08-12 15:36:29', 1);
INSERT INTO `tb_user` VALUES ('llowid_f47d0b05', 'user_d794d659', '853BF2775EA7F9D282004A0D45317F7F', '1565596613570@qq.com', NULL, NULL, '女', NULL, '内蒙古', NULL, '2019-08-12 15:56:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_f4911be1', 'user_7aab477e', 'C608051C6DA46B0B880A91A9F7E0B912', '1565596607324@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:56:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_f494dad9', 'user_8f8a4e46', '5F0A7B3419FD00BEBA574A1C5D619AF2', '1565595373691@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:36:13', 1);
INSERT INTO `tb_user` VALUES ('llowid_f498e90f', 'user_e5a81a34', 'A1AABBAB2620BD987051582F07054D9A', '1565594632017@qq.com', NULL, NULL, '男', NULL, '河南', NULL, '2019-08-12 15:23:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_f4a4c814', 'user_17f43d6b', 'C0AA7F6ED3A1BE195B95FB657914393A', '1565596619134@qq.com', NULL, NULL, '女', NULL, '山东', NULL, '2019-08-12 15:56:59', 1);
INSERT INTO `tb_user` VALUES ('llowid_f4af0889', 'user_54a48994', '26DB6711D38332122E2E960177A78F94', '1565594931616@qq.com', NULL, NULL, '男', NULL, '浙江', NULL, '2019-08-12 15:28:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_f4e8582a', 'user_81802aa8', '386E474558B03E8B978C627702AF1885', '1565595370633@qq.com', NULL, NULL, '女', NULL, '重庆', NULL, '2019-08-12 15:36:10', 1);
INSERT INTO `tb_user` VALUES ('llowid_f4fcda64', 'user_ba840c4f', 'ED52684978AF48F99C491DBC7B4AD80F', '1565596621470@qq.com', NULL, NULL, '女', NULL, '广东', NULL, '2019-08-12 15:57:01', 1);
INSERT INTO `tb_user` VALUES ('llowid_f514594b', 'user_a2d97040', 'B822A216FCE18154225AF4690DC9C8C3', '1565595373946@qq.com', NULL, NULL, '女', NULL, '河南', NULL, '2019-08-12 15:36:13', 1);
INSERT INTO `tb_user` VALUES ('llowid_f544423e', 'user_6a174c26', '9C66C7DD16E043C605A3B1794456952D', '1565596609833@qq.com', NULL, NULL, '女', NULL, '四川', NULL, '2019-08-12 15:56:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_f5577ed4', 'user_d2ddf944', 'E4D0BEAABF03CF31CC970FB50789C5E7', '1565595386539@qq.com', NULL, NULL, '女', NULL, '陕西', NULL, '2019-08-12 15:36:26', 1);
INSERT INTO `tb_user` VALUES ('llowid_f59cd7a9', 'user_a934706b', '8F2922CC6C5D98849225CCD5FCFA3288', '1565596609540@qq.com', NULL, NULL, '女', NULL, '青海', NULL, '2019-08-12 15:56:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_f6047c39', 'user_945c070c', '454A1A71FF9C42AB76B4473B52910695', '1565595393961@qq.com', NULL, NULL, '女', NULL, '青海', NULL, '2019-08-12 15:36:33', 1);
INSERT INTO `tb_user` VALUES ('llowid_f64aa456', 'user_204c4116', 'CEA68000AC99A835E38046D2FC1EEF86', '1565595379433@qq.com', NULL, NULL, '女', NULL, '重庆', NULL, '2019-08-12 15:36:19', 1);
INSERT INTO `tb_user` VALUES ('llowid_f6581423', 'user_708ed706', '3F035DCA3F102796E2915BA50EFB9880', '1565595381941@qq.com', NULL, NULL, '男', NULL, '宁夏', NULL, '2019-08-12 15:36:21', 1);
INSERT INTO `tb_user` VALUES ('llowid_f6585054', 'user_799cb996', '041B5A8306078C0F0A3243324D216E2B', '1565596622186@qq.com', NULL, NULL, '女', NULL, '湖南', NULL, '2019-08-12 15:57:02', 1);
INSERT INTO `tb_user` VALUES ('llowid_f665834b', 'user_f074b193', '7B621357B975633D48EC2E7A1174EE9E', '1565596623612@qq.com', NULL, NULL, '女', NULL, '山西', NULL, '2019-08-12 15:57:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_f69c274a', 'user_91d771a7', '9B8EA0AF3FAB6C7E8E4AED26B1065DB7', '1565596605392@qq.com', NULL, NULL, '女', NULL, '湖北', NULL, '2019-08-12 15:56:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_f69d683e', 'user_3b3a5841', '9C4F1841E9701ACC48D8EB8B2F4ED978', '1565596623781@qq.com', NULL, NULL, '女', NULL, '广西', NULL, '2019-08-12 15:57:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_f6a24d47', 'user_27ffd49c', 'D9AB28D8D334BA88621AFE554F97DE3F', '1565595380445@qq.com', NULL, NULL, '女', NULL, '广东', NULL, '2019-08-12 15:36:20', 1);
INSERT INTO `tb_user` VALUES ('llowid_f6c86767', 'user_e4dc39e8', '3A23C5A6383E5100068D4F4B39FE0C96', '1565595367029@qq.com', NULL, NULL, '女', NULL, '香港', NULL, '2019-08-12 15:36:07', 1);
INSERT INTO `tb_user` VALUES ('llowid_f6cf4c9a', 'user_f69f5be0', '8CFD44E29D8982DC6DDCF9FBDA17716F', '1565596619575@qq.com', NULL, NULL, '女', NULL, '云南', NULL, '2019-08-12 15:56:59', 1);
INSERT INTO `tb_user` VALUES ('llowid_f731c8bd', 'user_bfa646bc', 'BDAD65439663D5C52A05A7B427FD5C52', '1565596622659@qq.com', NULL, NULL, '女', NULL, '重庆', NULL, '2019-08-12 15:57:02', 1);
INSERT INTO `tb_user` VALUES ('llowid_f743c37f', 'user_b38bf215', '860EE642D29ED197B0789AF96E0F9138', '1565594932934@qq.com', NULL, NULL, '男', NULL, '香港', NULL, '2019-08-12 15:28:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_f74b13ae', 'user_e65e8af8', 'FE3B01F0A13EFEFA0626C50EE7D0833F', '1565594932753@qq.com', NULL, NULL, '男', NULL, '西藏', NULL, '2019-08-12 15:28:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_f76c3c71', 'user_115bcb4b', 'F8F72DCB8CA7A41984D447CA5BEA0181', '1565596620007@qq.com', NULL, NULL, '女', NULL, '台湾', NULL, '2019-08-12 15:57:00', 1);
INSERT INTO `tb_user` VALUES ('llowid_f782f114', 'user_958292dd', '3C63448F798A03498464B6FE9FB85E77', '1565595171299@qq.com', NULL, NULL, '男', NULL, '云南', NULL, '2019-08-12 15:32:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_f7892c92', 'user_f7924298', '89E3DFC414275723490D4D0401E244B5', '1565595385500@qq.com', NULL, NULL, '女', NULL, '云南', NULL, '2019-08-12 15:36:25', 1);
INSERT INTO `tb_user` VALUES ('llowid_f7ce47b6', 'user_bcc43dbb', 'B915D61F32AB24DA1C4E5D990AD8F873', '1565595392084@qq.com', NULL, NULL, '女', NULL, '贵州', NULL, '2019-08-12 15:36:32', 1);
INSERT INTO `tb_user` VALUES ('llowid_f83fb086', 'user_c7847b7e', '2E802D27FF05C876C1DE1FD1BE0576E5', '1565594670990@qq.com', NULL, NULL, '男', NULL, '安徽', NULL, '2019-08-12 15:24:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_f84541ae', 'user_34e3739c', '5634B31543ABE466F59F5786D4EC350D', '2534643753@qq.com', '15274439867', 'http://image.stodger.club/images/28a29bb45ef348c28a94ad15f67830fd.jpg', '保密', NULL, '湖南', '2019-07-23', '2019-08-08 11:59:41', 1);
INSERT INTO `tb_user` VALUES ('llowid_f8495488', 'user_be54b1c8', '8A622083261D5B7100B3608BFC544036', '1565595115218@qq.com', NULL, NULL, '女', NULL, '云南', NULL, '2019-08-12 15:31:55', 1);
INSERT INTO `tb_user` VALUES ('llowid_f8501f8d', 'user_66f47438', 'A04283363E471A74FD41E327C9B890CF', '1565596617557@qq.com', NULL, NULL, '女', NULL, '重庆', NULL, '2019-08-12 15:56:57', 1);
INSERT INTO `tb_user` VALUES ('llowid_f8565b64', 'user_0b3b4746', '9833B6424C166C69A9458324D8520E83', '1565596616179@qq.com', NULL, NULL, '女', NULL, '福建', NULL, '2019-08-12 15:56:56', 1);
INSERT INTO `tb_user` VALUES ('llowid_f8684491', 'user_e5cb540e', '9CB0B7C1141D453D9EFA4411BF221E63', '1565595377001@qq.com', NULL, NULL, '男', NULL, '北京', NULL, '2019-08-12 15:36:17', 1);
INSERT INTO `tb_user` VALUES ('llowid_f8aadc36', 'user_8c844268', 'FF725483E585108BF39CE10C9352DAD8', '1565596617985@qq.com', NULL, NULL, '女', NULL, '上海', NULL, '2019-08-12 15:56:57', 1);
INSERT INTO `tb_user` VALUES ('llowid_f8d129a2', 'user_701f7940', 'BF78C808A776CDB076AB8FA81287ABD3', '1565595387024@qq.com', NULL, NULL, '男', NULL, '上海', NULL, '2019-08-12 15:36:27', 1);
INSERT INTO `tb_user` VALUES ('llowid_f8f93c49', 'user_9ce4304a', 'DD15962249501DF4022A691765DA8D19', '1565596616574@qq.com', NULL, NULL, '女', NULL, '湖北', NULL, '2019-08-12 15:56:56', 1);
INSERT INTO `tb_user` VALUES ('llowid_f94b29d4', 'user_ae425f8f', '66B066A4FFCA748CD05F6121A4726CCE', '1565595270795@qq.com', NULL, NULL, '女', NULL, '北京', NULL, '2019-08-12 15:34:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_f9989b9a', 'user_ac14f9bb', 'F353E6A37BD44BACA1A075AF6D05B421', '1565595172178@qq.com', NULL, NULL, '女', NULL, '青海', NULL, '2019-08-12 15:32:52', 1);
INSERT INTO `tb_user` VALUES ('llowid_f99a76c4', 'user_c690ba2a', '179AADCDE2397D8F96C2ADA1A7572007', '1565595379137@qq.com', NULL, NULL, '女', NULL, '内蒙古', NULL, '2019-08-12 15:36:19', 1);
INSERT INTO `tb_user` VALUES ('llowid_f9b20463', 'user_b574f489', 'DFFBD9BA40A6B3AA234CAAD4DA711931', '1565595366237@qq.com', NULL, NULL, '男', NULL, '湖北', NULL, '2019-08-12 15:36:06', 1);
INSERT INTO `tb_user` VALUES ('llowid_f9c033bc', 'user_758b278e', '090907CFF81B78F33AC45C1C96A0F7E4', '1565596623848@qq.com', NULL, NULL, '女', NULL, '陕西', NULL, '2019-08-12 15:57:03', 1);
INSERT INTO `tb_user` VALUES ('llowid_f9c0d028', 'user_9bf81c7a', '60B96B33B3835EF1A490A3428A5B0667', '1565595115884@qq.com', NULL, NULL, '男', NULL, '福建', NULL, '2019-08-12 15:31:55', 1);
INSERT INTO `tb_user` VALUES ('llowid_fa3dc0d9', 'user_b009db20', 'DC49B96127EAACB48B0A7A6C35AA845B', '1565594863675@qq.com', NULL, NULL, '男', NULL, '贵州', NULL, '2019-08-12 15:27:43', 1);
INSERT INTO `tb_user` VALUES ('llowid_fa72ed5e', 'user_50a2fc7d', '7ECBFD00B2BDD6C1EB876B09FF80F93E', '1565595384604@qq.com', NULL, NULL, '男', NULL, '西藏', NULL, '2019-08-12 15:36:24', 1);
INSERT INTO `tb_user` VALUES ('llowid_fa84147a', 'user_af4a2689', 'FF3C3D2C7B863BB989D782EC3241174D', '1565595171836@qq.com', NULL, NULL, '女', NULL, '福建', NULL, '2019-08-12 15:32:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_fa8819f9', 'user_7a99b430', 'E4707709C1B1133858A06A6D3DE3AF92', '1565595379778@qq.com', NULL, NULL, '男', NULL, '河南', NULL, '2019-08-12 15:36:19', 1);
INSERT INTO `tb_user` VALUES ('llowid_fa9254df', 'user_60c50b94', '542062FAA63004F1DF640E75CB3CE1C1', '1565596619064@qq.com', NULL, NULL, '女', NULL, '浙江', NULL, '2019-08-12 15:56:59', 1);
INSERT INTO `tb_user` VALUES ('llowid_fac9be40', 'user_e5caef9c', '9B037041C89FA0E3087F52C79FF2FE31', '1565595382071@qq.com', NULL, NULL, '男', NULL, '江苏', NULL, '2019-08-12 15:36:22', 1);
INSERT INTO `tb_user` VALUES ('llowid_fad13909', 'user_9b369d41', 'F913755A7A4E4562E49A95A07612101F', '1565595372777@qq.com', NULL, NULL, '女', NULL, '广西', NULL, '2019-08-12 15:36:12', 1);
INSERT INTO `tb_user` VALUES ('llowid_faf09809', 'user_58b86860', 'A6717FC997E51E2BCA201352A1DB2A5F', '1565595376021@qq.com', NULL, NULL, '女', NULL, '吉林', NULL, '2019-08-12 15:36:16', 1);
INSERT INTO `tb_user` VALUES ('llowid_fb03b336', 'user_9d9d84b3', '0B340355E3F561DBAB009968D36ADFB4', '1565596620348@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:57:00', 1);
INSERT INTO `tb_user` VALUES ('llowid_fb3e0c43', 'user_54822e24', 'EA1B0841FB535694E440FA2B584E972C', '1565595384782@qq.com', NULL, NULL, '男', NULL, '吉林', NULL, '2019-08-12 15:36:24', 1);
INSERT INTO `tb_user` VALUES ('llowid_fb4bc66f', 'user_0bf244c9', '8864F668E3929538C7C130778DBB6A5B', '1565595394145@qq.com', NULL, NULL, '女', NULL, '贵州', NULL, '2019-08-12 15:36:34', 1);
INSERT INTO `tb_user` VALUES ('llowid_fb64d39a', 'user_47fe8c34', 'E02783AB06992CDFF3224B19C624B0C5', '1565596606175@qq.com', NULL, NULL, '女', NULL, '浙江', NULL, '2019-08-12 15:56:46', 1);
INSERT INTO `tb_user` VALUES ('llowid_fb79247c', 'user_9e6e2124', '34942EC4AC40F02B0355B6B8C03EEC94', '1565595374916@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:36:14', 1);
INSERT INTO `tb_user` VALUES ('llowid_fb82a326', 'user_7392a863', '3D82C5B31AA60B0FF8902A9EE8501C29', '1565596618967@qq.com', NULL, NULL, '女', NULL, '青海', NULL, '2019-08-12 15:56:58', 1);
INSERT INTO `tb_user` VALUES ('llowid_fb846fda', 'user_e8250566', '4C42E512883566CBA37B0DEBB1473BE5', '1565595114655@qq.com', NULL, NULL, '男', NULL, '陕西', NULL, '2019-08-12 15:31:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_fb863a4d', 'user_b0f72c0d', 'F7E8BF42E071A7057AA88D0D2155B2DF', '1565594929598@qq.com', NULL, NULL, '男', NULL, '海南', NULL, '2019-08-12 15:28:49', 1);
INSERT INTO `tb_user` VALUES ('llowid_fbb4604c', 'user_59ae3128', '6A2A869E77E64C0BBA9AAE01258FEA25', '1565595384663@qq.com', NULL, NULL, '女', NULL, '天津', NULL, '2019-08-12 15:36:24', 1);
INSERT INTO `tb_user` VALUES ('llowid_fbc5a74a', 'user_7a4b2a9b', '2898210549EECB3937010503658EB152', '1565595113306@qq.com', NULL, NULL, '女', NULL, '广东', NULL, '2019-08-12 15:31:53', 1);
INSERT INTO `tb_user` VALUES ('llowid_fc1b3c4e', 'user_cb98b757', 'B44D04DAD955955993F1D5CE9EAC08C2', '1565595373753@qq.com', NULL, NULL, '女', NULL, '台湾', NULL, '2019-08-12 15:36:13', 1);
INSERT INTO `tb_user` VALUES ('llowid_fc1cce4f', 'user_41ee9600', '262AE5FC2CF79C2891CD11A553952DA7', '1565596605790@qq.com', NULL, NULL, '女', NULL, '四川', NULL, '2019-08-12 15:56:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_fc3bf837', 'user_83301519', '86A6D286FA98C223162F1734A88315F9', '1565595111728@qq.com', NULL, NULL, '女', NULL, '台湾', NULL, '2019-08-12 15:31:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_fc4bf361', 'user_d14544ae', 'C330D243064F917765B2799DC80CEAFB', '1565596624056@qq.com', NULL, NULL, '女', NULL, '宁夏', NULL, '2019-08-12 15:57:04', 1);
INSERT INTO `tb_user` VALUES ('llowid_fca04758', 'user_b74ff48e', 'B3A437CD6AEC349F327178DC8A8C1F33', '1565595362420@qq.com', NULL, NULL, '男', NULL, '香港', NULL, '2019-08-12 15:36:02', 1);
INSERT INTO `tb_user` VALUES ('llowid_fcac48d6', 'user_8ebfcf51', 'E3C69A09DEF1E65EED90E9835088CF6E', '1565595174519@qq.com', NULL, NULL, '女', NULL, '内蒙古', NULL, '2019-08-12 15:32:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_fcbcc8f4', 'user_86eaf169', '6F004FE7E7C52261C7E762D710FD7FAE', '1565595392425@qq.com', NULL, NULL, '女', NULL, '贵州', NULL, '2019-08-12 15:36:32', 1);
INSERT INTO `tb_user` VALUES ('llowid_fd443483', 'user_5b4bbd97', 'BE1A0D29247888F1872396324232D36C', '1565595390275@qq.com', NULL, NULL, '男', NULL, '新疆', NULL, '2019-08-12 15:36:30', 1);
INSERT INTO `tb_user` VALUES ('llowid_fd741e64', 'user_aae9dd86', 'B6CC025B08336980F8052DA9B82CC238', '1565596611185@qq.com', NULL, NULL, '女', NULL, '西藏', NULL, '2019-08-12 15:56:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_fdaa3473', 'user_45ab83fb', '8E290E25017C5B6CF026AA97D5DC9BD3', '1565595392055@qq.com', NULL, NULL, '女', NULL, '浙江', NULL, '2019-08-12 15:36:32', 1);
INSERT INTO `tb_user` VALUES ('llowid_fdb5b457', 'user_94b819df', 'A987892CF293C53951B7E29F1602B688', '1565595385772@qq.com', NULL, NULL, '女', NULL, '澳门', NULL, '2019-08-12 15:36:25', 1);
INSERT INTO `tb_user` VALUES ('llowid_fe572a71', 'user_525b7f97', '4F8B6B7E96B5436943FA9A9C35AE19C8', '1565594865667@qq.com', NULL, NULL, '男', NULL, '甘肃', NULL, '2019-08-12 15:27:45', 1);
INSERT INTO `tb_user` VALUES ('llowid_fe6643fc', 'user_5d13803c', '0C84EBC795D947DE2FF1177BD1FC3FD7', '1565595369367@qq.com', NULL, NULL, '女', NULL, '福建', NULL, '2019-08-12 15:36:09', 1);
INSERT INTO `tb_user` VALUES ('llowid_fe8a752e', 'user_3db7b8f7', '8BDB9DEC3E7807C382632AC42ECE4014', '1565596614956@qq.com', NULL, NULL, '女', NULL, '澳门', NULL, '2019-08-12 15:56:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_ff050b08', 'user_b994aaca', 'FF7F50A31D0BD3F5454ED6E96FAFD4FF', '1565595392918@qq.com', NULL, NULL, '女', NULL, '江西', NULL, '2019-08-12 15:36:32', 1);
INSERT INTO `tb_user` VALUES ('llowid_ff0de141', 'user_729826f2', '45838B860CC7CE5F99B94468529791E6', '1565595365559@qq.com', NULL, NULL, '女', NULL, '青海', NULL, '2019-08-12 15:36:05', 1);
INSERT INTO `tb_user` VALUES ('llowid_ff3ec6b6', 'user_4c95c2f2', '7EEE5C4A54AD801DF646EFF9EF1E7E1A', '1565595372137@qq.com', NULL, NULL, '女', NULL, '湖北', NULL, '2019-08-12 15:36:12', 1);
INSERT INTO `tb_user` VALUES ('llowid_ff4faaa2', 'user_336e83a9', '5FA1113B3D679BE8CE0F0079946D4D7D', '1565595174180@qq.com', NULL, NULL, '女', NULL, '广东', NULL, '2019-08-12 15:32:54', 1);
INSERT INTO `tb_user` VALUES ('llowid_ff5729a5', 'user_ac01f6a1', 'D51A50F1751D5F895122EE37CDFAF152', '1565595379234@qq.com', NULL, NULL, '女', NULL, '青海', NULL, '2019-08-12 15:36:19', 1);
INSERT INTO `tb_user` VALUES ('llowid_ff755429', 'user_71fd8407', '93E0EF45663A36C9C0C55AF13D92FED1', '1565595382927@qq.com', NULL, NULL, '女', NULL, '四川', NULL, '2019-08-12 15:36:22', 1);
INSERT INTO `tb_user` VALUES ('llowid_ff7e874c', 'user_4ab9e98a', 'B0925B3C569D927A3EA29491A06C6919', '1565596607883@qq.com', NULL, NULL, '女', NULL, '福建', NULL, '2019-08-12 15:56:47', 1);
INSERT INTO `tb_user` VALUES ('llowid_ff8065b4', 'user_f26a0604', '7DAAC568FE302C5E1C6E91D67DAED958', '1565595361919@qq.com', NULL, NULL, '女', NULL, '重庆', NULL, '2019-08-12 15:36:01', 1);
INSERT INTO `tb_user` VALUES ('llowid_ff8b7789', 'user_e764f04a', '525B09BD7153F3EEB92084BF2E43BF14', '1565595171916@qq.com', NULL, NULL, '女', NULL, '新疆', NULL, '2019-08-12 15:32:51', 1);
INSERT INTO `tb_user` VALUES ('llowid_ff9dd265', 'user_269bb390', '2EF91066DC6EA45094AD0C2E903452C5', '1565594632857@qq.com', NULL, NULL, '男', NULL, '广西', NULL, '2019-08-12 15:23:52', 1);
INSERT INTO `tb_user` VALUES ('userid_1b8d36dd', '张三', '4713FF3FAE479DD2C9215B6D28C13CF9', '937637598@qq.com', '17374383222', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565769852&di=248256705031557bcb6651ae067a99f0&imgtype=jpg&er=1&src=http%3A%2F%2Fs6.sinaimg.cn%2Fmw690%2F002VkTPjzy75yUZmsKxd5', '男', 20, '澳门', '123', '2019-07-04 20:13:59', 1);

SET FOREIGN_KEY_CHECKS = 1;
