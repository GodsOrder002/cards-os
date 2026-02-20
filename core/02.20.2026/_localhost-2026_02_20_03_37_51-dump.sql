-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: a_a_a_dev
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `player_id` bigint unsigned NOT NULL DEFAULT '0',
  `key_json` json NOT NULL DEFAULT (json_object()),
  `chain_json` json NOT NULL DEFAULT (json_object()) COMMENT '我的所有组合牌的依据牌组合',
  `kind_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '这里就分成了小组合，大组合，秩序组合（类似圣经）',
  `player_remark_json` json NOT NULL DEFAULT (json_object()),
  `remark_json` json NOT NULL DEFAULT (json_object()) COMMENT '系统治理者的备注字段',
  `status_id` int unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT (now()),
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='我的账本，记录的是我的依据牌组合,我的看法，应该走智能反应路线，要明白对手奉行的世界观，要加快反应速度，所以世界观组合应该单独拿出来训练';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,11,'{}','{\"cards\": [{\"key\": \"智能分析，大脑是可以处理多核场景的\", \"axes\": [], \"cards\": [{\"key\": \"输出接口单核方案\", \"axes\": [\"嘴巴是一个器官，人体工程学，那就意味着在表达上，单核\", \"当然，有的时候说话沟通的时候，肢体语言是辅助功能，但是只靠嘴巴这个器官交流是能完成完整沟通的，可见在处理智能的结果上，走的是单核模式\"], \"cards\": [{\"key\": \"误解成本优先于信息价值\", \"axes\": [\"在沟通场景中，既然是输出接口单核方案，那就存在误解成本优，信息价值等问题\"], \"cards\": [{\"key\": \"先锁歧义成本最高的轴\", \"axes\": [], \"cards\": [{\"key\": \"挂载方案\", \"axes\": [\"在语言工程设计里，通过挂载的独特单词来简化表达，优化多语句来补充信息的情况\"], \"cards\": [{\"key\": \"尽量同句挂载，减少焦点分裂\", \"axes\": [], \"cards\": [{\"key\": \"显示化关系词\", \"axes\": [], \"cards\": [], \"remark\": \"\"}], \"remark\": \"\"}], \"remark\": \"\"}], \"remark\": \"\"}], \"remark\": \"\"}], \"remark\": \"\"}], \"remark\": \"\"}], \"remark\": \"\"}',3,'{}','{}',1,'2026-02-20 01:48:27','2026-02-20 02:11:37');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code`
--

DROP TABLE IF EXISTS `code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `code` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key_json` json NOT NULL DEFAULT (json_object()) COMMENT '检索key，动态扩展',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '字典的英文名',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '具体的字典',
  `book` varchar(64) NOT NULL DEFAULT '' COMMENT '对应的中文解释',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `remark_json` json DEFAULT (json_object()) COMMENT '备注,动态扩展',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '这条code的状态 删除/更新/等等,1,未审计，2审计并上线',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_group_enabled` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code`
--

LOCK TABLES `code` WRITE;
/*!40000 ALTER TABLE `code` DISABLE KEYS */;
INSERT INTO `code` VALUES (1,'{}','status','new_unreviewed','刚生成/未审计','状态：未审计，版本更新后旧版本，放弃，删除。。。','{}',1,'2026-02-13 20:20:03','2026-02-13 20:20:03'),(2,'{}','status','delete','删除','状态：未审计，版本更新后旧版本，放弃，删除。。。','{}',1,'2026-02-13 20:20:03','2026-02-13 20:20:31'),(3,'{}','kind','small','小组合','chain里的分类，这里就分成了小组合，大组合，秩序组合（类似圣经）','{}',1,'2026-02-18 08:16:39','2026-02-18 08:16:39'),(4,'{}','kind','order','秩序','chain里的分类，这里就分成了小组合，大组合，秩序组合（类似圣经）','{}',1,'2026-02-18 08:16:39','2026-02-18 08:16:39'),(5,'{}','kind','big','大组合','chain里的分类，这里就分成了小组合，大组合，秩序组合（类似圣经）','{}',1,'2026-02-18 08:16:39','2026-02-18 08:16:39');
/*!40000 ALTER TABLE `code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hunt`
--

DROP TABLE IF EXISTS `hunt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hunt` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `player_id` bigint unsigned NOT NULL DEFAULT '0',
  `key_json` json NOT NULL DEFAULT (json_object()),
  `poker_json` json NOT NULL DEFAULT (json_object()) COMMENT '收集到的猎杀牌集合(默认全部假)，只影响博弈权重',
  `hunt_json` json NOT NULL DEFAULT (json_object()) COMMENT '分析出来要打的组合牌的结果，没有混合考量的情况',
  `play_json` json NOT NULL DEFAULT (json_object()) COMMENT '我想要猎杀的具体组合牌，这个只有发生在混合情况之后，一开始拿到所有牌的时候，大家都还没有出牌，实际上环境玩家已经出牌了，',
  `player_remark_json` json NOT NULL DEFAULT (json_object()),
  `remark_json` json NOT NULL DEFAULT (json_object()) COMMENT '系统治理者的备注字段',
  `status_id` int unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT (now()),
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='猎杀账本，只记录我收集到了什么组合牌，推测可能出的组合牌，博弈之后我出的组合牌。可不限次数的博弈，但以单轮记录，以keyjson记录博弈轮数，和之前博弈的ids，统一治理路线，牺牲一些数据库资源，换取治理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hunt`
--

LOCK TABLES `hunt` WRITE;
/*!40000 ALTER TABLE `hunt` DISABLE KEYS */;
INSERT INTO `hunt` VALUES (11,0,'{}','{\"cards\": [{\"cardId\": [1, 2], \"tableId\": 15}, {\"cardId\": [1], \"tableId\": 16}], \"remark\": \"\"}','{}','{}','{}','{}',2,'2026-02-15 16:40:54','2026-02-15 18:29:44'),(12,0,'{}','{\"cards\": [{}]}','{}','{}','{}','{}',2,'2026-02-15 16:24:15','2026-02-15 18:30:08'),(13,0,'{}','{}','{}','{}','{}','{}',2,'2026-02-15 18:14:19','2026-02-15 18:27:26'),(14,0,'{}','{\"cards\": [{\"cardId\": [1, 2], \"tableId\": 15}, {\"cardId\": [1], \"tableId\": 16}], \"remark\": \"\"}','{}','{}','{}','{}',1,'2026-02-15 18:14:19','2026-02-15 18:18:10'),(15,0,'{}','{\"cards\": [{\"cardId\": [1, 2], \"tableId\": 15}, {\"cardId\": [1], \"tableId\": 16}], \"remark\": \"\"}','{}','{}','{}','{}',1,'2026-02-15 16:40:54','2026-02-15 18:12:03'),(16,0,'{}','{\"cards\": [{\"cardId\": [1, 2], \"pokerId\": 15}, {\"cardId\": [1], \"pokerId\": 16}, {\"cardId\": [1, 2, 9, 10, 11, 12], \"pokerId\": 19}], \"remark\": \"\"}','{\"cards\": [{\"key\": \"A is B, from China, by plane.\", \"axes\": [], \"cards\": [], \"remark\": \"\"}, {\"key\": \"A is B, from China, by plane and A is a boy.\", \"axes\": [], \"cards\": [], \"remark\": \"\"}], \"remark\": \"\"}','{\"cards\": [{\"key\": \"A was transferred at T in P by S from X for R with C.\", \"axes\": [], \"cards\": [], \"remark\": \"\"}, {\"key\": \"Mr. A was murdered at 11 p.m. on xx Street by three thieves from Brooklyn.\", \"axes\": [], \"cards\": [], \"remark\": \"\"}], \"remark\": \"\"}','{}','{}',1,'2026-02-15 16:24:15','2026-02-20 02:52:18');
/*!40000 ALTER TABLE `hunt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledger`
--

DROP TABLE IF EXISTS `ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ledger` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `player_id` bigint unsigned NOT NULL DEFAULT '0',
  `key_json` json NOT NULL DEFAULT (json_object()),
  `question_json` json NOT NULL DEFAULT (json_object()) COMMENT '提出的问题/牌',
  `question_fix_json` json NOT NULL DEFAULT (json_object()) COMMENT '猜测想要问的完整牌（类似于先定位，修复，现成完整的问题，有一些傻逼连想法都表达不清楚）',
  `answer_json` json NOT NULL DEFAULT (json_object()) COMMENT '生成的答案',
  `bridge_json` json NOT NULL DEFAULT (json_object()) COMMENT 'ai的背后依据组合牌，通过记录桥梁账本，就能反向破译，一样走book路线，这里只记录ids。至于问话的人的依据组合，走book路线，统一治理规则',
  `score_json` json NOT NULL DEFAULT (json_object()) COMMENT '权重/理由结构化',
  `book_id` json NOT NULL DEFAULT (json_object()) COMMENT '采纳到book里的卡牌组合的id，统一走治理路线，一个组合就存一个组合，要存多个，走key_json，声明这是引用自哪条.0，默认不采用',
  `player_remark_json` json NOT NULL DEFAULT (json_object()),
  `remark_json` json NOT NULL DEFAULT (json_object()) COMMENT '系统治理者的备注字段',
  `status_id` int unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT (now()),
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='AI训练审计账本';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledger`
--

LOCK TABLES `ledger` WRITE;
/*!40000 ALTER TABLE `ledger` DISABLE KEYS */;
INSERT INTO `ledger` VALUES (1,11,'{\"remark\": \"\", \"ledgerTopicId\": 0}','{\"remark\": \"\", \"question\": \"A is B, from China, by plane.给一个挂载的长句，类似这样的\"}','{}','{\"answer\": \"可以，用这种“主干 + 一串可插拔修饰块”的长句最方便挂载信息：\\n\\n**模板（可挂载很多块）**\\n`A, (who is/was) B, (originally) from X, (currently) in Y, (having) arrived by Z, (on/at) T, (for) R, (with) C, (despite) D, (so that) G, (which) N.`\\n\\n**你给的结构的强化版示例（更长、但仍是一句）**\\n`A, who is B, originally from China, arrived by plane yesterday evening, carrying only a small backpack, to attend a meeting in New York, accompanied by two colleagues, despite the stormy weather, so that the project could stay on schedule, which everyone had been waiting for.`\\n\\n如果你想要“更像你那句 A is B, from China, by plane.” 的极简挂载风格（逗号块全是插件），也可以这样：\\n\\n`A is B, from China, by plane, to Y, at T, for R, with C, under D, aiming at G.`\\n\", \"remark\": \"\"}','{}','{\"score\": 0.0, \"reason\": [\"我想要的是这样的结构\", \"对于开发这个多语言学习辅助系统的人来说，提出这样的结构，是希望AI能给出完整的英文语句，并精准的命中：结构是指这样的挂载方案的设计思路，然后给出长句\"], \"remark\": \"\"}','{\"books\": [], \"schema_version\": 1}','{}','{}',1,'2026-02-20 03:03:42','2026-02-20 03:35:00'),(2,11,'{\"remark\": \"\", \"ledgerTopicId\": 1}','{\"remark\": \"\", \"question\": \"i am a student from china,我的意思是这样完整的挂载的\"}','{}','{\"answer\": \"懂了：你要的是**以 “I am a student from China,” 为主干**，后面用一串“挂载块”把信息都接上去，最后仍然是**一句完整的长句**。\\n\\n下面给你几种“可无限挂载”的完整句式（都能继续往后加）：\\n\\n### 1) 经典挂载型（逗号 + 从句/分词/介词短语一直挂）\\n\\n**I am a student from China, currently studying in New York, majoring in computer science, focusing on governance and alignment, having arrived by plane last semester, living near campus, juggling classes and a part-time research role, trying to build a practical framework rather than chasing perfect theory, so that I can test ideas in real cases instead of debating them forever.**\\n\\n### 2) 更“模块化”的挂载型（每一段都是插件，想加就加）\\n\\n**I am a student from China, a second-year undergraduate, studying at ___ University, majoring in ___, based in ___, traveling mostly by plane, learning English for academic writing, working on ___ as my main project, collaborating with ___, constrained by ___, aiming to achieve ___, and documenting everything as a ledger so the results stay auditable.**\\n\\n### 3) 更口语但仍一口气挂到底\\n\\n**I’m a student from China, and I’m here on an F-1 visa, taking a heavy course load, spending most of my time in the lab or the library, flying back home during breaks when I can afford it, trying to turn abstract ideas into something testable, because I care less about explaining intelligence and more about using it reliably.**\\n\\n如果你告诉我你想挂载的“插件字段”（比如：城市/学校/专业/时间/目的/约束/目标），我可以把第2条直接替换成你的真实版本，做成你专用的“可插拔长句母版”。\\n\", \"remark\": \"\"}','{}','{\"score\": 0.0, \"reason\": [], \"remark\": \"\"}','{\"books\": [], \"schema_version\": 1}','{}','{}',1,'2026-02-20 03:10:25','2026-02-20 03:35:00'),(3,11,'{\"remark\": \"\", \"ledgerTopicId\": 1}','{\"remark\": \"\", \"question\": \"我只是举个结构的例子！\"}','{}','{\"answer\": \"明白，你不是要“学生/中国”这个内容，而是要**这种“主干 + 一串可挂载模块”的长句结构示例**。\\n\\n给你一条**完全结构化**、可以无限往后挂的长句（占位符版）：\\n\\n**挂载长句（占位符示例，仍然是一句完整句）**\\n`A is B, from X, arriving by Y, at T, for R, with C, under D, after E, despite F, aiming at G, which in turn affects H, while being judged by J, and leaving K as the observable record.`\\n\\n如果你想要更像“逗号插件全是短块”的极简口感（每块都能随时增删）：\\n\\n`A is B, from X, by Y, to P, at T, for R, with C, under D, against F, toward G, via M, per N.`\\n\\n再给一个“更自然英语但仍是挂载式”的版本（同样可无限加）：\\n\\n`A, being B, from X, traveled by Y to P at T for R, with C as support, under D as constraint, despite F as interference, to achieve G as the target, which is then checked against H as the baseline, leaving K as the final trace.`\\n\\n你如果要的是**某种固定风格**（更像法律条款 / 更像学术句 / 更像口语流水账），我也可以按那个风格再给一条同结构的。\\n\", \"remark\": \"\"}','{}','{\"score\": 0.0, \"reason\": [], \"remark\": \"\"}','{\"books\": [], \"schema_version\": 1}','{}','{}',1,'2026-02-20 03:13:02','2026-02-20 03:35:00'),(4,11,'{\"remark\": \"\", \"ledgerTopicId\": 1}','{\"remark\": \"\", \"question\": \"Mr. A was murdered at 11 p.m. on xx Street by three thieves from Brooklyn.看到了吗？\"}','{}','{\"answer\": \"看到了，你要的是这种**“主语 + 核心谓语 + 时间/地点/施事/来源…一串介词短语/状语挂载”**的一整个长句。\\n\\n给你一批同构的“一句话挂载句”（不涉及真实人物/犯罪，只是结构）：\\n\\n1. **A was transferred at T in P by S from X for R with C.**\\n2. **A was approved at T in P by S from X under D despite F, for R.**\\n3. **A was replaced at T on P by S from X after E, due to R, with C.**\\n4. **A was audited at T in P by S from X using M under N, against baseline H.**\\n5. **A was denied at T in P by S from X on grounds R, under policy D, with evidence C.**\\n\\n按你那句的更贴近版本（纯结构占位）：\\n\\n**Mr. A was [VERB-ed] at T on Street P by S from X, for R, with C, under D, despite F.**\\n\\n如果你要把它升级成“更能挂载、但仍一口气一句话”的版本：\\n\\n**Mr. A was [VERB-ed] at T on P by S from X, acting under D, using M, targeting R, leaving K as trace, which was later verified by O against baseline H.**\\n\", \"remark\": \"\"}','{}','{\"score\": 0.7, \"reason\": [\"这趟的答案命中了\", \"但是，我要的是尽可能长挂载，不加逗号这样的分隔符，而是关系连接词\"], \"remark\": \"\"}','{\"books\": [{\"rel\": \"adopt\", \"note\": \"\", \"weight\": 1.0, \"book_id\": 1}, {\"rel\": \"candidate\", \"note\": \"\", \"weight\": 0.3, \"book_id\": 7}], \"schema_version\": 1}','{}','{}',1,'2026-02-20 03:19:45','2026-02-20 03:35:00');
/*!40000 ALTER TABLE `ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `player_id` bigint unsigned NOT NULL COMMENT '这条sql是谁执行',
  `key_json` json NOT NULL DEFAULT (json_object()) COMMENT '检索key，动态扩展',
  `sql_text` mediumtext NOT NULL,
  `sql_hash` char(64) NOT NULL DEFAULT '0',
  `success` tinyint NOT NULL DEFAULT '1' COMMENT '默认执行成功',
  `error_message` text,
  `meta_json` json NOT NULL DEFAULT (json_object()),
  `remark` varchar(4096) NOT NULL DEFAULT '' COMMENT '备注',
  `remark_json` json DEFAULT (json_object()) COMMENT '备注：动态扩展',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_runlog_created` (`created_at`),
  KEY `idx_runlog_hash` (`sql_hash`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,1,'{}','测试','0',1,NULL,'{}','','{}','2026-02-13 16:13:15');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `pid` varchar(128) NOT NULL DEFAULT '' COMMENT '这个人的真实id',
  `address` varchar(128) NOT NULL DEFAULT '' COMMENT '这个人的具体地址,国家-州-地区，等等',
  `key_json` json NOT NULL DEFAULT (json_object()) COMMENT '检索key，动态扩展',
  `remark` varchar(4096) NOT NULL DEFAULT '',
  `remark_json` json DEFAULT (json_object()) COMMENT '备注,动态扩展',
  `status_id` int NOT NULL DEFAULT '1' COMMENT '默认刚生成/未审计',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'神','','','{}','测试','{}',1,'2026-02-15 16:37:28','2026-02-15 17:54:33'),(2,'系统治理玩家01','EK8258144','14011 Ash Ave Apt 1L 11355-2705','{}','','{}',1,'2026-02-15 01:26:24','2026-02-15 01:26:24'),(3,'系统治理玩家02','16046165','测试','{}','测试','{}',1,'2026-02-15 01:26:54','2026-02-15 01:28:54'),(4,'黑暗森林玩家','','','{}','测试','{}',1,'2026-02-15 01:27:20','2026-02-15 01:31:29'),(5,'意外因素玩家','','','{}','测试','{}',1,'2026-02-15 01:28:06','2026-02-15 01:31:29'),(6,'AI玩家','','','{}','测试','{}',1,'2026-02-15 01:28:54','2026-02-15 01:31:29'),(7,'环境玩家','','','{}','测试','{}',1,'2026-02-15 01:31:03','2026-02-15 01:31:03'),(8,'裁决型玩家(法律)','','','{}','测试','{}',1,'2026-02-15 01:32:22','2026-02-15 01:32:22'),(9,'基元玩家','021065','','{}','测试','{}',1,'2026-02-15 16:16:41','2026-02-15 16:16:41'),(11,'O2','EK8258144','中国-福建','{}','','{}',1,'2026-02-13 15:47:55','2026-02-15 17:54:27');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poker`
--

DROP TABLE IF EXISTS `poker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poker` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `player_id` bigint unsigned NOT NULL DEFAULT '0',
  `key_json` json NOT NULL DEFAULT (json_object()) COMMENT '由于把收集到的和自己拥有的统一成收集到的，当需要复用的时候，可以走keyjson,表明这是复用',
  `fake_json` json NOT NULL DEFAULT (json_object()) COMMENT '收集到的情报卡片',
  `player_remark_json` json NOT NULL DEFAULT (json_object()),
  `remark_json` json NOT NULL DEFAULT (json_object()) COMMENT '系统治理者的备注字段',
  `status_id` int unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='情报账本，只记录我收集到的假牌，包括我自己手里已经有的,一律当作不可信的牌，对，我自己手里的牌也有可能是假的，影响的只是赌博的权重,动机什么的，一律不考虑.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poker`
--

LOCK TABLES `poker` WRITE;
/*!40000 ALTER TABLE `poker` DISABLE KEYS */;
INSERT INTO `poker` VALUES (11,10,'{\"key\": [\"神\", \"宇宙\", \"智能\", \"宏观世界\", \"微观世界\"], \"remark\": \"神玩家出牌\"}','{}','{}','{}',2,'2026-02-15 16:40:54','2026-02-15 18:29:44'),(12,9,'{\"key\": [\"基元玩家\", \"基元模型\", \"基元蓝图\", \"约束集\", \"约束蓝图\", \"基元集+约束集\", \"基元集+约束蓝图\", \"基元蓝图+约束集\", \"基元蓝图+约束蓝图\"], \"remark\": \"基元玩家出牌\"}','{\"cards\": [{}]}','{}','{}',2,'2026-02-15 16:24:15','2026-02-15 18:30:08'),(13,12,'{\"key\": [\"智能\"], \"remark\": \"智能玩家出牌\"}','{}','{}','{}',2,'2026-02-15 18:14:19','2026-02-15 18:27:26'),(14,12,'{\"key\": [\"智能\"], \"remark\": \"智能玩家出牌\"}','{\"cards\": [{\"id\": 1, \"key\": \"赋予智能\", \"remark\": \"\"}], \"remark\": \"\"}','{}','{}',1,'2026-02-15 18:14:19','2026-02-15 18:18:10'),(15,10,'{\"key\": [\"神\", \"宇宙\", \"智能\", \"宏观世界\", \"微观世界\"], \"remark\": \"神玩家出牌\"}','{\"cards\": [{\"id\": 1, \"key\": \"除了我耶和华，不能有其他的神。\", \"remark\": \"\"}, {\"id\": 2, \"key\": \"认识神，是智慧的开端。\", \"remark\": \"\"}], \"remark\": \"\"}','{}','{}',1,'2026-02-15 16:40:54','2026-02-15 18:12:03'),(16,9,'{\"key\": [\"基元玩家\", \"基元模型\", \"基元蓝图\", \"约束集\", \"约束蓝图\", \"基元集+约束集\", \"基元集+约束蓝图\", \"基元蓝图+约束集\", \"基元蓝图+约束蓝图\"], \"remark\": \"基元玩家出牌\"}','{\"cards\": [{\"id\": 1, \"key\": \"基元蓝图+约束蓝图\", \"remark\": \"\"}], \"remark\": \"\"}','{}','{}',1,'2026-02-15 16:24:15','2026-02-15 18:24:43'),(17,0,'{\"key\": [\"多语言投影\"], \"remark\": \"多语言玩家\"}','{\"cards\": [{\"id\": 1, \"key\": \"智能分析多核\", \"remark\": \"\"}, {\"id\": 2, \"key\": \"误解成本优先于信息价值\", \"remark\": \"\"}, {\"id\": 9, \"key\": \"输出接口单核化，先锁歧义成本最高的轴，尽量同句挂载，减少焦点分裂\", \"remark\": \"\"}, {\"id\": 10, \"key\": \"显示化关系词\", \"remark\": \"\"}, {\"id\": 11, \"key\": \"挂载方案\", \"remark\": \"\"}], \"remark\": \"\"}','{}','{}',2,'2026-02-16 03:11:10','2026-02-16 03:37:08'),(18,1,'{\"key\": [\"短文案投影\"], \"remark\": \"短文案玩家\"}','{}','{}','{}',1,'2026-02-16 03:20:42','2026-02-16 03:23:13'),(19,0,'{\"key\": [\"多语言投影\"], \"remark\": \"多语言玩家\"}','{\"cards\": [{\"id\": 1, \"key\": \"智能分析多核\", \"remark\": \"\"}, {\"id\": 2, \"key\": \"误解成本优先于信息价值\", \"remark\": \"\"}, {\"id\": 9, \"key\": \"输出接口单核化，先锁歧义成本最高的轴，尽量同句挂载，减少焦点分裂\", \"remark\": \"\"}, {\"id\": 10, \"key\": \"显示化关系词\", \"remark\": \"\"}, {\"id\": 11, \"key\": \"挂载方案\", \"remark\": \"\"}, {\"id\": 12, \"key\": \"尽量同句挂载，减少焦点分裂\", \"remark\": \"\"}], \"remark\": \"\"}','{}','{}',1,'2026-02-16 03:11:10','2026-02-16 04:00:40');
/*!40000 ALTER TABLE `poker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-20  3:37:52
