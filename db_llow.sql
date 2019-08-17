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
ET FOREIGN_KEY_CHECKS = 1;
