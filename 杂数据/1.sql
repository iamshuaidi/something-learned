-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: 100.116.81.107    Database: dnspod
-- ------------------------------------------------------
-- Server version	5.6.28-cdb2016-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agent_applys`
--

DROP TABLE IF EXISTS `agent_applys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_applys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `apply_status` enum('verifying','verified','denied') DEFAULT 'verifying',
  `apply_time` datetime DEFAULT '0000-00-00 00:00:00',
  `verify_time` datetime DEFAULT '0000-00-00 00:00:00',
  `apply_reason` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1726 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_details`
--

DROP TABLE IF EXISTS `agent_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_details` (
  `user_id` int(11) unsigned NOT NULL,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_on` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_domainupgrades`
--

DROP TABLE IF EXISTS `agent_domainupgrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_domainupgrades` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) unsigned NOT NULL,
  `apply_status` enum('verifying','verified','denied') DEFAULT 'verifying',
  `apply_time` datetime DEFAULT '0000-00-00 00:00:00',
  `verify_time` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_users`
--

DROP TABLE IF EXISTS `agent_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `points` int(11) unsigned NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `dtei` (`agent_id`,`user_id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5267 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents` (
  `user_id` int(11) unsigned NOT NULL,
  `discount` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `points` int(11) unsigned NOT NULL DEFAULT '0',
  `balance_limit` enum('yes','no') DEFAULT 'yes' COMMENT '是否允许无限制提交订单',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anquanbao_pends`
--

DROP TABLE IF EXISTS `anquanbao_pends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anquanbao_pends` (
  `id` int(11) unsigned NOT NULL,
  `api` varchar(100) DEFAULT NULL,
  `data` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_by_email_white_list`
--

DROP TABLE IF EXISTS `api_by_email_white_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_by_email_white_list` (
  `id` bigint(20) unsigned NOT NULL,
  `uin` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uin` (`uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_tokens`
--

DROP TABLE IF EXISTS `api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `screen_token` varchar(100) NOT NULL,
  `store_token` varchar(100) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_whitelist` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `back_stage`
--

DROP TABLE IF EXISTS `back_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `back_stage` (
  `back_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(100) NOT NULL,
  `value` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`back_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7107898 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `balance_journals`
--

DROP TABLE IF EXISTS `balance_journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance_journals` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `action` enum('charge','pay','refund') NOT NULL,
  `bill_id` int(11) NOT NULL,
  `bank_id` varchar(6) DEFAULT NULL,
  `bank_deal_id` varchar(16) DEFAULT NULL,
  `value_rmb` varchar(11) DEFAULT NULL,
  `value_usd` varchar(11) DEFAULT NULL,
  `balance_rmb` varchar(11) DEFAULT NULL,
  `balance_usd` varchar(11) DEFAULT NULL,
  `happend_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15771 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `balances`
--

DROP TABLE IF EXISTS `balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balances` (
  `user_id` int(11) unsigned NOT NULL,
  `rmb` varchar(11) DEFAULT '0',
  `usd` varchar(11) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batch_details`
--

DROP TABLE IF EXISTS `batch_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_details` (
  `job_id` int(10) unsigned NOT NULL,
  `detail` mediumblob NOT NULL,
  PRIMARY KEY (`job_id`),
  CONSTRAINT `batch_details_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `batch_jobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batch_domain`
--

DROP TABLE IF EXISTS `batch_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned NOT NULL DEFAULT '0',
  `domains_str` text NOT NULL,
  `record_value` varchar(255) DEFAULT NULL COMMENT 'The value of the "A" record for "@" and "www"',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_id` (`job_id`),
  CONSTRAINT `batch_domain_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `batch_jobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=utf8 COMMENT='The batch jobs about domain addings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batch_jobs`
--

DROP TABLE IF EXISTS `batch_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `domain_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` enum('domain','record_add','record_modify','zone','record_replace') NOT NULL DEFAULT 'domain',
  `status` enum('error','ok','running','waiting') NOT NULL DEFAULT 'waiting',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of total sub jobs',
  `success` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of success',
  `fail` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of fail',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `status_type` (`status`,`id`,`type`),
  KEY `user_status` (`user_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1691090 DEFAULT CHARSET=utf8 COMMENT='The batch jobs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batch_record_add`
--

DROP TABLE IF EXISTS `batch_record_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_record_add` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned NOT NULL DEFAULT '0',
  `domain_id_str` text NOT NULL COMMENT 'All the domain ids separated by ,',
  `sub_domain_str` text NOT NULL COMMENT 'All the sub domains separated by ,',
  `area` varchar(500) NOT NULL DEFAULT '',
  `record_type` varchar(500) NOT NULL DEFAULT '',
  `ttl` varchar(500) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `mx` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_id` (`job_id`),
  CONSTRAINT `batch_record_add_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `batch_jobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8 COMMENT='The batch jobs about record addings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batch_record_modify`
--

DROP TABLE IF EXISTS `batch_record_modify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_record_modify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned NOT NULL DEFAULT '0',
  `record_id_str` text NOT NULL COMMENT 'All the record ids separated by ,',
  `edit_column` enum('sub_domain','record_type','area','value','mx','ttl','status') DEFAULT 'value' COMMENT 'Which column do you want to edit',
  `edit_to` varchar(255) NOT NULL DEFAULT '' COMMENT 'Change to ...',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_id` (`job_id`),
  CONSTRAINT `batch_record_modify_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `batch_jobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=514 DEFAULT CHARSET=utf8 COMMENT='The batch jobs about record edits';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batch_record_replace`
--

DROP TABLE IF EXISTS `batch_record_replace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_record_replace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned NOT NULL DEFAULT '0',
  `domain_id` int(11) unsigned NOT NULL DEFAULT '0',
  `sub_domain` varchar(255) NOT NULL,
  `areas` varchar(16383) NOT NULL,
  `record_str` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_id` (`job_id`),
  CONSTRAINT `batch_record_replace_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `batch_jobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='The batch jobs about record replacings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batch_zone`
--

DROP TABLE IF EXISTS `batch_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_zone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `string` mediumtext NOT NULL COMMENT 'The jsoned record info.',
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `batch_zone_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `batch_jobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='The batch job about zone file.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beian_queues`
--

DROP TABLE IF EXISTS `beian_queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beian_queues` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12301 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_details`
--

DROP TABLE IF EXISTS `bill_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `journal_number` varchar(32) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `domain_id` int(11) unsigned NOT NULL DEFAULT '0',
  `batch_info` varchar(1000) DEFAULT NULL,
  `grade` enum('Express','Extra','Ultra') NOT NULL DEFAULT 'Express',
  `domain_grade` enum('D_Free','D_Express','D_Plus','D_Extra','D_Expert','D_Ultra','DP_Free','DP_Plus','DP_Extra','DP_Expert','DP_Ultra') NOT NULL DEFAULT 'DP_Free',
  `term` varchar(10) NOT NULL,
  `term_step` enum('year','month') NOT NULL DEFAULT 'year',
  `term_length` smallint(6) NOT NULL DEFAULT '0',
  `invoice` enum('no','yes') NOT NULL DEFAULT 'yes',
  `delivery_price` tinyint(4) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `verify_status` enum('verifying','verified','deny','paid') DEFAULT 'verifying',
  `verify_by` varchar(100) DEFAULT NULL,
  `original_price` varchar(11) DEFAULT NULL,
  `price` varchar(11) DEFAULT NULL,
  `vip_price` varchar(11) DEFAULT NULL,
  `up_price` varchar(11) DEFAULT NULL,
  `gift_price` varchar(11) DEFAULT NULL,
  `reason` varchar(120) DEFAULT NULL,
  `extra` varchar(20) DEFAULT NULL,
  `coupon` varchar(300) DEFAULT NULL,
  `agent_id` int(11) unsigned DEFAULT NULL,
  `apply_ip` varchar(15) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `verified_on` datetime DEFAULT '0000-00-00 00:00:00',
  `paid_on` datetime DEFAULT '0000-00-00 00:00:00',
  `admin_up_remark` varchar(500) DEFAULT NULL,
  `classification` varchar(50) DEFAULT NULL COMMENT '订单的分类',
  PRIMARY KEY (`id`),
  UNIQUE KEY `journal_number` (`journal_number`),
  KEY `verify_status` (`verify_status`),
  KEY `journal_number_2` (`journal_number`),
  KEY `agent_id` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27616 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anonymousid` varchar(64) NOT NULL DEFAULT '',
  `userid` int(11) NOT NULL DEFAULT '0',
  `domain_name` varchar(128) NOT NULL DEFAULT '',
  `domain_tld` varchar(32) NOT NULL DEFAULT '',
  `price_rule_title` varchar(64) NOT NULL DEFAULT '',
  `price_rule_name` varchar(32) NOT NULL DEFAULT '',
  `op` varchar(16) NOT NULL DEFAULT '',
  `year` int(11) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  `real_price` int(11) NOT NULL DEFAULT '0',
  `coupon_code` varchar(64) NOT NULL DEFAULT '',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `anonymousid` (`anonymousid`)
) ENGINE=InnoDB AUTO_INCREMENT=63939 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cdn_records`
--

DROP TABLE IF EXISTS `cdn_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdn_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_id` int(10) unsigned NOT NULL,
  `appid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `host_id` int(10) unsigned DEFAULT NULL,
  `host` varchar(400) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `status_message` varchar(30) NOT NULL DEFAULT '',
  `deploy_status` enum('wait_open','open_deploying','deployed','wait_close','closed','auto_close','open_fail') NOT NULL DEFAULT 'wait_open',
  `cname` varchar(400) NOT NULL DEFAULT '',
  `origin` varchar(500) NOT NULL DEFAULT '',
  `origin_changed` enum('yes','no') NOT NULL DEFAULT 'no',
  `origin_type` enum('CNAME','A') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `record_id` (`record_id`),
  KEY `host_record` (`host_id`,`record_id`),
  KEY `appid` (`appid`),
  KEY `deploy_status_update_host_app` (`deploy_status`,`updated_at`,`host_id`,`appid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cdn_users`
--

DROP TABLE IF EXISTS `cdn_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdn_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `reg_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1:registered, 0:none_registered',
  `dev_check` tinyint(4) NOT NULL DEFAULT '0',
  `cdn_status` tinyint(4) NOT NULL DEFAULT '0',
  `cdn_paytype` varchar(20) NOT NULL DEFAULT '',
  `appid` bigint(20) unsigned DEFAULT NULL,
  `flag` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `key` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `value` varchar(8000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL DEFAULT '',
  `user_type` varchar(32) NOT NULL DEFAULT '',
  `contact_type` tinyint(4) NOT NULL DEFAULT '0',
  `email` varchar(128) NOT NULL DEFAULT '',
  `org` varchar(256) NOT NULL DEFAULT '',
  `org_first` varchar(32) NOT NULL DEFAULT '',
  `org_last` varchar(32) NOT NULL DEFAULT '',
  `org_cn` varchar(256) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `name_first` varchar(32) NOT NULL DEFAULT '',
  `name_last` varchar(32) NOT NULL DEFAULT '',
  `name_cn` varchar(64) NOT NULL DEFAULT '',
  `country` varchar(128) NOT NULL DEFAULT '',
  `country_cn` varchar(128) NOT NULL DEFAULT '',
  `province` varchar(128) NOT NULL DEFAULT '',
  `province_cn` varchar(128) NOT NULL DEFAULT '',
  `city` varchar(128) NOT NULL DEFAULT '',
  `city_cn` varchar(128) NOT NULL DEFAULT '',
  `street` varchar(256) NOT NULL DEFAULT '',
  `address1` varchar(128) NOT NULL DEFAULT '',
  `address2` varchar(128) NOT NULL DEFAULT '',
  `street_cn` varchar(256) NOT NULL DEFAULT '',
  `zipcode` varchar(16) NOT NULL DEFAULT '',
  `telphone` varchar(32) NOT NULL DEFAULT '',
  `fax` varchar(32) NOT NULL DEFAULT '',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `domain_id` int(11) DEFAULT NULL,
  `value` int(6) NOT NULL,
  `code` varchar(7) NOT NULL,
  `code_type` enum('personal','enterprise','discount','cash','experience','invite') DEFAULT NULL,
  `isact` enum('yes','no') DEFAULT 'no',
  `comment` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `expired_on` datetime DEFAULT '0000-00-00 00:00:00',
  `used_on` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dailydata_summary`
--

DROP TABLE IF EXISTS `dailydata_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dailydata_summary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(10) unsigned NOT NULL,
  `domain` varchar(200) NOT NULL,
  `dns` varchar(100) DEFAULT NULL,
  `type` enum('in','out') NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_date` (`type`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COMMENT='解析数据日报的汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnh_progress`
--

DROP TABLE IF EXISTS `dnh_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnh_progress` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dnh_key` varchar(200) DEFAULT NULL,
  `dnh_value` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnh_queue`
--

DROP TABLE IF EXISTS `dnh_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnh_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '2: enabled, 3: disabled, 6: to enable, 7: to disable, 4: enabling, 5: disabling',
  `worker_id` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `domain_id` (`domain_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnh_status`
--

DROP TABLE IF EXISTS `dnh_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnh_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(10) unsigned NOT NULL,
  `domain` varchar(200) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '0: ok, 1: error, 3: disabled, 4: enabling, 5: disabling',
  `appid` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_id` (`domain_id`),
  KEY `domain` (`domain`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnh_sync_queue`
--

DROP TABLE IF EXISTS `dnh_sync_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnh_sync_queue` (
  `id` bigint(20) unsigned NOT NULL,
  `uin` bigint(20) unsigned NOT NULL,
  `appid` bigint(20) unsigned NOT NULL,
  `action` enum('del_domain','add_domain','add_record','del_record','modify_record') NOT NULL,
  `domain` varchar(200) NOT NULL,
  `sub_domain` varchar(255) DEFAULT NULL,
  `record_value` varchar(255) DEFAULT NULL,
  `record_type` enum('A','CNAME') DEFAULT NULL,
  `status` enum('waiting','running','done','fail') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åŸŸåã€è®°å½•è¢« å¢žã€åˆ ã€æ”¹ åŽï¼Œ åŒæ­¥äº‘å®‰å…¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dns_server_status`
--

DROP TABLE IF EXISTS `dns_server_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dns_server_status` (
  `ip` varchar(15) NOT NULL,
  `server` varchar(25) NOT NULL,
  `status` enum('Available','Unavailable','Unknown') NOT NULL DEFAULT 'Unknown',
  `last_check` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `do_reg`
--

DROP TABLE IF EXISTS `do_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `do_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_id` varchar(50) NOT NULL DEFAULT '',
  `domain` varchar(128) NOT NULL DEFAULT '',
  `user_id` varchar(64) NOT NULL DEFAULT '0',
  `op_user_id` varchar(64) NOT NULL DEFAULT '',
  `app_id` int(11) unsigned NOT NULL DEFAULT '0',
  `action` varchar(32) NOT NULL DEFAULT '',
  `contact_id` varchar(128) NOT NULL DEFAULT '',
  `period` int(11) NOT NULL DEFAULT '0',
  `status` varchar(32) NOT NULL DEFAULT 'todo',
  `refund` varchar(28) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '1',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_id` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1195 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_acquire`
--

DROP TABLE IF EXISTS `domain_acquire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_acquire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_alexa_ranks`
--

DROP TABLE IF EXISTS `domain_alexa_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_alexa_ranks` (
  `domain_id` int(11) unsigned NOT NULL,
  `rank` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_aliases`
--

DROP TABLE IF EXISTS `domain_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_aliases` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) unsigned NOT NULL,
  `domain` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`),
  KEY `domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16045 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_apply_acquire`
--

DROP TABLE IF EXISTS `domain_apply_acquire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_apply_acquire` (
  `domain` varchar(200) NOT NULL,
  `apply_acquire_on` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`domain`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_details`
--

DROP TABLE IF EXISTS `domain_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_details` (
  `domain_id` int(11) unsigned NOT NULL DEFAULT '0',
  `password` varchar(32) DEFAULT NULL,
  `domain_type` varchar(30) DEFAULT NULL COMMENT '网站分类',
  `service` text COMMENT '域名包含服务',
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_on` datetime DEFAULT '0000-00-00 00:00:00',
  `dns` varchar(100) DEFAULT NULL,
  `dns_before` varchar(100) DEFAULT NULL COMMENT 'The DNS SERVER before transfer into DNSPod.',
  `dns_transfer_on` datetime DEFAULT NULL,
  `dns_transfer_out` datetime DEFAULT NULL,
  `expiration_date` date DEFAULT '0000-00-00',
  `remark` varchar(200) DEFAULT NULL,
  `registrar` char(200) DEFAULT NULL,
  `d_report` varchar(255) DEFAULT NULL COMMENT '该域名下有哪些子域名开启了D报表，多个子域名用逗号分隔',
  `classification` varchar(50) DEFAULT NULL COMMENT '典型用户的网站分类',
  `dns_count` bigint(12) unsigned DEFAULT NULL,
  `public_dns_count` bigint(12) unsigned DEFAULT NULL,
  `http_dns_count` bigint(12) unsigned DEFAULT NULL,
  `public_dns_qps` int(11) unsigned DEFAULT NULL,
  `http_dns_qps` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`domain_id`),
  KEY `created_on` (`created_on`),
  KEY `dns_transfer_out` (`dns_transfer_out`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_groups`
--

DROP TABLE IF EXISTS `domain_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1970 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_locks`
--

DROP TABLE IF EXISTS `domain_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_locks` (
  `domain_id` int(11) unsigned NOT NULL,
  `start_at` datetime DEFAULT '0000-00-00 00:00:00',
  `end_at` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_province`
--

DROP TABLE IF EXISTS `domain_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_province` (
  `domain_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_qproject`
--

DROP TABLE IF EXISTS `domain_qproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_qproject` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) unsigned NOT NULL,
  `type` enum('domain','sub_domain') NOT NULL,
  `sub_domain` varchar(200) DEFAULT NULL,
  `q_project_id` int(11) unsigned NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `q_domain` (`domain_id`,`sub_domain`)
) ENGINE=InnoDB AUTO_INCREMENT=1492 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_record_oldurls`
--

DROP TABLE IF EXISTS `domain_record_oldurls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_record_oldurls` (
  `record_id` int(11) unsigned NOT NULL DEFAULT '0',
  `domain_id` int(11) unsigned NOT NULL DEFAULT '0',
  `sub_domain` varchar(255) DEFAULT NULL,
  `area` varchar(16) NOT NULL DEFAULT '0',
  `record_type` enum('A','CNAME','MX','URL','NS','TXT','AAAA','SRV') DEFAULT 'A',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `domain_id` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_records`
--

DROP TABLE IF EXISTS `domain_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_records` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) unsigned NOT NULL DEFAULT '0',
  `sub_domain` varchar(255) DEFAULT NULL,
  `area` varchar(16) NOT NULL DEFAULT '0',
  `record_type` enum('A','CNAME','MX','URL','NS','TXT','AAAA','SRV','URL1') DEFAULT 'A',
  `ttl` int(11) DEFAULT '3600',
  `value` varchar(255) DEFAULT NULL,
  `enabled` enum('0','1') DEFAULT '1',
  `status` enum('new','pending','enabled','disabled','lock') DEFAULT 'enabled',
  `updated_on` datetime DEFAULT '0000-00-00 00:00:00',
  `extra` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `domain_id` (`domain_id`),
  KEY `enabled` (`enabled`),
  KEY `sub_domain` (`sub_domain`),
  KEY `value` (`value`),
  KEY `record_type` (`record_type`),
  KEY `dtei` (`sub_domain`,`area`,`enabled`,`domain_id`),
  KEY `area` (`area`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=13634140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_records_record_groups`
--

DROP TABLE IF EXISTS `domain_records_record_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_records_record_groups` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'Row id',
  `domain_id` bigint(11) NOT NULL DEFAULT '0' COMMENT 'Domain id',
  `record_id` bigint(11) NOT NULL DEFAULT '0' COMMENT 'Record id',
  `group_id` bigint(11) NOT NULL DEFAULT '0' COMMENT 'Group id',
  PRIMARY KEY (`id`),
  KEY `index_domain_id` (`domain_id`),
  KEY `index_record_id` (`record_id`),
  KEY `index_group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='Domain_records to_record_groups relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_report`
--

DROP TABLE IF EXISTS `domain_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_report` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `reporter_ip` varchar(15) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_share_pauses`
--

DROP TABLE IF EXISTS `domain_share_pauses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_share_pauses` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'Self incrementing id',
  `domain_id` bigint(11) NOT NULL DEFAULT '0' COMMENT 'Domain id',
  `sub_domain` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub domain',
  `user_id` bigint(11) NOT NULL DEFAULT '0',
  `mode` enum('r','rw') NOT NULL DEFAULT 'rw' COMMENT 'Mode',
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created time',
  PRIMARY KEY (`id`),
  KEY `index_domain_id` (`domain_id`),
  KEY `index_sub_domain` (`sub_domain`),
  KEY `index_user_id` (`user_id`),
  KEY `index_domain_id_sub_domain` (`domain_id`,`sub_domain`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='Domain share pauses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_share_pendings`
--

DROP TABLE IF EXISTS `domain_share_pendings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_share_pendings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) unsigned NOT NULL,
  `email` varchar(100) NOT NULL,
  `mode` enum('r','rw') NOT NULL DEFAULT 'rw',
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `sub_domain` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `dtei` (`domain_id`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_shares`
--

DROP TABLE IF EXISTS `domain_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_shares` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `mode` enum('r','rw') NOT NULL DEFAULT 'rw',
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `sub_domain` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_id_2` (`domain_id`,`user_id`,`sub_domain`),
  KEY `domain_id` (`domain_id`),
  KEY `user_id` (`user_id`),
  KEY `mode` (`mode`),
  KEY `dtei` (`domain_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20814 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_snapshot`
--

DROP TABLE IF EXISTS `domain_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_snapshot` (
  `domain_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `type` enum('snapshot','transfer') NOT NULL DEFAULT 'snapshot' COMMENT '老用户的域名快照、已经成功转入的域名',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `domain` varchar(200) NOT NULL,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_soas`
--

DROP TABLE IF EXISTS `domain_soas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_soas` (
  `domain_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ttl` int(11) DEFAULT '3600',
  `serial` varchar(10) DEFAULT '1191760784',
  `refresh` int(11) DEFAULT '3600',
  `retry` int(11) DEFAULT '900',
  `expire` int(11) DEFAULT '1209600',
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_spampend`
--

DROP TABLE IF EXISTS `domain_spampend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_spampend` (
  `domain_id` int(11) unsigned NOT NULL,
  `reason` varchar(1000) DEFAULT NULL,
  `created_on` date DEFAULT '0000-00-00',
  `end_at` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_url_permissions`
--

DROP TABLE IF EXISTS `domain_url_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_url_permissions` (
  `domain_id` int(11) DEFAULT NULL,
  `enabled` enum('0','1') DEFAULT '0',
  UNIQUE KEY `domain_id` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_vip_status`
--

DROP TABLE IF EXISTS `domain_vip_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_vip_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) DEFAULT '0',
  `vip_started_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vip_ended_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vip_changed` int(11) NOT NULL DEFAULT '0' COMMENT 'VIP更换域名次数',
  `auto_renew` enum('yes','no','default') DEFAULT 'default',
  `after_seller` varchar(200) DEFAULT NULL,
  `resource_id` varchar(20) NOT NULL DEFAULT '',
  `resource_status` int(11) NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `qcloud_uin` bigint(20) unsigned NOT NULL DEFAULT '0',
  `qcloud_appid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isolateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=556 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `domain` varchar(200) DEFAULT NULL,
  `sub_domains` int(11) unsigned DEFAULT '0',
  `exists` enum('yes','no') NOT NULL DEFAULT 'yes',
  `dnsfix` enum('yes','no') NOT NULL DEFAULT 'yes',
  `status` enum('enable','pause','spam','lock') DEFAULT 'enable',
  `vip_flag` enum('0','1') NOT NULL DEFAULT '0',
  `grade` enum('Free','Express','Extra','Ultra') NOT NULL DEFAULT 'Free',
  `domain_grade` enum('D_Free','D_Plus','D_Extra','D_Expert','D_Ultra','DP_Free','DP_Plus','DP_Extra','DP_Expert','DP_Ultra','DP_Local') NOT NULL DEFAULT 'DP_Free',
  `server` varchar(50) NOT NULL DEFAULT 'DP_Free' COMMENT 'DNS服务器',
  `error_page` enum('yes','no') NOT NULL DEFAULT 'yes',
  `searchengine_push` enum('yes','no') NOT NULL DEFAULT 'yes',
  `beian` enum('yes','no','pend') NOT NULL DEFAULT 'no',
  `group_id` int(11) unsigned NOT NULL DEFAULT '1',
  `is_mark` enum('yes','no') NOT NULL DEFAULT 'no',
  `ttl` int(6) unsigned DEFAULT '600',
  `cname_speedup` enum('enable','disable') DEFAULT 'disable',
  `ns_type` tinyint(4) DEFAULT '0' COMMENT '新网ns类型，0为dp的',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`),
  KEY `user_id` (`user_id`),
  KEY `vip_flag` (`vip_flag`),
  KEY `grade` (`grade`),
  KEY `domain_grade` (`domain_grade`),
  KEY `status_fix` (`status`,`dnsfix`),
  KEY `dnsfix` (`dnsfix`)
) ENGINE=InnoDB AUTO_INCREMENT=12609465 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_banners`
--

DROP TABLE IF EXISTS `event_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_banners` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `link` text,
  `img` varchar(100) NOT NULL,
  `color` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `begin_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_coupons`
--

DROP TABLE IF EXISTS `event_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_coupons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `key` varchar(100) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `stype` varchar(20) NOT NULL,
  `code_for` varchar(20) DEFAULT 'activity',
  `code_type` varchar(20) NOT NULL,
  `value` varchar(20) NOT NULL,
  `new_grade` varchar(20) DEFAULT NULL,
  `old_grade` varchar(20) DEFAULT NULL,
  `is_new` varchar(20) DEFAULT NULL,
  `is_renew` varchar(20) DEFAULT NULL,
  `is_personal` varchar(20) DEFAULT NULL,
  `is_enterprise` varchar(20) DEFAULT NULL,
  `min_price` int(11) DEFAULT NULL,
  `remark` varchar(100) NOT NULL,
  `activated_on` datetime NOT NULL,
  `expired_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_files`
--

DROP TABLE IF EXISTS `event_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_page_id` int(11) NOT NULL,
  `file_type` varchar(10) NOT NULL,
  `link` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_gifts`
--

DROP TABLE IF EXISTS `event_gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_gifts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event` varchar(30) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `type` enum('auto','manual') NOT NULL DEFAULT 'manual',
  `extra` varchar(30) DEFAULT NULL,
  `status` enum('unused','used','invalid') NOT NULL DEFAULT 'unused',
  `content` varchar(200) DEFAULT NULL,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `expired_on` datetime DEFAULT '0000-00-00 00:00:00',
  `used_on` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `deti` (`event`,`user_id`,`type`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5611 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_info`
--

DROP TABLE IF EXISTS `event_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `status` varchar(10) NOT NULL,
  `owner` varchar(100) NOT NULL,
  `begin_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `remark` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_limits`
--

DROP TABLE IF EXISTS `event_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_limits` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `event_id` int(11) NOT NULL,
  `limit_num` int(11) NOT NULL,
  `limit_type` varchar(10) NOT NULL,
  `limit_param` varchar(5000) DEFAULT NULL,
  `limit_time` varchar(100) NOT NULL,
  `limit_notice` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_pages`
--

DROP TABLE IF EXISTS `event_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `key` varchar(100) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `begin_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_pland`
--

DROP TABLE IF EXISTS `event_pland`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_pland` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sign_time` date DEFAULT NULL,
  `scale` varchar(10) DEFAULT NULL,
  `domain` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `genre` varchar(10) DEFAULT NULL,
  `img` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `rgno` varchar(255) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `qq` int(11) DEFAULT NULL,
  `introduce` text,
  `status` varchar(10) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_email` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `coupons` varchar(20) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_pland_gift`
--

DROP TABLE IF EXISTS `event_pland_gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_pland_gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gift` varchar(20) NOT NULL,
  `form_id` int(11) DEFAULT NULL,
  `account` varchar(200) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(500) NOT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `page` varchar(200) NOT NULL,
  `product` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `four_year_game_score`
--

DROP TABLE IF EXISTS `four_year_game_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `four_year_game_score` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `game_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `game_end` datetime DEFAULT NULL,
  `score` varchar(30) DEFAULT '0',
  `begin_ip` varchar(15) NOT NULL,
  `end_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_end` (`game_end`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `four_year_pray_wall`
--

DROP TABLE IF EXISTS `four_year_pray_wall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `four_year_pray_wall` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `nick` varchar(20) NOT NULL,
  `content` varchar(512) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hidden_url_scan`
--

DROP TABLE IF EXISTS `hidden_url_scan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hidden_url_scan` (
  `record_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '记录ID编号',
  `value` varchar(255) DEFAULT NULL COMMENT '转发到的URL',
  `title` varchar(1000) DEFAULT NULL COMMENT '转发到的URL的title信息',
  `created_on` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `updated_on` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '上次更新时间',
  UNIQUE KEY `record_id` (`record_id`),
  KEY `created_on` (`created_on`),
  KEY `updated_on` (`updated_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `httpdns_form`
--

DROP TABLE IF EXISTS `httpdns_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpdns_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `company` varchar(100) NOT NULL,
  `rate` int(11) NOT NULL,
  `domains` text NOT NULL,
  `remark` text,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `index_data`
--

DROP TABLE IF EXISTS `index_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_data` (
  `data` varchar(16) DEFAULT NULL,
  `data_year` varchar(20) DEFAULT NULL,
  `data_current` varchar(16) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invite_codes`
--

DROP TABLE IF EXISTS `invite_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invite_codes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `code` varchar(7) NOT NULL,
  `code_trial` enum('yes','no') NOT NULL DEFAULT 'no',
  `comment` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `expired_on` datetime DEFAULT '0000-00-00 00:00:00',
  `used_on` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2027 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invite_queues`
--

DROP TABLE IF EXISTS `invite_queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invite_queues` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `ip_addr` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16814 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ip_area`
--

DROP TABLE IF EXISTS `ip_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) unsigned NOT NULL DEFAULT '0',
  `area_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL COMMENT '自定义段的名称',
  `area` varchar(50) NOT NULL COMMENT 'IP段',
  PRIMARY KEY (`id`),
  KEY `domain_key` (`domain_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`(191))
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `journal_snapshot`
--

DROP TABLE IF EXISTS `journal_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_snapshot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_id` varchar(50) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_type` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `org` varchar(256) NOT NULL DEFAULT '',
  `org_cn` varchar(256) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `name_cn` varchar(64) NOT NULL DEFAULT '',
  `country` varchar(128) NOT NULL DEFAULT '',
  `country_cn` varchar(128) NOT NULL DEFAULT '',
  `province` varchar(128) NOT NULL DEFAULT '',
  `province_cn` varchar(128) NOT NULL DEFAULT '',
  `city` varchar(128) NOT NULL DEFAULT '',
  `city_cn` varchar(128) NOT NULL DEFAULT '',
  `street` varchar(256) NOT NULL DEFAULT '',
  `street_cn` varchar(256) NOT NULL DEFAULT '',
  `zipcode` varchar(16) NOT NULL DEFAULT '',
  `telphone` varchar(32) NOT NULL DEFAULT '',
  `fax` varchar(32) NOT NULL DEFAULT '',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=681 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `limit_groups`
--

DROP TABLE IF EXISTS `limit_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `limit_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) unsigned NOT NULL,
  `limit_type` varchar(50) NOT NULL,
  `limit_number` int(11) NOT NULL,
  `started_at` date DEFAULT '0000-00-00',
  `ended_at` date DEFAULT '0000-00-00',
  `resource_id` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  KEY `limit_type` (`limit_type`)
) ENGINE=InnoDB AUTO_INCREMENT=589270 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marketcount_data`
--

DROP TABLE IF EXISTS `marketcount_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketcount_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) DEFAULT NULL,
  `action` varchar(200) NOT NULL,
  `crumbs` text,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5555 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marketcount_orders`
--

DROP TABLE IF EXISTS `marketcount_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketcount_orders` (
  `id` int(11) NOT NULL,
  `channel` varchar(10) NOT NULL,
  `product_type` varchar(10) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `sub_num` int(11) NOT NULL,
  `pay_num` int(11) NOT NULL,
  `total_money` int(11) NOT NULL,
  `pay_money` int(11) NOT NULL,
  `coupon_num` int(11) NOT NULL,
  `coupon_money` int(11) NOT NULL,
  `create_date` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marketcount_rule`
--

DROP TABLE IF EXISTS `marketcount_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketcount_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(1000) NOT NULL,
  `form` varchar(1000) NOT NULL,
  `category` varchar(200) NOT NULL,
  `remark` varchar(5000) NOT NULL,
  `extend` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merry_event`
--

DROP TABLE IF EXISTS `merry_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merry_event` (
  `user_id` int(11) unsigned NOT NULL,
  `email` varchar(100) NOT NULL,
  `date` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `value` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=5319 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_list`
--

DROP TABLE IF EXISTS `message_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `send_to` varchar(50) NOT NULL,
  `send_time` datetime DEFAULT '0000-00-00 00:00:00',
  `title` varchar(500) NOT NULL,
  `category` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_status`
--

DROP TABLE IF EXISTS `message_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `mes_user_id` (`user_id`,`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_downs`
--

DROP TABLE IF EXISTS `monitor_downs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_downs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` varchar(36) NOT NULL,
  `parent_id` varchar(36) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `domain_id` int(11) unsigned NOT NULL,
  `domain` varchar(100) NOT NULL,
  `sub_domain` varchar(100) NOT NULL,
  `record_line` varchar(100) NOT NULL,
  `ip` varchar(100) NOT NULL COMMENT '监控记录,兼容A记录和CNAME',
  `warn_reason` varchar(1000) DEFAULT NULL,
  `switch_log` varchar(1000) DEFAULT NULL,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_on` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `monitor_id` (`monitor_id`),
  KEY `user_id` (`user_id`),
  KEY `domain` (`domain`),
  KEY `domain_id` (`domain_id`),
  KEY `idx_user_id_created_on` (`user_id`,`created_on`),
  KEY `monitorid_updatedon` (`monitor_id`,`updated_on`)
) ENGINE=InnoDB AUTO_INCREMENT=33557853 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_items`
--

DROP TABLE IF EXISTS `monitor_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_items` (
  `monitor_id` varchar(36) NOT NULL,
  `parent_id` varchar(36) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `domain` varchar(100) NOT NULL,
  `record_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sub_domain` varchar(100) NOT NULL,
  `record_line` varchar(10) NOT NULL,
  `ip` varchar(200) NOT NULL COMMENT '监控记录,兼容A记录和CNAME',
  `now_ip` varchar(200) DEFAULT NULL,
  `host` varchar(200) NOT NULL,
  `port` varchar(5) NOT NULL,
  `monitor_type` varchar(10) NOT NULL,
  `monitor_path` varchar(200) DEFAULT NULL,
  `monitor_interval` int(10) unsigned NOT NULL,
  `points` varchar(1000) DEFAULT NULL,
  `bak_ip` varchar(1000) DEFAULT NULL,
  `status` enum('Ok','Warn','Down') DEFAULT 'Ok',
  `status_code` varchar(10) DEFAULT '200',
  `sms_notice` varchar(1000) DEFAULT NULL,
  `email_notice` varchar(1000) DEFAULT NULL,
  `weixin_notice` varchar(1000) DEFAULT NULL,
  `less_notice` enum('yes','no') DEFAULT 'no',
  `callback_url` varchar(1000) DEFAULT NULL,
  `callback_key` varchar(100) DEFAULT NULL,
  `monitor_status` enum('enabled','disabled') DEFAULT 'enabled',
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_on` datetime DEFAULT '0000-00-00 00:00:00',
  `down_id` int(11) unsigned DEFAULT NULL,
  `last_ok` datetime DEFAULT '0000-00-00 00:00:00',
  `last_down` datetime DEFAULT '0000-00-00 00:00:00',
  `delay_notify` int(4) DEFAULT '0',
  `extension` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`monitor_id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  KEY `domain_id` (`domain_id`),
  KEY `record_id` (`record_id`),
  KEY `domain` (`domain`),
  KEY `sub_domain` (`sub_domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_pends`
--

DROP TABLE IF EXISTS `monitor_pends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_pends` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api` varchar(100) DEFAULT NULL,
  `data` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7200 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_status_change`
--

DROP TABLE IF EXISTS `monitor_status_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_status_change` (
  `domain_id` int(10) unsigned NOT NULL,
  `sub_domain` varchar(100) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `last_ok` datetime DEFAULT '0000-00-00 00:00:00',
  `last_down` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`domain_id`,`sub_domain`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nosql`
--

DROP TABLE IF EXISTS `nosql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nosql` (
  `key` varchar(100) NOT NULL,
  `value` text,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notice_limit`
--

DROP TABLE IF EXISTS `notice_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_limit` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '该用户剩余的邮件提醒数量',
  `weixin` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '该用户剩余的微信提醒数量',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `oauth_token` varchar(40) NOT NULL,
  `client_id` int(5) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `expires` int(11) NOT NULL,
  `scope` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oauth_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `code` varchar(40) NOT NULL,
  `client_id` int(5) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `redirect_uri` varchar(200) NOT NULL,
  `expires` int(11) NOT NULL,
  `scope` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `client_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `client_secret` varchar(64) NOT NULL,
  `redirect_uri` varchar(255) NOT NULL,
  `app_index` varchar(255) NOT NULL,
  `app_name` char(30) NOT NULL,
  `owner_id` int(11) unsigned NOT NULL DEFAULT '0',
  `client_secret_cpt` char(64) NOT NULL,
  `scope` varchar(255) NOT NULL,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `ip_list` varchar(1000) DEFAULT NULL COMMENT 'IP白名单',
  `config` varchar(1000) DEFAULT NULL COMMENT '应用的一些配置，比如说access_token过期时间等等',
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `app_name` (`app_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10015 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_grants`
--

DROP TABLE IF EXISTS `oauth_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_grants` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(5) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `domain_id` int(11) unsigned DEFAULT NULL,
  `record_id` int(11) unsigned DEFAULT NULL,
  `monitor_id` varchar(36) DEFAULT NULL,
  `status` enum('enable','disable') DEFAULT 'enable',
  `grant_type` enum('domain','record','user','monitor') DEFAULT 'domain',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` int(5) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `expires` int(11) NOT NULL,
  `scope` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `old_balance`
--

DROP TABLE IF EXISTS `old_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_balance` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT 'User id',
  `balance` bigint(11) NOT NULL DEFAULT '0' COMMENT 'Balance',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Old balance';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oplogs`
--

DROP TABLE IF EXISTS `oplogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oplogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `domain_id` int(11) NOT NULL DEFAULT '0',
  `action` varchar(8000) NOT NULL DEFAULT '',
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33086 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `out_deny`
--

DROP TABLE IF EXISTS `out_deny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `out_deny` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `value` varchar(100) NOT NULL,
  `deny_type` int(11) unsigned NOT NULL,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partners_event_gift`
--

DROP TABLE IF EXISTS `partners_event_gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partners_event_gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick` varchar(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `gift_num` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `message` text,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `price_rules`
--

DROP TABLE IF EXISTS `price_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `tld` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(64) NOT NULL DEFAULT '',
  `op` varchar(16) NOT NULL DEFAULT '',
  `year` int(11) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  `real_price` float NOT NULL DEFAULT '0',
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1202 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qcloud_bills`
--

DROP TABLE IF EXISTS `qcloud_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qcloud_bills` (
  `callback_id` bigint(12) unsigned NOT NULL,
  `journal_id` varchar(32) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `stype` varchar(20) NOT NULL,
  `service` varchar(32) NOT NULL,
  `number` int(5) unsigned NOT NULL DEFAULT '1',
  `domain` varchar(200) DEFAULT NULL,
  `term` varchar(20) DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `qcloud_status` varchar(30) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `change_log` text,
  PRIMARY KEY (`callback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qcloud_cvm`
--

DROP TABLE IF EXISTS `qcloud_cvm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qcloud_cvm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `region` varchar(20) NOT NULL,
  `type` enum('enable','temp') DEFAULT 'enable',
  `instanceId` varchar(100) DEFAULT NULL,
  `tempInstanceId` varchar(100) DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instanceId` (`instanceId`,`tempInstanceId`),
  KEY `region_user_id` (`region`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=708 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qcloud_login_status`
--

DROP TABLE IF EXISTS `qcloud_login_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qcloud_login_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `token` varchar(100) NOT NULL,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `expires` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record_groups`
--

DROP TABLE IF EXISTS `record_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_groups` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'Group id',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT 'User id',
  `domain_id` bigint(11) NOT NULL DEFAULT '0' COMMENT 'Domain id',
  `group_name` varchar(128) NOT NULL DEFAULT '' COMMENT 'Group name',
  `group_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'Group type',
  PRIMARY KEY (`id`),
  KEY `index_user_id_domain_id` (`user_id`,`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='Record groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record_line`
--

DROP TABLE IF EXISTS `record_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_line` (
  `key` varchar(6) NOT NULL,
  `place` varchar(30) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record_line_group`
--

DROP TABLE IF EXISTS `record_line_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_line_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) unsigned NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `lines` text NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `line_name` (`domain_id`,`name`),
  KEY `domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2312 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record_remark`
--

DROP TABLE IF EXISTS `record_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_remark` (
  `record_id` int(11) unsigned NOT NULL,
  `domain_id` int(11) unsigned NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `domain_id` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_anguan_domain`
--

DROP TABLE IF EXISTS `report_anguan_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_anguan_domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) NOT NULL DEFAULT '',
  `status` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '标记是否有效，status为1表示有效，0表示无效',
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上报给安管的域名';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `server_status`
--

DROP TABLE IF EXISTS `server_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_status` (
  `id` int(11) unsigned NOT NULL,
  `domain` varchar(25) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `status` enum('ok','failed') NOT NULL DEFAULT 'ok',
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户的ID编号',
  `stype` enum('package','item','tpart') NOT NULL DEFAULT 'package',
  `domain` varchar(200) DEFAULT NULL,
  `domain_grade` enum('DP_Plus','DP_Extra','DP_Expert','DP_Ultra') DEFAULT NULL,
  `service_name` varchar(30) DEFAULT NULL,
  `number` int(8) unsigned DEFAULT NULL,
  `term` varchar(30) NOT NULL,
  `checked` enum('yes','no') DEFAULT 'yes',
  `coupon` varchar(200) DEFAULT NULL,
  `item_price` int(8) unsigned DEFAULT '0',
  `origin_price` int(8) unsigned DEFAULT '0',
  `price` int(8) unsigned DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `extra` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1798 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_balances`
--

DROP TABLE IF EXISTS `sms_balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_balances` (
  `user_id` int(11) unsigned NOT NULL,
  `sms` varchar(11) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_fromenabled`
--

DROP TABLE IF EXISTS `sms_fromenabled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_fromenabled` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `from_id` int(11) unsigned NOT NULL,
  `type` enum('sms','email') NOT NULL DEFAULT 'sms',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `from_id` (`from_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=375878 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spam_domains`
--

DROP TABLE IF EXISTS `spam_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spam_domains` (
  `domain` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subdomain_soa`
--

DROP TABLE IF EXISTS `subdomain_soa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdomain_soa` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) unsigned NOT NULL,
  `sub_domain` varchar(255) NOT NULL,
  `status` enum('enable','disable') DEFAULT 'enable',
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fulldomain` (`domain_id`,`sub_domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sucop_scan`
--

DROP TABLE IF EXISTS `sucop_scan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucop_scan` (
  `user_id` int(11) unsigned NOT NULL,
  `remain_scan` int(3) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_queues`
--

DROP TABLE IF EXISTS `sync_queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_queues` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `grade` varchar(12) NOT NULL DEFAULT 'D_Free',
  `action` enum('update','remove','aip_update','isp_update','module','tlds','level_down') NOT NULL DEFAULT 'update',
  `domain` varchar(255) NOT NULL,
  `value` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `extra` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137973859 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_queues_tmp`
--

DROP TABLE IF EXISTS `sync_queues_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_queues_tmp` (
  `id` bigint(11) unsigned NOT NULL,
  `grade` varchar(12) NOT NULL DEFAULT 'D_Free',
  `action` enum('update','remove','aip_update','isp_update','module','tlds') NOT NULL DEFAULT 'update',
  `domain` varchar(255) NOT NULL,
  `value` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_queues_url`
--

DROP TABLE IF EXISTS `sync_queues_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_queues_url` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `grade` varchar(12) NOT NULL DEFAULT 'D_Free',
  `action` enum('update','remove') NOT NULL DEFAULT 'update',
  `domain` varchar(255) NOT NULL,
  `value` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1218130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tld_msgs`
--

DROP TABLE IF EXISTS `tld_msgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tld_msgs` (
  `tld` varchar(20) NOT NULL DEFAULT '',
  `message` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tld`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlds`
--

DROP TABLE IF EXISTS `tlds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlds` (
  `tld` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`tld`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trade_flow`
--

DROP TABLE IF EXISTS `trade_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade_flow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('create','renew','modify','isolate','destroy') NOT NULL COMMENT '异步任务类型',
  `productType` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '资源类型: 1:dns_package, 2:cert, 3:httpdns, 4:light_hosting',
  `uin` bigint(20) unsigned NOT NULL DEFAULT '0',
  `dealName` varchar(16) NOT NULL DEFAULT '',
  `resourceId` varchar(20) DEFAULT NULL COMMENT '资源ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '任务状态： 1等待中 2进行中 3失败 4成功',
  `goodsDetail` varchar(500) DEFAULT NULL COMMENT '订单详情',
  `try_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `insertTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_resource_type` (`resourceId`,`type`,`dealName`),
  KEY `idx_st_retry` (`status`,`try_times`)
) ENGINE=InnoDB AUTO_INCREMENT=4061 DEFAULT CHARSET=utf8 COMMENT='计费资源异步信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trade_vip_deals`
--

DROP TABLE IF EXISTS `trade_vip_deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade_vip_deals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dealId` int(10) unsigned NOT NULL,
  `dealName` bigint(20) unsigned DEFAULT NULL,
  `bigDealId` bigint(20) unsigned DEFAULT NULL,
  `goodsCategoryId` int(10) unsigned DEFAULT NULL,
  `pid` int(10) unsigned DEFAULT NULL,
  `old_pid` int(10) unsigned DEFAULT NULL,
  `goodsDetail` varchar(1024) DEFAULT NULL,
  `ownerUin` bigint(20) unsigned DEFAULT NULL,
  `platform` tinyint(4) DEFAULT NULL,
  `regionId` tinyint(4) DEFAULT NULL,
  `appId` int(10) unsigned DEFAULT NULL,
  `goodsNum` int(10) unsigned DEFAULT NULL,
  `goodsPrice` varchar(1024) DEFAULT NULL,
  `creater` bigint(20) DEFAULT NULL,
  `creatTime` datetime DEFAULT NULL,
  `overdueTime` datetime DEFAULT NULL,
  `payer` bigint(20) DEFAULT NULL,
  `billId` varchar(255) DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `cartRecId` int(11) DEFAULT NULL,
  `payStartTime` datetime DEFAULT NULL,
  `payEndTime` datetime DEFAULT NULL,
  `taskStartTime` datetime DEFAULT NULL,
  `taskEndTime` datetime DEFAULT NULL,
  `taskDetail` varchar(2048) DEFAULT NULL,
  `resourceId` varchar(128) DEFAULT NULL,
  `status` tinyint(3) unsigned DEFAULT NULL,
  `reserved` int(11) DEFAULT NULL,
  `retry` int(11) DEFAULT NULL,
  `reportFlag` int(11) DEFAULT NULL,
  `payMode` tinyint(4) DEFAULT NULL,
  `voucherDecline` varchar(255) DEFAULT NULL,
  `voucherId` varchar(255) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `payerMode` tinyint(4) DEFAULT NULL,
  `agentPayer` bigint(20) DEFAULT NULL,
  `dealType` tinyint(4) DEFAULT NULL,
  `activityId` int(11) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `ticket` varchar(255) DEFAULT NULL,
  `goodsExpiredTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `zoneId` int(11) DEFAULT NULL,
  `providerOwnerUin` int(10) unsigned DEFAULT NULL,
  `totalCost` int(11) DEFAULT NULL,
  `realTotalCost` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `dealPayType` int(11) DEFAULT NULL,
  `productCode` varchar(255) DEFAULT NULL,
  `subProductCode` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `voucherTradeId` varchar(1024) DEFAULT NULL,
  `payTradeId` varchar(1024) DEFAULT NULL,
  `refundPayer` varchar(1024) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_deal_key` (`ownerUin`,`dealId`,`dealName`,`bigDealId`),
  KEY `idx_product_key` (`goodsCategoryId`,`pid`,`resourceId`)
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) NOT NULL DEFAULT '',
  `passwd` varchar(50) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `trans_status` varchar(32) NOT NULL DEFAULT '',
  `action` varchar(32) NOT NULL DEFAULT '',
  `remark` varchar(128) NOT NULL DEFAULT '',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `two_step_codes`
--

DROP TABLE IF EXISTS `two_step_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `two_step_codes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `code` char(70) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=571 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uin_limit`
--

DROP TABLE IF EXISTS `uin_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uin_limit` (
  `id` bigint(20) unsigned NOT NULL,
  `uin` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uin` (`uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `upfile`
--

DROP TABLE IF EXISTS `upfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `domain_id` int(11) NOT NULL DEFAULT '0',
  `file_type` varchar(45) NOT NULL DEFAULT '',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `content_type` varchar(64) NOT NULL DEFAULT '',
  `img` mediumblob NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `certificate_code` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_callpin`
--

DROP TABLE IF EXISTS `user_callpin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_callpin` (
  `user_id` int(11) unsigned NOT NULL,
  `callpin` varchar(6) NOT NULL,
  `status` enum('enabled','disabled') DEFAULT 'enabled',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `callpin` (`callpin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details` (
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned DEFAULT NULL,
  `real_name` varchar(30) DEFAULT NULL,
  `user_type` enum('personal','enterprise') NOT NULL DEFAULT 'personal',
  `industry` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'è¡Œä¸š',
  `telephone` varchar(30) DEFAULT NULL,
  `nick` varchar(10) DEFAULT NULL,
  `im` varchar(30) DEFAULT NULL,
  `id_card` varchar(18) DEFAULT NULL,
  `reg_ip` varchar(15) DEFAULT NULL,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `tel_verified` enum('yes','no') NOT NULL DEFAULT 'no',
  `tel_code` varchar(6) DEFAULT NULL,
  `email_verified` enum('yes','no') NOT NULL DEFAULT 'no',
  `first_verified` enum('enabled','pending') NOT NULL DEFAULT 'enabled',
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_grade` enum('D_Free','D_Plus','D_Extra','D_Expert','D_Ultra','DP_Free','DP_Plus','DP_Extra','DP_Expert','DP_Ultra') NOT NULL DEFAULT 'DP_Free',
  `is_key` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT '大客户',
  `selling_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '负责销售',
  `notice_deny` varchar(1000) NOT NULL DEFAULT '{"email":"","sms":"8"}',
  `get_deny` enum('yes','no') NOT NULL DEFAULT 'yes',
  `iMessage` varchar(100) DEFAULT NULL,
  `iMessage_verified` enum('yes','no','verifing') DEFAULT 'no',
  `website` varchar(200) DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT 'ç”¨æˆ·æ ‡è®°',
  `updated_on` datetime DEFAULT NULL COMMENT 'ç”¨æˆ·èµ„æ–™æœ€åŽä¿®æ”¹æ—¶é—´',
  PRIMARY KEY (`user_id`),
  KEY `reg_ip` (`reg_ip`),
  KEY `realname` (`real_name`),
  KEY `user_type` (`user_type`),
  KEY `iMessage` (`iMessage`),
  KEY `is_key` (`is_key`),
  KEY `selling_id` (`selling_id`),
  KEY `created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_details_v2`
--

DROP TABLE IF EXISTS `user_details_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details_v2` (
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `avatar_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户头像id',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户详情表v2';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_login_journals`
--

DROP TABLE IF EXISTS `user_login_journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_journals` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `email` varchar(100) NOT NULL,
  `ip_addr` varchar(15) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3225840 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_notify`
--

DROP TABLE IF EXISTS `user_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `user_name` varchar(16) NOT NULL COMMENT 'ç”¨æˆ·å§“å',
  `default` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'æ˜¯å¦é»˜è®¤æ¡ç›®',
  `detail` int(10) unsigned NOT NULL COMMENT 'é€šçŸ¥å†…å®¹: ç™»å½•ã€Dç›‘æŽ§ç­‰æ¡ç›®',
  `notify_mobile` varchar(16) DEFAULT NULL COMMENT 'æ‰‹æœºå·',
  `notify_email` varchar(100) DEFAULT NULL COMMENT 'é‚®ç®±',
  `notify_weixin` varchar(30) DEFAULT NULL COMMENT 'å¾®ä¿¡è´¦å·',
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_default` (`user_id`,`default`)
) ENGINE=InnoDB AUTO_INCREMENT=1697 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_req_limits`
--

DROP TABLE IF EXISTS `user_req_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_req_limits` (
  `id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `limit_period` int(10) unsigned NOT NULL,
  `limit_count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tokens` (
  `user_id` int(11) unsigned NOT NULL,
  `token` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_visits`
--

DROP TABLE IF EXISTS `user_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_visits` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `want_upgrade` enum('yes','no') NOT NULL DEFAULT 'no',
  `comment` varchar(200) DEFAULT NULL,
  `happend_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL,
  `status` enum('enabled','disabled','pending') NOT NULL DEFAULT 'pending',
  `version` tinyint(3) unsigned DEFAULT NULL,
  `secret_key` char(64) DEFAULT '',
  `qq` bigint(20) unsigned DEFAULT NULL COMMENT '�û�QQ�ţ�����ptlogin��½',
  `qcloud_uin` bigint(20) unsigned DEFAULT NULL,
  `app_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `qq` (`qq`),
  UNIQUE KEY `qcloud_uin` (`qcloud_uin`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5299592 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weibo_records`
--

DROP TABLE IF EXISTS `weibo_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weibo_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `come_from` enum('sina','qq') NOT NULL DEFAULT 'qq',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weixin_details`
--

DROP TABLE IF EXISTS `weixin_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixin_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `province` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `language` varchar(30) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `subscribe` int(11) unsigned NOT NULL,
  `user` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `timezone` varchar(30) DEFAULT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `whois_servers`
--

DROP TABLE IF EXISTS `whois_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whois_servers` (
  `tld` varchar(20) NOT NULL DEFAULT '',
  `server` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tld`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wooyun`
--

DROP TABLE IF EXISTS `wooyun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wooyun` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `raw_id` int(11) unsigned NOT NULL DEFAULT '0',
  `domain` varchar(200) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` int(3) DEFAULT '0',
  `user_harmlevel` int(3) DEFAULT '0',
  `corp_harmlevel` int(3) DEFAULT '0',
  `corp_rank` int(3) DEFAULT '0',
  `comment` int(5) unsigned DEFAULT '0',
  `date` date DEFAULT '0000-00-00',
  `timestamp` int(11) unsigned DEFAULT '0',
  `link` varchar(255) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `raw_id` (`raw_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-08 15:43:29
