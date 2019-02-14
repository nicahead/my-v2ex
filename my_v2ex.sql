/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50639
Source Host           : localhost:3306
Source Database       : my_v2ex

Target Server Type    : MYSQL
Target Server Version : 50639
File Encoding         : 65001

Date: 2019-02-14 18:30:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `post_id` varchar(100) NOT NULL COMMENT '帖子id',
  `replyed_id` bigint(20) NOT NULL COMMENT '被回复者id',
  `author_id` bigint(20) NOT NULL COMMENT '评论者id',
  `author_name` varchar(100) NOT NULL COMMENT '评论者name',
  `content` text NOT NULL COMMENT '评论内容',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES ('1', '2eda6aed-b160-4199-ad37-85e6e56d0079', '3', '2', 'zwj', '<p style=\"text-align: center;\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/8a/pcmoren_cool2017_org.png\" alt=\"[酷]\" data-w-e=\"1\"><br></p>', '2019-02-12 21:58:26');
INSERT INTO `tb_comment` VALUES ('2', '46d3fc42-4352-4424-96fd-49fbd81537c2', '3', '2', 'zwj', '<h2 style=\"text-align: center;\">哈哈哈</h2>', '2019-02-12 22:11:42');
INSERT INTO `tb_comment` VALUES ('3', '2eda6aed-b160-4199-ad37-85e6e56d0079', '3', '3', 'lhc', '<p>本人<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/50/pcmoren_huaixiao_org.png\" alt=\"[坏笑]\" data-w-e=\"1\"></p>', '2019-02-12 22:13:19');
INSERT INTO `tb_comment` VALUES ('4', '46d3fc42-4352-4424-96fd-49fbd81537c2', '3', '2', 'zwj', '<p><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/50/pcmoren_huaixiao_org.png\" alt=\"[坏笑]\" data-w-e=\"1\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[舔屏]\" data-w-e=\"1\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/3c/pcmoren_wu_org.png\" alt=\"[污]\" data-w-e=\"1\"><br></p><table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><th>&nbsp;test1</th><th>&nbsp;\r\n\r\n&nbsp;test1</th><th>&nbsp;\r\n\r\n&nbsp;test1</th><th>&nbsp;\r\n\r\n&nbsp;test1</th><th>&nbsp;\r\n\r\n&nbsp;test1</th></tr><tr><td>&nbsp;\r\n\r\n&nbsp;test1</td><td>&nbsp;\r\n\r\n&nbsp;test1</td><td>&nbsp;\r\n\r\n&nbsp;test1</td><td>&nbsp;\r\n\r\n&nbsp;test1</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;\r\n\r\n&nbsp;test1</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;\r\n\r\n&nbsp;test1</td><td>&nbsp;</td></tr></tbody></table><p><br></p>', '2019-02-13 00:02:13');
INSERT INTO `tb_comment` VALUES ('5', '2eda6aed-b160-4199-ad37-85e6e56d0079', '3', '2', 'zwj', '<p><span style=\"background-color: rgb(77, 128, 191);\">你好吗</span><span style=\"background-color: rgb(241, 241, 241); color: inherit; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: inherit; white-space: pre-wrap;\">&lt;script type=\"text/javascript\"&gt;</span></p><pre><code>Request = {\r\n QueryString : function(item){\r\n  var svalue = location.search.match(new RegExp(\"[\\?\\&amp;]\" + item + \"=([^\\&amp;]*)(\\&amp;?)\",\"i\"));\r\n  return svalue ? svalue[1] : svalue;\r\n }\r\n}\r\nalert(Request.QueryString(\"id\"));\r\n&lt;/script&gt;</code></pre><p><br></p>', '2019-02-13 00:03:34');
INSERT INTO `tb_comment` VALUES ('6', '2eda6aed-b160-4199-ad37-85e6e56d0079', '3', '3', 'lhc', '<p><img src=\"http://127.0.0.1:8080/upload/3aaae90c-c450-47b7-83bf-ce0b4a27d2a1.png\" style=\"max-width:100%;\"><br></p>', '2019-02-13 20:48:30');
INSERT INTO `tb_comment` VALUES ('7', 'dc256f81-8b86-4a03-b676-86ad214661b6', '3', '3', 'lhc', '<p><img src=\"http://127.0.0.1:8080/upload/d15ce75f-a434-4fa4-9e56-ffbc11c653e3.png\" style=\"max-width:100%;\"><img src=\"http://127.0.0.1:8080/upload/939ca32c-d968-47a5-8f9a-b254112811a5.png\" style=\"max-width: 100%;\"><br></p>', '2019-02-13 20:51:16');
INSERT INTO `tb_comment` VALUES ('8', 'dc256f81-8b86-4a03-b676-86ad214661b6', '3', '2', 'zwj', '<blockquote>可以可以<img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6e/panda_thumb.gif\" alt=\"[熊猫]\" data-w-e=\"1\"><span style=\"background-color: rgb(255, 255, 255);\"><u></u></span></blockquote>', '2019-02-13 21:00:01');
INSERT INTO `tb_comment` VALUES ('9', '2eda6aed-b160-4199-ad37-85e6e56d0079', '3', '4', 'imnic', '<p>你是谁<img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bc/fuyun_thumb.gif\" alt=\"[浮云]\" data-w-e=\"1\"></p>', '2019-02-13 21:15:50');
INSERT INTO `tb_comment` VALUES ('10', '87545128-5132-49ed-996e-c060b77d72cf', '4', '1', 'root', '<p><img src=\"http://127.0.0.1:8080/upload/4b49757c-a294-4933-ab68-951441f49461.jpg\" style=\"max-width:100%;\"><br></p>', '2019-02-14 16:02:16');
INSERT INTO `tb_comment` VALUES ('11', '2eda6aed-b160-4199-ad37-85e6e56d0079', '4', '1', 'root', '<div class=\"pre\">@imnic<br></div><p>你猜我是谁<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/0b/tootha_org.gif\" alt=\"[嘻嘻]\" data-w-e=\"1\"></p>', '2019-02-14 16:39:30');
INSERT INTO `tb_comment` VALUES ('12', '87545128-5132-49ed-996e-c060b77d72cf', '1', '4', 'imnic', '<div class=\"pre\">@root<br></div><p><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/8a/pcmoren_cool2017_org.png\" alt=\"[酷]\" data-w-e=\"1\"><br></p>', '2019-02-14 16:43:23');
INSERT INTO `tb_comment` VALUES ('13', '06bba61f-6866-426d-9908-72ab7c0af827', '7', '4', 'imnic', '<div class=\"pre\"></div><p>你好<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/50/pcmoren_huaixiao_org.png\" alt=\"[坏笑]\" data-w-e=\"1\"></p>', '2019-02-14 17:08:21');
INSERT INTO `tb_comment` VALUES ('14', '666f6aae-6601-4110-8b55-aab0e46822e0', '6', '4', 'imnic', '<div class=\"pre\"></div><p>你好<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/3c/pcmoren_wu_org.png\" alt=\"[污]\" data-w-e=\"1\"></p>', '2019-02-14 17:08:43');
INSERT INTO `tb_comment` VALUES ('15', '2eda6aed-b160-4199-ad37-85e6e56d0079', '3', '4', 'imnic', '<div class=\"pre\"></div><blockquote>哈哈</blockquote>', '2019-02-14 17:09:26');

-- ----------------------------
-- Table structure for tb_node
-- ----------------------------
DROP TABLE IF EXISTS `tb_node`;
CREATE TABLE `tb_node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '节点id',
  `nodename` varchar(50) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `state` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='节点表';

-- ----------------------------
-- Records of tb_node
-- ----------------------------
INSERT INTO `tb_node` VALUES ('1', '技术', '技术技术技术', '1');
INSERT INTO `tb_node` VALUES ('2', '创意', '创意创意创意', '1');
INSERT INTO `tb_node` VALUES ('3', '好玩', '好玩好玩好玩', '1');
INSERT INTO `tb_node` VALUES ('4', '求职', '求职求职求职', '1');

-- ----------------------------
-- Table structure for tb_post
-- ----------------------------
DROP TABLE IF EXISTS `tb_post`;
CREATE TABLE `tb_post` (
  `id` varchar(100) NOT NULL COMMENT '帖子id',
  `node_id` bigint(20) NOT NULL COMMENT '所属节点id',
  `node_name` varchar(50) NOT NULL COMMENT '节点名称',
  `title` varchar(200) NOT NULL COMMENT '帖子标题',
  `content` text NOT NULL COMMENT '帖子内容',
  `author_id` bigint(20) NOT NULL COMMENT '创建人id',
  `author_name` varchar(100) NOT NULL COMMENT '创建人',
  `comments` int(11) DEFAULT '0' COMMENT '评论数',
  `reply_id` bigint(20) DEFAULT NULL COMMENT '最后回复id',
  `reply_username` varchar(32) DEFAULT NULL COMMENT '最后回复人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `replyed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帖子表';

-- ----------------------------
-- Records of tb_post
-- ----------------------------
INSERT INTO `tb_post` VALUES ('06bba61f-6866-426d-9908-72ab7c0af827', '3', '好玩', '我是zxc', '<p><img src=\"http://127.0.0.1:8080/upload/848d59e8-300e-4c4b-af66-50296e080474.jpg\" style=\"max-width:100%;\"><br></p>', '7', 'zxc', '1', '4', 'imnic', '2019-02-14 17:04:50', '2019-02-14 17:04:50', '2019-02-14 17:08:21');
INSERT INTO `tb_post` VALUES ('2eda6aed-b160-4199-ad37-85e6e56d0079', '2', '创意', '令狐冲是我', '<h3 style=\"text-align: center;\">哈哈</h3><p><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/50/pcmoren_huaixiao_org.png\" alt=\"[坏笑]\" data-w-e=\"1\"><br></p><p><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/8a/pcmoren_cool2017_org.png\" alt=\"[酷]\" data-w-e=\"1\"><br></p><p><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/29/bz_org.gif\" alt=\"[闭嘴]\" data-w-e=\"1\"><br></p>', '3', 'lhc', '7', '4', 'imnic', '2019-02-11 22:19:26', '2019-02-11 22:19:26', '2019-02-14 17:09:26');
INSERT INTO `tb_post` VALUES ('46d3fc42-4352-4424-96fd-49fbd81537c2', '1', '技术', '我是令狐冲', '<p style=\"text-align: center;\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/50/pcmoren_huaixiao_org.png\" alt=\"[坏笑]\" data-w-e=\"1\"><br></p>', '3', 'lhc', '2', '2', 'zwj', '2019-02-11 20:47:26', '2019-02-11 20:47:26', '2019-02-13 00:02:14');
INSERT INTO `tb_post` VALUES ('666f6aae-6601-4110-8b55-aab0e46822e0', '2', '创意', '我是qweasd', '<p><img src=\"http://127.0.0.1:8080/upload/705bb8bf-c858-4edb-babf-8b800d9384b8.jpg\" style=\"max-width:100%;\"><br></p>', '6', 'qweasd', '1', '4', 'imnic', '2019-02-14 17:03:16', '2019-02-14 17:03:16', '2019-02-14 17:08:44');
INSERT INTO `tb_post` VALUES ('84f8e6c2-9d22-41cb-a275-94e73b529832', '3', '好玩', '大数据基础平台实施及运维', '<p>大数据基础平台实施及运维\r\n为什么使用大数据技术\r\n海量数据需要处理\r\n数据分析实时性越来越强\r\n数据结果的应用越来越广泛\r\n\r\n人工处理起来非常困难\r\n\r\n什么是大数据\r\n收集、整理、处理大容量数据集，并从中获得结果的技术总称\r\n\r\n大数据应用领域\r\n\r\n广告、电信、金融、安全、能源生物、社交游戏、电商零售\r\n\r\n大数据处理框架\r\n仅批处理框架\r\n对整个数据集进行处理\r\n\r\nApache Haddoop\r\n一种以MapReduce作为默认处理引擎批处理框架\r\n仅流处理框架\r\n随时处理进入系统的数据，无数据边界\r\n\r\nApache Storm\r\nApache Samza\r\n混合处理框架\r\n同时批处理和流处理\r\n\r\nApache Spark\r\nApache Flink\r\nhadoop历史\r\n2002年 Doug Cutting 开发了 Nutch\r\n\r\n2004年 Doug Cutting 实现了分布式文件存储系统名为NDFS\r\n\r\n2005年 Doug Cutting 实现了MapReduce功能\r\n\r\n2006年 将NDFS与MapReduce升级命名为Hadoop\r\n\r\nHadoop生态圈\r\n核心项目\r\nHDFS\r\nMapReduce\r\nYARN\r\nCommon\r\nOzone\r\n相关项目\r\nAmbari\r\nAvro\r\nCassandra\r\nChukwa\r\nHBase\r\nPig\r\nSpark\r\nHive\r\nHadoop核心项目介绍\r\n分布式文件系统HDFS\r\n特点：\r\n高度容错性系统\r\n支持大数据文件\r\n支持一次写入，多次读写，顺序读取\r\n适合在廉价的机器上，支持硬件故障\r\n提供高吞吐量数据访问\r\n适合有超大数据集的应用程序\r\n关键词：\r\nBlock–Hadoop 2.x 默认大小128M\r\nNameNode–保存元数据、接收用户请求、管理文件与Block，Block与DataNode之间的关系\r\nDataNode–存储Block块文件，具体数据\r\nMapReduce\r\nMap:一种分配计算任务的方法\r\n 生成一些中间文件作为Reduce任务的输入数据\r\nReduce:一种从Map结果集获得最终数据的方法，并保存在HDFS文件系统中\r\nYARN–另一种资源协调者\r\nResourceManager–负责对各个NodeManager上的资源进行统一管理和调度\r\nApplicationsManager\r\nResourceScheduler\r\nNodeManager–在各个计算节点运行，用于接收RM中ApplicationManager的计算任务、启动/停止任务、和RM中Scheduler汇报并协商自愿、监控并汇报节点的情况\r\nApplicationManager\r\nMap Task\r\nReduce Task\r\nContainer–是一组资源描述的集合，或资源分组描述。例如组1包含：CPU 0.2 Mem 100M\r\nHadoop部署\r\n本地模式\r\n伪分布式\r\n完全分布式\r\n部署区分依据\r\n是否启动多个进程，多个进程运行在相同或不同的节点上\r\n本地部署（单机部署）\r\n只运行在本地\r\n是Hadoop默认部署模式\r\n不启动进程\r\n配置文件为空\r\n使用本地文件系统，不使用HDFS文件系统\r\n主要用于开发调试MapReduce程序的应用逻辑\r\n安装软件直接使用\r\n伪分布式部署\r\n用于模拟小规模集群\r\n允许代码调试\r\n以守护进程方式运行\r\n使用HDFS是文件系统\r\n部署\r\n安装软件\r\n修改配置文件\r\n格式化HDFS\r\n启动角色（NameNode、DataNode）\r\nHDFS测试文件操作\r\n完全分布式部署\r\n利用多台Linux主机进行部署Hadoop，对Linux机器集群进行规划，是的Hadoop各个模块分别部署在不同的机器上\r\nHA+完全分布式部署\r\n切换实现方式：对NameNode进行一个抽象：NameService —有两个NameNode，一个Active，一个Standby状态；通过Zookeeper记性协调选举，确保只有一个活跃的NameNode\r\nZKFC\r\nHA数据共享方法\r\nNameNode维护两个文件\r\nfsimage\r\n保存了最新的元数据检查点\r\neditlog\r\nHDFS客户端执行所有的写操作都会记录在editlog中\r\nActive NameNode与Standby NameNode之间通过JournalNode相互通信，相当于NFS共享文件系统，Active NameNode 王里写editlog数据，Standby在从里面读取数据进行同步\r\nAmbari自动部署Hadoop集群\r\n作用\r\n提供Hadoopjiqun\r\n管理Hadoop集群\r\n监控Hadoop集群\r\n组成\r\nAmbari-server\r\nAmbari-agent\r\n扩展：cloudera\r\n\r\n--------------------- \r\n作者：SU_Devops \r\n来源：CSDN \r\n原文：https://blog.csdn.net/SU_Devops/article/details/86487000 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！</p>', '4', 'imnic', '0', null, null, '2019-02-14 17:07:49', '2019-02-14 17:07:49', '2019-02-14 17:07:49');
INSERT INTO `tb_post` VALUES ('87545128-5132-49ed-996e-c060b77d72cf', '3', '好玩', '倪畅在此', '<p><img src=\"http://127.0.0.1:8080/upload/fa49f828-09ad-48b6-80bf-7c4fadc51325.jpg\" style=\"max-width:100%;\"><br></p><p><br></p><p><br></p><p><font color=\"#f9963b\">我是红色&nbsp; <span style=\"background-color: rgb(70, 172, 200);\">我是啥色&nbsp;&nbsp;</span></font><strike></strike>&nbsp; &nbsp;<strike>你好</strike></p>', '4', 'imnic', '2', '4', 'imnic', '2019-02-13 21:05:37', '2019-02-13 21:05:37', '2019-02-14 16:43:24');
INSERT INTO `tb_post` VALUES ('b38f9085-1565-429b-8e4c-1b8ce77e9493', '4', '求职', '1111111', '<p><img src=\"http://127.0.0.1:8080/upload/9b6ba115-ab64-4c13-9635-8dc53b8d31ef.jpg\" style=\"max-width:100%;\"><br></p>', '5', 'nic123', '0', null, null, '2019-02-14 17:02:00', '2019-02-14 17:02:00', '2019-02-14 17:02:00');
INSERT INTO `tb_post` VALUES ('b5615a64-bb62-437c-a140-28dcd1170dbc', '2', '创意', '我是张无忌', '<p><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/50/pcmoren_huaixiao_org.png\" alt=\"[坏笑]\" data-w-e=\"1\"><br></p>', '2', 'zwj', '0', null, null, '2019-02-14 17:03:51', '2019-02-14 17:03:51', '2019-02-14 17:03:51');
INSERT INTO `tb_post` VALUES ('d0089b9c-9702-4eb4-bda5-d338d15555fc', '3', '好玩', '开机进入grub无法进入系统的解决办法', '<p>&nbsp;本人用grub引导的双系统，一次不知怎么回事开机就直接进入grub，黑乎乎的屏幕上只有grub提示符，很是不爽啊。很多人都出现过类似问题，网上提供的解决方法一般都是如下：<br><br>grub&gt;root (ha0,0)&nbsp;<br>grub&gt;rootnoverify (ha0,0)&nbsp;<br>grub&gt;chainloader +1<br>grub&gt;boot&nbsp;<br>这样就进入xp了。<br><br>至少你的windows能用了！但每次开机都输入以上命令岂不很郁闷？我的方法是第一次进入windows后，在运行中输入cmd，进入DOS，使用命令FDISK /MBR命令，这样再次开机就直接进入windows，而不用输入上面那几行命令了！MBR是什么？答 ：MBR（Master Boot Record,另一说法为Main Boot Record）,中文意为主<a href=\"https://www.baidu.com/s?wd=%E5%BC%95%E5%AF%BC%E5%8C%BA&amp;tn=24004469_oem_dg&amp;rsv_dl=gh_pl_sl_csd\" target=\"_blank\">引导区</a>记录。正是由于它遭到破坏才导致不能进入windows。<br>如何进入linux呢？我的方法就是利用原来的镜像文件把linux重装一下，当然在重装的时候，不对原有的分区格式化，这样就就把grub重装了一下，而且原来linux中算坏的文件也得到修复，其他的没有改变，速度也很快！此后在开机就看到两个系统的选择界面了。如果格式化了分区，那就是真正的重装了！速度慢得很了。<br>还有其他的方法，比如已知<a href=\"https://www.baidu.com/s?wd=linux%E7%B3%BB%E7%BB%9F&amp;tn=24004469_oem_dg&amp;rsv_dl=gh_pl_sl_csd\" target=\"_blank\">linux系统</a>的kernel，修改已安装的grub的menu.list，在其中增加新的启动项，一般格式如下：&nbsp;&nbsp;<br></p>', '6', 'qweasd', '0', null, null, '2019-02-14 17:07:01', '2019-02-14 17:07:01', '2019-02-14 17:07:01');
INSERT INTO `tb_post` VALUES ('dc256f81-8b86-4a03-b676-86ad214661b6', '4', '求职', '图片test', '<p><img src=\"http://127.0.0.1:8080/upload/c48489df-83f9-475d-a912-c37d01bd9b47.png\" style=\"max-width:100%;\"><br></p>', '3', 'lhc', '2', '2', 'zwj', '2019-02-13 20:49:50', '2019-02-13 20:49:50', '2019-02-13 21:00:02');
INSERT INTO `tb_post` VALUES ('dd68a9b7-97f3-4a79-84bb-b12a44877b5b', '1', '技术', '编程语言的巅峰', '<p><a href=\"https://blog.csdn.net/weixin_43932460/article/details/86702483\" target=\"_blank\">编</a>“哇塞，怎么可能这么简单！”\r\n\r\n当C语言老头儿还是小伙子的时候，第一次见到了汇编，发出了这么一声感慨。\r\n\r\n在C语言看来，这汇编的指令实在是太简单了，简单到了令人发指的地步，只有这么几类指令：\r\n\r\n数据传输类：\r\n就是把数据从一个位置复制到另外一个位置，比如从内存到寄存器，或者从寄存器到内存， 或者从寄存器到寄存器。\r\n\r\n海风教育在线辅导0元一对一试听课等你来领取，领取课程方法：\r\n1、私信留下您的手机号和姓名，需要补习的科目。\r\n2、也可以在海风教育官网留下您的手机号领取 https://www.hfjy.com\r\n\r\n算术和逻辑运算类：\r\n无非就是加减乘除，AND, OR, 左移，右移\r\n\r\n控制类：\r\n比较两个值，跳转到某一个位置。\r\n\r\n汇编老头儿非常地骄傲， 他经常嚣张地说：“别看我的指令这么简单，但是配合我的寄存器和内存， 却能完成你们这些所谓的高级语言的所有功能！”\r\n\r\n这寄存器是什么鬼？ C语言脑海中只有内存和指针，根本就没有什么寄存器的概念， 实际上，这是属于CPU阿甘的，容量有限，但是速度超级快的存储部件。\r\n\r\n32位CPU寄存器\r\n--------------------- \r\n作者：weixin_43932460 \r\n来源：CSDN \r\n原文：https://blog.csdn.net/weixin_43932460/article/details/86702483 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！<br></p>', '7', 'zxc', '0', null, null, '2019-02-14 17:05:59', '2019-02-14 17:05:59', '2019-02-14 17:05:59');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(100) NOT NULL DEFAULT '' COMMENT '用户密码',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `avatar` varchar(100) DEFAULT 'default_avatar.jpg' COMMENT '头像',
  `role` tinyint(2) NOT NULL DEFAULT '0' COMMENT '角色 0-会员 1-管理员 ',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `logined` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'root', '63a9f0ea7bb98050796b649e85481845', 'root@root.com', 'default_avatar.jpg', '1', '2019-02-11 16:25:18', '2019-02-14 18:04:43');
INSERT INTO `tb_user` VALUES ('2', 'zwj', 'eb1722df1e9fd1bffff6c2298689618b', 'zwj@qq.com', '0e09022c-e5b9-4075-afba-bb854e680908.png', '0', '2019-02-11 16:47:10', '2019-02-14 17:03:36');
INSERT INTO `tb_user` VALUES ('3', 'lhc', '8716a246719d761013337db8545f476f', 'lhc@qq.com', '16c65957-3219-48f1-8e58-0622bc5e342b.png', '0', '2019-02-11 18:37:44', '2019-02-13 20:48:13');
INSERT INTO `tb_user` VALUES ('4', 'imnic', 'e0dace8dc993fc72ce37c0e14aabc394', 'imnic@126.com', 'a569418e-a1a7-4ac5-8621-97f851d10c4c.png', '0', '2019-02-13 21:03:23', '2019-02-14 17:58:23');
INSERT INTO `tb_user` VALUES ('5', 'nic123', '8f0ed56645c9bde4aba0edc7035c0b38', 'nic123@qq.com', '22a48a7a-3285-4998-a0b0-a9c99be735a9.jpg', '0', '2019-02-14 17:01:16', '2019-02-14 17:01:22');
INSERT INTO `tb_user` VALUES ('6', 'qweasd', '36f17c3939ac3e7b2fc9396fa8e953ea', 'qweasd@qq.com', 'cf605f68-7428-4443-ae87-edc342a16b11.jpg', '0', '2019-02-14 17:02:50', '2019-02-14 17:06:34');
INSERT INTO `tb_user` VALUES ('7', 'zxc', '5fa72358f0b4fb4f2c5d7de8c9a41846', 'zxc@qq.com', 'beec8d04-bc54-4193-bbf6-6c9cf37c8606.jpg', '0', '2019-02-14 17:04:27', '2019-02-14 17:04:32');
