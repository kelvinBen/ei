-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.19


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ei
--

CREATE DATABASE IF NOT EXISTS ei;
USE ei;

--
-- Temporary table structure for view `v_organ_hist`
--
DROP TABLE IF EXISTS `v_organ_hist`;
DROP VIEW IF EXISTS `v_organ_hist`;
CREATE TABLE `v_organ_hist` (
  `ORGAN_ID` varchar(200),
  `ORGAN_CODE` varchar(200),
  `ORGAN_NAME` varchar(200),
  `SHORT_NAME` varchar(200),
  `ORGAN_TYPE` varchar(10),
  `WORKPLACE_ID` varchar(30),
  `BEGIN_DATE` char(8),
  `END_DATE` char(8),
  `SCN` int(11),
  `IN_USE` char(1)
);

--
-- Temporary table structure for view `v_stru_hist`
--
DROP TABLE IF EXISTS `v_stru_hist`;
DROP VIEW IF EXISTS `v_stru_hist`;
CREATE TABLE `v_stru_hist` (
  `STRU_ID` varchar(200),
  `ORGAN_ID` varchar(200),
  `ORGAN_ALIAS` varchar(200),
  `STRU_TYPE` varchar(10),
  `PARENT_ID` varchar(200),
  `PRINCIPAL_ID` varchar(30),
  `CORPORATION_ID` varchar(200),
  `STRU_LEVEL` int(11),
  `STRU_PATH` text,
  `STRU_ORDER` int(11),
  `GLOBAL_ORDER` int(11),
  `BEGIN_DATE` char(8),
  `END_DATE` char(8),
  `SCN` int(11),
  `IS_LEAF` char(1),
  `IN_USE` char(1),
  `DEPARTMENT_ID` varchar(30)
);

--
-- Temporary table structure for view `v_stru_organ`
--
DROP TABLE IF EXISTS `v_stru_organ`;
DROP VIEW IF EXISTS `v_stru_organ`;
CREATE TABLE `v_stru_organ` (
  `ORGAN_ID` varchar(200),
  `ORGAN_CODE` varchar(200),
  `ORGAN_NAME` varchar(200),
  `SHORT_NAME` varchar(200),
  `ORGAN_TYPE` varchar(10),
  `WORKPLACE_ID` varchar(30),
  `STRU_ID` varchar(200),
  `ORGAN_ALIAS` varchar(200),
  `STRU_TYPE` varchar(10),
  `PARENT_ID` varchar(200),
  `PRINCIPAL_ID` varchar(30),
  `CORPORATION_ID` varchar(200),
  `DEPARTMENT_ID` varchar(30)
);

--
-- Temporary table structure for view `v_stru_rule`
--
DROP TABLE IF EXISTS `v_stru_rule`;
DROP VIEW IF EXISTS `v_stru_rule`;
CREATE TABLE `v_stru_rule` (
  `RULE_ID` varchar(20),
  `STRU_TYPE` varchar(10),
  `TYPE_NAME` varchar(60),
  `SRC_REF` varchar(10),
  `SRC_NAME` varchar(60),
  `TARGET_REF` varchar(10),
  `TARGET_NAME` varchar(60),
  `RULE_NOTE` varchar(250)
);

--
-- Temporary table structure for view `v_workplace`
--
DROP TABLE IF EXISTS `v_workplace`;
DROP VIEW IF EXISTS `v_workplace`;
CREATE TABLE `v_workplace` (
  `WORKPLACE_ID` varchar(30),
  `WORKPLACE_CODE` varchar(30),
  `WORKPLACE_NAME` varchar(100),
  `SHORT_NAME` varchar(30),
  `LINKMAN` varchar(120),
  `TEL` varchar(80),
  `FAX` varchar(80),
  `E_MAIL` varchar(80),
  `WWW` varchar(250),
  `POST_CODE` varchar(20),
  `POST_ADDRESS` varchar(250),
  `ENGLISH_ADDRESS` varchar(250),
  `AM_END_TIME` char(8),
  `PM_END_TIME` char(8),
  `CANT_CODE` varchar(20),
  `CANT_NAME` varchar(250)
);

--
-- Temporary table structure for view `wf_act_list`
--
DROP TABLE IF EXISTS `wf_act_list`;
DROP VIEW IF EXISTS `wf_act_list`;
CREATE TABLE `wf_act_list` (
  `PROCESS_ID` varchar(255),
  `RESOURCE_REQ_ID` varchar(60),
  `PROCESS_NAME` varchar(255),
  `RESOURCE_REQ_NAME` varchar(60),
  `PROCESS_TYPE` varchar(255),
  `PROCESS_RESERVE_TYPE_ID` varchar(255),
  `PRO_DEFINITION_ID` varchar(60),
  `PRO_DESCRIPTION` varchar(255),
  `PRO_CURRENT_STATE` varchar(255),
  `PRO_STARTED_TIME` timestamp,
  `MGR_NAME` varchar(255),
  `ACTIVITY_ID` varchar(255),
  `PRIORITY` decimal(18,0),
  `ACT_DEFINITION_ID` varchar(60),
  `ACT_CURRENT_STATE` varchar(255),
  `ACTIVITY_NAME` varchar(255),
  `FORM_ID` varchar(60),
  `SOURCE_REFERENCE_ID` varchar(60),
  `PREVIOUS_ACTIVITY` varchar(255),
  `CREATE_TIME` timestamp,
  `PREVIOUS_ACTIVITY_NAME` varchar(255),
  `PREVIOUS_RESOURCE` varchar(60),
  `PREVIOUS_RESOURCE_NAME` varchar(80),
  `USER_ID` varchar(255),
  `USER_TYPE` varchar(255),
  `CUR_USER_ID` varchar(255),
  `CUR_USER_NAME` varchar(255),
  `RESOURCE_TYPE` varchar(255),
  `FROM_DATE` timestamp,
  `STATUS_ID` varchar(40),
  `READ_MARK` decimal(18,0),
  `WORK_ORDER` decimal(18,0)
);

--
-- Temporary table structure for view `wf_ass_event_list`
--
DROP TABLE IF EXISTS `wf_ass_event_list`;
DROP VIEW IF EXISTS `wf_ass_event_list`;
CREATE TABLE `wf_ass_event_list` (
  `EVENT_AUDIT_ID` varchar(40),
  `AUDIT_TIME` varchar(255),
  `AUDIT_TYPE` varchar(255),
  `PACKAGE_ID` varchar(255),
  `PROCESS_ID` varchar(255),
  `PROCESS_NAME` varchar(255),
  `PROCESS_DEF_ID` varchar(255),
  `OLD_USER_NAME` varchar(255),
  `OLD_NAME` varchar(255),
  `OLD_TYPE` varchar(255),
  `NEW_USER_NAME` varchar(255),
  `NEW_NAME` varchar(255),
  `NEW_TYPE` varchar(255),
  `IS_ACCEPTED` char(1)
);

--
-- Temporary table structure for view `wf_end_task_list`
--
DROP TABLE IF EXISTS `wf_end_task_list`;
DROP VIEW IF EXISTS `wf_end_task_list`;
CREATE TABLE `wf_end_task_list` (
  `PROCESS_ID` varchar(255),
  `RESOURCE_REQ_ID` varchar(60),
  `PROCESS_NAME` varchar(255),
  `RESOURCE_REQ_NAME` varchar(60),
  `PROCESS_TYPE` varchar(255),
  `PROCESS_RESERVE_TYPE_ID` varchar(255),
  `PRO_DEFINITION_ID` varchar(60),
  `PRO_DESCRIPTION` varchar(255),
  `PRO_CURRENT_STATE` varchar(255),
  `PRO_STARTED_TIME` timestamp,
  `LAST_STATE_TIME` timestamp,
  `ORG_ID` varchar(255),
  `MGR_NAME` varchar(255),
  `ACTIVITY_ID` varchar(255),
  `ACT_DEFINITION_ID` varchar(60),
  `ACTIVITY_NAME` varchar(255),
  `FORM_ID` varchar(60),
  `SOURCE_REFERENCE_ID` varchar(60),
  `CREATE_TIME` timestamp,
  `PRIORITY` decimal(18,0),
  `USER_ID` varchar(255),
  `USER_NAME` varchar(255),
  `FROM_DATE` timestamp,
  `THRU_DATE` timestamp
);

--
-- Temporary table structure for view `wf_participant_list`
--
DROP TABLE IF EXISTS `wf_participant_list`;
DROP VIEW IF EXISTS `wf_participant_list`;
CREATE TABLE `wf_participant_list` (
  `PROCESS_ID` varchar(255),
  `PROCESS_RESERVE_TYPE_ID` varchar(255),
  `PRO_DEFINITION_ID` varchar(60),
  `PROCESS_NAME` varchar(255),
  `PRO_CURRENT_STATE` varchar(255),
  `PRO_STARTED_TIME` timestamp,
  `PROCESS_TYPE` varchar(255),
  `ACTIVITY_ID` varchar(255),
  `ACTIVITY_NAME` varchar(255),
  `ACT_DEFINITION_ID` varchar(60),
  `SOURCE_REFERENCE_ID` varchar(60),
  `PREVIOUS_ACTIVITY` varchar(255),
  `PREVIOUS_ACTIVITY_NAME` varchar(255),
  `ACT_CURRENT_STATE` varchar(255),
  `PREVIOUS_RESOURCE_NAME` varchar(80),
  `FORM_ID` varchar(60),
  `CREATE_TIME` timestamp,
  `READ_MARK` decimal(18,0),
  `RESOURCE_TYPE` varchar(255),
  `USER_ID` varchar(255),
  `USER_NAME` varchar(255),
  `OLD_RESOURCE_TYPE` varchar(255),
  `FROM_DATE` timestamp,
  `CUR_USER_ID` varchar(255),
  `CUR_USER_NAME` varchar(255)
);

--
-- Temporary table structure for view `wf_task_list`
--
DROP TABLE IF EXISTS `wf_task_list`;
DROP VIEW IF EXISTS `wf_task_list`;
CREATE TABLE `wf_task_list` (
  `PROCESS_ID` varchar(255),
  `RESOURCE_REQ_ID` varchar(60),
  `PROCESS_NAME` varchar(255),
  `RESOURCE_REQ_NAME` varchar(60),
  `PROCESS_TYPE` varchar(255),
  `PROCESS_RESERVE_TYPE_ID` varchar(255),
  `MGR_NAME` varchar(255),
  `PRO_DEFINITION_ID` varchar(60),
  `PRO_DESCRIPTION` varchar(255),
  `PRO_CURRENT_STATE` varchar(255),
  `PRO_STARTED_TIME` timestamp,
  `ACTIVITY_ID` varchar(255),
  `PRIORITY` decimal(18,0),
  `ACT_DEFINITION_ID` varchar(60),
  `ACT_CURRENT_STATE` varchar(255),
  `ACTIVITY_NAME` varchar(255),
  `FORM_ID` varchar(60),
  `SOURCE_REFERENCE_ID` varchar(60),
  `CREATE_TIME` timestamp,
  `PREVIOUS_ACTIVITY` varchar(255),
  `PREVIOUS_ACTIVITY_NAME` varchar(255),
  `PREVIOUS_RESOURCE` varchar(60),
  `PREVIOUS_RESOURCE_NAME` varchar(80),
  `USER_ID` varchar(255),
  `USER_NAME` varchar(255),
  `RESOURCE_TYPE` varchar(255),
  `FROM_DATE` timestamp,
  `STATUS_ID` varchar(40),
  `THRU_DATE` timestamp,
  `WORK_ORDER` decimal(18,0),
  `READ_MARK` decimal(18,0)
);

--
-- Definition of table `clbx`
--

DROP TABLE IF EXISTS `clbx`;
CREATE TABLE `clbx` (
  `CodeId` varchar(36) NOT NULL,
  `BXR` varchar(12) DEFAULT NULL,
  `Department` varchar(20) DEFAULT NULL,
  `TXRS` varchar(4) DEFAULT NULL,
  `CFD` varchar(20) DEFAULT NULL,
  `BXSUM` varchar(20) DEFAULT NULL,
  `CCSY` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clbx`
--

/*!40000 ALTER TABLE `clbx` DISABLE KEYS */;
/*!40000 ALTER TABLE `clbx` ENABLE KEYS */;


--
-- Definition of table `combo_collection`
--

DROP TABLE IF EXISTS `combo_collection`;
CREATE TABLE `combo_collection` (
  `COMBO_ID` varchar(30) NOT NULL,
  `COMBO_NAME` varchar(30) NOT NULL,
  `COMBO_HELP` varchar(30) NOT NULL,
  PRIMARY KEY (`COMBO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `combo_collection`
--

/*!40000 ALTER TABLE `combo_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `combo_collection` ENABLE KEYS */;


--
-- Definition of table `combobox_test`
--

DROP TABLE IF EXISTS `combobox_test`;
CREATE TABLE `combobox_test` (
  `COMBOBOX_ID` varchar(30) NOT NULL,
  `COMBOBOX_NAME` varchar(30) NOT NULL,
  `COMBOBOX_SEX` char(1) DEFAULT '0',
  `COMBOBOX_NATION` char(1) DEFAULT '0',
  `COMBOBOX_ADDRESS` varchar(30) DEFAULT '0',
  PRIMARY KEY (`COMBOBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `combobox_test`
--

/*!40000 ALTER TABLE `combobox_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `combobox_test` ENABLE KEYS */;


--
-- Definition of table `factory`
--

DROP TABLE IF EXISTS `factory`;
CREATE TABLE `factory` (
  `FACTORY_ID` varchar(32) NOT NULL,
  `FACTORY_NAME` varchar(32) NOT NULL,
  `FACTORY_ADDRESS` varchar(32) NOT NULL,
  `GOODS_ID` varchar(32) NOT NULL,
  PRIMARY KEY (`FACTORY_ID`),
  KEY `FACTORY_FK1` (`GOODS_ID`),
  CONSTRAINT `FACTORY_FK1` FOREIGN KEY (`GOODS_ID`) REFERENCES `goods` (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `factory`
--

/*!40000 ALTER TABLE `factory` DISABLE KEYS */;
/*!40000 ALTER TABLE `factory` ENABLE KEYS */;


--
-- Definition of table `flexgrid`
--

DROP TABLE IF EXISTS `flexgrid`;
CREATE TABLE `flexgrid` (
  `FLEX_ID` varchar(30) NOT NULL,
  `FLEX_TEXT` varchar(30) NOT NULL,
  `FLEX_CURRENCY` varchar(30) NOT NULL,
  `FLEX_DATE` varchar(30) NOT NULL,
  `FLEX_NUMERIC` varchar(30) NOT NULL,
  `FLEX_ENUM` char(1) NOT NULL,
  `FLEX_LISTENUM` varchar(10) NOT NULL,
  `EMPLOYEE_COUNTRY` varchar(30) NOT NULL,
  `EMPLOYEE_PROVINCE` varchar(30) NOT NULL,
  `EMPLOYEE_CITY` varchar(30) NOT NULL,
  `FLEX_SQL` varchar(30) NOT NULL,
  PRIMARY KEY (`FLEX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flexgrid`
--

/*!40000 ALTER TABLE `flexgrid` DISABLE KEYS */;
/*!40000 ALTER TABLE `flexgrid` ENABLE KEYS */;


--
-- Definition of table `food`
--

DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `FOOD_ID` varchar(32) NOT NULL,
  `FOOD_NAME` varchar(32) NOT NULL,
  `FOOD_ORIGIN` varchar(32) NOT NULL,
  `FOOD_NUM` varchar(32) NOT NULL,
  `FOOD_PRICE` varchar(32) NOT NULL,
  `XB_ID` varchar(32) NOT NULL,
  PRIMARY KEY (`FOOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `food`
--

/*!40000 ALTER TABLE `food` DISABLE KEYS */;
/*!40000 ALTER TABLE `food` ENABLE KEYS */;


--
-- Definition of table `goods`
--

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `GOODS_ID` varchar(32) NOT NULL,
  `GOODS_NAME` varchar(32) NOT NULL,
  `GOODS_PRICE` varchar(32) NOT NULL,
  PRIMARY KEY (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `goods`
--

/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;


--
-- Definition of table `grid_item`
--

DROP TABLE IF EXISTS `grid_item`;
CREATE TABLE `grid_item` (
  `MAIN_GRID_ID` varchar(30) NOT NULL,
  `ITEM_DETAILID` varchar(30) NOT NULL,
  `ITEM_PRODUCTID` varchar(30) NOT NULL,
  `ITEM_UNITPRICE` decimal(5,2) DEFAULT NULL,
  `ITEM_DISCOUNT` char(1) NOT NULL,
  `ITEM_QUANTITY` decimal(5,2) DEFAULT NULL,
  `ITEM_AMOUNT` decimal(5,2) DEFAULT NULL,
  `ITEM_DATE` varchar(8) NOT NULL,
  `ITEM_DATETIME` varchar(17) NOT NULL,
  `ITEM_LEVEL` char(1) NOT NULL DEFAULT '0',
  `ITEM_NOTE` varchar(50) NOT NULL,
  PRIMARY KEY (`MAIN_GRID_ID`,`ITEM_DETAILID`),
  CONSTRAINT `GridItem_FK1` FOREIGN KEY (`MAIN_GRID_ID`) REFERENCES `main_grid` (`MAIN_GRID_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grid_item`
--

/*!40000 ALTER TABLE `grid_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `grid_item` ENABLE KEYS */;


--
-- Definition of table `ls_plan`
--

DROP TABLE IF EXISTS `ls_plan`;
CREATE TABLE `ls_plan` (
  `PLAN_ID` varchar(30) NOT NULL,
  `PLAN_TYPE` char(1) NOT NULL DEFAULT '1',
  `ORGAN_ID` varchar(30) NOT NULL,
  `PLAN_NAME` varchar(30) NOT NULL,
  `PLAN_PERIOD` varchar(6) NOT NULL,
  `CREATOR_ID` varchar(30) NOT NULL,
  `CREATE_DATE` char(10) NOT NULL,
  `PLAN_STATE` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PLAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ls_plan`
--

/*!40000 ALTER TABLE `ls_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `ls_plan` ENABLE KEYS */;


--
-- Definition of table `ls_task`
--

DROP TABLE IF EXISTS `ls_task`;
CREATE TABLE `ls_task` (
  `TASK_ID` varchar(30) NOT NULL,
  `PLAN_ID` varchar(30) NOT NULL,
  `TASK` varchar(100) NOT NULL,
  `FINISH_DATE` char(10) NOT NULL,
  `PERFECT_SCORE` int(11) NOT NULL,
  `CHECKMAN_ID` varchar(30) NOT NULL,
  `ACHIVED_SCORE` int(11) DEFAULT NULL,
  PRIMARY KEY (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ls_task`
--

/*!40000 ALTER TABLE `ls_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `ls_task` ENABLE KEYS */;


--
-- Definition of table `main_grid`
--

DROP TABLE IF EXISTS `main_grid`;
CREATE TABLE `main_grid` (
  `MAIN_GRID_ID` varchar(30) NOT NULL,
  `OPERATOR_CODE` varchar(30) NOT NULL,
  `OPERATE_NAME` varchar(30) NOT NULL,
  `OPERATE_COOPERATE` varchar(30) NOT NULL,
  `OPERATE_DEPT` varchar(30) NOT NULL,
  `OPERATE_DATE` char(8) NOT NULL,
  `OPERATE_EFFDATE` char(8) NOT NULL,
  `OPERATOR_STATUS` char(1) NOT NULL DEFAULT '1',
  `OPERATOR_DEPOT` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`MAIN_GRID_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `main_grid`
--

/*!40000 ALTER TABLE `main_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_grid` ENABLE KEYS */;


--
-- Definition of table `mainblob`
--

DROP TABLE IF EXISTS `mainblob`;
CREATE TABLE `mainblob` (
  `MAIN_ID` varchar(30) NOT NULL,
  `MAIN_OPERATORCODE` varchar(30) NOT NULL,
  `MAIN_OPERATEDATE` varchar(8) NOT NULL,
  PRIMARY KEY (`MAIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mainblob`
--

/*!40000 ALTER TABLE `mainblob` DISABLE KEYS */;
/*!40000 ALTER TABLE `mainblob` ENABLE KEYS */;


--
-- Definition of table `mp_incept_manner`
--

DROP TABLE IF EXISTS `mp_incept_manner`;
CREATE TABLE `mp_incept_manner` (
  `RECEIVE_MANNER_CODE` varchar(30) NOT NULL,
  `RECEIVE_MANNER_NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`RECEIVE_MANNER_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_incept_manner`
--

/*!40000 ALTER TABLE `mp_incept_manner` DISABLE KEYS */;
INSERT INTO `mp_incept_manner` (`RECEIVE_MANNER_CODE`,`RECEIVE_MANNER_NAME`) VALUES 
 ('DB','数据库'),
 ('Mail','邮件');
/*!40000 ALTER TABLE `mp_incept_manner` ENABLE KEYS */;


--
-- Definition of table `mp_messag`
--

DROP TABLE IF EXISTS `mp_messag`;
CREATE TABLE `mp_messag` (
  `ID` decimal(18,0) NOT NULL,
  `SENDER` varchar(300) NOT NULL,
  `RECEIVER` varchar(300) NOT NULL,
  `RECEIVE_ADDRESS` varchar(200) NOT NULL,
  `SENDER_TYPE` char(8) NOT NULL,
  `CONTENTS` varchar(4000) DEFAULT NULL,
  `IS_COMPLEX` char(1) DEFAULT '0',
  `MESSAGE_TYPE` char(4) DEFAULT NULL,
  `SEND_TIME` date DEFAULT NULL,
  `EXCEPTION` varchar(2000) DEFAULT NULL,
  `STATE` char(1) DEFAULT NULL,
  `SENDE_NUM` decimal(18,0) DEFAULT NULL,
  `NOTE` varchar(300) DEFAULT NULL,
  `NOTE2` varchar(200) DEFAULT NULL,
  `NOTE3` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_messag`
--

/*!40000 ALTER TABLE `mp_messag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_messag` ENABLE KEYS */;


--
-- Definition of table `mp_message`
--

DROP TABLE IF EXISTS `mp_message`;
CREATE TABLE `mp_message` (
  `MSG_ID` varchar(30) NOT NULL,
  `MSG_TYPE_CODE` varchar(30) NOT NULL,
  `OBJECTID` varchar(30) DEFAULT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `CONTENT` varchar(1024) NOT NULL,
  `SCHEDULE` char(14) DEFAULT NULL,
  `USEFUL_TIME` char(14) DEFAULT NULL,
  `CREATE_TIME` char(17) DEFAULT NULL,
  `CREATER` varchar(30) DEFAULT NULL,
  `RECEIVE_ADDRESS` varchar(1024) DEFAULT NULL,
  `RECEIVE_MANNER_CODE` varchar(30) DEFAULT NULL,
  `ATTACHMENT` blob,
  `STATUS` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_message`
--

/*!40000 ALTER TABLE `mp_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_message` ENABLE KEYS */;


--
-- Definition of table `mp_message_history`
--

DROP TABLE IF EXISTS `mp_message_history`;
CREATE TABLE `mp_message_history` (
  `MSG_ID` varchar(30) NOT NULL,
  `MSG_TYPE_CODE` varchar(30) NOT NULL,
  `OBJECTID` varchar(30) DEFAULT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `CONTENT` varchar(1024) NOT NULL,
  `SCHEDULE` char(14) DEFAULT NULL,
  `USEFUL_TIME` char(14) DEFAULT NULL,
  `CREATE_TIME` char(17) DEFAULT NULL,
  `SEND_TIME` char(17) DEFAULT NULL,
  `CREATER` varchar(30) DEFAULT NULL,
  `RECEIVE_ADDRESS` varchar(1024) DEFAULT NULL,
  `RECEIVE_MANNER_CODE` varchar(30) DEFAULT NULL,
  `ATTACHMENT` blob,
  `STATUS` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_message_history`
--

/*!40000 ALTER TABLE `mp_message_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_message_history` ENABLE KEYS */;


--
-- Definition of table `mp_message_hospital`
--

DROP TABLE IF EXISTS `mp_message_hospital`;
CREATE TABLE `mp_message_hospital` (
  `ERROR_MSG_ID` varchar(30) NOT NULL,
  `MSG_ID` varchar(30) NOT NULL,
  `SEND_TIME` char(17) DEFAULT NULL,
  `RECEIVE_ADDRESS` varchar(30) DEFAULT NULL,
  `RECEIVE_MANNER_CODE` varchar(30) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ERROR_MSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_message_hospital`
--

/*!40000 ALTER TABLE `mp_message_hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_message_hospital` ENABLE KEYS */;


--
-- Definition of table `mp_message_type`
--

DROP TABLE IF EXISTS `mp_message_type`;
CREATE TABLE `mp_message_type` (
  `MSG_TYPE_CODE` varchar(30) NOT NULL,
  `MSG_TYPE_NAME` varchar(30) NOT NULL,
  `IS_COMMON_MSG` char(1) NOT NULL DEFAULT '0',
  `OBJECT_TABLE_NAME` varchar(30) DEFAULT NULL,
  `SUBSCR_LIMIT` varchar(100) NOT NULL,
  `MANNER_LIMIT` varchar(100) NOT NULL,
  PRIMARY KEY (`MSG_TYPE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_message_type`
--

/*!40000 ALTER TABLE `mp_message_type` DISABLE KEYS */;
INSERT INTO `mp_message_type` (`MSG_TYPE_CODE`,`MSG_TYPE_NAME`,`IS_COMMON_MSG`,`OBJECT_TABLE_NAME`,`SUBSCR_LIMIT`,`MANNER_LIMIT`) VALUES 
 ('1','公文消息','1','','*','DB;Email'),
 ('2','采购消息','1','','*','*'),
 ('3','流程消息','1','','*','*'),
 ('4','系统消息','1','','*','*'),
 ('5','订单消息','1','','*','*');
/*!40000 ALTER TABLE `mp_message_type` ENABLE KEYS */;


--
-- Definition of table `mp_receive_address`
--

DROP TABLE IF EXISTS `mp_receive_address`;
CREATE TABLE `mp_receive_address` (
  `RECEIVE_ADDRESS_ID` varchar(30) NOT NULL,
  `SUBSCR_TYPE_CODE` varchar(30) NOT NULL,
  `RECEIVE_MANNER_CODE` varchar(30) NOT NULL,
  `OBJECT_TABLE_NAME` varchar(30) NOT NULL,
  `SUBSCRIBERID_FIELD` varchar(30) NOT NULL,
  `SUBSCRIBERID_FIELD_TYPE` varchar(10) NOT NULL DEFAULT 'String',
  `ADDRESS_FIELD` varchar(30) NOT NULL,
  PRIMARY KEY (`RECEIVE_ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_receive_address`
--

/*!40000 ALTER TABLE `mp_receive_address` DISABLE KEYS */;
INSERT INTO `mp_receive_address` (`RECEIVE_ADDRESS_ID`,`SUBSCR_TYPE_CODE`,`RECEIVE_MANNER_CODE`,`OBJECT_TABLE_NAME`,`SUBSCRIBERID_FIELD`,`SUBSCRIBERID_FIELD_TYPE`,`ADDRESS_FIELD`) VALUES 
 ('1','User','Mail','PUB_USERS','USER_ID','String','E_MAIL');
/*!40000 ALTER TABLE `mp_receive_address` ENABLE KEYS */;


--
-- Definition of table `mp_subscr_list`
--

DROP TABLE IF EXISTS `mp_subscr_list`;
CREATE TABLE `mp_subscr_list` (
  `SUBSCR_ID` varchar(30) NOT NULL,
  `MSG_TYPE_CODE` varchar(30) NOT NULL,
  `SUBSCRIBERID` varchar(30) NOT NULL,
  `SUBSCR_TYPE_CODE` varchar(30) NOT NULL,
  `RECEIVE_MANNER_CODE` varchar(30) NOT NULL,
  `RECEIVE_ADDRESS` varchar(30) DEFAULT NULL,
  `FILTER` varchar(30) DEFAULT NULL,
  `EXTENDINFO` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SUBSCR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_subscr_list`
--

/*!40000 ALTER TABLE `mp_subscr_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_subscr_list` ENABLE KEYS */;


--
-- Definition of table `mp_subscriber_type`
--

DROP TABLE IF EXISTS `mp_subscriber_type`;
CREATE TABLE `mp_subscriber_type` (
  `SUBSCR_TYPE_CODE` varchar(30) NOT NULL,
  `SUBSCR_TYPE_NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`SUBSCR_TYPE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_subscriber_type`
--

/*!40000 ALTER TABLE `mp_subscriber_type` DISABLE KEYS */;
INSERT INTO `mp_subscriber_type` (`SUBSCR_TYPE_CODE`,`SUBSCR_TYPE_NAME`) VALUES 
 ('ExtendUser','扩展用户'),
 ('OuterUser','外部用户'),
 ('User','系统用户');
/*!40000 ALTER TABLE `mp_subscriber_type` ENABLE KEYS */;


--
-- Definition of table `mp_user_message`
--

DROP TABLE IF EXISTS `mp_user_message`;
CREATE TABLE `mp_user_message` (
  `USER_MESSAGE_ID` varchar(30) NOT NULL,
  `MSG_TYPE_CODE` varchar(30) NOT NULL,
  `SUBSCRIBERID` varchar(30) NOT NULL,
  `SUBSCR_TYPE_CODE` varchar(30) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `CONTENT` varchar(1024) NOT NULL,
  `CREATER` varchar(30) DEFAULT NULL,
  `CREATE_TIME` char(17) DEFAULT NULL,
  `ARRIVE_TIME` char(17) DEFAULT NULL,
  `ATTACHMENT` blob,
  `STATUS` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`USER_MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_user_message`
--

/*!40000 ALTER TABLE `mp_user_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_user_message` ENABLE KEYS */;


--
-- Definition of table `organ_stru`
--

DROP TABLE IF EXISTS `organ_stru`;
CREATE TABLE `organ_stru` (
  `ORGAN_ID` varchar(30) NOT NULL,
  `ORGAN_ALIAS` varchar(80) NOT NULL,
  `ORGAN_TYPE` varchar(10) NOT NULL,
  `PARENT_ID` varchar(30) DEFAULT NULL,
  `PRINCIPAL_ID` varchar(30) DEFAULT NULL,
  `STRU_PATH` varchar(250) NOT NULL,
  `ORGAN_ORDER` int(11) NOT NULL DEFAULT '1',
  `BEGIN_DATE` char(8) NOT NULL,
  `END_DATE` char(8) NOT NULL DEFAULT '99991231',
  `IS_LEAF` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ORGAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `organ_stru`
--

/*!40000 ALTER TABLE `organ_stru` DISABLE KEYS */;
/*!40000 ALTER TABLE `organ_stru` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `ITEM_PRODUCTID` varchar(30) NOT NULL,
  `ITEM_PRODUCTNAME` varchar(30) NOT NULL,
  `ITEM_UNITPRICE` decimal(5,2) NOT NULL,
  `ITEM_QUANTITY` decimal(5,2) NOT NULL,
  `ITEM_AMOUNT` decimal(5,2) NOT NULL,
  `ITEM_LEVEL` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ITEM_PRODUCTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `pub_app`
--

DROP TABLE IF EXISTS `pub_app`;
CREATE TABLE `pub_app` (
  `APP_ID` varchar(30) NOT NULL,
  `APP_NAME` varchar(100) NOT NULL,
  `CORPORATION_ID` varchar(30) NOT NULL,
  `TP` varchar(30) NOT NULL,
  `IP` varchar(15) DEFAULT NULL,
  `PORT` varchar(6) DEFAULT NULL,
  `CONTEXT` varchar(50) DEFAULT NULL,
  `DOMAINNAME` varchar(100) DEFAULT NULL,
  `NOTE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`APP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_app`
--

/*!40000 ALTER TABLE `pub_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_app` ENABLE KEYS */;


--
-- Definition of table `pub_cant`
--

DROP TABLE IF EXISTS `pub_cant`;
CREATE TABLE `pub_cant` (
  `CANT_CODE` varchar(20) NOT NULL,
  `CANT_NAME` varchar(250) NOT NULL,
  `SHORT_NAME` varchar(120) DEFAULT NULL,
  `CANT_TYPE` varchar(10) NOT NULL,
  `SUPER_CODE` varchar(20) NOT NULL,
  `COUNTRY_CODE` varchar(10) NOT NULL,
  `CANT_NOTE` varchar(250) DEFAULT NULL,
  `IN_USE` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`CANT_CODE`),
  KEY `PUBCANT_FK1` (`CANT_TYPE`),
  KEY `PUBCANT_FK2` (`COUNTRY_CODE`),
  CONSTRAINT `PUBCANT_FK1` FOREIGN KEY (`CANT_TYPE`) REFERENCES `pub_cant_type` (`CANT_TYPE`),
  CONSTRAINT `PUBCANT_FK2` FOREIGN KEY (`COUNTRY_CODE`) REFERENCES `pub_country` (`COUNTRY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_cant`
--

/*!40000 ALTER TABLE `pub_cant` DISABLE KEYS */;
INSERT INTO `pub_cant` (`CANT_CODE`,`CANT_NAME`,`SHORT_NAME`,`CANT_TYPE`,`SUPER_CODE`,`COUNTRY_CODE`,`CANT_NOTE`,`IN_USE`) VALUES 
 ('100000','全国组织机构代码管理中心','全国组织机构代码管理中心','0','-1','CN',NULL,'1'),
 ('110000','北京市','北京市','1','CN','CN',NULL,'1'),
 ('110100','北京市市辖区','北京市市辖区','2','110000','CN',NULL,'1'),
 ('110101','北京市市辖区东城区','北京市市辖区东城区','3','110100','CN',NULL,'1'),
 ('110102','北京市市辖区西城区','北京市市辖区西城区','3','110100','CN',NULL,'1'),
 ('110103','北京市市辖区崇文区','北京市市辖区崇文区','3','110100','CN',NULL,'1'),
 ('110104','北京市市辖区宣武区','北京市市辖区宣武区','3','110100','CN',NULL,'1'),
 ('110105','北京市市辖区朝阳区','北京市市辖区朝阳区','3','110100','CN',NULL,'1'),
 ('110106','北京市市辖区丰台区','北京市市辖区丰台区','3','110100','CN',NULL,'1'),
 ('110107','北京市市辖区石景山区','北京市市辖区石景山区','3','110100','CN',NULL,'1'),
 ('110108','北京市市辖区海淀区','北京市市辖区海淀区','3','110100','CN',NULL,'1'),
 ('110109','北京市市辖区门头沟区','北京市市辖区门头沟区','3','110100','CN',NULL,'1'),
 ('110111','北京市市辖区房山区','北京市市辖区房山区','3','110100','CN',NULL,'1'),
 ('110112','北京市市辖区通州区','北京市市辖区通州区','3','110100','CN',NULL,'1'),
 ('110113','北京市市辖区顺义区','北京市市辖区顺义区','3','110100','CN',NULL,'1'),
 ('110114','北京市市辖区昌平区','北京市市辖区昌平区','3','110100','CN',NULL,'1'),
 ('110115','北京市市辖区大兴区','北京市市辖区大兴区','3','110100','CN',NULL,'1'),
 ('110116','北京市市辖区怀柔区','北京市市辖区怀柔区','3','110100','CN',NULL,'1'),
 ('110117','北京市市辖区平谷区','北京市市辖区平谷区','3','110100','CN',NULL,'1'),
 ('110200','北京市县','北京市县','2','110000','CN',NULL,'1'),
 ('110228','北京市县密云县','北京市县密云县','3','110200','CN',NULL,'1'),
 ('110229','北京市县延庆县','北京市县延庆县','3','110200','CN',NULL,'1'),
 ('120000','天津市','天津市','1','CN','CN',NULL,'1'),
 ('120100','天津市市辖区','天津市市辖区','2','120000','CN',NULL,'1'),
 ('120101','天津市市辖区和平区','天津市市辖区和平区','3','120100','CN',NULL,'1'),
 ('120102','天津市市辖区河东区','天津市市辖区河东区','3','120100','CN',NULL,'1'),
 ('120103','天津市市辖区河西区','天津市市辖区河西区','3','120100','CN',NULL,'1'),
 ('120104','天津市市辖区南开区','天津市市辖区南开区','3','120100','CN',NULL,'1'),
 ('120105','天津市市辖区河北区','天津市市辖区河北区','3','120100','CN',NULL,'1'),
 ('120106','天津市市辖区红桥区','天津市市辖区红桥区','3','120100','CN',NULL,'1'),
 ('120107','天津市市辖区塘沽区','天津市市辖区塘沽区','3','120100','CN',NULL,'1'),
 ('120108','天津市市辖区汉沽区','天津市市辖区汉沽区','3','120100','CN',NULL,'1'),
 ('120109','天津市市辖区大港区','天津市市辖区大港区','3','120100','CN',NULL,'1'),
 ('120110','天津市市辖区东丽区','天津市市辖区东丽区','3','120100','CN',NULL,'1'),
 ('120111','天津市市辖区西青区','天津市市辖区西青区','3','120100','CN',NULL,'1'),
 ('120112','天津市市辖区津南区','天津市市辖区津南区','3','120100','CN',NULL,'1'),
 ('120113','天津市市辖区北辰区','天津市市辖区北辰区','3','120100','CN',NULL,'1'),
 ('120114','天津市市辖区武清区','天津市市辖区武清区','3','120100','CN',NULL,'1'),
 ('120115','天津市市辖区宝坻区','天津市市辖区宝坻区','3','120100','CN',NULL,'1'),
 ('120200','天津市县','天津市县','2','120000','CN',NULL,'1'),
 ('120221','天津市县宁河县','天津市县宁河县','3','120200','CN',NULL,'1'),
 ('120223','天津市县静海县','天津市县静海县','3','120200','CN',NULL,'1'),
 ('120225','天津市县蓟县','天津市县蓟县','3','120200','CN',NULL,'1'),
 ('130000','河北省','河北省','1','CN','CN',NULL,'1'),
 ('130100','河北省石家庄市','河北省石家庄市','2','130000','CN',NULL,'1'),
 ('130101','河北省石家庄市市辖区','河北省石家庄市市辖区','3','130100','CN',NULL,'1'),
 ('130102','河北省石家庄市长安区','河北省石家庄市长安区','3','130100','CN',NULL,'1'),
 ('130103','河北省石家庄市桥东区','河北省石家庄市桥东区','3','130100','CN',NULL,'1'),
 ('130104','河北省石家庄市桥西区','河北省石家庄市桥西区','3','130100','CN',NULL,'1'),
 ('130105','河北省石家庄市新华区','河北省石家庄市新华区','3','130100','CN',NULL,'1'),
 ('130107','河北省石家庄市井陉矿区','河北省石家庄市井陉矿区','3','130100','CN',NULL,'1'),
 ('130108','河北省石家庄市裕华区','河北省石家庄市裕华区','3','130100','CN',NULL,'1'),
 ('130121','河北省石家庄市井陉县','河北省石家庄市井陉县','3','130100','CN',NULL,'1'),
 ('130123','河北省石家庄市正定县','河北省石家庄市正定县','3','130100','CN',NULL,'1'),
 ('130124','河北省石家庄市栾城县','河北省石家庄市栾城县','3','130100','CN',NULL,'1'),
 ('130125','河北省石家庄市行唐县','河北省石家庄市行唐县','3','130100','CN',NULL,'1'),
 ('130126','河北省石家庄市灵寿县','河北省石家庄市灵寿县','3','130100','CN',NULL,'1'),
 ('130127','河北省石家庄市高邑县','河北省石家庄市高邑县','3','130100','CN',NULL,'1'),
 ('130128','河北省石家庄市深泽县','河北省石家庄市深泽县','3','130100','CN',NULL,'1'),
 ('130129','河北省石家庄市赞皇县','河北省石家庄市赞皇县','3','130100','CN',NULL,'1'),
 ('130130','河北省石家庄市无极县','河北省石家庄市无极县','3','130100','CN',NULL,'1'),
 ('130131','河北省石家庄市平山县','河北省石家庄市平山县','3','130100','CN',NULL,'1'),
 ('130132','河北省石家庄市元氏县','河北省石家庄市元氏县','3','130100','CN',NULL,'1'),
 ('130133','河北省石家庄市赵县','河北省石家庄市赵县','3','130100','CN',NULL,'1'),
 ('130181','河北省石家庄市辛集市','河北省石家庄市辛集市','3','130100','CN',NULL,'1'),
 ('130182','河北省石家庄市藁城市','河北省石家庄市藁城市','3','130100','CN',NULL,'1'),
 ('130183','河北省石家庄市晋州市','河北省石家庄市晋州市','3','130100','CN',NULL,'1'),
 ('130184','河北省石家庄市新乐市','河北省石家庄市新乐市','3','130100','CN',NULL,'1'),
 ('130185','河北省石家庄市鹿泉市','河北省石家庄市鹿泉市','3','130100','CN',NULL,'1'),
 ('130200','河北省唐山市','河北省唐山市','2','130000','CN',NULL,'1'),
 ('130201','河北省唐山市市辖区','河北省唐山市市辖区','3','130200','CN',NULL,'1'),
 ('130202','河北省唐山市路南区','河北省唐山市路南区','3','130200','CN',NULL,'1'),
 ('130203','河北省唐山市路北区','河北省唐山市路北区','3','130200','CN',NULL,'1'),
 ('130204','河北省唐山市古冶区','河北省唐山市古冶区','3','130200','CN',NULL,'1'),
 ('130205','河北省唐山市开平区','河北省唐山市开平区','3','130200','CN',NULL,'1'),
 ('130207','河北省唐山市丰南区','河北省唐山市丰南区','3','130200','CN',NULL,'1'),
 ('130208','河北省唐山市丰润区','河北省唐山市丰润区','3','130200','CN',NULL,'1'),
 ('130223','河北省唐山市滦县','河北省唐山市滦县','3','130200','CN',NULL,'1'),
 ('130224','河北省唐山市滦南县','河北省唐山市滦南县','3','130200','CN',NULL,'1'),
 ('130225','河北省唐山市乐亭县','河北省唐山市乐亭县','3','130200','CN',NULL,'1'),
 ('130227','河北省唐山市迁西县','河北省唐山市迁西县','3','130200','CN',NULL,'1'),
 ('130229','河北省唐山市玉田县','河北省唐山市玉田县','3','130200','CN',NULL,'1'),
 ('130230','河北省唐山市唐海县','河北省唐山市唐海县','3','130200','CN',NULL,'1'),
 ('130281','河北省唐山市遵化市','河北省唐山市遵化市','3','130200','CN',NULL,'1'),
 ('130283','河北省唐山市迁安市','河北省唐山市迁安市','3','130200','CN',NULL,'1'),
 ('130300','河北省秦皇岛市','河北省秦皇岛市','2','130000','CN',NULL,'1'),
 ('130301','河北省秦皇岛市市辖区','河北省秦皇岛市市辖区','3','130300','CN',NULL,'1'),
 ('130302','河北省秦皇岛市海港区','河北省秦皇岛市海港区','3','130300','CN',NULL,'1'),
 ('130303','河北省秦皇岛市山海关区','河北省秦皇岛市山海关区','3','130300','CN',NULL,'1'),
 ('130304','河北省秦皇岛市北戴河区','河北省秦皇岛市北戴河区','3','130300','CN',NULL,'1'),
 ('130321','河北省秦皇岛市青龙满族自治县','河北省秦皇岛市青龙满族自治县','3','130300','CN',NULL,'1'),
 ('130322','河北省秦皇岛市昌黎县','河北省秦皇岛市昌黎县','3','130300','CN',NULL,'1'),
 ('130323','河北省秦皇岛市抚宁县','河北省秦皇岛市抚宁县','3','130300','CN',NULL,'1'),
 ('130324','河北省秦皇岛市卢龙县','河北省秦皇岛市卢龙县','3','130300','CN',NULL,'1'),
 ('130400','河北省邯郸市','河北省邯郸市','2','130000','CN',NULL,'1'),
 ('130401','河北省邯郸市市辖区','河北省邯郸市市辖区','3','130400','CN',NULL,'1'),
 ('130402','河北省邯郸市邯山区','河北省邯郸市邯山区','3','130400','CN',NULL,'1'),
 ('130403','河北省邯郸市丛台区','河北省邯郸市丛台区','3','130400','CN',NULL,'1'),
 ('130404','河北省邯郸市复兴区','河北省邯郸市复兴区','3','130400','CN',NULL,'1'),
 ('130406','河北省邯郸市峰峰矿区','河北省邯郸市峰峰矿区','3','130400','CN',NULL,'1'),
 ('130421','河北省邯郸市邯郸县','河北省邯郸市邯郸县','3','130400','CN',NULL,'1'),
 ('130423','河北省邯郸市临漳县','河北省邯郸市临漳县','3','130400','CN',NULL,'1'),
 ('130424','河北省邯郸市成安县','河北省邯郸市成安县','3','130400','CN',NULL,'1'),
 ('130425','河北省邯郸市大名县','河北省邯郸市大名县','3','130400','CN',NULL,'1'),
 ('130426','河北省邯郸市涉县','河北省邯郸市涉县','3','130400','CN',NULL,'1'),
 ('130427','河北省邯郸市磁县','河北省邯郸市磁县','3','130400','CN',NULL,'1'),
 ('130428','河北省邯郸市肥乡县','河北省邯郸市肥乡县','3','130400','CN',NULL,'1'),
 ('130429','河北省邯郸市永年县','河北省邯郸市永年县','3','130400','CN',NULL,'1'),
 ('130430','河北省邯郸市邱县','河北省邯郸市邱县','3','130400','CN',NULL,'1'),
 ('130431','河北省邯郸市鸡泽县','河北省邯郸市鸡泽县','3','130400','CN',NULL,'1'),
 ('130432','河北省邯郸市广平县','河北省邯郸市广平县','3','130400','CN',NULL,'1'),
 ('130433','河北省邯郸市馆陶县','河北省邯郸市馆陶县','3','130400','CN',NULL,'1'),
 ('130434','河北省邯郸市魏县','河北省邯郸市魏县','3','130400','CN',NULL,'1'),
 ('130435','河北省邯郸市曲周县','河北省邯郸市曲周县','3','130400','CN',NULL,'1'),
 ('130481','河北省邯郸市武安市','河北省邯郸市武安市','3','130400','CN',NULL,'1'),
 ('130500','河北省邢台市','河北省邢台市','2','130000','CN',NULL,'1'),
 ('130501','河北省邢台市市辖区','河北省邢台市市辖区','3','130500','CN',NULL,'1'),
 ('130502','河北省邢台市桥东区','河北省邢台市桥东区','3','130500','CN',NULL,'1'),
 ('130503','河北省邢台市桥西区','河北省邢台市桥西区','3','130500','CN',NULL,'1'),
 ('130521','河北省邢台市邢台县','河北省邢台市邢台县','3','130500','CN',NULL,'1'),
 ('130522','河北省邢台市临城县','河北省邢台市临城县','3','130500','CN',NULL,'1'),
 ('130523','河北省邢台市内丘县','河北省邢台市内丘县','3','130500','CN',NULL,'1'),
 ('130524','河北省邢台市柏乡县','河北省邢台市柏乡县','3','130500','CN',NULL,'1'),
 ('130525','河北省邢台市隆尧县','河北省邢台市隆尧县','3','130500','CN',NULL,'1'),
 ('130526','河北省邢台市任县','河北省邢台市任县','3','130500','CN',NULL,'1'),
 ('130527','河北省邢台市南和县','河北省邢台市南和县','3','130500','CN',NULL,'1'),
 ('130528','河北省邢台市宁晋县','河北省邢台市宁晋县','3','130500','CN',NULL,'1'),
 ('130529','河北省邢台市巨鹿县','河北省邢台市巨鹿县','3','130500','CN',NULL,'1'),
 ('130530','河北省邢台市新河县','河北省邢台市新河县','3','130500','CN',NULL,'1'),
 ('130531','河北省邢台市广宗县','河北省邢台市广宗县','3','130500','CN',NULL,'1'),
 ('130532','河北省邢台市平乡县','河北省邢台市平乡县','3','130500','CN',NULL,'1'),
 ('130533','河北省邢台市威县','河北省邢台市威县','3','130500','CN',NULL,'1'),
 ('130534','河北省邢台市清河县','河北省邢台市清河县','3','130500','CN',NULL,'1'),
 ('130535','河北省邢台市临西县','河北省邢台市临西县','3','130500','CN',NULL,'1'),
 ('130581','河北省邢台市南宫市','河北省邢台市南宫市','3','130500','CN',NULL,'1'),
 ('130582','河北省邢台市沙河市','河北省邢台市沙河市','3','130500','CN',NULL,'1'),
 ('130600','河北省保定市','河北省保定市','2','130000','CN',NULL,'1'),
 ('130601','河北省保定市市辖区','河北省保定市市辖区','3','130600','CN',NULL,'1'),
 ('130602','河北省保定市新市区','河北省保定市新市区','3','130600','CN',NULL,'1'),
 ('130603','河北省保定市北市区','河北省保定市北市区','3','130600','CN',NULL,'1'),
 ('130604','河北省保定市南市区','河北省保定市南市区','3','130600','CN',NULL,'1'),
 ('130621','河北省保定市满城县','河北省保定市满城县','3','130600','CN',NULL,'1'),
 ('130622','河北省保定市清苑县','河北省保定市清苑县','3','130600','CN',NULL,'1'),
 ('130623','河北省保定市涞水县','河北省保定市涞水县','3','130600','CN',NULL,'1'),
 ('130624','河北省保定市阜平县','河北省保定市阜平县','3','130600','CN',NULL,'1'),
 ('130625','河北省保定市徐水县','河北省保定市徐水县','3','130600','CN',NULL,'1'),
 ('130626','河北省保定市定兴县','河北省保定市定兴县','3','130600','CN',NULL,'1'),
 ('130627','河北省保定市唐县','河北省保定市唐县','3','130600','CN',NULL,'1'),
 ('130628','河北省保定市高阳县','河北省保定市高阳县','3','130600','CN',NULL,'1'),
 ('130629','河北省保定市容城县','河北省保定市容城县','3','130600','CN',NULL,'1'),
 ('130630','河北省保定市涞源县','河北省保定市涞源县','3','130600','CN',NULL,'1'),
 ('130631','河北省保定市望都县','河北省保定市望都县','3','130600','CN',NULL,'1'),
 ('130632','河北省保定市安新县','河北省保定市安新县','3','130600','CN',NULL,'1'),
 ('130633','河北省保定市易县','河北省保定市易县','3','130600','CN',NULL,'1'),
 ('130634','河北省保定市曲阳县','河北省保定市曲阳县','3','130600','CN',NULL,'1'),
 ('130635','河北省保定市蠡县','河北省保定市蠡县','3','130600','CN',NULL,'1'),
 ('130636','河北省保定市顺平县','河北省保定市顺平县','3','130600','CN',NULL,'1'),
 ('130637','河北省保定市博野县','河北省保定市博野县','3','130600','CN',NULL,'1'),
 ('130638','河北省保定市雄县','河北省保定市雄县','3','130600','CN',NULL,'1'),
 ('130681','河北省保定市涿州市','河北省保定市涿州市','3','130600','CN',NULL,'1'),
 ('130682','河北省保定市定州市','河北省保定市定州市','3','130600','CN',NULL,'1'),
 ('130683','河北省保定市安国市','河北省保定市安国市','3','130600','CN',NULL,'1'),
 ('130684','河北省保定市高碑店市','河北省保定市高碑店市','3','130600','CN',NULL,'1'),
 ('130700','河北省张家口市','河北省张家口市','2','130000','CN',NULL,'1'),
 ('130701','河北省张家口市市辖区','河北省张家口市市辖区','3','130700','CN',NULL,'1'),
 ('130702','河北省张家口市桥东区','河北省张家口市桥东区','3','130700','CN',NULL,'1'),
 ('130703','河北省张家口市桥西区','河北省张家口市桥西区','3','130700','CN',NULL,'1'),
 ('130705','河北省张家口市宣化区','河北省张家口市宣化区','3','130700','CN',NULL,'1'),
 ('130706','河北省张家口市下花园区','河北省张家口市下花园区','3','130700','CN',NULL,'1'),
 ('130721','河北省张家口市宣化县','河北省张家口市宣化县','3','130700','CN',NULL,'1'),
 ('130722','河北省张家口市张北县','河北省张家口市张北县','3','130700','CN',NULL,'1'),
 ('130723','河北省张家口市康保县','河北省张家口市康保县','3','130700','CN',NULL,'1'),
 ('130724','河北省张家口市沽源县','河北省张家口市沽源县','3','130700','CN',NULL,'1'),
 ('130725','河北省张家口市尚义县','河北省张家口市尚义县','3','130700','CN',NULL,'1'),
 ('130726','河北省张家口市蔚县','河北省张家口市蔚县','3','130700','CN',NULL,'1'),
 ('130727','河北省张家口市阳原县','河北省张家口市阳原县','3','130700','CN',NULL,'1'),
 ('130728','河北省张家口市怀安县','河北省张家口市怀安县','3','130700','CN',NULL,'1'),
 ('130729','河北省张家口市万全县','河北省张家口市万全县','3','130700','CN',NULL,'1'),
 ('130730','河北省张家口市怀来县','河北省张家口市怀来县','3','130700','CN',NULL,'1'),
 ('130731','河北省张家口市涿鹿县','河北省张家口市涿鹿县','3','130700','CN',NULL,'1'),
 ('130732','河北省张家口市赤城县','河北省张家口市赤城县','3','130700','CN',NULL,'1'),
 ('130733','河北省张家口市崇礼县','河北省张家口市崇礼县','3','130700','CN',NULL,'1'),
 ('130800','河北省承德市','河北省承德市','2','130000','CN',NULL,'1'),
 ('130801','河北省承德市市辖区','河北省承德市市辖区','3','130800','CN',NULL,'1'),
 ('130802','河北省承德市双桥区','河北省承德市双桥区','3','130800','CN',NULL,'1'),
 ('130803','河北省承德市双滦区','河北省承德市双滦区','3','130800','CN',NULL,'1'),
 ('130804','河北省承德市鹰手营子矿区','河北省承德市鹰手营子矿区','3','130800','CN',NULL,'1'),
 ('130821','河北省承德市承德县','河北省承德市承德县','3','130800','CN',NULL,'1'),
 ('130822','河北省承德市兴隆县','河北省承德市兴隆县','3','130800','CN',NULL,'1'),
 ('130823','河北省承德市平泉县','河北省承德市平泉县','3','130800','CN',NULL,'1'),
 ('130824','河北省承德市滦平县','河北省承德市滦平县','3','130800','CN',NULL,'1'),
 ('130825','河北省承德市隆化县','河北省承德市隆化县','3','130800','CN',NULL,'1'),
 ('130826','河北省承德市丰宁满族自治县','河北省承德市丰宁满族自治县','3','130800','CN',NULL,'1'),
 ('130827','河北省承德市宽城满族自治县','河北省承德市宽城满族自治县','3','130800','CN',NULL,'1'),
 ('130828','河北省承德市围场满族蒙古族自治县','河北省承德市围场满族蒙古族自治县','3','130800','CN',NULL,'1'),
 ('130900','河北省沧州市','河北省沧州市','2','130000','CN',NULL,'1'),
 ('130901','河北省沧州市市辖区','河北省沧州市市辖区','3','130900','CN',NULL,'1'),
 ('130902','河北省沧州市新华区','河北省沧州市新华区','3','130900','CN',NULL,'1'),
 ('130903','河北省沧州市运河区','河北省沧州市运河区','3','130900','CN',NULL,'1'),
 ('130921','河北省沧州市沧县','河北省沧州市沧县','3','130900','CN',NULL,'1'),
 ('130922','河北省沧州市青县','河北省沧州市青县','3','130900','CN',NULL,'1'),
 ('130923','河北省沧州市东光县','河北省沧州市东光县','3','130900','CN',NULL,'1'),
 ('130924','河北省沧州市海兴县','河北省沧州市海兴县','3','130900','CN',NULL,'1'),
 ('130925','河北省沧州市盐山县','河北省沧州市盐山县','3','130900','CN',NULL,'1'),
 ('130926','河北省沧州市肃宁县','河北省沧州市肃宁县','3','130900','CN',NULL,'1'),
 ('130927','河北省沧州市南皮县','河北省沧州市南皮县','3','130900','CN',NULL,'1'),
 ('130928','河北省沧州市吴桥县','河北省沧州市吴桥县','3','130900','CN',NULL,'1'),
 ('130929','河北省沧州市献县','河北省沧州市献县','3','130900','CN',NULL,'1'),
 ('130930','河北省沧州市孟村回族自治县','河北省沧州市孟村回族自治县','3','130900','CN',NULL,'1'),
 ('130981','河北省沧州市泊头市','河北省沧州市泊头市','3','130900','CN',NULL,'1'),
 ('130982','河北省沧州市任丘市','河北省沧州市任丘市','3','130900','CN',NULL,'1'),
 ('130983','河北省沧州市黄骅市','河北省沧州市黄骅市','3','130900','CN',NULL,'1'),
 ('130984','河北省沧州市河间市','河北省沧州市河间市','3','130900','CN',NULL,'1'),
 ('131000','河北省廊坊市','河北省廊坊市','2','130000','CN',NULL,'1'),
 ('131001','河北省廊坊市市辖区','河北省廊坊市市辖区','3','131000','CN',NULL,'1'),
 ('131002','河北省廊坊市安次区','河北省廊坊市安次区','3','131000','CN',NULL,'1'),
 ('131003','河北省廊坊市广阳区','河北省廊坊市广阳区','3','131000','CN',NULL,'1'),
 ('131022','河北省廊坊市固安县','河北省廊坊市固安县','3','131000','CN',NULL,'1'),
 ('131023','河北省廊坊市永清县','河北省廊坊市永清县','3','131000','CN',NULL,'1'),
 ('131024','河北省廊坊市香河县','河北省廊坊市香河县','3','131000','CN',NULL,'1'),
 ('131025','河北省廊坊市大城县','河北省廊坊市大城县','3','131000','CN',NULL,'1'),
 ('131026','河北省廊坊市文安县','河北省廊坊市文安县','3','131000','CN',NULL,'1'),
 ('131028','河北省廊坊市大厂回族自治县','河北省廊坊市大厂回族自治县','3','131000','CN',NULL,'1'),
 ('131081','河北省廊坊市霸州市','河北省廊坊市霸州市','3','131000','CN',NULL,'1'),
 ('131082','河北省廊坊市三河市','河北省廊坊市三河市','3','131000','CN',NULL,'1'),
 ('131100','河北省衡水市','河北省衡水市','2','130000','CN',NULL,'1'),
 ('131101','河北省衡水市市辖区','河北省衡水市市辖区','3','131100','CN',NULL,'1'),
 ('131102','河北省衡水市桃城区','河北省衡水市桃城区','3','131100','CN',NULL,'1'),
 ('131121','河北省衡水市枣强县','河北省衡水市枣强县','3','131100','CN',NULL,'1'),
 ('131122','河北省衡水市武邑县','河北省衡水市武邑县','3','131100','CN',NULL,'1'),
 ('131123','河北省衡水市武强县','河北省衡水市武强县','3','131100','CN',NULL,'1'),
 ('131124','河北省衡水市饶阳县','河北省衡水市饶阳县','3','131100','CN',NULL,'1'),
 ('131125','河北省衡水市安平县','河北省衡水市安平县','3','131100','CN',NULL,'1'),
 ('131126','河北省衡水市故城县','河北省衡水市故城县','3','131100','CN',NULL,'1'),
 ('131127','河北省衡水市景县','河北省衡水市景县','3','131100','CN',NULL,'1'),
 ('131128','河北省衡水市阜城县','河北省衡水市阜城县','3','131100','CN',NULL,'1'),
 ('131181','河北省衡水市冀州市','河北省衡水市冀州市','3','131100','CN',NULL,'1'),
 ('131182','河北省衡水市深州市','河北省衡水市深州市','3','131100','CN',NULL,'1'),
 ('140000','山西省','山西省','1','CN','CN',NULL,'1'),
 ('140100','山西省太原市','山西省太原市','2','140000','CN',NULL,'1'),
 ('140101','山西省太原市市辖区','山西省太原市市辖区','3','140100','CN',NULL,'1'),
 ('140105','山西省太原市小店区','山西省太原市小店区','3','140100','CN',NULL,'1'),
 ('140106','山西省太原市迎泽区','山西省太原市迎泽区','3','140100','CN',NULL,'1'),
 ('140107','山西省太原市杏花岭区','山西省太原市杏花岭区','3','140100','CN',NULL,'1'),
 ('140108','山西省太原市尖草坪区','山西省太原市尖草坪区','3','140100','CN',NULL,'1'),
 ('140109','山西省太原市万柏林区','山西省太原市万柏林区','3','140100','CN',NULL,'1'),
 ('140110','山西省太原市晋源区','山西省太原市晋源区','3','140100','CN',NULL,'1'),
 ('140121','山西省太原市清徐县','山西省太原市清徐县','3','140100','CN',NULL,'1'),
 ('140122','山西省太原市阳曲县','山西省太原市阳曲县','3','140100','CN',NULL,'1'),
 ('140123','山西省太原市娄烦县','山西省太原市娄烦县','3','140100','CN',NULL,'1'),
 ('140181','山西省太原市古交市','山西省太原市古交市','3','140100','CN',NULL,'1'),
 ('140200','山西省大同市','山西省大同市','2','140000','CN',NULL,'1'),
 ('140201','山西省大同市市辖区','山西省大同市市辖区','3','140200','CN',NULL,'1'),
 ('140202','山西省大同市城区','山西省大同市城区','3','140200','CN',NULL,'1'),
 ('140203','山西省大同市矿区','山西省大同市矿区','3','140200','CN',NULL,'1'),
 ('140211','山西省大同市南郊区','山西省大同市南郊区','3','140200','CN',NULL,'1'),
 ('140212','山西省大同市新荣区','山西省大同市新荣区','3','140200','CN',NULL,'1'),
 ('140221','山西省大同市阳高县','山西省大同市阳高县','3','140200','CN',NULL,'1'),
 ('140222','山西省大同市天镇县','山西省大同市天镇县','3','140200','CN',NULL,'1'),
 ('140223','山西省大同市广灵县','山西省大同市广灵县','3','140200','CN',NULL,'1'),
 ('140224','山西省大同市灵丘县','山西省大同市灵丘县','3','140200','CN',NULL,'1'),
 ('140225','山西省大同市浑源县','山西省大同市浑源县','3','140200','CN',NULL,'1'),
 ('140226','山西省大同市左云县','山西省大同市左云县','3','140200','CN',NULL,'1'),
 ('140227','山西省大同市大同县','山西省大同市大同县','3','140200','CN',NULL,'1'),
 ('140300','山西省阳泉市','山西省阳泉市','2','140000','CN',NULL,'1'),
 ('140301','山西省阳泉市市辖区','山西省阳泉市市辖区','3','140300','CN',NULL,'1'),
 ('140302','山西省阳泉市城区','山西省阳泉市城区','3','140300','CN',NULL,'1'),
 ('140303','山西省阳泉市矿区','山西省阳泉市矿区','3','140300','CN',NULL,'1'),
 ('140311','山西省阳泉市郊区','山西省阳泉市郊区','3','140300','CN',NULL,'1'),
 ('140321','山西省阳泉市平定县','山西省阳泉市平定县','3','140300','CN',NULL,'1'),
 ('140322','山西省阳泉市盂县','山西省阳泉市盂县','3','140300','CN',NULL,'1'),
 ('140400','山西省长治市','山西省长治市','2','140000','CN',NULL,'1'),
 ('140401','山西省长治市市辖区','山西省长治市市辖区','3','140400','CN',NULL,'1'),
 ('140402','山西省长治市城区','山西省长治市城区','3','140400','CN',NULL,'1'),
 ('140411','山西省长治市郊区','山西省长治市郊区','3','140400','CN',NULL,'1'),
 ('140421','山西省长治市长治县','山西省长治市长治县','3','140400','CN',NULL,'1'),
 ('140423','山西省长治市襄垣县','山西省长治市襄垣县','3','140400','CN',NULL,'1'),
 ('140424','山西省长治市屯留县','山西省长治市屯留县','3','140400','CN',NULL,'1'),
 ('140425','山西省长治市平顺县','山西省长治市平顺县','3','140400','CN',NULL,'1'),
 ('140426','山西省长治市黎城县','山西省长治市黎城县','3','140400','CN',NULL,'1'),
 ('140427','山西省长治市壶关县','山西省长治市壶关县','3','140400','CN',NULL,'1'),
 ('140428','山西省长治市长子县','山西省长治市长子县','3','140400','CN',NULL,'1'),
 ('140429','山西省长治市武乡县','山西省长治市武乡县','3','140400','CN',NULL,'1'),
 ('140430','山西省长治市沁县','山西省长治市沁县','3','140400','CN',NULL,'1'),
 ('140431','山西省长治市沁源县','山西省长治市沁源县','3','140400','CN',NULL,'1'),
 ('140481','山西省长治市潞城市','山西省长治市潞城市','3','140400','CN',NULL,'1'),
 ('140500','山西省晋城市','山西省晋城市','2','140000','CN',NULL,'1'),
 ('140501','山西省晋城市市辖区','山西省晋城市市辖区','3','140500','CN',NULL,'1'),
 ('140502','山西省晋城市城区','山西省晋城市城区','3','140500','CN',NULL,'1'),
 ('140521','山西省晋城市沁水县','山西省晋城市沁水县','3','140500','CN',NULL,'1'),
 ('140522','山西省晋城市阳城县','山西省晋城市阳城县','3','140500','CN',NULL,'1'),
 ('140524','山西省晋城市陵川县','山西省晋城市陵川县','3','140500','CN',NULL,'1'),
 ('140525','山西省晋城市泽州县','山西省晋城市泽州县','3','140500','CN',NULL,'1'),
 ('140581','山西省晋城市高平市','山西省晋城市高平市','3','140500','CN',NULL,'1'),
 ('140600','山西省朔州市','山西省朔州市','2','140000','CN',NULL,'1'),
 ('140601','山西省朔州市市辖区','山西省朔州市市辖区','3','140600','CN',NULL,'1'),
 ('140602','山西省朔州市朔城区','山西省朔州市朔城区','3','140600','CN',NULL,'1'),
 ('140603','山西省朔州市平鲁区','山西省朔州市平鲁区','3','140600','CN',NULL,'1'),
 ('140621','山西省朔州市山阴县','山西省朔州市山阴县','3','140600','CN',NULL,'1'),
 ('140622','山西省朔州市应县','山西省朔州市应县','3','140600','CN',NULL,'1'),
 ('140623','山西省朔州市右玉县','山西省朔州市右玉县','3','140600','CN',NULL,'1'),
 ('140624','山西省朔州市怀仁县','山西省朔州市怀仁县','3','140600','CN',NULL,'1'),
 ('140700','山西省晋中市','山西省晋中市','2','140000','CN',NULL,'1'),
 ('140701','山西省晋中市市辖区','山西省晋中市市辖区','3','140700','CN',NULL,'1'),
 ('140702','山西省晋中市榆次区','山西省晋中市榆次区','3','140700','CN',NULL,'1'),
 ('140721','山西省晋中市榆社县','山西省晋中市榆社县','3','140700','CN',NULL,'1'),
 ('140722','山西省晋中市左权县','山西省晋中市左权县','3','140700','CN',NULL,'1'),
 ('140723','山西省晋中市和顺县','山西省晋中市和顺县','3','140700','CN',NULL,'1'),
 ('140724','山西省晋中市昔阳县','山西省晋中市昔阳县','3','140700','CN',NULL,'1'),
 ('140725','山西省晋中市寿阳县','山西省晋中市寿阳县','3','140700','CN',NULL,'1'),
 ('140726','山西省晋中市太谷县','山西省晋中市太谷县','3','140700','CN',NULL,'1'),
 ('140727','山西省晋中市祁县','山西省晋中市祁县','3','140700','CN',NULL,'1'),
 ('140728','山西省晋中市平遥县','山西省晋中市平遥县','3','140700','CN',NULL,'1'),
 ('140729','山西省晋中市灵石县','山西省晋中市灵石县','3','140700','CN',NULL,'1'),
 ('140781','山西省晋中市介休市','山西省晋中市介休市','3','140700','CN',NULL,'1'),
 ('140800','山西省运城市','山西省运城市','2','140000','CN',NULL,'1'),
 ('140801','山西省运城市市辖区','山西省运城市市辖区','3','140800','CN',NULL,'1'),
 ('140802','山西省运城市盐湖区','山西省运城市盐湖区','3','140800','CN',NULL,'1'),
 ('140821','山西省运城市临猗县','山西省运城市临猗县','3','140800','CN',NULL,'1'),
 ('140822','山西省运城市万荣县','山西省运城市万荣县','3','140800','CN',NULL,'1'),
 ('140823','山西省运城市闻喜县','山西省运城市闻喜县','3','140800','CN',NULL,'1'),
 ('140824','山西省运城市稷山县','山西省运城市稷山县','3','140800','CN',NULL,'1'),
 ('140825','山西省运城市新绛县','山西省运城市新绛县','3','140800','CN',NULL,'1'),
 ('140826','山西省运城市绛县','山西省运城市绛县','3','140800','CN',NULL,'1'),
 ('140827','山西省运城市垣曲县','山西省运城市垣曲县','3','140800','CN',NULL,'1'),
 ('140828','山西省运城市夏县','山西省运城市夏县','3','140800','CN',NULL,'1'),
 ('140829','山西省运城市平陆县','山西省运城市平陆县','3','140800','CN',NULL,'1'),
 ('140830','山西省运城市芮城县','山西省运城市芮城县','3','140800','CN',NULL,'1'),
 ('140881','山西省运城市永济市','山西省运城市永济市','3','140800','CN',NULL,'1'),
 ('140882','山西省运城市河津市','山西省运城市河津市','3','140800','CN',NULL,'1'),
 ('140900','山西省忻州市','山西省忻州市','2','140000','CN',NULL,'1'),
 ('140901','山西省忻州市市辖区','山西省忻州市市辖区','3','140900','CN',NULL,'1'),
 ('140902','山西省忻州市忻府区','山西省忻州市忻府区','3','140900','CN',NULL,'1'),
 ('140921','山西省忻州市定襄县','山西省忻州市定襄县','3','140900','CN',NULL,'1'),
 ('140922','山西省忻州市五台县','山西省忻州市五台县','3','140900','CN',NULL,'1'),
 ('140923','山西省忻州市代县','山西省忻州市代县','3','140900','CN',NULL,'1'),
 ('140924','山西省忻州市繁峙县','山西省忻州市繁峙县','3','140900','CN',NULL,'1'),
 ('140925','山西省忻州市宁武县','山西省忻州市宁武县','3','140900','CN',NULL,'1'),
 ('140926','山西省忻州市静乐县','山西省忻州市静乐县','3','140900','CN',NULL,'1'),
 ('140927','山西省忻州市神池县','山西省忻州市神池县','3','140900','CN',NULL,'1'),
 ('140928','山西省忻州市五寨县','山西省忻州市五寨县','3','140900','CN',NULL,'1'),
 ('140929','山西省忻州市岢岚县','山西省忻州市岢岚县','3','140900','CN',NULL,'1'),
 ('140930','山西省忻州市河曲县','山西省忻州市河曲县','3','140900','CN',NULL,'1'),
 ('140931','山西省忻州市保德县','山西省忻州市保德县','3','140900','CN',NULL,'1'),
 ('140932','山西省忻州市偏关县','山西省忻州市偏关县','3','140900','CN',NULL,'1'),
 ('140981','山西省忻州市原平市','山西省忻州市原平市','3','140900','CN',NULL,'1'),
 ('141000','山西省临汾市','山西省临汾市','2','140000','CN',NULL,'1'),
 ('141001','山西省临汾市市辖区','山西省临汾市市辖区','3','141000','CN',NULL,'1'),
 ('141002','山西省临汾市尧都区','山西省临汾市尧都区','3','141000','CN',NULL,'1'),
 ('141021','山西省临汾市曲沃县','山西省临汾市曲沃县','3','141000','CN',NULL,'1'),
 ('141022','山西省临汾市翼城县','山西省临汾市翼城县','3','141000','CN',NULL,'1'),
 ('141023','山西省临汾市襄汾县','山西省临汾市襄汾县','3','141000','CN',NULL,'1'),
 ('141024','山西省临汾市洪洞县','山西省临汾市洪洞县','3','141000','CN',NULL,'1'),
 ('141025','山西省临汾市古县','山西省临汾市古县','3','141000','CN',NULL,'1'),
 ('141026','山西省临汾市安泽县','山西省临汾市安泽县','3','141000','CN',NULL,'1'),
 ('141027','山西省临汾市浮山县','山西省临汾市浮山县','3','141000','CN',NULL,'1'),
 ('141028','山西省临汾市吉县','山西省临汾市吉县','3','141000','CN',NULL,'1'),
 ('141029','山西省临汾市乡宁县','山西省临汾市乡宁县','3','141000','CN',NULL,'1'),
 ('141030','山西省临汾市大宁县','山西省临汾市大宁县','3','141000','CN',NULL,'1'),
 ('141031','山西省临汾市隰县','山西省临汾市隰县','3','141000','CN',NULL,'1'),
 ('141032','山西省临汾市永和县','山西省临汾市永和县','3','141000','CN',NULL,'1'),
 ('141033','山西省临汾市蒲县','山西省临汾市蒲县','3','141000','CN',NULL,'1'),
 ('141034','山西省临汾市汾西县','山西省临汾市汾西县','3','141000','CN',NULL,'1'),
 ('141081','山西省临汾市侯马市','山西省临汾市侯马市','3','141000','CN',NULL,'1'),
 ('141082','山西省临汾市霍州市','山西省临汾市霍州市','3','141000','CN',NULL,'1'),
 ('141100','山西省吕梁市','山西省吕梁市','2','140000','CN',NULL,'1'),
 ('141101','山西省吕梁市市辖区','山西省吕梁市市辖区','3','141100','CN',NULL,'1'),
 ('141102','山西省吕梁市离石区','山西省吕梁市离石区','3','141100','CN',NULL,'1'),
 ('141121','山西省吕梁市文水县','山西省吕梁市文水县','3','141100','CN',NULL,'1'),
 ('141122','山西省吕梁市交城县','山西省吕梁市交城县','3','141100','CN',NULL,'1'),
 ('141123','山西省吕梁市兴县','山西省吕梁市兴县','3','141100','CN',NULL,'1'),
 ('141124','山西省吕梁市临县','山西省吕梁市临县','3','141100','CN',NULL,'1'),
 ('141125','山西省吕梁市柳林县','山西省吕梁市柳林县','3','141100','CN',NULL,'1'),
 ('141126','山西省吕梁市石楼县','山西省吕梁市石楼县','3','141100','CN',NULL,'1'),
 ('141127','山西省吕梁市岚县','山西省吕梁市岚县','3','141100','CN',NULL,'1'),
 ('141128','山西省吕梁市方山县','山西省吕梁市方山县','3','141100','CN',NULL,'1'),
 ('141129','山西省吕梁市中阳县','山西省吕梁市中阳县','3','141100','CN',NULL,'1'),
 ('141130','山西省吕梁市交口县','山西省吕梁市交口县','3','141100','CN',NULL,'1'),
 ('141181','山西省吕梁市孝义市','山西省吕梁市孝义市','3','141100','CN',NULL,'1'),
 ('141182','山西省吕梁市汾阳市','山西省吕梁市汾阳市','3','141100','CN',NULL,'1'),
 ('150000','内蒙古自治区','内蒙古自治区','1','CN','CN',NULL,'1'),
 ('150100','内蒙古自治区呼和浩特市','内蒙古自治区呼和浩特市','2','150000','CN',NULL,'1'),
 ('150101','内蒙古自治区呼和浩特市市辖区','内蒙古自治区呼和浩特市市辖区','3','150100','CN',NULL,'1'),
 ('150102','内蒙古自治区呼和浩特市新城区','内蒙古自治区呼和浩特市新城区','3','150100','CN',NULL,'1'),
 ('150103','内蒙古自治区呼和浩特市回民区','内蒙古自治区呼和浩特市回民区','3','150100','CN',NULL,'1'),
 ('150104','内蒙古自治区呼和浩特市玉泉区','内蒙古自治区呼和浩特市玉泉区','3','150100','CN',NULL,'1'),
 ('150105','内蒙古自治区呼和浩特市赛罕区','内蒙古自治区呼和浩特市赛罕区','3','150100','CN',NULL,'1'),
 ('150121','内蒙古自治区呼和浩特市土默特左旗','内蒙古自治区呼和浩特市土默特左旗','3','150100','CN',NULL,'1'),
 ('150122','内蒙古自治区呼和浩特市托克托县','内蒙古自治区呼和浩特市托克托县','3','150100','CN',NULL,'1'),
 ('150123','内蒙古自治区呼和浩特市和林格尔县','内蒙古自治区呼和浩特市和林格尔县','3','150100','CN',NULL,'1'),
 ('150124','内蒙古自治区呼和浩特市清水河县','内蒙古自治区呼和浩特市清水河县','3','150100','CN',NULL,'1'),
 ('150125','内蒙古自治区呼和浩特市武川县','内蒙古自治区呼和浩特市武川县','3','150100','CN',NULL,'1'),
 ('150200','内蒙古自治区包头市','内蒙古自治区包头市','2','150000','CN',NULL,'1'),
 ('150201','内蒙古自治区包头市市辖区','内蒙古自治区包头市市辖区','3','150200','CN',NULL,'1'),
 ('150202','内蒙古自治区包头市东河区','内蒙古自治区包头市东河区','3','150200','CN',NULL,'1'),
 ('150203','内蒙古自治区包头市昆都仑区','内蒙古自治区包头市昆都仑区','3','150200','CN',NULL,'1'),
 ('150204','内蒙古自治区包头市青山区','内蒙古自治区包头市青山区','3','150200','CN',NULL,'1'),
 ('150205','内蒙古自治区包头市石拐区','内蒙古自治区包头市石拐区','3','150200','CN',NULL,'1'),
 ('150206','内蒙古自治区包头市白云矿区','内蒙古自治区包头市白云矿区','3','150200','CN',NULL,'1'),
 ('150207','内蒙古自治区包头市九原区','内蒙古自治区包头市九原区','3','150200','CN',NULL,'1'),
 ('150221','内蒙古自治区包头市土默特右旗','内蒙古自治区包头市土默特右旗','3','150200','CN',NULL,'1'),
 ('150222','内蒙古自治区包头市固阳县','内蒙古自治区包头市固阳县','3','150200','CN',NULL,'1'),
 ('150223','内蒙古自治区包头市达尔罕茂明安联合旗','内蒙古自治区包头市达尔罕茂明安联合旗','3','150200','CN',NULL,'1'),
 ('150300','内蒙古自治区乌海市','内蒙古自治区乌海市','2','150000','CN',NULL,'1'),
 ('150301','内蒙古自治区乌海市市辖区','内蒙古自治区乌海市市辖区','3','150300','CN',NULL,'1'),
 ('150302','内蒙古自治区乌海市海勃湾区','内蒙古自治区乌海市海勃湾区','3','150300','CN',NULL,'1'),
 ('150303','内蒙古自治区乌海市海南区','内蒙古自治区乌海市海南区','3','150300','CN',NULL,'1'),
 ('150304','内蒙古自治区乌海市乌达区','内蒙古自治区乌海市乌达区','3','150300','CN',NULL,'1'),
 ('150400','内蒙古自治区赤峰市','内蒙古自治区赤峰市','2','150000','CN',NULL,'1'),
 ('150401','内蒙古自治区赤峰市市辖区','内蒙古自治区赤峰市市辖区','3','150400','CN',NULL,'1'),
 ('150402','内蒙古自治区赤峰市红山区','内蒙古自治区赤峰市红山区','3','150400','CN',NULL,'1'),
 ('150403','内蒙古自治区赤峰市元宝山区','内蒙古自治区赤峰市元宝山区','3','150400','CN',NULL,'1'),
 ('150404','内蒙古自治区赤峰市松山区','内蒙古自治区赤峰市松山区','3','150400','CN',NULL,'1'),
 ('150421','内蒙古自治区赤峰市阿鲁科尔沁旗','内蒙古自治区赤峰市阿鲁科尔沁旗','3','150400','CN',NULL,'1'),
 ('150422','内蒙古自治区赤峰市巴林左旗','内蒙古自治区赤峰市巴林左旗','3','150400','CN',NULL,'1'),
 ('150423','内蒙古自治区赤峰市巴林右旗','内蒙古自治区赤峰市巴林右旗','3','150400','CN',NULL,'1'),
 ('150424','内蒙古自治区赤峰市林西县','内蒙古自治区赤峰市林西县','3','150400','CN',NULL,'1'),
 ('150425','内蒙古自治区赤峰市克什克腾旗','内蒙古自治区赤峰市克什克腾旗','3','150400','CN',NULL,'1'),
 ('150426','内蒙古自治区赤峰市翁牛特旗','内蒙古自治区赤峰市翁牛特旗','3','150400','CN',NULL,'1'),
 ('150428','内蒙古自治区赤峰市喀喇沁旗','内蒙古自治区赤峰市喀喇沁旗','3','150400','CN',NULL,'1'),
 ('150429','内蒙古自治区赤峰市宁城县','内蒙古自治区赤峰市宁城县','3','150400','CN',NULL,'1'),
 ('150430','内蒙古自治区赤峰市敖汉旗','内蒙古自治区赤峰市敖汉旗','3','150400','CN',NULL,'1'),
 ('150500','内蒙古自治区通辽市','内蒙古自治区通辽市','2','150000','CN',NULL,'1'),
 ('150501','内蒙古自治区通辽市市辖区','内蒙古自治区通辽市市辖区','3','150500','CN',NULL,'1'),
 ('150502','内蒙古自治区通辽市科尔沁区','内蒙古自治区通辽市科尔沁区','3','150500','CN',NULL,'1'),
 ('150521','内蒙古自治区通辽市科尔沁左翼中旗','内蒙古自治区通辽市科尔沁左翼中旗','3','150500','CN',NULL,'1'),
 ('150522','内蒙古自治区通辽市科尔沁左翼后旗','内蒙古自治区通辽市科尔沁左翼后旗','3','150500','CN',NULL,'1'),
 ('150523','内蒙古自治区通辽市开鲁县','内蒙古自治区通辽市开鲁县','3','150500','CN',NULL,'1'),
 ('150524','内蒙古自治区通辽市库伦旗','内蒙古自治区通辽市库伦旗','3','150500','CN',NULL,'1'),
 ('150525','内蒙古自治区通辽市奈曼旗','内蒙古自治区通辽市奈曼旗','3','150500','CN',NULL,'1'),
 ('150526','内蒙古自治区通辽市扎鲁特旗','内蒙古自治区通辽市扎鲁特旗','3','150500','CN',NULL,'1'),
 ('150581','内蒙古自治区通辽市霍林郭勒市','内蒙古自治区通辽市霍林郭勒市','3','150500','CN',NULL,'1'),
 ('150600','内蒙古自治区鄂尔多斯市','内蒙古自治区鄂尔多斯市','2','150000','CN',NULL,'1'),
 ('150602','内蒙古自治区鄂尔多斯市东胜区','内蒙古自治区鄂尔多斯市东胜区','3','150600','CN',NULL,'1'),
 ('150621','内蒙古自治区鄂尔多斯市达拉特旗','内蒙古自治区鄂尔多斯市达拉特旗','3','150600','CN',NULL,'1'),
 ('150622','内蒙古自治区鄂尔多斯市准格尔旗','内蒙古自治区鄂尔多斯市准格尔旗','3','150600','CN',NULL,'1'),
 ('150623','内蒙古自治区鄂尔多斯市鄂托克前旗','内蒙古自治区鄂尔多斯市鄂托克前旗','3','150600','CN',NULL,'1'),
 ('150624','内蒙古自治区鄂尔多斯市鄂托克旗','内蒙古自治区鄂尔多斯市鄂托克旗','3','150600','CN',NULL,'1'),
 ('150625','内蒙古自治区鄂尔多斯市杭锦旗','内蒙古自治区鄂尔多斯市杭锦旗','3','150600','CN',NULL,'1'),
 ('150626','内蒙古自治区鄂尔多斯市乌审旗','内蒙古自治区鄂尔多斯市乌审旗','3','150600','CN',NULL,'1'),
 ('150627','内蒙古自治区鄂尔多斯市伊金霍洛旗','内蒙古自治区鄂尔多斯市伊金霍洛旗','3','150600','CN',NULL,'1'),
 ('150700','内蒙古自治区呼伦贝尔市','内蒙古自治区呼伦贝尔市','2','150000','CN',NULL,'1'),
 ('150701','内蒙古自治区呼伦贝尔市市辖区','内蒙古自治区呼伦贝尔市市辖区','3','150700','CN',NULL,'1'),
 ('150702','内蒙古自治区呼伦贝尔市海拉尔区','内蒙古自治区呼伦贝尔市海拉尔区','3','150700','CN',NULL,'1'),
 ('150721','内蒙古自治区呼伦贝尔市阿荣旗','内蒙古自治区呼伦贝尔市阿荣旗','3','150700','CN',NULL,'1'),
 ('150722','内蒙古自治区呼伦贝尔市莫力达瓦达斡尔族自治旗','内蒙古自治区呼伦贝尔市莫力达瓦达斡尔族自治旗','3','150700','CN',NULL,'1'),
 ('150723','内蒙古自治区呼伦贝尔市鄂伦春自治旗','内蒙古自治区呼伦贝尔市鄂伦春自治旗','3','150700','CN',NULL,'1'),
 ('150724','内蒙古自治区呼伦贝尔市鄂温克族自治旗','内蒙古自治区呼伦贝尔市鄂温克族自治旗','3','150700','CN',NULL,'1'),
 ('150725','内蒙古自治区呼伦贝尔市陈巴尔虎旗','内蒙古自治区呼伦贝尔市陈巴尔虎旗','3','150700','CN',NULL,'1'),
 ('150726','内蒙古自治区呼伦贝尔市新巴尔虎左旗','内蒙古自治区呼伦贝尔市新巴尔虎左旗','3','150700','CN',NULL,'1'),
 ('150727','内蒙古自治区呼伦贝尔市新巴尔虎右旗','内蒙古自治区呼伦贝尔市新巴尔虎右旗','3','150700','CN',NULL,'1'),
 ('150781','内蒙古自治区呼伦贝尔市满洲里市','内蒙古自治区呼伦贝尔市满洲里市','3','150700','CN',NULL,'1'),
 ('150782','内蒙古自治区呼伦贝尔市牙克石市','内蒙古自治区呼伦贝尔市牙克石市','3','150700','CN',NULL,'1'),
 ('150783','内蒙古自治区呼伦贝尔市扎兰屯市','内蒙古自治区呼伦贝尔市扎兰屯市','3','150700','CN',NULL,'1'),
 ('150784','内蒙古自治区呼伦贝尔市额尔古纳市','内蒙古自治区呼伦贝尔市额尔古纳市','3','150700','CN',NULL,'1'),
 ('150785','内蒙古自治区呼伦贝尔市根河市','内蒙古自治区呼伦贝尔市根河市','3','150700','CN',NULL,'1'),
 ('150800','内蒙古自治区巴彦淖尔市','内蒙古自治区巴彦淖尔市','2','150000','CN',NULL,'1'),
 ('150801','内蒙古自治区巴彦淖尔市市辖区','内蒙古自治区巴彦淖尔市市辖区','3','150800','CN',NULL,'1'),
 ('150802','内蒙古自治区巴彦淖尔市临河区','内蒙古自治区巴彦淖尔市临河区','3','150800','CN',NULL,'1'),
 ('150821','内蒙古自治区巴彦淖尔市五原县','内蒙古自治区巴彦淖尔市五原县','3','150800','CN',NULL,'1'),
 ('150822','内蒙古自治区巴彦淖尔市磴口县','内蒙古自治区巴彦淖尔市磴口县','3','150800','CN',NULL,'1'),
 ('150823','内蒙古自治区巴彦淖尔市乌拉特前旗','内蒙古自治区巴彦淖尔市乌拉特前旗','3','150800','CN',NULL,'1'),
 ('150824','内蒙古自治区巴彦淖尔市乌拉特中旗','内蒙古自治区巴彦淖尔市乌拉特中旗','3','150800','CN',NULL,'1'),
 ('150825','内蒙古自治区巴彦淖尔市乌拉特后旗','内蒙古自治区巴彦淖尔市乌拉特后旗','3','150800','CN',NULL,'1'),
 ('150826','内蒙古自治区巴彦淖尔市杭锦后旗','内蒙古自治区巴彦淖尔市杭锦后旗','3','150800','CN',NULL,'1'),
 ('150900','内蒙古自治区乌兰察布市','内蒙古自治区乌兰察布市','2','150000','CN',NULL,'1'),
 ('150901','内蒙古自治区乌兰察布市市辖区','内蒙古自治区乌兰察布市市辖区','3','150900','CN',NULL,'1'),
 ('150902','内蒙古自治区乌兰察布市集宁区','内蒙古自治区乌兰察布市集宁区','3','150900','CN',NULL,'1'),
 ('150921','内蒙古自治区乌兰察布市卓资县','内蒙古自治区乌兰察布市卓资县','3','150900','CN',NULL,'1'),
 ('150922','内蒙古自治区乌兰察布市化德县','内蒙古自治区乌兰察布市化德县','3','150900','CN',NULL,'1'),
 ('150923','内蒙古自治区乌兰察布市商都县','内蒙古自治区乌兰察布市商都县','3','150900','CN',NULL,'1'),
 ('150924','内蒙古自治区乌兰察布市兴和县','内蒙古自治区乌兰察布市兴和县','3','150900','CN',NULL,'1'),
 ('150925','内蒙古自治区乌兰察布市凉城县','内蒙古自治区乌兰察布市凉城县','3','150900','CN',NULL,'1'),
 ('150926','内蒙古自治区乌兰察布市察哈尔右翼前旗','内蒙古自治区乌兰察布市察哈尔右翼前旗','3','150900','CN',NULL,'1'),
 ('150927','内蒙古自治区乌兰察布市察哈尔右翼中旗','内蒙古自治区乌兰察布市察哈尔右翼中旗','3','150900','CN',NULL,'1'),
 ('150928','内蒙古自治区乌兰察布市察哈尔右翼后旗','内蒙古自治区乌兰察布市察哈尔右翼后旗','3','150900','CN',NULL,'1'),
 ('150929','内蒙古自治区乌兰察布市四子王旗','内蒙古自治区乌兰察布市四子王旗','3','150900','CN',NULL,'1'),
 ('150981','内蒙古自治区乌兰察布市丰镇市','内蒙古自治区乌兰察布市丰镇市','3','150900','CN',NULL,'1'),
 ('152200','内蒙古自治区兴安盟','内蒙古自治区兴安盟','2','150000','CN',NULL,'1'),
 ('152201','内蒙古自治区兴安盟乌兰浩特市','内蒙古自治区兴安盟乌兰浩特市','3','152200','CN',NULL,'1'),
 ('152202','内蒙古自治区兴安盟阿尔山市','内蒙古自治区兴安盟阿尔山市','3','152200','CN',NULL,'1'),
 ('152221','内蒙古自治区兴安盟科尔沁右翼前旗','内蒙古自治区兴安盟科尔沁右翼前旗','3','152200','CN',NULL,'1'),
 ('152222','内蒙古自治区兴安盟科尔沁右翼中旗','内蒙古自治区兴安盟科尔沁右翼中旗','3','152200','CN',NULL,'1'),
 ('152223','内蒙古自治区兴安盟扎赉特旗','内蒙古自治区兴安盟扎赉特旗','3','152200','CN',NULL,'1'),
 ('152224','内蒙古自治区兴安盟突泉县','内蒙古自治区兴安盟突泉县','3','152200','CN',NULL,'1'),
 ('152500','内蒙古自治区锡林郭勒盟','内蒙古自治区锡林郭勒盟','2','150000','CN',NULL,'1'),
 ('152501','内蒙古自治区锡林郭勒盟二连浩特市','内蒙古自治区锡林郭勒盟二连浩特市','3','152500','CN',NULL,'1'),
 ('152502','内蒙古自治区锡林郭勒盟锡林浩特市','内蒙古自治区锡林郭勒盟锡林浩特市','3','152500','CN',NULL,'1'),
 ('152522','内蒙古自治区锡林郭勒盟阿巴嘎旗','内蒙古自治区锡林郭勒盟阿巴嘎旗','3','152500','CN',NULL,'1'),
 ('152523','内蒙古自治区锡林郭勒盟苏尼特左旗','内蒙古自治区锡林郭勒盟苏尼特左旗','3','152500','CN',NULL,'1'),
 ('152524','内蒙古自治区锡林郭勒盟苏尼特右旗','内蒙古自治区锡林郭勒盟苏尼特右旗','3','152500','CN',NULL,'1'),
 ('152525','内蒙古自治区锡林郭勒盟东乌珠穆沁旗','内蒙古自治区锡林郭勒盟东乌珠穆沁旗','3','152500','CN',NULL,'1'),
 ('152526','内蒙古自治区锡林郭勒盟西乌珠穆沁旗','内蒙古自治区锡林郭勒盟西乌珠穆沁旗','3','152500','CN',NULL,'1'),
 ('152527','内蒙古自治区锡林郭勒盟太仆寺旗','内蒙古自治区锡林郭勒盟太仆寺旗','3','152500','CN',NULL,'1'),
 ('152528','内蒙古自治区锡林郭勒盟镶黄旗','内蒙古自治区锡林郭勒盟镶黄旗','3','152500','CN',NULL,'1'),
 ('152529','内蒙古自治区锡林郭勒盟正镶白旗','内蒙古自治区锡林郭勒盟正镶白旗','3','152500','CN',NULL,'1'),
 ('152530','内蒙古自治区锡林郭勒盟正蓝旗','内蒙古自治区锡林郭勒盟正蓝旗','3','152500','CN',NULL,'1'),
 ('152531','内蒙古自治区锡林郭勒盟多伦县','内蒙古自治区锡林郭勒盟多伦县','3','152500','CN',NULL,'1'),
 ('152900','内蒙古自治区阿拉善盟','内蒙古自治区阿拉善盟','2','150000','CN',NULL,'1'),
 ('152921','内蒙古自治区阿拉善盟阿拉善左旗','内蒙古自治区阿拉善盟阿拉善左旗','3','152900','CN',NULL,'1'),
 ('152922','内蒙古自治区阿拉善盟阿拉善右旗','内蒙古自治区阿拉善盟阿拉善右旗','3','152900','CN',NULL,'1'),
 ('152923','内蒙古自治区阿拉善盟额济纳旗','内蒙古自治区阿拉善盟额济纳旗','3','152900','CN',NULL,'1'),
 ('210000','辽宁省','辽宁省','1','CN','CN',NULL,'1'),
 ('210100','辽宁省沈阳市','辽宁省沈阳市','2','210000','CN',NULL,'1'),
 ('210101','辽宁省沈阳市市辖区','辽宁省沈阳市市辖区','3','210100','CN',NULL,'1'),
 ('210102','辽宁省沈阳市和平区','辽宁省沈阳市和平区','3','210100','CN',NULL,'1'),
 ('210103','辽宁省沈阳市沈河区','辽宁省沈阳市沈河区','3','210100','CN',NULL,'1'),
 ('210104','辽宁省沈阳市大东区','辽宁省沈阳市大东区','3','210100','CN',NULL,'1'),
 ('210105','辽宁省沈阳市皇姑区','辽宁省沈阳市皇姑区','3','210100','CN',NULL,'1'),
 ('210106','辽宁省沈阳市铁西区','辽宁省沈阳市铁西区','3','210100','CN',NULL,'1'),
 ('210111','辽宁省沈阳市苏家屯区','辽宁省沈阳市苏家屯区','3','210100','CN',NULL,'1'),
 ('210112','辽宁省沈阳市东陵区','辽宁省沈阳市东陵区','3','210100','CN',NULL,'1'),
 ('210113','辽宁省沈阳市新城子区','辽宁省沈阳市新城子区','3','210100','CN',NULL,'1'),
 ('210114','辽宁省沈阳市于洪区','辽宁省沈阳市于洪区','3','210100','CN',NULL,'1'),
 ('210122','辽宁省沈阳市辽中县','辽宁省沈阳市辽中县','3','210100','CN',NULL,'1'),
 ('210123','辽宁省沈阳市康平县','辽宁省沈阳市康平县','3','210100','CN',NULL,'1'),
 ('210124','辽宁省沈阳市法库县','辽宁省沈阳市法库县','3','210100','CN',NULL,'1'),
 ('210181','辽宁省沈阳市新民市','辽宁省沈阳市新民市','3','210100','CN',NULL,'1'),
 ('210200','辽宁省大连市','辽宁省大连市','2','210000','CN',NULL,'1'),
 ('210201','辽宁省大连市市辖区','辽宁省大连市市辖区','3','210200','CN',NULL,'1'),
 ('210202','辽宁省大连市中山区','辽宁省大连市中山区','3','210200','CN',NULL,'1'),
 ('210203','辽宁省大连市西岗区','辽宁省大连市西岗区','3','210200','CN',NULL,'1'),
 ('210204','辽宁省大连市沙河口区','辽宁省大连市沙河口区','3','210200','CN',NULL,'1'),
 ('210211','辽宁省大连市甘井子区','辽宁省大连市甘井子区','3','210200','CN',NULL,'1'),
 ('210212','辽宁省大连市旅顺口区','辽宁省大连市旅顺口区','3','210200','CN',NULL,'1'),
 ('210213','辽宁省大连市金州区','辽宁省大连市金州区','3','210200','CN',NULL,'1'),
 ('210224','辽宁省大连市长海县','辽宁省大连市长海县','3','210200','CN',NULL,'1'),
 ('210281','辽宁省大连市瓦房店市','辽宁省大连市瓦房店市','3','210200','CN',NULL,'1'),
 ('210282','辽宁省大连市普兰店市','辽宁省大连市普兰店市','3','210200','CN',NULL,'1'),
 ('210283','辽宁省大连市庄河市','辽宁省大连市庄河市','3','210200','CN',NULL,'1'),
 ('210300','辽宁省鞍山市','辽宁省鞍山市','2','210000','CN',NULL,'1'),
 ('210301','辽宁省鞍山市市辖区','辽宁省鞍山市市辖区','3','210300','CN',NULL,'1'),
 ('210302','辽宁省鞍山市铁东区','辽宁省鞍山市铁东区','3','210300','CN',NULL,'1'),
 ('210303','辽宁省鞍山市铁西区','辽宁省鞍山市铁西区','3','210300','CN',NULL,'1'),
 ('210304','辽宁省鞍山市立山区','辽宁省鞍山市立山区','3','210300','CN',NULL,'1'),
 ('210311','辽宁省鞍山市千山区','辽宁省鞍山市千山区','3','210300','CN',NULL,'1'),
 ('210321','辽宁省鞍山市台安县','辽宁省鞍山市台安县','3','210300','CN',NULL,'1'),
 ('210323','辽宁省鞍山市岫岩满族自治县','辽宁省鞍山市岫岩满族自治县','3','210300','CN',NULL,'1'),
 ('210381','辽宁省鞍山市海城市','辽宁省鞍山市海城市','3','210300','CN',NULL,'1'),
 ('210400','辽宁省抚顺市','辽宁省抚顺市','2','210000','CN',NULL,'1'),
 ('210401','辽宁省抚顺市市辖区','辽宁省抚顺市市辖区','3','210400','CN',NULL,'1'),
 ('210402','辽宁省抚顺市新抚区','辽宁省抚顺市新抚区','3','210400','CN',NULL,'1'),
 ('210403','辽宁省抚顺市东洲区','辽宁省抚顺市东洲区','3','210400','CN',NULL,'1'),
 ('210404','辽宁省抚顺市望花区','辽宁省抚顺市望花区','3','210400','CN',NULL,'1'),
 ('210411','辽宁省抚顺市顺城区','辽宁省抚顺市顺城区','3','210400','CN',NULL,'1'),
 ('210421','辽宁省抚顺市抚顺县','辽宁省抚顺市抚顺县','3','210400','CN',NULL,'1'),
 ('210422','辽宁省抚顺市新宾满族自治县','辽宁省抚顺市新宾满族自治县','3','210400','CN',NULL,'1'),
 ('210423','辽宁省抚顺市清原满族自治县','辽宁省抚顺市清原满族自治县','3','210400','CN',NULL,'1'),
 ('210500','辽宁省本溪市','辽宁省本溪市','2','210000','CN',NULL,'1'),
 ('210501','辽宁省本溪市市辖区','辽宁省本溪市市辖区','3','210500','CN',NULL,'1'),
 ('210502','辽宁省本溪市平山区','辽宁省本溪市平山区','3','210500','CN',NULL,'1'),
 ('210503','辽宁省本溪市溪湖区','辽宁省本溪市溪湖区','3','210500','CN',NULL,'1'),
 ('210504','辽宁省本溪市明山区','辽宁省本溪市明山区','3','210500','CN',NULL,'1'),
 ('210505','辽宁省本溪市南芬区','辽宁省本溪市南芬区','3','210500','CN',NULL,'1'),
 ('210521','辽宁省本溪市本溪满族自治县','辽宁省本溪市本溪满族自治县','3','210500','CN',NULL,'1'),
 ('210522','辽宁省本溪市桓仁满族自治县','辽宁省本溪市桓仁满族自治县','3','210500','CN',NULL,'1'),
 ('210600','辽宁省丹东市','辽宁省丹东市','2','210000','CN',NULL,'1'),
 ('210601','辽宁省丹东市市辖区','辽宁省丹东市市辖区','3','210600','CN',NULL,'1'),
 ('210602','辽宁省丹东市元宝区','辽宁省丹东市元宝区','3','210600','CN',NULL,'1'),
 ('210603','辽宁省丹东市振兴区','辽宁省丹东市振兴区','3','210600','CN',NULL,'1'),
 ('210604','辽宁省丹东市振安区','辽宁省丹东市振安区','3','210600','CN',NULL,'1'),
 ('210624','辽宁省丹东市宽甸满族自治县','辽宁省丹东市宽甸满族自治县','3','210600','CN',NULL,'1'),
 ('210681','辽宁省丹东市东港市','辽宁省丹东市东港市','3','210600','CN',NULL,'1'),
 ('210682','辽宁省丹东市凤城市','辽宁省丹东市凤城市','3','210600','CN',NULL,'1'),
 ('210700','辽宁省锦州市','辽宁省锦州市','2','210000','CN',NULL,'1'),
 ('210701','辽宁省锦州市市辖区','辽宁省锦州市市辖区','3','210700','CN',NULL,'1'),
 ('210702','辽宁省锦州市古塔区','辽宁省锦州市古塔区','3','210700','CN',NULL,'1'),
 ('210703','辽宁省锦州市凌河区','辽宁省锦州市凌河区','3','210700','CN',NULL,'1'),
 ('210711','辽宁省锦州市太和区','辽宁省锦州市太和区','3','210700','CN',NULL,'1'),
 ('210726','辽宁省锦州市黑山县','辽宁省锦州市黑山县','3','210700','CN',NULL,'1'),
 ('210727','辽宁省锦州市义县','辽宁省锦州市义县','3','210700','CN',NULL,'1'),
 ('210781','辽宁省锦州市凌海市','辽宁省锦州市凌海市','3','210700','CN',NULL,'1'),
 ('210782','辽宁省锦州市北宁市','辽宁省锦州市北宁市','3','210700','CN',NULL,'1'),
 ('210800','辽宁省营口市','辽宁省营口市','2','210000','CN',NULL,'1'),
 ('210801','辽宁省营口市市辖区','辽宁省营口市市辖区','3','210800','CN',NULL,'1'),
 ('210802','辽宁省营口市站前区','辽宁省营口市站前区','3','210800','CN',NULL,'1'),
 ('210803','辽宁省营口市西市区','辽宁省营口市西市区','3','210800','CN',NULL,'1'),
 ('210804','辽宁省营口市鲅鱼圈区','辽宁省营口市鲅鱼圈区','3','210800','CN',NULL,'1'),
 ('210811','辽宁省营口市老边区','辽宁省营口市老边区','3','210800','CN',NULL,'1'),
 ('210881','辽宁省营口市盖州市','辽宁省营口市盖州市','3','210800','CN',NULL,'1'),
 ('210882','辽宁省营口市大石桥市','辽宁省营口市大石桥市','3','210800','CN',NULL,'1'),
 ('210900','辽宁省阜新市','辽宁省阜新市','2','210000','CN',NULL,'1'),
 ('210901','辽宁省阜新市市辖区','辽宁省阜新市市辖区','3','210900','CN',NULL,'1'),
 ('210902','辽宁省阜新市海州区','辽宁省阜新市海州区','3','210900','CN',NULL,'1'),
 ('210903','辽宁省阜新市新邱区','辽宁省阜新市新邱区','3','210900','CN',NULL,'1'),
 ('210904','辽宁省阜新市太平区','辽宁省阜新市太平区','3','210900','CN',NULL,'1'),
 ('210905','辽宁省阜新市清河门区','辽宁省阜新市清河门区','3','210900','CN',NULL,'1'),
 ('210911','辽宁省阜新市细河区','辽宁省阜新市细河区','3','210900','CN',NULL,'1'),
 ('210921','辽宁省阜新市阜新蒙古族自治县','辽宁省阜新市阜新蒙古族自治县','3','210900','CN',NULL,'1'),
 ('210922','辽宁省阜新市彰武县','辽宁省阜新市彰武县','3','210900','CN',NULL,'1'),
 ('211000','辽宁省辽阳市','辽宁省辽阳市','2','210000','CN',NULL,'1'),
 ('211001','辽宁省辽阳市市辖区','辽宁省辽阳市市辖区','3','211000','CN',NULL,'1'),
 ('211002','辽宁省辽阳市白塔区','辽宁省辽阳市白塔区','3','211000','CN',NULL,'1'),
 ('211003','辽宁省辽阳市文圣区','辽宁省辽阳市文圣区','3','211000','CN',NULL,'1'),
 ('211004','辽宁省辽阳市宏伟区','辽宁省辽阳市宏伟区','3','211000','CN',NULL,'1'),
 ('211005','辽宁省辽阳市弓长岭区','辽宁省辽阳市弓长岭区','3','211000','CN',NULL,'1'),
 ('211011','辽宁省辽阳市太子河区','辽宁省辽阳市太子河区','3','211000','CN',NULL,'1'),
 ('211021','辽宁省辽阳市辽阳县','辽宁省辽阳市辽阳县','3','211000','CN',NULL,'1'),
 ('211081','辽宁省辽阳市灯塔市','辽宁省辽阳市灯塔市','3','211000','CN',NULL,'1'),
 ('211100','辽宁省盘锦市','辽宁省盘锦市','2','210000','CN',NULL,'1'),
 ('211101','辽宁省盘锦市市辖区','辽宁省盘锦市市辖区','3','211100','CN',NULL,'1'),
 ('211102','辽宁省盘锦市双台子区','辽宁省盘锦市双台子区','3','211100','CN',NULL,'1'),
 ('211103','辽宁省盘锦市兴隆台区','辽宁省盘锦市兴隆台区','3','211100','CN',NULL,'1'),
 ('211121','辽宁省盘锦市大洼县','辽宁省盘锦市大洼县','3','211100','CN',NULL,'1'),
 ('211122','辽宁省盘锦市盘山县','辽宁省盘锦市盘山县','3','211100','CN',NULL,'1'),
 ('211200','辽宁省铁岭市','辽宁省铁岭市','2','210000','CN',NULL,'1'),
 ('211201','辽宁省铁岭市市辖区','辽宁省铁岭市市辖区','3','211200','CN',NULL,'1'),
 ('211202','辽宁省铁岭市银州区','辽宁省铁岭市银州区','3','211200','CN',NULL,'1');
INSERT INTO `pub_cant` (`CANT_CODE`,`CANT_NAME`,`SHORT_NAME`,`CANT_TYPE`,`SUPER_CODE`,`COUNTRY_CODE`,`CANT_NOTE`,`IN_USE`) VALUES 
 ('211204','辽宁省铁岭市清河区','辽宁省铁岭市清河区','3','211200','CN',NULL,'1'),
 ('211221','辽宁省铁岭市铁岭县','辽宁省铁岭市铁岭县','3','211200','CN',NULL,'1'),
 ('211223','辽宁省铁岭市西丰县','辽宁省铁岭市西丰县','3','211200','CN',NULL,'1'),
 ('211224','辽宁省铁岭市昌图县','辽宁省铁岭市昌图县','3','211200','CN',NULL,'1'),
 ('211281','辽宁省铁岭市调兵山市','辽宁省铁岭市调兵山市','3','211200','CN',NULL,'1'),
 ('211282','辽宁省铁岭市开原市','辽宁省铁岭市开原市','3','211200','CN',NULL,'1'),
 ('211300','辽宁省朝阳市','辽宁省朝阳市','2','210000','CN',NULL,'1'),
 ('211301','辽宁省朝阳市市辖区','辽宁省朝阳市市辖区','3','211300','CN',NULL,'1'),
 ('211302','辽宁省朝阳市双塔区','辽宁省朝阳市双塔区','3','211300','CN',NULL,'1'),
 ('211303','辽宁省朝阳市龙城区','辽宁省朝阳市龙城区','3','211300','CN',NULL,'1'),
 ('211321','辽宁省朝阳市朝阳县','辽宁省朝阳市朝阳县','3','211300','CN',NULL,'1'),
 ('211322','辽宁省朝阳市建平县','辽宁省朝阳市建平县','3','211300','CN',NULL,'1'),
 ('211324','辽宁省朝阳市喀喇沁左翼蒙古族自治县','辽宁省朝阳市喀喇沁左翼蒙古族自治县','3','211300','CN',NULL,'1'),
 ('211381','辽宁省朝阳市北票市','辽宁省朝阳市北票市','3','211300','CN',NULL,'1'),
 ('211382','辽宁省朝阳市凌源市','辽宁省朝阳市凌源市','3','211300','CN',NULL,'1'),
 ('211400','辽宁省葫芦岛市','辽宁省葫芦岛市','2','210000','CN',NULL,'1'),
 ('211401','辽宁省葫芦岛市市辖区','辽宁省葫芦岛市市辖区','3','211400','CN',NULL,'1'),
 ('211402','辽宁省葫芦岛市连山区','辽宁省葫芦岛市连山区','3','211400','CN',NULL,'1'),
 ('211403','辽宁省葫芦岛市龙港区','辽宁省葫芦岛市龙港区','3','211400','CN',NULL,'1'),
 ('211404','辽宁省葫芦岛市南票区','辽宁省葫芦岛市南票区','3','211400','CN',NULL,'1'),
 ('211421','辽宁省葫芦岛市绥中县','辽宁省葫芦岛市绥中县','3','211400','CN',NULL,'1'),
 ('211422','辽宁省葫芦岛市建昌县','辽宁省葫芦岛市建昌县','3','211400','CN',NULL,'1'),
 ('211481','辽宁省葫芦岛市兴城市','辽宁省葫芦岛市兴城市','3','211400','CN',NULL,'1'),
 ('220000','吉林省','吉林省','1','CN','CN',NULL,'1'),
 ('220100','吉林省长春市','吉林省长春市','2','220000','CN',NULL,'1'),
 ('220101','吉林省长春市市辖区','吉林省长春市市辖区','3','220100','CN',NULL,'1'),
 ('220102','吉林省长春市南关区','吉林省长春市南关区','3','220100','CN',NULL,'1'),
 ('220103','吉林省长春市宽城区','吉林省长春市宽城区','3','220100','CN',NULL,'1'),
 ('220104','吉林省长春市朝阳区','吉林省长春市朝阳区','3','220100','CN',NULL,'1'),
 ('220105','吉林省长春市二道区','吉林省长春市二道区','3','220100','CN',NULL,'1'),
 ('220106','吉林省长春市绿园区','吉林省长春市绿园区','3','220100','CN',NULL,'1'),
 ('220112','吉林省长春市双阳区','吉林省长春市双阳区','3','220100','CN',NULL,'1'),
 ('220122','吉林省长春市农安县','吉林省长春市农安县','3','220100','CN',NULL,'1'),
 ('220181','吉林省长春市九台市','吉林省长春市九台市','3','220100','CN',NULL,'1'),
 ('220182','吉林省长春市榆树市','吉林省长春市榆树市','3','220100','CN',NULL,'1'),
 ('220183','吉林省长春市德惠市','吉林省长春市德惠市','3','220100','CN',NULL,'1'),
 ('220200','吉林省吉林市','吉林省吉林市','2','220000','CN',NULL,'1'),
 ('220201','吉林省吉林市市辖区','吉林省吉林市市辖区','3','220200','CN',NULL,'1'),
 ('220202','吉林省吉林市昌邑区','吉林省吉林市昌邑区','3','220200','CN',NULL,'1'),
 ('220203','吉林省吉林市龙潭区','吉林省吉林市龙潭区','3','220200','CN',NULL,'1'),
 ('220204','吉林省吉林市船营区','吉林省吉林市船营区','3','220200','CN',NULL,'1'),
 ('220211','吉林省吉林市丰满区','吉林省吉林市丰满区','3','220200','CN',NULL,'1'),
 ('220221','吉林省吉林市永吉县','吉林省吉林市永吉县','3','220200','CN',NULL,'1'),
 ('220281','吉林省吉林市蛟河市','吉林省吉林市蛟河市','3','220200','CN',NULL,'1'),
 ('220282','吉林省吉林市桦甸市','吉林省吉林市桦甸市','3','220200','CN',NULL,'1'),
 ('220283','吉林省吉林市舒兰市','吉林省吉林市舒兰市','3','220200','CN',NULL,'1'),
 ('220284','吉林省吉林市磐石市','吉林省吉林市磐石市','3','220200','CN',NULL,'1'),
 ('220300','吉林省四平市','吉林省四平市','2','220000','CN',NULL,'1'),
 ('220301','吉林省四平市市辖区','吉林省四平市市辖区','3','220300','CN',NULL,'1'),
 ('220302','吉林省四平市铁西区','吉林省四平市铁西区','3','220300','CN',NULL,'1'),
 ('220303','吉林省四平市铁东区','吉林省四平市铁东区','3','220300','CN',NULL,'1'),
 ('220322','吉林省四平市梨树县','吉林省四平市梨树县','3','220300','CN',NULL,'1'),
 ('220323','吉林省四平市伊通满族自治县','吉林省四平市伊通满族自治县','3','220300','CN',NULL,'1'),
 ('220381','吉林省四平市公主岭市','吉林省四平市公主岭市','3','220300','CN',NULL,'1'),
 ('220382','吉林省四平市双辽市','吉林省四平市双辽市','3','220300','CN',NULL,'1'),
 ('220400','吉林省辽源市','吉林省辽源市','2','220000','CN',NULL,'1'),
 ('220401','吉林省辽源市市辖区','吉林省辽源市市辖区','3','220400','CN',NULL,'1'),
 ('220402','吉林省辽源市龙山区','吉林省辽源市龙山区','3','220400','CN',NULL,'1'),
 ('220403','吉林省辽源市西安区','吉林省辽源市西安区','3','220400','CN',NULL,'1'),
 ('220421','吉林省辽源市东丰县','吉林省辽源市东丰县','3','220400','CN',NULL,'1'),
 ('220422','吉林省辽源市东辽县','吉林省辽源市东辽县','3','220400','CN',NULL,'1'),
 ('220500','吉林省通化市','吉林省通化市','2','220000','CN',NULL,'1'),
 ('220501','吉林省通化市市辖区','吉林省通化市市辖区','3','220500','CN',NULL,'1'),
 ('220502','吉林省通化市东昌区','吉林省通化市东昌区','3','220500','CN',NULL,'1'),
 ('220503','吉林省通化市二道江区','吉林省通化市二道江区','3','220500','CN',NULL,'1'),
 ('220521','吉林省通化市通化县','吉林省通化市通化县','3','220500','CN',NULL,'1'),
 ('220523','吉林省通化市辉南县','吉林省通化市辉南县','3','220500','CN',NULL,'1'),
 ('220524','吉林省通化市柳河县','吉林省通化市柳河县','3','220500','CN',NULL,'1'),
 ('220581','吉林省通化市梅河口市','吉林省通化市梅河口市','3','220500','CN',NULL,'1'),
 ('220582','吉林省通化市集安市','吉林省通化市集安市','3','220500','CN',NULL,'1'),
 ('220600','吉林省白山市','吉林省白山市','2','220000','CN',NULL,'1'),
 ('220601','吉林省白山市市辖区','吉林省白山市市辖区','3','220600','CN',NULL,'1'),
 ('220602','吉林省白山市八道江区','吉林省白山市八道江区','3','220600','CN',NULL,'1'),
 ('220621','吉林省白山市抚松县','吉林省白山市抚松县','3','220600','CN',NULL,'1'),
 ('220622','吉林省白山市靖宇县','吉林省白山市靖宇县','3','220600','CN',NULL,'1'),
 ('220623','吉林省白山市长白朝鲜族自治县','吉林省白山市长白朝鲜族自治县','3','220600','CN',NULL,'1'),
 ('220625','吉林省白山市江源县','吉林省白山市江源县','3','220600','CN',NULL,'1'),
 ('220681','吉林省白山市临江市','吉林省白山市临江市','3','220600','CN',NULL,'1'),
 ('220700','吉林省松原市','吉林省松原市','2','220000','CN',NULL,'1'),
 ('220701','吉林省松原市市辖区','吉林省松原市市辖区','3','220700','CN',NULL,'1'),
 ('220702','吉林省松原市宁江区','吉林省松原市宁江区','3','220700','CN',NULL,'1'),
 ('220721','吉林省松原市前郭尔罗斯蒙古族自治县','吉林省松原市前郭尔罗斯蒙古族自治县','3','220700','CN',NULL,'1'),
 ('220722','吉林省松原市长岭县','吉林省松原市长岭县','3','220700','CN',NULL,'1'),
 ('220723','吉林省松原市乾安县','吉林省松原市乾安县','3','220700','CN',NULL,'1'),
 ('220724','吉林省松原市扶余县','吉林省松原市扶余县','3','220700','CN',NULL,'1'),
 ('220800','吉林省白城市','吉林省白城市','2','220000','CN',NULL,'1'),
 ('220801','吉林省白城市市辖区','吉林省白城市市辖区','3','220800','CN',NULL,'1'),
 ('220802','吉林省白城市洮北区','吉林省白城市洮北区','3','220800','CN',NULL,'1'),
 ('220821','吉林省白城市镇赉县','吉林省白城市镇赉县','3','220800','CN',NULL,'1'),
 ('220822','吉林省白城市通榆县','吉林省白城市通榆县','3','220800','CN',NULL,'1'),
 ('220881','吉林省白城市洮南市','吉林省白城市洮南市','3','220800','CN',NULL,'1'),
 ('220882','吉林省白城市大安市','吉林省白城市大安市','3','220800','CN',NULL,'1'),
 ('222400','吉林省延边朝鲜族自治州','吉林省延边朝鲜族自治州','2','220000','CN',NULL,'1'),
 ('222401','吉林省延边朝鲜族自治州延吉市','吉林省延边朝鲜族自治州延吉市','3','222400','CN',NULL,'1'),
 ('222402','吉林省延边朝鲜族自治州图们市','吉林省延边朝鲜族自治州图们市','3','222400','CN',NULL,'1'),
 ('222403','吉林省延边朝鲜族自治州敦化市','吉林省延边朝鲜族自治州敦化市','3','222400','CN',NULL,'1'),
 ('222404','吉林省延边朝鲜族自治州珲春市','吉林省延边朝鲜族自治州珲春市','3','222400','CN',NULL,'1'),
 ('222405','吉林省延边朝鲜族自治州龙井市','吉林省延边朝鲜族自治州龙井市','3','222400','CN',NULL,'1'),
 ('222406','吉林省延边朝鲜族自治州和龙市','吉林省延边朝鲜族自治州和龙市','3','222400','CN',NULL,'1'),
 ('222424','吉林省延边朝鲜族自治州汪清县','吉林省延边朝鲜族自治州汪清县','3','222400','CN',NULL,'1'),
 ('222426','吉林省延边朝鲜族自治州安图县','吉林省延边朝鲜族自治州安图县','3','222400','CN',NULL,'1'),
 ('230000','黑龙江省','黑龙江省','1','CN','CN',NULL,'1'),
 ('230100','黑龙江省哈尔滨市','黑龙江省哈尔滨市','2','230000','CN',NULL,'1'),
 ('230101','黑龙江省哈尔滨市市辖区','黑龙江省哈尔滨市市辖区','3','230100','CN',NULL,'1'),
 ('230102','黑龙江省哈尔滨市道里区','黑龙江省哈尔滨市道里区','3','230100','CN',NULL,'1'),
 ('230103','黑龙江省哈尔滨市南岗区','黑龙江省哈尔滨市南岗区','3','230100','CN',NULL,'1'),
 ('230104','黑龙江省哈尔滨市道外区','黑龙江省哈尔滨市道外区','3','230100','CN',NULL,'1'),
 ('230106','黑龙江省哈尔滨市香坊区','黑龙江省哈尔滨市香坊区','3','230100','CN',NULL,'1'),
 ('230107','黑龙江省哈尔滨市动力区','黑龙江省哈尔滨市动力区','3','230100','CN',NULL,'1'),
 ('230108','黑龙江省哈尔滨市平房区','黑龙江省哈尔滨市平房区','3','230100','CN',NULL,'1'),
 ('230109','黑龙江省哈尔滨市松北区','黑龙江省哈尔滨市松北区','3','230100','CN',NULL,'1'),
 ('230111','黑龙江省哈尔滨市呼兰区','黑龙江省哈尔滨市呼兰区','3','230100','CN',NULL,'1'),
 ('230123','黑龙江省哈尔滨市依兰县','黑龙江省哈尔滨市依兰县','3','230100','CN',NULL,'1'),
 ('230124','黑龙江省哈尔滨市方正县','黑龙江省哈尔滨市方正县','3','230100','CN',NULL,'1'),
 ('230125','黑龙江省哈尔滨市宾县','黑龙江省哈尔滨市宾县','3','230100','CN',NULL,'1'),
 ('230126','黑龙江省哈尔滨市巴彦县','黑龙江省哈尔滨市巴彦县','3','230100','CN',NULL,'1'),
 ('230127','黑龙江省哈尔滨市木兰县','黑龙江省哈尔滨市木兰县','3','230100','CN',NULL,'1'),
 ('230128','黑龙江省哈尔滨市通河县','黑龙江省哈尔滨市通河县','3','230100','CN',NULL,'1'),
 ('230129','黑龙江省哈尔滨市延寿县','黑龙江省哈尔滨市延寿县','3','230100','CN',NULL,'1'),
 ('230181','黑龙江省哈尔滨市阿城市','黑龙江省哈尔滨市阿城市','3','230100','CN',NULL,'1'),
 ('230182','黑龙江省哈尔滨市双城市','黑龙江省哈尔滨市双城市','3','230100','CN',NULL,'1'),
 ('230183','黑龙江省哈尔滨市尚志市','黑龙江省哈尔滨市尚志市','3','230100','CN',NULL,'1'),
 ('230184','黑龙江省哈尔滨市五常市','黑龙江省哈尔滨市五常市','3','230100','CN',NULL,'1'),
 ('230200','黑龙江省齐齐哈尔市','黑龙江省齐齐哈尔市','2','230000','CN',NULL,'1'),
 ('230201','黑龙江省齐齐哈尔市市辖区','黑龙江省齐齐哈尔市市辖区','3','230200','CN',NULL,'1'),
 ('230202','黑龙江省齐齐哈尔市龙沙区','黑龙江省齐齐哈尔市龙沙区','3','230200','CN',NULL,'1'),
 ('230203','黑龙江省齐齐哈尔市建华区','黑龙江省齐齐哈尔市建华区','3','230200','CN',NULL,'1'),
 ('230204','黑龙江省齐齐哈尔市铁锋区','黑龙江省齐齐哈尔市铁锋区','3','230200','CN',NULL,'1'),
 ('230205','黑龙江省齐齐哈尔市昂昂溪区','黑龙江省齐齐哈尔市昂昂溪区','3','230200','CN',NULL,'1'),
 ('230206','黑龙江省齐齐哈尔市富拉尔基区','黑龙江省齐齐哈尔市富拉尔基区','3','230200','CN',NULL,'1'),
 ('230207','黑龙江省齐齐哈尔市碾子山区','黑龙江省齐齐哈尔市碾子山区','3','230200','CN',NULL,'1'),
 ('230208','黑龙江省齐齐哈尔市梅里斯达斡尔族区','黑龙江省齐齐哈尔市梅里斯达斡尔族区','3','230200','CN',NULL,'1'),
 ('230221','黑龙江省齐齐哈尔市龙江县','黑龙江省齐齐哈尔市龙江县','3','230200','CN',NULL,'1'),
 ('230223','黑龙江省齐齐哈尔市依安县','黑龙江省齐齐哈尔市依安县','3','230200','CN',NULL,'1'),
 ('230224','黑龙江省齐齐哈尔市泰来县','黑龙江省齐齐哈尔市泰来县','3','230200','CN',NULL,'1'),
 ('230225','黑龙江省齐齐哈尔市甘南县','黑龙江省齐齐哈尔市甘南县','3','230200','CN',NULL,'1'),
 ('230227','黑龙江省齐齐哈尔市富裕县','黑龙江省齐齐哈尔市富裕县','3','230200','CN',NULL,'1'),
 ('230229','黑龙江省齐齐哈尔市克山县','黑龙江省齐齐哈尔市克山县','3','230200','CN',NULL,'1'),
 ('230230','黑龙江省齐齐哈尔市克东县','黑龙江省齐齐哈尔市克东县','3','230200','CN',NULL,'1'),
 ('230231','黑龙江省齐齐哈尔市拜泉县','黑龙江省齐齐哈尔市拜泉县','3','230200','CN',NULL,'1'),
 ('230281','黑龙江省齐齐哈尔市讷河市','黑龙江省齐齐哈尔市讷河市','3','230200','CN',NULL,'1'),
 ('230300','黑龙江省鸡西市','黑龙江省鸡西市','2','230000','CN',NULL,'1'),
 ('230301','黑龙江省鸡西市市辖区','黑龙江省鸡西市市辖区','3','230300','CN',NULL,'1'),
 ('230302','黑龙江省鸡西市鸡冠区','黑龙江省鸡西市鸡冠区','3','230300','CN',NULL,'1'),
 ('230303','黑龙江省鸡西市恒山区','黑龙江省鸡西市恒山区','3','230300','CN',NULL,'1'),
 ('230304','黑龙江省鸡西市滴道区','黑龙江省鸡西市滴道区','3','230300','CN',NULL,'1'),
 ('230305','黑龙江省鸡西市梨树区','黑龙江省鸡西市梨树区','3','230300','CN',NULL,'1'),
 ('230306','黑龙江省鸡西市城子河区','黑龙江省鸡西市城子河区','3','230300','CN',NULL,'1'),
 ('230307','黑龙江省鸡西市麻山区','黑龙江省鸡西市麻山区','3','230300','CN',NULL,'1'),
 ('230321','黑龙江省鸡西市鸡东县','黑龙江省鸡西市鸡东县','3','230300','CN',NULL,'1'),
 ('230381','黑龙江省鸡西市虎林市','黑龙江省鸡西市虎林市','3','230300','CN',NULL,'1'),
 ('230382','黑龙江省鸡西市密山市','黑龙江省鸡西市密山市','3','230300','CN',NULL,'1'),
 ('230400','黑龙江省鹤岗市','黑龙江省鹤岗市','2','230000','CN',NULL,'1'),
 ('230401','黑龙江省鹤岗市市辖区','黑龙江省鹤岗市市辖区','3','230400','CN',NULL,'1'),
 ('230402','黑龙江省鹤岗市向阳区','黑龙江省鹤岗市向阳区','3','230400','CN',NULL,'1'),
 ('230403','黑龙江省鹤岗市工农区','黑龙江省鹤岗市工农区','3','230400','CN',NULL,'1'),
 ('230404','黑龙江省鹤岗市南山区','黑龙江省鹤岗市南山区','3','230400','CN',NULL,'1'),
 ('230405','黑龙江省鹤岗市兴安区','黑龙江省鹤岗市兴安区','3','230400','CN',NULL,'1'),
 ('230406','黑龙江省鹤岗市东山区','黑龙江省鹤岗市东山区','3','230400','CN',NULL,'1'),
 ('230407','黑龙江省鹤岗市兴山区','黑龙江省鹤岗市兴山区','3','230400','CN',NULL,'1'),
 ('230421','黑龙江省鹤岗市萝北县','黑龙江省鹤岗市萝北县','3','230400','CN',NULL,'1'),
 ('230422','黑龙江省鹤岗市绥滨县','黑龙江省鹤岗市绥滨县','3','230400','CN',NULL,'1'),
 ('230500','黑龙江省双鸭山市','黑龙江省双鸭山市','2','230000','CN',NULL,'1'),
 ('230501','黑龙江省双鸭山市市辖区','黑龙江省双鸭山市市辖区','3','230500','CN',NULL,'1'),
 ('230502','黑龙江省双鸭山市尖山区','黑龙江省双鸭山市尖山区','3','230500','CN',NULL,'1'),
 ('230503','黑龙江省双鸭山市岭东区','黑龙江省双鸭山市岭东区','3','230500','CN',NULL,'1'),
 ('230505','黑龙江省双鸭山市四方台区','黑龙江省双鸭山市四方台区','3','230500','CN',NULL,'1'),
 ('230506','黑龙江省双鸭山市宝山区','黑龙江省双鸭山市宝山区','3','230500','CN',NULL,'1'),
 ('230521','黑龙江省双鸭山市集贤县','黑龙江省双鸭山市集贤县','3','230500','CN',NULL,'1'),
 ('230522','黑龙江省双鸭山市友谊县','黑龙江省双鸭山市友谊县','3','230500','CN',NULL,'1'),
 ('230523','黑龙江省双鸭山市宝清县','黑龙江省双鸭山市宝清县','3','230500','CN',NULL,'1'),
 ('230524','黑龙江省双鸭山市饶河县','黑龙江省双鸭山市饶河县','3','230500','CN',NULL,'1'),
 ('230600','黑龙江省大庆市','黑龙江省大庆市','2','230000','CN',NULL,'1'),
 ('230601','黑龙江省大庆市市辖区','黑龙江省大庆市市辖区','3','230600','CN',NULL,'1'),
 ('230602','黑龙江省大庆市萨尔图区','黑龙江省大庆市萨尔图区','3','230600','CN',NULL,'1'),
 ('230603','黑龙江省大庆市龙凤区','黑龙江省大庆市龙凤区','3','230600','CN',NULL,'1'),
 ('230604','黑龙江省大庆市让胡路区','黑龙江省大庆市让胡路区','3','230600','CN',NULL,'1'),
 ('230605','黑龙江省大庆市红岗区','黑龙江省大庆市红岗区','3','230600','CN',NULL,'1'),
 ('230606','黑龙江省大庆市大同区','黑龙江省大庆市大同区','3','230600','CN',NULL,'1'),
 ('230621','黑龙江省大庆市肇州县','黑龙江省大庆市肇州县','3','230600','CN',NULL,'1'),
 ('230622','黑龙江省大庆市肇源县','黑龙江省大庆市肇源县','3','230600','CN',NULL,'1'),
 ('230623','黑龙江省大庆市林甸县','黑龙江省大庆市林甸县','3','230600','CN',NULL,'1'),
 ('230624','黑龙江省大庆市杜尔伯特蒙古族自治县','黑龙江省大庆市杜尔伯特蒙古族自治县','3','230600','CN',NULL,'1'),
 ('230700','黑龙江省伊春市','黑龙江省伊春市','2','230000','CN',NULL,'1'),
 ('230701','黑龙江省伊春市市辖区','黑龙江省伊春市市辖区','3','230700','CN',NULL,'1'),
 ('230702','黑龙江省伊春市伊春区','黑龙江省伊春市伊春区','3','230700','CN',NULL,'1'),
 ('230703','黑龙江省伊春市南岔区','黑龙江省伊春市南岔区','3','230700','CN',NULL,'1'),
 ('230704','黑龙江省伊春市友好区','黑龙江省伊春市友好区','3','230700','CN',NULL,'1'),
 ('230705','黑龙江省伊春市西林区','黑龙江省伊春市西林区','3','230700','CN',NULL,'1'),
 ('230706','黑龙江省伊春市翠峦区','黑龙江省伊春市翠峦区','3','230700','CN',NULL,'1'),
 ('230707','黑龙江省伊春市新青区','黑龙江省伊春市新青区','3','230700','CN',NULL,'1'),
 ('230708','黑龙江省伊春市美溪区','黑龙江省伊春市美溪区','3','230700','CN',NULL,'1'),
 ('230709','黑龙江省伊春市金山屯区','黑龙江省伊春市金山屯区','3','230700','CN',NULL,'1'),
 ('230710','黑龙江省伊春市五营区','黑龙江省伊春市五营区','3','230700','CN',NULL,'1'),
 ('230711','黑龙江省伊春市乌马河区','黑龙江省伊春市乌马河区','3','230700','CN',NULL,'1'),
 ('230712','黑龙江省伊春市汤旺河区','黑龙江省伊春市汤旺河区','3','230700','CN',NULL,'1'),
 ('230713','黑龙江省伊春市带岭区','黑龙江省伊春市带岭区','3','230700','CN',NULL,'1'),
 ('230714','黑龙江省伊春市乌伊岭区','黑龙江省伊春市乌伊岭区','3','230700','CN',NULL,'1'),
 ('230715','黑龙江省伊春市红星区','黑龙江省伊春市红星区','3','230700','CN',NULL,'1'),
 ('230716','黑龙江省伊春市上甘岭区','黑龙江省伊春市上甘岭区','3','230700','CN',NULL,'1'),
 ('230722','黑龙江省伊春市嘉荫县','黑龙江省伊春市嘉荫县','3','230700','CN',NULL,'1'),
 ('230781','黑龙江省伊春市铁力市','黑龙江省伊春市铁力市','3','230700','CN',NULL,'1'),
 ('230800','黑龙江省佳木斯市','黑龙江省佳木斯市','2','230000','CN',NULL,'1'),
 ('230801','黑龙江省佳木斯市市辖区','黑龙江省佳木斯市市辖区','3','230800','CN',NULL,'1'),
 ('230802','黑龙江省佳木斯市永红区','黑龙江省佳木斯市永红区','3','230800','CN',NULL,'1'),
 ('230803','黑龙江省佳木斯市向阳区','黑龙江省佳木斯市向阳区','3','230800','CN',NULL,'1'),
 ('230804','黑龙江省佳木斯市前进区','黑龙江省佳木斯市前进区','3','230800','CN',NULL,'1'),
 ('230805','黑龙江省佳木斯市东风区','黑龙江省佳木斯市东风区','3','230800','CN',NULL,'1'),
 ('230811','黑龙江省佳木斯市郊区','黑龙江省佳木斯市郊区','3','230800','CN',NULL,'1'),
 ('230822','黑龙江省佳木斯市桦南县','黑龙江省佳木斯市桦南县','3','230800','CN',NULL,'1'),
 ('230826','黑龙江省佳木斯市桦川县','黑龙江省佳木斯市桦川县','3','230800','CN',NULL,'1'),
 ('230828','黑龙江省佳木斯市汤原县','黑龙江省佳木斯市汤原县','3','230800','CN',NULL,'1'),
 ('230833','黑龙江省佳木斯市抚远县','黑龙江省佳木斯市抚远县','3','230800','CN',NULL,'1'),
 ('230881','黑龙江省佳木斯市同江市','黑龙江省佳木斯市同江市','3','230800','CN',NULL,'1'),
 ('230882','黑龙江省佳木斯市富锦市','黑龙江省佳木斯市富锦市','3','230800','CN',NULL,'1'),
 ('230900','黑龙江省七台河市','黑龙江省七台河市','2','230000','CN',NULL,'1'),
 ('230901','黑龙江省七台河市市辖区','黑龙江省七台河市市辖区','3','230900','CN',NULL,'1'),
 ('230902','黑龙江省七台河市新兴区','黑龙江省七台河市新兴区','3','230900','CN',NULL,'1'),
 ('230903','黑龙江省七台河市桃山区','黑龙江省七台河市桃山区','3','230900','CN',NULL,'1'),
 ('230904','黑龙江省七台河市茄子河区','黑龙江省七台河市茄子河区','3','230900','CN',NULL,'1'),
 ('230921','黑龙江省七台河市勃利县','黑龙江省七台河市勃利县','3','230900','CN',NULL,'1'),
 ('231000','黑龙江省牡丹江市','黑龙江省牡丹江市','2','230000','CN',NULL,'1'),
 ('231001','黑龙江省牡丹江市市辖区','黑龙江省牡丹江市市辖区','3','231000','CN',NULL,'1'),
 ('231002','黑龙江省牡丹江市东安区','黑龙江省牡丹江市东安区','3','231000','CN',NULL,'1'),
 ('231003','黑龙江省牡丹江市阳明区','黑龙江省牡丹江市阳明区','3','231000','CN',NULL,'1'),
 ('231004','黑龙江省牡丹江市爱民区','黑龙江省牡丹江市爱民区','3','231000','CN',NULL,'1'),
 ('231005','黑龙江省牡丹江市西安区','黑龙江省牡丹江市西安区','3','231000','CN',NULL,'1'),
 ('231024','黑龙江省牡丹江市东宁县','黑龙江省牡丹江市东宁县','3','231000','CN',NULL,'1'),
 ('231025','黑龙江省牡丹江市林口县','黑龙江省牡丹江市林口县','3','231000','CN',NULL,'1'),
 ('231081','黑龙江省牡丹江市绥芬河市','黑龙江省牡丹江市绥芬河市','3','231000','CN',NULL,'1'),
 ('231083','黑龙江省牡丹江市海林市','黑龙江省牡丹江市海林市','3','231000','CN',NULL,'1'),
 ('231084','黑龙江省牡丹江市宁安市','黑龙江省牡丹江市宁安市','3','231000','CN',NULL,'1'),
 ('231085','黑龙江省牡丹江市穆棱市','黑龙江省牡丹江市穆棱市','3','231000','CN',NULL,'1'),
 ('231100','黑龙江省黑河市','黑龙江省黑河市','2','230000','CN',NULL,'1'),
 ('231101','黑龙江省黑河市市辖区','黑龙江省黑河市市辖区','3','231100','CN',NULL,'1'),
 ('231102','黑龙江省黑河市爱辉区','黑龙江省黑河市爱辉区','3','231100','CN',NULL,'1'),
 ('231121','黑龙江省黑河市嫩江县','黑龙江省黑河市嫩江县','3','231100','CN',NULL,'1'),
 ('231123','黑龙江省黑河市逊克县','黑龙江省黑河市逊克县','3','231100','CN',NULL,'1'),
 ('231124','黑龙江省黑河市孙吴县','黑龙江省黑河市孙吴县','3','231100','CN',NULL,'1'),
 ('231181','黑龙江省黑河市北安市','黑龙江省黑河市北安市','3','231100','CN',NULL,'1'),
 ('231182','黑龙江省黑河市五大连池市','黑龙江省黑河市五大连池市','3','231100','CN',NULL,'1'),
 ('231200','黑龙江省绥化市','黑龙江省绥化市','2','230000','CN',NULL,'1'),
 ('231201','黑龙江省绥化市市辖区','黑龙江省绥化市市辖区','3','231200','CN',NULL,'1'),
 ('231202','黑龙江省绥化市北林区','黑龙江省绥化市北林区','3','231200','CN',NULL,'1'),
 ('231221','黑龙江省绥化市望奎县','黑龙江省绥化市望奎县','3','231200','CN',NULL,'1'),
 ('231222','黑龙江省绥化市兰西县','黑龙江省绥化市兰西县','3','231200','CN',NULL,'1'),
 ('231223','黑龙江省绥化市青冈县','黑龙江省绥化市青冈县','3','231200','CN',NULL,'1'),
 ('231224','黑龙江省绥化市庆安县','黑龙江省绥化市庆安县','3','231200','CN',NULL,'1'),
 ('231225','黑龙江省绥化市明水县','黑龙江省绥化市明水县','3','231200','CN',NULL,'1'),
 ('231226','黑龙江省绥化市绥棱县','黑龙江省绥化市绥棱县','3','231200','CN',NULL,'1'),
 ('231281','黑龙江省绥化市安达市','黑龙江省绥化市安达市','3','231200','CN',NULL,'1'),
 ('231282','黑龙江省绥化市肇东市','黑龙江省绥化市肇东市','3','231200','CN',NULL,'1'),
 ('231283','黑龙江省绥化市海伦市','黑龙江省绥化市海伦市','3','231200','CN',NULL,'1'),
 ('232700','黑龙江省大兴安岭地区','黑龙江省大兴安岭地区','2','230000','CN',NULL,'1'),
 ('232721','黑龙江省大兴安岭地区呼玛县','黑龙江省大兴安岭地区呼玛县','3','232700','CN',NULL,'1'),
 ('232722','黑龙江省大兴安岭地区塔河县','黑龙江省大兴安岭地区塔河县','3','232700','CN',NULL,'1'),
 ('232723','黑龙江省大兴安岭地区漠河县','黑龙江省大兴安岭地区漠河县','3','232700','CN',NULL,'1'),
 ('310000','上海市','上海市','1','CN','CN',NULL,'1'),
 ('310100','上海市市辖区','上海市市辖区','2','310000','CN',NULL,'1'),
 ('310101','上海市市辖区黄浦区','上海市市辖区黄浦区','3','310100','CN',NULL,'1'),
 ('310103','上海市市辖区卢湾区','上海市市辖区卢湾区','3','310100','CN',NULL,'1'),
 ('310104','上海市市辖区徐汇区','上海市市辖区徐汇区','3','310100','CN',NULL,'1'),
 ('310105','上海市市辖区长宁区','上海市市辖区长宁区','3','310100','CN',NULL,'1'),
 ('310106','上海市市辖区静安区','上海市市辖区静安区','3','310100','CN',NULL,'1'),
 ('310107','上海市市辖区普陀区','上海市市辖区普陀区','3','310100','CN',NULL,'1'),
 ('310108','上海市市辖区闸北区','上海市市辖区闸北区','3','310100','CN',NULL,'1'),
 ('310109','上海市市辖区虹口区','上海市市辖区虹口区','3','310100','CN',NULL,'1'),
 ('310110','上海市市辖区杨浦区','上海市市辖区杨浦区','3','310100','CN',NULL,'1'),
 ('310112','上海市市辖区闵行区','上海市市辖区闵行区','3','310100','CN',NULL,'1'),
 ('310113','上海市市辖区宝山区','上海市市辖区宝山区','3','310100','CN',NULL,'1'),
 ('310114','上海市市辖区嘉定区','上海市市辖区嘉定区','3','310100','CN',NULL,'1'),
 ('310115','上海市市辖区浦东新区','上海市市辖区浦东新区','3','310100','CN',NULL,'1'),
 ('310116','上海市市辖区金山区','上海市市辖区金山区','3','310100','CN',NULL,'1'),
 ('310117','上海市市辖区松江区','上海市市辖区松江区','3','310100','CN',NULL,'1'),
 ('310118','上海市市辖区青浦区','上海市市辖区青浦区','3','310100','CN',NULL,'1'),
 ('310119','上海市市辖区南汇区','上海市市辖区南汇区','3','310100','CN',NULL,'1'),
 ('310120','上海市市辖区奉贤区','上海市市辖区奉贤区','3','310100','CN',NULL,'1'),
 ('310200','上海市县','上海市县','2','310000','CN',NULL,'1'),
 ('310230','上海市县崇明县','上海市县崇明县','3','310200','CN',NULL,'1'),
 ('320000','江苏省','江苏省','1','CN','CN',NULL,'1'),
 ('320100','江苏省南京市','江苏省南京市','2','320000','CN',NULL,'1'),
 ('320101','江苏省南京市市辖区','江苏省南京市市辖区','3','320100','CN',NULL,'1'),
 ('320102','江苏省南京市玄武区','江苏省南京市玄武区','3','320100','CN',NULL,'1'),
 ('320103','江苏省南京市白下区','江苏省南京市白下区','3','320100','CN',NULL,'1'),
 ('320104','江苏省南京市秦淮区','江苏省南京市秦淮区','3','320100','CN',NULL,'1'),
 ('320105','江苏省南京市建邺区','江苏省南京市建邺区','3','320100','CN',NULL,'1'),
 ('320106','江苏省南京市鼓楼区','江苏省南京市鼓楼区','3','320100','CN',NULL,'1'),
 ('320107','江苏省南京市下关区','江苏省南京市下关区','3','320100','CN',NULL,'1'),
 ('320111','江苏省南京市浦口区','江苏省南京市浦口区','3','320100','CN',NULL,'1'),
 ('320113','江苏省南京市栖霞区','江苏省南京市栖霞区','3','320100','CN',NULL,'1'),
 ('320114','江苏省南京市雨花台区','江苏省南京市雨花台区','3','320100','CN',NULL,'1'),
 ('320115','江苏省南京市江宁区','江苏省南京市江宁区','3','320100','CN',NULL,'1'),
 ('320116','江苏省南京市六合区','江苏省南京市六合区','3','320100','CN',NULL,'1'),
 ('320124','江苏省南京市溧水县','江苏省南京市溧水县','3','320100','CN',NULL,'1'),
 ('320125','江苏省南京市高淳县','江苏省南京市高淳县','3','320100','CN',NULL,'1'),
 ('320200','江苏省无锡市','江苏省无锡市','2','320000','CN',NULL,'1'),
 ('320201','江苏省无锡市市辖区','江苏省无锡市市辖区','3','320200','CN',NULL,'1'),
 ('320202','江苏省无锡市崇安区','江苏省无锡市崇安区','3','320200','CN',NULL,'1'),
 ('320203','江苏省无锡市南长区','江苏省无锡市南长区','3','320200','CN',NULL,'1'),
 ('320204','江苏省无锡市北塘区','江苏省无锡市北塘区','3','320200','CN',NULL,'1'),
 ('320205','江苏省无锡市锡山区','江苏省无锡市锡山区','3','320200','CN',NULL,'1'),
 ('320206','江苏省无锡市惠山区','江苏省无锡市惠山区','3','320200','CN',NULL,'1'),
 ('320211','江苏省无锡市滨湖区','江苏省无锡市滨湖区','3','320200','CN',NULL,'1'),
 ('320281','江苏省无锡市江阴市','江苏省无锡市江阴市','3','320200','CN',NULL,'1'),
 ('320282','江苏省无锡市宜兴市','江苏省无锡市宜兴市','3','320200','CN',NULL,'1'),
 ('320300','江苏省徐州市','江苏省徐州市','2','320000','CN',NULL,'1'),
 ('320301','江苏省徐州市市辖区','江苏省徐州市市辖区','3','320300','CN',NULL,'1'),
 ('320302','江苏省徐州市鼓楼区','江苏省徐州市鼓楼区','3','320300','CN',NULL,'1'),
 ('320303','江苏省徐州市云龙区','江苏省徐州市云龙区','3','320300','CN',NULL,'1'),
 ('320304','江苏省徐州市九里区','江苏省徐州市九里区','3','320300','CN',NULL,'1'),
 ('320305','江苏省徐州市贾汪区','江苏省徐州市贾汪区','3','320300','CN',NULL,'1'),
 ('320311','江苏省徐州市泉山区','江苏省徐州市泉山区','3','320300','CN',NULL,'1'),
 ('320321','江苏省徐州市丰县','江苏省徐州市丰县','3','320300','CN',NULL,'1'),
 ('320322','江苏省徐州市沛县','江苏省徐州市沛县','3','320300','CN',NULL,'1'),
 ('320323','江苏省徐州市铜山县','江苏省徐州市铜山县','3','320300','CN',NULL,'1'),
 ('320324','江苏省徐州市睢宁县','江苏省徐州市睢宁县','3','320300','CN',NULL,'1'),
 ('320381','江苏省徐州市新沂市','江苏省徐州市新沂市','3','320300','CN',NULL,'1'),
 ('320382','江苏省徐州市邳州市','江苏省徐州市邳州市','3','320300','CN',NULL,'1'),
 ('320400','江苏省常州市','江苏省常州市','2','320000','CN',NULL,'1'),
 ('320401','江苏省常州市市辖区','江苏省常州市市辖区','3','320400','CN',NULL,'1'),
 ('320402','江苏省常州市天宁区','江苏省常州市天宁区','3','320400','CN',NULL,'1'),
 ('320404','江苏省常州市钟楼区','江苏省常州市钟楼区','3','320400','CN',NULL,'1'),
 ('320405','江苏省常州市戚墅堰区','江苏省常州市戚墅堰区','3','320400','CN',NULL,'1'),
 ('320411','江苏省常州市新北区','江苏省常州市新北区','3','320400','CN',NULL,'1'),
 ('320412','江苏省常州市武进区','江苏省常州市武进区','3','320400','CN',NULL,'1'),
 ('320481','江苏省常州市溧阳市','江苏省常州市溧阳市','3','320400','CN',NULL,'1'),
 ('320482','江苏省常州市金坛市','江苏省常州市金坛市','3','320400','CN',NULL,'1'),
 ('320500','江苏省苏州市','江苏省苏州市','2','320000','CN',NULL,'1'),
 ('320501','江苏省苏州市市辖区','江苏省苏州市市辖区','3','320500','CN',NULL,'1'),
 ('320502','江苏省苏州市沧浪区','江苏省苏州市沧浪区','3','320500','CN',NULL,'1'),
 ('320503','江苏省苏州市平江区','江苏省苏州市平江区','3','320500','CN',NULL,'1'),
 ('320504','江苏省苏州市金阊区','江苏省苏州市金阊区','3','320500','CN',NULL,'1'),
 ('320505','江苏省苏州市虎丘区','江苏省苏州市虎丘区','3','320500','CN',NULL,'1'),
 ('320506','江苏省苏州市吴中区','江苏省苏州市吴中区','3','320500','CN',NULL,'1'),
 ('320507','江苏省苏州市相城区','江苏省苏州市相城区','3','320500','CN',NULL,'1'),
 ('320581','江苏省苏州市常熟市','江苏省苏州市常熟市','3','320500','CN',NULL,'1'),
 ('320582','江苏省苏州市张家港市','江苏省苏州市张家港市','3','320500','CN',NULL,'1'),
 ('320583','江苏省苏州市昆山市','江苏省苏州市昆山市','3','320500','CN',NULL,'1'),
 ('320584','江苏省苏州市吴江市','江苏省苏州市吴江市','3','320500','CN',NULL,'1'),
 ('320585','江苏省苏州市太仓市','江苏省苏州市太仓市','3','320500','CN',NULL,'1'),
 ('320600','江苏省南通市','江苏省南通市','2','320000','CN',NULL,'1'),
 ('320601','江苏省南通市市辖区','江苏省南通市市辖区','3','320600','CN',NULL,'1'),
 ('320602','江苏省南通市崇川区','江苏省南通市崇川区','3','320600','CN',NULL,'1'),
 ('320611','江苏省南通市港闸区','江苏省南通市港闸区','3','320600','CN',NULL,'1'),
 ('320621','江苏省南通市海安县','江苏省南通市海安县','3','320600','CN',NULL,'1'),
 ('320623','江苏省南通市如东县','江苏省南通市如东县','3','320600','CN',NULL,'1'),
 ('320681','江苏省南通市启东市','江苏省南通市启东市','3','320600','CN',NULL,'1'),
 ('320682','江苏省南通市如皋市','江苏省南通市如皋市','3','320600','CN',NULL,'1'),
 ('320683','江苏省南通市通州市','江苏省南通市通州市','3','320600','CN',NULL,'1'),
 ('320684','江苏省南通市海门市','江苏省南通市海门市','3','320600','CN',NULL,'1'),
 ('320700','江苏省连云港市','江苏省连云港市','2','320000','CN',NULL,'1'),
 ('320701','江苏省连云港市市辖区','江苏省连云港市市辖区','3','320700','CN',NULL,'1'),
 ('320703','江苏省连云港市连云区','江苏省连云港市连云区','3','320700','CN',NULL,'1'),
 ('320705','江苏省连云港市新浦区','江苏省连云港市新浦区','3','320700','CN',NULL,'1'),
 ('320706','江苏省连云港市海州区','江苏省连云港市海州区','3','320700','CN',NULL,'1'),
 ('320721','江苏省连云港市赣榆县','江苏省连云港市赣榆县','3','320700','CN',NULL,'1'),
 ('320722','江苏省连云港市东海县','江苏省连云港市东海县','3','320700','CN',NULL,'1'),
 ('320723','江苏省连云港市灌云县','江苏省连云港市灌云县','3','320700','CN',NULL,'1'),
 ('320724','江苏省连云港市灌南县','江苏省连云港市灌南县','3','320700','CN',NULL,'1'),
 ('320800','江苏省淮安市','江苏省淮安市','2','320000','CN',NULL,'1'),
 ('320801','江苏省淮安市市辖区','江苏省淮安市市辖区','3','320800','CN',NULL,'1'),
 ('320802','江苏省淮安市清河区','江苏省淮安市清河区','3','320800','CN',NULL,'1'),
 ('320803','江苏省淮安市楚州区','江苏省淮安市楚州区','3','320800','CN',NULL,'1'),
 ('320804','江苏省淮安市淮阴区','江苏省淮安市淮阴区','3','320800','CN',NULL,'1'),
 ('320811','江苏省淮安市清浦区','江苏省淮安市清浦区','3','320800','CN',NULL,'1'),
 ('320826','江苏省淮安市涟水县','江苏省淮安市涟水县','3','320800','CN',NULL,'1'),
 ('320829','江苏省淮安市洪泽县','江苏省淮安市洪泽县','3','320800','CN',NULL,'1'),
 ('320830','江苏省淮安市盱眙县','江苏省淮安市盱眙县','3','320800','CN',NULL,'1'),
 ('320831','江苏省淮安市金湖县','江苏省淮安市金湖县','3','320800','CN',NULL,'1'),
 ('320900','江苏省盐城市','江苏省盐城市','2','320000','CN',NULL,'1'),
 ('320901','江苏省盐城市市辖区','江苏省盐城市市辖区','3','320900','CN',NULL,'1'),
 ('320902','江苏省盐城市亭湖区','江苏省盐城市亭湖区','3','320900','CN',NULL,'1'),
 ('320903','江苏省盐城市盐都区','江苏省盐城市盐都区','3','320900','CN',NULL,'1'),
 ('320921','江苏省盐城市响水县','江苏省盐城市响水县','3','320900','CN',NULL,'1'),
 ('320922','江苏省盐城市滨海县','江苏省盐城市滨海县','3','320900','CN',NULL,'1'),
 ('320923','江苏省盐城市阜宁县','江苏省盐城市阜宁县','3','320900','CN',NULL,'1'),
 ('320924','江苏省盐城市射阳县','江苏省盐城市射阳县','3','320900','CN',NULL,'1'),
 ('320925','江苏省盐城市建湖县','江苏省盐城市建湖县','3','320900','CN',NULL,'1'),
 ('320981','江苏省盐城市东台市','江苏省盐城市东台市','3','320900','CN',NULL,'1'),
 ('320982','江苏省盐城市大丰市','江苏省盐城市大丰市','3','320900','CN',NULL,'1'),
 ('321000','江苏省扬州市','江苏省扬州市','2','320000','CN',NULL,'1'),
 ('321001','江苏省扬州市市辖区','江苏省扬州市市辖区','3','321000','CN',NULL,'1'),
 ('321002','江苏省扬州市广陵区','江苏省扬州市广陵区','3','321000','CN',NULL,'1'),
 ('321003','江苏省扬州市邗江区','江苏省扬州市邗江区','3','321000','CN',NULL,'1'),
 ('321011','江苏省扬州市维扬区','江苏省扬州市维扬区','3','321000','CN',NULL,'1'),
 ('321023','江苏省扬州市宝应县','江苏省扬州市宝应县','3','321000','CN',NULL,'1'),
 ('321081','江苏省扬州市仪征市','江苏省扬州市仪征市','3','321000','CN',NULL,'1'),
 ('321084','江苏省扬州市高邮市','江苏省扬州市高邮市','3','321000','CN',NULL,'1'),
 ('321088','江苏省扬州市江都市','江苏省扬州市江都市','3','321000','CN',NULL,'1'),
 ('321100','江苏省镇江市','江苏省镇江市','2','320000','CN',NULL,'1'),
 ('321101','江苏省镇江市市辖区','江苏省镇江市市辖区','3','321100','CN',NULL,'1'),
 ('321102','江苏省镇江市京口区','江苏省镇江市京口区','3','321100','CN',NULL,'1'),
 ('321111','江苏省镇江市润州区','江苏省镇江市润州区','3','321100','CN',NULL,'1'),
 ('321112','江苏省镇江市丹徒区','江苏省镇江市丹徒区','3','321100','CN',NULL,'1'),
 ('321181','江苏省镇江市丹阳市','江苏省镇江市丹阳市','3','321100','CN',NULL,'1'),
 ('321182','江苏省镇江市扬中市','江苏省镇江市扬中市','3','321100','CN',NULL,'1'),
 ('321183','江苏省镇江市句容市','江苏省镇江市句容市','3','321100','CN',NULL,'1'),
 ('321200','江苏省泰州市','江苏省泰州市','2','320000','CN',NULL,'1'),
 ('321201','江苏省泰州市市辖区','江苏省泰州市市辖区','3','321200','CN',NULL,'1'),
 ('321202','江苏省泰州市海陵区','江苏省泰州市海陵区','3','321200','CN',NULL,'1'),
 ('321203','江苏省泰州市高港区','江苏省泰州市高港区','3','321200','CN',NULL,'1'),
 ('321281','江苏省泰州市兴化市','江苏省泰州市兴化市','3','321200','CN',NULL,'1'),
 ('321282','江苏省泰州市靖江市','江苏省泰州市靖江市','3','321200','CN',NULL,'1'),
 ('321283','江苏省泰州市泰兴市','江苏省泰州市泰兴市','3','321200','CN',NULL,'1'),
 ('321284','江苏省泰州市姜堰市','江苏省泰州市姜堰市','3','321200','CN',NULL,'1'),
 ('321300','江苏省宿迁市','江苏省宿迁市','2','320000','CN',NULL,'1'),
 ('321301','江苏省宿迁市市辖区','江苏省宿迁市市辖区','3','321300','CN',NULL,'1'),
 ('321302','江苏省宿迁市宿城区','江苏省宿迁市宿城区','3','321300','CN',NULL,'1'),
 ('321311','江苏省宿迁市宿豫区','江苏省宿迁市宿豫区','3','321300','CN',NULL,'1'),
 ('321322','江苏省宿迁市沭阳县','江苏省宿迁市沭阳县','3','321300','CN',NULL,'1'),
 ('321323','江苏省宿迁市泗阳县','江苏省宿迁市泗阳县','3','321300','CN',NULL,'1'),
 ('321324','江苏省宿迁市泗洪县','江苏省宿迁市泗洪县','3','321300','CN',NULL,'1'),
 ('330000','浙江省','浙江省','1','CN','CN',NULL,'1'),
 ('330100','浙江省杭州市','浙江省杭州市','2','330000','CN',NULL,'1'),
 ('330101','浙江省杭州市市辖区','浙江省杭州市市辖区','3','330100','CN',NULL,'1'),
 ('330102','浙江省杭州市上城区','浙江省杭州市上城区','3','330100','CN',NULL,'1'),
 ('330103','浙江省杭州市下城区','浙江省杭州市下城区','3','330100','CN',NULL,'1'),
 ('330104','浙江省杭州市江干区','浙江省杭州市江干区','3','330100','CN',NULL,'1'),
 ('330105','浙江省杭州市拱墅区','浙江省杭州市拱墅区','3','330100','CN',NULL,'1'),
 ('330106','浙江省杭州市西湖区','浙江省杭州市西湖区','3','330100','CN',NULL,'1'),
 ('330108','浙江省杭州市滨江区','浙江省杭州市滨江区','3','330100','CN',NULL,'1'),
 ('330109','浙江省杭州市萧山区','浙江省杭州市萧山区','3','330100','CN',NULL,'1'),
 ('330110','浙江省杭州市余杭区','浙江省杭州市余杭区','3','330100','CN',NULL,'1'),
 ('330122','浙江省杭州市桐庐县','浙江省杭州市桐庐县','3','330100','CN',NULL,'1'),
 ('330127','浙江省杭州市淳安县','浙江省杭州市淳安县','3','330100','CN',NULL,'1'),
 ('330182','浙江省杭州市建德市','浙江省杭州市建德市','3','330100','CN',NULL,'1'),
 ('330183','浙江省杭州市富阳市','浙江省杭州市富阳市','3','330100','CN',NULL,'1'),
 ('330185','浙江省杭州市临安市','浙江省杭州市临安市','3','330100','CN',NULL,'1'),
 ('330200','浙江省宁波市','浙江省宁波市','2','330000','CN',NULL,'1'),
 ('330201','浙江省宁波市市辖区','浙江省宁波市市辖区','3','330200','CN',NULL,'1'),
 ('330203','浙江省宁波市海曙区','浙江省宁波市海曙区','3','330200','CN',NULL,'1'),
 ('330204','浙江省宁波市江东区','浙江省宁波市江东区','3','330200','CN',NULL,'1'),
 ('330205','浙江省宁波市江北区','浙江省宁波市江北区','3','330200','CN',NULL,'1'),
 ('330206','浙江省宁波市北仑区','浙江省宁波市北仑区','3','330200','CN',NULL,'1'),
 ('330211','浙江省宁波市镇海区','浙江省宁波市镇海区','3','330200','CN',NULL,'1'),
 ('330212','浙江省宁波市鄞州区','浙江省宁波市鄞州区','3','330200','CN',NULL,'1'),
 ('330225','浙江省宁波市象山县','浙江省宁波市象山县','3','330200','CN',NULL,'1'),
 ('330226','浙江省宁波市宁海县','浙江省宁波市宁海县','3','330200','CN',NULL,'1'),
 ('330281','浙江省宁波市余姚市','浙江省宁波市余姚市','3','330200','CN',NULL,'1'),
 ('330282','浙江省宁波市慈溪市','浙江省宁波市慈溪市','3','330200','CN',NULL,'1'),
 ('330283','浙江省宁波市奉化市','浙江省宁波市奉化市','3','330200','CN',NULL,'1'),
 ('330300','浙江省温州市','浙江省温州市','2','330000','CN',NULL,'1'),
 ('330301','浙江省温州市市辖区','浙江省温州市市辖区','3','330300','CN',NULL,'1'),
 ('330302','浙江省温州市鹿城区','浙江省温州市鹿城区','3','330300','CN',NULL,'1'),
 ('330303','浙江省温州市龙湾区','浙江省温州市龙湾区','3','330300','CN',NULL,'1'),
 ('330304','浙江省温州市瓯海区','浙江省温州市瓯海区','3','330300','CN',NULL,'1'),
 ('330322','浙江省温州市洞头县','浙江省温州市洞头县','3','330300','CN',NULL,'1'),
 ('330324','浙江省温州市永嘉县','浙江省温州市永嘉县','3','330300','CN',NULL,'1'),
 ('330326','浙江省温州市平阳县','浙江省温州市平阳县','3','330300','CN',NULL,'1'),
 ('330327','浙江省温州市苍南县','浙江省温州市苍南县','3','330300','CN',NULL,'1'),
 ('330328','浙江省温州市文成县','浙江省温州市文成县','3','330300','CN',NULL,'1'),
 ('330329','浙江省温州市泰顺县','浙江省温州市泰顺县','3','330300','CN',NULL,'1'),
 ('330381','浙江省温州市瑞安市','浙江省温州市瑞安市','3','330300','CN',NULL,'1'),
 ('330382','浙江省温州市乐清市','浙江省温州市乐清市','3','330300','CN',NULL,'1'),
 ('330400','浙江省嘉兴市','浙江省嘉兴市','2','330000','CN',NULL,'1'),
 ('330401','浙江省嘉兴市市辖区','浙江省嘉兴市市辖区','3','330400','CN',NULL,'1'),
 ('330402','浙江省嘉兴市秀城区','浙江省嘉兴市秀城区','3','330400','CN',NULL,'1'),
 ('330411','浙江省嘉兴市秀洲区','浙江省嘉兴市秀洲区','3','330400','CN',NULL,'1'),
 ('330421','浙江省嘉兴市嘉善县','浙江省嘉兴市嘉善县','3','330400','CN',NULL,'1'),
 ('330424','浙江省嘉兴市海盐县','浙江省嘉兴市海盐县','3','330400','CN',NULL,'1'),
 ('330481','浙江省嘉兴市海宁市','浙江省嘉兴市海宁市','3','330400','CN',NULL,'1'),
 ('330482','浙江省嘉兴市平湖市','浙江省嘉兴市平湖市','3','330400','CN',NULL,'1'),
 ('330483','浙江省嘉兴市桐乡市','浙江省嘉兴市桐乡市','3','330400','CN',NULL,'1'),
 ('330500','浙江省湖州市','浙江省湖州市','2','330000','CN',NULL,'1'),
 ('330501','浙江省湖州市市辖区','浙江省湖州市市辖区','3','330500','CN',NULL,'1'),
 ('330502','浙江省湖州市吴兴区','浙江省湖州市吴兴区','3','330500','CN',NULL,'1'),
 ('330503','浙江省湖州市南浔区','浙江省湖州市南浔区','3','330500','CN',NULL,'1'),
 ('330521','浙江省湖州市德清县','浙江省湖州市德清县','3','330500','CN',NULL,'1'),
 ('330522','浙江省湖州市长兴县','浙江省湖州市长兴县','3','330500','CN',NULL,'1'),
 ('330523','浙江省湖州市安吉县','浙江省湖州市安吉县','3','330500','CN',NULL,'1'),
 ('330600','浙江省绍兴市','浙江省绍兴市','2','330000','CN',NULL,'1'),
 ('330601','浙江省绍兴市市辖区','浙江省绍兴市市辖区','3','330600','CN',NULL,'1'),
 ('330602','浙江省绍兴市越城区','浙江省绍兴市越城区','3','330600','CN',NULL,'1'),
 ('330621','浙江省绍兴市绍兴县','浙江省绍兴市绍兴县','3','330600','CN',NULL,'1'),
 ('330624','浙江省绍兴市新昌县','浙江省绍兴市新昌县','3','330600','CN',NULL,'1'),
 ('330681','浙江省绍兴市诸暨市','浙江省绍兴市诸暨市','3','330600','CN',NULL,'1'),
 ('330682','浙江省绍兴市上虞市','浙江省绍兴市上虞市','3','330600','CN',NULL,'1'),
 ('330683','浙江省绍兴市嵊州市','浙江省绍兴市嵊州市','3','330600','CN',NULL,'1'),
 ('330700','浙江省金华市','浙江省金华市','2','330000','CN',NULL,'1'),
 ('330701','浙江省金华市市辖区','浙江省金华市市辖区','3','330700','CN',NULL,'1'),
 ('330702','浙江省金华市婺城区','浙江省金华市婺城区','3','330700','CN',NULL,'1'),
 ('330703','浙江省金华市金东区','浙江省金华市金东区','3','330700','CN',NULL,'1'),
 ('330723','浙江省金华市武义县','浙江省金华市武义县','3','330700','CN',NULL,'1'),
 ('330726','浙江省金华市浦江县','浙江省金华市浦江县','3','330700','CN',NULL,'1'),
 ('330727','浙江省金华市磐安县','浙江省金华市磐安县','3','330700','CN',NULL,'1'),
 ('330781','浙江省金华市兰溪市','浙江省金华市兰溪市','3','330700','CN',NULL,'1'),
 ('330782','浙江省金华市义乌市','浙江省金华市义乌市','3','330700','CN',NULL,'1'),
 ('330783','浙江省金华市东阳市','浙江省金华市东阳市','3','330700','CN',NULL,'1'),
 ('330784','浙江省金华市永康市','浙江省金华市永康市','3','330700','CN',NULL,'1'),
 ('330800','浙江省衢州市','浙江省衢州市','2','330000','CN',NULL,'1'),
 ('330801','浙江省衢州市市辖区','浙江省衢州市市辖区','3','330800','CN',NULL,'1'),
 ('330802','浙江省衢州市柯城区','浙江省衢州市柯城区','3','330800','CN',NULL,'1'),
 ('330803','浙江省衢州市衢江区','浙江省衢州市衢江区','3','330800','CN',NULL,'1'),
 ('330822','浙江省衢州市常山县','浙江省衢州市常山县','3','330800','CN',NULL,'1'),
 ('330824','浙江省衢州市开化县','浙江省衢州市开化县','3','330800','CN',NULL,'1'),
 ('330825','浙江省衢州市龙游县','浙江省衢州市龙游县','3','330800','CN',NULL,'1'),
 ('330881','浙江省衢州市江山市','浙江省衢州市江山市','3','330800','CN',NULL,'1'),
 ('330900','浙江省舟山市','浙江省舟山市','2','330000','CN',NULL,'1'),
 ('330901','浙江省舟山市市辖区','浙江省舟山市市辖区','3','330900','CN',NULL,'1'),
 ('330902','浙江省舟山市定海区','浙江省舟山市定海区','3','330900','CN',NULL,'1'),
 ('330903','浙江省舟山市普陀区','浙江省舟山市普陀区','3','330900','CN',NULL,'1'),
 ('330921','浙江省舟山市岱山县','浙江省舟山市岱山县','3','330900','CN',NULL,'1'),
 ('330922','浙江省舟山市嵊泗县','浙江省舟山市嵊泗县','3','330900','CN',NULL,'1'),
 ('331000','浙江省台州市','浙江省台州市','2','330000','CN',NULL,'1'),
 ('331001','浙江省台州市市辖区','浙江省台州市市辖区','3','331000','CN',NULL,'1'),
 ('331002','浙江省台州市椒江区','浙江省台州市椒江区','3','331000','CN',NULL,'1'),
 ('331003','浙江省台州市黄岩区','浙江省台州市黄岩区','3','331000','CN',NULL,'1'),
 ('331004','浙江省台州市路桥区','浙江省台州市路桥区','3','331000','CN',NULL,'1'),
 ('331021','浙江省台州市玉环县','浙江省台州市玉环县','3','331000','CN',NULL,'1'),
 ('331022','浙江省台州市三门县','浙江省台州市三门县','3','331000','CN',NULL,'1'),
 ('331023','浙江省台州市天台县','浙江省台州市天台县','3','331000','CN',NULL,'1'),
 ('331024','浙江省台州市仙居县','浙江省台州市仙居县','3','331000','CN',NULL,'1'),
 ('331081','浙江省台州市温岭市','浙江省台州市温岭市','3','331000','CN',NULL,'1'),
 ('331082','浙江省台州市临海市','浙江省台州市临海市','3','331000','CN',NULL,'1'),
 ('331100','浙江省丽水市','浙江省丽水市','2','330000','CN',NULL,'1'),
 ('331101','浙江省丽水市市辖区','浙江省丽水市市辖区','3','331100','CN',NULL,'1'),
 ('331102','浙江省丽水市莲都区','浙江省丽水市莲都区','3','331100','CN',NULL,'1'),
 ('331121','浙江省丽水市青田县','浙江省丽水市青田县','3','331100','CN',NULL,'1'),
 ('331122','浙江省丽水市缙云县','浙江省丽水市缙云县','3','331100','CN',NULL,'1'),
 ('331123','浙江省丽水市遂昌县','浙江省丽水市遂昌县','3','331100','CN',NULL,'1'),
 ('331124','浙江省丽水市松阳县','浙江省丽水市松阳县','3','331100','CN',NULL,'1'),
 ('331125','浙江省丽水市云和县','浙江省丽水市云和县','3','331100','CN',NULL,'1'),
 ('331126','浙江省丽水市庆元县','浙江省丽水市庆元县','3','331100','CN',NULL,'1'),
 ('331127','浙江省丽水市景宁畲族自治县','浙江省丽水市景宁畲族自治县','3','331100','CN',NULL,'1'),
 ('331181','浙江省丽水市龙泉市','浙江省丽水市龙泉市','3','331100','CN',NULL,'1'),
 ('340000','安徽省','安徽省','1','CN','CN',NULL,'1'),
 ('340100','安徽省合肥市','安徽省合肥市','2','340000','CN',NULL,'1'),
 ('340101','安徽省合肥市市辖区','安徽省合肥市市辖区','3','340100','CN',NULL,'1'),
 ('340102','安徽省合肥市瑶海区','安徽省合肥市瑶海区','3','340100','CN',NULL,'1'),
 ('340103','安徽省合肥市庐阳区','安徽省合肥市庐阳区','3','340100','CN',NULL,'1'),
 ('340104','安徽省合肥市蜀山区','安徽省合肥市蜀山区','3','340100','CN',NULL,'1'),
 ('340111','安徽省合肥市包河区','安徽省合肥市包河区','3','340100','CN',NULL,'1'),
 ('340121','安徽省合肥市长丰县','安徽省合肥市长丰县','3','340100','CN',NULL,'1'),
 ('340122','安徽省合肥市肥东县','安徽省合肥市肥东县','3','340100','CN',NULL,'1'),
 ('340123','安徽省合肥市肥西县','安徽省合肥市肥西县','3','340100','CN',NULL,'1'),
 ('340200','安徽省芜湖市','安徽省芜湖市','2','340000','CN',NULL,'1'),
 ('340201','安徽省芜湖市市辖区','安徽省芜湖市市辖区','3','340200','CN',NULL,'1'),
 ('340202','安徽省芜湖市镜湖区','安徽省芜湖市镜湖区','3','340200','CN',NULL,'1'),
 ('340203','安徽省芜湖市马塘区','安徽省芜湖市马塘区','3','340200','CN',NULL,'1'),
 ('340204','安徽省芜湖市新芜区','安徽省芜湖市新芜区','3','340200','CN',NULL,'1'),
 ('340207','安徽省芜湖市鸠江区','安徽省芜湖市鸠江区','3','340200','CN',NULL,'1'),
 ('340221','安徽省芜湖市芜湖县','安徽省芜湖市芜湖县','3','340200','CN',NULL,'1'),
 ('340222','安徽省芜湖市繁昌县','安徽省芜湖市繁昌县','3','340200','CN',NULL,'1'),
 ('340223','安徽省芜湖市南陵县','安徽省芜湖市南陵县','3','340200','CN',NULL,'1'),
 ('340300','安徽省蚌埠市','安徽省蚌埠市','2','340000','CN',NULL,'1'),
 ('340301','安徽省蚌埠市市辖区','安徽省蚌埠市市辖区','3','340300','CN',NULL,'1'),
 ('340302','安徽省蚌埠市龙子湖区','安徽省蚌埠市龙子湖区','3','340300','CN',NULL,'1'),
 ('340303','安徽省蚌埠市蚌山区','安徽省蚌埠市蚌山区','3','340300','CN',NULL,'1'),
 ('340304','安徽省蚌埠市禹会区','安徽省蚌埠市禹会区','3','340300','CN',NULL,'1'),
 ('340311','安徽省蚌埠市淮上区','安徽省蚌埠市淮上区','3','340300','CN',NULL,'1'),
 ('340321','安徽省蚌埠市怀远县','安徽省蚌埠市怀远县','3','340300','CN',NULL,'1'),
 ('340322','安徽省蚌埠市五河县','安徽省蚌埠市五河县','3','340300','CN',NULL,'1'),
 ('340323','安徽省蚌埠市固镇县','安徽省蚌埠市固镇县','3','340300','CN',NULL,'1'),
 ('340400','安徽省淮南市','安徽省淮南市','2','340000','CN',NULL,'1'),
 ('340401','安徽省淮南市市辖区','安徽省淮南市市辖区','3','340400','CN',NULL,'1'),
 ('340402','安徽省淮南市大通区','安徽省淮南市大通区','3','340400','CN',NULL,'1'),
 ('340403','安徽省淮南市田家庵区','安徽省淮南市田家庵区','3','340400','CN',NULL,'1'),
 ('340404','安徽省淮南市谢家集区','安徽省淮南市谢家集区','3','340400','CN',NULL,'1'),
 ('340405','安徽省淮南市八公山区','安徽省淮南市八公山区','3','340400','CN',NULL,'1'),
 ('340406','安徽省淮南市潘集区','安徽省淮南市潘集区','3','340400','CN',NULL,'1'),
 ('340421','安徽省淮南市凤台县','安徽省淮南市凤台县','3','340400','CN',NULL,'1'),
 ('340500','安徽省马鞍山市','安徽省马鞍山市','2','340000','CN',NULL,'1'),
 ('340501','安徽省马鞍山市市辖区','安徽省马鞍山市市辖区','3','340500','CN',NULL,'1'),
 ('340502','安徽省马鞍山市金家庄区','安徽省马鞍山市金家庄区','3','340500','CN',NULL,'1'),
 ('340503','安徽省马鞍山市花山区','安徽省马鞍山市花山区','3','340500','CN',NULL,'1'),
 ('340504','安徽省马鞍山市雨山区','安徽省马鞍山市雨山区','3','340500','CN',NULL,'1'),
 ('340521','安徽省马鞍山市当涂县','安徽省马鞍山市当涂县','3','340500','CN',NULL,'1'),
 ('340600','安徽省淮北市','安徽省淮北市','2','340000','CN',NULL,'1'),
 ('340601','安徽省淮北市市辖区','安徽省淮北市市辖区','3','340600','CN',NULL,'1'),
 ('340602','安徽省淮北市杜集区','安徽省淮北市杜集区','3','340600','CN',NULL,'1'),
 ('340603','安徽省淮北市相山区','安徽省淮北市相山区','3','340600','CN',NULL,'1'),
 ('340604','安徽省淮北市烈山区','安徽省淮北市烈山区','3','340600','CN',NULL,'1'),
 ('340621','安徽省淮北市濉溪县','安徽省淮北市濉溪县','3','340600','CN',NULL,'1'),
 ('340700','安徽省铜陵市','安徽省铜陵市','2','340000','CN',NULL,'1'),
 ('340701','安徽省铜陵市市辖区','安徽省铜陵市市辖区','3','340700','CN',NULL,'1'),
 ('340702','安徽省铜陵市铜官山区','安徽省铜陵市铜官山区','3','340700','CN',NULL,'1'),
 ('340703','安徽省铜陵市狮子山区','安徽省铜陵市狮子山区','3','340700','CN',NULL,'1'),
 ('340711','安徽省铜陵市郊区','安徽省铜陵市郊区','3','340700','CN',NULL,'1'),
 ('340721','安徽省铜陵市铜陵县','安徽省铜陵市铜陵县','3','340700','CN',NULL,'1'),
 ('340800','安徽省安庆市','安徽省安庆市','2','340000','CN',NULL,'1'),
 ('340801','安徽省安庆市市辖区','安徽省安庆市市辖区','3','340800','CN',NULL,'1'),
 ('340802','安徽省安庆市迎江区','安徽省安庆市迎江区','3','340800','CN',NULL,'1'),
 ('340803','安徽省安庆市大观区','安徽省安庆市大观区','3','340800','CN',NULL,'1'),
 ('340811','安徽省安庆市宜秀区','安徽省安庆市宜秀区','3','340800','CN',NULL,'1'),
 ('340822','安徽省安庆市怀宁县','安徽省安庆市怀宁县','3','340800','CN',NULL,'1'),
 ('340823','安徽省安庆市枞阳县','安徽省安庆市枞阳县','3','340800','CN',NULL,'1'),
 ('340824','安徽省安庆市潜山县','安徽省安庆市潜山县','3','340800','CN',NULL,'1'),
 ('340825','安徽省安庆市太湖县','安徽省安庆市太湖县','3','340800','CN',NULL,'1'),
 ('340826','安徽省安庆市宿松县','安徽省安庆市宿松县','3','340800','CN',NULL,'1'),
 ('340827','安徽省安庆市望江县','安徽省安庆市望江县','3','340800','CN',NULL,'1'),
 ('340828','安徽省安庆市岳西县','安徽省安庆市岳西县','3','340800','CN',NULL,'1'),
 ('340881','安徽省安庆市桐城市','安徽省安庆市桐城市','3','340800','CN',NULL,'1'),
 ('341000','安徽省黄山市','安徽省黄山市','2','340000','CN',NULL,'1'),
 ('341001','安徽省黄山市市辖区','安徽省黄山市市辖区','3','341000','CN',NULL,'1'),
 ('341002','安徽省黄山市屯溪区','安徽省黄山市屯溪区','3','341000','CN',NULL,'1'),
 ('341003','安徽省黄山市黄山区','安徽省黄山市黄山区','3','341000','CN',NULL,'1'),
 ('341004','安徽省黄山市徽州区','安徽省黄山市徽州区','3','341000','CN',NULL,'1'),
 ('341021','安徽省黄山市歙县','安徽省黄山市歙县','3','341000','CN',NULL,'1'),
 ('341022','安徽省黄山市休宁县','安徽省黄山市休宁县','3','341000','CN',NULL,'1'),
 ('341023','安徽省黄山市黟县','安徽省黄山市黟县','3','341000','CN',NULL,'1'),
 ('341024','安徽省黄山市祁门县','安徽省黄山市祁门县','3','341000','CN',NULL,'1'),
 ('341100','安徽省滁州市','安徽省滁州市','2','340000','CN',NULL,'1'),
 ('341101','安徽省滁州市市辖区','安徽省滁州市市辖区','3','341100','CN',NULL,'1'),
 ('341102','安徽省滁州市琅琊区','安徽省滁州市琅琊区','3','341100','CN',NULL,'1'),
 ('341103','安徽省滁州市南谯区','安徽省滁州市南谯区','3','341100','CN',NULL,'1'),
 ('341122','安徽省滁州市来安县','安徽省滁州市来安县','3','341100','CN',NULL,'1'),
 ('341124','安徽省滁州市全椒县','安徽省滁州市全椒县','3','341100','CN',NULL,'1'),
 ('341125','安徽省滁州市定远县','安徽省滁州市定远县','3','341100','CN',NULL,'1'),
 ('341126','安徽省滁州市凤阳县','安徽省滁州市凤阳县','3','341100','CN',NULL,'1'),
 ('341181','安徽省滁州市天长市','安徽省滁州市天长市','3','341100','CN',NULL,'1'),
 ('341182','安徽省滁州市明光市','安徽省滁州市明光市','3','341100','CN',NULL,'1'),
 ('341200','安徽省阜阳市','安徽省阜阳市','2','340000','CN',NULL,'1'),
 ('341201','安徽省阜阳市市辖区','安徽省阜阳市市辖区','3','341200','CN',NULL,'1'),
 ('341202','安徽省阜阳市颍州区','安徽省阜阳市颍州区','3','341200','CN',NULL,'1'),
 ('341203','安徽省阜阳市颍东区','安徽省阜阳市颍东区','3','341200','CN',NULL,'1'),
 ('341204','安徽省阜阳市颍泉区','安徽省阜阳市颍泉区','3','341200','CN',NULL,'1'),
 ('341221','安徽省阜阳市临泉县','安徽省阜阳市临泉县','3','341200','CN',NULL,'1'),
 ('341222','安徽省阜阳市太和县','安徽省阜阳市太和县','3','341200','CN',NULL,'1'),
 ('341225','安徽省阜阳市阜南县','安徽省阜阳市阜南县','3','341200','CN',NULL,'1'),
 ('341226','安徽省阜阳市颍上县','安徽省阜阳市颍上县','3','341200','CN',NULL,'1'),
 ('341282','安徽省阜阳市界首市','安徽省阜阳市界首市','3','341200','CN',NULL,'1'),
 ('341300','安徽省宿州市','安徽省宿州市','2','340000','CN',NULL,'1'),
 ('341301','安徽省宿州市市辖区','安徽省宿州市市辖区','3','341300','CN',NULL,'1'),
 ('341302','安徽省宿州市埇桥区','安徽省宿州市埇桥区','3','341300','CN',NULL,'1'),
 ('341321','安徽省宿州市砀山县','安徽省宿州市砀山县','3','341300','CN',NULL,'1'),
 ('341322','安徽省宿州市萧县','安徽省宿州市萧县','3','341300','CN',NULL,'1'),
 ('341323','安徽省宿州市灵璧县','安徽省宿州市灵璧县','3','341300','CN',NULL,'1'),
 ('341324','安徽省宿州市泗县','安徽省宿州市泗县','3','341300','CN',NULL,'1'),
 ('341400','安徽省巢湖市','安徽省巢湖市','2','340000','CN',NULL,'1'),
 ('341401','安徽省巢湖市市辖区','安徽省巢湖市市辖区','3','341400','CN',NULL,'1');
INSERT INTO `pub_cant` (`CANT_CODE`,`CANT_NAME`,`SHORT_NAME`,`CANT_TYPE`,`SUPER_CODE`,`COUNTRY_CODE`,`CANT_NOTE`,`IN_USE`) VALUES 
 ('341402','安徽省巢湖市居巢区','安徽省巢湖市居巢区','3','341400','CN',NULL,'1'),
 ('341421','安徽省巢湖市庐江县','安徽省巢湖市庐江县','3','341400','CN',NULL,'1'),
 ('341422','安徽省巢湖市无为县','安徽省巢湖市无为县','3','341400','CN',NULL,'1'),
 ('341423','安徽省巢湖市含山县','安徽省巢湖市含山县','3','341400','CN',NULL,'1'),
 ('341424','安徽省巢湖市和县','安徽省巢湖市和县','3','341400','CN',NULL,'1'),
 ('341500','安徽省六安市','安徽省六安市','2','340000','CN',NULL,'1'),
 ('341501','安徽省六安市市辖区','安徽省六安市市辖区','3','341500','CN',NULL,'1'),
 ('341502','安徽省六安市金安区','安徽省六安市金安区','3','341500','CN',NULL,'1'),
 ('341503','安徽省六安市裕安区','安徽省六安市裕安区','3','341500','CN',NULL,'1'),
 ('341521','安徽省六安市寿县','安徽省六安市寿县','3','341500','CN',NULL,'1'),
 ('341522','安徽省六安市霍邱县','安徽省六安市霍邱县','3','341500','CN',NULL,'1'),
 ('341523','安徽省六安市舒城县','安徽省六安市舒城县','3','341500','CN',NULL,'1'),
 ('341524','安徽省六安市金寨县','安徽省六安市金寨县','3','341500','CN',NULL,'1'),
 ('341525','安徽省六安市霍山县','安徽省六安市霍山县','3','341500','CN',NULL,'1'),
 ('341600','安徽省亳州市','安徽省亳州市','2','340000','CN',NULL,'1'),
 ('341601','安徽省亳州市市辖区','安徽省亳州市市辖区','3','341600','CN',NULL,'1'),
 ('341602','安徽省亳州市谯城区','安徽省亳州市谯城区','3','341600','CN',NULL,'1'),
 ('341621','安徽省亳州市涡阳县','安徽省亳州市涡阳县','3','341600','CN',NULL,'1'),
 ('341622','安徽省亳州市蒙城县','安徽省亳州市蒙城县','3','341600','CN',NULL,'1'),
 ('341623','安徽省亳州市利辛县','安徽省亳州市利辛县','3','341600','CN',NULL,'1'),
 ('341700','安徽省池州市','安徽省池州市','2','340000','CN',NULL,'1'),
 ('341701','安徽省池州市市辖区','安徽省池州市市辖区','3','341700','CN',NULL,'1'),
 ('341702','安徽省池州市贵池区','安徽省池州市贵池区','3','341700','CN',NULL,'1'),
 ('341721','安徽省池州市东至县','安徽省池州市东至县','3','341700','CN',NULL,'1'),
 ('341722','安徽省池州市石台县','安徽省池州市石台县','3','341700','CN',NULL,'1'),
 ('341723','安徽省池州市青阳县','安徽省池州市青阳县','3','341700','CN',NULL,'1'),
 ('341800','安徽省宣城市','安徽省宣城市','2','340000','CN',NULL,'1'),
 ('341801','安徽省宣城市市辖区','安徽省宣城市市辖区','3','341800','CN',NULL,'1'),
 ('341802','安徽省宣城市宣州区','安徽省宣城市宣州区','3','341800','CN',NULL,'1'),
 ('341821','安徽省宣城市郎溪县','安徽省宣城市郎溪县','3','341800','CN',NULL,'1'),
 ('341822','安徽省宣城市广德县','安徽省宣城市广德县','3','341800','CN',NULL,'1'),
 ('341823','安徽省宣城市泾县','安徽省宣城市泾县','3','341800','CN',NULL,'1'),
 ('341824','安徽省宣城市绩溪县','安徽省宣城市绩溪县','3','341800','CN',NULL,'1'),
 ('341825','安徽省宣城市旌德县','安徽省宣城市旌德县','3','341800','CN',NULL,'1'),
 ('341881','安徽省宣城市宁国市','安徽省宣城市宁国市','3','341800','CN',NULL,'1'),
 ('350000','福建省','福建省','1','CN','CN',NULL,'1'),
 ('350100','福建省福州市','福建省福州市','2','350000','CN',NULL,'1'),
 ('350101','福建省福州市市辖区','福建省福州市市辖区','3','350100','CN',NULL,'1'),
 ('350102','福建省福州市鼓楼区','福建省福州市鼓楼区','3','350100','CN',NULL,'1'),
 ('350103','福建省福州市台江区','福建省福州市台江区','3','350100','CN',NULL,'1'),
 ('350104','福建省福州市仓山区','福建省福州市仓山区','3','350100','CN',NULL,'1'),
 ('350105','福建省福州市马尾区','福建省福州市马尾区','3','350100','CN',NULL,'1'),
 ('350111','福建省福州市晋安区','福建省福州市晋安区','3','350100','CN',NULL,'1'),
 ('350121','福建省福州市闽侯县','福建省福州市闽侯县','3','350100','CN',NULL,'1'),
 ('350122','福建省福州市连江县','福建省福州市连江县','3','350100','CN',NULL,'1'),
 ('350123','福建省福州市罗源县','福建省福州市罗源县','3','350100','CN',NULL,'1'),
 ('350124','福建省福州市闽清县','福建省福州市闽清县','3','350100','CN',NULL,'1'),
 ('350125','福建省福州市永泰县','福建省福州市永泰县','3','350100','CN',NULL,'1'),
 ('350128','福建省福州市平潭县','福建省福州市平潭县','3','350100','CN',NULL,'1'),
 ('350181','福建省福州市福清市','福建省福州市福清市','3','350100','CN',NULL,'1'),
 ('350182','福建省福州市长乐市','福建省福州市长乐市','3','350100','CN',NULL,'1'),
 ('350200','福建省厦门市','福建省厦门市','2','350000','CN',NULL,'1'),
 ('350201','福建省厦门市市辖区','福建省厦门市市辖区','3','350200','CN',NULL,'1'),
 ('350203','福建省厦门市思明区','福建省厦门市思明区','3','350200','CN',NULL,'1'),
 ('350205','福建省厦门市海沧区','福建省厦门市海沧区','3','350200','CN',NULL,'1'),
 ('350206','福建省厦门市湖里区','福建省厦门市湖里区','3','350200','CN',NULL,'1'),
 ('350211','福建省厦门市集美区','福建省厦门市集美区','3','350200','CN',NULL,'1'),
 ('350212','福建省厦门市同安区','福建省厦门市同安区','3','350200','CN',NULL,'1'),
 ('350213','福建省厦门市翔安区','福建省厦门市翔安区','3','350200','CN',NULL,'1'),
 ('350300','福建省莆田市','福建省莆田市','2','350000','CN',NULL,'1'),
 ('350301','福建省莆田市市辖区','福建省莆田市市辖区','3','350300','CN',NULL,'1'),
 ('350302','福建省莆田市城厢区','福建省莆田市城厢区','3','350300','CN',NULL,'1'),
 ('350303','福建省莆田市涵江区','福建省莆田市涵江区','3','350300','CN',NULL,'1'),
 ('350304','福建省莆田市荔城区','福建省莆田市荔城区','3','350300','CN',NULL,'1'),
 ('350305','福建省莆田市秀屿区','福建省莆田市秀屿区','3','350300','CN',NULL,'1'),
 ('350322','福建省莆田市仙游县','福建省莆田市仙游县','3','350300','CN',NULL,'1'),
 ('350400','福建省三明市','福建省三明市','2','350000','CN',NULL,'1'),
 ('350401','福建省三明市市辖区','福建省三明市市辖区','3','350400','CN',NULL,'1'),
 ('350402','福建省三明市梅列区','福建省三明市梅列区','3','350400','CN',NULL,'1'),
 ('350403','福建省三明市三元区','福建省三明市三元区','3','350400','CN',NULL,'1'),
 ('350421','福建省三明市明溪县','福建省三明市明溪县','3','350400','CN',NULL,'1'),
 ('350423','福建省三明市清流县','福建省三明市清流县','3','350400','CN',NULL,'1'),
 ('350424','福建省三明市宁化县','福建省三明市宁化县','3','350400','CN',NULL,'1'),
 ('350425','福建省三明市大田县','福建省三明市大田县','3','350400','CN',NULL,'1'),
 ('350426','福建省三明市尤溪县','福建省三明市尤溪县','3','350400','CN',NULL,'1'),
 ('350427','福建省三明市沙县','福建省三明市沙县','3','350400','CN',NULL,'1'),
 ('350428','福建省三明市将乐县','福建省三明市将乐县','3','350400','CN',NULL,'1'),
 ('350429','福建省三明市泰宁县','福建省三明市泰宁县','3','350400','CN',NULL,'1'),
 ('350430','福建省三明市建宁县','福建省三明市建宁县','3','350400','CN',NULL,'1'),
 ('350481','福建省三明市永安市','福建省三明市永安市','3','350400','CN',NULL,'1'),
 ('350500','福建省泉州市','福建省泉州市','2','350000','CN',NULL,'1'),
 ('350501','福建省泉州市市辖区','福建省泉州市市辖区','3','350500','CN',NULL,'1'),
 ('350502','福建省泉州市鲤城区','福建省泉州市鲤城区','3','350500','CN',NULL,'1'),
 ('350503','福建省泉州市丰泽区','福建省泉州市丰泽区','3','350500','CN',NULL,'1'),
 ('350504','福建省泉州市洛江区','福建省泉州市洛江区','3','350500','CN',NULL,'1'),
 ('350505','福建省泉州市泉港区','福建省泉州市泉港区','3','350500','CN',NULL,'1'),
 ('350521','福建省泉州市惠安县','福建省泉州市惠安县','3','350500','CN',NULL,'1'),
 ('350524','福建省泉州市安溪县','福建省泉州市安溪县','3','350500','CN',NULL,'1'),
 ('350525','福建省泉州市永春县','福建省泉州市永春县','3','350500','CN',NULL,'1'),
 ('350526','福建省泉州市德化县','福建省泉州市德化县','3','350500','CN',NULL,'1'),
 ('350527','福建省泉州市金门县','福建省泉州市金门县','3','350500','CN',NULL,'1'),
 ('350581','福建省泉州市石狮市','福建省泉州市石狮市','3','350500','CN',NULL,'1'),
 ('350582','福建省泉州市晋江市','福建省泉州市晋江市','3','350500','CN',NULL,'1'),
 ('350583','福建省泉州市南安市','福建省泉州市南安市','3','350500','CN',NULL,'1'),
 ('350600','福建省漳州市','福建省漳州市','2','350000','CN',NULL,'1'),
 ('350601','福建省漳州市市辖区','福建省漳州市市辖区','3','350600','CN',NULL,'1'),
 ('350602','福建省漳州市芗城区','福建省漳州市芗城区','3','350600','CN',NULL,'1'),
 ('350603','福建省漳州市龙文区','福建省漳州市龙文区','3','350600','CN',NULL,'1'),
 ('350622','福建省漳州市云霄县','福建省漳州市云霄县','3','350600','CN',NULL,'1'),
 ('350623','福建省漳州市漳浦县','福建省漳州市漳浦县','3','350600','CN',NULL,'1'),
 ('350624','福建省漳州市诏安县','福建省漳州市诏安县','3','350600','CN',NULL,'1'),
 ('350625','福建省漳州市长泰县','福建省漳州市长泰县','3','350600','CN',NULL,'1'),
 ('350626','福建省漳州市东山县','福建省漳州市东山县','3','350600','CN',NULL,'1'),
 ('350627','福建省漳州市南靖县','福建省漳州市南靖县','3','350600','CN',NULL,'1'),
 ('350628','福建省漳州市平和县','福建省漳州市平和县','3','350600','CN',NULL,'1'),
 ('350629','福建省漳州市华安县','福建省漳州市华安县','3','350600','CN',NULL,'1'),
 ('350681','福建省漳州市龙海市','福建省漳州市龙海市','3','350600','CN',NULL,'1'),
 ('350700','福建省南平市','福建省南平市','2','350000','CN',NULL,'1'),
 ('350701','福建省南平市市辖区','福建省南平市市辖区','3','350700','CN',NULL,'1'),
 ('350702','福建省南平市延平区','福建省南平市延平区','3','350700','CN',NULL,'1'),
 ('350721','福建省南平市顺昌县','福建省南平市顺昌县','3','350700','CN',NULL,'1'),
 ('350722','福建省南平市浦城县','福建省南平市浦城县','3','350700','CN',NULL,'1'),
 ('350723','福建省南平市光泽县','福建省南平市光泽县','3','350700','CN',NULL,'1'),
 ('350724','福建省南平市松溪县','福建省南平市松溪县','3','350700','CN',NULL,'1'),
 ('350725','福建省南平市政和县','福建省南平市政和县','3','350700','CN',NULL,'1'),
 ('350781','福建省南平市邵武市','福建省南平市邵武市','3','350700','CN',NULL,'1'),
 ('350782','福建省南平市武夷山市','福建省南平市武夷山市','3','350700','CN',NULL,'1'),
 ('350783','福建省南平市建瓯市','福建省南平市建瓯市','3','350700','CN',NULL,'1'),
 ('350784','福建省南平市建阳市','福建省南平市建阳市','3','350700','CN',NULL,'1'),
 ('350800','福建省龙岩市','福建省龙岩市','2','350000','CN',NULL,'1'),
 ('350801','福建省龙岩市市辖区','福建省龙岩市市辖区','3','350800','CN',NULL,'1'),
 ('350802','福建省龙岩市新罗区','福建省龙岩市新罗区','3','350800','CN',NULL,'1'),
 ('350821','福建省龙岩市长汀县','福建省龙岩市长汀县','3','350800','CN',NULL,'1'),
 ('350822','福建省龙岩市永定县','福建省龙岩市永定县','3','350800','CN',NULL,'1'),
 ('350823','福建省龙岩市上杭县','福建省龙岩市上杭县','3','350800','CN',NULL,'1'),
 ('350824','福建省龙岩市武平县','福建省龙岩市武平县','3','350800','CN',NULL,'1'),
 ('350825','福建省龙岩市连城县','福建省龙岩市连城县','3','350800','CN',NULL,'1'),
 ('350881','福建省龙岩市漳平市','福建省龙岩市漳平市','3','350800','CN',NULL,'1'),
 ('350900','福建省宁德市','福建省宁德市','2','350000','CN',NULL,'1'),
 ('350901','福建省宁德市市辖区','福建省宁德市市辖区','3','350900','CN',NULL,'1'),
 ('350902','福建省宁德市蕉城区','福建省宁德市蕉城区','3','350900','CN',NULL,'1'),
 ('350921','福建省宁德市霞浦县','福建省宁德市霞浦县','3','350900','CN',NULL,'1'),
 ('350922','福建省宁德市古田县','福建省宁德市古田县','3','350900','CN',NULL,'1'),
 ('350923','福建省宁德市屏南县','福建省宁德市屏南县','3','350900','CN',NULL,'1'),
 ('350924','福建省宁德市寿宁县','福建省宁德市寿宁县','3','350900','CN',NULL,'1'),
 ('350925','福建省宁德市周宁县','福建省宁德市周宁县','3','350900','CN',NULL,'1'),
 ('350926','福建省宁德市柘荣县','福建省宁德市柘荣县','3','350900','CN',NULL,'1'),
 ('350981','福建省宁德市福安市','福建省宁德市福安市','3','350900','CN',NULL,'1'),
 ('350982','福建省宁德市福鼎市','福建省宁德市福鼎市','3','350900','CN',NULL,'1'),
 ('360000','江西省','江西省','1','CN','CN',NULL,'1'),
 ('360100','江西省南昌市','江西省南昌市','2','360000','CN',NULL,'1'),
 ('360101','江西省南昌市市辖区','江西省南昌市市辖区','3','360100','CN',NULL,'1'),
 ('360102','江西省南昌市东湖区','江西省南昌市东湖区','3','360100','CN',NULL,'1'),
 ('360103','江西省南昌市西湖区','江西省南昌市西湖区','3','360100','CN',NULL,'1'),
 ('360104','江西省南昌市青云谱区','江西省南昌市青云谱区','3','360100','CN',NULL,'1'),
 ('360105','江西省南昌市湾里区','江西省南昌市湾里区','3','360100','CN',NULL,'1'),
 ('360111','江西省南昌市青山湖区','江西省南昌市青山湖区','3','360100','CN',NULL,'1'),
 ('360121','江西省南昌市南昌县','江西省南昌市南昌县','3','360100','CN',NULL,'1'),
 ('360122','江西省南昌市新建县','江西省南昌市新建县','3','360100','CN',NULL,'1'),
 ('360123','江西省南昌市安义县','江西省南昌市安义县','3','360100','CN',NULL,'1'),
 ('360124','江西省南昌市进贤县','江西省南昌市进贤县','3','360100','CN',NULL,'1'),
 ('360200','江西省景德镇市','江西省景德镇市','2','360000','CN',NULL,'1'),
 ('360201','江西省景德镇市市辖区','江西省景德镇市市辖区','3','360200','CN',NULL,'1'),
 ('360202','江西省景德镇市昌江区','江西省景德镇市昌江区','3','360200','CN',NULL,'1'),
 ('360203','江西省景德镇市珠山区','江西省景德镇市珠山区','3','360200','CN',NULL,'1'),
 ('360222','江西省景德镇市浮梁县','江西省景德镇市浮梁县','3','360200','CN',NULL,'1'),
 ('360281','江西省景德镇市乐平市','江西省景德镇市乐平市','3','360200','CN',NULL,'1'),
 ('360300','江西省萍乡市','江西省萍乡市','2','360000','CN',NULL,'1'),
 ('360301','江西省萍乡市市辖区','江西省萍乡市市辖区','3','360300','CN',NULL,'1'),
 ('360302','江西省萍乡市安源区','江西省萍乡市安源区','3','360300','CN',NULL,'1'),
 ('360313','江西省萍乡市湘东区','江西省萍乡市湘东区','3','360300','CN',NULL,'1'),
 ('360321','江西省萍乡市莲花县','江西省萍乡市莲花县','3','360300','CN',NULL,'1'),
 ('360322','江西省萍乡市上栗县','江西省萍乡市上栗县','3','360300','CN',NULL,'1'),
 ('360323','江西省萍乡市芦溪县','江西省萍乡市芦溪县','3','360300','CN',NULL,'1'),
 ('360400','江西省九江市','江西省九江市','2','360000','CN',NULL,'1'),
 ('360401','江西省九江市市辖区','江西省九江市市辖区','3','360400','CN',NULL,'1'),
 ('360402','江西省九江市庐山区','江西省九江市庐山区','3','360400','CN',NULL,'1'),
 ('360403','江西省九江市浔阳区','江西省九江市浔阳区','3','360400','CN',NULL,'1'),
 ('360421','江西省九江市九江县','江西省九江市九江县','3','360400','CN',NULL,'1'),
 ('360423','江西省九江市武宁县','江西省九江市武宁县','3','360400','CN',NULL,'1'),
 ('360424','江西省九江市修水县','江西省九江市修水县','3','360400','CN',NULL,'1'),
 ('360425','江西省九江市永修县','江西省九江市永修县','3','360400','CN',NULL,'1'),
 ('360426','江西省九江市德安县','江西省九江市德安县','3','360400','CN',NULL,'1'),
 ('360427','江西省九江市星子县','江西省九江市星子县','3','360400','CN',NULL,'1'),
 ('360428','江西省九江市都昌县','江西省九江市都昌县','3','360400','CN',NULL,'1'),
 ('360429','江西省九江市湖口县','江西省九江市湖口县','3','360400','CN',NULL,'1'),
 ('360430','江西省九江市彭泽县','江西省九江市彭泽县','3','360400','CN',NULL,'1'),
 ('360481','江西省九江市瑞昌市','江西省九江市瑞昌市','3','360400','CN',NULL,'1'),
 ('360500','江西省新余市','江西省新余市','2','360000','CN',NULL,'1'),
 ('360501','江西省新余市市辖区','江西省新余市市辖区','3','360500','CN',NULL,'1'),
 ('360502','江西省新余市渝水区','江西省新余市渝水区','3','360500','CN',NULL,'1'),
 ('360521','江西省新余市分宜县','江西省新余市分宜县','3','360500','CN',NULL,'1'),
 ('360600','江西省鹰潭市','江西省鹰潭市','2','360000','CN',NULL,'1'),
 ('360601','江西省鹰潭市市辖区','江西省鹰潭市市辖区','3','360600','CN',NULL,'1'),
 ('360602','江西省鹰潭市月湖区','江西省鹰潭市月湖区','3','360600','CN',NULL,'1'),
 ('360622','江西省鹰潭市余江县','江西省鹰潭市余江县','3','360600','CN',NULL,'1'),
 ('360681','江西省鹰潭市贵溪市','江西省鹰潭市贵溪市','3','360600','CN',NULL,'1'),
 ('360700','江西省赣州市','江西省赣州市','2','360000','CN',NULL,'1'),
 ('360701','江西省赣州市市辖区','江西省赣州市市辖区','3','360700','CN',NULL,'1'),
 ('360702','江西省赣州市章贡区','江西省赣州市章贡区','3','360700','CN',NULL,'1'),
 ('360721','江西省赣州市赣县','江西省赣州市赣县','3','360700','CN',NULL,'1'),
 ('360722','江西省赣州市信丰县','江西省赣州市信丰县','3','360700','CN',NULL,'1'),
 ('360723','江西省赣州市大余县','江西省赣州市大余县','3','360700','CN',NULL,'1'),
 ('360724','江西省赣州市上犹县','江西省赣州市上犹县','3','360700','CN',NULL,'1'),
 ('360725','江西省赣州市崇义县','江西省赣州市崇义县','3','360700','CN',NULL,'1'),
 ('360726','江西省赣州市安远县','江西省赣州市安远县','3','360700','CN',NULL,'1'),
 ('360727','江西省赣州市龙南县','江西省赣州市龙南县','3','360700','CN',NULL,'1'),
 ('360728','江西省赣州市定南县','江西省赣州市定南县','3','360700','CN',NULL,'1'),
 ('360729','江西省赣州市全南县','江西省赣州市全南县','3','360700','CN',NULL,'1'),
 ('360730','江西省赣州市宁都县','江西省赣州市宁都县','3','360700','CN',NULL,'1'),
 ('360731','江西省赣州市于都县','江西省赣州市于都县','3','360700','CN',NULL,'1'),
 ('360732','江西省赣州市兴国县','江西省赣州市兴国县','3','360700','CN',NULL,'1'),
 ('360733','江西省赣州市会昌县','江西省赣州市会昌县','3','360700','CN',NULL,'1'),
 ('360734','江西省赣州市寻乌县','江西省赣州市寻乌县','3','360700','CN',NULL,'1'),
 ('360735','江西省赣州市石城县','江西省赣州市石城县','3','360700','CN',NULL,'1'),
 ('360781','江西省赣州市瑞金市','江西省赣州市瑞金市','3','360700','CN',NULL,'1'),
 ('360782','江西省赣州市南康市','江西省赣州市南康市','3','360700','CN',NULL,'1'),
 ('360800','江西省吉安市','江西省吉安市','2','360000','CN',NULL,'1'),
 ('360801','江西省吉安市市辖区','江西省吉安市市辖区','3','360800','CN',NULL,'1'),
 ('360802','江西省吉安市吉州区','江西省吉安市吉州区','3','360800','CN',NULL,'1'),
 ('360803','江西省吉安市青原区','江西省吉安市青原区','3','360800','CN',NULL,'1'),
 ('360821','江西省吉安市吉安县','江西省吉安市吉安县','3','360800','CN',NULL,'1'),
 ('360822','江西省吉安市吉水县','江西省吉安市吉水县','3','360800','CN',NULL,'1'),
 ('360823','江西省吉安市峡江县','江西省吉安市峡江县','3','360800','CN',NULL,'1'),
 ('360824','江西省吉安市新干县','江西省吉安市新干县','3','360800','CN',NULL,'1'),
 ('360825','江西省吉安市永丰县','江西省吉安市永丰县','3','360800','CN',NULL,'1'),
 ('360826','江西省吉安市泰和县','江西省吉安市泰和县','3','360800','CN',NULL,'1'),
 ('360827','江西省吉安市遂川县','江西省吉安市遂川县','3','360800','CN',NULL,'1'),
 ('360828','江西省吉安市万安县','江西省吉安市万安县','3','360800','CN',NULL,'1'),
 ('360829','江西省吉安市安福县','江西省吉安市安福县','3','360800','CN',NULL,'1'),
 ('360830','江西省吉安市永新县','江西省吉安市永新县','3','360800','CN',NULL,'1'),
 ('360881','江西省吉安市井冈山市','江西省吉安市井冈山市','3','360800','CN',NULL,'1'),
 ('360900','江西省宜春市','江西省宜春市','2','360000','CN',NULL,'1'),
 ('360901','江西省宜春市市辖区','江西省宜春市市辖区','3','360900','CN',NULL,'1'),
 ('360902','江西省宜春市袁州区','江西省宜春市袁州区','3','360900','CN',NULL,'1'),
 ('360921','江西省宜春市奉新县','江西省宜春市奉新县','3','360900','CN',NULL,'1'),
 ('360922','江西省宜春市万载县','江西省宜春市万载县','3','360900','CN',NULL,'1'),
 ('360923','江西省宜春市上高县','江西省宜春市上高县','3','360900','CN',NULL,'1'),
 ('360924','江西省宜春市宜丰县','江西省宜春市宜丰县','3','360900','CN',NULL,'1'),
 ('360925','江西省宜春市靖安县','江西省宜春市靖安县','3','360900','CN',NULL,'1'),
 ('360926','江西省宜春市铜鼓县','江西省宜春市铜鼓县','3','360900','CN',NULL,'1'),
 ('360981','江西省宜春市丰城市','江西省宜春市丰城市','3','360900','CN',NULL,'1'),
 ('360982','江西省宜春市樟树市','江西省宜春市樟树市','3','360900','CN',NULL,'1'),
 ('360983','江西省宜春市高安市','江西省宜春市高安市','3','360900','CN',NULL,'1'),
 ('361000','江西省抚州市','江西省抚州市','2','360000','CN',NULL,'1'),
 ('361001','江西省抚州市市辖区','江西省抚州市市辖区','3','361000','CN',NULL,'1'),
 ('361002','江西省抚州市临川区','江西省抚州市临川区','3','361000','CN',NULL,'1'),
 ('361021','江西省抚州市南城县','江西省抚州市南城县','3','361000','CN',NULL,'1'),
 ('361022','江西省抚州市黎川县','江西省抚州市黎川县','3','361000','CN',NULL,'1'),
 ('361023','江西省抚州市南丰县','江西省抚州市南丰县','3','361000','CN',NULL,'1'),
 ('361024','江西省抚州市崇仁县','江西省抚州市崇仁县','3','361000','CN',NULL,'1'),
 ('361025','江西省抚州市乐安县','江西省抚州市乐安县','3','361000','CN',NULL,'1'),
 ('361026','江西省抚州市宜黄县','江西省抚州市宜黄县','3','361000','CN',NULL,'1'),
 ('361027','江西省抚州市金溪县','江西省抚州市金溪县','3','361000','CN',NULL,'1'),
 ('361028','江西省抚州市资溪县','江西省抚州市资溪县','3','361000','CN',NULL,'1'),
 ('361029','江西省抚州市东乡县','江西省抚州市东乡县','3','361000','CN',NULL,'1'),
 ('361030','江西省抚州市广昌县','江西省抚州市广昌县','3','361000','CN',NULL,'1'),
 ('361100','江西省上饶市','江西省上饶市','2','360000','CN',NULL,'1'),
 ('361101','江西省上饶市市辖区','江西省上饶市市辖区','3','361100','CN',NULL,'1'),
 ('361102','江西省上饶市信州区','江西省上饶市信州区','3','361100','CN',NULL,'1'),
 ('361121','江西省上饶市上饶县','江西省上饶市上饶县','3','361100','CN',NULL,'1'),
 ('361122','江西省上饶市广丰县','江西省上饶市广丰县','3','361100','CN',NULL,'1'),
 ('361123','江西省上饶市玉山县','江西省上饶市玉山县','3','361100','CN',NULL,'1'),
 ('361124','江西省上饶市铅山县','江西省上饶市铅山县','3','361100','CN',NULL,'1'),
 ('361125','江西省上饶市横峰县','江西省上饶市横峰县','3','361100','CN',NULL,'1'),
 ('361126','江西省上饶市弋阳县','江西省上饶市弋阳县','3','361100','CN',NULL,'1'),
 ('361127','江西省上饶市余干县','江西省上饶市余干县','3','361100','CN',NULL,'1'),
 ('361128','江西省上饶市鄱阳县','江西省上饶市鄱阳县','3','361100','CN',NULL,'1'),
 ('361129','江西省上饶市万年县','江西省上饶市万年县','3','361100','CN',NULL,'1'),
 ('361130','江西省上饶市婺源县','江西省上饶市婺源县','3','361100','CN',NULL,'1'),
 ('361181','江西省上饶市德兴市','江西省上饶市德兴市','3','361100','CN',NULL,'1'),
 ('370000','山东省','山东省','1','CN','CN',NULL,'1'),
 ('370100','山东省济南市','山东省济南市','2','370000','CN',NULL,'1'),
 ('370101','山东省济南市市辖区','山东省济南市市辖区','3','370100','CN',NULL,'1'),
 ('370102','山东省济南市历下区','山东省济南市历下区','3','370100','CN',NULL,'1'),
 ('370103','山东省济南市市中区','山东省济南市市中区','3','370100','CN',NULL,'1'),
 ('370104','山东省济南市槐荫区','山东省济南市槐荫区','3','370100','CN',NULL,'1'),
 ('370105','山东省济南市天桥区','山东省济南市天桥区','3','370100','CN',NULL,'1'),
 ('370112','山东省济南市历城区','山东省济南市历城区','3','370100','CN',NULL,'1'),
 ('370113','山东省济南市长清区','山东省济南市长清区','3','370100','CN',NULL,'1'),
 ('370124','山东省济南市平阴县','山东省济南市平阴县','3','370100','CN',NULL,'1'),
 ('370125','山东省济南市济阳县','山东省济南市济阳县','3','370100','CN',NULL,'1'),
 ('370126','山东省济南市商河县','山东省济南市商河县','3','370100','CN',NULL,'1'),
 ('370181','山东省济南市章丘市','山东省济南市章丘市','3','370100','CN',NULL,'1'),
 ('370200','山东省青岛市','山东省青岛市','2','370000','CN',NULL,'1'),
 ('370201','山东省青岛市市辖区','山东省青岛市市辖区','3','370200','CN',NULL,'1'),
 ('370202','山东省青岛市市南区','山东省青岛市市南区','3','370200','CN',NULL,'1'),
 ('370203','山东省青岛市市北区','山东省青岛市市北区','3','370200','CN',NULL,'1'),
 ('370205','山东省青岛市四方区','山东省青岛市四方区','3','370200','CN',NULL,'1'),
 ('370211','山东省青岛市黄岛区','山东省青岛市黄岛区','3','370200','CN',NULL,'1'),
 ('370212','山东省青岛市崂山区','山东省青岛市崂山区','3','370200','CN',NULL,'1'),
 ('370213','山东省青岛市李沧区','山东省青岛市李沧区','3','370200','CN',NULL,'1'),
 ('370214','山东省青岛市城阳区','山东省青岛市城阳区','3','370200','CN',NULL,'1'),
 ('370281','山东省青岛市胶州市','山东省青岛市胶州市','3','370200','CN',NULL,'1'),
 ('370282','山东省青岛市即墨市','山东省青岛市即墨市','3','370200','CN',NULL,'1'),
 ('370283','山东省青岛市平度市','山东省青岛市平度市','3','370200','CN',NULL,'1'),
 ('370284','山东省青岛市胶南市','山东省青岛市胶南市','3','370200','CN',NULL,'1'),
 ('370285','山东省青岛市莱西市','山东省青岛市莱西市','3','370200','CN',NULL,'1'),
 ('370300','山东省淄博市','山东省淄博市','2','370000','CN',NULL,'1'),
 ('370301','山东省淄博市市辖区','山东省淄博市市辖区','3','370300','CN',NULL,'1'),
 ('370302','山东省淄博市淄川区','山东省淄博市淄川区','3','370300','CN',NULL,'1'),
 ('370303','山东省淄博市张店区','山东省淄博市张店区','3','370300','CN',NULL,'1'),
 ('370304','山东省淄博市博山区','山东省淄博市博山区','3','370300','CN',NULL,'1'),
 ('370305','山东省淄博市临淄区','山东省淄博市临淄区','3','370300','CN',NULL,'1'),
 ('370306','山东省淄博市周村区','山东省淄博市周村区','3','370300','CN',NULL,'1'),
 ('370321','山东省淄博市桓台县','山东省淄博市桓台县','3','370300','CN',NULL,'1'),
 ('370322','山东省淄博市高青县','山东省淄博市高青县','3','370300','CN',NULL,'1'),
 ('370323','山东省淄博市沂源县','山东省淄博市沂源县','3','370300','CN',NULL,'1'),
 ('370400','山东省枣庄市','山东省枣庄市','2','370000','CN',NULL,'1'),
 ('370401','山东省枣庄市市辖区','山东省枣庄市市辖区','3','370400','CN',NULL,'1'),
 ('370402','山东省枣庄市市中区','山东省枣庄市市中区','3','370400','CN',NULL,'1'),
 ('370403','山东省枣庄市薛城区','山东省枣庄市薛城区','3','370400','CN',NULL,'1'),
 ('370404','山东省枣庄市峄城区','山东省枣庄市峄城区','3','370400','CN',NULL,'1'),
 ('370405','山东省枣庄市台儿庄区','山东省枣庄市台儿庄区','3','370400','CN',NULL,'1'),
 ('370406','山东省枣庄市山亭区','山东省枣庄市山亭区','3','370400','CN',NULL,'1'),
 ('370481','山东省枣庄市滕州市','山东省枣庄市滕州市','3','370400','CN',NULL,'1'),
 ('370500','山东省东营市','山东省东营市','2','370000','CN',NULL,'1'),
 ('370501','山东省东营市市辖区','山东省东营市市辖区','3','370500','CN',NULL,'1'),
 ('370502','山东省东营市东营区','山东省东营市东营区','3','370500','CN',NULL,'1'),
 ('370503','山东省东营市河口区','山东省东营市河口区','3','370500','CN',NULL,'1'),
 ('370521','山东省东营市垦利县','山东省东营市垦利县','3','370500','CN',NULL,'1'),
 ('370522','山东省东营市利津县','山东省东营市利津县','3','370500','CN',NULL,'1'),
 ('370523','山东省东营市广饶县','山东省东营市广饶县','3','370500','CN',NULL,'1'),
 ('370600','山东省烟台市','山东省烟台市','2','370000','CN',NULL,'1'),
 ('370601','山东省烟台市市辖区','山东省烟台市市辖区','3','370600','CN',NULL,'1'),
 ('370602','山东省烟台市芝罘区','山东省烟台市芝罘区','3','370600','CN',NULL,'1'),
 ('370611','山东省烟台市福山区','山东省烟台市福山区','3','370600','CN',NULL,'1'),
 ('370612','山东省烟台市牟平区','山东省烟台市牟平区','3','370600','CN',NULL,'1'),
 ('370613','山东省烟台市莱山区','山东省烟台市莱山区','3','370600','CN',NULL,'1'),
 ('370634','山东省烟台市长岛县','山东省烟台市长岛县','3','370600','CN',NULL,'1'),
 ('370681','山东省烟台市龙口市','山东省烟台市龙口市','3','370600','CN',NULL,'1'),
 ('370682','山东省烟台市莱阳市','山东省烟台市莱阳市','3','370600','CN',NULL,'1'),
 ('370683','山东省烟台市莱州市','山东省烟台市莱州市','3','370600','CN',NULL,'1'),
 ('370684','山东省烟台市蓬莱市','山东省烟台市蓬莱市','3','370600','CN',NULL,'1'),
 ('370685','山东省烟台市招远市','山东省烟台市招远市','3','370600','CN',NULL,'1'),
 ('370686','山东省烟台市栖霞市','山东省烟台市栖霞市','3','370600','CN',NULL,'1'),
 ('370687','山东省烟台市海阳市','山东省烟台市海阳市','3','370600','CN',NULL,'1'),
 ('370700','山东省潍坊市','山东省潍坊市','2','370000','CN',NULL,'1'),
 ('370701','山东省潍坊市市辖区','山东省潍坊市市辖区','3','370700','CN',NULL,'1'),
 ('370702','山东省潍坊市潍城区','山东省潍坊市潍城区','3','370700','CN',NULL,'1'),
 ('370703','山东省潍坊市寒亭区','山东省潍坊市寒亭区','3','370700','CN',NULL,'1'),
 ('370704','山东省潍坊市坊子区','山东省潍坊市坊子区','3','370700','CN',NULL,'1'),
 ('370705','山东省潍坊市奎文区','山东省潍坊市奎文区','3','370700','CN',NULL,'1'),
 ('370724','山东省潍坊市临朐县','山东省潍坊市临朐县','3','370700','CN',NULL,'1'),
 ('370725','山东省潍坊市昌乐县','山东省潍坊市昌乐县','3','370700','CN',NULL,'1'),
 ('370781','山东省潍坊市青州市','山东省潍坊市青州市','3','370700','CN',NULL,'1'),
 ('370782','山东省潍坊市诸城市','山东省潍坊市诸城市','3','370700','CN',NULL,'1'),
 ('370783','山东省潍坊市寿光市','山东省潍坊市寿光市','3','370700','CN',NULL,'1'),
 ('370784','山东省潍坊市安丘市','山东省潍坊市安丘市','3','370700','CN',NULL,'1'),
 ('370785','山东省潍坊市高密市','山东省潍坊市高密市','3','370700','CN',NULL,'1'),
 ('370786','山东省潍坊市昌邑市','山东省潍坊市昌邑市','3','370700','CN',NULL,'1'),
 ('370800','山东省济宁市','山东省济宁市','2','370000','CN',NULL,'1'),
 ('370801','山东省济宁市市辖区','山东省济宁市市辖区','3','370800','CN',NULL,'1'),
 ('370802','山东省济宁市市中区','山东省济宁市市中区','3','370800','CN',NULL,'1'),
 ('370811','山东省济宁市任城区','山东省济宁市任城区','3','370800','CN',NULL,'1'),
 ('370826','山东省济宁市微山县','山东省济宁市微山县','3','370800','CN',NULL,'1'),
 ('370827','山东省济宁市鱼台县','山东省济宁市鱼台县','3','370800','CN',NULL,'1'),
 ('370828','山东省济宁市金乡县','山东省济宁市金乡县','3','370800','CN',NULL,'1'),
 ('370829','山东省济宁市嘉祥县','山东省济宁市嘉祥县','3','370800','CN',NULL,'1'),
 ('370830','山东省济宁市汶上县','山东省济宁市汶上县','3','370800','CN',NULL,'1'),
 ('370831','山东省济宁市泗水县','山东省济宁市泗水县','3','370800','CN',NULL,'1'),
 ('370832','山东省济宁市梁山县','山东省济宁市梁山县','3','370800','CN',NULL,'1'),
 ('370881','山东省济宁市曲阜市','山东省济宁市曲阜市','3','370800','CN',NULL,'1'),
 ('370882','山东省济宁市兖州市','山东省济宁市兖州市','3','370800','CN',NULL,'1'),
 ('370883','山东省济宁市邹城市','山东省济宁市邹城市','3','370800','CN',NULL,'1'),
 ('370900','山东省泰安市','山东省泰安市','2','370000','CN',NULL,'1'),
 ('370901','山东省泰安市市辖区','山东省泰安市市辖区','3','370900','CN',NULL,'1'),
 ('370902','山东省泰安市泰山区','山东省泰安市泰山区','3','370900','CN',NULL,'1'),
 ('370903','山东省泰安市岱岳区','山东省泰安市岱岳区','3','370900','CN',NULL,'1'),
 ('370921','山东省泰安市宁阳县','山东省泰安市宁阳县','3','370900','CN',NULL,'1'),
 ('370923','山东省泰安市东平县','山东省泰安市东平县','3','370900','CN',NULL,'1'),
 ('370982','山东省泰安市新泰市','山东省泰安市新泰市','3','370900','CN',NULL,'1'),
 ('370983','山东省泰安市肥城市','山东省泰安市肥城市','3','370900','CN',NULL,'1'),
 ('371000','山东省威海市','山东省威海市','2','370000','CN',NULL,'1'),
 ('371001','山东省威海市市辖区','山东省威海市市辖区','3','371000','CN',NULL,'1'),
 ('371002','山东省威海市环翠区','山东省威海市环翠区','3','371000','CN',NULL,'1'),
 ('371081','山东省威海市文登市','山东省威海市文登市','3','371000','CN',NULL,'1'),
 ('371082','山东省威海市荣成市','山东省威海市荣成市','3','371000','CN',NULL,'1'),
 ('371083','山东省威海市乳山市','山东省威海市乳山市','3','371000','CN',NULL,'1'),
 ('371100','山东省日照市','山东省日照市','2','370000','CN',NULL,'1'),
 ('371101','山东省日照市市辖区','山东省日照市市辖区','3','371100','CN',NULL,'1'),
 ('371102','山东省日照市东港区','山东省日照市东港区','3','371100','CN',NULL,'1'),
 ('371103','山东省日照市岚山区','山东省日照市岚山区','3','371100','CN',NULL,'1'),
 ('371121','山东省日照市五莲县','山东省日照市五莲县','3','371100','CN',NULL,'1'),
 ('371122','山东省日照市莒县','山东省日照市莒县','3','371100','CN',NULL,'1'),
 ('371200','山东省莱芜市','山东省莱芜市','2','370000','CN',NULL,'1'),
 ('371201','山东省莱芜市市辖区','山东省莱芜市市辖区','3','371200','CN',NULL,'1'),
 ('371202','山东省莱芜市莱城区','山东省莱芜市莱城区','3','371200','CN',NULL,'1'),
 ('371203','山东省莱芜市钢城区','山东省莱芜市钢城区','3','371200','CN',NULL,'1'),
 ('371300','山东省临沂市','山东省临沂市','2','370000','CN',NULL,'1'),
 ('371301','山东省临沂市市辖区','山东省临沂市市辖区','3','371300','CN',NULL,'1'),
 ('371302','山东省临沂市兰山区','山东省临沂市兰山区','3','371300','CN',NULL,'1'),
 ('371311','山东省临沂市罗庄区','山东省临沂市罗庄区','3','371300','CN',NULL,'1'),
 ('371312','山东省临沂市河东区','山东省临沂市河东区','3','371300','CN',NULL,'1'),
 ('371321','山东省临沂市沂南县','山东省临沂市沂南县','3','371300','CN',NULL,'1'),
 ('371322','山东省临沂市郯城县','山东省临沂市郯城县','3','371300','CN',NULL,'1'),
 ('371323','山东省临沂市沂水县','山东省临沂市沂水县','3','371300','CN',NULL,'1'),
 ('371324','山东省临沂市苍山县','山东省临沂市苍山县','3','371300','CN',NULL,'1'),
 ('371325','山东省临沂市费县','山东省临沂市费县','3','371300','CN',NULL,'1'),
 ('371326','山东省临沂市平邑县','山东省临沂市平邑县','3','371300','CN',NULL,'1'),
 ('371327','山东省临沂市莒南县','山东省临沂市莒南县','3','371300','CN',NULL,'1'),
 ('371328','山东省临沂市蒙阴县','山东省临沂市蒙阴县','3','371300','CN',NULL,'1'),
 ('371329','山东省临沂市临沭县','山东省临沂市临沭县','3','371300','CN',NULL,'1'),
 ('371400','山东省德州市','山东省德州市','2','370000','CN',NULL,'1'),
 ('371401','山东省德州市市辖区','山东省德州市市辖区','3','371400','CN',NULL,'1'),
 ('371402','山东省德州市德城区','山东省德州市德城区','3','371400','CN',NULL,'1'),
 ('371421','山东省德州市陵县','山东省德州市陵县','3','371400','CN',NULL,'1'),
 ('371422','山东省德州市宁津县','山东省德州市宁津县','3','371400','CN',NULL,'1'),
 ('371423','山东省德州市庆云县','山东省德州市庆云县','3','371400','CN',NULL,'1'),
 ('371424','山东省德州市临邑县','山东省德州市临邑县','3','371400','CN',NULL,'1'),
 ('371425','山东省德州市齐河县','山东省德州市齐河县','3','371400','CN',NULL,'1'),
 ('371426','山东省德州市平原县','山东省德州市平原县','3','371400','CN',NULL,'1'),
 ('371427','山东省德州市夏津县','山东省德州市夏津县','3','371400','CN',NULL,'1'),
 ('371428','山东省德州市武城县','山东省德州市武城县','3','371400','CN',NULL,'1'),
 ('371481','山东省德州市乐陵市','山东省德州市乐陵市','3','371400','CN',NULL,'1'),
 ('371482','山东省德州市禹城市','山东省德州市禹城市','3','371400','CN',NULL,'1'),
 ('371500','山东省聊城市','山东省聊城市','2','370000','CN',NULL,'1'),
 ('371501','山东省聊城市市辖区','山东省聊城市市辖区','3','371500','CN',NULL,'1'),
 ('371502','山东省聊城市东昌府区','山东省聊城市东昌府区','3','371500','CN',NULL,'1'),
 ('371521','山东省聊城市阳谷县','山东省聊城市阳谷县','3','371500','CN',NULL,'1'),
 ('371522','山东省聊城市莘县','山东省聊城市莘县','3','371500','CN',NULL,'1'),
 ('371523','山东省聊城市茌平县','山东省聊城市茌平县','3','371500','CN',NULL,'1'),
 ('371524','山东省聊城市东阿县','山东省聊城市东阿县','3','371500','CN',NULL,'1'),
 ('371525','山东省聊城市冠县','山东省聊城市冠县','3','371500','CN',NULL,'1'),
 ('371526','山东省聊城市高唐县','山东省聊城市高唐县','3','371500','CN',NULL,'1'),
 ('371581','山东省聊城市临清市','山东省聊城市临清市','3','371500','CN',NULL,'1'),
 ('371600','山东省滨州市','山东省滨州市','2','370000','CN',NULL,'1'),
 ('371601','山东省滨州市市辖区','山东省滨州市市辖区','3','371600','CN',NULL,'1'),
 ('371602','山东省滨州市滨城区','山东省滨州市滨城区','3','371600','CN',NULL,'1'),
 ('371621','山东省滨州市惠民县','山东省滨州市惠民县','3','371600','CN',NULL,'1'),
 ('371622','山东省滨州市阳信县','山东省滨州市阳信县','3','371600','CN',NULL,'1'),
 ('371623','山东省滨州市无棣县','山东省滨州市无棣县','3','371600','CN',NULL,'1'),
 ('371624','山东省滨州市沾化县','山东省滨州市沾化县','3','371600','CN',NULL,'1'),
 ('371625','山东省滨州市博兴县','山东省滨州市博兴县','3','371600','CN',NULL,'1'),
 ('371626','山东省滨州市邹平县','山东省滨州市邹平县','3','371600','CN',NULL,'1'),
 ('371700','山东省荷泽市','山东省荷泽市','2','370000','CN',NULL,'1'),
 ('371701','山东省荷泽市市辖区','山东省荷泽市市辖区','3','371700','CN',NULL,'1'),
 ('371702','山东省荷泽市牡丹区','山东省荷泽市牡丹区','3','371700','CN',NULL,'1'),
 ('371721','山东省荷泽市曹县','山东省荷泽市曹县','3','371700','CN',NULL,'1'),
 ('371722','山东省荷泽市单县','山东省荷泽市单县','3','371700','CN',NULL,'1'),
 ('371723','山东省荷泽市成武县','山东省荷泽市成武县','3','371700','CN',NULL,'1'),
 ('371724','山东省荷泽市巨野县','山东省荷泽市巨野县','3','371700','CN',NULL,'1'),
 ('371725','山东省荷泽市郓城县','山东省荷泽市郓城县','3','371700','CN',NULL,'1'),
 ('371726','山东省荷泽市鄄城县','山东省荷泽市鄄城县','3','371700','CN',NULL,'1'),
 ('371727','山东省荷泽市定陶县','山东省荷泽市定陶县','3','371700','CN',NULL,'1'),
 ('371728','山东省荷泽市东明县','山东省荷泽市东明县','3','371700','CN',NULL,'1'),
 ('410000','河南省','河南省','1','CN','CN',NULL,'1'),
 ('410100','河南省郑州市','河南省郑州市','2','410000','CN',NULL,'1'),
 ('410101','河南省郑州市市辖区','河南省郑州市市辖区','3','410100','CN',NULL,'1'),
 ('410102','河南省郑州市中原区','河南省郑州市中原区','3','410100','CN',NULL,'1'),
 ('410103','河南省郑州市二七区','河南省郑州市二七区','3','410100','CN',NULL,'1'),
 ('410104','河南省郑州市管城回族区','河南省郑州市管城回族区','3','410100','CN',NULL,'1'),
 ('410105','河南省郑州市金水区','河南省郑州市金水区','3','410100','CN',NULL,'1'),
 ('410106','河南省郑州市上街区','河南省郑州市上街区','3','410100','CN',NULL,'1'),
 ('410108','河南省郑州市惠济区','河南省郑州市惠济区','3','410100','CN',NULL,'1'),
 ('410122','河南省郑州市中牟县','河南省郑州市中牟县','3','410100','CN',NULL,'1'),
 ('410181','河南省郑州市巩义市','河南省郑州市巩义市','3','410100','CN',NULL,'1'),
 ('410182','河南省郑州市荥阳市','河南省郑州市荥阳市','3','410100','CN',NULL,'1'),
 ('410183','河南省郑州市新密市','河南省郑州市新密市','3','410100','CN',NULL,'1'),
 ('410184','河南省郑州市新郑市','河南省郑州市新郑市','3','410100','CN',NULL,'1'),
 ('410185','河南省郑州市登封市','河南省郑州市登封市','3','410100','CN',NULL,'1'),
 ('410200','河南省开封市','河南省开封市','2','410000','CN',NULL,'1'),
 ('410201','河南省开封市市辖区','河南省开封市市辖区','3','410200','CN',NULL,'1'),
 ('410202','河南省开封市龙亭区','河南省开封市龙亭区','3','410200','CN',NULL,'1'),
 ('410203','河南省开封市顺河回族区','河南省开封市顺河回族区','3','410200','CN',NULL,'1'),
 ('410204','河南省开封市鼓楼区','河南省开封市鼓楼区','3','410200','CN',NULL,'1'),
 ('410205','河南省开封市禹王台区','河南省开封市禹王台区','3','410200','CN',NULL,'1'),
 ('410211','河南省开封市金明区','河南省开封市金明区','3','410200','CN',NULL,'1'),
 ('410221','河南省开封市杞县','河南省开封市杞县','3','410200','CN',NULL,'1'),
 ('410222','河南省开封市通许县','河南省开封市通许县','3','410200','CN',NULL,'1'),
 ('410223','河南省开封市尉氏县','河南省开封市尉氏县','3','410200','CN',NULL,'1'),
 ('410224','河南省开封市开封县','河南省开封市开封县','3','410200','CN',NULL,'1'),
 ('410225','河南省开封市兰考县','河南省开封市兰考县','3','410200','CN',NULL,'1'),
 ('410300','河南省洛阳市','河南省洛阳市','2','410000','CN',NULL,'1'),
 ('410301','河南省洛阳市市辖区','河南省洛阳市市辖区','3','410300','CN',NULL,'1'),
 ('410302','河南省洛阳市老城区','河南省洛阳市老城区','3','410300','CN',NULL,'1'),
 ('410303','河南省洛阳市西工区','河南省洛阳市西工区','3','410300','CN',NULL,'1'),
 ('410304','河南省洛阳市廛河回族区','河南省洛阳市廛河回族区','3','410300','CN',NULL,'1'),
 ('410305','河南省洛阳市涧西区','河南省洛阳市涧西区','3','410300','CN',NULL,'1'),
 ('410306','河南省洛阳市吉利区','河南省洛阳市吉利区','3','410300','CN',NULL,'1'),
 ('410307','河南省洛阳市洛龙区','河南省洛阳市洛龙区','3','410300','CN',NULL,'1'),
 ('410322','河南省洛阳市孟津县','河南省洛阳市孟津县','3','410300','CN',NULL,'1'),
 ('410323','河南省洛阳市新安县','河南省洛阳市新安县','3','410300','CN',NULL,'1'),
 ('410324','河南省洛阳市栾川县','河南省洛阳市栾川县','3','410300','CN',NULL,'1'),
 ('410325','河南省洛阳市嵩县','河南省洛阳市嵩县','3','410300','CN',NULL,'1'),
 ('410326','河南省洛阳市汝阳县','河南省洛阳市汝阳县','3','410300','CN',NULL,'1'),
 ('410327','河南省洛阳市宜阳县','河南省洛阳市宜阳县','3','410300','CN',NULL,'1'),
 ('410328','河南省洛阳市洛宁县','河南省洛阳市洛宁县','3','410300','CN',NULL,'1'),
 ('410329','河南省洛阳市伊川县','河南省洛阳市伊川县','3','410300','CN',NULL,'1'),
 ('410381','河南省洛阳市偃师市','河南省洛阳市偃师市','3','410300','CN',NULL,'1'),
 ('410400','河南省平顶山市','河南省平顶山市','2','410000','CN',NULL,'1'),
 ('410401','河南省平顶山市市辖区','河南省平顶山市市辖区','3','410400','CN',NULL,'1'),
 ('410402','河南省平顶山市新华区','河南省平顶山市新华区','3','410400','CN',NULL,'1'),
 ('410403','河南省平顶山市卫东区','河南省平顶山市卫东区','3','410400','CN',NULL,'1'),
 ('410404','河南省平顶山市石龙区','河南省平顶山市石龙区','3','410400','CN',NULL,'1'),
 ('410411','河南省平顶山市湛河区','河南省平顶山市湛河区','3','410400','CN',NULL,'1'),
 ('410421','河南省平顶山市宝丰县','河南省平顶山市宝丰县','3','410400','CN',NULL,'1'),
 ('410422','河南省平顶山市叶县','河南省平顶山市叶县','3','410400','CN',NULL,'1'),
 ('410423','河南省平顶山市鲁山县','河南省平顶山市鲁山县','3','410400','CN',NULL,'1'),
 ('410425','河南省平顶山市郏县','河南省平顶山市郏县','3','410400','CN',NULL,'1'),
 ('410481','河南省平顶山市舞钢市','河南省平顶山市舞钢市','3','410400','CN',NULL,'1'),
 ('410482','河南省平顶山市汝州市','河南省平顶山市汝州市','3','410400','CN',NULL,'1'),
 ('410500','河南省安阳市','河南省安阳市','2','410000','CN',NULL,'1'),
 ('410501','河南省安阳市市辖区','河南省安阳市市辖区','3','410500','CN',NULL,'1'),
 ('410502','河南省安阳市文峰区','河南省安阳市文峰区','3','410500','CN',NULL,'1'),
 ('410503','河南省安阳市北关区','河南省安阳市北关区','3','410500','CN',NULL,'1'),
 ('410505','河南省安阳市殷都区','河南省安阳市殷都区','3','410500','CN',NULL,'1'),
 ('410506','河南省安阳市龙安区','河南省安阳市龙安区','3','410500','CN',NULL,'1'),
 ('410522','河南省安阳市安阳县','河南省安阳市安阳县','3','410500','CN',NULL,'1'),
 ('410523','河南省安阳市汤阴县','河南省安阳市汤阴县','3','410500','CN',NULL,'1'),
 ('410526','河南省安阳市滑县','河南省安阳市滑县','3','410500','CN',NULL,'1'),
 ('410527','河南省安阳市内黄县','河南省安阳市内黄县','3','410500','CN',NULL,'1'),
 ('410581','河南省安阳市林州市','河南省安阳市林州市','3','410500','CN',NULL,'1'),
 ('410600','河南省鹤壁市','河南省鹤壁市','2','410000','CN',NULL,'1'),
 ('410601','河南省鹤壁市市辖区','河南省鹤壁市市辖区','3','410600','CN',NULL,'1'),
 ('410602','河南省鹤壁市鹤山区','河南省鹤壁市鹤山区','3','410600','CN',NULL,'1'),
 ('410603','河南省鹤壁市山城区','河南省鹤壁市山城区','3','410600','CN',NULL,'1'),
 ('410611','河南省鹤壁市淇滨区','河南省鹤壁市淇滨区','3','410600','CN',NULL,'1'),
 ('410621','河南省鹤壁市浚县','河南省鹤壁市浚县','3','410600','CN',NULL,'1'),
 ('410622','河南省鹤壁市淇县','河南省鹤壁市淇县','3','410600','CN',NULL,'1'),
 ('410700','河南省新乡市','河南省新乡市','2','410000','CN',NULL,'1'),
 ('410701','河南省新乡市市辖区','河南省新乡市市辖区','3','410700','CN',NULL,'1'),
 ('410702','河南省新乡市红旗区','河南省新乡市红旗区','3','410700','CN',NULL,'1'),
 ('410703','河南省新乡市卫滨区','河南省新乡市卫滨区','3','410700','CN',NULL,'1'),
 ('410704','河南省新乡市凤泉区','河南省新乡市凤泉区','3','410700','CN',NULL,'1'),
 ('410711','河南省新乡市牧野区','河南省新乡市牧野区','3','410700','CN',NULL,'1'),
 ('410721','河南省新乡市新乡县','河南省新乡市新乡县','3','410700','CN',NULL,'1'),
 ('410724','河南省新乡市获嘉县','河南省新乡市获嘉县','3','410700','CN',NULL,'1'),
 ('410725','河南省新乡市原阳县','河南省新乡市原阳县','3','410700','CN',NULL,'1'),
 ('410726','河南省新乡市延津县','河南省新乡市延津县','3','410700','CN',NULL,'1'),
 ('410727','河南省新乡市封丘县','河南省新乡市封丘县','3','410700','CN',NULL,'1'),
 ('410728','河南省新乡市长垣县','河南省新乡市长垣县','3','410700','CN',NULL,'1'),
 ('410781','河南省新乡市卫辉市','河南省新乡市卫辉市','3','410700','CN',NULL,'1'),
 ('410782','河南省新乡市辉县市','河南省新乡市辉县市','3','410700','CN',NULL,'1'),
 ('410800','河南省焦作市','河南省焦作市','2','410000','CN',NULL,'1'),
 ('410801','河南省焦作市市辖区','河南省焦作市市辖区','3','410800','CN',NULL,'1'),
 ('410802','河南省焦作市解放区','河南省焦作市解放区','3','410800','CN',NULL,'1'),
 ('410803','河南省焦作市中站区','河南省焦作市中站区','3','410800','CN',NULL,'1'),
 ('410804','河南省焦作市马村区','河南省焦作市马村区','3','410800','CN',NULL,'1'),
 ('410811','河南省焦作市山阳区','河南省焦作市山阳区','3','410800','CN',NULL,'1'),
 ('410821','河南省焦作市修武县','河南省焦作市修武县','3','410800','CN',NULL,'1'),
 ('410822','河南省焦作市博爱县','河南省焦作市博爱县','3','410800','CN',NULL,'1'),
 ('410823','河南省焦作市武陟县','河南省焦作市武陟县','3','410800','CN',NULL,'1'),
 ('410825','河南省焦作市温县','河南省焦作市温县','3','410800','CN',NULL,'1'),
 ('410881','河南省焦作市济源市','河南省焦作市济源市','3','410800','CN',NULL,'1'),
 ('410882','河南省焦作市沁阳市','河南省焦作市沁阳市','3','410800','CN',NULL,'1'),
 ('410883','河南省焦作市孟州市','河南省焦作市孟州市','3','410800','CN',NULL,'1'),
 ('410900','河南省濮阳市','河南省濮阳市','2','410000','CN',NULL,'1'),
 ('410901','河南省濮阳市市辖区','河南省濮阳市市辖区','3','410900','CN',NULL,'1'),
 ('410902','河南省濮阳市华龙区','河南省濮阳市华龙区','3','410900','CN',NULL,'1'),
 ('410922','河南省濮阳市清丰县','河南省濮阳市清丰县','3','410900','CN',NULL,'1'),
 ('410923','河南省濮阳市南乐县','河南省濮阳市南乐县','3','410900','CN',NULL,'1'),
 ('410926','河南省濮阳市范县','河南省濮阳市范县','3','410900','CN',NULL,'1'),
 ('410927','河南省濮阳市台前县','河南省濮阳市台前县','3','410900','CN',NULL,'1'),
 ('410928','河南省濮阳市濮阳县','河南省濮阳市濮阳县','3','410900','CN',NULL,'1'),
 ('411000','河南省许昌市','河南省许昌市','2','410000','CN',NULL,'1'),
 ('411001','河南省许昌市市辖区','河南省许昌市市辖区','3','411000','CN',NULL,'1'),
 ('411002','河南省许昌市魏都区','河南省许昌市魏都区','3','411000','CN',NULL,'1'),
 ('411023','河南省许昌市许昌县','河南省许昌市许昌县','3','411000','CN',NULL,'1'),
 ('411024','河南省许昌市鄢陵县','河南省许昌市鄢陵县','3','411000','CN',NULL,'1'),
 ('411025','河南省许昌市襄城县','河南省许昌市襄城县','3','411000','CN',NULL,'1'),
 ('411081','河南省许昌市禹州市','河南省许昌市禹州市','3','411000','CN',NULL,'1'),
 ('411082','河南省许昌市长葛市','河南省许昌市长葛市','3','411000','CN',NULL,'1'),
 ('411100','河南省漯河市','河南省漯河市','2','410000','CN',NULL,'1'),
 ('411101','河南省漯河市市辖区','河南省漯河市市辖区','3','411100','CN',NULL,'1'),
 ('411102','河南省漯河市源汇区','河南省漯河市源汇区','3','411100','CN',NULL,'1'),
 ('411103','河南省漯河市郾城区','河南省漯河市郾城区','3','411100','CN',NULL,'1'),
 ('411104','河南省漯河市召陵区','河南省漯河市召陵区','3','411100','CN',NULL,'1'),
 ('411121','河南省漯河市舞阳县','河南省漯河市舞阳县','3','411100','CN',NULL,'1'),
 ('411122','河南省漯河市临颍县','河南省漯河市临颍县','3','411100','CN',NULL,'1'),
 ('411200','河南省三门峡市','河南省三门峡市','2','410000','CN',NULL,'1'),
 ('411201','河南省三门峡市市辖区','河南省三门峡市市辖区','3','411200','CN',NULL,'1'),
 ('411202','河南省三门峡市湖滨区','河南省三门峡市湖滨区','3','411200','CN',NULL,'1'),
 ('411221','河南省三门峡市渑池县','河南省三门峡市渑池县','3','411200','CN',NULL,'1'),
 ('411222','河南省三门峡市陕县','河南省三门峡市陕县','3','411200','CN',NULL,'1'),
 ('411224','河南省三门峡市卢氏县','河南省三门峡市卢氏县','3','411200','CN',NULL,'1'),
 ('411281','河南省三门峡市义马市','河南省三门峡市义马市','3','411200','CN',NULL,'1'),
 ('411282','河南省三门峡市灵宝市','河南省三门峡市灵宝市','3','411200','CN',NULL,'1'),
 ('411300','河南省南阳市','河南省南阳市','2','410000','CN',NULL,'1'),
 ('411301','河南省南阳市市辖区','河南省南阳市市辖区','3','411300','CN',NULL,'1'),
 ('411302','河南省南阳市宛城区','河南省南阳市宛城区','3','411300','CN',NULL,'1'),
 ('411303','河南省南阳市卧龙区','河南省南阳市卧龙区','3','411300','CN',NULL,'1'),
 ('411321','河南省南阳市南召县','河南省南阳市南召县','3','411300','CN',NULL,'1'),
 ('411322','河南省南阳市方城县','河南省南阳市方城县','3','411300','CN',NULL,'1'),
 ('411323','河南省南阳市西峡县','河南省南阳市西峡县','3','411300','CN',NULL,'1'),
 ('411324','河南省南阳市镇平县','河南省南阳市镇平县','3','411300','CN',NULL,'1'),
 ('411325','河南省南阳市内乡县','河南省南阳市内乡县','3','411300','CN',NULL,'1'),
 ('411326','河南省南阳市淅川县','河南省南阳市淅川县','3','411300','CN',NULL,'1'),
 ('411327','河南省南阳市社旗县','河南省南阳市社旗县','3','411300','CN',NULL,'1'),
 ('411328','河南省南阳市唐河县','河南省南阳市唐河县','3','411300','CN',NULL,'1'),
 ('411329','河南省南阳市新野县','河南省南阳市新野县','3','411300','CN',NULL,'1'),
 ('411330','河南省南阳市桐柏县','河南省南阳市桐柏县','3','411300','CN',NULL,'1'),
 ('411381','河南省南阳市邓州市','河南省南阳市邓州市','3','411300','CN',NULL,'1'),
 ('411400','河南省商丘市','河南省商丘市','2','410000','CN',NULL,'1'),
 ('411401','河南省商丘市市辖区','河南省商丘市市辖区','3','411400','CN',NULL,'1'),
 ('411402','河南省商丘市梁园区','河南省商丘市梁园区','3','411400','CN',NULL,'1'),
 ('411403','河南省商丘市睢阳区','河南省商丘市睢阳区','3','411400','CN',NULL,'1'),
 ('411421','河南省商丘市民权县','河南省商丘市民权县','3','411400','CN',NULL,'1'),
 ('411422','河南省商丘市睢县','河南省商丘市睢县','3','411400','CN',NULL,'1'),
 ('411423','河南省商丘市宁陵县','河南省商丘市宁陵县','3','411400','CN',NULL,'1'),
 ('411424','河南省商丘市柘城县','河南省商丘市柘城县','3','411400','CN',NULL,'1'),
 ('411425','河南省商丘市虞城县','河南省商丘市虞城县','3','411400','CN',NULL,'1'),
 ('411426','河南省商丘市夏邑县','河南省商丘市夏邑县','3','411400','CN',NULL,'1'),
 ('411481','河南省商丘市永城市','河南省商丘市永城市','3','411400','CN',NULL,'1'),
 ('411500','河南省信阳市','河南省信阳市','2','410000','CN',NULL,'1'),
 ('411501','河南省信阳市市辖区','河南省信阳市市辖区','3','411500','CN',NULL,'1'),
 ('411502','河南省信阳市浉河区','河南省信阳市浉河区','3','411500','CN',NULL,'1'),
 ('411503','河南省信阳市平桥区','河南省信阳市平桥区','3','411500','CN',NULL,'1'),
 ('411521','河南省信阳市罗山县','河南省信阳市罗山县','3','411500','CN',NULL,'1'),
 ('411522','河南省信阳市光山县','河南省信阳市光山县','3','411500','CN',NULL,'1'),
 ('411523','河南省信阳市新县','河南省信阳市新县','3','411500','CN',NULL,'1'),
 ('411524','河南省信阳市商城县','河南省信阳市商城县','3','411500','CN',NULL,'1'),
 ('411525','河南省信阳市固始县','河南省信阳市固始县','3','411500','CN',NULL,'1'),
 ('411526','河南省信阳市潢川县','河南省信阳市潢川县','3','411500','CN',NULL,'1'),
 ('411527','河南省信阳市淮滨县','河南省信阳市淮滨县','3','411500','CN',NULL,'1'),
 ('411528','河南省信阳市息县','河南省信阳市息县','3','411500','CN',NULL,'1'),
 ('411600','河南省周口市','河南省周口市','2','410000','CN',NULL,'1'),
 ('411601','河南省周口市市辖区','河南省周口市市辖区','3','411600','CN',NULL,'1'),
 ('411602','河南省周口市川汇区','河南省周口市川汇区','3','411600','CN',NULL,'1'),
 ('411621','河南省周口市扶沟县','河南省周口市扶沟县','3','411600','CN',NULL,'1'),
 ('411622','河南省周口市西华县','河南省周口市西华县','3','411600','CN',NULL,'1'),
 ('411623','河南省周口市商水县','河南省周口市商水县','3','411600','CN',NULL,'1'),
 ('411624','河南省周口市沈丘县','河南省周口市沈丘县','3','411600','CN',NULL,'1'),
 ('411625','河南省周口市郸城县','河南省周口市郸城县','3','411600','CN',NULL,'1'),
 ('411626','河南省周口市淮阳县','河南省周口市淮阳县','3','411600','CN',NULL,'1'),
 ('411627','河南省周口市太康县','河南省周口市太康县','3','411600','CN',NULL,'1'),
 ('411628','河南省周口市鹿邑县','河南省周口市鹿邑县','3','411600','CN',NULL,'1'),
 ('411681','河南省周口市项城市','河南省周口市项城市','3','411600','CN',NULL,'1'),
 ('411700','河南省驻马店市','河南省驻马店市','2','410000','CN',NULL,'1'),
 ('411701','河南省驻马店市市辖区','河南省驻马店市市辖区','3','411700','CN',NULL,'1'),
 ('411702','河南省驻马店市驿城区','河南省驻马店市驿城区','3','411700','CN',NULL,'1'),
 ('411721','河南省驻马店市西平县','河南省驻马店市西平县','3','411700','CN',NULL,'1'),
 ('411722','河南省驻马店市上蔡县','河南省驻马店市上蔡县','3','411700','CN',NULL,'1'),
 ('411723','河南省驻马店市平舆县','河南省驻马店市平舆县','3','411700','CN',NULL,'1'),
 ('411724','河南省驻马店市正阳县','河南省驻马店市正阳县','3','411700','CN',NULL,'1'),
 ('411725','河南省驻马店市确山县','河南省驻马店市确山县','3','411700','CN',NULL,'1'),
 ('411726','河南省驻马店市泌阳县','河南省驻马店市泌阳县','3','411700','CN',NULL,'1'),
 ('411727','河南省驻马店市汝南县','河南省驻马店市汝南县','3','411700','CN',NULL,'1'),
 ('411728','河南省驻马店市遂平县','河南省驻马店市遂平县','3','411700','CN',NULL,'1'),
 ('411729','河南省驻马店市新蔡县','河南省驻马店市新蔡县','3','411700','CN',NULL,'1'),
 ('420000','湖北省','湖北省','1','CN','CN',NULL,'1'),
 ('420100','湖北省武汉市','湖北省武汉市','2','420000','CN',NULL,'1'),
 ('420101','湖北省武汉市市辖区','湖北省武汉市市辖区','3','420100','CN',NULL,'1'),
 ('420102','湖北省武汉市江岸区','湖北省武汉市江岸区','3','420100','CN',NULL,'1'),
 ('420103','湖北省武汉市江汉区','湖北省武汉市江汉区','3','420100','CN',NULL,'1'),
 ('420104','湖北省武汉市硚口区','湖北省武汉市硚口区','3','420100','CN',NULL,'1'),
 ('420105','湖北省武汉市汉阳区','湖北省武汉市汉阳区','3','420100','CN',NULL,'1'),
 ('420106','湖北省武汉市武昌区','湖北省武汉市武昌区','3','420100','CN',NULL,'1'),
 ('420107','湖北省武汉市青山区','湖北省武汉市青山区','3','420100','CN',NULL,'1'),
 ('420111','湖北省武汉市洪山区','湖北省武汉市洪山区','3','420100','CN',NULL,'1'),
 ('420112','湖北省武汉市东西湖区','湖北省武汉市东西湖区','3','420100','CN',NULL,'1'),
 ('420113','湖北省武汉市汉南区','湖北省武汉市汉南区','3','420100','CN',NULL,'1'),
 ('420114','湖北省武汉市蔡甸区','湖北省武汉市蔡甸区','3','420100','CN',NULL,'1'),
 ('420115','湖北省武汉市江夏区','湖北省武汉市江夏区','3','420100','CN',NULL,'1'),
 ('420116','湖北省武汉市黄陂区','湖北省武汉市黄陂区','3','420100','CN',NULL,'1'),
 ('420117','湖北省武汉市新洲区','湖北省武汉市新洲区','3','420100','CN',NULL,'1'),
 ('420200','湖北省黄石市','湖北省黄石市','2','420000','CN',NULL,'1'),
 ('420201','湖北省黄石市市辖区','湖北省黄石市市辖区','3','420200','CN',NULL,'1'),
 ('420202','湖北省黄石市黄石港区','湖北省黄石市黄石港区','3','420200','CN',NULL,'1'),
 ('420203','湖北省黄石市西塞山区','湖北省黄石市西塞山区','3','420200','CN',NULL,'1'),
 ('420204','湖北省黄石市下陆区','湖北省黄石市下陆区','3','420200','CN',NULL,'1');
INSERT INTO `pub_cant` (`CANT_CODE`,`CANT_NAME`,`SHORT_NAME`,`CANT_TYPE`,`SUPER_CODE`,`COUNTRY_CODE`,`CANT_NOTE`,`IN_USE`) VALUES 
 ('420205','湖北省黄石市铁山区','湖北省黄石市铁山区','3','420200','CN',NULL,'1'),
 ('420222','湖北省黄石市阳新县','湖北省黄石市阳新县','3','420200','CN',NULL,'1'),
 ('420281','湖北省黄石市大冶市','湖北省黄石市大冶市','3','420200','CN',NULL,'1'),
 ('420300','湖北省十堰市','湖北省十堰市','2','420000','CN',NULL,'1'),
 ('420301','湖北省十堰市市辖区','湖北省十堰市市辖区','3','420300','CN',NULL,'1'),
 ('420302','湖北省十堰市茅箭区','湖北省十堰市茅箭区','3','420300','CN',NULL,'1'),
 ('420303','湖北省十堰市张湾区','湖北省十堰市张湾区','3','420300','CN',NULL,'1'),
 ('420321','湖北省十堰市郧县','湖北省十堰市郧县','3','420300','CN',NULL,'1'),
 ('420322','湖北省十堰市郧西县','湖北省十堰市郧西县','3','420300','CN',NULL,'1'),
 ('420323','湖北省十堰市竹山县','湖北省十堰市竹山县','3','420300','CN',NULL,'1'),
 ('420324','湖北省十堰市竹溪县','湖北省十堰市竹溪县','3','420300','CN',NULL,'1'),
 ('420325','湖北省十堰市房县','湖北省十堰市房县','3','420300','CN',NULL,'1'),
 ('420381','湖北省十堰市丹江口市','湖北省十堰市丹江口市','3','420300','CN',NULL,'1'),
 ('420500','湖北省宜昌市','湖北省宜昌市','2','420000','CN',NULL,'1'),
 ('420501','湖北省宜昌市市辖区','湖北省宜昌市市辖区','3','420500','CN',NULL,'1'),
 ('420502','湖北省宜昌市西陵区','湖北省宜昌市西陵区','3','420500','CN',NULL,'1'),
 ('420503','湖北省宜昌市伍家岗区','湖北省宜昌市伍家岗区','3','420500','CN',NULL,'1'),
 ('420504','湖北省宜昌市点军区','湖北省宜昌市点军区','3','420500','CN',NULL,'1'),
 ('420505','湖北省宜昌市猇亭区','湖北省宜昌市猇亭区','3','420500','CN',NULL,'1'),
 ('420506','湖北省宜昌市夷陵区','湖北省宜昌市夷陵区','3','420500','CN',NULL,'1'),
 ('420525','湖北省宜昌市远安县','湖北省宜昌市远安县','3','420500','CN',NULL,'1'),
 ('420526','湖北省宜昌市兴山县','湖北省宜昌市兴山县','3','420500','CN',NULL,'1'),
 ('420527','湖北省宜昌市秭归县','湖北省宜昌市秭归县','3','420500','CN',NULL,'1'),
 ('420528','湖北省宜昌市长阳土家族自治县','湖北省宜昌市长阳土家族自治县','3','420500','CN',NULL,'1'),
 ('420529','湖北省宜昌市五峰土家族自治县','湖北省宜昌市五峰土家族自治县','3','420500','CN',NULL,'1'),
 ('420581','湖北省宜昌市宜都市','湖北省宜昌市宜都市','3','420500','CN',NULL,'1'),
 ('420582','湖北省宜昌市当阳市','湖北省宜昌市当阳市','3','420500','CN',NULL,'1'),
 ('420583','湖北省宜昌市枝江市','湖北省宜昌市枝江市','3','420500','CN',NULL,'1'),
 ('420600','湖北省襄樊市','湖北省襄樊市','2','420000','CN',NULL,'1'),
 ('420601','湖北省襄樊市市辖区','湖北省襄樊市市辖区','3','420600','CN',NULL,'1'),
 ('420602','湖北省襄樊市襄城区','湖北省襄樊市襄城区','3','420600','CN',NULL,'1'),
 ('420606','湖北省襄樊市樊城区','湖北省襄樊市樊城区','3','420600','CN',NULL,'1'),
 ('420607','湖北省襄樊市襄阳区','湖北省襄樊市襄阳区','3','420600','CN',NULL,'1'),
 ('420624','湖北省襄樊市南漳县','湖北省襄樊市南漳县','3','420600','CN',NULL,'1'),
 ('420625','湖北省襄樊市谷城县','湖北省襄樊市谷城县','3','420600','CN',NULL,'1'),
 ('420626','湖北省襄樊市保康县','湖北省襄樊市保康县','3','420600','CN',NULL,'1'),
 ('420682','湖北省襄樊市老河口市','湖北省襄樊市老河口市','3','420600','CN',NULL,'1'),
 ('420683','湖北省襄樊市枣阳市','湖北省襄樊市枣阳市','3','420600','CN',NULL,'1'),
 ('420684','湖北省襄樊市宜城市','湖北省襄樊市宜城市','3','420600','CN',NULL,'1'),
 ('420700','湖北省鄂州市','湖北省鄂州市','2','420000','CN',NULL,'1'),
 ('420701','湖北省鄂州市市辖区','湖北省鄂州市市辖区','3','420700','CN',NULL,'1'),
 ('420702','湖北省鄂州市梁子湖区','湖北省鄂州市梁子湖区','3','420700','CN',NULL,'1'),
 ('420703','湖北省鄂州市华容区','湖北省鄂州市华容区','3','420700','CN',NULL,'1'),
 ('420704','湖北省鄂州市鄂城区','湖北省鄂州市鄂城区','3','420700','CN',NULL,'1'),
 ('420800','湖北省荆门市','湖北省荆门市','2','420000','CN',NULL,'1'),
 ('420801','湖北省荆门市市辖区','湖北省荆门市市辖区','3','420800','CN',NULL,'1'),
 ('420802','湖北省荆门市东宝区','湖北省荆门市东宝区','3','420800','CN',NULL,'1'),
 ('420804','湖北省荆门市掇刀区','湖北省荆门市掇刀区','3','420800','CN',NULL,'1'),
 ('420821','湖北省荆门市京山县','湖北省荆门市京山县','3','420800','CN',NULL,'1'),
 ('420822','湖北省荆门市沙洋县','湖北省荆门市沙洋县','3','420800','CN',NULL,'1'),
 ('420881','湖北省荆门市钟祥市','湖北省荆门市钟祥市','3','420800','CN',NULL,'1'),
 ('420900','湖北省孝感市','湖北省孝感市','2','420000','CN',NULL,'1'),
 ('420901','湖北省孝感市市辖区','湖北省孝感市市辖区','3','420900','CN',NULL,'1'),
 ('420902','湖北省孝感市孝南区','湖北省孝感市孝南区','3','420900','CN',NULL,'1'),
 ('420921','湖北省孝感市孝昌县','湖北省孝感市孝昌县','3','420900','CN',NULL,'1'),
 ('420922','湖北省孝感市大悟县','湖北省孝感市大悟县','3','420900','CN',NULL,'1'),
 ('420923','湖北省孝感市云梦县','湖北省孝感市云梦县','3','420900','CN',NULL,'1'),
 ('420981','湖北省孝感市应城市','湖北省孝感市应城市','3','420900','CN',NULL,'1'),
 ('420982','湖北省孝感市安陆市','湖北省孝感市安陆市','3','420900','CN',NULL,'1'),
 ('420984','湖北省孝感市汉川市','湖北省孝感市汉川市','3','420900','CN',NULL,'1'),
 ('421000','湖北省荆州市','湖北省荆州市','2','420000','CN',NULL,'1'),
 ('421001','湖北省荆州市市辖区','湖北省荆州市市辖区','3','421000','CN',NULL,'1'),
 ('421002','湖北省荆州市沙市区','湖北省荆州市沙市区','3','421000','CN',NULL,'1'),
 ('421003','湖北省荆州市荆州区','湖北省荆州市荆州区','3','421000','CN',NULL,'1'),
 ('421022','湖北省荆州市公安县','湖北省荆州市公安县','3','421000','CN',NULL,'1'),
 ('421023','湖北省荆州市监利县','湖北省荆州市监利县','3','421000','CN',NULL,'1'),
 ('421024','湖北省荆州市江陵县','湖北省荆州市江陵县','3','421000','CN',NULL,'1'),
 ('421081','湖北省荆州市石首市','湖北省荆州市石首市','3','421000','CN',NULL,'1'),
 ('421083','湖北省荆州市洪湖市','湖北省荆州市洪湖市','3','421000','CN',NULL,'1'),
 ('421087','湖北省荆州市松滋市','湖北省荆州市松滋市','3','421000','CN',NULL,'1'),
 ('421100','湖北省黄冈市','湖北省黄冈市','2','420000','CN',NULL,'1'),
 ('421101','湖北省黄冈市市辖区','湖北省黄冈市市辖区','3','421100','CN',NULL,'1'),
 ('421102','湖北省黄冈市黄州区','湖北省黄冈市黄州区','3','421100','CN',NULL,'1'),
 ('421121','湖北省黄冈市团风县','湖北省黄冈市团风县','3','421100','CN',NULL,'1'),
 ('421122','湖北省黄冈市红安县','湖北省黄冈市红安县','3','421100','CN',NULL,'1'),
 ('421123','湖北省黄冈市罗田县','湖北省黄冈市罗田县','3','421100','CN',NULL,'1'),
 ('421124','湖北省黄冈市英山县','湖北省黄冈市英山县','3','421100','CN',NULL,'1'),
 ('421125','湖北省黄冈市浠水县','湖北省黄冈市浠水县','3','421100','CN',NULL,'1'),
 ('421126','湖北省黄冈市蕲春县','湖北省黄冈市蕲春县','3','421100','CN',NULL,'1'),
 ('421127','湖北省黄冈市黄梅县','湖北省黄冈市黄梅县','3','421100','CN',NULL,'1'),
 ('421181','湖北省黄冈市麻城市','湖北省黄冈市麻城市','3','421100','CN',NULL,'1'),
 ('421182','湖北省黄冈市武穴市','湖北省黄冈市武穴市','3','421100','CN',NULL,'1'),
 ('421200','湖北省咸宁市','湖北省咸宁市','2','420000','CN',NULL,'1'),
 ('421201','湖北省咸宁市市辖区','湖北省咸宁市市辖区','3','421200','CN',NULL,'1'),
 ('421202','湖北省咸宁市咸安区','湖北省咸宁市咸安区','3','421200','CN',NULL,'1'),
 ('421221','湖北省咸宁市嘉鱼县','湖北省咸宁市嘉鱼县','3','421200','CN',NULL,'1'),
 ('421222','湖北省咸宁市通城县','湖北省咸宁市通城县','3','421200','CN',NULL,'1'),
 ('421223','湖北省咸宁市崇阳县','湖北省咸宁市崇阳县','3','421200','CN',NULL,'1'),
 ('421224','湖北省咸宁市通山县','湖北省咸宁市通山县','3','421200','CN',NULL,'1'),
 ('421281','湖北省咸宁市赤壁市','湖北省咸宁市赤壁市','3','421200','CN',NULL,'1'),
 ('421300','湖北省随州市','湖北省随州市','2','420000','CN',NULL,'1'),
 ('421301','湖北省随州市市辖区','湖北省随州市市辖区','3','421300','CN',NULL,'1'),
 ('421302','湖北省随州市曾都区','湖北省随州市曾都区','3','421300','CN',NULL,'1'),
 ('421381','湖北省随州市广水市','湖北省随州市广水市','3','421300','CN',NULL,'1'),
 ('422800','湖北省恩施土家族苗族自治州','湖北省恩施土家族苗族自治州','2','420000','CN',NULL,'1'),
 ('422801','湖北省恩施土家族苗族自治州恩施市','湖北省恩施土家族苗族自治州恩施市','3','422800','CN',NULL,'1'),
 ('422802','湖北省恩施土家族苗族自治州利川市','湖北省恩施土家族苗族自治州利川市','3','422800','CN',NULL,'1'),
 ('422822','湖北省恩施土家族苗族自治州建始县','湖北省恩施土家族苗族自治州建始县','3','422800','CN',NULL,'1'),
 ('422823','湖北省恩施土家族苗族自治州巴东县','湖北省恩施土家族苗族自治州巴东县','3','422800','CN',NULL,'1'),
 ('422825','湖北省恩施土家族苗族自治州宣恩县','湖北省恩施土家族苗族自治州宣恩县','3','422800','CN',NULL,'1'),
 ('422826','湖北省恩施土家族苗族自治州咸丰县','湖北省恩施土家族苗族自治州咸丰县','3','422800','CN',NULL,'1'),
 ('422827','湖北省恩施土家族苗族自治州来凤县','湖北省恩施土家族苗族自治州来凤县','3','422800','CN',NULL,'1'),
 ('422828','湖北省恩施土家族苗族自治州鹤峰县','湖北省恩施土家族苗族自治州鹤峰县','3','422800','CN',NULL,'1'),
 ('429000','湖北省省直辖行政单位','湖北省省直辖行政单位','2','420000','CN',NULL,'1'),
 ('429004','湖北省省直辖行政单位仙桃市','湖北省省直辖行政单位仙桃市','3','429000','CN',NULL,'1'),
 ('429005','湖北省省直辖行政单位潜江市','湖北省省直辖行政单位潜江市','3','429000','CN',NULL,'1'),
 ('429006','湖北省省直辖行政单位天门市','湖北省省直辖行政单位天门市','3','429000','CN',NULL,'1'),
 ('429021','湖北省省直辖行政单位神农架林区','湖北省省直辖行政单位神农架林区','3','429000','CN',NULL,'1'),
 ('430000','湖南省','湖南省','1','CN','CN',NULL,'1'),
 ('430100','湖南省长沙市','湖南省长沙市','2','430000','CN',NULL,'1'),
 ('430101','湖南省长沙市市辖区','湖南省长沙市市辖区','3','430100','CN',NULL,'1'),
 ('430102','湖南省长沙市芙蓉区','湖南省长沙市芙蓉区','3','430100','CN',NULL,'1'),
 ('430103','湖南省长沙市天心区','湖南省长沙市天心区','3','430100','CN',NULL,'1'),
 ('430104','湖南省长沙市岳麓区','湖南省长沙市岳麓区','3','430100','CN',NULL,'1'),
 ('430105','湖南省长沙市开福区','湖南省长沙市开福区','3','430100','CN',NULL,'1'),
 ('430111','湖南省长沙市雨花区','湖南省长沙市雨花区','3','430100','CN',NULL,'1'),
 ('430121','湖南省长沙市长沙县','湖南省长沙市长沙县','3','430100','CN',NULL,'1'),
 ('430122','湖南省长沙市望城县','湖南省长沙市望城县','3','430100','CN',NULL,'1'),
 ('430124','湖南省长沙市宁乡县','湖南省长沙市宁乡县','3','430100','CN',NULL,'1'),
 ('430181','湖南省长沙市浏阳市','湖南省长沙市浏阳市','3','430100','CN',NULL,'1'),
 ('430200','湖南省株洲市','湖南省株洲市','2','430000','CN',NULL,'1'),
 ('430201','湖南省株洲市市辖区','湖南省株洲市市辖区','3','430200','CN',NULL,'1'),
 ('430202','湖南省株洲市荷塘区','湖南省株洲市荷塘区','3','430200','CN',NULL,'1'),
 ('430203','湖南省株洲市芦淞区','湖南省株洲市芦淞区','3','430200','CN',NULL,'1'),
 ('430204','湖南省株洲市石峰区','湖南省株洲市石峰区','3','430200','CN',NULL,'1'),
 ('430211','湖南省株洲市天元区','湖南省株洲市天元区','3','430200','CN',NULL,'1'),
 ('430221','湖南省株洲市株洲县','湖南省株洲市株洲县','3','430200','CN',NULL,'1'),
 ('430223','湖南省株洲市攸县','湖南省株洲市攸县','3','430200','CN',NULL,'1'),
 ('430224','湖南省株洲市茶陵县','湖南省株洲市茶陵县','3','430200','CN',NULL,'1'),
 ('430225','湖南省株洲市炎陵县','湖南省株洲市炎陵县','3','430200','CN',NULL,'1'),
 ('430281','湖南省株洲市醴陵市','湖南省株洲市醴陵市','3','430200','CN',NULL,'1'),
 ('430300','湖南省湘潭市','湖南省湘潭市','2','430000','CN',NULL,'1'),
 ('430301','湖南省湘潭市市辖区','湖南省湘潭市市辖区','3','430300','CN',NULL,'1'),
 ('430302','湖南省湘潭市雨湖区','湖南省湘潭市雨湖区','3','430300','CN',NULL,'1'),
 ('430304','湖南省湘潭市岳塘区','湖南省湘潭市岳塘区','3','430300','CN',NULL,'1'),
 ('430321','湖南省湘潭市湘潭县','湖南省湘潭市湘潭县','3','430300','CN',NULL,'1'),
 ('430381','湖南省湘潭市湘乡市','湖南省湘潭市湘乡市','3','430300','CN',NULL,'1'),
 ('430382','湖南省湘潭市韶山市','湖南省湘潭市韶山市','3','430300','CN',NULL,'1'),
 ('430400','湖南省衡阳市','湖南省衡阳市','2','430000','CN',NULL,'1'),
 ('430401','湖南省衡阳市市辖区','湖南省衡阳市市辖区','3','430400','CN',NULL,'1'),
 ('430405','湖南省衡阳市珠晖区','湖南省衡阳市珠晖区','3','430400','CN',NULL,'1'),
 ('430406','湖南省衡阳市雁峰区','湖南省衡阳市雁峰区','3','430400','CN',NULL,'1'),
 ('430407','湖南省衡阳市石鼓区','湖南省衡阳市石鼓区','3','430400','CN',NULL,'1'),
 ('430408','湖南省衡阳市蒸湘区','湖南省衡阳市蒸湘区','3','430400','CN',NULL,'1'),
 ('430412','湖南省衡阳市南岳区','湖南省衡阳市南岳区','3','430400','CN',NULL,'1'),
 ('430421','湖南省衡阳市衡阳县','湖南省衡阳市衡阳县','3','430400','CN',NULL,'1'),
 ('430422','湖南省衡阳市衡南县','湖南省衡阳市衡南县','3','430400','CN',NULL,'1'),
 ('430423','湖南省衡阳市衡山县','湖南省衡阳市衡山县','3','430400','CN',NULL,'1'),
 ('430424','湖南省衡阳市衡东县','湖南省衡阳市衡东县','3','430400','CN',NULL,'1'),
 ('430426','湖南省衡阳市祁东县','湖南省衡阳市祁东县','3','430400','CN',NULL,'1'),
 ('430481','湖南省衡阳市耒阳市','湖南省衡阳市耒阳市','3','430400','CN',NULL,'1'),
 ('430482','湖南省衡阳市常宁市','湖南省衡阳市常宁市','3','430400','CN',NULL,'1'),
 ('430500','湖南省邵阳市','湖南省邵阳市','2','430000','CN',NULL,'1'),
 ('430501','湖南省邵阳市市辖区','湖南省邵阳市市辖区','3','430500','CN',NULL,'1'),
 ('430502','湖南省邵阳市双清区','湖南省邵阳市双清区','3','430500','CN',NULL,'1'),
 ('430503','湖南省邵阳市大祥区','湖南省邵阳市大祥区','3','430500','CN',NULL,'1'),
 ('430511','湖南省邵阳市北塔区','湖南省邵阳市北塔区','3','430500','CN',NULL,'1'),
 ('430521','湖南省邵阳市邵东县','湖南省邵阳市邵东县','3','430500','CN',NULL,'1'),
 ('430522','湖南省邵阳市新邵县','湖南省邵阳市新邵县','3','430500','CN',NULL,'1'),
 ('430523','湖南省邵阳市邵阳县','湖南省邵阳市邵阳县','3','430500','CN',NULL,'1'),
 ('430524','湖南省邵阳市隆回县','湖南省邵阳市隆回县','3','430500','CN',NULL,'1'),
 ('430525','湖南省邵阳市洞口县','湖南省邵阳市洞口县','3','430500','CN',NULL,'1'),
 ('430527','湖南省邵阳市绥宁县','湖南省邵阳市绥宁县','3','430500','CN',NULL,'1'),
 ('430528','湖南省邵阳市新宁县','湖南省邵阳市新宁县','3','430500','CN',NULL,'1'),
 ('430529','湖南省邵阳市城步苗族自治县','湖南省邵阳市城步苗族自治县','3','430500','CN',NULL,'1'),
 ('430581','湖南省邵阳市武冈市','湖南省邵阳市武冈市','3','430500','CN',NULL,'1'),
 ('430600','湖南省岳阳市','湖南省岳阳市','2','430000','CN',NULL,'1'),
 ('430601','湖南省岳阳市市辖区','湖南省岳阳市市辖区','3','430600','CN',NULL,'1'),
 ('430602','湖南省岳阳市岳阳楼区','湖南省岳阳市岳阳楼区','3','430600','CN',NULL,'1'),
 ('430603','湖南省岳阳市云溪区','湖南省岳阳市云溪区','3','430600','CN',NULL,'1'),
 ('430611','湖南省岳阳市君山区','湖南省岳阳市君山区','3','430600','CN',NULL,'1'),
 ('430621','湖南省岳阳市岳阳县','湖南省岳阳市岳阳县','3','430600','CN',NULL,'1'),
 ('430623','湖南省岳阳市华容县','湖南省岳阳市华容县','3','430600','CN',NULL,'1'),
 ('430624','湖南省岳阳市湘阴县','湖南省岳阳市湘阴县','3','430600','CN',NULL,'1'),
 ('430626','湖南省岳阳市平江县','湖南省岳阳市平江县','3','430600','CN',NULL,'1'),
 ('430681','湖南省岳阳市汨罗市','湖南省岳阳市汨罗市','3','430600','CN',NULL,'1'),
 ('430682','湖南省岳阳市临湘市','湖南省岳阳市临湘市','3','430600','CN',NULL,'1'),
 ('430700','湖南省常德市','湖南省常德市','2','430000','CN',NULL,'1'),
 ('430701','湖南省常德市市辖区','湖南省常德市市辖区','3','430700','CN',NULL,'1'),
 ('430702','湖南省常德市武陵区','湖南省常德市武陵区','3','430700','CN',NULL,'1'),
 ('430703','湖南省常德市鼎城区','湖南省常德市鼎城区','3','430700','CN',NULL,'1'),
 ('430721','湖南省常德市安乡县','湖南省常德市安乡县','3','430700','CN',NULL,'1'),
 ('430722','湖南省常德市汉寿县','湖南省常德市汉寿县','3','430700','CN',NULL,'1'),
 ('430723','湖南省常德市澧县','湖南省常德市澧县','3','430700','CN',NULL,'1'),
 ('430724','湖南省常德市临澧县','湖南省常德市临澧县','3','430700','CN',NULL,'1'),
 ('430725','湖南省常德市桃源县','湖南省常德市桃源县','3','430700','CN',NULL,'1'),
 ('430726','湖南省常德市石门县','湖南省常德市石门县','3','430700','CN',NULL,'1'),
 ('430781','湖南省常德市津市市','湖南省常德市津市市','3','430700','CN',NULL,'1'),
 ('430800','湖南省张家界市','湖南省张家界市','2','430000','CN',NULL,'1'),
 ('430801','湖南省张家界市市辖区','湖南省张家界市市辖区','3','430800','CN',NULL,'1'),
 ('430802','湖南省张家界市永定区','湖南省张家界市永定区','3','430800','CN',NULL,'1'),
 ('430811','湖南省张家界市武陵源区','湖南省张家界市武陵源区','3','430800','CN',NULL,'1'),
 ('430821','湖南省张家界市慈利县','湖南省张家界市慈利县','3','430800','CN',NULL,'1'),
 ('430822','湖南省张家界市桑植县','湖南省张家界市桑植县','3','430800','CN',NULL,'1'),
 ('430900','湖南省益阳市','湖南省益阳市','2','430000','CN',NULL,'1'),
 ('430901','湖南省益阳市市辖区','湖南省益阳市市辖区','3','430900','CN',NULL,'1'),
 ('430902','湖南省益阳市资阳区','湖南省益阳市资阳区','3','430900','CN',NULL,'1'),
 ('430903','湖南省益阳市赫山区','湖南省益阳市赫山区','3','430900','CN',NULL,'1'),
 ('430921','湖南省益阳市南县','湖南省益阳市南县','3','430900','CN',NULL,'1'),
 ('430922','湖南省益阳市桃江县','湖南省益阳市桃江县','3','430900','CN',NULL,'1'),
 ('430923','湖南省益阳市安化县','湖南省益阳市安化县','3','430900','CN',NULL,'1'),
 ('430981','湖南省益阳市沅江市','湖南省益阳市沅江市','3','430900','CN',NULL,'1'),
 ('431000','湖南省郴州市','湖南省郴州市','2','430000','CN',NULL,'1'),
 ('431001','湖南省郴州市市辖区','湖南省郴州市市辖区','3','431000','CN',NULL,'1'),
 ('431002','湖南省郴州市北湖区','湖南省郴州市北湖区','3','431000','CN',NULL,'1'),
 ('431003','湖南省郴州市苏仙区','湖南省郴州市苏仙区','3','431000','CN',NULL,'1'),
 ('431021','湖南省郴州市桂阳县','湖南省郴州市桂阳县','3','431000','CN',NULL,'1'),
 ('431022','湖南省郴州市宜章县','湖南省郴州市宜章县','3','431000','CN',NULL,'1'),
 ('431023','湖南省郴州市永兴县','湖南省郴州市永兴县','3','431000','CN',NULL,'1'),
 ('431024','湖南省郴州市嘉禾县','湖南省郴州市嘉禾县','3','431000','CN',NULL,'1'),
 ('431025','湖南省郴州市临武县','湖南省郴州市临武县','3','431000','CN',NULL,'1'),
 ('431026','湖南省郴州市汝城县','湖南省郴州市汝城县','3','431000','CN',NULL,'1'),
 ('431027','湖南省郴州市桂东县','湖南省郴州市桂东县','3','431000','CN',NULL,'1'),
 ('431028','湖南省郴州市安仁县','湖南省郴州市安仁县','3','431000','CN',NULL,'1'),
 ('431081','湖南省郴州市资兴市','湖南省郴州市资兴市','3','431000','CN',NULL,'1'),
 ('431100','湖南省永州市','湖南省永州市','2','430000','CN',NULL,'1'),
 ('431101','湖南省永州市市辖区','湖南省永州市市辖区','3','431100','CN',NULL,'1'),
 ('431102','湖南省永州市芝山区','湖南省永州市芝山区','3','431100','CN',NULL,'1'),
 ('431103','湖南省永州市冷水滩区','湖南省永州市冷水滩区','3','431100','CN',NULL,'1'),
 ('431121','湖南省永州市祁阳县','湖南省永州市祁阳县','3','431100','CN',NULL,'1'),
 ('431122','湖南省永州市东安县','湖南省永州市东安县','3','431100','CN',NULL,'1'),
 ('431123','湖南省永州市双牌县','湖南省永州市双牌县','3','431100','CN',NULL,'1'),
 ('431124','湖南省永州市道县','湖南省永州市道县','3','431100','CN',NULL,'1'),
 ('431125','湖南省永州市江永县','湖南省永州市江永县','3','431100','CN',NULL,'1'),
 ('431126','湖南省永州市宁远县','湖南省永州市宁远县','3','431100','CN',NULL,'1'),
 ('431127','湖南省永州市蓝山县','湖南省永州市蓝山县','3','431100','CN',NULL,'1'),
 ('431128','湖南省永州市新田县','湖南省永州市新田县','3','431100','CN',NULL,'1'),
 ('431129','湖南省永州市江华瑶族自治县','湖南省永州市江华瑶族自治县','3','431100','CN',NULL,'1'),
 ('431200','湖南省怀化市','湖南省怀化市','2','430000','CN',NULL,'1'),
 ('431201','湖南省怀化市市辖区','湖南省怀化市市辖区','3','431200','CN',NULL,'1'),
 ('431202','湖南省怀化市鹤城区','湖南省怀化市鹤城区','3','431200','CN',NULL,'1'),
 ('431221','湖南省怀化市中方县','湖南省怀化市中方县','3','431200','CN',NULL,'1'),
 ('431222','湖南省怀化市沅陵县','湖南省怀化市沅陵县','3','431200','CN',NULL,'1'),
 ('431223','湖南省怀化市辰溪县','湖南省怀化市辰溪县','3','431200','CN',NULL,'1'),
 ('431224','湖南省怀化市溆浦县','湖南省怀化市溆浦县','3','431200','CN',NULL,'1'),
 ('431225','湖南省怀化市会同县','湖南省怀化市会同县','3','431200','CN',NULL,'1'),
 ('431226','湖南省怀化市麻阳苗族自治县','湖南省怀化市麻阳苗族自治县','3','431200','CN',NULL,'1'),
 ('431227','湖南省怀化市新晃侗族自治县','湖南省怀化市新晃侗族自治县','3','431200','CN',NULL,'1'),
 ('431228','湖南省怀化市芷江侗族自治县','湖南省怀化市芷江侗族自治县','3','431200','CN',NULL,'1'),
 ('431229','湖南省怀化市靖州苗族侗族自治县','湖南省怀化市靖州苗族侗族自治县','3','431200','CN',NULL,'1'),
 ('431230','湖南省怀化市通道侗族自治县','湖南省怀化市通道侗族自治县','3','431200','CN',NULL,'1'),
 ('431281','湖南省怀化市洪江市','湖南省怀化市洪江市','3','431200','CN',NULL,'1'),
 ('431300','湖南省娄底市','湖南省娄底市','2','430000','CN',NULL,'1'),
 ('431301','湖南省娄底市市辖区','湖南省娄底市市辖区','3','431300','CN',NULL,'1'),
 ('431302','湖南省娄底市娄星区','湖南省娄底市娄星区','3','431300','CN',NULL,'1'),
 ('431321','湖南省娄底市双峰县','湖南省娄底市双峰县','3','431300','CN',NULL,'1'),
 ('431322','湖南省娄底市新化县','湖南省娄底市新化县','3','431300','CN',NULL,'1'),
 ('431381','湖南省娄底市冷水江市','湖南省娄底市冷水江市','3','431300','CN',NULL,'1'),
 ('431382','湖南省娄底市涟源市','湖南省娄底市涟源市','3','431300','CN',NULL,'1'),
 ('433100','湖南省湘西土家族苗族自治州','湖南省湘西土家族苗族自治州','2','430000','CN',NULL,'1'),
 ('433101','湖南省湘西土家族苗族自治州吉首市','湖南省湘西土家族苗族自治州吉首市','3','433100','CN',NULL,'1'),
 ('433122','湖南省湘西土家族苗族自治州泸溪县','湖南省湘西土家族苗族自治州泸溪县','3','433100','CN',NULL,'1'),
 ('433123','湖南省湘西土家族苗族自治州凤凰县','湖南省湘西土家族苗族自治州凤凰县','3','433100','CN',NULL,'1'),
 ('433124','湖南省湘西土家族苗族自治州花垣县','湖南省湘西土家族苗族自治州花垣县','3','433100','CN',NULL,'1'),
 ('433125','湖南省湘西土家族苗族自治州保靖县','湖南省湘西土家族苗族自治州保靖县','3','433100','CN',NULL,'1'),
 ('433126','湖南省湘西土家族苗族自治州古丈县','湖南省湘西土家族苗族自治州古丈县','3','433100','CN',NULL,'1'),
 ('433127','湖南省湘西土家族苗族自治州永顺县','湖南省湘西土家族苗族自治州永顺县','3','433100','CN',NULL,'1'),
 ('433130','湖南省湘西土家族苗族自治州龙山县','湖南省湘西土家族苗族自治州龙山县','3','433100','CN',NULL,'1'),
 ('440000','广东省','广东省','1','CN','CN',NULL,'1'),
 ('440100','广东省广州市','广东省广州市','2','440000','CN',NULL,'1'),
 ('440101','广东省广州市市辖区','广东省广州市市辖区','3','440100','CN',NULL,'1'),
 ('440103','广东省广州市荔湾区','广东省广州市荔湾区','3','440100','CN',NULL,'1'),
 ('440104','广东省广州市越秀区','广东省广州市越秀区','3','440100','CN',NULL,'1'),
 ('440105','广东省广州市海珠区','广东省广州市海珠区','3','440100','CN',NULL,'1'),
 ('440106','广东省广州市天河区','广东省广州市天河区','3','440100','CN',NULL,'1'),
 ('440111','广东省广州市白云区','广东省广州市白云区','3','440100','CN',NULL,'1'),
 ('440112','广东省广州市黄埔区','广东省广州市黄埔区','3','440100','CN',NULL,'1'),
 ('440113','广东省广州市番禺区','广东省广州市番禺区','3','440100','CN',NULL,'1'),
 ('440114','广东省广州市花都区','广东省广州市花都区','3','440100','CN',NULL,'1'),
 ('440115','广东省广州市南沙区','广东省广州市南沙区','3','440100','CN',NULL,'1'),
 ('440116','广东省广州市萝岗区','广东省广州市萝岗区','3','440100','CN',NULL,'1'),
 ('440183','广东省广州市增城市','广东省广州市增城市','3','440100','CN',NULL,'1'),
 ('440184','广东省广州市从化市','广东省广州市从化市','3','440100','CN',NULL,'1'),
 ('440200','广东省韶关市','广东省韶关市','2','440000','CN',NULL,'1'),
 ('440201','广东省韶关市市辖区','广东省韶关市市辖区','3','440200','CN',NULL,'1'),
 ('440203','广东省韶关市武江区','广东省韶关市武江区','3','440200','CN',NULL,'1'),
 ('440204','广东省韶关市浈江区','广东省韶关市浈江区','3','440200','CN',NULL,'1'),
 ('440205','广东省韶关市曲江区','广东省韶关市曲江区','3','440200','CN',NULL,'1'),
 ('440222','广东省韶关市始兴县','广东省韶关市始兴县','3','440200','CN',NULL,'1'),
 ('440224','广东省韶关市仁化县','广东省韶关市仁化县','3','440200','CN',NULL,'1'),
 ('440229','广东省韶关市翁源县','广东省韶关市翁源县','3','440200','CN',NULL,'1'),
 ('440232','广东省韶关市乳源瑶族自治县','广东省韶关市乳源瑶族自治县','3','440200','CN',NULL,'1'),
 ('440233','广东省韶关市新丰县','广东省韶关市新丰县','3','440200','CN',NULL,'1'),
 ('440281','广东省韶关市乐昌市','广东省韶关市乐昌市','3','440200','CN',NULL,'1'),
 ('440282','广东省韶关市南雄市','广东省韶关市南雄市','3','440200','CN',NULL,'1'),
 ('440300','广东省深圳市','广东省深圳市','2','440000','CN',NULL,'1'),
 ('440301','广东省深圳市市辖区','广东省深圳市市辖区','3','440300','CN',NULL,'1'),
 ('440303','广东省深圳市罗湖区','广东省深圳市罗湖区','3','440300','CN',NULL,'1'),
 ('440304','广东省深圳市福田区','广东省深圳市福田区','3','440300','CN',NULL,'1'),
 ('440305','广东省深圳市南山区','广东省深圳市南山区','3','440300','CN',NULL,'1'),
 ('440306','广东省深圳市宝安区','广东省深圳市宝安区','3','440300','CN',NULL,'1'),
 ('440307','广东省深圳市龙岗区','广东省深圳市龙岗区','3','440300','CN',NULL,'1'),
 ('440308','广东省深圳市盐田区','广东省深圳市盐田区','3','440300','CN',NULL,'1'),
 ('440400','广东省珠海市','广东省珠海市','2','440000','CN',NULL,'1'),
 ('440401','广东省珠海市市辖区','广东省珠海市市辖区','3','440400','CN',NULL,'1'),
 ('440402','广东省珠海市香洲区','广东省珠海市香洲区','3','440400','CN',NULL,'1'),
 ('440403','广东省珠海市斗门区','广东省珠海市斗门区','3','440400','CN',NULL,'1'),
 ('440404','广东省珠海市金湾区','广东省珠海市金湾区','3','440400','CN',NULL,'1'),
 ('440500','广东省汕头市','广东省汕头市','2','440000','CN',NULL,'1'),
 ('440501','广东省汕头市市辖区','广东省汕头市市辖区','3','440500','CN',NULL,'1'),
 ('440507','广东省汕头市龙湖区','广东省汕头市龙湖区','3','440500','CN',NULL,'1'),
 ('440511','广东省汕头市金平区','广东省汕头市金平区','3','440500','CN',NULL,'1'),
 ('440512','广东省汕头市濠江区','广东省汕头市濠江区','3','440500','CN',NULL,'1'),
 ('440513','广东省汕头市潮阳区','广东省汕头市潮阳区','3','440500','CN',NULL,'1'),
 ('440514','广东省汕头市潮南区','广东省汕头市潮南区','3','440500','CN',NULL,'1'),
 ('440515','广东省汕头市澄海区','广东省汕头市澄海区','3','440500','CN',NULL,'1'),
 ('440523','广东省汕头市南澳县','广东省汕头市南澳县','3','440500','CN',NULL,'1'),
 ('440600','广东省佛山市','广东省佛山市','2','440000','CN',NULL,'1'),
 ('440601','广东省佛山市市辖区','广东省佛山市市辖区','3','440600','CN',NULL,'1'),
 ('440604','广东省佛山市禅城区','广东省佛山市禅城区','3','440600','CN',NULL,'1'),
 ('440605','广东省佛山市南海区','广东省佛山市南海区','3','440600','CN',NULL,'1'),
 ('440606','广东省佛山市顺德区','广东省佛山市顺德区','3','440600','CN',NULL,'1'),
 ('440607','广东省佛山市三水区','广东省佛山市三水区','3','440600','CN',NULL,'1'),
 ('440608','广东省佛山市高明区','广东省佛山市高明区','3','440600','CN',NULL,'1'),
 ('440700','广东省江门市','广东省江门市','2','440000','CN',NULL,'1'),
 ('440701','广东省江门市市辖区','广东省江门市市辖区','3','440700','CN',NULL,'1'),
 ('440703','广东省江门市蓬江区','广东省江门市蓬江区','3','440700','CN',NULL,'1'),
 ('440704','广东省江门市江海区','广东省江门市江海区','3','440700','CN',NULL,'1'),
 ('440705','广东省江门市新会区','广东省江门市新会区','3','440700','CN',NULL,'1'),
 ('440781','广东省江门市台山市','广东省江门市台山市','3','440700','CN',NULL,'1'),
 ('440783','广东省江门市开平市','广东省江门市开平市','3','440700','CN',NULL,'1'),
 ('440784','广东省江门市鹤山市','广东省江门市鹤山市','3','440700','CN',NULL,'1'),
 ('440785','广东省江门市恩平市','广东省江门市恩平市','3','440700','CN',NULL,'1'),
 ('440800','广东省湛江市','广东省湛江市','2','440000','CN',NULL,'1'),
 ('440801','广东省湛江市市辖区','广东省湛江市市辖区','3','440800','CN',NULL,'1'),
 ('440802','广东省湛江市赤坎区','广东省湛江市赤坎区','3','440800','CN',NULL,'1'),
 ('440803','广东省湛江市霞山区','广东省湛江市霞山区','3','440800','CN',NULL,'1'),
 ('440804','广东省湛江市坡头区','广东省湛江市坡头区','3','440800','CN',NULL,'1'),
 ('440811','广东省湛江市麻章区','广东省湛江市麻章区','3','440800','CN',NULL,'1'),
 ('440823','广东省湛江市遂溪县','广东省湛江市遂溪县','3','440800','CN',NULL,'1'),
 ('440825','广东省湛江市徐闻县','广东省湛江市徐闻县','3','440800','CN',NULL,'1'),
 ('440881','广东省湛江市廉江市','广东省湛江市廉江市','3','440800','CN',NULL,'1'),
 ('440882','广东省湛江市雷州市','广东省湛江市雷州市','3','440800','CN',NULL,'1'),
 ('440883','广东省湛江市吴川市','广东省湛江市吴川市','3','440800','CN',NULL,'1'),
 ('440900','广东省茂名市','广东省茂名市','2','440000','CN',NULL,'1'),
 ('440901','广东省茂名市市辖区','广东省茂名市市辖区','3','440900','CN',NULL,'1'),
 ('440902','广东省茂名市茂南区','广东省茂名市茂南区','3','440900','CN',NULL,'1'),
 ('440903','广东省茂名市茂港区','广东省茂名市茂港区','3','440900','CN',NULL,'1'),
 ('440923','广东省茂名市电白县','广东省茂名市电白县','3','440900','CN',NULL,'1'),
 ('440981','广东省茂名市高州市','广东省茂名市高州市','3','440900','CN',NULL,'1'),
 ('440982','广东省茂名市化州市','广东省茂名市化州市','3','440900','CN',NULL,'1'),
 ('440983','广东省茂名市信宜市','广东省茂名市信宜市','3','440900','CN',NULL,'1'),
 ('441200','广东省肇庆市','广东省肇庆市','2','440000','CN',NULL,'1'),
 ('441201','广东省肇庆市市辖区','广东省肇庆市市辖区','3','441200','CN',NULL,'1'),
 ('441202','广东省肇庆市端州区','广东省肇庆市端州区','3','441200','CN',NULL,'1'),
 ('441203','广东省肇庆市鼎湖区','广东省肇庆市鼎湖区','3','441200','CN',NULL,'1'),
 ('441223','广东省肇庆市广宁县','广东省肇庆市广宁县','3','441200','CN',NULL,'1'),
 ('441224','广东省肇庆市怀集县','广东省肇庆市怀集县','3','441200','CN',NULL,'1'),
 ('441225','广东省肇庆市封开县','广东省肇庆市封开县','3','441200','CN',NULL,'1'),
 ('441226','广东省肇庆市德庆县','广东省肇庆市德庆县','3','441200','CN',NULL,'1'),
 ('441283','广东省肇庆市高要市','广东省肇庆市高要市','3','441200','CN',NULL,'1'),
 ('441284','广东省肇庆市四会市','广东省肇庆市四会市','3','441200','CN',NULL,'1'),
 ('441300','广东省惠州市','广东省惠州市','2','440000','CN',NULL,'1'),
 ('441301','广东省惠州市市辖区','广东省惠州市市辖区','3','441300','CN',NULL,'1'),
 ('441302','广东省惠州市惠城区','广东省惠州市惠城区','3','441300','CN',NULL,'1'),
 ('441303','广东省惠州市惠阳区','广东省惠州市惠阳区','3','441300','CN',NULL,'1'),
 ('441322','广东省惠州市博罗县','广东省惠州市博罗县','3','441300','CN',NULL,'1'),
 ('441323','广东省惠州市惠东县','广东省惠州市惠东县','3','441300','CN',NULL,'1'),
 ('441324','广东省惠州市龙门县','广东省惠州市龙门县','3','441300','CN',NULL,'1'),
 ('441400','广东省梅州市','广东省梅州市','2','440000','CN',NULL,'1'),
 ('441401','广东省梅州市市辖区','广东省梅州市市辖区','3','441400','CN',NULL,'1'),
 ('441402','广东省梅州市梅江区','广东省梅州市梅江区','3','441400','CN',NULL,'1'),
 ('441421','广东省梅州市梅县','广东省梅州市梅县','3','441400','CN',NULL,'1'),
 ('441422','广东省梅州市大埔县','广东省梅州市大埔县','3','441400','CN',NULL,'1'),
 ('441423','广东省梅州市丰顺县','广东省梅州市丰顺县','3','441400','CN',NULL,'1'),
 ('441424','广东省梅州市五华县','广东省梅州市五华县','3','441400','CN',NULL,'1'),
 ('441426','广东省梅州市平远县','广东省梅州市平远县','3','441400','CN',NULL,'1'),
 ('441427','广东省梅州市蕉岭县','广东省梅州市蕉岭县','3','441400','CN',NULL,'1'),
 ('441481','广东省梅州市兴宁市','广东省梅州市兴宁市','3','441400','CN',NULL,'1'),
 ('441500','广东省汕尾市','广东省汕尾市','2','440000','CN',NULL,'1'),
 ('441501','广东省汕尾市市辖区','广东省汕尾市市辖区','3','441500','CN',NULL,'1'),
 ('441502','广东省汕尾市城区','广东省汕尾市城区','3','441500','CN',NULL,'1'),
 ('441521','广东省汕尾市海丰县','广东省汕尾市海丰县','3','441500','CN',NULL,'1'),
 ('441523','广东省汕尾市陆河县','广东省汕尾市陆河县','3','441500','CN',NULL,'1'),
 ('441581','广东省汕尾市陆丰市','广东省汕尾市陆丰市','3','441500','CN',NULL,'1'),
 ('441600','广东省河源市','广东省河源市','2','440000','CN',NULL,'1'),
 ('441601','广东省河源市市辖区','广东省河源市市辖区','3','441600','CN',NULL,'1'),
 ('441602','广东省河源市源城区','广东省河源市源城区','3','441600','CN',NULL,'1'),
 ('441621','广东省河源市紫金县','广东省河源市紫金县','3','441600','CN',NULL,'1'),
 ('441622','广东省河源市龙川县','广东省河源市龙川县','3','441600','CN',NULL,'1'),
 ('441623','广东省河源市连平县','广东省河源市连平县','3','441600','CN',NULL,'1'),
 ('441624','广东省河源市和平县','广东省河源市和平县','3','441600','CN',NULL,'1'),
 ('441625','广东省河源市东源县','广东省河源市东源县','3','441600','CN',NULL,'1'),
 ('441700','广东省阳江市','广东省阳江市','2','440000','CN',NULL,'1'),
 ('441701','广东省阳江市市辖区','广东省阳江市市辖区','3','441700','CN',NULL,'1'),
 ('441702','广东省阳江市江城区','广东省阳江市江城区','3','441700','CN',NULL,'1'),
 ('441721','广东省阳江市阳西县','广东省阳江市阳西县','3','441700','CN',NULL,'1'),
 ('441723','广东省阳江市阳东县','广东省阳江市阳东县','3','441700','CN',NULL,'1'),
 ('441781','广东省阳江市阳春市','广东省阳江市阳春市','3','441700','CN',NULL,'1'),
 ('441800','广东省清远市','广东省清远市','2','440000','CN',NULL,'1'),
 ('441801','广东省清远市市辖区','广东省清远市市辖区','3','441800','CN',NULL,'1'),
 ('441802','广东省清远市清城区','广东省清远市清城区','3','441800','CN',NULL,'1'),
 ('441821','广东省清远市佛冈县','广东省清远市佛冈县','3','441800','CN',NULL,'1'),
 ('441823','广东省清远市阳山县','广东省清远市阳山县','3','441800','CN',NULL,'1'),
 ('441825','广东省清远市连山壮族瑶族自治县','广东省清远市连山壮族瑶族自治县','3','441800','CN',NULL,'1'),
 ('441826','广东省清远市连南瑶族自治县','广东省清远市连南瑶族自治县','3','441800','CN',NULL,'1'),
 ('441827','广东省清远市清新县','广东省清远市清新县','3','441800','CN',NULL,'1'),
 ('441881','广东省清远市英德市','广东省清远市英德市','3','441800','CN',NULL,'1'),
 ('441882','广东省清远市连州市','广东省清远市连州市','3','441800','CN',NULL,'1'),
 ('441900','广东省东莞市','广东省东莞市','2','440000','CN',NULL,'1'),
 ('442000','广东省中山市','广东省中山市','2','440000','CN',NULL,'1'),
 ('445100','广东省潮州市','广东省潮州市','2','440000','CN',NULL,'1'),
 ('445101','广东省潮州市市辖区','广东省潮州市市辖区','3','445100','CN',NULL,'1'),
 ('445102','广东省潮州市湘桥区','广东省潮州市湘桥区','3','445100','CN',NULL,'1'),
 ('445121','广东省潮州市潮安县','广东省潮州市潮安县','3','445100','CN',NULL,'1'),
 ('445122','广东省潮州市饶平县','广东省潮州市饶平县','3','445100','CN',NULL,'1'),
 ('445200','广东省揭阳市','广东省揭阳市','2','440000','CN',NULL,'1'),
 ('445201','广东省揭阳市市辖区','广东省揭阳市市辖区','3','445200','CN',NULL,'1'),
 ('445202','广东省揭阳市榕城区','广东省揭阳市榕城区','3','445200','CN',NULL,'1'),
 ('445221','广东省揭阳市揭东县','广东省揭阳市揭东县','3','445200','CN',NULL,'1'),
 ('445222','广东省揭阳市揭西县','广东省揭阳市揭西县','3','445200','CN',NULL,'1'),
 ('445224','广东省揭阳市惠来县','广东省揭阳市惠来县','3','445200','CN',NULL,'1'),
 ('445281','广东省揭阳市普宁市','广东省揭阳市普宁市','3','445200','CN',NULL,'1'),
 ('445300','广东省云浮市','广东省云浮市','2','440000','CN',NULL,'1'),
 ('445301','广东省云浮市市辖区','广东省云浮市市辖区','3','445300','CN',NULL,'1'),
 ('445302','广东省云浮市云城区','广东省云浮市云城区','3','445300','CN',NULL,'1'),
 ('445321','广东省云浮市新兴县','广东省云浮市新兴县','3','445300','CN',NULL,'1'),
 ('445322','广东省云浮市郁南县','广东省云浮市郁南县','3','445300','CN',NULL,'1'),
 ('445323','广东省云浮市云安县','广东省云浮市云安县','3','445300','CN',NULL,'1'),
 ('445381','广东省云浮市罗定市','广东省云浮市罗定市','3','445300','CN',NULL,'1'),
 ('450000','广西壮族自治区','广西壮族自治区','1','CN','CN',NULL,'1'),
 ('450100','广西壮族自治区南宁市','广西壮族自治区南宁市','2','450000','CN',NULL,'1'),
 ('450101','广西壮族自治区南宁市市辖区','广西壮族自治区南宁市市辖区','3','450100','CN',NULL,'1'),
 ('450102','广西壮族自治区南宁市兴宁区','广西壮族自治区南宁市兴宁区','3','450100','CN',NULL,'1'),
 ('450103','广西壮族自治区南宁市青秀区','广西壮族自治区南宁市青秀区','3','450100','CN',NULL,'1'),
 ('450105','广西壮族自治区南宁市江南区','广西壮族自治区南宁市江南区','3','450100','CN',NULL,'1'),
 ('450107','广西壮族自治区南宁市西乡塘区','广西壮族自治区南宁市西乡塘区','3','450100','CN',NULL,'1'),
 ('450108','广西壮族自治区南宁市良庆区','广西壮族自治区南宁市良庆区','3','450100','CN',NULL,'1'),
 ('450109','广西壮族自治区南宁市邕宁区','广西壮族自治区南宁市邕宁区','3','450100','CN',NULL,'1'),
 ('450122','广西壮族自治区南宁市武鸣县','广西壮族自治区南宁市武鸣县','3','450100','CN',NULL,'1'),
 ('450123','广西壮族自治区南宁市隆安县','广西壮族自治区南宁市隆安县','3','450100','CN',NULL,'1'),
 ('450124','广西壮族自治区南宁市马山县','广西壮族自治区南宁市马山县','3','450100','CN',NULL,'1'),
 ('450125','广西壮族自治区南宁市上林县','广西壮族自治区南宁市上林县','3','450100','CN',NULL,'1'),
 ('450126','广西壮族自治区南宁市宾阳县','广西壮族自治区南宁市宾阳县','3','450100','CN',NULL,'1'),
 ('450127','广西壮族自治区南宁市横县','广西壮族自治区南宁市横县','3','450100','CN',NULL,'1'),
 ('450200','广西壮族自治区柳州市','广西壮族自治区柳州市','2','450000','CN',NULL,'1'),
 ('450201','广西壮族自治区柳州市市辖区','广西壮族自治区柳州市市辖区','3','450200','CN',NULL,'1'),
 ('450202','广西壮族自治区柳州市城中区','广西壮族自治区柳州市城中区','3','450200','CN',NULL,'1'),
 ('450203','广西壮族自治区柳州市鱼峰区','广西壮族自治区柳州市鱼峰区','3','450200','CN',NULL,'1'),
 ('450204','广西壮族自治区柳州市柳南区','广西壮族自治区柳州市柳南区','3','450200','CN',NULL,'1'),
 ('450205','广西壮族自治区柳州市柳北区','广西壮族自治区柳州市柳北区','3','450200','CN',NULL,'1'),
 ('450221','广西壮族自治区柳州市柳江县','广西壮族自治区柳州市柳江县','3','450200','CN',NULL,'1'),
 ('450222','广西壮族自治区柳州市柳城县','广西壮族自治区柳州市柳城县','3','450200','CN',NULL,'1'),
 ('450223','广西壮族自治区柳州市鹿寨县','广西壮族自治区柳州市鹿寨县','3','450200','CN',NULL,'1'),
 ('450224','广西壮族自治区柳州市融安县','广西壮族自治区柳州市融安县','3','450200','CN',NULL,'1'),
 ('450225','广西壮族自治区柳州市融水苗族自治县','广西壮族自治区柳州市融水苗族自治县','3','450200','CN',NULL,'1'),
 ('450226','广西壮族自治区柳州市三江侗族自治县','广西壮族自治区柳州市三江侗族自治县','3','450200','CN',NULL,'1'),
 ('450300','广西壮族自治区桂林市','广西壮族自治区桂林市','2','450000','CN',NULL,'1'),
 ('450301','广西壮族自治区桂林市市辖区','广西壮族自治区桂林市市辖区','3','450300','CN',NULL,'1'),
 ('450302','广西壮族自治区桂林市秀峰区','广西壮族自治区桂林市秀峰区','3','450300','CN',NULL,'1'),
 ('450303','广西壮族自治区桂林市叠彩区','广西壮族自治区桂林市叠彩区','3','450300','CN',NULL,'1'),
 ('450304','广西壮族自治区桂林市象山区','广西壮族自治区桂林市象山区','3','450300','CN',NULL,'1'),
 ('450305','广西壮族自治区桂林市七星区','广西壮族自治区桂林市七星区','3','450300','CN',NULL,'1'),
 ('450311','广西壮族自治区桂林市雁山区','广西壮族自治区桂林市雁山区','3','450300','CN',NULL,'1'),
 ('450321','广西壮族自治区桂林市阳朔县','广西壮族自治区桂林市阳朔县','3','450300','CN',NULL,'1'),
 ('450322','广西壮族自治区桂林市临桂县','广西壮族自治区桂林市临桂县','3','450300','CN',NULL,'1'),
 ('450323','广西壮族自治区桂林市灵川县','广西壮族自治区桂林市灵川县','3','450300','CN',NULL,'1'),
 ('450324','广西壮族自治区桂林市全州县','广西壮族自治区桂林市全州县','3','450300','CN',NULL,'1'),
 ('450325','广西壮族自治区桂林市兴安县','广西壮族自治区桂林市兴安县','3','450300','CN',NULL,'1'),
 ('450326','广西壮族自治区桂林市永福县','广西壮族自治区桂林市永福县','3','450300','CN',NULL,'1'),
 ('450327','广西壮族自治区桂林市灌阳县','广西壮族自治区桂林市灌阳县','3','450300','CN',NULL,'1'),
 ('450328','广西壮族自治区桂林市龙胜各族自治县','广西壮族自治区桂林市龙胜各族自治县','3','450300','CN',NULL,'1'),
 ('450329','广西壮族自治区桂林市资源县','广西壮族自治区桂林市资源县','3','450300','CN',NULL,'1'),
 ('450330','广西壮族自治区桂林市平乐县','广西壮族自治区桂林市平乐县','3','450300','CN',NULL,'1'),
 ('450331','广西壮族自治区桂林市荔蒲县','广西壮族自治区桂林市荔蒲县','3','450300','CN',NULL,'1'),
 ('450332','广西壮族自治区桂林市恭城瑶族自治县','广西壮族自治区桂林市恭城瑶族自治县','3','450300','CN',NULL,'1'),
 ('450400','广西壮族自治区梧州市','广西壮族自治区梧州市','2','450000','CN',NULL,'1'),
 ('450401','广西壮族自治区梧州市市辖区','广西壮族自治区梧州市市辖区','3','450400','CN',NULL,'1'),
 ('450403','广西壮族自治区梧州市万秀区','广西壮族自治区梧州市万秀区','3','450400','CN',NULL,'1'),
 ('450404','广西壮族自治区梧州市蝶山区','广西壮族自治区梧州市蝶山区','3','450400','CN',NULL,'1'),
 ('450405','广西壮族自治区梧州市长洲区','广西壮族自治区梧州市长洲区','3','450400','CN',NULL,'1'),
 ('450421','广西壮族自治区梧州市苍梧县','广西壮族自治区梧州市苍梧县','3','450400','CN',NULL,'1'),
 ('450422','广西壮族自治区梧州市藤县','广西壮族自治区梧州市藤县','3','450400','CN',NULL,'1'),
 ('450423','广西壮族自治区梧州市蒙山县','广西壮族自治区梧州市蒙山县','3','450400','CN',NULL,'1'),
 ('450481','广西壮族自治区梧州市岑溪市','广西壮族自治区梧州市岑溪市','3','450400','CN',NULL,'1'),
 ('450500','广西壮族自治区北海市','广西壮族自治区北海市','2','450000','CN',NULL,'1'),
 ('450501','广西壮族自治区北海市市辖区','广西壮族自治区北海市市辖区','3','450500','CN',NULL,'1'),
 ('450502','广西壮族自治区北海市海城区','广西壮族自治区北海市海城区','3','450500','CN',NULL,'1'),
 ('450503','广西壮族自治区北海市银海区','广西壮族自治区北海市银海区','3','450500','CN',NULL,'1'),
 ('450512','广西壮族自治区北海市铁山港区','广西壮族自治区北海市铁山港区','3','450500','CN',NULL,'1'),
 ('450521','广西壮族自治区北海市合浦县','广西壮族自治区北海市合浦县','3','450500','CN',NULL,'1'),
 ('450600','广西壮族自治区防城港市','广西壮族自治区防城港市','2','450000','CN',NULL,'1'),
 ('450601','广西壮族自治区防城港市市辖区','广西壮族自治区防城港市市辖区','3','450600','CN',NULL,'1'),
 ('450602','广西壮族自治区防城港市港口区','广西壮族自治区防城港市港口区','3','450600','CN',NULL,'1'),
 ('450603','广西壮族自治区防城港市防城区','广西壮族自治区防城港市防城区','3','450600','CN',NULL,'1'),
 ('450621','广西壮族自治区防城港市上思县','广西壮族自治区防城港市上思县','3','450600','CN',NULL,'1'),
 ('450681','广西壮族自治区防城港市东兴市','广西壮族自治区防城港市东兴市','3','450600','CN',NULL,'1'),
 ('450700','广西壮族自治区钦州市','广西壮族自治区钦州市','2','450000','CN',NULL,'1'),
 ('450701','广西壮族自治区钦州市市辖区','广西壮族自治区钦州市市辖区','3','450700','CN',NULL,'1'),
 ('450702','广西壮族自治区钦州市钦南区','广西壮族自治区钦州市钦南区','3','450700','CN',NULL,'1'),
 ('450703','广西壮族自治区钦州市钦北区','广西壮族自治区钦州市钦北区','3','450700','CN',NULL,'1'),
 ('450721','广西壮族自治区钦州市灵山县','广西壮族自治区钦州市灵山县','3','450700','CN',NULL,'1'),
 ('450722','广西壮族自治区钦州市浦北县','广西壮族自治区钦州市浦北县','3','450700','CN',NULL,'1'),
 ('450800','广西壮族自治区贵港市','广西壮族自治区贵港市','2','450000','CN',NULL,'1'),
 ('450801','广西壮族自治区贵港市市辖区','广西壮族自治区贵港市市辖区','3','450800','CN',NULL,'1'),
 ('450802','广西壮族自治区贵港市港北区','广西壮族自治区贵港市港北区','3','450800','CN',NULL,'1'),
 ('450803','广西壮族自治区贵港市港南区','广西壮族自治区贵港市港南区','3','450800','CN',NULL,'1'),
 ('450804','广西壮族自治区贵港市覃塘区','广西壮族自治区贵港市覃塘区','3','450800','CN',NULL,'1'),
 ('450821','广西壮族自治区贵港市平南县','广西壮族自治区贵港市平南县','3','450800','CN',NULL,'1'),
 ('450881','广西壮族自治区贵港市桂平市','广西壮族自治区贵港市桂平市','3','450800','CN',NULL,'1'),
 ('450900','广西壮族自治区玉林市','广西壮族自治区玉林市','2','450000','CN',NULL,'1'),
 ('450901','广西壮族自治区玉林市市辖区','广西壮族自治区玉林市市辖区','3','450900','CN',NULL,'1'),
 ('450902','广西壮族自治区玉林市玉州区','广西壮族自治区玉林市玉州区','3','450900','CN',NULL,'1'),
 ('450921','广西壮族自治区玉林市容县','广西壮族自治区玉林市容县','3','450900','CN',NULL,'1'),
 ('450922','广西壮族自治区玉林市陆川县','广西壮族自治区玉林市陆川县','3','450900','CN',NULL,'1'),
 ('450923','广西壮族自治区玉林市博白县','广西壮族自治区玉林市博白县','3','450900','CN',NULL,'1'),
 ('450924','广西壮族自治区玉林市兴业县','广西壮族自治区玉林市兴业县','3','450900','CN',NULL,'1'),
 ('450981','广西壮族自治区玉林市北流市','广西壮族自治区玉林市北流市','3','450900','CN',NULL,'1'),
 ('451000','广西壮族自治区百色市','广西壮族自治区百色市','2','450000','CN',NULL,'1'),
 ('451001','广西壮族自治区百色市市辖区','广西壮族自治区百色市市辖区','3','451000','CN',NULL,'1'),
 ('451002','广西壮族自治区百色市右江区','广西壮族自治区百色市右江区','3','451000','CN',NULL,'1'),
 ('451021','广西壮族自治区百色市田阳县','广西壮族自治区百色市田阳县','3','451000','CN',NULL,'1'),
 ('451022','广西壮族自治区百色市田东县','广西壮族自治区百色市田东县','3','451000','CN',NULL,'1'),
 ('451023','广西壮族自治区百色市平果县','广西壮族自治区百色市平果县','3','451000','CN',NULL,'1'),
 ('451024','广西壮族自治区百色市德保县','广西壮族自治区百色市德保县','3','451000','CN',NULL,'1'),
 ('451025','广西壮族自治区百色市靖西县','广西壮族自治区百色市靖西县','3','451000','CN',NULL,'1'),
 ('451026','广西壮族自治区百色市那坡县','广西壮族自治区百色市那坡县','3','451000','CN',NULL,'1'),
 ('451027','广西壮族自治区百色市凌云县','广西壮族自治区百色市凌云县','3','451000','CN',NULL,'1'),
 ('451028','广西壮族自治区百色市乐业县','广西壮族自治区百色市乐业县','3','451000','CN',NULL,'1'),
 ('451029','广西壮族自治区百色市田林县','广西壮族自治区百色市田林县','3','451000','CN',NULL,'1'),
 ('451030','广西壮族自治区百色市西林县','广西壮族自治区百色市西林县','3','451000','CN',NULL,'1'),
 ('451031','广西壮族自治区百色市隆林各族自治县','广西壮族自治区百色市隆林各族自治县','3','451000','CN',NULL,'1'),
 ('451100','广西壮族自治区贺州市','广西壮族自治区贺州市','2','450000','CN',NULL,'1'),
 ('451101','广西壮族自治区贺州市市辖区','广西壮族自治区贺州市市辖区','3','451100','CN',NULL,'1'),
 ('451102','广西壮族自治区贺州市八步区','广西壮族自治区贺州市八步区','3','451100','CN',NULL,'1'),
 ('451121','广西壮族自治区贺州市昭平县','广西壮族自治区贺州市昭平县','3','451100','CN',NULL,'1'),
 ('451122','广西壮族自治区贺州市钟山县','广西壮族自治区贺州市钟山县','3','451100','CN',NULL,'1'),
 ('451123','广西壮族自治区贺州市富川瑶族自治县','广西壮族自治区贺州市富川瑶族自治县','3','451100','CN',NULL,'1'),
 ('451200','广西壮族自治区河池市','广西壮族自治区河池市','2','450000','CN',NULL,'1'),
 ('451201','广西壮族自治区河池市市辖区','广西壮族自治区河池市市辖区','3','451200','CN',NULL,'1'),
 ('451202','广西壮族自治区河池市金城江区','广西壮族自治区河池市金城江区','3','451200','CN',NULL,'1'),
 ('451221','广西壮族自治区河池市南丹县','广西壮族自治区河池市南丹县','3','451200','CN',NULL,'1'),
 ('451222','广西壮族自治区河池市天峨县','广西壮族自治区河池市天峨县','3','451200','CN',NULL,'1'),
 ('451223','广西壮族自治区河池市凤山县','广西壮族自治区河池市凤山县','3','451200','CN',NULL,'1'),
 ('451224','广西壮族自治区河池市东兰县','广西壮族自治区河池市东兰县','3','451200','CN',NULL,'1'),
 ('451225','广西壮族自治区河池市罗城仫佬族自治县','广西壮族自治区河池市罗城仫佬族自治县','3','451200','CN',NULL,'1'),
 ('451226','广西壮族自治区河池市环江毛南族自治县','广西壮族自治区河池市环江毛南族自治县','3','451200','CN',NULL,'1'),
 ('451227','广西壮族自治区河池市巴马瑶族自治县','广西壮族自治区河池市巴马瑶族自治县','3','451200','CN',NULL,'1'),
 ('451228','广西壮族自治区河池市都安瑶族自治县','广西壮族自治区河池市都安瑶族自治县','3','451200','CN',NULL,'1'),
 ('451229','广西壮族自治区河池市大化瑶族自治县','广西壮族自治区河池市大化瑶族自治县','3','451200','CN',NULL,'1'),
 ('451281','广西壮族自治区河池市宜州市','广西壮族自治区河池市宜州市','3','451200','CN',NULL,'1'),
 ('451300','广西壮族自治区来宾市','广西壮族自治区来宾市','2','450000','CN',NULL,'1'),
 ('451301','广西壮族自治区来宾市市辖区','广西壮族自治区来宾市市辖区','3','451300','CN',NULL,'1'),
 ('451302','广西壮族自治区来宾市兴宾区','广西壮族自治区来宾市兴宾区','3','451300','CN',NULL,'1'),
 ('451321','广西壮族自治区来宾市忻城县','广西壮族自治区来宾市忻城县','3','451300','CN',NULL,'1'),
 ('451322','广西壮族自治区来宾市象州县','广西壮族自治区来宾市象州县','3','451300','CN',NULL,'1'),
 ('451323','广西壮族自治区来宾市武宣县','广西壮族自治区来宾市武宣县','3','451300','CN',NULL,'1'),
 ('451324','广西壮族自治区来宾市金秀瑶族自治县','广西壮族自治区来宾市金秀瑶族自治县','3','451300','CN',NULL,'1'),
 ('451381','广西壮族自治区来宾市合山市','广西壮族自治区来宾市合山市','3','451300','CN',NULL,'1'),
 ('451400','广西壮族自治区崇左市','广西壮族自治区崇左市','2','450000','CN',NULL,'1'),
 ('451401','广西壮族自治区崇左市市辖区','广西壮族自治区崇左市市辖区','3','451400','CN',NULL,'1'),
 ('451402','广西壮族自治区崇左市江洲区','广西壮族自治区崇左市江洲区','3','451400','CN',NULL,'1'),
 ('451421','广西壮族自治区崇左市扶绥县','广西壮族自治区崇左市扶绥县','3','451400','CN',NULL,'1'),
 ('451422','广西壮族自治区崇左市宁明县','广西壮族自治区崇左市宁明县','3','451400','CN',NULL,'1'),
 ('451423','广西壮族自治区崇左市龙州县','广西壮族自治区崇左市龙州县','3','451400','CN',NULL,'1'),
 ('451424','广西壮族自治区崇左市大新县','广西壮族自治区崇左市大新县','3','451400','CN',NULL,'1'),
 ('451425','广西壮族自治区崇左市天等县','广西壮族自治区崇左市天等县','3','451400','CN',NULL,'1'),
 ('451481','广西壮族自治区崇左市凭祥市','广西壮族自治区崇左市凭祥市','3','451400','CN',NULL,'1'),
 ('460000','海南省','海南省','1','CN','CN',NULL,'1'),
 ('460100','海南省海口市','海南省海口市','2','460000','CN',NULL,'1'),
 ('460101','海南省海口市市辖区','海南省海口市市辖区','3','460100','CN',NULL,'1'),
 ('460105','海南省海口市秀英区','海南省海口市秀英区','3','460100','CN',NULL,'1'),
 ('460106','海南省海口市龙华区','海南省海口市龙华区','3','460100','CN',NULL,'1'),
 ('460107','海南省海口市琼山区','海南省海口市琼山区','3','460100','CN',NULL,'1'),
 ('460108','海南省海口市美兰区','海南省海口市美兰区','3','460100','CN',NULL,'1'),
 ('460200','海南省三亚市','海南省三亚市','2','460000','CN',NULL,'1'),
 ('460201','海南省三亚市市辖区','海南省三亚市市辖区','3','460200','CN',NULL,'1'),
 ('469000','海南省省直辖县级行政单位','海南省省直辖县级行政单位','2','460000','CN',NULL,'1'),
 ('469001','海南省省直辖县级行政单位五指山市','海南省省直辖县级行政单位五指山市','3','469000','CN',NULL,'1'),
 ('469002','海南省省直辖县级行政单位琼海市','海南省省直辖县级行政单位琼海市','3','469000','CN',NULL,'1'),
 ('469003','海南省省直辖县级行政单位儋州市','海南省省直辖县级行政单位儋州市','3','469000','CN',NULL,'1'),
 ('469005','海南省省直辖县级行政单位文昌市','海南省省直辖县级行政单位文昌市','3','469000','CN',NULL,'1'),
 ('469006','海南省省直辖县级行政单位万宁市','海南省省直辖县级行政单位万宁市','3','469000','CN',NULL,'1'),
 ('469007','海南省省直辖县级行政单位东方市','海南省省直辖县级行政单位东方市','3','469000','CN',NULL,'1'),
 ('469025','海南省省直辖县级行政单位定安县','海南省省直辖县级行政单位定安县','3','469000','CN',NULL,'1'),
 ('469026','海南省省直辖县级行政单位屯昌县','海南省省直辖县级行政单位屯昌县','3','469000','CN',NULL,'1'),
 ('469027','海南省省直辖县级行政单位澄迈县','海南省省直辖县级行政单位澄迈县','3','469000','CN',NULL,'1'),
 ('469028','海南省省直辖县级行政单位临高县','海南省省直辖县级行政单位临高县','3','469000','CN',NULL,'1'),
 ('469030','海南省省直辖县级行政单位白沙黎族自治县','海南省省直辖县级行政单位白沙黎族自治县','3','469000','CN',NULL,'1'),
 ('469031','海南省省直辖县级行政单位昌江黎族自治县','海南省省直辖县级行政单位昌江黎族自治县','3','469000','CN',NULL,'1'),
 ('469033','海南省省直辖县级行政单位乐东黎族自治县','海南省省直辖县级行政单位乐东黎族自治县','3','469000','CN',NULL,'1'),
 ('469034','海南省省直辖县级行政单位陵水黎族自治县','海南省省直辖县级行政单位陵水黎族自治县','3','469000','CN',NULL,'1'),
 ('469035','海南省省直辖县级行政单位保亭黎族苗族自治县','海南省省直辖县级行政单位保亭黎族苗族自治县','3','469000','CN',NULL,'1'),
 ('469036','海南省省直辖县级行政单位琼中黎族苗族自治县','海南省省直辖县级行政单位琼中黎族苗族自治县','3','469000','CN',NULL,'1'),
 ('469037','海南省省直辖县级行政单位西沙群岛','海南省省直辖县级行政单位西沙群岛','3','469000','CN',NULL,'1'),
 ('469038','海南省省直辖县级行政单位南沙群岛','海南省省直辖县级行政单位南沙群岛','3','469000','CN',NULL,'1'),
 ('469039','海南省省直辖县级行政单位中沙群岛的岛礁及其海域','海南省省直辖县级行政单位中沙群岛的岛礁及其海域','3','469000','CN',NULL,'1'),
 ('500000','重庆市','重庆市','1','CN','CN',NULL,'1'),
 ('500100','重庆市市辖区','重庆市市辖区','2','500000','CN',NULL,'1'),
 ('500101','重庆市市辖区万州区','重庆市市辖区万州区','3','500100','CN',NULL,'1'),
 ('500102','重庆市市辖区涪陵区','重庆市市辖区涪陵区','3','500100','CN',NULL,'1'),
 ('500103','重庆市市辖区渝中区','重庆市市辖区渝中区','3','500100','CN',NULL,'1'),
 ('500104','重庆市市辖区大渡口区','重庆市市辖区大渡口区','3','500100','CN',NULL,'1'),
 ('500105','重庆市市辖区江北区','重庆市市辖区江北区','3','500100','CN',NULL,'1'),
 ('500106','重庆市市辖区沙坪坝区','重庆市市辖区沙坪坝区','3','500100','CN',NULL,'1');
INSERT INTO `pub_cant` (`CANT_CODE`,`CANT_NAME`,`SHORT_NAME`,`CANT_TYPE`,`SUPER_CODE`,`COUNTRY_CODE`,`CANT_NOTE`,`IN_USE`) VALUES 
 ('500107','重庆市市辖区九龙坡区','重庆市市辖区九龙坡区','3','500100','CN',NULL,'1'),
 ('500108','重庆市市辖区南岸区','重庆市市辖区南岸区','3','500100','CN',NULL,'1'),
 ('500109','重庆市市辖区北碚区','重庆市市辖区北碚区','3','500100','CN',NULL,'1'),
 ('500110','重庆市市辖区万盛区','重庆市市辖区万盛区','3','500100','CN',NULL,'1'),
 ('500111','重庆市市辖区双桥区','重庆市市辖区双桥区','3','500100','CN',NULL,'1'),
 ('500112','重庆市市辖区渝北区','重庆市市辖区渝北区','3','500100','CN',NULL,'1'),
 ('500113','重庆市市辖区巴南区','重庆市市辖区巴南区','3','500100','CN',NULL,'1'),
 ('500114','重庆市市辖区黔江区','重庆市市辖区黔江区','3','500100','CN',NULL,'1'),
 ('500115','重庆市市辖区长寿区','重庆市市辖区长寿区','3','500100','CN',NULL,'1'),
 ('500200','重庆市县','重庆市县','2','500000','CN',NULL,'1'),
 ('500222','重庆市县綦江县','重庆市县綦江县','3','500200','CN',NULL,'1'),
 ('500223','重庆市县潼南县','重庆市县潼南县','3','500200','CN',NULL,'1'),
 ('500224','重庆市县铜梁县','重庆市县铜梁县','3','500200','CN',NULL,'1'),
 ('500225','重庆市县大足县','重庆市县大足县','3','500200','CN',NULL,'1'),
 ('500226','重庆市县荣昌县','重庆市县荣昌县','3','500200','CN',NULL,'1'),
 ('500227','重庆市县璧山县','重庆市县璧山县','3','500200','CN',NULL,'1'),
 ('500228','重庆市县梁平县','重庆市县梁平县','3','500200','CN',NULL,'1'),
 ('500229','重庆市县城口县','重庆市县城口县','3','500200','CN',NULL,'1'),
 ('500230','重庆市县丰都县','重庆市县丰都县','3','500200','CN',NULL,'1'),
 ('500231','重庆市县垫江县','重庆市县垫江县','3','500200','CN',NULL,'1'),
 ('500232','重庆市县武隆县','重庆市县武隆县','3','500200','CN',NULL,'1'),
 ('500233','重庆市县忠县','重庆市县忠县','3','500200','CN',NULL,'1'),
 ('500234','重庆市县开县','重庆市县开县','3','500200','CN',NULL,'1'),
 ('500235','重庆市县云阳县','重庆市县云阳县','3','500200','CN',NULL,'1'),
 ('500236','重庆市县奉节县','重庆市县奉节县','3','500200','CN',NULL,'1'),
 ('500237','重庆市县巫山县','重庆市县巫山县','3','500200','CN',NULL,'1'),
 ('500238','重庆市县巫溪县','重庆市县巫溪县','3','500200','CN',NULL,'1'),
 ('500240','重庆市县石柱土家族自治县','重庆市县石柱土家族自治县','3','500200','CN',NULL,'1'),
 ('500241','重庆市县秀山土家族苗族自治县','重庆市县秀山土家族苗族自治县','3','500200','CN',NULL,'1'),
 ('500242','重庆市县酉阳土家族苗族自治县','重庆市县酉阳土家族苗族自治县','3','500200','CN',NULL,'1'),
 ('500243','重庆市县彭水苗族土家族自治县','重庆市县彭水苗族土家族自治县','3','500200','CN',NULL,'1'),
 ('500300','重庆市市','重庆市市','2','500000','CN',NULL,'1'),
 ('500381','重庆市市江津市','重庆市市江津市','3','500300','CN',NULL,'1'),
 ('500382','重庆市市合川市','重庆市市合川市','3','500300','CN',NULL,'1'),
 ('500383','重庆市市永川市','重庆市市永川市','3','500300','CN',NULL,'1'),
 ('500384','重庆市市南川市','重庆市市南川市','3','500300','CN',NULL,'1'),
 ('510000','四川省','四川省','1','CN','CN',NULL,'1'),
 ('510100','四川省成都市','四川省成都市','2','510000','CN',NULL,'1'),
 ('510101','四川省成都市市辖区','四川省成都市市辖区','3','510100','CN',NULL,'1'),
 ('510104','四川省成都市锦江区','四川省成都市锦江区','3','510100','CN',NULL,'1'),
 ('510105','四川省成都市青羊区','四川省成都市青羊区','3','510100','CN',NULL,'1'),
 ('510106','四川省成都市金牛区','四川省成都市金牛区','3','510100','CN',NULL,'1'),
 ('510107','四川省成都市武侯区','四川省成都市武侯区','3','510100','CN',NULL,'1'),
 ('510108','四川省成都市成华区','四川省成都市成华区','3','510100','CN',NULL,'1'),
 ('510112','四川省成都市龙泉驿区','四川省成都市龙泉驿区','3','510100','CN',NULL,'1'),
 ('510113','四川省成都市青白江区','四川省成都市青白江区','3','510100','CN',NULL,'1'),
 ('510114','四川省成都市新都区','四川省成都市新都区','3','510100','CN',NULL,'1'),
 ('510115','四川省成都市温江区','四川省成都市温江区','3','510100','CN',NULL,'1'),
 ('510121','四川省成都市金堂县','四川省成都市金堂县','3','510100','CN',NULL,'1'),
 ('510122','四川省成都市双流县','四川省成都市双流县','3','510100','CN',NULL,'1'),
 ('510124','四川省成都市郫县','四川省成都市郫县','3','510100','CN',NULL,'1'),
 ('510129','四川省成都市大邑县','四川省成都市大邑县','3','510100','CN',NULL,'1'),
 ('510131','四川省成都市蒲江县','四川省成都市蒲江县','3','510100','CN',NULL,'1'),
 ('510132','四川省成都市新津县','四川省成都市新津县','3','510100','CN',NULL,'1'),
 ('510181','四川省成都市都江堰市','四川省成都市都江堰市','3','510100','CN',NULL,'1'),
 ('510182','四川省成都市彭州市','四川省成都市彭州市','3','510100','CN',NULL,'1'),
 ('510183','四川省成都市邛崃市','四川省成都市邛崃市','3','510100','CN',NULL,'1'),
 ('510184','四川省成都市崇州市','四川省成都市崇州市','3','510100','CN',NULL,'1'),
 ('510300','四川省自贡市','四川省自贡市','2','510000','CN',NULL,'1'),
 ('510301','四川省自贡市市辖区','四川省自贡市市辖区','3','510300','CN',NULL,'1'),
 ('510302','四川省自贡市自流井区','四川省自贡市自流井区','3','510300','CN',NULL,'1'),
 ('510303','四川省自贡市贡井区','四川省自贡市贡井区','3','510300','CN',NULL,'1'),
 ('510304','四川省自贡市大安区','四川省自贡市大安区','3','510300','CN',NULL,'1'),
 ('510311','四川省自贡市沿滩区','四川省自贡市沿滩区','3','510300','CN',NULL,'1'),
 ('510321','四川省自贡市荣县','四川省自贡市荣县','3','510300','CN',NULL,'1'),
 ('510322','四川省自贡市富顺县','四川省自贡市富顺县','3','510300','CN',NULL,'1'),
 ('510400','四川省攀枝花市','四川省攀枝花市','2','510000','CN',NULL,'1'),
 ('510401','四川省攀枝花市市辖区','四川省攀枝花市市辖区','3','510400','CN',NULL,'1'),
 ('510402','四川省攀枝花市东区','四川省攀枝花市东区','3','510400','CN',NULL,'1'),
 ('510403','四川省攀枝花市西区','四川省攀枝花市西区','3','510400','CN',NULL,'1'),
 ('510411','四川省攀枝花市仁和区','四川省攀枝花市仁和区','3','510400','CN',NULL,'1'),
 ('510421','四川省攀枝花市米易县','四川省攀枝花市米易县','3','510400','CN',NULL,'1'),
 ('510422','四川省攀枝花市盐边县','四川省攀枝花市盐边县','3','510400','CN',NULL,'1'),
 ('510500','四川省泸州市','四川省泸州市','2','510000','CN',NULL,'1'),
 ('510501','四川省泸州市市辖区','四川省泸州市市辖区','3','510500','CN',NULL,'1'),
 ('510502','四川省泸州市江阳区','四川省泸州市江阳区','3','510500','CN',NULL,'1'),
 ('510503','四川省泸州市纳溪区','四川省泸州市纳溪区','3','510500','CN',NULL,'1'),
 ('510504','四川省泸州市龙马潭区','四川省泸州市龙马潭区','3','510500','CN',NULL,'1'),
 ('510521','四川省泸州市泸县','四川省泸州市泸县','3','510500','CN',NULL,'1'),
 ('510522','四川省泸州市合江县','四川省泸州市合江县','3','510500','CN',NULL,'1'),
 ('510524','四川省泸州市叙永县','四川省泸州市叙永县','3','510500','CN',NULL,'1'),
 ('510525','四川省泸州市古蔺县','四川省泸州市古蔺县','3','510500','CN',NULL,'1'),
 ('510600','四川省德阳市','四川省德阳市','2','510000','CN',NULL,'1'),
 ('510601','四川省德阳市市辖区','四川省德阳市市辖区','3','510600','CN',NULL,'1'),
 ('510603','四川省德阳市旌阳区','四川省德阳市旌阳区','3','510600','CN',NULL,'1'),
 ('510623','四川省德阳市中江县','四川省德阳市中江县','3','510600','CN',NULL,'1'),
 ('510626','四川省德阳市罗江县','四川省德阳市罗江县','3','510600','CN',NULL,'1'),
 ('510681','四川省德阳市广汉市','四川省德阳市广汉市','3','510600','CN',NULL,'1'),
 ('510682','四川省德阳市什邡市','四川省德阳市什邡市','3','510600','CN',NULL,'1'),
 ('510683','四川省德阳市绵竹市','四川省德阳市绵竹市','3','510600','CN',NULL,'1'),
 ('510700','四川省绵阳市','四川省绵阳市','2','510000','CN',NULL,'1'),
 ('510701','四川省绵阳市市辖区','四川省绵阳市市辖区','3','510700','CN',NULL,'1'),
 ('510703','四川省绵阳市涪城区','四川省绵阳市涪城区','3','510700','CN',NULL,'1'),
 ('510704','四川省绵阳市游仙区','四川省绵阳市游仙区','3','510700','CN',NULL,'1'),
 ('510722','四川省绵阳市三台县','四川省绵阳市三台县','3','510700','CN',NULL,'1'),
 ('510723','四川省绵阳市盐亭县','四川省绵阳市盐亭县','3','510700','CN',NULL,'1'),
 ('510724','四川省绵阳市安县','四川省绵阳市安县','3','510700','CN',NULL,'1'),
 ('510725','四川省绵阳市梓潼县','四川省绵阳市梓潼县','3','510700','CN',NULL,'1'),
 ('510726','四川省绵阳市北川羌族自治县','四川省绵阳市北川羌族自治县','3','510700','CN',NULL,'1'),
 ('510727','四川省绵阳市平武县','四川省绵阳市平武县','3','510700','CN',NULL,'1'),
 ('510781','四川省绵阳市江油市','四川省绵阳市江油市','3','510700','CN',NULL,'1'),
 ('510800','四川省广元市','四川省广元市','2','510000','CN',NULL,'1'),
 ('510801','四川省广元市市辖区','四川省广元市市辖区','3','510800','CN',NULL,'1'),
 ('510802','四川省广元市市中区','四川省广元市市中区','3','510800','CN',NULL,'1'),
 ('510811','四川省广元市元坝区','四川省广元市元坝区','3','510800','CN',NULL,'1'),
 ('510812','四川省广元市朝天区','四川省广元市朝天区','3','510800','CN',NULL,'1'),
 ('510821','四川省广元市旺苍县','四川省广元市旺苍县','3','510800','CN',NULL,'1'),
 ('510822','四川省广元市青川县','四川省广元市青川县','3','510800','CN',NULL,'1'),
 ('510823','四川省广元市剑阁县','四川省广元市剑阁县','3','510800','CN',NULL,'1'),
 ('510824','四川省广元市苍溪县','四川省广元市苍溪县','3','510800','CN',NULL,'1'),
 ('510900','四川省遂宁市','四川省遂宁市','2','510000','CN',NULL,'1'),
 ('510901','四川省遂宁市市辖区','四川省遂宁市市辖区','3','510900','CN',NULL,'1'),
 ('510903','四川省遂宁市船山区','四川省遂宁市船山区','3','510900','CN',NULL,'1'),
 ('510904','四川省遂宁市安居区','四川省遂宁市安居区','3','510900','CN',NULL,'1'),
 ('510921','四川省遂宁市蓬溪县','四川省遂宁市蓬溪县','3','510900','CN',NULL,'1'),
 ('510922','四川省遂宁市射洪县','四川省遂宁市射洪县','3','510900','CN',NULL,'1'),
 ('510923','四川省遂宁市大英县','四川省遂宁市大英县','3','510900','CN',NULL,'1'),
 ('511000','四川省内江市','四川省内江市','2','510000','CN',NULL,'1'),
 ('511001','四川省内江市市辖区','四川省内江市市辖区','3','511000','CN',NULL,'1'),
 ('511002','四川省内江市市中区','四川省内江市市中区','3','511000','CN',NULL,'1'),
 ('511011','四川省内江市东兴区','四川省内江市东兴区','3','511000','CN',NULL,'1'),
 ('511024','四川省内江市威远县','四川省内江市威远县','3','511000','CN',NULL,'1'),
 ('511025','四川省内江市资中县','四川省内江市资中县','3','511000','CN',NULL,'1'),
 ('511028','四川省内江市隆昌县','四川省内江市隆昌县','3','511000','CN',NULL,'1'),
 ('511100','四川省乐山市','四川省乐山市','2','510000','CN',NULL,'1'),
 ('511101','四川省乐山市市辖区','四川省乐山市市辖区','3','511100','CN',NULL,'1'),
 ('511102','四川省乐山市市中区','四川省乐山市市中区','3','511100','CN',NULL,'1'),
 ('511111','四川省乐山市沙湾区','四川省乐山市沙湾区','3','511100','CN',NULL,'1'),
 ('511112','四川省乐山市五通桥区','四川省乐山市五通桥区','3','511100','CN',NULL,'1'),
 ('511113','四川省乐山市金口河区','四川省乐山市金口河区','3','511100','CN',NULL,'1'),
 ('511123','四川省乐山市犍为县','四川省乐山市犍为县','3','511100','CN',NULL,'1'),
 ('511124','四川省乐山市井研县','四川省乐山市井研县','3','511100','CN',NULL,'1'),
 ('511126','四川省乐山市夹江县','四川省乐山市夹江县','3','511100','CN',NULL,'1'),
 ('511129','四川省乐山市沐川县','四川省乐山市沐川县','3','511100','CN',NULL,'1'),
 ('511132','四川省乐山市峨边彝族自治县','四川省乐山市峨边彝族自治县','3','511100','CN',NULL,'1'),
 ('511133','四川省乐山市马边彝族自治县','四川省乐山市马边彝族自治县','3','511100','CN',NULL,'1'),
 ('511181','四川省乐山市峨眉山市','四川省乐山市峨眉山市','3','511100','CN',NULL,'1'),
 ('511300','四川省南充市','四川省南充市','2','510000','CN',NULL,'1'),
 ('511301','四川省南充市市辖区','四川省南充市市辖区','3','511300','CN',NULL,'1'),
 ('511302','四川省南充市顺庆区','四川省南充市顺庆区','3','511300','CN',NULL,'1'),
 ('511303','四川省南充市高坪区','四川省南充市高坪区','3','511300','CN',NULL,'1'),
 ('511304','四川省南充市嘉陵区','四川省南充市嘉陵区','3','511300','CN',NULL,'1'),
 ('511321','四川省南充市南部县','四川省南充市南部县','3','511300','CN',NULL,'1'),
 ('511322','四川省南充市营山县','四川省南充市营山县','3','511300','CN',NULL,'1'),
 ('511323','四川省南充市蓬安县','四川省南充市蓬安县','3','511300','CN',NULL,'1'),
 ('511324','四川省南充市仪陇县','四川省南充市仪陇县','3','511300','CN',NULL,'1'),
 ('511325','四川省南充市西充县','四川省南充市西充县','3','511300','CN',NULL,'1'),
 ('511381','四川省南充市阆中市','四川省南充市阆中市','3','511300','CN',NULL,'1'),
 ('511400','四川省眉山市','四川省眉山市','2','510000','CN',NULL,'1'),
 ('511401','四川省眉山市市辖区','四川省眉山市市辖区','3','511400','CN',NULL,'1'),
 ('511402','四川省眉山市东坡区','四川省眉山市东坡区','3','511400','CN',NULL,'1'),
 ('511421','四川省眉山市仁寿县','四川省眉山市仁寿县','3','511400','CN',NULL,'1'),
 ('511422','四川省眉山市彭山县','四川省眉山市彭山县','3','511400','CN',NULL,'1'),
 ('511423','四川省眉山市洪雅县','四川省眉山市洪雅县','3','511400','CN',NULL,'1'),
 ('511424','四川省眉山市丹棱县','四川省眉山市丹棱县','3','511400','CN',NULL,'1'),
 ('511425','四川省眉山市青神县','四川省眉山市青神县','3','511400','CN',NULL,'1'),
 ('511500','四川省宜宾市','四川省宜宾市','2','510000','CN',NULL,'1'),
 ('511501','四川省宜宾市市辖区','四川省宜宾市市辖区','3','511500','CN',NULL,'1'),
 ('511502','四川省宜宾市翠屏区','四川省宜宾市翠屏区','3','511500','CN',NULL,'1'),
 ('511521','四川省宜宾市宜宾县','四川省宜宾市宜宾县','3','511500','CN',NULL,'1'),
 ('511522','四川省宜宾市南溪县','四川省宜宾市南溪县','3','511500','CN',NULL,'1'),
 ('511523','四川省宜宾市江安县','四川省宜宾市江安县','3','511500','CN',NULL,'1'),
 ('511524','四川省宜宾市长宁县','四川省宜宾市长宁县','3','511500','CN',NULL,'1'),
 ('511525','四川省宜宾市高县','四川省宜宾市高县','3','511500','CN',NULL,'1'),
 ('511526','四川省宜宾市珙县','四川省宜宾市珙县','3','511500','CN',NULL,'1'),
 ('511527','四川省宜宾市筠连县','四川省宜宾市筠连县','3','511500','CN',NULL,'1'),
 ('511528','四川省宜宾市兴文县','四川省宜宾市兴文县','3','511500','CN',NULL,'1'),
 ('511529','四川省宜宾市屏山县','四川省宜宾市屏山县','3','511500','CN',NULL,'1'),
 ('511600','四川省广安市','四川省广安市','2','510000','CN',NULL,'1'),
 ('511601','四川省广安市市辖区','四川省广安市市辖区','3','511600','CN',NULL,'1'),
 ('511602','四川省广安市广安区','四川省广安市广安区','3','511600','CN',NULL,'1'),
 ('511621','四川省广安市岳池县','四川省广安市岳池县','3','511600','CN',NULL,'1'),
 ('511622','四川省广安市武胜县','四川省广安市武胜县','3','511600','CN',NULL,'1'),
 ('511623','四川省广安市邻水县','四川省广安市邻水县','3','511600','CN',NULL,'1'),
 ('511681','四川省广安市华蓥市','四川省广安市华蓥市','3','511600','CN',NULL,'1'),
 ('511700','四川省达州市','四川省达州市','2','510000','CN',NULL,'1'),
 ('511701','四川省达州市市辖区','四川省达州市市辖区','3','511700','CN',NULL,'1'),
 ('511702','四川省达州市通川区','四川省达州市通川区','3','511700','CN',NULL,'1'),
 ('511721','四川省达州市达县','四川省达州市达县','3','511700','CN',NULL,'1'),
 ('511722','四川省达州市宣汉县','四川省达州市宣汉县','3','511700','CN',NULL,'1'),
 ('511723','四川省达州市开江县','四川省达州市开江县','3','511700','CN',NULL,'1'),
 ('511724','四川省达州市大竹县','四川省达州市大竹县','3','511700','CN',NULL,'1'),
 ('511725','四川省达州市渠县','四川省达州市渠县','3','511700','CN',NULL,'1'),
 ('511781','四川省达州市万源市','四川省达州市万源市','3','511700','CN',NULL,'1'),
 ('511800','四川省雅安市','四川省雅安市','2','510000','CN',NULL,'1'),
 ('511801','四川省雅安市市辖区','四川省雅安市市辖区','3','511800','CN',NULL,'1'),
 ('511802','四川省雅安市雨城区','四川省雅安市雨城区','3','511800','CN',NULL,'1'),
 ('511821','四川省雅安市名山县','四川省雅安市名山县','3','511800','CN',NULL,'1'),
 ('511822','四川省雅安市荥经县','四川省雅安市荥经县','3','511800','CN',NULL,'1'),
 ('511823','四川省雅安市汉源县','四川省雅安市汉源县','3','511800','CN',NULL,'1'),
 ('511824','四川省雅安市石棉县','四川省雅安市石棉县','3','511800','CN',NULL,'1'),
 ('511825','四川省雅安市天全县','四川省雅安市天全县','3','511800','CN',NULL,'1'),
 ('511826','四川省雅安市芦山县','四川省雅安市芦山县','3','511800','CN',NULL,'1'),
 ('511827','四川省雅安市宝兴县','四川省雅安市宝兴县','3','511800','CN',NULL,'1'),
 ('511900','四川省巴中市','四川省巴中市','2','510000','CN',NULL,'1'),
 ('511901','四川省巴中市市辖区','四川省巴中市市辖区','3','511900','CN',NULL,'1'),
 ('511902','四川省巴中市巴州区','四川省巴中市巴州区','3','511900','CN',NULL,'1'),
 ('511921','四川省巴中市通江县','四川省巴中市通江县','3','511900','CN',NULL,'1'),
 ('511922','四川省巴中市南江县','四川省巴中市南江县','3','511900','CN',NULL,'1'),
 ('511923','四川省巴中市平昌县','四川省巴中市平昌县','3','511900','CN',NULL,'1'),
 ('512000','四川省资阳市','四川省资阳市','2','510000','CN',NULL,'1'),
 ('512001','四川省资阳市市辖区','四川省资阳市市辖区','3','512000','CN',NULL,'1'),
 ('512002','四川省资阳市雁江区','四川省资阳市雁江区','3','512000','CN',NULL,'1'),
 ('512021','四川省资阳市安岳县','四川省资阳市安岳县','3','512000','CN',NULL,'1'),
 ('512022','四川省资阳市乐至县','四川省资阳市乐至县','3','512000','CN',NULL,'1'),
 ('512081','四川省资阳市简阳市','四川省资阳市简阳市','3','512000','CN',NULL,'1'),
 ('513200','四川省阿坝藏族羌族自治州','四川省阿坝藏族羌族自治州','2','510000','CN',NULL,'1'),
 ('513221','四川省阿坝藏族羌族自治州汶川县','四川省阿坝藏族羌族自治州汶川县','3','513200','CN',NULL,'1'),
 ('513222','四川省阿坝藏族羌族自治州理县','四川省阿坝藏族羌族自治州理县','3','513200','CN',NULL,'1'),
 ('513223','四川省阿坝藏族羌族自治州茂县','四川省阿坝藏族羌族自治州茂县','3','513200','CN',NULL,'1'),
 ('513224','四川省阿坝藏族羌族自治州松潘县','四川省阿坝藏族羌族自治州松潘县','3','513200','CN',NULL,'1'),
 ('513225','四川省阿坝藏族羌族自治州九寨沟县','四川省阿坝藏族羌族自治州九寨沟县','3','513200','CN',NULL,'1'),
 ('513226','四川省阿坝藏族羌族自治州金川县','四川省阿坝藏族羌族自治州金川县','3','513200','CN',NULL,'1'),
 ('513227','四川省阿坝藏族羌族自治州小金县','四川省阿坝藏族羌族自治州小金县','3','513200','CN',NULL,'1'),
 ('513228','四川省阿坝藏族羌族自治州黑水县','四川省阿坝藏族羌族自治州黑水县','3','513200','CN',NULL,'1'),
 ('513229','四川省阿坝藏族羌族自治州马尔康县','四川省阿坝藏族羌族自治州马尔康县','3','513200','CN',NULL,'1'),
 ('513230','四川省阿坝藏族羌族自治州壤塘县','四川省阿坝藏族羌族自治州壤塘县','3','513200','CN',NULL,'1'),
 ('513231','四川省阿坝藏族羌族自治州阿坝县','四川省阿坝藏族羌族自治州阿坝县','3','513200','CN',NULL,'1'),
 ('513232','四川省阿坝藏族羌族自治州若尔盖县','四川省阿坝藏族羌族自治州若尔盖县','3','513200','CN',NULL,'1'),
 ('513233','四川省阿坝藏族羌族自治州红原县','四川省阿坝藏族羌族自治州红原县','3','513200','CN',NULL,'1'),
 ('513300','四川省甘孜藏族自治州','四川省甘孜藏族自治州','2','510000','CN',NULL,'1'),
 ('513321','四川省甘孜藏族自治州康定县','四川省甘孜藏族自治州康定县','3','513300','CN',NULL,'1'),
 ('513322','四川省甘孜藏族自治州泸定县','四川省甘孜藏族自治州泸定县','3','513300','CN',NULL,'1'),
 ('513323','四川省甘孜藏族自治州丹巴县','四川省甘孜藏族自治州丹巴县','3','513300','CN',NULL,'1'),
 ('513324','四川省甘孜藏族自治州九龙县','四川省甘孜藏族自治州九龙县','3','513300','CN',NULL,'1'),
 ('513325','四川省甘孜藏族自治州雅江县','四川省甘孜藏族自治州雅江县','3','513300','CN',NULL,'1'),
 ('513326','四川省甘孜藏族自治州道孚县','四川省甘孜藏族自治州道孚县','3','513300','CN',NULL,'1'),
 ('513327','四川省甘孜藏族自治州炉霍县','四川省甘孜藏族自治州炉霍县','3','513300','CN',NULL,'1'),
 ('513328','四川省甘孜藏族自治州甘孜县','四川省甘孜藏族自治州甘孜县','3','513300','CN',NULL,'1'),
 ('513329','四川省甘孜藏族自治州新龙县','四川省甘孜藏族自治州新龙县','3','513300','CN',NULL,'1'),
 ('513330','四川省甘孜藏族自治州德格县','四川省甘孜藏族自治州德格县','3','513300','CN',NULL,'1'),
 ('513331','四川省甘孜藏族自治州白玉县','四川省甘孜藏族自治州白玉县','3','513300','CN',NULL,'1'),
 ('513332','四川省甘孜藏族自治州石渠县','四川省甘孜藏族自治州石渠县','3','513300','CN',NULL,'1'),
 ('513333','四川省甘孜藏族自治州色达县','四川省甘孜藏族自治州色达县','3','513300','CN',NULL,'1'),
 ('513334','四川省甘孜藏族自治州理塘县','四川省甘孜藏族自治州理塘县','3','513300','CN',NULL,'1'),
 ('513335','四川省甘孜藏族自治州巴塘县','四川省甘孜藏族自治州巴塘县','3','513300','CN',NULL,'1'),
 ('513336','四川省甘孜藏族自治州乡城县','四川省甘孜藏族自治州乡城县','3','513300','CN',NULL,'1'),
 ('513337','四川省甘孜藏族自治州稻城县','四川省甘孜藏族自治州稻城县','3','513300','CN',NULL,'1'),
 ('513338','四川省甘孜藏族自治州得荣县','四川省甘孜藏族自治州得荣县','3','513300','CN',NULL,'1'),
 ('513400','四川省凉山彝族自治州','四川省凉山彝族自治州','2','510000','CN',NULL,'1'),
 ('513401','四川省凉山彝族自治州西昌市','四川省凉山彝族自治州西昌市','3','513400','CN',NULL,'1'),
 ('513422','四川省凉山彝族自治州木里藏族自治县','四川省凉山彝族自治州木里藏族自治县','3','513400','CN',NULL,'1'),
 ('513423','四川省凉山彝族自治州盐源县','四川省凉山彝族自治州盐源县','3','513400','CN',NULL,'1'),
 ('513424','四川省凉山彝族自治州德昌县','四川省凉山彝族自治州德昌县','3','513400','CN',NULL,'1'),
 ('513425','四川省凉山彝族自治州会理县','四川省凉山彝族自治州会理县','3','513400','CN',NULL,'1'),
 ('513426','四川省凉山彝族自治州会东县','四川省凉山彝族自治州会东县','3','513400','CN',NULL,'1'),
 ('513427','四川省凉山彝族自治州宁南县','四川省凉山彝族自治州宁南县','3','513400','CN',NULL,'1'),
 ('513428','四川省凉山彝族自治州普格县','四川省凉山彝族自治州普格县','3','513400','CN',NULL,'1'),
 ('513429','四川省凉山彝族自治州布拖县','四川省凉山彝族自治州布拖县','3','513400','CN',NULL,'1'),
 ('513430','四川省凉山彝族自治州金阳县','四川省凉山彝族自治州金阳县','3','513400','CN',NULL,'1'),
 ('513431','四川省凉山彝族自治州昭觉县','四川省凉山彝族自治州昭觉县','3','513400','CN',NULL,'1'),
 ('513432','四川省凉山彝族自治州喜德县','四川省凉山彝族自治州喜德县','3','513400','CN',NULL,'1'),
 ('513433','四川省凉山彝族自治州冕宁县','四川省凉山彝族自治州冕宁县','3','513400','CN',NULL,'1'),
 ('513434','四川省凉山彝族自治州越西县','四川省凉山彝族自治州越西县','3','513400','CN',NULL,'1'),
 ('513435','四川省凉山彝族自治州甘洛县','四川省凉山彝族自治州甘洛县','3','513400','CN',NULL,'1'),
 ('513436','四川省凉山彝族自治州美姑县','四川省凉山彝族自治州美姑县','3','513400','CN',NULL,'1'),
 ('513437','四川省凉山彝族自治州雷波县','四川省凉山彝族自治州雷波县','3','513400','CN',NULL,'1'),
 ('520000','贵州省','贵州省','1','CN','CN',NULL,'1'),
 ('520100','贵州省贵阳市','贵州省贵阳市','2','520000','CN',NULL,'1'),
 ('520101','贵州省贵阳市市辖区','贵州省贵阳市市辖区','3','520100','CN',NULL,'1'),
 ('520102','贵州省贵阳市南明区','贵州省贵阳市南明区','3','520100','CN',NULL,'1'),
 ('520103','贵州省贵阳市云岩区','贵州省贵阳市云岩区','3','520100','CN',NULL,'1'),
 ('520111','贵州省贵阳市花溪区','贵州省贵阳市花溪区','3','520100','CN',NULL,'1'),
 ('520112','贵州省贵阳市乌当区','贵州省贵阳市乌当区','3','520100','CN',NULL,'1'),
 ('520113','贵州省贵阳市白云区','贵州省贵阳市白云区','3','520100','CN',NULL,'1'),
 ('520114','贵州省贵阳市小河区','贵州省贵阳市小河区','3','520100','CN',NULL,'1'),
 ('520121','贵州省贵阳市开阳县','贵州省贵阳市开阳县','3','520100','CN',NULL,'1'),
 ('520122','贵州省贵阳市息烽县','贵州省贵阳市息烽县','3','520100','CN',NULL,'1'),
 ('520123','贵州省贵阳市修文县','贵州省贵阳市修文县','3','520100','CN',NULL,'1'),
 ('520181','贵州省贵阳市清镇市','贵州省贵阳市清镇市','3','520100','CN',NULL,'1'),
 ('520200','贵州省六盘水市','贵州省六盘水市','2','520000','CN',NULL,'1'),
 ('520201','贵州省六盘水市钟山区','贵州省六盘水市钟山区','3','520200','CN',NULL,'1'),
 ('520203','贵州省六盘水市六枝特区','贵州省六盘水市六枝特区','3','520200','CN',NULL,'1'),
 ('520221','贵州省六盘水市水城县','贵州省六盘水市水城县','3','520200','CN',NULL,'1'),
 ('520222','贵州省六盘水市盘县','贵州省六盘水市盘县','3','520200','CN',NULL,'1'),
 ('520300','贵州省遵义市','贵州省遵义市','2','520000','CN',NULL,'1'),
 ('520301','贵州省遵义市市辖区','贵州省遵义市市辖区','3','520300','CN',NULL,'1'),
 ('520302','贵州省遵义市红花岗区','贵州省遵义市红花岗区','3','520300','CN',NULL,'1'),
 ('520303','贵州省遵义市汇川区','贵州省遵义市汇川区','3','520300','CN',NULL,'1'),
 ('520321','贵州省遵义市遵义县','贵州省遵义市遵义县','3','520300','CN',NULL,'1'),
 ('520322','贵州省遵义市桐梓县','贵州省遵义市桐梓县','3','520300','CN',NULL,'1'),
 ('520323','贵州省遵义市绥阳县','贵州省遵义市绥阳县','3','520300','CN',NULL,'1'),
 ('520324','贵州省遵义市正安县','贵州省遵义市正安县','3','520300','CN',NULL,'1'),
 ('520325','贵州省遵义市道真仡佬族苗族自治县','贵州省遵义市道真仡佬族苗族自治县','3','520300','CN',NULL,'1'),
 ('520326','贵州省遵义市务川仡佬族苗族自治县','贵州省遵义市务川仡佬族苗族自治县','3','520300','CN',NULL,'1'),
 ('520327','贵州省遵义市凤冈县','贵州省遵义市凤冈县','3','520300','CN',NULL,'1'),
 ('520328','贵州省遵义市湄潭县','贵州省遵义市湄潭县','3','520300','CN',NULL,'1'),
 ('520329','贵州省遵义市余庆县','贵州省遵义市余庆县','3','520300','CN',NULL,'1'),
 ('520330','贵州省遵义市习水县','贵州省遵义市习水县','3','520300','CN',NULL,'1'),
 ('520381','贵州省遵义市赤水市','贵州省遵义市赤水市','3','520300','CN',NULL,'1'),
 ('520382','贵州省遵义市仁怀市','贵州省遵义市仁怀市','3','520300','CN',NULL,'1'),
 ('520400','贵州省安顺市','贵州省安顺市','2','520000','CN',NULL,'1'),
 ('520401','贵州省安顺市市辖区','贵州省安顺市市辖区','3','520400','CN',NULL,'1'),
 ('520402','贵州省安顺市西秀区','贵州省安顺市西秀区','3','520400','CN',NULL,'1'),
 ('520421','贵州省安顺市平坝县','贵州省安顺市平坝县','3','520400','CN',NULL,'1'),
 ('520422','贵州省安顺市普定县','贵州省安顺市普定县','3','520400','CN',NULL,'1'),
 ('520423','贵州省安顺市镇宁布依族苗族自治县','贵州省安顺市镇宁布依族苗族自治县','3','520400','CN',NULL,'1'),
 ('520424','贵州省安顺市关岭布依族苗族自治县','贵州省安顺市关岭布依族苗族自治县','3','520400','CN',NULL,'1'),
 ('520425','贵州省安顺市紫云苗族布依族自治县','贵州省安顺市紫云苗族布依族自治县','3','520400','CN',NULL,'1'),
 ('522200','贵州省铜仁地区','贵州省铜仁地区','2','520000','CN',NULL,'1'),
 ('522201','贵州省铜仁地区铜仁市','贵州省铜仁地区铜仁市','3','522200','CN',NULL,'1'),
 ('522222','贵州省铜仁地区江口县','贵州省铜仁地区江口县','3','522200','CN',NULL,'1'),
 ('522223','贵州省铜仁地区玉屏侗族自治县','贵州省铜仁地区玉屏侗族自治县','3','522200','CN',NULL,'1'),
 ('522224','贵州省铜仁地区石阡县','贵州省铜仁地区石阡县','3','522200','CN',NULL,'1'),
 ('522225','贵州省铜仁地区思南县','贵州省铜仁地区思南县','3','522200','CN',NULL,'1'),
 ('522226','贵州省铜仁地区印江土家族苗族自治县','贵州省铜仁地区印江土家族苗族自治县','3','522200','CN',NULL,'1'),
 ('522227','贵州省铜仁地区德江县','贵州省铜仁地区德江县','3','522200','CN',NULL,'1'),
 ('522228','贵州省铜仁地区沿河土家族自治县','贵州省铜仁地区沿河土家族自治县','3','522200','CN',NULL,'1'),
 ('522229','贵州省铜仁地区松桃苗族自治县','贵州省铜仁地区松桃苗族自治县','3','522200','CN',NULL,'1'),
 ('522230','贵州省铜仁地区万山特区','贵州省铜仁地区万山特区','3','522200','CN',NULL,'1'),
 ('522300','贵州省黔西南布依族苗族自治州','贵州省黔西南布依族苗族自治州','2','520000','CN',NULL,'1'),
 ('522301','贵州省黔西南布依族苗族自治州兴义市','贵州省黔西南布依族苗族自治州兴义市','3','522300','CN',NULL,'1'),
 ('522322','贵州省黔西南布依族苗族自治州兴仁县','贵州省黔西南布依族苗族自治州兴仁县','3','522300','CN',NULL,'1'),
 ('522323','贵州省黔西南布依族苗族自治州普安县','贵州省黔西南布依族苗族自治州普安县','3','522300','CN',NULL,'1'),
 ('522324','贵州省黔西南布依族苗族自治州晴隆县','贵州省黔西南布依族苗族自治州晴隆县','3','522300','CN',NULL,'1'),
 ('522325','贵州省黔西南布依族苗族自治州贞丰县','贵州省黔西南布依族苗族自治州贞丰县','3','522300','CN',NULL,'1'),
 ('522326','贵州省黔西南布依族苗族自治州望谟县','贵州省黔西南布依族苗族自治州望谟县','3','522300','CN',NULL,'1'),
 ('522327','贵州省黔西南布依族苗族自治州册亨县','贵州省黔西南布依族苗族自治州册亨县','3','522300','CN',NULL,'1'),
 ('522328','贵州省黔西南布依族苗族自治州安龙县','贵州省黔西南布依族苗族自治州安龙县','3','522300','CN',NULL,'1'),
 ('522400','贵州省毕节地区','贵州省毕节地区','2','520000','CN',NULL,'1'),
 ('522401','贵州省毕节地区毕节市','贵州省毕节地区毕节市','3','522400','CN',NULL,'1'),
 ('522422','贵州省毕节地区大方县','贵州省毕节地区大方县','3','522400','CN',NULL,'1'),
 ('522423','贵州省毕节地区黔西县','贵州省毕节地区黔西县','3','522400','CN',NULL,'1'),
 ('522424','贵州省毕节地区金沙县','贵州省毕节地区金沙县','3','522400','CN',NULL,'1'),
 ('522425','贵州省毕节地区织金县','贵州省毕节地区织金县','3','522400','CN',NULL,'1'),
 ('522426','贵州省毕节地区纳雍县','贵州省毕节地区纳雍县','3','522400','CN',NULL,'1'),
 ('522427','贵州省毕节地区威宁彝族回族苗族自治县','贵州省毕节地区威宁彝族回族苗族自治县','3','522400','CN',NULL,'1'),
 ('522428','贵州省毕节地区赫章县','贵州省毕节地区赫章县','3','522400','CN',NULL,'1'),
 ('522600','贵州省黔东南苗族侗族自治州','贵州省黔东南苗族侗族自治州','2','520000','CN',NULL,'1'),
 ('522601','贵州省黔东南苗族侗族自治州凯里市','贵州省黔东南苗族侗族自治州凯里市','3','522600','CN',NULL,'1'),
 ('522622','贵州省黔东南苗族侗族自治州黄平县','贵州省黔东南苗族侗族自治州黄平县','3','522600','CN',NULL,'1'),
 ('522623','贵州省黔东南苗族侗族自治州施秉县','贵州省黔东南苗族侗族自治州施秉县','3','522600','CN',NULL,'1'),
 ('522624','贵州省黔东南苗族侗族自治州三穗县','贵州省黔东南苗族侗族自治州三穗县','3','522600','CN',NULL,'1'),
 ('522625','贵州省黔东南苗族侗族自治州镇远县','贵州省黔东南苗族侗族自治州镇远县','3','522600','CN',NULL,'1'),
 ('522626','贵州省黔东南苗族侗族自治州岑巩县','贵州省黔东南苗族侗族自治州岑巩县','3','522600','CN',NULL,'1'),
 ('522627','贵州省黔东南苗族侗族自治州天柱县','贵州省黔东南苗族侗族自治州天柱县','3','522600','CN',NULL,'1'),
 ('522628','贵州省黔东南苗族侗族自治州锦屏县','贵州省黔东南苗族侗族自治州锦屏县','3','522600','CN',NULL,'1'),
 ('522629','贵州省黔东南苗族侗族自治州剑河县','贵州省黔东南苗族侗族自治州剑河县','3','522600','CN',NULL,'1'),
 ('522630','贵州省黔东南苗族侗族自治州台江县','贵州省黔东南苗族侗族自治州台江县','3','522600','CN',NULL,'1'),
 ('522631','贵州省黔东南苗族侗族自治州黎平县','贵州省黔东南苗族侗族自治州黎平县','3','522600','CN',NULL,'1'),
 ('522632','贵州省黔东南苗族侗族自治州榕江县','贵州省黔东南苗族侗族自治州榕江县','3','522600','CN',NULL,'1'),
 ('522633','贵州省黔东南苗族侗族自治州从江县','贵州省黔东南苗族侗族自治州从江县','3','522600','CN',NULL,'1'),
 ('522634','贵州省黔东南苗族侗族自治州雷山县','贵州省黔东南苗族侗族自治州雷山县','3','522600','CN',NULL,'1'),
 ('522635','贵州省黔东南苗族侗族自治州麻江县','贵州省黔东南苗族侗族自治州麻江县','3','522600','CN',NULL,'1'),
 ('522636','贵州省黔东南苗族侗族自治州丹寨县','贵州省黔东南苗族侗族自治州丹寨县','3','522600','CN',NULL,'1'),
 ('522700','贵州省黔南布依族苗族自治州','贵州省黔南布依族苗族自治州','2','520000','CN',NULL,'1'),
 ('522701','贵州省黔南布依族苗族自治州都匀市','贵州省黔南布依族苗族自治州都匀市','3','522700','CN',NULL,'1'),
 ('522702','贵州省黔南布依族苗族自治州福泉市','贵州省黔南布依族苗族自治州福泉市','3','522700','CN',NULL,'1'),
 ('522722','贵州省黔南布依族苗族自治州荔波县','贵州省黔南布依族苗族自治州荔波县','3','522700','CN',NULL,'1'),
 ('522723','贵州省黔南布依族苗族自治州贵定县','贵州省黔南布依族苗族自治州贵定县','3','522700','CN',NULL,'1'),
 ('522725','贵州省黔南布依族苗族自治州瓮安县','贵州省黔南布依族苗族自治州瓮安县','3','522700','CN',NULL,'1'),
 ('522726','贵州省黔南布依族苗族自治州独山县','贵州省黔南布依族苗族自治州独山县','3','522700','CN',NULL,'1'),
 ('522727','贵州省黔南布依族苗族自治州平塘县','贵州省黔南布依族苗族自治州平塘县','3','522700','CN',NULL,'1'),
 ('522728','贵州省黔南布依族苗族自治州罗甸县','贵州省黔南布依族苗族自治州罗甸县','3','522700','CN',NULL,'1'),
 ('522729','贵州省黔南布依族苗族自治州长顺县','贵州省黔南布依族苗族自治州长顺县','3','522700','CN',NULL,'1'),
 ('522730','贵州省黔南布依族苗族自治州龙里县','贵州省黔南布依族苗族自治州龙里县','3','522700','CN',NULL,'1'),
 ('522731','贵州省黔南布依族苗族自治州惠水县','贵州省黔南布依族苗族自治州惠水县','3','522700','CN',NULL,'1'),
 ('522732','贵州省黔南布依族苗族自治州三都水族自治县','贵州省黔南布依族苗族自治州三都水族自治县','3','522700','CN',NULL,'1'),
 ('530000','云南省','云南省','1','CN','CN',NULL,'1'),
 ('530100','云南省昆明市','云南省昆明市','2','530000','CN',NULL,'1'),
 ('530101','云南省昆明市市辖区','云南省昆明市市辖区','3','530100','CN',NULL,'1'),
 ('530102','云南省昆明市五华区','云南省昆明市五华区','3','530100','CN',NULL,'1'),
 ('530103','云南省昆明市盘龙区','云南省昆明市盘龙区','3','530100','CN',NULL,'1'),
 ('530111','云南省昆明市官渡区','云南省昆明市官渡区','3','530100','CN',NULL,'1'),
 ('530112','云南省昆明市西山区','云南省昆明市西山区','3','530100','CN',NULL,'1'),
 ('530113','云南省昆明市东川区','云南省昆明市东川区','3','530100','CN',NULL,'1'),
 ('530121','云南省昆明市呈贡县','云南省昆明市呈贡县','3','530100','CN',NULL,'1'),
 ('530122','云南省昆明市晋宁县','云南省昆明市晋宁县','3','530100','CN',NULL,'1'),
 ('530124','云南省昆明市富民县','云南省昆明市富民县','3','530100','CN',NULL,'1'),
 ('530125','云南省昆明市宜良县','云南省昆明市宜良县','3','530100','CN',NULL,'1'),
 ('530126','云南省昆明市石林彝族自治县','云南省昆明市石林彝族自治县','3','530100','CN',NULL,'1'),
 ('530127','云南省昆明市嵩明县','云南省昆明市嵩明县','3','530100','CN',NULL,'1'),
 ('530128','云南省昆明市禄劝彝族苗族自治县','云南省昆明市禄劝彝族苗族自治县','3','530100','CN',NULL,'1'),
 ('530129','云南省昆明市寻甸回族彝族自治县','云南省昆明市寻甸回族彝族自治县','3','530100','CN',NULL,'1'),
 ('530181','云南省昆明市安宁市','云南省昆明市安宁市','3','530100','CN',NULL,'1'),
 ('530300','云南省曲靖市','云南省曲靖市','2','530000','CN',NULL,'1'),
 ('530301','云南省曲靖市市辖区','云南省曲靖市市辖区','3','530300','CN',NULL,'1'),
 ('530302','云南省曲靖市麒麟区','云南省曲靖市麒麟区','3','530300','CN',NULL,'1'),
 ('530321','云南省曲靖市马龙县','云南省曲靖市马龙县','3','530300','CN',NULL,'1'),
 ('530322','云南省曲靖市陆良县','云南省曲靖市陆良县','3','530300','CN',NULL,'1'),
 ('530323','云南省曲靖市师宗县','云南省曲靖市师宗县','3','530300','CN',NULL,'1'),
 ('530324','云南省曲靖市罗平县','云南省曲靖市罗平县','3','530300','CN',NULL,'1'),
 ('530325','云南省曲靖市富源县','云南省曲靖市富源县','3','530300','CN',NULL,'1'),
 ('530326','云南省曲靖市会泽县','云南省曲靖市会泽县','3','530300','CN',NULL,'1'),
 ('530328','云南省曲靖市沾益县','云南省曲靖市沾益县','3','530300','CN',NULL,'1'),
 ('530381','云南省曲靖市宣威市','云南省曲靖市宣威市','3','530300','CN',NULL,'1'),
 ('530400','云南省玉溪市','云南省玉溪市','2','530000','CN',NULL,'1'),
 ('530401','云南省玉溪市市辖区','云南省玉溪市市辖区','3','530400','CN',NULL,'1'),
 ('530402','云南省玉溪市红塔区','云南省玉溪市红塔区','3','530400','CN',NULL,'1'),
 ('530421','云南省玉溪市江川县','云南省玉溪市江川县','3','530400','CN',NULL,'1'),
 ('530422','云南省玉溪市澄江县','云南省玉溪市澄江县','3','530400','CN',NULL,'1'),
 ('530423','云南省玉溪市通海县','云南省玉溪市通海县','3','530400','CN',NULL,'1'),
 ('530424','云南省玉溪市华宁县','云南省玉溪市华宁县','3','530400','CN',NULL,'1'),
 ('530425','云南省玉溪市易门县','云南省玉溪市易门县','3','530400','CN',NULL,'1'),
 ('530426','云南省玉溪市峨山彝族自治县','云南省玉溪市峨山彝族自治县','3','530400','CN',NULL,'1'),
 ('530427','云南省玉溪市新平彝族傣族自治县','云南省玉溪市新平彝族傣族自治县','3','530400','CN',NULL,'1'),
 ('530428','云南省玉溪市元江哈尼族彝族傣族自治县','云南省玉溪市元江哈尼族彝族傣族自治县','3','530400','CN',NULL,'1'),
 ('530500','云南省保山市','云南省保山市','2','530000','CN',NULL,'1'),
 ('530501','云南省保山市市辖区','云南省保山市市辖区','3','530500','CN',NULL,'1'),
 ('530502','云南省保山市隆阳区','云南省保山市隆阳区','3','530500','CN',NULL,'1'),
 ('530521','云南省保山市施甸县','云南省保山市施甸县','3','530500','CN',NULL,'1'),
 ('530522','云南省保山市腾冲县','云南省保山市腾冲县','3','530500','CN',NULL,'1'),
 ('530523','云南省保山市龙陵县','云南省保山市龙陵县','3','530500','CN',NULL,'1'),
 ('530524','云南省保山市昌宁县','云南省保山市昌宁县','3','530500','CN',NULL,'1'),
 ('530600','云南省昭通市','云南省昭通市','2','530000','CN',NULL,'1'),
 ('530601','云南省昭通市市辖区','云南省昭通市市辖区','3','530600','CN',NULL,'1'),
 ('530602','云南省昭通市昭阳区','云南省昭通市昭阳区','3','530600','CN',NULL,'1'),
 ('530621','云南省昭通市鲁甸县','云南省昭通市鲁甸县','3','530600','CN',NULL,'1'),
 ('530622','云南省昭通市巧家县','云南省昭通市巧家县','3','530600','CN',NULL,'1'),
 ('530623','云南省昭通市盐津县','云南省昭通市盐津县','3','530600','CN',NULL,'1'),
 ('530624','云南省昭通市大关县','云南省昭通市大关县','3','530600','CN',NULL,'1'),
 ('530625','云南省昭通市永善县','云南省昭通市永善县','3','530600','CN',NULL,'1'),
 ('530626','云南省昭通市绥江县','云南省昭通市绥江县','3','530600','CN',NULL,'1'),
 ('530627','云南省昭通市镇雄县','云南省昭通市镇雄县','3','530600','CN',NULL,'1'),
 ('530628','云南省昭通市彝良县','云南省昭通市彝良县','3','530600','CN',NULL,'1'),
 ('530629','云南省昭通市威信县','云南省昭通市威信县','3','530600','CN',NULL,'1'),
 ('530630','云南省昭通市水富县','云南省昭通市水富县','3','530600','CN',NULL,'1'),
 ('530700','云南省丽江市','云南省丽江市','2','530000','CN',NULL,'1'),
 ('530701','云南省丽江市市辖区','云南省丽江市市辖区','3','530700','CN',NULL,'1'),
 ('530702','云南省丽江市古城区','云南省丽江市古城区','3','530700','CN',NULL,'1'),
 ('530721','云南省丽江市玉龙纳西族自治县','云南省丽江市玉龙纳西族自治县','3','530700','CN',NULL,'1'),
 ('530722','云南省丽江市永胜县','云南省丽江市永胜县','3','530700','CN',NULL,'1'),
 ('530723','云南省丽江市华坪县','云南省丽江市华坪县','3','530700','CN',NULL,'1'),
 ('530724','云南省丽江市宁蒗彝族自治县','云南省丽江市宁蒗彝族自治县','3','530700','CN',NULL,'1'),
 ('530800','云南省思茅市','云南省思茅市','2','530000','CN',NULL,'1'),
 ('530801','云南省思茅市市辖区','云南省思茅市市辖区','3','530800','CN',NULL,'1'),
 ('530802','云南省思茅市翠云区','云南省思茅市翠云区','3','530800','CN',NULL,'1'),
 ('530821','云南省思茅市普洱哈尼族彝族自治县','云南省思茅市普洱哈尼族彝族自治县','3','530800','CN',NULL,'1'),
 ('530822','云南省思茅市墨江哈尼族自治县','云南省思茅市墨江哈尼族自治县','3','530800','CN',NULL,'1'),
 ('530823','云南省思茅市景东彝族自治县','云南省思茅市景东彝族自治县','3','530800','CN',NULL,'1'),
 ('530824','云南省思茅市景谷傣族彝族自治县','云南省思茅市景谷傣族彝族自治县','3','530800','CN',NULL,'1'),
 ('530825','云南省思茅市镇沅彝族哈尼族拉祜族自治县','云南省思茅市镇沅彝族哈尼族拉祜族自治县','3','530800','CN',NULL,'1'),
 ('530826','云南省思茅市江城哈尼族彝族自治县','云南省思茅市江城哈尼族彝族自治县','3','530800','CN',NULL,'1'),
 ('530827','云南省思茅市孟连傣族拉祜族佤族自治县','云南省思茅市孟连傣族拉祜族佤族自治县','3','530800','CN',NULL,'1'),
 ('530828','云南省思茅市澜沧拉祜族自治县','云南省思茅市澜沧拉祜族自治县','3','530800','CN',NULL,'1'),
 ('530829','云南省思茅市西盟佤族自治县','云南省思茅市西盟佤族自治县','3','530800','CN',NULL,'1'),
 ('530900','云南省临沧市','云南省临沧市','2','530000','CN',NULL,'1'),
 ('530901','云南省临沧市市辖区','云南省临沧市市辖区','3','530900','CN',NULL,'1'),
 ('530902','云南省临沧市临翔区','云南省临沧市临翔区','3','530900','CN',NULL,'1'),
 ('530921','云南省临沧市凤庆县','云南省临沧市凤庆县','3','530900','CN',NULL,'1'),
 ('530922','云南省临沧市云县','云南省临沧市云县','3','530900','CN',NULL,'1'),
 ('530923','云南省临沧市永德县','云南省临沧市永德县','3','530900','CN',NULL,'1'),
 ('530924','云南省临沧市镇康县','云南省临沧市镇康县','3','530900','CN',NULL,'1'),
 ('530925','云南省临沧市双江拉祜族佤族布朗族傣族自治县','云南省临沧市双江拉祜族佤族布朗族傣族自治县','3','530900','CN',NULL,'1'),
 ('530926','云南省临沧市耿马傣族佤族自治县','云南省临沧市耿马傣族佤族自治县','3','530900','CN',NULL,'1'),
 ('530927','云南省临沧市沧源佤族自治县','云南省临沧市沧源佤族自治县','3','530900','CN',NULL,'1'),
 ('532300','云南省楚雄彝族自治州','云南省楚雄彝族自治州','2','530000','CN',NULL,'1'),
 ('532301','云南省楚雄彝族自治州楚雄市','云南省楚雄彝族自治州楚雄市','3','532300','CN',NULL,'1'),
 ('532322','云南省楚雄彝族自治州双柏县','云南省楚雄彝族自治州双柏县','3','532300','CN',NULL,'1'),
 ('532323','云南省楚雄彝族自治州牟定县','云南省楚雄彝族自治州牟定县','3','532300','CN',NULL,'1'),
 ('532324','云南省楚雄彝族自治州南华县','云南省楚雄彝族自治州南华县','3','532300','CN',NULL,'1'),
 ('532325','云南省楚雄彝族自治州姚安县','云南省楚雄彝族自治州姚安县','3','532300','CN',NULL,'1'),
 ('532326','云南省楚雄彝族自治州大姚县','云南省楚雄彝族自治州大姚县','3','532300','CN',NULL,'1'),
 ('532327','云南省楚雄彝族自治州永仁县','云南省楚雄彝族自治州永仁县','3','532300','CN',NULL,'1'),
 ('532328','云南省楚雄彝族自治州元谋县','云南省楚雄彝族自治州元谋县','3','532300','CN',NULL,'1'),
 ('532329','云南省楚雄彝族自治州武定县','云南省楚雄彝族自治州武定县','3','532300','CN',NULL,'1'),
 ('532331','云南省楚雄彝族自治州禄丰县','云南省楚雄彝族自治州禄丰县','3','532300','CN',NULL,'1'),
 ('532500','云南省红河哈尼族彝族自治州','云南省红河哈尼族彝族自治州','2','530000','CN',NULL,'1'),
 ('532501','云南省红河哈尼族彝族自治州个旧市','云南省红河哈尼族彝族自治州个旧市','3','532500','CN',NULL,'1'),
 ('532502','云南省红河哈尼族彝族自治州开远市','云南省红河哈尼族彝族自治州开远市','3','532500','CN',NULL,'1'),
 ('532522','云南省红河哈尼族彝族自治州蒙自县','云南省红河哈尼族彝族自治州蒙自县','3','532500','CN',NULL,'1'),
 ('532523','云南省红河哈尼族彝族自治州屏边苗族自治县','云南省红河哈尼族彝族自治州屏边苗族自治县','3','532500','CN',NULL,'1'),
 ('532524','云南省红河哈尼族彝族自治州建水县','云南省红河哈尼族彝族自治州建水县','3','532500','CN',NULL,'1'),
 ('532525','云南省红河哈尼族彝族自治州石屏县','云南省红河哈尼族彝族自治州石屏县','3','532500','CN',NULL,'1'),
 ('532526','云南省红河哈尼族彝族自治州弥勒县','云南省红河哈尼族彝族自治州弥勒县','3','532500','CN',NULL,'1'),
 ('532527','云南省红河哈尼族彝族自治州泸西县','云南省红河哈尼族彝族自治州泸西县','3','532500','CN',NULL,'1'),
 ('532528','云南省红河哈尼族彝族自治州元阳县','云南省红河哈尼族彝族自治州元阳县','3','532500','CN',NULL,'1'),
 ('532529','云南省红河哈尼族彝族自治州红河县','云南省红河哈尼族彝族自治州红河县','3','532500','CN',NULL,'1'),
 ('532530','云南省红河哈尼族彝族自治州金平苗族瑶族傣族自治县','云南省红河哈尼族彝族自治州金平苗族瑶族傣族自治县','3','532500','CN',NULL,'1'),
 ('532531','云南省红河哈尼族彝族自治州绿春县','云南省红河哈尼族彝族自治州绿春县','3','532500','CN',NULL,'1'),
 ('532532','云南省红河哈尼族彝族自治州河口瑶族自治县','云南省红河哈尼族彝族自治州河口瑶族自治县','3','532500','CN',NULL,'1'),
 ('532600','云南省文山壮族苗族自治州','云南省文山壮族苗族自治州','2','530000','CN',NULL,'1'),
 ('532621','云南省文山壮族苗族自治州文山县','云南省文山壮族苗族自治州文山县','3','532600','CN',NULL,'1'),
 ('532622','云南省文山壮族苗族自治州砚山县','云南省文山壮族苗族自治州砚山县','3','532600','CN',NULL,'1'),
 ('532623','云南省文山壮族苗族自治州西畴县','云南省文山壮族苗族自治州西畴县','3','532600','CN',NULL,'1'),
 ('532624','云南省文山壮族苗族自治州麻栗坡县','云南省文山壮族苗族自治州麻栗坡县','3','532600','CN',NULL,'1'),
 ('532625','云南省文山壮族苗族自治州马关县','云南省文山壮族苗族自治州马关县','3','532600','CN',NULL,'1'),
 ('532626','云南省文山壮族苗族自治州丘北县','云南省文山壮族苗族自治州丘北县','3','532600','CN',NULL,'1'),
 ('532627','云南省文山壮族苗族自治州广南县','云南省文山壮族苗族自治州广南县','3','532600','CN',NULL,'1'),
 ('532628','云南省文山壮族苗族自治州富宁县','云南省文山壮族苗族自治州富宁县','3','532600','CN',NULL,'1'),
 ('532800','云南省西双版纳傣族自治州','云南省西双版纳傣族自治州','2','530000','CN',NULL,'1'),
 ('532801','云南省西双版纳傣族自治州景洪市','云南省西双版纳傣族自治州景洪市','3','532800','CN',NULL,'1'),
 ('532822','云南省西双版纳傣族自治州勐海县','云南省西双版纳傣族自治州勐海县','3','532800','CN',NULL,'1'),
 ('532823','云南省西双版纳傣族自治州勐腊县','云南省西双版纳傣族自治州勐腊县','3','532800','CN',NULL,'1'),
 ('532900','云南省大理白族自治州','云南省大理白族自治州','2','530000','CN',NULL,'1'),
 ('532901','云南省大理白族自治州大理市','云南省大理白族自治州大理市','3','532900','CN',NULL,'1'),
 ('532922','云南省大理白族自治州漾濞彝族自治县','云南省大理白族自治州漾濞彝族自治县','3','532900','CN',NULL,'1'),
 ('532923','云南省大理白族自治州祥云县','云南省大理白族自治州祥云县','3','532900','CN',NULL,'1'),
 ('532924','云南省大理白族自治州宾川县','云南省大理白族自治州宾川县','3','532900','CN',NULL,'1'),
 ('532925','云南省大理白族自治州弥渡县','云南省大理白族自治州弥渡县','3','532900','CN',NULL,'1'),
 ('532926','云南省大理白族自治州南涧彝族自治县','云南省大理白族自治州南涧彝族自治县','3','532900','CN',NULL,'1'),
 ('532927','云南省大理白族自治州巍山彝族回族自治县','云南省大理白族自治州巍山彝族回族自治县','3','532900','CN',NULL,'1'),
 ('532928','云南省大理白族自治州永平县','云南省大理白族自治州永平县','3','532900','CN',NULL,'1'),
 ('532929','云南省大理白族自治州云龙县','云南省大理白族自治州云龙县','3','532900','CN',NULL,'1'),
 ('532930','云南省大理白族自治州洱源县','云南省大理白族自治州洱源县','3','532900','CN',NULL,'1'),
 ('532931','云南省大理白族自治州剑川县','云南省大理白族自治州剑川县','3','532900','CN',NULL,'1'),
 ('532932','云南省大理白族自治州鹤庆县','云南省大理白族自治州鹤庆县','3','532900','CN',NULL,'1'),
 ('533100','云南省德宏傣族景颇族自治州','云南省德宏傣族景颇族自治州','2','530000','CN',NULL,'1'),
 ('533102','云南省德宏傣族景颇族自治州瑞丽市','云南省德宏傣族景颇族自治州瑞丽市','3','533100','CN',NULL,'1'),
 ('533103','云南省德宏傣族景颇族自治州潞西市','云南省德宏傣族景颇族自治州潞西市','3','533100','CN',NULL,'1'),
 ('533122','云南省德宏傣族景颇族自治州梁河县','云南省德宏傣族景颇族自治州梁河县','3','533100','CN',NULL,'1'),
 ('533123','云南省德宏傣族景颇族自治州盈江县','云南省德宏傣族景颇族自治州盈江县','3','533100','CN',NULL,'1'),
 ('533124','云南省德宏傣族景颇族自治州陇川县','云南省德宏傣族景颇族自治州陇川县','3','533100','CN',NULL,'1'),
 ('533300','云南省怒江傈僳族自治州','云南省怒江傈僳族自治州','2','530000','CN',NULL,'1'),
 ('533321','云南省怒江傈僳族自治州泸水县','云南省怒江傈僳族自治州泸水县','3','533300','CN',NULL,'1'),
 ('533323','云南省怒江傈僳族自治州福贡县','云南省怒江傈僳族自治州福贡县','3','533300','CN',NULL,'1'),
 ('533324','云南省怒江傈僳族自治州贡山独龙族怒族自治县','云南省怒江傈僳族自治州贡山独龙族怒族自治县','3','533300','CN',NULL,'1'),
 ('533325','云南省怒江傈僳族自治州兰坪白族普米族自治县','云南省怒江傈僳族自治州兰坪白族普米族自治县','3','533300','CN',NULL,'1'),
 ('533400','云南省迪庆藏族自治州','云南省迪庆藏族自治州','2','530000','CN',NULL,'1'),
 ('533421','云南省迪庆藏族自治州香格里拉县','云南省迪庆藏族自治州香格里拉县','3','533400','CN',NULL,'1'),
 ('533422','云南省迪庆藏族自治州德钦县','云南省迪庆藏族自治州德钦县','3','533400','CN',NULL,'1'),
 ('533423','云南省迪庆藏族自治州维西傈僳族自治县','云南省迪庆藏族自治州维西傈僳族自治县','3','533400','CN',NULL,'1'),
 ('540000','西藏自治区','西藏自治区','1','CN','CN',NULL,'1'),
 ('540100','西藏自治区拉萨市','西藏自治区拉萨市','2','540000','CN',NULL,'1'),
 ('540101','西藏自治区拉萨市市辖区','西藏自治区拉萨市市辖区','3','540100','CN',NULL,'1'),
 ('540102','西藏自治区拉萨市城关区','西藏自治区拉萨市城关区','3','540100','CN',NULL,'1'),
 ('540121','西藏自治区拉萨市林周县','西藏自治区拉萨市林周县','3','540100','CN',NULL,'1'),
 ('540122','西藏自治区拉萨市当雄县','西藏自治区拉萨市当雄县','3','540100','CN',NULL,'1'),
 ('540123','西藏自治区拉萨市尼木县','西藏自治区拉萨市尼木县','3','540100','CN',NULL,'1'),
 ('540124','西藏自治区拉萨市曲水县','西藏自治区拉萨市曲水县','3','540100','CN',NULL,'1'),
 ('540125','西藏自治区拉萨市堆龙德庆县','西藏自治区拉萨市堆龙德庆县','3','540100','CN',NULL,'1'),
 ('540126','西藏自治区拉萨市达孜县','西藏自治区拉萨市达孜县','3','540100','CN',NULL,'1'),
 ('540127','西藏自治区拉萨市墨竹工卡县','西藏自治区拉萨市墨竹工卡县','3','540100','CN',NULL,'1'),
 ('542100','西藏自治区昌都地区','西藏自治区昌都地区','2','540000','CN',NULL,'1'),
 ('542121','西藏自治区昌都地区昌都县','西藏自治区昌都地区昌都县','3','542100','CN',NULL,'1'),
 ('542122','西藏自治区昌都地区江达县','西藏自治区昌都地区江达县','3','542100','CN',NULL,'1'),
 ('542123','西藏自治区昌都地区贡觉县','西藏自治区昌都地区贡觉县','3','542100','CN',NULL,'1'),
 ('542124','西藏自治区昌都地区类乌齐县','西藏自治区昌都地区类乌齐县','3','542100','CN',NULL,'1'),
 ('542125','西藏自治区昌都地区丁青县','西藏自治区昌都地区丁青县','3','542100','CN',NULL,'1'),
 ('542126','西藏自治区昌都地区察雅县','西藏自治区昌都地区察雅县','3','542100','CN',NULL,'1'),
 ('542127','西藏自治区昌都地区八宿县','西藏自治区昌都地区八宿县','3','542100','CN',NULL,'1'),
 ('542128','西藏自治区昌都地区左贡县','西藏自治区昌都地区左贡县','3','542100','CN',NULL,'1'),
 ('542129','西藏自治区昌都地区芒康县','西藏自治区昌都地区芒康县','3','542100','CN',NULL,'1'),
 ('542132','西藏自治区昌都地区洛隆县','西藏自治区昌都地区洛隆县','3','542100','CN',NULL,'1'),
 ('542133','西藏自治区昌都地区边坝县','西藏自治区昌都地区边坝县','3','542100','CN',NULL,'1'),
 ('542200','西藏自治区山南地区','西藏自治区山南地区','2','540000','CN',NULL,'1'),
 ('542221','西藏自治区山南地区乃东县','西藏自治区山南地区乃东县','3','542200','CN',NULL,'1'),
 ('542222','西藏自治区山南地区扎囊县','西藏自治区山南地区扎囊县','3','542200','CN',NULL,'1'),
 ('542223','西藏自治区山南地区贡嘎县','西藏自治区山南地区贡嘎县','3','542200','CN',NULL,'1'),
 ('542224','西藏自治区山南地区桑日县','西藏自治区山南地区桑日县','3','542200','CN',NULL,'1'),
 ('542225','西藏自治区山南地区琼结县','西藏自治区山南地区琼结县','3','542200','CN',NULL,'1'),
 ('542226','西藏自治区山南地区曲松县','西藏自治区山南地区曲松县','3','542200','CN',NULL,'1'),
 ('542227','西藏自治区山南地区措美县','西藏自治区山南地区措美县','3','542200','CN',NULL,'1'),
 ('542228','西藏自治区山南地区洛扎县','西藏自治区山南地区洛扎县','3','542200','CN',NULL,'1'),
 ('542229','西藏自治区山南地区加查县','西藏自治区山南地区加查县','3','542200','CN',NULL,'1'),
 ('542231','西藏自治区山南地区隆子县','西藏自治区山南地区隆子县','3','542200','CN',NULL,'1'),
 ('542232','西藏自治区山南地区错那县','西藏自治区山南地区错那县','3','542200','CN',NULL,'1'),
 ('542233','西藏自治区山南地区浪卡子县','西藏自治区山南地区浪卡子县','3','542200','CN',NULL,'1'),
 ('542300','西藏自治区日喀则地区','西藏自治区日喀则地区','2','540000','CN',NULL,'1'),
 ('542301','西藏自治区日喀则地区日喀则市','西藏自治区日喀则地区日喀则市','3','542300','CN',NULL,'1'),
 ('542322','西藏自治区日喀则地区南木林县','西藏自治区日喀则地区南木林县','3','542300','CN',NULL,'1'),
 ('542323','西藏自治区日喀则地区江孜县','西藏自治区日喀则地区江孜县','3','542300','CN',NULL,'1'),
 ('542324','西藏自治区日喀则地区定日县','西藏自治区日喀则地区定日县','3','542300','CN',NULL,'1'),
 ('542325','西藏自治区日喀则地区萨迦县','西藏自治区日喀则地区萨迦县','3','542300','CN',NULL,'1'),
 ('542326','西藏自治区日喀则地区拉孜县','西藏自治区日喀则地区拉孜县','3','542300','CN',NULL,'1'),
 ('542327','西藏自治区日喀则地区昂仁县','西藏自治区日喀则地区昂仁县','3','542300','CN',NULL,'1'),
 ('542328','西藏自治区日喀则地区谢通门县','西藏自治区日喀则地区谢通门县','3','542300','CN',NULL,'1'),
 ('542329','西藏自治区日喀则地区白朗县','西藏自治区日喀则地区白朗县','3','542300','CN',NULL,'1'),
 ('542330','西藏自治区日喀则地区仁布县','西藏自治区日喀则地区仁布县','3','542300','CN',NULL,'1'),
 ('542331','西藏自治区日喀则地区康马县','西藏自治区日喀则地区康马县','3','542300','CN',NULL,'1'),
 ('542332','西藏自治区日喀则地区定结县','西藏自治区日喀则地区定结县','3','542300','CN',NULL,'1'),
 ('542333','西藏自治区日喀则地区仲巴县','西藏自治区日喀则地区仲巴县','3','542300','CN',NULL,'1'),
 ('542334','西藏自治区日喀则地区亚东县','西藏自治区日喀则地区亚东县','3','542300','CN',NULL,'1'),
 ('542335','西藏自治区日喀则地区吉隆县','西藏自治区日喀则地区吉隆县','3','542300','CN',NULL,'1'),
 ('542336','西藏自治区日喀则地区聂拉木县','西藏自治区日喀则地区聂拉木县','3','542300','CN',NULL,'1'),
 ('542337','西藏自治区日喀则地区萨嘎县','西藏自治区日喀则地区萨嘎县','3','542300','CN',NULL,'1'),
 ('542338','西藏自治区日喀则地区岗巴县','西藏自治区日喀则地区岗巴县','3','542300','CN',NULL,'1'),
 ('542400','西藏自治区那曲地区','西藏自治区那曲地区','2','540000','CN',NULL,'1'),
 ('542421','西藏自治区那曲地区那曲县','西藏自治区那曲地区那曲县','3','542400','CN',NULL,'1'),
 ('542422','西藏自治区那曲地区嘉黎县','西藏自治区那曲地区嘉黎县','3','542400','CN',NULL,'1'),
 ('542423','西藏自治区那曲地区比如县','西藏自治区那曲地区比如县','3','542400','CN',NULL,'1'),
 ('542424','西藏自治区那曲地区聂荣县','西藏自治区那曲地区聂荣县','3','542400','CN',NULL,'1');
INSERT INTO `pub_cant` (`CANT_CODE`,`CANT_NAME`,`SHORT_NAME`,`CANT_TYPE`,`SUPER_CODE`,`COUNTRY_CODE`,`CANT_NOTE`,`IN_USE`) VALUES 
 ('542425','西藏自治区那曲地区安多县','西藏自治区那曲地区安多县','3','542400','CN',NULL,'1'),
 ('542426','西藏自治区那曲地区申扎县','西藏自治区那曲地区申扎县','3','542400','CN',NULL,'1'),
 ('542427','西藏自治区那曲地区索县','西藏自治区那曲地区索县','3','542400','CN',NULL,'1'),
 ('542428','西藏自治区那曲地区班戈县','西藏自治区那曲地区班戈县','3','542400','CN',NULL,'1'),
 ('542429','西藏自治区那曲地区巴青县','西藏自治区那曲地区巴青县','3','542400','CN',NULL,'1'),
 ('542430','西藏自治区那曲地区尼玛县','西藏自治区那曲地区尼玛县','3','542400','CN',NULL,'1'),
 ('542500','西藏自治区阿里地区','西藏自治区阿里地区','2','540000','CN',NULL,'1'),
 ('542521','西藏自治区阿里地区普兰县','西藏自治区阿里地区普兰县','3','542500','CN',NULL,'1'),
 ('542522','西藏自治区阿里地区札达县','西藏自治区阿里地区札达县','3','542500','CN',NULL,'1'),
 ('542523','西藏自治区阿里地区噶尔县','西藏自治区阿里地区噶尔县','3','542500','CN',NULL,'1'),
 ('542524','西藏自治区阿里地区日土县','西藏自治区阿里地区日土县','3','542500','CN',NULL,'1'),
 ('542525','西藏自治区阿里地区革吉县','西藏自治区阿里地区革吉县','3','542500','CN',NULL,'1'),
 ('542526','西藏自治区阿里地区改则县','西藏自治区阿里地区改则县','3','542500','CN',NULL,'1'),
 ('542527','西藏自治区阿里地区措勤县','西藏自治区阿里地区措勤县','3','542500','CN',NULL,'1'),
 ('542600','西藏自治区林芝地区','西藏自治区林芝地区','2','540000','CN',NULL,'1'),
 ('542621','西藏自治区林芝地区林芝县','西藏自治区林芝地区林芝县','3','542600','CN',NULL,'1'),
 ('542622','西藏自治区林芝地区工布江达县','西藏自治区林芝地区工布江达县','3','542600','CN',NULL,'1'),
 ('542623','西藏自治区林芝地区米林县','西藏自治区林芝地区米林县','3','542600','CN',NULL,'1'),
 ('542624','西藏自治区林芝地区墨脱县','西藏自治区林芝地区墨脱县','3','542600','CN',NULL,'1'),
 ('542625','西藏自治区林芝地区波密县','西藏自治区林芝地区波密县','3','542600','CN',NULL,'1'),
 ('542626','西藏自治区林芝地区察隅县','西藏自治区林芝地区察隅县','3','542600','CN',NULL,'1'),
 ('542627','西藏自治区林芝地区朗县','西藏自治区林芝地区朗县','3','542600','CN',NULL,'1'),
 ('610000','陕西省','陕西省','1','CN','CN',NULL,'1'),
 ('610100','陕西省西安市','陕西省西安市','2','610000','CN',NULL,'1'),
 ('610101','陕西省西安市市辖区','陕西省西安市市辖区','3','610100','CN',NULL,'1'),
 ('610102','陕西省西安市新城区','陕西省西安市新城区','3','610100','CN',NULL,'1'),
 ('610103','陕西省西安市碑林区','陕西省西安市碑林区','3','610100','CN',NULL,'1'),
 ('610104','陕西省西安市莲湖区','陕西省西安市莲湖区','3','610100','CN',NULL,'1'),
 ('610111','陕西省西安市灞桥区','陕西省西安市灞桥区','3','610100','CN',NULL,'1'),
 ('610112','陕西省西安市未央区','陕西省西安市未央区','3','610100','CN',NULL,'1'),
 ('610113','陕西省西安市雁塔区','陕西省西安市雁塔区','3','610100','CN',NULL,'1'),
 ('610114','陕西省西安市阎良区','陕西省西安市阎良区','3','610100','CN',NULL,'1'),
 ('610115','陕西省西安市临潼区','陕西省西安市临潼区','3','610100','CN',NULL,'1'),
 ('610116','陕西省西安市长安区','陕西省西安市长安区','3','610100','CN',NULL,'1'),
 ('610122','陕西省西安市蓝田县','陕西省西安市蓝田县','3','610100','CN',NULL,'1'),
 ('610124','陕西省西安市周至县','陕西省西安市周至县','3','610100','CN',NULL,'1'),
 ('610125','陕西省西安市户县','陕西省西安市户县','3','610100','CN',NULL,'1'),
 ('610126','陕西省西安市高陵县','陕西省西安市高陵县','3','610100','CN',NULL,'1'),
 ('610200','陕西省铜川市','陕西省铜川市','2','610000','CN',NULL,'1'),
 ('610201','陕西省铜川市市辖区','陕西省铜川市市辖区','3','610200','CN',NULL,'1'),
 ('610202','陕西省铜川市王益区','陕西省铜川市王益区','3','610200','CN',NULL,'1'),
 ('610203','陕西省铜川市印台区','陕西省铜川市印台区','3','610200','CN',NULL,'1'),
 ('610204','陕西省铜川市耀州区','陕西省铜川市耀州区','3','610200','CN',NULL,'1'),
 ('610222','陕西省铜川市宜君县','陕西省铜川市宜君县','3','610200','CN',NULL,'1'),
 ('610300','陕西省宝鸡市','陕西省宝鸡市','2','610000','CN',NULL,'1'),
 ('610301','陕西省宝鸡市市辖区','陕西省宝鸡市市辖区','3','610300','CN',NULL,'1'),
 ('610302','陕西省宝鸡市渭滨区','陕西省宝鸡市渭滨区','3','610300','CN',NULL,'1'),
 ('610303','陕西省宝鸡市金台区','陕西省宝鸡市金台区','3','610300','CN',NULL,'1'),
 ('610304','陕西省宝鸡市陈仓区','陕西省宝鸡市陈仓区','3','610300','CN',NULL,'1'),
 ('610322','陕西省宝鸡市凤翔县','陕西省宝鸡市凤翔县','3','610300','CN',NULL,'1'),
 ('610323','陕西省宝鸡市岐山县','陕西省宝鸡市岐山县','3','610300','CN',NULL,'1'),
 ('610324','陕西省宝鸡市扶风县','陕西省宝鸡市扶风县','3','610300','CN',NULL,'1'),
 ('610326','陕西省宝鸡市眉县','陕西省宝鸡市眉县','3','610300','CN',NULL,'1'),
 ('610327','陕西省宝鸡市陇县','陕西省宝鸡市陇县','3','610300','CN',NULL,'1'),
 ('610328','陕西省宝鸡市千阳县','陕西省宝鸡市千阳县','3','610300','CN',NULL,'1'),
 ('610329','陕西省宝鸡市麟游县','陕西省宝鸡市麟游县','3','610300','CN',NULL,'1'),
 ('610330','陕西省宝鸡市凤县','陕西省宝鸡市凤县','3','610300','CN',NULL,'1'),
 ('610331','陕西省宝鸡市太白县','陕西省宝鸡市太白县','3','610300','CN',NULL,'1'),
 ('610400','陕西省咸阳市','陕西省咸阳市','2','610000','CN',NULL,'1'),
 ('610401','陕西省咸阳市市辖区','陕西省咸阳市市辖区','3','610400','CN',NULL,'1'),
 ('610402','陕西省咸阳市秦都区','陕西省咸阳市秦都区','3','610400','CN',NULL,'1'),
 ('610403','陕西省咸阳市杨凌区','陕西省咸阳市杨凌区','3','610400','CN',NULL,'1'),
 ('610404','陕西省咸阳市渭城区','陕西省咸阳市渭城区','3','610400','CN',NULL,'1'),
 ('610422','陕西省咸阳市三原县','陕西省咸阳市三原县','3','610400','CN',NULL,'1'),
 ('610423','陕西省咸阳市泾阳县','陕西省咸阳市泾阳县','3','610400','CN',NULL,'1'),
 ('610424','陕西省咸阳市乾县','陕西省咸阳市乾县','3','610400','CN',NULL,'1'),
 ('610425','陕西省咸阳市礼泉县','陕西省咸阳市礼泉县','3','610400','CN',NULL,'1'),
 ('610426','陕西省咸阳市永寿县','陕西省咸阳市永寿县','3','610400','CN',NULL,'1'),
 ('610427','陕西省咸阳市彬县','陕西省咸阳市彬县','3','610400','CN',NULL,'1'),
 ('610428','陕西省咸阳市长武县','陕西省咸阳市长武县','3','610400','CN',NULL,'1'),
 ('610429','陕西省咸阳市旬邑县','陕西省咸阳市旬邑县','3','610400','CN',NULL,'1'),
 ('610430','陕西省咸阳市淳化县','陕西省咸阳市淳化县','3','610400','CN',NULL,'1'),
 ('610431','陕西省咸阳市武功县','陕西省咸阳市武功县','3','610400','CN',NULL,'1'),
 ('610481','陕西省咸阳市兴平市','陕西省咸阳市兴平市','3','610400','CN',NULL,'1'),
 ('610500','陕西省渭南市','陕西省渭南市','2','610000','CN',NULL,'1'),
 ('610501','陕西省渭南市市辖区','陕西省渭南市市辖区','3','610500','CN',NULL,'1'),
 ('610502','陕西省渭南市临渭区','陕西省渭南市临渭区','3','610500','CN',NULL,'1'),
 ('610521','陕西省渭南市华县','陕西省渭南市华县','3','610500','CN',NULL,'1'),
 ('610522','陕西省渭南市潼关县','陕西省渭南市潼关县','3','610500','CN',NULL,'1'),
 ('610523','陕西省渭南市大荔县','陕西省渭南市大荔县','3','610500','CN',NULL,'1'),
 ('610524','陕西省渭南市合阳县','陕西省渭南市合阳县','3','610500','CN',NULL,'1'),
 ('610525','陕西省渭南市澄城县','陕西省渭南市澄城县','3','610500','CN',NULL,'1'),
 ('610526','陕西省渭南市蒲城县','陕西省渭南市蒲城县','3','610500','CN',NULL,'1'),
 ('610527','陕西省渭南市白水县','陕西省渭南市白水县','3','610500','CN',NULL,'1'),
 ('610528','陕西省渭南市富平县','陕西省渭南市富平县','3','610500','CN',NULL,'1'),
 ('610581','陕西省渭南市韩城市','陕西省渭南市韩城市','3','610500','CN',NULL,'1'),
 ('610582','陕西省渭南市华阴市','陕西省渭南市华阴市','3','610500','CN',NULL,'1'),
 ('610600','陕西省延安市','陕西省延安市','2','610000','CN',NULL,'1'),
 ('610601','陕西省延安市市辖区','陕西省延安市市辖区','3','610600','CN',NULL,'1'),
 ('610602','陕西省延安市宝塔区','陕西省延安市宝塔区','3','610600','CN',NULL,'1'),
 ('610621','陕西省延安市延长县','陕西省延安市延长县','3','610600','CN',NULL,'1'),
 ('610622','陕西省延安市延川县','陕西省延安市延川县','3','610600','CN',NULL,'1'),
 ('610623','陕西省延安市子长县','陕西省延安市子长县','3','610600','CN',NULL,'1'),
 ('610624','陕西省延安市安塞县','陕西省延安市安塞县','3','610600','CN',NULL,'1'),
 ('610625','陕西省延安市志丹县','陕西省延安市志丹县','3','610600','CN',NULL,'1'),
 ('610626','陕西省延安市吴旗县','陕西省延安市吴旗县','3','610600','CN',NULL,'1'),
 ('610627','陕西省延安市甘泉县','陕西省延安市甘泉县','3','610600','CN',NULL,'1'),
 ('610628','陕西省延安市富县','陕西省延安市富县','3','610600','CN',NULL,'1'),
 ('610629','陕西省延安市洛川县','陕西省延安市洛川县','3','610600','CN',NULL,'1'),
 ('610630','陕西省延安市宜川县','陕西省延安市宜川县','3','610600','CN',NULL,'1'),
 ('610631','陕西省延安市黄龙县','陕西省延安市黄龙县','3','610600','CN',NULL,'1'),
 ('610632','陕西省延安市黄陵县','陕西省延安市黄陵县','3','610600','CN',NULL,'1'),
 ('610700','陕西省汉中市','陕西省汉中市','2','610000','CN',NULL,'1'),
 ('610701','陕西省汉中市市辖区','陕西省汉中市市辖区','3','610700','CN',NULL,'1'),
 ('610702','陕西省汉中市汉台区','陕西省汉中市汉台区','3','610700','CN',NULL,'1'),
 ('610721','陕西省汉中市南郑县','陕西省汉中市南郑县','3','610700','CN',NULL,'1'),
 ('610722','陕西省汉中市城固县','陕西省汉中市城固县','3','610700','CN',NULL,'1'),
 ('610723','陕西省汉中市洋县','陕西省汉中市洋县','3','610700','CN',NULL,'1'),
 ('610724','陕西省汉中市西乡县','陕西省汉中市西乡县','3','610700','CN',NULL,'1'),
 ('610725','陕西省汉中市勉县','陕西省汉中市勉县','3','610700','CN',NULL,'1'),
 ('610726','陕西省汉中市宁强县','陕西省汉中市宁强县','3','610700','CN',NULL,'1'),
 ('610727','陕西省汉中市略阳县','陕西省汉中市略阳县','3','610700','CN',NULL,'1'),
 ('610728','陕西省汉中市镇巴县','陕西省汉中市镇巴县','3','610700','CN',NULL,'1'),
 ('610729','陕西省汉中市留坝县','陕西省汉中市留坝县','3','610700','CN',NULL,'1'),
 ('610730','陕西省汉中市佛坪县','陕西省汉中市佛坪县','3','610700','CN',NULL,'1'),
 ('610800','陕西省榆林市','陕西省榆林市','2','610000','CN',NULL,'1'),
 ('610801','陕西省榆林市市辖区','陕西省榆林市市辖区','3','610800','CN',NULL,'1'),
 ('610802','陕西省榆林市榆阳区','陕西省榆林市榆阳区','3','610800','CN',NULL,'1'),
 ('610821','陕西省榆林市神木县','陕西省榆林市神木县','3','610800','CN',NULL,'1'),
 ('610822','陕西省榆林市府谷县','陕西省榆林市府谷县','3','610800','CN',NULL,'1'),
 ('610823','陕西省榆林市横山县','陕西省榆林市横山县','3','610800','CN',NULL,'1'),
 ('610824','陕西省榆林市靖边县','陕西省榆林市靖边县','3','610800','CN',NULL,'1'),
 ('610825','陕西省榆林市定边县','陕西省榆林市定边县','3','610800','CN',NULL,'1'),
 ('610826','陕西省榆林市绥德县','陕西省榆林市绥德县','3','610800','CN',NULL,'1'),
 ('610827','陕西省榆林市米脂县','陕西省榆林市米脂县','3','610800','CN',NULL,'1'),
 ('610828','陕西省榆林市佳县','陕西省榆林市佳县','3','610800','CN',NULL,'1'),
 ('610829','陕西省榆林市吴堡县','陕西省榆林市吴堡县','3','610800','CN',NULL,'1'),
 ('610830','陕西省榆林市清涧县','陕西省榆林市清涧县','3','610800','CN',NULL,'1'),
 ('610831','陕西省榆林市子洲县','陕西省榆林市子洲县','3','610800','CN',NULL,'1'),
 ('610900','陕西省安康市','陕西省安康市','2','610000','CN',NULL,'1'),
 ('610901','陕西省安康市市辖区','陕西省安康市市辖区','3','610900','CN',NULL,'1'),
 ('610902','陕西省安康市汉滨区','陕西省安康市汉滨区','3','610900','CN',NULL,'1'),
 ('610921','陕西省安康市汉阴县','陕西省安康市汉阴县','3','610900','CN',NULL,'1'),
 ('610922','陕西省安康市石泉县','陕西省安康市石泉县','3','610900','CN',NULL,'1'),
 ('610923','陕西省安康市宁陕县','陕西省安康市宁陕县','3','610900','CN',NULL,'1'),
 ('610924','陕西省安康市紫阳县','陕西省安康市紫阳县','3','610900','CN',NULL,'1'),
 ('610925','陕西省安康市岚皋县','陕西省安康市岚皋县','3','610900','CN',NULL,'1'),
 ('610926','陕西省安康市平利县','陕西省安康市平利县','3','610900','CN',NULL,'1'),
 ('610927','陕西省安康市镇坪县','陕西省安康市镇坪县','3','610900','CN',NULL,'1'),
 ('610928','陕西省安康市旬阳县','陕西省安康市旬阳县','3','610900','CN',NULL,'1'),
 ('610929','陕西省安康市白河县','陕西省安康市白河县','3','610900','CN',NULL,'1'),
 ('611000','陕西省商洛市','陕西省商洛市','2','610000','CN',NULL,'1'),
 ('611001','陕西省商洛市市辖区','陕西省商洛市市辖区','3','611000','CN',NULL,'1'),
 ('611002','陕西省商洛市商州区','陕西省商洛市商州区','3','611000','CN',NULL,'1'),
 ('611021','陕西省商洛市洛南县','陕西省商洛市洛南县','3','611000','CN',NULL,'1'),
 ('611022','陕西省商洛市丹凤县','陕西省商洛市丹凤县','3','611000','CN',NULL,'1'),
 ('611023','陕西省商洛市商南县','陕西省商洛市商南县','3','611000','CN',NULL,'1'),
 ('611024','陕西省商洛市山阳县','陕西省商洛市山阳县','3','611000','CN',NULL,'1'),
 ('611025','陕西省商洛市镇安县','陕西省商洛市镇安县','3','611000','CN',NULL,'1'),
 ('611026','陕西省商洛市柞水县','陕西省商洛市柞水县','3','611000','CN',NULL,'1'),
 ('620000','甘肃省','甘肃省','1','CN','CN',NULL,'1'),
 ('620100','甘肃省兰州市','甘肃省兰州市','2','620000','CN',NULL,'1'),
 ('620101','甘肃省兰州市市辖区','甘肃省兰州市市辖区','3','620100','CN',NULL,'1'),
 ('620102','甘肃省兰州市城关区','甘肃省兰州市城关区','3','620100','CN',NULL,'1'),
 ('620103','甘肃省兰州市七里河区','甘肃省兰州市七里河区','3','620100','CN',NULL,'1'),
 ('620104','甘肃省兰州市西固区','甘肃省兰州市西固区','3','620100','CN',NULL,'1'),
 ('620105','甘肃省兰州市安宁区','甘肃省兰州市安宁区','3','620100','CN',NULL,'1'),
 ('620111','甘肃省兰州市红古区','甘肃省兰州市红古区','3','620100','CN',NULL,'1'),
 ('620121','甘肃省兰州市永登县','甘肃省兰州市永登县','3','620100','CN',NULL,'1'),
 ('620122','甘肃省兰州市皋兰县','甘肃省兰州市皋兰县','3','620100','CN',NULL,'1'),
 ('620123','甘肃省兰州市榆中县','甘肃省兰州市榆中县','3','620100','CN',NULL,'1'),
 ('620200','甘肃省嘉峪关市','甘肃省嘉峪关市','2','620000','CN',NULL,'1'),
 ('620201','甘肃省嘉峪关市市辖区','甘肃省嘉峪关市市辖区','3','620200','CN',NULL,'1'),
 ('620300','甘肃省金昌市','甘肃省金昌市','2','620000','CN',NULL,'1'),
 ('620301','甘肃省金昌市市辖区','甘肃省金昌市市辖区','3','620300','CN',NULL,'1'),
 ('620302','甘肃省金昌市金川区','甘肃省金昌市金川区','3','620300','CN',NULL,'1'),
 ('620321','甘肃省金昌市永昌县','甘肃省金昌市永昌县','3','620300','CN',NULL,'1'),
 ('620400','甘肃省白银市','甘肃省白银市','2','620000','CN',NULL,'1'),
 ('620401','甘肃省白银市市辖区','甘肃省白银市市辖区','3','620400','CN',NULL,'1'),
 ('620402','甘肃省白银市白银区','甘肃省白银市白银区','3','620400','CN',NULL,'1'),
 ('620403','甘肃省白银市平川区','甘肃省白银市平川区','3','620400','CN',NULL,'1'),
 ('620421','甘肃省白银市靖远县','甘肃省白银市靖远县','3','620400','CN',NULL,'1'),
 ('620422','甘肃省白银市会宁县','甘肃省白银市会宁县','3','620400','CN',NULL,'1'),
 ('620423','甘肃省白银市景泰县','甘肃省白银市景泰县','3','620400','CN',NULL,'1'),
 ('620500','甘肃省天水市','甘肃省天水市','2','620000','CN',NULL,'1'),
 ('620501','甘肃省天水市市辖区','甘肃省天水市市辖区','3','620500','CN',NULL,'1'),
 ('620502','甘肃省天水市秦城区','甘肃省天水市秦城区','3','620500','CN',NULL,'1'),
 ('620503','甘肃省天水市北道区','甘肃省天水市北道区','3','620500','CN',NULL,'1'),
 ('620521','甘肃省天水市清水县','甘肃省天水市清水县','3','620500','CN',NULL,'1'),
 ('620522','甘肃省天水市秦安县','甘肃省天水市秦安县','3','620500','CN',NULL,'1'),
 ('620523','甘肃省天水市甘谷县','甘肃省天水市甘谷县','3','620500','CN',NULL,'1'),
 ('620524','甘肃省天水市武山县','甘肃省天水市武山县','3','620500','CN',NULL,'1'),
 ('620525','甘肃省天水市张家川回族自治县','甘肃省天水市张家川回族自治县','3','620500','CN',NULL,'1'),
 ('620600','甘肃省武威市','甘肃省武威市','2','620000','CN',NULL,'1'),
 ('620601','甘肃省武威市市辖区','甘肃省武威市市辖区','3','620600','CN',NULL,'1'),
 ('620602','甘肃省武威市凉州区','甘肃省武威市凉州区','3','620600','CN',NULL,'1'),
 ('620621','甘肃省武威市民勤县','甘肃省武威市民勤县','3','620600','CN',NULL,'1'),
 ('620622','甘肃省武威市古浪县','甘肃省武威市古浪县','3','620600','CN',NULL,'1'),
 ('620623','甘肃省武威市天祝藏族自治县','甘肃省武威市天祝藏族自治县','3','620600','CN',NULL,'1'),
 ('620700','甘肃省张掖市','甘肃省张掖市','2','620000','CN',NULL,'1'),
 ('620701','甘肃省张掖市市辖区','甘肃省张掖市市辖区','3','620700','CN',NULL,'1'),
 ('620702','甘肃省张掖市甘州区','甘肃省张掖市甘州区','3','620700','CN',NULL,'1'),
 ('620721','甘肃省张掖市肃南裕固族自治县','甘肃省张掖市肃南裕固族自治县','3','620700','CN',NULL,'1'),
 ('620722','甘肃省张掖市民乐县','甘肃省张掖市民乐县','3','620700','CN',NULL,'1'),
 ('620723','甘肃省张掖市临泽县','甘肃省张掖市临泽县','3','620700','CN',NULL,'1'),
 ('620724','甘肃省张掖市高台县','甘肃省张掖市高台县','3','620700','CN',NULL,'1'),
 ('620725','甘肃省张掖市山丹县','甘肃省张掖市山丹县','3','620700','CN',NULL,'1'),
 ('620800','甘肃省平凉市','甘肃省平凉市','2','620000','CN',NULL,'1'),
 ('620801','甘肃省平凉市市辖区','甘肃省平凉市市辖区','3','620800','CN',NULL,'1'),
 ('620802','甘肃省平凉市崆峒区','甘肃省平凉市崆峒区','3','620800','CN',NULL,'1'),
 ('620821','甘肃省平凉市泾川县','甘肃省平凉市泾川县','3','620800','CN',NULL,'1'),
 ('620822','甘肃省平凉市灵台县','甘肃省平凉市灵台县','3','620800','CN',NULL,'1'),
 ('620823','甘肃省平凉市崇信县','甘肃省平凉市崇信县','3','620800','CN',NULL,'1'),
 ('620824','甘肃省平凉市华亭县','甘肃省平凉市华亭县','3','620800','CN',NULL,'1'),
 ('620825','甘肃省平凉市庄浪县','甘肃省平凉市庄浪县','3','620800','CN',NULL,'1'),
 ('620826','甘肃省平凉市静宁县','甘肃省平凉市静宁县','3','620800','CN',NULL,'1'),
 ('620900','甘肃省酒泉市','甘肃省酒泉市','2','620000','CN',NULL,'1'),
 ('620901','甘肃省酒泉市市辖区','甘肃省酒泉市市辖区','3','620900','CN',NULL,'1'),
 ('620902','甘肃省酒泉市肃州区','甘肃省酒泉市肃州区','3','620900','CN',NULL,'1'),
 ('620921','甘肃省酒泉市金塔县','甘肃省酒泉市金塔县','3','620900','CN',NULL,'1'),
 ('620922','甘肃省酒泉市安西县','甘肃省酒泉市安西县','3','620900','CN',NULL,'1'),
 ('620923','甘肃省酒泉市肃北蒙古族自治县','甘肃省酒泉市肃北蒙古族自治县','3','620900','CN',NULL,'1'),
 ('620924','甘肃省酒泉市阿克塞哈萨克族自治县','甘肃省酒泉市阿克塞哈萨克族自治县','3','620900','CN',NULL,'1'),
 ('620981','甘肃省酒泉市玉门市','甘肃省酒泉市玉门市','3','620900','CN',NULL,'1'),
 ('620982','甘肃省酒泉市敦煌市','甘肃省酒泉市敦煌市','3','620900','CN',NULL,'1'),
 ('621000','甘肃省庆阳市','甘肃省庆阳市','2','620000','CN',NULL,'1'),
 ('621001','甘肃省庆阳市市辖区','甘肃省庆阳市市辖区','3','621000','CN',NULL,'1'),
 ('621002','甘肃省庆阳市西峰区','甘肃省庆阳市西峰区','3','621000','CN',NULL,'1'),
 ('621021','甘肃省庆阳市庆城县','甘肃省庆阳市庆城县','3','621000','CN',NULL,'1'),
 ('621022','甘肃省庆阳市环县','甘肃省庆阳市环县','3','621000','CN',NULL,'1'),
 ('621023','甘肃省庆阳市华池县','甘肃省庆阳市华池县','3','621000','CN',NULL,'1'),
 ('621024','甘肃省庆阳市合水县','甘肃省庆阳市合水县','3','621000','CN',NULL,'1'),
 ('621025','甘肃省庆阳市正宁县','甘肃省庆阳市正宁县','3','621000','CN',NULL,'1'),
 ('621026','甘肃省庆阳市宁县','甘肃省庆阳市宁县','3','621000','CN',NULL,'1'),
 ('621027','甘肃省庆阳市镇原县','甘肃省庆阳市镇原县','3','621000','CN',NULL,'1'),
 ('621100','甘肃省定西市','甘肃省定西市','2','620000','CN',NULL,'1'),
 ('621101','甘肃省定西市市辖区','甘肃省定西市市辖区','3','621100','CN',NULL,'1'),
 ('621102','甘肃省定西市安定区','甘肃省定西市安定区','3','621100','CN',NULL,'1'),
 ('621121','甘肃省定西市通渭县','甘肃省定西市通渭县','3','621100','CN',NULL,'1'),
 ('621122','甘肃省定西市陇西县','甘肃省定西市陇西县','3','621100','CN',NULL,'1'),
 ('621123','甘肃省定西市渭源县','甘肃省定西市渭源县','3','621100','CN',NULL,'1'),
 ('621124','甘肃省定西市临洮县','甘肃省定西市临洮县','3','621100','CN',NULL,'1'),
 ('621125','甘肃省定西市漳县','甘肃省定西市漳县','3','621100','CN',NULL,'1'),
 ('621126','甘肃省定西市岷县','甘肃省定西市岷县','3','621100','CN',NULL,'1'),
 ('621200','甘肃省陇南市','甘肃省陇南市','2','620000','CN',NULL,'1'),
 ('621201','甘肃省陇南市市辖区','甘肃省陇南市市辖区','3','621200','CN',NULL,'1'),
 ('621202','甘肃省陇南市武都区','甘肃省陇南市武都区','3','621200','CN',NULL,'1'),
 ('621221','甘肃省陇南市成县','甘肃省陇南市成县','3','621200','CN',NULL,'1'),
 ('621222','甘肃省陇南市文县','甘肃省陇南市文县','3','621200','CN',NULL,'1'),
 ('621223','甘肃省陇南市宕昌县','甘肃省陇南市宕昌县','3','621200','CN',NULL,'1'),
 ('621224','甘肃省陇南市康县','甘肃省陇南市康县','3','621200','CN',NULL,'1'),
 ('621225','甘肃省陇南市西和县','甘肃省陇南市西和县','3','621200','CN',NULL,'1'),
 ('621226','甘肃省陇南市礼县','甘肃省陇南市礼县','3','621200','CN',NULL,'1'),
 ('621227','甘肃省陇南市徽县','甘肃省陇南市徽县','3','621200','CN',NULL,'1'),
 ('621228','甘肃省陇南市两当县','甘肃省陇南市两当县','3','621200','CN',NULL,'1'),
 ('622900','甘肃省临夏回族自治州','甘肃省临夏回族自治州','2','620000','CN',NULL,'1'),
 ('622901','甘肃省临夏回族自治州临夏市','甘肃省临夏回族自治州临夏市','3','622900','CN',NULL,'1'),
 ('622921','甘肃省临夏回族自治州临夏县','甘肃省临夏回族自治州临夏县','3','622900','CN',NULL,'1'),
 ('622922','甘肃省临夏回族自治州康乐县','甘肃省临夏回族自治州康乐县','3','622900','CN',NULL,'1'),
 ('622923','甘肃省临夏回族自治州永靖县','甘肃省临夏回族自治州永靖县','3','622900','CN',NULL,'1'),
 ('622924','甘肃省临夏回族自治州广河县','甘肃省临夏回族自治州广河县','3','622900','CN',NULL,'1'),
 ('622925','甘肃省临夏回族自治州和政县','甘肃省临夏回族自治州和政县','3','622900','CN',NULL,'1'),
 ('622926','甘肃省临夏回族自治州东乡族自治县','甘肃省临夏回族自治州东乡族自治县','3','622900','CN',NULL,'1'),
 ('622927','甘肃省临夏回族自治州积石山保安族东乡族撒拉族自治县','甘肃省临夏回族自治州积石山保安族东乡族撒拉族自治县','3','622900','CN',NULL,'1'),
 ('623000','甘肃省甘南藏族自治州','甘肃省甘南藏族自治州','2','620000','CN',NULL,'1'),
 ('623001','甘肃省甘南藏族自治州合作市','甘肃省甘南藏族自治州合作市','3','623000','CN',NULL,'1'),
 ('623021','甘肃省甘南藏族自治州临潭县','甘肃省甘南藏族自治州临潭县','3','623000','CN',NULL,'1'),
 ('623022','甘肃省甘南藏族自治州卓尼县','甘肃省甘南藏族自治州卓尼县','3','623000','CN',NULL,'1'),
 ('623023','甘肃省甘南藏族自治州舟曲县','甘肃省甘南藏族自治州舟曲县','3','623000','CN',NULL,'1'),
 ('623024','甘肃省甘南藏族自治州迭部县','甘肃省甘南藏族自治州迭部县','3','623000','CN',NULL,'1'),
 ('623025','甘肃省甘南藏族自治州玛曲县','甘肃省甘南藏族自治州玛曲县','3','623000','CN',NULL,'1'),
 ('623026','甘肃省甘南藏族自治州碌曲县','甘肃省甘南藏族自治州碌曲县','3','623000','CN',NULL,'1'),
 ('623027','甘肃省甘南藏族自治州夏河县','甘肃省甘南藏族自治州夏河县','3','623000','CN',NULL,'1'),
 ('630000','青海省','青海省','1','CN','CN',NULL,'1'),
 ('630100','青海省西宁市','青海省西宁市','2','630000','CN',NULL,'1'),
 ('630101','青海省西宁市市辖区','青海省西宁市市辖区','3','630100','CN',NULL,'1'),
 ('630102','青海省西宁市城东区','青海省西宁市城东区','3','630100','CN',NULL,'1'),
 ('630103','青海省西宁市城中区','青海省西宁市城中区','3','630100','CN',NULL,'1'),
 ('630104','青海省西宁市城西区','青海省西宁市城西区','3','630100','CN',NULL,'1'),
 ('630105','青海省西宁市城北区','青海省西宁市城北区','3','630100','CN',NULL,'1'),
 ('630121','青海省西宁市大通回族土族自治县','青海省西宁市大通回族土族自治县','3','630100','CN',NULL,'1'),
 ('630122','青海省西宁市湟中县','青海省西宁市湟中县','3','630100','CN',NULL,'1'),
 ('630123','青海省西宁市湟源县','青海省西宁市湟源县','3','630100','CN',NULL,'1'),
 ('632100','青海省海东地区','青海省海东地区','2','630000','CN',NULL,'1'),
 ('632121','青海省海东地区平安县','青海省海东地区平安县','3','632100','CN',NULL,'1'),
 ('632122','青海省海东地区民和回族土族自治县','青海省海东地区民和回族土族自治县','3','632100','CN',NULL,'1'),
 ('632123','青海省海东地区乐都县','青海省海东地区乐都县','3','632100','CN',NULL,'1'),
 ('632126','青海省海东地区互助土族自治县','青海省海东地区互助土族自治县','3','632100','CN',NULL,'1'),
 ('632127','青海省海东地区化隆回族自治县','青海省海东地区化隆回族自治县','3','632100','CN',NULL,'1'),
 ('632128','青海省海东地区循化撒拉族自治县','青海省海东地区循化撒拉族自治县','3','632100','CN',NULL,'1'),
 ('632200','青海省海北藏族自治州','青海省海北藏族自治州','2','630000','CN',NULL,'1'),
 ('632221','青海省海北藏族自治州门源回族自治县','青海省海北藏族自治州门源回族自治县','3','632200','CN',NULL,'1'),
 ('632222','青海省海北藏族自治州祁连县','青海省海北藏族自治州祁连县','3','632200','CN',NULL,'1'),
 ('632223','青海省海北藏族自治州海晏县','青海省海北藏族自治州海晏县','3','632200','CN',NULL,'1'),
 ('632224','青海省海北藏族自治州刚察县','青海省海北藏族自治州刚察县','3','632200','CN',NULL,'1'),
 ('632300','青海省黄南藏族自治州','青海省黄南藏族自治州','2','630000','CN',NULL,'1'),
 ('632321','青海省黄南藏族自治州同仁县','青海省黄南藏族自治州同仁县','3','632300','CN',NULL,'1'),
 ('632322','青海省黄南藏族自治州尖扎县','青海省黄南藏族自治州尖扎县','3','632300','CN',NULL,'1'),
 ('632323','青海省黄南藏族自治州泽库县','青海省黄南藏族自治州泽库县','3','632300','CN',NULL,'1'),
 ('632324','青海省黄南藏族自治州河南蒙古族自治县','青海省黄南藏族自治州河南蒙古族自治县','3','632300','CN',NULL,'1'),
 ('632500','青海省海南藏族自治州','青海省海南藏族自治州','2','630000','CN',NULL,'1'),
 ('632521','青海省海南藏族自治州共和县','青海省海南藏族自治州共和县','3','632500','CN',NULL,'1'),
 ('632522','青海省海南藏族自治州同德县','青海省海南藏族自治州同德县','3','632500','CN',NULL,'1'),
 ('632523','青海省海南藏族自治州贵德县','青海省海南藏族自治州贵德县','3','632500','CN',NULL,'1'),
 ('632524','青海省海南藏族自治州兴海县','青海省海南藏族自治州兴海县','3','632500','CN',NULL,'1'),
 ('632525','青海省海南藏族自治州贵南县','青海省海南藏族自治州贵南县','3','632500','CN',NULL,'1'),
 ('632600','青海省果洛藏族自治州','青海省果洛藏族自治州','2','630000','CN',NULL,'1'),
 ('632621','青海省果洛藏族自治州玛沁县','青海省果洛藏族自治州玛沁县','3','632600','CN',NULL,'1'),
 ('632622','青海省果洛藏族自治州班玛县','青海省果洛藏族自治州班玛县','3','632600','CN',NULL,'1'),
 ('632623','青海省果洛藏族自治州甘德县','青海省果洛藏族自治州甘德县','3','632600','CN',NULL,'1'),
 ('632624','青海省果洛藏族自治州达日县','青海省果洛藏族自治州达日县','3','632600','CN',NULL,'1'),
 ('632625','青海省果洛藏族自治州久治县','青海省果洛藏族自治州久治县','3','632600','CN',NULL,'1'),
 ('632626','青海省果洛藏族自治州玛多县','青海省果洛藏族自治州玛多县','3','632600','CN',NULL,'1'),
 ('632700','青海省玉树藏族自治州','青海省玉树藏族自治州','2','630000','CN',NULL,'1'),
 ('632721','青海省玉树藏族自治州玉树县','青海省玉树藏族自治州玉树县','3','632700','CN',NULL,'1'),
 ('632722','青海省玉树藏族自治州杂多县','青海省玉树藏族自治州杂多县','3','632700','CN',NULL,'1'),
 ('632723','青海省玉树藏族自治州称多县','青海省玉树藏族自治州称多县','3','632700','CN',NULL,'1'),
 ('632724','青海省玉树藏族自治州治多县','青海省玉树藏族自治州治多县','3','632700','CN',NULL,'1'),
 ('632725','青海省玉树藏族自治州囊谦县','青海省玉树藏族自治州囊谦县','3','632700','CN',NULL,'1'),
 ('632726','青海省玉树藏族自治州曲麻莱县','青海省玉树藏族自治州曲麻莱县','3','632700','CN',NULL,'1'),
 ('632800','青海省海西蒙古族藏族自治州','青海省海西蒙古族藏族自治州','2','630000','CN',NULL,'1'),
 ('632801','青海省海西蒙古族藏族自治州格尔木市','青海省海西蒙古族藏族自治州格尔木市','3','632800','CN',NULL,'1'),
 ('632802','青海省海西蒙古族藏族自治州德令哈市','青海省海西蒙古族藏族自治州德令哈市','3','632800','CN',NULL,'1'),
 ('632821','青海省海西蒙古族藏族自治州乌兰县','青海省海西蒙古族藏族自治州乌兰县','3','632800','CN',NULL,'1'),
 ('632822','青海省海西蒙古族藏族自治州都兰县','青海省海西蒙古族藏族自治州都兰县','3','632800','CN',NULL,'1'),
 ('632823','青海省海西蒙古族藏族自治州天峻县','青海省海西蒙古族藏族自治州天峻县','3','632800','CN',NULL,'1'),
 ('640000','宁夏回族自治区','宁夏回族自治区','1','CN','CN',NULL,'1'),
 ('640100','宁夏回族自治区银川市','宁夏回族自治区银川市','2','640000','CN',NULL,'1'),
 ('640101','宁夏回族自治区银川市市辖区','宁夏回族自治区银川市市辖区','3','640100','CN',NULL,'1'),
 ('640104','宁夏回族自治区银川市兴庆区','宁夏回族自治区银川市兴庆区','3','640100','CN',NULL,'1'),
 ('640105','宁夏回族自治区银川市西夏区','宁夏回族自治区银川市西夏区','3','640100','CN',NULL,'1'),
 ('640106','宁夏回族自治区银川市金凤区','宁夏回族自治区银川市金凤区','3','640100','CN',NULL,'1'),
 ('640121','宁夏回族自治区银川市永宁县','宁夏回族自治区银川市永宁县','3','640100','CN',NULL,'1'),
 ('640122','宁夏回族自治区银川市贺兰县','宁夏回族自治区银川市贺兰县','3','640100','CN',NULL,'1'),
 ('640181','宁夏回族自治区银川市灵武市','宁夏回族自治区银川市灵武市','3','640100','CN',NULL,'1'),
 ('640200','宁夏回族自治区石嘴山市','宁夏回族自治区石嘴山市','2','640000','CN',NULL,'1'),
 ('640201','宁夏回族自治区石嘴山市市辖区','宁夏回族自治区石嘴山市市辖区','3','640200','CN',NULL,'1'),
 ('640202','宁夏回族自治区石嘴山市大武口区','宁夏回族自治区石嘴山市大武口区','3','640200','CN',NULL,'1'),
 ('640205','宁夏回族自治区石嘴山市惠农区','宁夏回族自治区石嘴山市惠农区','3','640200','CN',NULL,'1'),
 ('640221','宁夏回族自治区石嘴山市平罗县','宁夏回族自治区石嘴山市平罗县','3','640200','CN',NULL,'1'),
 ('640300','宁夏回族自治区吴忠市','宁夏回族自治区吴忠市','2','640000','CN',NULL,'1'),
 ('640301','宁夏回族自治区吴忠市市辖区','宁夏回族自治区吴忠市市辖区','3','640300','CN',NULL,'1'),
 ('640302','宁夏回族自治区吴忠市利通区','宁夏回族自治区吴忠市利通区','3','640300','CN',NULL,'1'),
 ('640323','宁夏回族自治区吴忠市盐池县','宁夏回族自治区吴忠市盐池县','3','640300','CN',NULL,'1'),
 ('640324','宁夏回族自治区吴忠市同心县','宁夏回族自治区吴忠市同心县','3','640300','CN',NULL,'1'),
 ('640381','宁夏回族自治区吴忠市青铜峡市','宁夏回族自治区吴忠市青铜峡市','3','640300','CN',NULL,'1'),
 ('640400','宁夏回族自治区固原市','宁夏回族自治区固原市','2','640000','CN',NULL,'1'),
 ('640401','宁夏回族自治区固原市市辖区','宁夏回族自治区固原市市辖区','3','640400','CN',NULL,'1'),
 ('640402','宁夏回族自治区固原市原州区','宁夏回族自治区固原市原州区','3','640400','CN',NULL,'1'),
 ('640422','宁夏回族自治区固原市西吉县','宁夏回族自治区固原市西吉县','3','640400','CN',NULL,'1'),
 ('640423','宁夏回族自治区固原市隆德县','宁夏回族自治区固原市隆德县','3','640400','CN',NULL,'1'),
 ('640424','宁夏回族自治区固原市泾源县','宁夏回族自治区固原市泾源县','3','640400','CN',NULL,'1'),
 ('640425','宁夏回族自治区固原市彭阳县','宁夏回族自治区固原市彭阳县','3','640400','CN',NULL,'1'),
 ('640500','宁夏回族自治区中卫市','宁夏回族自治区中卫市','2','640000','CN',NULL,'1'),
 ('640501','宁夏回族自治区中卫市市辖区','宁夏回族自治区中卫市市辖区','3','640500','CN',NULL,'1'),
 ('640502','宁夏回族自治区中卫市沙坡头区','宁夏回族自治区中卫市沙坡头区','3','640500','CN',NULL,'1'),
 ('640521','宁夏回族自治区中卫市中宁县','宁夏回族自治区中卫市中宁县','3','640500','CN',NULL,'1'),
 ('640522','宁夏回族自治区中卫市海原县','宁夏回族自治区中卫市海原县','3','640500','CN',NULL,'1'),
 ('650000','新疆维吾尔自治区','新疆维吾尔自治区','1','CN','CN',NULL,'1'),
 ('650100','新疆维吾尔自治区乌鲁木齐市','新疆维吾尔自治区乌鲁木齐市','2','650000','CN',NULL,'1'),
 ('650101','新疆维吾尔自治区乌鲁木齐市市辖区','新疆维吾尔自治区乌鲁木齐市市辖区','3','650100','CN',NULL,'1'),
 ('650102','新疆维吾尔自治区乌鲁木齐市天山区','新疆维吾尔自治区乌鲁木齐市天山区','3','650100','CN',NULL,'1'),
 ('650103','新疆维吾尔自治区乌鲁木齐市沙依巴克区','新疆维吾尔自治区乌鲁木齐市沙依巴克区','3','650100','CN',NULL,'1'),
 ('650104','新疆维吾尔自治区乌鲁木齐市新市区','新疆维吾尔自治区乌鲁木齐市新市区','3','650100','CN',NULL,'1'),
 ('650105','新疆维吾尔自治区乌鲁木齐市水磨沟区','新疆维吾尔自治区乌鲁木齐市水磨沟区','3','650100','CN',NULL,'1'),
 ('650106','新疆维吾尔自治区乌鲁木齐市头屯河区','新疆维吾尔自治区乌鲁木齐市头屯河区','3','650100','CN',NULL,'1'),
 ('650107','新疆维吾尔自治区乌鲁木齐市达坂城区','新疆维吾尔自治区乌鲁木齐市达坂城区','3','650100','CN',NULL,'1'),
 ('650108','新疆维吾尔自治区乌鲁木齐市东山区','新疆维吾尔自治区乌鲁木齐市东山区','3','650100','CN',NULL,'1'),
 ('650121','新疆维吾尔自治区乌鲁木齐市乌鲁木齐县','新疆维吾尔自治区乌鲁木齐市乌鲁木齐县','3','650100','CN',NULL,'1'),
 ('650200','新疆维吾尔自治区克拉玛依市','新疆维吾尔自治区克拉玛依市','2','650000','CN',NULL,'1'),
 ('650201','新疆维吾尔自治区克拉玛依市市辖区','新疆维吾尔自治区克拉玛依市市辖区','3','650200','CN',NULL,'1'),
 ('650202','新疆维吾尔自治区克拉玛依市独山子区','新疆维吾尔自治区克拉玛依市独山子区','3','650200','CN',NULL,'1'),
 ('650203','新疆维吾尔自治区克拉玛依市克拉玛依区','新疆维吾尔自治区克拉玛依市克拉玛依区','3','650200','CN',NULL,'1'),
 ('650204','新疆维吾尔自治区克拉玛依市白碱滩区','新疆维吾尔自治区克拉玛依市白碱滩区','3','650200','CN',NULL,'1'),
 ('650205','新疆维吾尔自治区克拉玛依市乌尔禾区','新疆维吾尔自治区克拉玛依市乌尔禾区','3','650200','CN',NULL,'1'),
 ('652100','新疆维吾尔自治区吐鲁番地区','新疆维吾尔自治区吐鲁番地区','2','650000','CN',NULL,'1'),
 ('652101','新疆维吾尔自治区吐鲁番地区吐鲁番市','新疆维吾尔自治区吐鲁番地区吐鲁番市','3','652100','CN',NULL,'1'),
 ('652122','新疆维吾尔自治区吐鲁番地区鄯善县','新疆维吾尔自治区吐鲁番地区鄯善县','3','652100','CN',NULL,'1'),
 ('652123','新疆维吾尔自治区吐鲁番地区托克逊县','新疆维吾尔自治区吐鲁番地区托克逊县','3','652100','CN',NULL,'1'),
 ('652200','新疆维吾尔自治区哈密地区','新疆维吾尔自治区哈密地区','2','650000','CN',NULL,'1'),
 ('652201','新疆维吾尔自治区哈密地区哈密市','新疆维吾尔自治区哈密地区哈密市','3','652200','CN',NULL,'1'),
 ('652222','新疆维吾尔自治区哈密地区巴里坤哈萨克自治县','新疆维吾尔自治区哈密地区巴里坤哈萨克自治县','3','652200','CN',NULL,'1'),
 ('652223','新疆维吾尔自治区哈密地区伊吾县','新疆维吾尔自治区哈密地区伊吾县','3','652200','CN',NULL,'1'),
 ('652300','新疆维吾尔自治区昌吉回族自治州','新疆维吾尔自治区昌吉回族自治州','2','650000','CN',NULL,'1'),
 ('652301','新疆维吾尔自治区昌吉回族自治州昌吉市','新疆维吾尔自治区昌吉回族自治州昌吉市','3','652300','CN',NULL,'1'),
 ('652302','新疆维吾尔自治区昌吉回族自治州阜康市','新疆维吾尔自治区昌吉回族自治州阜康市','3','652300','CN',NULL,'1'),
 ('652303','新疆维吾尔自治区昌吉回族自治州米泉市','新疆维吾尔自治区昌吉回族自治州米泉市','3','652300','CN',NULL,'1'),
 ('652323','新疆维吾尔自治区昌吉回族自治州呼图壁县','新疆维吾尔自治区昌吉回族自治州呼图壁县','3','652300','CN',NULL,'1'),
 ('652324','新疆维吾尔自治区昌吉回族自治州玛纳斯县','新疆维吾尔自治区昌吉回族自治州玛纳斯县','3','652300','CN',NULL,'1'),
 ('652325','新疆维吾尔自治区昌吉回族自治州奇台县','新疆维吾尔自治区昌吉回族自治州奇台县','3','652300','CN',NULL,'1'),
 ('652327','新疆维吾尔自治区昌吉回族自治州吉木萨尔县','新疆维吾尔自治区昌吉回族自治州吉木萨尔县','3','652300','CN',NULL,'1'),
 ('652328','新疆维吾尔自治区昌吉回族自治州木垒哈萨克自治县','新疆维吾尔自治区昌吉回族自治州木垒哈萨克自治县','3','652300','CN',NULL,'1'),
 ('652700','新疆维吾尔自治区博尔塔拉蒙古自治州','新疆维吾尔自治区博尔塔拉蒙古自治州','2','650000','CN',NULL,'1'),
 ('652701','新疆维吾尔自治区博尔塔拉蒙古自治州博乐市','新疆维吾尔自治区博尔塔拉蒙古自治州博乐市','3','652700','CN',NULL,'1'),
 ('652722','新疆维吾尔自治区博尔塔拉蒙古自治州精河县','新疆维吾尔自治区博尔塔拉蒙古自治州精河县','3','652700','CN',NULL,'1'),
 ('652723','新疆维吾尔自治区博尔塔拉蒙古自治州温泉县','新疆维吾尔自治区博尔塔拉蒙古自治州温泉县','3','652700','CN',NULL,'1'),
 ('652800','新疆维吾尔自治区巴音郭楞蒙古自治州','新疆维吾尔自治区巴音郭楞蒙古自治州','2','650000','CN',NULL,'1'),
 ('652801','新疆维吾尔自治区巴音郭楞蒙古自治州库尔勒市','新疆维吾尔自治区巴音郭楞蒙古自治州库尔勒市','3','652800','CN',NULL,'1'),
 ('652822','新疆维吾尔自治区巴音郭楞蒙古自治州轮台县','新疆维吾尔自治区巴音郭楞蒙古自治州轮台县','3','652800','CN',NULL,'1'),
 ('652823','新疆维吾尔自治区巴音郭楞蒙古自治州尉犁县','新疆维吾尔自治区巴音郭楞蒙古自治州尉犁县','3','652800','CN',NULL,'1'),
 ('652824','新疆维吾尔自治区巴音郭楞蒙古自治州若羌县','新疆维吾尔自治区巴音郭楞蒙古自治州若羌县','3','652800','CN',NULL,'1'),
 ('652825','新疆维吾尔自治区巴音郭楞蒙古自治州且末县','新疆维吾尔自治区巴音郭楞蒙古自治州且末县','3','652800','CN',NULL,'1'),
 ('652826','新疆维吾尔自治区巴音郭楞蒙古自治州焉耆回族自治县','新疆维吾尔自治区巴音郭楞蒙古自治州焉耆回族自治县','3','652800','CN',NULL,'1'),
 ('652827','新疆维吾尔自治区巴音郭楞蒙古自治州和静县','新疆维吾尔自治区巴音郭楞蒙古自治州和静县','3','652800','CN',NULL,'1'),
 ('652828','新疆维吾尔自治区巴音郭楞蒙古自治州和硕县','新疆维吾尔自治区巴音郭楞蒙古自治州和硕县','3','652800','CN',NULL,'1'),
 ('652829','新疆维吾尔自治区巴音郭楞蒙古自治州博湖县','新疆维吾尔自治区巴音郭楞蒙古自治州博湖县','3','652800','CN',NULL,'1'),
 ('652900','新疆维吾尔自治区阿克苏地区','新疆维吾尔自治区阿克苏地区','2','650000','CN',NULL,'1'),
 ('652901','新疆维吾尔自治区阿克苏地区阿克苏市','新疆维吾尔自治区阿克苏地区阿克苏市','3','652900','CN',NULL,'1'),
 ('652922','新疆维吾尔自治区阿克苏地区温宿县','新疆维吾尔自治区阿克苏地区温宿县','3','652900','CN',NULL,'1'),
 ('652923','新疆维吾尔自治区阿克苏地区库车县','新疆维吾尔自治区阿克苏地区库车县','3','652900','CN',NULL,'1'),
 ('652924','新疆维吾尔自治区阿克苏地区沙雅县','新疆维吾尔自治区阿克苏地区沙雅县','3','652900','CN',NULL,'1'),
 ('652925','新疆维吾尔自治区阿克苏地区新和县','新疆维吾尔自治区阿克苏地区新和县','3','652900','CN',NULL,'1'),
 ('652926','新疆维吾尔自治区阿克苏地区拜城县','新疆维吾尔自治区阿克苏地区拜城县','3','652900','CN',NULL,'1'),
 ('652927','新疆维吾尔自治区阿克苏地区乌什县','新疆维吾尔自治区阿克苏地区乌什县','3','652900','CN',NULL,'1'),
 ('652928','新疆维吾尔自治区阿克苏地区阿瓦提县','新疆维吾尔自治区阿克苏地区阿瓦提县','3','652900','CN',NULL,'1'),
 ('652929','新疆维吾尔自治区阿克苏地区柯坪县','新疆维吾尔自治区阿克苏地区柯坪县','3','652900','CN',NULL,'1'),
 ('653000','新疆维吾尔自治区克孜勒苏柯尔克孜自治州','新疆维吾尔自治区克孜勒苏柯尔克孜自治州','2','650000','CN',NULL,'1'),
 ('653001','新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿图什市','新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿图什市','3','653000','CN',NULL,'1'),
 ('653022','新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿克陶县','新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿克陶县','3','653000','CN',NULL,'1'),
 ('653023','新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿合奇县','新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿合奇县','3','653000','CN',NULL,'1'),
 ('653024','新疆维吾尔自治区克孜勒苏柯尔克孜自治州乌恰县','新疆维吾尔自治区克孜勒苏柯尔克孜自治州乌恰县','3','653000','CN',NULL,'1'),
 ('653100','新疆维吾尔自治区喀什地区','新疆维吾尔自治区喀什地区','2','650000','CN',NULL,'1'),
 ('653101','新疆维吾尔自治区喀什地区喀什市','新疆维吾尔自治区喀什地区喀什市','3','653100','CN',NULL,'1'),
 ('653121','新疆维吾尔自治区喀什地区疏附县','新疆维吾尔自治区喀什地区疏附县','3','653100','CN',NULL,'1'),
 ('653122','新疆维吾尔自治区喀什地区疏勒县','新疆维吾尔自治区喀什地区疏勒县','3','653100','CN',NULL,'1'),
 ('653123','新疆维吾尔自治区喀什地区英吉沙县','新疆维吾尔自治区喀什地区英吉沙县','3','653100','CN',NULL,'1'),
 ('653124','新疆维吾尔自治区喀什地区泽普县','新疆维吾尔自治区喀什地区泽普县','3','653100','CN',NULL,'1'),
 ('653125','新疆维吾尔自治区喀什地区莎车县','新疆维吾尔自治区喀什地区莎车县','3','653100','CN',NULL,'1'),
 ('653126','新疆维吾尔自治区喀什地区叶城县','新疆维吾尔自治区喀什地区叶城县','3','653100','CN',NULL,'1'),
 ('653127','新疆维吾尔自治区喀什地区麦盖提县','新疆维吾尔自治区喀什地区麦盖提县','3','653100','CN',NULL,'1'),
 ('653128','新疆维吾尔自治区喀什地区岳普湖县','新疆维吾尔自治区喀什地区岳普湖县','3','653100','CN',NULL,'1'),
 ('653129','新疆维吾尔自治区喀什地区伽师县','新疆维吾尔自治区喀什地区伽师县','3','653100','CN',NULL,'1'),
 ('653130','新疆维吾尔自治区喀什地区巴楚县','新疆维吾尔自治区喀什地区巴楚县','3','653100','CN',NULL,'1'),
 ('653131','新疆维吾尔自治区喀什地区塔什库尔干塔吉克自治县','新疆维吾尔自治区喀什地区塔什库尔干塔吉克自治县','3','653100','CN',NULL,'1'),
 ('653200','新疆维吾尔自治区和田地区','新疆维吾尔自治区和田地区','2','650000','CN',NULL,'1'),
 ('653201','新疆维吾尔自治区和田地区和田市','新疆维吾尔自治区和田地区和田市','3','653200','CN',NULL,'1'),
 ('653221','新疆维吾尔自治区和田地区和田县','新疆维吾尔自治区和田地区和田县','3','653200','CN',NULL,'1'),
 ('653222','新疆维吾尔自治区和田地区墨玉县','新疆维吾尔自治区和田地区墨玉县','3','653200','CN',NULL,'1'),
 ('653223','新疆维吾尔自治区和田地区皮山县','新疆维吾尔自治区和田地区皮山县','3','653200','CN',NULL,'1'),
 ('653224','新疆维吾尔自治区和田地区洛浦县','新疆维吾尔自治区和田地区洛浦县','3','653200','CN',NULL,'1'),
 ('653225','新疆维吾尔自治区和田地区策勒县','新疆维吾尔自治区和田地区策勒县','3','653200','CN',NULL,'1'),
 ('653226','新疆维吾尔自治区和田地区于田县','新疆维吾尔自治区和田地区于田县','3','653200','CN',NULL,'1'),
 ('653227','新疆维吾尔自治区和田地区民丰县','新疆维吾尔自治区和田地区民丰县','3','653200','CN',NULL,'1'),
 ('654000','新疆维吾尔自治区伊犁哈萨克自治州','新疆维吾尔自治区伊犁哈萨克自治州','2','650000','CN',NULL,'1'),
 ('654002','新疆维吾尔自治区伊犁哈萨克自治州伊宁市','新疆维吾尔自治区伊犁哈萨克自治州伊宁市','3','654000','CN',NULL,'1'),
 ('654003','新疆维吾尔自治区伊犁哈萨克自治州奎屯市','新疆维吾尔自治区伊犁哈萨克自治州奎屯市','3','654000','CN',NULL,'1'),
 ('654021','新疆维吾尔自治区伊犁哈萨克自治州伊宁县','新疆维吾尔自治区伊犁哈萨克自治州伊宁县','3','654000','CN',NULL,'1'),
 ('654022','新疆维吾尔自治区伊犁哈萨克自治州察布查尔锡伯自治县','新疆维吾尔自治区伊犁哈萨克自治州察布查尔锡伯自治县','3','654000','CN',NULL,'1'),
 ('654023','新疆维吾尔自治区伊犁哈萨克自治州霍城县','新疆维吾尔自治区伊犁哈萨克自治州霍城县','3','654000','CN',NULL,'1'),
 ('654024','新疆维吾尔自治区伊犁哈萨克自治州巩留县','新疆维吾尔自治区伊犁哈萨克自治州巩留县','3','654000','CN',NULL,'1'),
 ('654025','新疆维吾尔自治区伊犁哈萨克自治州新源县','新疆维吾尔自治区伊犁哈萨克自治州新源县','3','654000','CN',NULL,'1'),
 ('654026','新疆维吾尔自治区伊犁哈萨克自治州昭苏县','新疆维吾尔自治区伊犁哈萨克自治州昭苏县','3','654000','CN',NULL,'1'),
 ('654027','新疆维吾尔自治区伊犁哈萨克自治州特克斯县','新疆维吾尔自治区伊犁哈萨克自治州特克斯县','3','654000','CN',NULL,'1'),
 ('654028','新疆维吾尔自治区伊犁哈萨克自治州尼勒克县','新疆维吾尔自治区伊犁哈萨克自治州尼勒克县','3','654000','CN',NULL,'1'),
 ('654200','新疆维吾尔自治区塔城地区','新疆维吾尔自治区塔城地区','2','650000','CN',NULL,'1'),
 ('654201','新疆维吾尔自治区塔城地区塔城市','新疆维吾尔自治区塔城地区塔城市','3','654200','CN',NULL,'1'),
 ('654202','新疆维吾尔自治区塔城地区乌苏市','新疆维吾尔自治区塔城地区乌苏市','3','654200','CN',NULL,'1'),
 ('654221','新疆维吾尔自治区塔城地区额敏县','新疆维吾尔自治区塔城地区额敏县','3','654200','CN',NULL,'1'),
 ('654223','新疆维吾尔自治区塔城地区沙湾县','新疆维吾尔自治区塔城地区沙湾县','3','654200','CN',NULL,'1'),
 ('654224','新疆维吾尔自治区塔城地区托里县','新疆维吾尔自治区塔城地区托里县','3','654200','CN',NULL,'1'),
 ('654225','新疆维吾尔自治区塔城地区裕民县','新疆维吾尔自治区塔城地区裕民县','3','654200','CN',NULL,'1'),
 ('654226','新疆维吾尔自治区塔城地区和布克赛尔蒙古自治县','新疆维吾尔自治区塔城地区和布克赛尔蒙古自治县','3','654200','CN',NULL,'1'),
 ('654300','新疆维吾尔自治区阿勒泰地区','新疆维吾尔自治区阿勒泰地区','2','650000','CN',NULL,'1'),
 ('654301','新疆维吾尔自治区阿勒泰地区阿勒泰市','新疆维吾尔自治区阿勒泰地区阿勒泰市','3','654300','CN',NULL,'1'),
 ('654321','新疆维吾尔自治区阿勒泰地区布尔津县','新疆维吾尔自治区阿勒泰地区布尔津县','3','654300','CN',NULL,'1'),
 ('654322','新疆维吾尔自治区阿勒泰地区富蕴县','新疆维吾尔自治区阿勒泰地区富蕴县','3','654300','CN',NULL,'1'),
 ('654323','新疆维吾尔自治区阿勒泰地区福海县','新疆维吾尔自治区阿勒泰地区福海县','3','654300','CN',NULL,'1'),
 ('654324','新疆维吾尔自治区阿勒泰地区哈巴河县','新疆维吾尔自治区阿勒泰地区哈巴河县','3','654300','CN',NULL,'1'),
 ('654325','新疆维吾尔自治区阿勒泰地区青河县','新疆维吾尔自治区阿勒泰地区青河县','3','654300','CN',NULL,'1'),
 ('654326','新疆维吾尔自治区阿勒泰地区吉木乃县','新疆维吾尔自治区阿勒泰地区吉木乃县','3','654300','CN',NULL,'1'),
 ('659000','新疆维吾尔自治区省直辖行政单位','新疆维吾尔自治区省直辖行政单位','2','650000','CN',NULL,'1'),
 ('659001','新疆维吾尔自治区省直辖行政单位石河子市','新疆维吾尔自治区省直辖行政单位石河子市','3','659000','CN',NULL,'1'),
 ('659002','新疆维吾尔自治区省直辖行政单位阿拉尔市','新疆维吾尔自治区省直辖行政单位阿拉尔市','3','659000','CN',NULL,'1'),
 ('659003','新疆维吾尔自治区省直辖行政单位图木舒克市','新疆维吾尔自治区省直辖行政单位图木舒克市','3','659000','CN',NULL,'1'),
 ('659004','新疆维吾尔自治区省直辖行政单位五家渠市','新疆维吾尔自治区省直辖行政单位五家渠市','3','659000','CN',NULL,'1'),
 ('710000','台湾省','台湾省','1','CN','CN',NULL,'1'),
 ('810000','香港特别行政区','香港特别行政区','1','CN','CN',NULL,'1'),
 ('820000','澳门特别行政区','澳门特别行政区','1','CN','CN',NULL,'1');
/*!40000 ALTER TABLE `pub_cant` ENABLE KEYS */;


--
-- Definition of table `pub_cant_type`
--

DROP TABLE IF EXISTS `pub_cant_type`;
CREATE TABLE `pub_cant_type` (
  `CANT_TYPE` varchar(10) NOT NULL,
  `TYPE_NAME` varchar(60) NOT NULL,
  `IN_USE` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`CANT_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_cant_type`
--

/*!40000 ALTER TABLE `pub_cant_type` DISABLE KEYS */;
INSERT INTO `pub_cant_type` (`CANT_TYPE`,`TYPE_NAME`,`IN_USE`) VALUES 
 ('0','全国','1'),
 ('1','省（直辖市）','1'),
 ('2','市','1'),
 ('3','县','1'),
 ('4','乡（镇）','1');
/*!40000 ALTER TABLE `pub_cant_type` ENABLE KEYS */;


--
-- Definition of table `pub_cert_user`
--

DROP TABLE IF EXISTS `pub_cert_user`;
CREATE TABLE `pub_cert_user` (
  `DN` varchar(250) NOT NULL,
  `USER_ID` varchar(250) NOT NULL,
  PRIMARY KEY (`DN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_cert_user`
--

/*!40000 ALTER TABLE `pub_cert_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_cert_user` ENABLE KEYS */;


--
-- Definition of table `pub_cmd_log`
--

DROP TABLE IF EXISTS `pub_cmd_log`;
CREATE TABLE `pub_cmd_log` (
  `LOG_ID` varchar(30) NOT NULL,
  `BEAN_ID` varchar(50) NOT NULL,
  `METHOD` varchar(50) DEFAULT NULL,
  `BEAN_CLASS` varchar(200) NOT NULL,
  `STARTTIME` decimal(18,0) DEFAULT NULL,
  `ENDTIME` decimal(18,0) DEFAULT NULL,
  `SECURITY_LOG_ID` varchar(30) DEFAULT NULL,
  `CONN_NUMBER` int(11) DEFAULT NULL,
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_cmd_log`
--

/*!40000 ALTER TABLE `pub_cmd_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_cmd_log` ENABLE KEYS */;


--
-- Definition of table `pub_comhelp`
--

DROP TABLE IF EXISTS `pub_comhelp`;
CREATE TABLE `pub_comhelp` (
  `HELP_ID` varchar(36) NOT NULL,
  `HELP_TITLE` varchar(80) NOT NULL,
  `HELP_SQL` varchar(2000) NOT NULL,
  `ID_FIELD` varchar(50) NOT NULL,
  `NAME_FIELD` varchar(50) NOT NULL,
  `SHOW_FIELD` varchar(300) DEFAULT NULL,
  `RETURN_FIELD` varchar(300) DEFAULT NULL,
  `SHEARCH_FIELD` varchar(300) DEFAULT NULL,
  `SHOW_NAME` varchar(500) DEFAULT NULL,
  `HELP_TABLE` varchar(40) NOT NULL,
  `HELP_NOTE` varchar(100) DEFAULT NULL,
  `DATASOURCE` varchar(60) DEFAULT NULL,
  `NOTE` varchar(30) DEFAULT NULL,
  `NOTE2` varchar(30) DEFAULT NULL,
  `NOTE3` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`HELP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_comhelp`
--

/*!40000 ALTER TABLE `pub_comhelp` DISABLE KEYS */;
INSERT INTO `pub_comhelp` (`HELP_ID`,`HELP_TITLE`,`HELP_SQL`,`ID_FIELD`,`NAME_FIELD`,`SHOW_FIELD`,`RETURN_FIELD`,`SHEARCH_FIELD`,`SHOW_NAME`,`HELP_TABLE`,`HELP_NOTE`,`DATASOURCE`,`NOTE`,`NOTE2`,`NOTE3`) VALUES 
 ('helpUser','选择用户','select USER_ID,USER_NAME from PUB_USERS where CORPORATION_ID =\'@CORPORATION_ID@\'','USER_ID','USER_NAME','USER_ID,USER_NAME','USER_ID,USER_NAME','USER_ID,USER_NAME','USER_ID#用户帐号#,USER_NAME#用户名称#','PUB_USERS','根据传入的法人的STRU_ID ,显示该法人下面的用户','','','',''),
 ('helpUserNoPub','用户选择','select PUB_USERS.USER_ID USER_ID,PUB_USERS.USER_NAME USER_NAME ,PUB_STRU.ORGAN_ALIAS DPTNAME from PUB_USERS,PUB_STRU where PUB_USERS.DEPARTMENT_ID=PUB_STRU.STRU_ID and PUB_USERS.IS_CPUBLIC=\'0\' and PUB_USERS.MAX_SESSIONS!=\'0\'','USER_ID','USER_NAME','USER_ID,USER_NAME,DPTNAME','USER_ID,USER_NAME,DPTNAME','USER_ID,USER_NAME','USER_ID#用户登录号#,USER_NAME#用户账户名称#,DPTNAME#所在部门#','PUB_USERS','不包含公用账号的用户选择','','','',''),
 ('wf_processhelp','流程选择','select WF_PROCESS_MGR.DEFINITION_ID , WF_PROCESS_MGR.PROCESS_NAME from WF_PROCESS_MGR WF_PROCESS_MGR,(select DEFINITION_ID,max(PROC_VERSION) PROC_VERSION from WF_PROCESS_MGR group by DEFINITION_ID) x where WF_PROCESS_MGR.PROC_VERSION=x.PROC_VERSION and WF_PROCESS_MGR.DEFINITION_ID=x.DEFINITION_ID','DEFINITION_ID','PROCESS_NAME','PROCESS_NAME','DEFINITION_ID,PROCESS_NAME','PROCESS_NAME','DEFINITION_ID#流程定义ID#,PROCESS_NAME#流程名称#200','WF_PROCESS_MGR','显示所有已经载入的流程','','','','');
/*!40000 ALTER TABLE `pub_comhelp` ENABLE KEYS */;


--
-- Definition of table `pub_common_parms`
--

DROP TABLE IF EXISTS `pub_common_parms`;
CREATE TABLE `pub_common_parms` (
  `PARMS_CODE` varchar(30) NOT NULL,
  `PARMS_NAME` varchar(30) NOT NULL,
  `PARMS_VALUE` varchar(250) NOT NULL,
  `NOTE` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_common_parms`
--

/*!40000 ALTER TABLE `pub_common_parms` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_common_parms` ENABLE KEYS */;


--
-- Definition of table `pub_common_single_parms`
--

DROP TABLE IF EXISTS `pub_common_single_parms`;
CREATE TABLE `pub_common_single_parms` (
  `ORGAN_ID` varchar(30) NOT NULL,
  `EDIT_FILE_ID` varchar(30) DEFAULT NULL,
  `SHOW_FILE_ID` varchar(30) DEFAULT NULL,
  `SINGEL_STYLE` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ORGAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_common_single_parms`
--

/*!40000 ALTER TABLE `pub_common_single_parms` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_common_single_parms` ENABLE KEYS */;


--
-- Definition of table `pub_conf_roles`
--

DROP TABLE IF EXISTS `pub_conf_roles`;
CREATE TABLE `pub_conf_roles` (
  `ROLE_ID` varchar(30) NOT NULL,
  `SET_ID` varchar(30) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`SET_ID`),
  KEY `PUBCONFROLES_FK2` (`SET_ID`),
  CONSTRAINT `PUBCONFROLES_FK1` FOREIGN KEY (`ROLE_ID`) REFERENCES `pub_roles` (`ROLE_ID`),
  CONSTRAINT `PUBCONFROLES_FK2` FOREIGN KEY (`SET_ID`) REFERENCES `pub_conf_roleset` (`SET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_conf_roles`
--

/*!40000 ALTER TABLE `pub_conf_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_conf_roles` ENABLE KEYS */;


--
-- Definition of table `pub_conf_roleset`
--

DROP TABLE IF EXISTS `pub_conf_roleset`;
CREATE TABLE `pub_conf_roleset` (
  `SET_ID` varchar(30) NOT NULL,
  `SET_NAME` varchar(30) NOT NULL,
  `CARDINALITY` int(11) NOT NULL DEFAULT '-1',
  `CORPORATION_ID` varchar(30) NOT NULL,
  PRIMARY KEY (`SET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_conf_roleset`
--

/*!40000 ALTER TABLE `pub_conf_roleset` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_conf_roleset` ENABLE KEYS */;


--
-- Definition of table `pub_country`
--

DROP TABLE IF EXISTS `pub_country`;
CREATE TABLE `pub_country` (
  `COUNTRY_CODE` varchar(10) NOT NULL,
  `COUNTRY_NAME` varchar(100) NOT NULL,
  `SHORT_NAME` varchar(20) NOT NULL,
  `IN_USE` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`COUNTRY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_country`
--

/*!40000 ALTER TABLE `pub_country` DISABLE KEYS */;
INSERT INTO `pub_country` (`COUNTRY_CODE`,`COUNTRY_NAME`,`SHORT_NAME`,`IN_USE`) VALUES 
 ('CN','中国','中国','1');
/*!40000 ALTER TABLE `pub_country` ENABLE KEYS */;


--
-- Definition of table `pub_data_res_type`
--

DROP TABLE IF EXISTS `pub_data_res_type`;
CREATE TABLE `pub_data_res_type` (
  `DATA_RES_TYPE` varchar(10) NOT NULL,
  `TYPE_NAME` varchar(30) NOT NULL,
  `IS_STRU` char(1) NOT NULL,
  `RES_TABLE` varchar(30) DEFAULT NULL,
  `RES_TABLE_NAME` varchar(30) DEFAULT NULL,
  `VALUE_COL` varchar(30) DEFAULT NULL,
  `VALUE_COL_DES` varchar(60) DEFAULT NULL,
  `NAME_COL` varchar(30) DEFAULT NULL,
  `NAME_COL_DES` varchar(60) DEFAULT NULL,
  `IS_WHERE` char(1) DEFAULT '0',
  `FILTER_FIELD` varchar(600) DEFAULT NULL,
  `MEMO` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`DATA_RES_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_data_res_type`
--

/*!40000 ALTER TABLE `pub_data_res_type` DISABLE KEYS */;
INSERT INTO `pub_data_res_type` (`DATA_RES_TYPE`,`TYPE_NAME`,`IS_STRU`,`RES_TABLE`,`RES_TABLE_NAME`,`VALUE_COL`,`VALUE_COL_DES`,`NAME_COL`,`NAME_COL_DES`,`IS_WHERE`,`FILTER_FIELD`,`MEMO`) VALUES 
 ('1','公司','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('2','部门','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('4','仓库','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('6','岗位','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('8','职工','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('MSG_TYPE','消息类型','0','MP_MESSAGE_TYPE','MP_MESSAGE_TYPE','MSG_TYPE_CODE','MSG_TYPE_CODE','MSG_TYPE_NAME','MSG_TYPE_NAME','0','','');
/*!40000 ALTER TABLE `pub_data_res_type` ENABLE KEYS */;


--
-- Definition of table `pub_example_organ`
--

DROP TABLE IF EXISTS `pub_example_organ`;
CREATE TABLE `pub_example_organ` (
  `ORGAN_ID` varchar(200) NOT NULL,
  `TEL` varchar(30) DEFAULT NULL,
  `WWW` varchar(80) DEFAULT NULL,
  `E_MAIL` varchar(80) DEFAULT NULL,
  `MSN` varchar(80) DEFAULT NULL,
  `QQ` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ORGAN_ID`),
  CONSTRAINT `PUBEXAMPLEORGAN_FK` FOREIGN KEY (`ORGAN_ID`) REFERENCES `pub_organ` (`ORGAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_example_organ`
--

/*!40000 ALTER TABLE `pub_example_organ` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_example_organ` ENABLE KEYS */;


--
-- Definition of table `pub_fin_month`
--

DROP TABLE IF EXISTS `pub_fin_month`;
CREATE TABLE `pub_fin_month` (
  `ID` varchar(30) NOT NULL,
  `ORGAN_ID` varchar(30) NOT NULL,
  `FIN_YEAR` char(4) NOT NULL,
  `FIN_MONTH` char(6) NOT NULL,
  `BEGIN_DATE` char(8) NOT NULL,
  `END_DATE` char(8) NOT NULL,
  `SEQ` int(11) NOT NULL,
  `IS_CLOSED` char(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_fin_month`
--

/*!40000 ALTER TABLE `pub_fin_month` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_fin_month` ENABLE KEYS */;


--
-- Definition of table `pub_fin_mperiod`
--

DROP TABLE IF EXISTS `pub_fin_mperiod`;
CREATE TABLE `pub_fin_mperiod` (
  `ID` varchar(30) NOT NULL,
  `ORGAN_ID` varchar(30) NOT NULL,
  `FIN_YEAR` char(4) NOT NULL,
  `PTYPE` varchar(10) NOT NULL,
  `BEGIN_MONTH` char(6) NOT NULL,
  `END_MONTH` char(6) NOT NULL,
  `SEQ` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_fin_mperiod`
--

/*!40000 ALTER TABLE `pub_fin_mperiod` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_fin_mperiod` ENABLE KEYS */;


--
-- Definition of table `pub_fin_ptype`
--

DROP TABLE IF EXISTS `pub_fin_ptype`;
CREATE TABLE `pub_fin_ptype` (
  `PTYPE` varchar(10) NOT NULL,
  `TYPE_NAME` varchar(40) NOT NULL,
  `IN_USE` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`PTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_fin_ptype`
--

/*!40000 ALTER TABLE `pub_fin_ptype` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_fin_ptype` ENABLE KEYS */;


--
-- Definition of table `pub_fin_year`
--

DROP TABLE IF EXISTS `pub_fin_year`;
CREATE TABLE `pub_fin_year` (
  `ID` varchar(30) NOT NULL,
  `ORGAN_ID` varchar(30) NOT NULL,
  `FIN_YEAR` char(4) NOT NULL,
  `BEGIN_DATE` char(8) NOT NULL,
  `END_DATE` char(8) NOT NULL,
  `PERIOD_NUM` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_fin_year`
--

/*!40000 ALTER TABLE `pub_fin_year` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_fin_year` ENABLE KEYS */;


--
-- Definition of table `pub_functions`
--

DROP TABLE IF EXISTS `pub_functions`;
CREATE TABLE `pub_functions` (
  `FUNCTION_ID` varchar(30) NOT NULL,
  `FUNCTION_CODE` varchar(99) NOT NULL,
  `FUNCTION_NAME` varchar(40) NOT NULL,
  `MODULE_ID` varchar(30) NOT NULL,
  `IS_SYS` char(1) NOT NULL DEFAULT '0',
  `DATA_RES_TYPE` varchar(10) DEFAULT NULL,
  `SEQ` int(11) DEFAULT NULL,
  PRIMARY KEY (`FUNCTION_ID`),
  KEY `PUBFUNCTIONS_FK1` (`MODULE_ID`),
  CONSTRAINT `PUBFUNCTIONS_FK1` FOREIGN KEY (`MODULE_ID`) REFERENCES `pub_modules` (`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_functions`
--

/*!40000 ALTER TABLE `pub_functions` DISABLE KEYS */;
INSERT INTO `pub_functions` (`FUNCTION_ID`,`FUNCTION_CODE`,`FUNCTION_NAME`,`MODULE_ID`,`IS_SYS`,`DATA_RES_TYPE`,`SEQ`) VALUES 
 ('BASE0001','BASE0001','检索组织结构','BASE00','0',NULL,NULL),
 ('BASE0002','BASE0002','获得角色列表帮助','BASE00','0',NULL,NULL),
 ('BASE0003','BASE0003','修改我的用户密码','BASE00','0',NULL,NULL),
 ('BASE0004','BASE0004','修改我的个人信息','BASE00','0',NULL,NULL),
 ('BASE0005','BASE0005','检索行政区域','BASE00','0',NULL,NULL),
 ('BASE0006','BASE0006','我的快捷菜单','BASE00','1',NULL,NULL),
 ('BASE0007','BASE0007','切换菜单','BASE00','1',NULL,NULL),
 ('BASE0008','BASE0008','首页定制','systemamin','1',NULL,0),
 ('BASE0009','BASE0009','平台版本','BASE00','1','',8),
 ('BSP0001','BSP0001','业务流水','BSP00','1',NULL,NULL),
 ('BSP0101','BSP0101','定义国家（地区）','BSP01','0',NULL,NULL),
 ('BSP0102','BSP0102','定义行政区域','BSP01','0',NULL,NULL),
 ('BSP0103','BSP0103','定义工作地点','BSP01','0',NULL,NULL),
 ('BSP0104','BSP0104','定义组织类型','BSP01','0',NULL,NULL),
 ('BSP0105','BSP0105','定义人事事件类型','BSP01','0',NULL,NULL),
 ('BSP0106','BSP0106','定义组织结构规则','BSP01','0',NULL,NULL),
 ('BSP0107','BSP0107','组织结构管理','BSP01','0',NULL,NULL),
 ('BSP0108','BSP0108','机构参数','BSP01','0',NULL,NULL),
 ('BSP0109','BSP0109','组织结构类型','BSP01','0',NULL,NULL),
 ('BSP0110','BSP0110','组织结构版本','BSP01','0',NULL,NULL),
 ('BSP0111','BSP0111','机构参数类型','BSP01','0',NULL,NULL),
 ('BSP0201','BSP0201','财务期间','BSP02','0',NULL,NULL),
 ('BSP0202','BSP0202','工作日历','BSP02','0',NULL,NULL),
 ('BSP0301','BSP0301','用户设置','systemamin','1',NULL,6),
 ('BSP0302','BSP0302','角色设置','systemamin','1',NULL,5),
 ('BSP0303','BSP0303','角色模板','BSP03','1',NULL,NULL),
 ('BSP0304','BSP0304','不相容角色集','BSP03','1',NULL,NULL),
 ('BSP0305','BSP0305','功能资源管理','BSP03','1',NULL,NULL),
 ('BSP0306','BSP0306','数据资源管理','BSP03','1',NULL,NULL),
 ('BSP0307','BSP0307','切换机构','BSP03','0',NULL,NULL),
 ('BSP0308','BSP0308','重置所有用户密码','BSP03','1',NULL,NULL),
 ('BSP0309','BSP0309','设置登录日期','BSP03','0',NULL,NULL),
 ('BSP0310','BSP0310','在线用户','BSP03','1',NULL,NULL),
 ('BSP0311','BSP0311','在线用户历史','BSP03','1',NULL,NULL),
 ('BSP0312','BSP0312','审计日志','BSP03','1',NULL,NULL),
 ('BSP0313','BSP0313','LDAP同步数据','BSP03','0',NULL,NULL),
 ('BSP0314','BSP0314','数字证书与用户的映射','BSP03','0',NULL,NULL),
 ('BSP0401','BSP0401','系统菜单项维护','BSP04','1',NULL,NULL),
 ('BSP0402','BSP0402','系统菜单维护','BSP04','1',NULL,NULL),
 ('BSP0403','BSP0403','组织个性化菜单','BSP04','1',NULL,NULL),
 ('BSP0404','BSP0404','修改用户当前菜单','BSP04','1',NULL,NULL),
 ('BSP0501','BSP0501','未读邮件','BSP05','0',NULL,NULL),
 ('BSP0502','BSP0502','我的邮箱','BSP05','0',NULL,NULL),
 ('BSP0503','BSP0503','新建邮件','BSP05','0',NULL,NULL),
 ('BSP0504','BSP0504','文件夹','BSP05','0',NULL,NULL),
 ('BSP0505','BSP0505','查询邮件','BSP05','0',NULL,NULL),
 ('BSP0506','BSP0506','查询联系人','BSP05','0',NULL,NULL),
 ('BSP0507','BSP0507','邮箱设置','BSP05','0',NULL,NULL),
 ('BSP0508','BSP0508','个人地址本','BSP05','0',NULL,NULL),
 ('BSP0509','BSP0509','黑名单维护','BSP05','0',NULL,NULL),
 ('BSP0510','BSP0510','默认邮箱信息','BSP05','0',NULL,NULL),
 ('BSP0601','BSP0601','缓存管理','BSP06','1',NULL,NULL),
 ('BSP0602','BSP0602','冗余数据检查','BSP06','1',NULL,NULL),
 ('BSP0603','BSP0603','系统辅助功能','BSP06','1',NULL,NULL),
 ('BSP0604','BSP0604','初始化数据检查','BSP06','1',NULL,NULL),
 ('BSP0701','BSP0701','角色访问能力表','BSP07','1',NULL,NULL),
 ('BSP0702','BSP0702','用户访问能力表','BSP07','1',NULL,NULL),
 ('BSP0703','BSP0703','菜单访问统计表','BSP07','1',NULL,NULL),
 ('BSP0704','BSP0704','数据权限查询','BSP07','1',NULL,NULL),
 ('BSP0705','BSP0705','组织结构权限查询','BSP07','1',NULL,NULL),
 ('BSP0706','BSP0706','功能数据权限查询表','BSP07','1',NULL,NULL),
 ('BSPDEST01','BSPDEST01','首页复制','BSP00','1',NULL,0),
 ('changeapplypr','changeapplypr','变更采办申请','PR0003','0',NULL,11),
 ('changeRfx','changeRfx','变更寻源单据','rfxform01','0',NULL,0),
 ('DEMO0201','DEMO0201','未读邮件','DEMO02','0',NULL,NULL),
 ('DEMO0202','DEMO0202','我的邮箱','DEMO02','0',NULL,NULL),
 ('DEMO0203','DEMO0203','新建邮件','DEMO02','0',NULL,NULL),
 ('DEMO0204','DEMO0204','文件夹','DEMO02','0',NULL,NULL),
 ('DEMO0205','DEMO0205','查询邮件','DEMO02','0',NULL,NULL),
 ('DEMO0206','DEMO0206','查询联系人','DEMO02','0',NULL,NULL),
 ('DEMO0207','DEMO0207','邮箱设置','DEMO02','0',NULL,NULL),
 ('DEMO0208','DEMO0208','个人地址本','DEMO02','0',NULL,NULL),
 ('DEMO0209','DEMO0209','黑名单维护','DEMO02','0',NULL,NULL),
 ('DEMO0210','DEMO0210','默认邮箱信息','DEMO02','0',NULL,NULL),
 ('EXCEL02','EXCEL02','批量导入采办需求','EXCEL01','0',NULL,0),
 ('EXCELIMPORT002','EXCELIMPORT002','批量导入审批路径','PurchaseApplication','0',NULL,0),
 ('FEETYPE001','FEETYPE001','费用类型设置','PurchaseApplication','0',NULL,1),
 ('HandledPlan01','HandledPlan01','已处理的采办计划','HandledPlan','0',NULL,0),
 ('IMPORTPLAN02','IMPORTPLAN02','批量导入采办计划','IMPORTPLAN','0',NULL,0),
 ('MH001','MH001','修改历史','SystemCommonModule','0',NULL,1),
 ('MP_CMP_MESSAG','MP_CMP_MESSAG','复杂消息维护','MP_CMP_MESSAG','1',NULL,0),
 ('MP_MESSAG','MP_MESSAG','消息队列维护','MP_MESSAG','1',NULL,0),
 ('MP_MESSAG_LOG','MP_MESSAG_LOG','消息日志维护','MP_MESSAG_LOG','1',NULL,0),
 ('MyPlan01','MyPlan01','我的采办计划','MyPlan','0',NULL,0),
 ('planMaintainFunction','planMaintainFunction','采办计划','planMaintain','0',NULL,0),
 ('PlanManage01','PlanManage01','管理采办计划','PlanManage','0',NULL,0),
 ('PlanProcess01','PlanProcess01','审批采办计划','PlanProcess','0',NULL,0),
 ('PR000301','PR000301','已导入采办申请','PR0003','0',NULL,10),
 ('PR000302','PR000302','提报采办申请','PR0003','0',NULL,1),
 ('PR000303','PR000303','批量导入采办申请','PR0003','0',NULL,0),
 ('PR000304','PR000304','管理采办申请','PR0003','0',NULL,8),
 ('PR000305','PR000305','审批采办申请','PR0003','0',NULL,2),
 ('PR000306','PR000306','已退回的采办申请','PR0003','0',NULL,9),
 ('PR000307','PR000307','我的已处理清单（本地）','PR0003','0',NULL,5),
 ('PR000308','PR000308','授权采办申请（本地）','PR0003','0',NULL,12),
 ('PR000311','PR000311','我的已处理清单（总部）','PR0003','0',NULL,6),
 ('PR000390','PR000390','授权采办申请（总部）','PR0003','0',NULL,13),
 ('PR00089','PR00089','代理授权采办申请','PR0003','0',NULL,14),
 ('PRC0002','PRC0002','货币单位','systemamin','0',NULL,1),
 ('prc02510','prc02510','集中采购合并分派(二级)','prccp','0',NULL,0),
 ('prc2545662','prc2545662','管理集中采购(二级)','prccp','0',NULL,0),
 ('prc256889','prc256889','审核集中采购(二级)','prccp','0',NULL,0),
 ('prcbr01','prcbr01','维护分派规则','prcbr','0',NULL,0),
 ('prcbr02','prcbr02','一级集采的自动流转设置','CentralPurchase','0',NULL,2),
 ('prcbr03','prcbr03','自动分派、合并功能设置','prcbr','0',NULL,0),
 ('prcCatalog','0001','集中采购目录清单维护','CentralPurchase','0',NULL,0),
 ('prccp01','prccp01','提交集中采购申请','prccp','0',NULL,0),
 ('prccp02','prccp02','审核集中采购','prccp','0',NULL,3),
 ('prccp03','prccp03','管理集中采购','prccp','0',NULL,2),
 ('prccp04','prccp04','集中采购合并分派','prccp','0',NULL,1),
 ('prccp07','prccp07','提交集中采购(二级)','prccp','0',NULL,0),
 ('prcmeasure','0000','计量单位维护','systemamin','0',NULL,2),
 ('PRHEAD01','PRHEAD01','申请单总部','PR0003','0',NULL,4),
 ('PRLOC01','PRLOC01','申请单本地','PR0003','0',NULL,3),
 ('PROCUREMENTWAYS001','PROCUREMENTWAYS001','采办方式及采办理由设置','PurchaseApplication','0',NULL,2),
 ('PRW_APPROVETACTIC','PRW_APPROVETACTIC','本地审批策略维护','PurchaseApplication','0',NULL,9),
 ('PRW_APPROVETACTIC_ACT','PRW_APPROVETACTIC_ACT','审批路径设置','PurchaseApplication','0',NULL,4),
 ('PRW_HEADPRAPPLY','PRW_HEADPRAPPLY','总公司审批策略维护','PurchaseApplication','0',NULL,8),
 ('PRW_MAINTAINPROJNAME','PRW_MAINTAINPROJNAME','项目名称维护','PurchaseApplication','0',NULL,0),
 ('PRW_PRPOSITION_MANAGE','PRW_PRPOSITION_MANAGE','集团采办岗设置','PurchaseApplication','0',NULL,5),
 ('PRW_SCREENFIELD','PRW_SCREENFIELD','屏幕字段说明维护','PRW_SCREENFIELD','0',NULL,1),
 ('PRW_TACTIC_INSTANCE','PRW_TACTIC_INSTANCE','审批策略实例维护','PurchaseApplication','0',NULL,7),
 ('PUBTOOL0101','PUBTOOL0101','通用选择组件管理','PUBTOOL01','1',NULL,0),
 ('PUB_COMHELP','PUB_COMHELP','通用选择维护','SystemCommonModule','0',NULL,2),
 ('PurchaseRequisition002','PurchaseRequisition002','创建采办需求','PurchaseRequisition001','0',NULL,1),
 ('PurchaseRequisition003','PurchaseRequisition003','管理采办需求','manage','0',NULL,0),
 ('PurchaseRequisition010','PurchaseRequisition010','需求合并/分派','divide','0',NULL,0),
 ('RevokeApply','RevokeApply','撤销审批','PR0003','0',NULL,7),
 ('rfxform02','rfxform02','未处理寻源单据','rfxform01','0',NULL,0),
 ('rfxform03','rfxform03','已处理寻源单据','rfxform01','0',NULL,0),
 ('RFXTEMP001','RFXTEMP001','维护RFX模板信息','PurchaseApplication','0',NULL,6),
 ('sccheckroleparams001','sccheckroleparams001','关键指标设置','PurchaseApplication','0',NULL,3),
 ('scmCategorySelector','scmCategorySelector','类别选择器','SystemCommonModule','0',NULL,4),
 ('scmProductSelector','scmProductSelector','物料选择器','SystemCommonModule','0',NULL,5),
 ('scmUserSelector','scmUserSelector','用户选择器','SystemCommonModule','0',NULL,2),
 ('sysindex013221f1','sysindex013221f1','首页','SystemCommonModule','0',NULL,0),
 ('sysrptfun001','采办状态跟踪报表','采办状态跟踪报表','sysrpt001','0',NULL,0),
 ('SYS_MESSAG','SYS_MESSAG','系统在线消息提醒','SYS_MESSAG','0',NULL,1),
 ('webeditgrid','webeditgrid','EditGrid分页示例','DEMO01','0',NULL,0),
 ('webflexgrid','webflexgrid','查询网格示例','DEMO01','0',NULL,0),
 ('webgrid','webgrid','编辑网格示例','DEMO01','0',NULL,0),
 ('webhtml','webhtml','员工信息维护','DEMO01','0',NULL,0),
 ('webtab','webtab','一表多从','DEMO01','0',NULL,0),
 ('webtree','webtree','树形结构','DEMO01','0',NULL,0),
 ('webupload','webupload','文件上传下载','DEMO01','0',NULL,0),
 ('webzuhe','webzuhe','组合框示例','DEMO01','0',NULL,0),
 ('WFREPORT15','WFREPORT15','工作流报表','WORKFLOW','0',NULL,NULL),
 ('WFREPORT16','WFREPORT16','工作流报表查询','WORKFLOW','0',NULL,NULL),
 ('WF_MANAGE_FILES','WF_MANAGE_FILES','流程定义文件维护','WF_MANAGE_FILES','0',NULL,1),
 ('WF_PROCESS_FILES','WF_PROCESS_FILES','流程文件列表维护','WF_PROCESS_FILES','0',NULL,1),
 ('WF_PROCESS_TYPE','WF_PROCESS_TYPE','流程类型维护','WF_PROCESS_TYPE','0',NULL,1),
 ('WORKFLOW01','WORKFLOW01','工作流类型管理','WF_PROCESS_TYPE','0',NULL,NULL),
 ('WORKFLOW02','WORKFLOW02','表单管理','WF_PROCESS_TYPE','0',NULL,NULL),
 ('WORKFLOW03','WORKFLOW03','流程管理','WF_PROCESS_TYPE','0',NULL,NULL),
 ('WORKFLOW04','WORKFLOW04','任务列表定制','WF_PROCESS_TYPE','0',NULL,NULL),
 ('WORKFLOW0401','WORKFLOW0401','示例：差旅报销流程','WORKFLOW04','0',NULL,NULL),
 ('WORKFLOW05','WORKFLOW05','表单打印模板','WF_PROCESS_TYPE','0',NULL,NULL),
 ('WORKFLOW06','WORKFLOW06','任务管理','WORKFLOW','0',NULL,NULL),
 ('WORKFLOW07','WORKFLOW07','附件操作','WORKFLOW','0',NULL,NULL),
 ('WORKFLOW08','WORKFLOW08','流程操作','WORKFLOW','0',NULL,NULL),
 ('WORKFLOW09','WORKFLOW09','流程监控','WF_PROCESS_TYPE','0',NULL,NULL),
 ('WORKFLOW10','WORKFLOW10','表单操作','WORKFLOW','0',NULL,NULL),
 ('WORKFLOW11','WORKFLOW11','流程查询','WORKFLOW','0',NULL,NULL),
 ('WORKFLOW12','WORKFLOW12','缓存管理','WF_PROCESS_TYPE','0',NULL,NULL),
 ('WORKFLOW13','WORKFLOW13','流程监控','WF_PROCESS_TYPE','0',NULL,NULL),
 ('WORKFLOW14','WORKFLOW14','字号维护','WORKFLOW','0',NULL,NULL),
 ('WORKFLOW15','WORKFLOW15','组织树选择','WORKFLOW','0',NULL,NULL),
 ('WORKFLOW16','WORKFLOW16','工作流统计分析','WF_PROCESS_TYPE','0',NULL,NULL),
 ('workflowext01','workflowext01','工作流扩展','WORKFLOW','0',NULL,0);
/*!40000 ALTER TABLE `pub_functions` ENABLE KEYS */;


--
-- Definition of table `pub_global`
--

DROP TABLE IF EXISTS `pub_global`;
CREATE TABLE `pub_global` (
  `SYSTEM_ID` varchar(128) NOT NULL,
  `SYSTEM_NAME` varchar(128) NOT NULL,
  `GPUBLIC_USER` varchar(30) NOT NULL DEFAULT 'GPUBLIC',
  `SUPERADMIN_USER` varchar(30) NOT NULL DEFAULT 'superadmin',
  `SYSADMIN_USER` varchar(30) NOT NULL DEFAULT 'sysadmin',
  `SUPERADMIN_ROLE` varchar(30) NOT NULL DEFAULT 'SUPERADMIN',
  `SYSADMIN_ROLE` varchar(30) NOT NULL DEFAULT 'SYSADMIN',
  `DEFAULT_LEVEL` int(11) NOT NULL,
  `PSWD_LIFE_TIME` int(11) NOT NULL,
  `LOGIN_ATTEMPTS` int(11) NOT NULL,
  `PSWD_LOCK_TIME` int(11) NOT NULL,
  `PSWD_GRACE_TIME` int(11) NOT NULL,
  PRIMARY KEY (`SYSTEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_global`
--

/*!40000 ALTER TABLE `pub_global` DISABLE KEYS */;
INSERT INTO `pub_global` (`SYSTEM_ID`,`SYSTEM_NAME`,`GPUBLIC_USER`,`SUPERADMIN_USER`,`SYSADMIN_USER`,`SUPERADMIN_ROLE`,`SYSADMIN_ROLE`,`DEFAULT_LEVEL`,`PSWD_LIFE_TIME`,`LOGIN_ATTEMPTS`,`PSWD_LOCK_TIME`,`PSWD_GRACE_TIME`) VALUES 
 ('SUPERADMIN','超级管理员','GPUBLIC','SUPERADMIN','SYSADMIN','SUPERADMIN','SYSADMIN',9,-1,-1,-1,-1);
/*!40000 ALTER TABLE `pub_global` ENABLE KEYS */;


--
-- Definition of table `pub_hr_event`
--

DROP TABLE IF EXISTS `pub_hr_event`;
CREATE TABLE `pub_hr_event` (
  `EVENT_ID` varchar(30) NOT NULL,
  `STRU_ID` varchar(200) NOT NULL,
  `SCN` int(11) NOT NULL,
  `EVENT_TYPE` varchar(10) NOT NULL,
  `EVENT_DATE` char(8) NOT NULL,
  `EVENT_MEMO` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`EVENT_ID`),
  KEY `PUBHREVENT_FK1` (`EVENT_TYPE`),
  CONSTRAINT `PUBHREVENT_FK1` FOREIGN KEY (`EVENT_TYPE`) REFERENCES `pub_hr_event_type` (`EVENT_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_hr_event`
--

/*!40000 ALTER TABLE `pub_hr_event` DISABLE KEYS */;
INSERT INTO `pub_hr_event` (`EVENT_ID`,`STRU_ID`,`SCN`,`EVENT_TYPE`,`EVENT_DATE`,`EVENT_MEMO`) VALUES 
 ('1','1',-1,'11','20000101','系统初始人事事件');
/*!40000 ALTER TABLE `pub_hr_event` ENABLE KEYS */;


--
-- Definition of table `pub_hr_event_type`
--

DROP TABLE IF EXISTS `pub_hr_event_type`;
CREATE TABLE `pub_hr_event_type` (
  `EVENT_TYPE` varchar(10) NOT NULL,
  `ORGAN_TYPE` varchar(10) NOT NULL,
  `TYPE_NAME` varchar(60) NOT NULL,
  `IS_SYS` char(1) NOT NULL,
  PRIMARY KEY (`EVENT_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_hr_event_type`
--

/*!40000 ALTER TABLE `pub_hr_event_type` DISABLE KEYS */;
INSERT INTO `pub_hr_event_type` (`EVENT_TYPE`,`ORGAN_TYPE`,`TYPE_NAME`,`IS_SYS`) VALUES 
 ('0','0','不记录人事事件','1'),
 ('11','1','设立法人','1'),
 ('12','1','撤销法人','1'),
 ('13','1','法人信息变更','1'),
 ('14','1','变更法人隶属关系','1'),
 ('21','2','设立部门','1'),
 ('22','2','撤销部门','1'),
 ('23','2','部门信息变更','1'),
 ('24','2','变更部门隶属关系','1'),
 ('61','6','设立岗位','1'),
 ('62','6','撤销岗位','1'),
 ('63','6','岗位信息变更','1'),
 ('64','6','变更岗位隶属关系','1'),
 ('81','8','入职','1'),
 ('82','8','转正','1'),
 ('83','8','续约','1'),
 ('84','8','调动','1'),
 ('85','8','离职','1'),
 ('86','8','退休','1'),
 ('87','8','返聘','1'),
 ('88','8','解聘','1');
/*!40000 ALTER TABLE `pub_hr_event_type` ENABLE KEYS */;


--
-- Definition of table `pub_idtable`
--

DROP TABLE IF EXISTS `pub_idtable`;
CREATE TABLE `pub_idtable` (
  `ID_ID` varchar(30) NOT NULL,
  `ID_VALUE` int(11) NOT NULL,
  `ID_NAME` varchar(50) NOT NULL,
  `CACHE_SIZE` int(11) NOT NULL,
  `ID_PREFIX` varchar(10) DEFAULT NULL,
  `IS_PREFIX` char(1) NOT NULL,
  `ID_LENGTH` int(11) NOT NULL,
  `IS_SUFFIX` char(1) DEFAULT NULL,
  `ID_SUFFIX` varchar(10) DEFAULT NULL,
  `IS_GLOBAL` char(1) NOT NULL,
  `ORGAN_ID` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_idtable`
--

/*!40000 ALTER TABLE `pub_idtable` DISABLE KEYS */;
INSERT INTO `pub_idtable` (`ID_ID`,`ID_VALUE`,`ID_NAME`,`CACHE_SIZE`,`ID_PREFIX`,`IS_PREFIX`,`ID_LENGTH`,`IS_SUFFIX`,`ID_SUFFIX`,`IS_GLOBAL`,`ORGAN_ID`) VALUES 
 ('STRU_ID',100,'STRU_ID',1,'S','1',15,'0',NULL,'1',NULL),
 ('ORGAN_ID',100,'ORGAN_ID',1,'O','1',15,'0',NULL,'1',NULL),
 ('URL_ID',0,'URL_ID',1,NULL,'0',20,'0',NULL,'1',NULL),
 ('PUB_DOC_CONTENT_ID',0,'PUB_DOC_CONTENT_ID',1,NULL,'0',20,'0',NULL,'1',NULL),
 ('MENU_PER_ID',1002,'MENU_PER_ID',1,NULL,'0',30,'0',NULL,'1','null'),
 ('MENU_STRU_ID',3,'MENU_STRU_ID',1,NULL,'0',30,'0',NULL,'1','null'),
 ('MENU_STRU_TYPE_ID',3,'MENU_STRU_TYPE_ID',1,NULL,'0',30,'0',NULL,'1','null'),
 ('MENU_SYS_ID',2002,'MENU_SYS_ID',1,NULL,'0',30,'0',NULL,'1','null'),
 ('test',0,'test',0,'','0',0,'0','','1','');
/*!40000 ALTER TABLE `pub_idtable` ENABLE KEYS */;


--
-- Definition of table `pub_ldap_user`
--

DROP TABLE IF EXISTS `pub_ldap_user`;
CREATE TABLE `pub_ldap_user` (
  `USER_ID` varchar(30) NOT NULL,
  `USER_NAME` varchar(30) NOT NULL,
  `PASSWORD` varchar(128) DEFAULT NULL,
  `E_MAIL` varchar(80) DEFAULT NULL,
  `MOBILE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_ldap_user`
--

/*!40000 ALTER TABLE `pub_ldap_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_ldap_user` ENABLE KEYS */;


--
-- Definition of table `pub_mail_address`
--

DROP TABLE IF EXISTS `pub_mail_address`;
CREATE TABLE `pub_mail_address` (
  `ADDRESS_ID` varchar(30) NOT NULL,
  `ADDRESS_NAME` varchar(80) NOT NULL,
  `ADDRESS_EMAIL` varchar(80) DEFAULT NULL,
  `ADDRESS_TYPE` char(1) NOT NULL,
  `CATEGORY_ID` varchar(30) NOT NULL,
  PRIMARY KEY (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_mail_address`
--

/*!40000 ALTER TABLE `pub_mail_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_mail_address` ENABLE KEYS */;


--
-- Definition of table `pub_mail_address_category`
--

DROP TABLE IF EXISTS `pub_mail_address_category`;
CREATE TABLE `pub_mail_address_category` (
  `CATEGORY_ID` varchar(30) NOT NULL,
  `USER_ID` varchar(30) NOT NULL,
  `CATEGORY_NAME` varchar(80) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_mail_address_category`
--

/*!40000 ALTER TABLE `pub_mail_address_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_mail_address_category` ENABLE KEYS */;


--
-- Definition of table `pub_mail_attachment_ref`
--

DROP TABLE IF EXISTS `pub_mail_attachment_ref`;
CREATE TABLE `pub_mail_attachment_ref` (
  `ID` varchar(30) NOT NULL,
  `RESOURCE_ID` varchar(30) NOT NULL,
  `FILE_ID` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_mail_attachment_ref`
--

/*!40000 ALTER TABLE `pub_mail_attachment_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_mail_attachment_ref` ENABLE KEYS */;


--
-- Definition of table `pub_mail_blacklist`
--

DROP TABLE IF EXISTS `pub_mail_blacklist`;
CREATE TABLE `pub_mail_blacklist` (
  `BLACKLIST_ID` varchar(30) NOT NULL,
  `USER_ID` varchar(30) NOT NULL,
  `BLACKLIST_NAME` varchar(80) NOT NULL,
  `BLACKLIST_EMAIL` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`BLACKLIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_mail_blacklist`
--

/*!40000 ALTER TABLE `pub_mail_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_mail_blacklist` ENABLE KEYS */;


--
-- Definition of table `pub_mail_group_card_ref`
--

DROP TABLE IF EXISTS `pub_mail_group_card_ref`;
CREATE TABLE `pub_mail_group_card_ref` (
  `ID` varchar(30) NOT NULL,
  `GROUP_ID` varchar(30) NOT NULL,
  `CARD_ID` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_mail_group_card_ref`
--

/*!40000 ALTER TABLE `pub_mail_group_card_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_mail_group_card_ref` ENABLE KEYS */;


--
-- Definition of table `pub_menu_peritem`
--

DROP TABLE IF EXISTS `pub_menu_peritem`;
CREATE TABLE `pub_menu_peritem` (
  `MENU_ID` varchar(30) NOT NULL,
  `TEXT` varchar(30) DEFAULT NULL,
  `TITLE` varchar(30) DEFAULT NULL,
  `TYPE` char(1) DEFAULT NULL,
  `VALUE` varchar(250) DEFAULT NULL,
  `TARGET` varchar(30) DEFAULT NULL,
  `OPTIONS` varchar(250) DEFAULT NULL,
  `FUNCTION_ID` varchar(30) DEFAULT NULL,
  `APP_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_menu_peritem`
--

/*!40000 ALTER TABLE `pub_menu_peritem` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_menu_peritem` ENABLE KEYS */;


--
-- Definition of table `pub_menu_stru`
--

DROP TABLE IF EXISTS `pub_menu_stru`;
CREATE TABLE `pub_menu_stru` (
  `MENU_STRU_ID` varchar(30) NOT NULL,
  `MENU_ID` varchar(30) NOT NULL,
  `STRU_TYPE_ID` varchar(30) NOT NULL,
  `IS_SYS` char(1) NOT NULL,
  `MENU_ALIAS` varchar(30) DEFAULT NULL,
  `PARENT_ID` varchar(30) DEFAULT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `IS_LEAF` char(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_STRU_ID`),
  KEY `PubMenuStru_FK1` (`STRU_TYPE_ID`),
  CONSTRAINT `PubMenuStru_FK1` FOREIGN KEY (`STRU_TYPE_ID`) REFERENCES `pub_menu_stru_type` (`STRU_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_menu_stru`
--

/*!40000 ALTER TABLE `pub_menu_stru` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_menu_stru` ENABLE KEYS */;


--
-- Definition of table `pub_menu_stru_type`
--

DROP TABLE IF EXISTS `pub_menu_stru_type`;
CREATE TABLE `pub_menu_stru_type` (
  `STRU_TYPE_ID` varchar(30) NOT NULL,
  `STRU_TYPE_NAME` varchar(60) NOT NULL,
  `STRU_ID` varchar(30) NOT NULL,
  PRIMARY KEY (`STRU_TYPE_ID`),
  KEY `PubMenuStruType_FK` (`STRU_ID`),
  CONSTRAINT `PubMenuStruType_FK` FOREIGN KEY (`STRU_ID`) REFERENCES `pub_stru` (`STRU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_menu_stru_type`
--

/*!40000 ALTER TABLE `pub_menu_stru_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_menu_stru_type` ENABLE KEYS */;


--
-- Definition of table `pub_menu_sys`
--

DROP TABLE IF EXISTS `pub_menu_sys`;
CREATE TABLE `pub_menu_sys` (
  `MENU_SYS_ID` varchar(30) NOT NULL,
  `MENU_ID` varchar(30) NOT NULL,
  `TYPE_ID` varchar(10) NOT NULL,
  `MENU_ALIAS` varchar(30) DEFAULT NULL,
  `PARENT_ID` varchar(30) DEFAULT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `IS_LEAF` char(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_SYS_ID`),
  KEY `PubMenuSys_FK1` (`MENU_ID`),
  KEY `PubMenuSys_FK2` (`TYPE_ID`),
  CONSTRAINT `PubMenuSys_FK1` FOREIGN KEY (`MENU_ID`) REFERENCES `pub_menu_sysitem` (`MENU_ID`),
  CONSTRAINT `PubMenuSys_FK2` FOREIGN KEY (`TYPE_ID`) REFERENCES `pub_menu_type` (`TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_menu_sys`
--

/*!40000 ALTER TABLE `pub_menu_sys` DISABLE KEYS */;
INSERT INTO `pub_menu_sys` (`MENU_SYS_ID`,`MENU_ID`,`TYPE_ID`,`MENU_ALIAS`,`PARENT_ID`,`SEQ`,`IS_LEAF`) VALUES 
 ('000000000000000000000000001016','000000000000000000000000001015','01','系统配置','BSP000000000000000000000000001',1,NULL),
 ('000000000000000000000000001066','000000000000000000000000001065','01','系统管理','BSP000000000000000000000000001',2,NULL),
 ('000000000000000000000000001150','000000000000000000000000001149','01','首页','BSP000000000000000000000000001',0,NULL),
 ('000000000000000000000000002002','000000000000000000000000002001','01','组织机构管理','BSP000000000000000000000000010',1,''),
 ('1013','1013','01','流程管理','000000000000000000000000001066',4,'0'),
 ('10131','10131','01','流程类型','1013',0,'0'),
 ('10132','10132','01','表单管理','1013',1,'0'),
 ('10133','10133','01','工作流程','1013',2,'0'),
 ('10134','10134','01','缓存管理','1013',3,'0'),
 ('10135','10135','01','流程监控','1013',4,'0'),
 ('10137','10137','01','签名图片','1013',6,'0'),
 ('2013','2013','01','工作流程','BSP000000000000000000000000001',3,'0'),
 ('20131','20131','01','任务管理','2013',0,'0'),
 ('201311','201311','01','新建任务','20131',1,'0'),
 ('201312','201312','01','待办任务','20131',2,'0'),
 ('201314','201314','01','已办任务','20131',4,'0'),
 ('201316','201316','01','角色任务','20131',6,'0'),
 ('201317','201317','01','监控任务','20131',7,'0'),
 ('201331','201331','01','工作流统计分析','000000000000000000000000001066',3,'0'),
 ('201332','201332','01','持续时间','201331',0,'0'),
 ('201333','201333','01','业务流量','201331',1,'0'),
 ('201334','201334','01','季度平均持续时间','201332',0,'0'),
 ('201335','201335','01','月平均持续时间','201332',1,'0'),
 ('201336','201336','01','日平均持续时间','201332',2,'0'),
 ('201337','201337','01','季度业务流量','201333',0,'0'),
 ('201338','201338','01','月业务流量','201333',1,'0'),
 ('201339','201339','01','日业务流量','201333',2,'0'),
 ('201340','201340','01','人员业务量分析','201331',2,'0'),
 ('BSP000000000000000000000000001','BSP000000000000000000000000001','01','主菜单','-1',0,NULL),
 ('BSP000000000000000000000000002','BSP000000000000000000000000002','01','组织机构','000000000000000000000000001066',0,'0'),
 ('BSP000000000000000000000000003','BSP000000000000000000000000003','01','定义','BSP000000000000000000000000002',0,'0'),
 ('BSP000000000000000000000000004','BSP000000000000000000000000004','01','定义国家','BSP000000000000000000000000003',0,'0'),
 ('BSP000000000000000000000000005','BSP000000000000000000000000005','01','定义行政区域','BSP000000000000000000000000003',1,'0'),
 ('BSP000000000000000000000000006','BSP000000000000000000000000006','01','定义工作地点','BSP000000000000000000000000003',2,'0'),
 ('BSP000000000000000000000000007','BSP000000000000000000000000007','01','定义组织类型','BSP000000000000000000000000003',3,'0'),
 ('BSP000000000000000000000000008','BSP000000000000000000000000008','01','定义组织结构规则','BSP000000000000000000000000003',4,'0'),
 ('BSP000000000000000000000000010','BSP000000000000000000000000010','01','机构管理','BSP000000000000000000000000002',1,'0'),
 ('BSP000000000000000000000000013','BSP000000000000000000000000013','01','组织结构版本','BSP000000000000000000000000010',1,'0'),
 ('BSP000000000000000000000000014','BSP000000000000000000000000014','01','日历','BSP000000000000000000000000002',2,'0'),
 ('BSP000000000000000000000000015','BSP000000000000000000000000015','01','工作日历','BSP000000000000000000000000014',0,'0'),
 ('BSP000000000000000000000000016','BSP000000000000000000000000016','01','财务期间','BSP000000000000000000000000014',0,'0'),
 ('BSP000000000000000000000000017','BSP000000000000000000000000017','01','例子','BSP000000000000000000000000002',3,'0'),
 ('BSP000000000000000000000000018','BSP000000000000000000000000018','01','选择组织机构','BSP000000000000000000000000017',0,'0'),
 ('BSP000000000000000000000000019','BSP000000000000000000000000019','01','流水号管理','BSP000000000000000000000000002',4,'0'),
 ('BSP000000000000000000000000020','BSP000000000000000000000000020','01','权限管理','000000000000000000000000001066',6,'0'),
 ('BSP000000000000000000000000021','BSP000000000000000000000000021','01','角色设置','000000000000000000000000001016',3,NULL),
 ('BSP000000000000000000000000022','BSP000000000000000000000000022','01','用户设置','000000000000000000000000001016',4,NULL),
 ('BSP000000000000000000000000023','BSP000000000000000000000000023','01','角色','BSP000000000000000000000000021',0,'0'),
 ('BSP000000000000000000000000024','BSP000000000000000000000000024','01','角色模板','BSP000000000000000000000000021',1,'0'),
 ('BSP000000000000000000000000026','BSP000000000000000000000000026','01','资源管理','BSP000000000000000000000000020',0,'0'),
 ('BSP000000000000000000000000027','BSP000000000000000000000000027','01','功能资源管理','BSP000000000000000000000000026',0,'0'),
 ('BSP000000000000000000000000028','BSP000000000000000000000000028','01','数据资源类型管理','BSP000000000000000000000000026',1,'0'),
 ('BSP000000000000000000000000029','BSP000000000000000000000000029','01','自助服务','BSP000000000000000000000000020',1,'0'),
 ('BSP000000000000000000000000030','BSP000000000000000000000000030','01','切换机构','BSP000000000000000000000000029',0,'0'),
 ('BSP000000000000000000000000031','BSP000000000000000000000000031','01','重置所有用户密码','BSP000000000000000000000000029',1,'0'),
 ('BSP000000000000000000000000032','BSP000000000000000000000000032','01','修改我的密码','000000000000000000000000001016',5,'0'),
 ('BSP000000000000000000000000034','BSP000000000000000000000000034','01','选择角色示例','BSP000000000000000000000000020',2,'0'),
 ('BSP000000000000000000000000035','BSP000000000000000000000000035','01','选择角色','BSP000000000000000000000000034',0,'0'),
 ('BSP000000000000000000000000036','BSP000000000000000000000000036','01','审计','BSP000000000000000000000000020',3,'0'),
 ('BSP000000000000000000000000037','BSP000000000000000000000000037','01','在线用户','BSP000000000000000000000000036',0,'0'),
 ('BSP000000000000000000000000038','BSP000000000000000000000000038','01','用户在线历史记录','BSP000000000000000000000000036',1,'0'),
 ('BSP000000000000000000000000039','BSP000000000000000000000000039','01','安全日志','BSP000000000000000000000000036',2,'0'),
 ('BSP000000000000000000000000040','BSP000000000000000000000000040','01','其他功能','BSP000000000000000000000000020',5,'0'),
 ('BSP000000000000000000000000041','BSP000000000000000000000000041','01','LDAP同步用户','BSP000000000000000000000000040',0,'0'),
 ('BSP000000000000000000000000042','BSP000000000000000000000000042','01','数字证书与用户映射','BSP000000000000000000000000040',1,'0'),
 ('BSP000000000000000000000000045','BSP000000000000000000000000045','01','权限报表','BSP000000000000000000000000020',4,'0'),
 ('BSP000000000000000000000000046','BSP000000000000000000000000046','01','角色访问能力表','BSP000000000000000000000000045',0,'0'),
 ('BSP000000000000000000000000047','BSP000000000000000000000000047','01','用户访问能力表','BSP000000000000000000000000045',1,'0'),
 ('BSP000000000000000000000000048','BSP000000000000000000000000048','01','菜单访问统计表','BSP000000000000000000000000045',2,'0'),
 ('BSP000000000000000000000000049','BSP000000000000000000000000049','01','数据权限查询','BSP000000000000000000000000045',3,'0'),
 ('BSP000000000000000000000000050','BSP000000000000000000000000050','01','组织结构权限查询','BSP000000000000000000000000045',4,'0'),
 ('BSP000000000000000000000000051','BSP000000000000000000000000051','01','辅助功能','000000000000000000000000001066',2,'0'),
 ('BSP000000000000000000000000052','BSP000000000000000000000000052','01','缓存管理','BSP000000000000000000000000051',0,'0'),
 ('BSP000000000000000000000000053','BSP000000000000000000000000053','01','冗余数据检查','BSP000000000000000000000000051',1,'0'),
 ('BSP000000000000000000000000054','BSP000000000000000000000000054','01','CMD日志查询','BSP000000000000000000000000051',2,'0'),
 ('BSP000000000000000000000000055','BSP000000000000000000000000055','01','CMD日志分析','BSP000000000000000000000000051',3,'0'),
 ('BSP000000000000000000000000056','BSP000000000000000000000000056','01','活动数据连接查询','BSP000000000000000000000000051',4,'0'),
 ('BSP000000000000000000000000057','BSP000000000000000000000000057','01','系统监控控制台','BSP000000000000000000000000051',5,'0'),
 ('BSP000000000000000000000000058','BSP000000000000000000000000058','01','初始化数据检查','BSP000000000000000000000000051',6,'0'),
 ('BSP000000000000000000000000059','BSP000000000000000000000000059','01','注销','BSP000000000000000000000000001',6,'0'),
 ('BSP000000000000000000000000061','BSP000000000000000000000000061','01','菜单维护','000000000000000000000000001066',1,'0'),
 ('BSP000000000000000000000000062','BSP000000000000000000000000062','01','系统菜单项维护','BSP000000000000000000000000061',0,'0'),
 ('BSP000000000000000000000000063','BSP000000000000000000000000063','01','系统菜单维护','BSP000000000000000000000000061',0,'0'),
 ('BSP000000000000000000000000080','BSP000000000000000000000000080','01','首页定制','000000000000000000000000001016',0,'0'),
 ('BSP000000000000000000000000082','BSP000000000000000000000000082','01','功能数据权限查询表','BSP000000000000000000000000045',5,'0'),
 ('BSP000001177','BSP000001177','01','复制工作台','BSP000000000000000000000000029',2,''),
 ('DEMO','DEMO','01','案例','BSP000000000000000000000000001',5,''),
 ('DEMO01','DEMO01','01','框架组件示例','DEMO',0,''),
 ('DEMO0101','DEMO0101','01','文件上传下载','DEMO01',0,''),
 ('DEMO0102','DEMO0102','01','员工信息维护','DEMO01',1,''),
 ('DEMO0103','DEMO0103','01','树形结构示例','DEMO01',2,''),
 ('DEMO0104','DEMO0104','01','查询网格示例','DEMO01',3,''),
 ('DEMO0105','DEMO0105','01','编辑网格示例','DEMO01',4,''),
 ('DEMO010501','DEMO010501','01','编辑网格示例','DEMO0105',0,''),
 ('DEMO010502','DEMO010502','01','商品信息','DEMO0105',1,''),
 ('DEMO0107','DEMO0107','01','组合框示例','DEMO01',6,''),
 ('DEMO010701','DEMO010701','01','组合框示例','DEMO0107',0,''),
 ('DEMO010702','DEMO010702','01','地址信息','DEMO0107',1,''),
 ('DEMO0108','DEMO0108','01','EditGrid分页示例','DEMO01',7,''),
 ('DEMO010801','DEMO010801','01','主从表示例','DEMO0108',0,''),
 ('DEMO010802','DEMO010802','01','单表示例','DEMO0108',1,''),
 ('DEMO02','DEMO02','01','邮件','DEMO',1,'0'),
 ('DEMO0201','DEMO0201','01','未读邮件','DEMO02',0,'0'),
 ('DEMO0202','DEMO0202','01','我的邮箱','DEMO02',0,'0'),
 ('DEMO0203','DEMO0203','01','新建邮件','DEMO02',0,'0'),
 ('DEMO0204','DEMO0204','01','文件夹','DEMO02',0,'0'),
 ('DEMO0205','DEMO0205','01','配置','DEMO02',0,'0'),
 ('DEMO020501','DEMO020501','01','邮箱设置','DEMO0205',0,'0'),
 ('DEMO020502','DEMO020502','01','个人地址本','DEMO0205',0,'0'),
 ('DEMO020503','DEMO020503','01','黑名单维护','DEMO0205',0,'0'),
 ('DEMO020504','DEMO020504','01','默认邮箱信息','DEMO0205',0,'0'),
 ('DEMO0206','DEMO0206','01','查询邮件','DEMO02',0,'0'),
 ('DEMO0207','DEMO0207','01','查询联系人','DEMO02',0,'0'),
 ('MPMSG0000000001','MPMSG0000000001','01','消息平台','000000000000000000000000001066',5,''),
 ('MPMSG000000000101','MPMSG000000000101','01','消息队列管理','MPMSG0000000001',4,''),
 ('MPMSG000000000102','MPMSG000000000102','01','消息发送日志','MPMSG0000000001',4,''),
 ('MPMSG000000000103','MPMSG000000000103','01','我的短消息','MPMSG0000000001',4,''),
 ('PUBTOOL00000001002','PUBTOOL00000001001','01','组件管理','BSP000000000000000000000000001',1,''),
 ('PUBTOOL00000001004','PUBTOOL00000001003','01','通用选择','PUBTOOL00000001002',0,'');
/*!40000 ALTER TABLE `pub_menu_sys` ENABLE KEYS */;


--
-- Definition of table `pub_menu_sysitem`
--

DROP TABLE IF EXISTS `pub_menu_sysitem`;
CREATE TABLE `pub_menu_sysitem` (
  `MENU_ID` varchar(30) NOT NULL,
  `TEXT` varchar(30) DEFAULT NULL,
  `TITLE` varchar(30) DEFAULT NULL,
  `TYPE` char(1) DEFAULT NULL,
  `VALUE` varchar(250) DEFAULT NULL,
  `TARGET` varchar(30) DEFAULT NULL,
  `OPTIONS` varchar(250) DEFAULT NULL,
  `FUNCTION_ID` varchar(30) DEFAULT NULL,
  `APP_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_menu_sysitem`
-- 

/*!40000 ALTER TABLE `pub_menu_sysitem` DISABLE KEYS */;
INSERT INTO `pub_menu_sysitem` (`MENU_ID`,`TEXT`,`TITLE`,`TYPE`,`VALUE`,`TARGET`,`OPTIONS`,`FUNCTION_ID`,`APP_ID`) VALUES 
 ('000000000000000000000000001001','采办需求管理',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001003','货币单位显示列表',NULL,'0','sc/currency/list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001005','采办申请我','','0','','','','',''),
 ('000000000000000000000000001007','费用维护',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001009','费用类型设置',NULL,'0','prwamounttypesetquery_page_init.cmd',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001011','项目名称维护',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001013','维护项目名称',NULL,'0','sc/projname/list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001015','系统配置',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001017','计量单位维护',NULL,'0','sc/measure/list.do',NULL,NULL,'systemamin',NULL),
 ('000000000000000000000000001019','项目名称管理',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001023','项目名称管理',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001025','项目名称管理',NULL,'0','prwmaintainprojnamequery_page_init.cmd',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001027','货币单位维护',NULL,'0','sc/currency/list.do',NULL,NULL,'systemamin',NULL),
 ('000000000000000000000000001029','维护一级集中采购目录',NULL,'0','br/catalog-list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001031','业务规则',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001035','自动分派合并功能设置',NULL,'0','sc/assignmerge/list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001037','采办需求',NULL,'0',NULL,NULL,NULL,'Requisition',NULL),
 ('000000000000000000000000001039','创建采办需求',NULL,'0','pr/update.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001041','管理采办需求',NULL,'0',NULL,NULL,NULL,'manage',NULL),
 ('000000000000000000000000001043','需求合并分派',NULL,'0',NULL,NULL,NULL,'divide',NULL),
 ('000000000000000000000000001045','管理采办需求',NULL,'0','pr/manage/list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001047','集中采购',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001049','提报一级集中采购',NULL,'0','pr/central/list.do',NULL,NULL,'prccp01',NULL),
 ('000000000000000000000000001051','审核一级集中采购',NULL,'0','pr/central/check/list.do',NULL,NULL,'prccp02',NULL),
 ('000000000000000000000000001053','管理一级集中采购',NULL,'0','pr/central/manage/list.do',NULL,NULL,'prccp03',NULL),
 ('000000000000000000000000001055','业务规则',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001057','维护分派规则',NULL,'0','br/divisionrule/list.do',NULL,NULL,'prcbr01',NULL),
 ('000000000000000000000000001061','自动合并分派功能设置',NULL,'0','bu/assign/list.do',NULL,NULL,'prcbr03',NULL),
 ('000000000000000000000000001063','需求合并分派',NULL,'0','pr/merge/list.do',NULL,NULL,'PurchaseRequisition010',NULL),
 ('000000000000000000000000001065','系统管理',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001067','采办申请查询',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001069','采办申请查询',NULL,'0','prwprapplyquery_page_init.cmd',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001071','审批策略实例维护',NULL,'0','prwtacticinstancequery_page_init.cmd',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001073','审批策略管理',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001075','提报采办申请',NULL,'0','pr/central/requisition/list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001077','关键指标设置',NULL,'0','sc/checkrule/show.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001079','采办方式与理由设置','采办方式与理由设置','0','procurementways/list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001081','创建采办需求',NULL,'0','pr/form.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001083','管理采办需求',NULL,'0','pr/manage/list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001085','需求合并分派',NULL,'0','pr/merge/list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001087','新审批采办申请',NULL,'0','taskinfoquerynew.cmd',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001089','寻源单据',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001091','采办状态追踪报表','采办状态追踪报表','0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001093','新建流程',NULL,'0','processlist.cmd?method=processlist',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001097','批量导入采办需求','批量导入采办需求','0','excel/init.do?dataType=pr',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001102','未处理寻源单据',NULL,'0','rfx/unhandled_list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001104','已处理寻源单据',NULL,'0','rfx/handled_list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001106','变更寻源单据',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001110','采办申请',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001112','合并分派',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001114','集中采购',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001116','批量导入采办申请','批量导入采办申请','0','excel/initApply.do?dataType=apply',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001118','审批路径设置',NULL,'0','prwapprovetacticquery_page_init.cmd',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001122','一级集中采购',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001125','集采需求合并分派','集采需求合并分派','0','pr/central/merge/list.do',NULL,NULL,'prccp04',NULL),
 ('000000000000000000000000001127','批量导入采办需求',NULL,'0','excel/initPr.do?dataType=pr',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001130','集采的自动流转设置',NULL,'0','bu/transfer/list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001132','批量导入审批路径','批量导入审批路径','0','excel/initPath.do?dataType=path',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001135','自动流转设置','自动流转设置','0','bu/transfer/list.do/',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001137','费用类型设置','费用类型设置','0','feetype/list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001139','维护RFX模板信息','维护RFX模板信息','0','rfxtemp/list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001141','集团采办岗设置',NULL,'0','prwprpositionmanagequery_page_init.cmd',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001143','退回采办申请',NULL,'0','prwprapplyquery_page_init.cmd?applystate=3',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001145','结束任务',NULL,'0','taskinfofinish.cmd?method=getProcessTypeList',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001147','已导入采办申请','已导入采办申请','0','prwprapplyquery_page_init.cmd?applystate=7',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001149','首页','首页','0','jsp/content.jsp',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001151','总公司审批策略',NULL,'0','prwapprovetacticquery_page_init.cmd?processtype=1',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001153','分公司审批策略',NULL,'0','prwapprovetacticquery_page_init.cmd?processtype=2',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001155','维护项目名称','20100925','0','prwprojnamequery_page_init.cmd',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001157','新采办方式及采办理由','新采办方式及采办理由','0','procurementways/list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001159','草稿箱','草稿箱','0','prwprapplyquery_page_init.cmd?applystate=5',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001160','待审批采办计划',NULL,'0','plan/process/findHandlingList.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001161','采办计划',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001162','变更寻源单据',NULL,'0','rfx/changed_list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001163','提报采办计划',NULL,'0','plan/update.do',NULL,NULL,'updateplan02',NULL),
 ('000000000000000000000000001164','维护二级集中采购目录',NULL,'0','br/listleveltwo.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001165','管理采办计划',NULL,'0','plan/manage/list.do',NULL,NULL,'PlanManage01',NULL),
 ('000000000000000000000000001166','二级集采',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001167','已处理清单',NULL,'0','taskinfofinish.cmd?method=getProcessTypeList',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001168','提报二级集中采购',NULL,'0','pr/central/listleveltwo.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001169','本地采办申请审批',NULL,'0','taskInfoFinishAndYibanQuery.cmd?clear=true&procDefId=Package_d710071985_Wor1&processType=ProcessType_abf73323e70',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001170','管理二级集中采购',NULL,'0','pr/central/manage/listleveltwo.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001171','总部采办申请审批',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001172','审核二级集中采购',NULL,'0','pr/central/check/listleveltwo.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001174','分派二级集中采购',NULL,'0','pr/central/merge/listleveltwo.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001178','审批采办申请','审批采办申请（L）','0','localTaskInfo.cmd?method=queryDaiBan',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001182','审批中清单','审批中清单（本地）','0','localTaskInfo.cmd?method=queryZaiBan',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001184','审批结束清单','审批结束清单（本地）','0','localTaskInfo.cmd?method=queryYiBan',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001186','审批采办申请','审批采办申请（H）','0','headTaskInfo.cmd?method=queryDaiBan',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001188','审批中清单','审批中清单（总部）','0','headTaskInfo.cmd?method=queryZaiBan',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001190','审批结束清单','审批结束清单（总部）','0','headTaskInfo.cmd?method=queryYiBan',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001192','我的已处理清单','本地','0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001194','我的已处理清单','总部','0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001196','采办计划',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('000000000000000000000000001200','物料类别采购周期配置',NULL,'0','plan/materiel/findMateriels.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001202','批量导入采办计划','批量导入采办计划','0','excel/initPlan.do?dataType=plan',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001204','采办状态追踪报表',NULL,'0','rpt/status_trace_search.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001206','授权采办申请','授权采办申请（L）','0','localTaskInfo.cmd?method=queryProxy',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001208','授权采办申请','授权采办申请（H）','0','headTaskInfo.cmd?method=queryProxy',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001210','我的采办计划',NULL,'0','plan/self/list.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001212','已处理的采办计划',NULL,'0','plan/process/findHandledList.do',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001214','管理代理',NULL,'0','wftaskaccreditqueryProxy.cmd',NULL,NULL,NULL,NULL),
 ('000000000000000000000000001216','aaa',NULL,'0',';',NULL,NULL,NULL,NULL),
 ('000000000000000000000000002001','组织机构管理','','0','stru.cmd?method=getroot','_tree','','',''),
 ('1013','流程管理','流程管理','0',NULL,NULL,'icon:kfmk.gif',NULL,NULL),
 ('10131','流程类型','流程类型','0','processtypequery.cmd?clear=true','main',NULL,NULL,NULL),
 ('10132','表单管理','表单管理','0','workformmanagerquery.cmd?clear=true','main',NULL,NULL,NULL),
 ('10133','工作流程','工作流程','0','processquery.cmd?clear=true','main',NULL,NULL,NULL),
 ('10134','缓存管理','缓存管理','0','wfadminoperate.cmd?method=cacheAdmin','main',NULL,NULL,NULL),
 ('10135','流程监控','流程监控','0','processmgradminquery.cmd?clear=true','main',NULL,NULL,NULL),
 ('10137','签名图片','签名图片','0','signpic.cmd?method=query','main',NULL,NULL,NULL),
 ('2013','待办事项','待办事项','0',NULL,NULL,'icon:Pictureviewer.jpg',NULL,NULL),
 ('20131','任务管理','任务列表','0',NULL,NULL,NULL,NULL,NULL),
 ('201311','新建任务','新建任务','0','processlist.cmd?method=processlist','main',NULL,NULL,NULL),
 ('201312','待办任务','审批采办申请','0','taskinfodaiban.cmd?method=getProcessTypeList','main',NULL,NULL,NULL),
 ('201313','在办任务','在办任务','0','taskinfozaiban.cmd?method=getProcessTypeList','main',NULL,NULL,NULL),
 ('201314','已办任务','我的已处理清单','0','taskinfoyiban.cmd?method=getProcessTypeList','main',NULL,NULL,NULL),
 ('201315','结束任务','管理采办申请','0','prwprapplyquery_page_init.cmd?applystate=2','main',NULL,NULL,NULL),
 ('201316','角色任务','角色任务','0','taskinforole.cmd?method=getProcessTypeList','main',NULL,NULL,NULL),
 ('201317','监控任务','监控任务','0','taskinfomonitor.cmd?method=getProcessTypeList','main',NULL,NULL,NULL),
 ('201318','授权采办申请','授权采办申请','0','wftaskaccreditquery.cmd?clearsearch=true','main',NULL,NULL,NULL),
 ('20132','查询管理','查询管理','0',NULL,NULL,NULL,NULL,NULL),
 ('201320','流程查询','流程查询','0','taskquery.cmd','main',NULL,NULL,NULL),
 ('201321','表单查询','表单查询','0','workformforquery.cmd','main',NULL,NULL,NULL),
 ('201331','工作流统计分析',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('201332','持续时间',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('201333','业务流量',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('201334','季度平均持续时间',NULL,'0','wflasttime.cmd?method=processLastTimeByQuarter','main',NULL,NULL,NULL),
 ('201335','月平均持续时间',NULL,'0','wflasttime.cmd?method=processLastTimeByYear','main',NULL,NULL,NULL),
 ('201336','日平均持续时间',NULL,'0','wflasttime.cmd?method=processLastTimeByMonth','main',NULL,NULL,NULL),
 ('201337','季度业务流量',NULL,'0','wfportfolio.cmd?method=processPortfolioByQuarter','main',NULL,NULL,NULL),
 ('201338','月业务流量',NULL,'0','wfportfolio.cmd?method=processPortfolioByYear','main',NULL,NULL,NULL),
 ('201339','日业务流量',NULL,'0','wfportfolio.cmd?method=processPortfolioByMonth','main',NULL,NULL,NULL),
 ('201340','人员业务量分析',NULL,'0','wfpersonanlyze.cmd?method=PersonSelectPro','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000001','主菜单',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000002','组织机构','组织机构','0',NULL,NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000003','定义',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000004','定义国家',NULL,'0','countryquery.cmd?clear=true',NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000005','定义行政区域',NULL,'0','cantquery.cmd?method=query',NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000006','定义工作地点',NULL,'0','workplacequery.cmd?clear=true',NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000007','定义组织类型',NULL,'0','organtypequery.cmd?clear=true',NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000008','定义组织结构规则',NULL,'0','strurulequery.cmd?clear=true',NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000010','机构管理',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000011','管理组织机构',NULL,'0','stru.cmd?method=getroot','_tree',NULL,NULL,NULL),
 ('BSP000000000000000000000000013','组织结构版本','组织结构版本','0','struversionquery.cmd?clear=true','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000014','日历',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000015','工作日历','title','0','workday.cmd?method=getRoot','_tree',NULL,NULL,NULL),
 ('BSP000000000000000000000000016','财务期间','title','0','financialyearquery.cmd','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000017','例子',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000018','选择组织机构','title','0','demoquery.cmd','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000019','流水号管理','title','0','pubidtablequery.cmd','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000020','权限管理',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000021','角色设置',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000022','用户设置','title','0','user.cmd?method=getStruUserRoot','_tree',NULL,NULL,NULL),
 ('BSP000000000000000000000000023','角色','title','0','role.cmd?method=getroot','_tree',NULL,NULL,NULL),
 ('BSP000000000000000000000000024','角色模板','title','0','templates.cmd?method=getroot','_tree',NULL,NULL,NULL),
 ('BSP000000000000000000000000026','资源管理',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000027','功能资源管理','title','0','function.cmd?method=getRoot','_tree',NULL,NULL,NULL),
 ('BSP000000000000000000000000028','数据资源类型管理','title','0','datarestypequery.cmd?clear=true','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000029','自助服务',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000030','切换机构','title','0','subcorporationquery.cmd?method=query','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000031','重置所有用户密码','title','0','user.cmd?method=forResetCorpPassword','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000032','修改我的密码','title','0','user.cmd?method=forResetUserPassword','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000033','查询我的个人信息','title','0','user.cmd?method=userdetail','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000034','选择角色示例',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000035','选择角色','title','0','rolequery.cmd','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000036','审计','title','0',NULL,'main',NULL,NULL,NULL),
 ('BSP000000000000000000000000037','在线用户','title','0','onlinequery.cmd','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000038','用户在线历史记录','title','0','onlinehistquery.cmd','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000039','安全日志',NULL,'0','querySecurityLog.cmd','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000040','其他功能',NULL,'0',NULL,'main',NULL,NULL,NULL),
 ('BSP000000000000000000000000041','LDAP同步用户',NULL,'0','ldapuserquery.cmd','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000042','数字证书与用户映射',NULL,'0','certuserquery_page_init.cmd','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000045','权限报表','权限报表','0',NULL,NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000046','角色访问能力表','角色访问能力表','0','roleaccessability.cmd?method=forquery','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000047','用户访问能力表','用户访问能力表','0','useraccessability.cmd?method=forquery','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000048','菜单访问统计表','菜单访问统计表','0','menuvisitor.cmd?method=forquery','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000049','数据权限查询','数据权限查询','0','datarefuserquery.cmd?method=forquery','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000050','组织结构权限查询','组织结构权限查询','0','strutyperefuserquery.cmd?method=forquery','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000051','辅助功能',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000052','缓存管理',NULL,'0','bspCache.cmd?method=query','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000053','冗余数据检查',NULL,'0','checkDataCmd.cmd?method=main','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000054','CMD日志查询',NULL,'0','cmdLogQuery.cmd','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000055','CMD日志分析',NULL,'0','cmdBeanQueryCmd.cmd','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000056','活动数据连接查询',NULL,'0','activeconnquery.cmd','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000057','系统监控控制台',NULL,'0','CmdLog.cmd?method=setLogThread','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000058','初始化数据检查',NULL,'0','checkuserCmd.cmd?method=checkUserInit','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000059','注销','注销','0','logout.cmd?method=logout',NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000061','菜单维护',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000062','系统菜单项维护',NULL,'0','menusysitemquery_page_init.cmd?clear=true',NULL,NULL,NULL,NULL),
 ('BSP000000000000000000000000063','系统菜单维护',NULL,'0','menusys.cmd?method=getMenuTypeRoot','_tree',NULL,NULL,NULL),
 ('BSP000000000000000000000000065','我的快捷菜单',NULL,'0','permenudefine.cmd?method=getMenuStruRootPerFirst','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000067','系统切换',NULL,'0','newMenu.cmd?method=forChangeMenu','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000080','首页定制','首页定制','0','commonsingleparms.cmd?method=getportal','main',NULL,NULL,NULL),
 ('BSP000000000000000000000000082','功能数据权限查询表','功能数据权限查询表','0','funcAndDatarestype.cmd?method=forquery','main',NULL,NULL,NULL),
 ('BSP000001177','复制工作台',NULL,'0','commondesktopcopy.cmd?method=forcopy',NULL,NULL,NULL,NULL),
 ('DEMO','案例',NULL,'0',NULL,NULL,NULL,NULL,''),
 ('DEMO01','框架组件示例',NULL,'0',NULL,NULL,NULL,NULL,''),
 ('DEMO0101','文件上传下载',NULL,'0','mainblobquery_page_init.cmd',NULL,NULL,NULL,''),
 ('DEMO0102','员工信息维护',NULL,'0','lsemployeequery_page_init.cmd',NULL,NULL,NULL,''),
 ('DEMO0103','树形结构示例',NULL,'0','organstru.cmd?method=getRoot','_tree',NULL,NULL,''),
 ('DEMO0104','查询网格示例',NULL,'0','flexgridquery_page_init.cmd?clear=true&clearsearch=true',NULL,NULL,NULL,''),
 ('DEMO0105','编辑网格示例',NULL,'0',NULL,NULL,NULL,NULL,''),
 ('DEMO010501','编辑网格示例',NULL,'0','maingridquery_page_init.cmd',NULL,NULL,NULL,''),
 ('DEMO010502','商品信息',NULL,'0','product.cmd?method=forinsert',NULL,NULL,NULL,''),
 ('DEMO0107','组合框示例',NULL,'0',NULL,NULL,NULL,NULL,''),
 ('DEMO010701','组合框示例',NULL,'0','comboboxtestquery_page_init.cmd',NULL,NULL,NULL,''),
 ('DEMO010702','地址信息',NULL,'0','combocollectionquery_page_init.cmd',NULL,NULL,NULL,''),
 ('DEMO0108','EditGrid分页示例',NULL,'0',NULL,NULL,NULL,NULL,''),
 ('DEMO010801','主从表示例',NULL,'0','goodsquery_page_init.cmd',NULL,NULL,NULL,''),
 ('DEMO010802','单表示例',NULL,'0','food.cmd?method=forupdate',NULL,NULL,NULL,''),
 ('DEMO02','邮件',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('DEMO0201','未读邮件',NULL,'0','inboxmailquery.cmd?mailType=0&mailStatus=0',NULL,NULL,NULL,NULL),
 ('DEMO0202','我的邮箱',NULL,'0','mailstatusquery.cmd',NULL,NULL,NULL,NULL),
 ('DEMO0203','新建邮件',NULL,'0','mailresource.cmd?method=forinsert',NULL,NULL,NULL,NULL),
 ('DEMO0204','文件夹',NULL,'0','mailfoldertree.cmd?method=getServerType','_tree',NULL,NULL,NULL),
 ('DEMO0205','配置',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('DEMO020501','邮箱设置',NULL,'0','mailaccount.cmd?method=forupdate',NULL,NULL,NULL,NULL),
 ('DEMO020502','个人地址本',NULL,'0','mailaddresscategory.cmd?method=gettreeroot','_tree',NULL,NULL,NULL),
 ('DEMO020503','黑名单维护',NULL,'0','mailblacklistquery.cmd',NULL,NULL,NULL,NULL),
 ('DEMO020504','默认邮箱信息',NULL,'0','defmailconfig.cmd?method=forupdate',NULL,NULL,NULL,NULL),
 ('DEMO0206','查询邮件',NULL,'0','mailresourcegeneryquery.cmd?mailType=-1',NULL,NULL,NULL,NULL),
 ('DEMO0207','查询联系人',NULL,'0','mailaccountgeneryquery.cmd',NULL,NULL,NULL,NULL),
 ('MPMSG0000000001','消息平台',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('MPMSG000000000101','消息队列管理',NULL,'0','mpmessagquery_page_init.cmd?clear=true',NULL,NULL,NULL,NULL),
 ('MPMSG000000000102','消息发送日志',NULL,'0','mpmessaglogquery_page_init.cmd?clear=true',NULL,NULL,NULL,NULL),
 ('MPMSG000000000103','我的短消息',NULL,'0','mysysmessagquery.cmd?method=shoujian=21000=true',NULL,NULL,NULL,NULL),
 ('PUBTOOL00000001001','组件管理',NULL,'0',NULL,NULL,NULL,NULL,NULL),
 ('PUBTOOL00000001003','通用选择',NULL,'0','pubcomhelpquery_page_init.cmd?clear=true',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pub_menu_sysitem` ENABLE KEYS */;


--
-- Definition of table `pub_menu_type`
--

DROP TABLE IF EXISTS `pub_menu_type`;
CREATE TABLE `pub_menu_type` (
  `TYPE_ID` varchar(10) NOT NULL,
  `TYPE_NAME` varchar(60) DEFAULT NULL,
  `IS_CURRENT` char(1) DEFAULT NULL,
  PRIMARY KEY (`TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_menu_type`
--

/*!40000 ALTER TABLE `pub_menu_type` DISABLE KEYS */;
INSERT INTO `pub_menu_type` (`TYPE_ID`,`TYPE_NAME`,`IS_CURRENT`) VALUES 
 ('01','采办业务管理系统','1');
/*!40000 ALTER TABLE `pub_menu_type` ENABLE KEYS */;


--
-- Definition of table `pub_modules`
--

DROP TABLE IF EXISTS `pub_modules`;
CREATE TABLE `pub_modules` (
  `MODULE_ID` varchar(30) NOT NULL,
  `MODULE_NAME` varchar(40) NOT NULL,
  `PARENT_MODULE_ID` varchar(30) NOT NULL,
  `IS_LEAF` char(1) NOT NULL DEFAULT '0',
  `SEQ` int(11) DEFAULT NULL,
  PRIMARY KEY (`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_modules`
--

/*!40000 ALTER TABLE `pub_modules` DISABLE KEYS */;
INSERT INTO `pub_modules` (`MODULE_ID`,`MODULE_NAME`,`PARENT_MODULE_ID`,`IS_LEAF`,`SEQ`) VALUES 
 ('BASE','08系统管理','BASE','0',8),
 ('BASE00','公共资源','BASE','1',NULL),
 ('BSP00','系统管理','BASE','1',NULL),
 ('BSP01','组织结构','BASE','1',NULL),
 ('BSP02','机构日历','BASE','1',NULL),
 ('BSP03','权限管理','BASE','1',0),
 ('BSP04','菜单维护','BASE','1',NULL),
 ('BSP05','邮件','BASE','1',NULL),
 ('BSP06','辅助功能','BASE','1',NULL),
 ('BSP07','报表管理','BASE','1',NULL),
 ('CentralPurchase','集中采购','DivisionRule','1',1),
 ('DEMO','案例','DEMO','0',90),
 ('DEMO01','框架组件示例','DEMO','1',0),
 ('DEMO02','邮件','DEMO','1',1),
 ('divide','需求合并/分派','Requisition','1',0),
 ('DivisionRule','06业务规则','DivisionRule','0',6),
 ('EXCEL01','批量导入采办需求','Requisition','1',0),
 ('HandledPlan','已处理的采办计划','plan','1',0),
 ('IMPORTPLAN','批量导入采办计划','plan','1',0),
 ('manage','管理采办需求','Requisition','1',0),
 ('MPMSG','消息平台','BASE','0',23),
 ('MP_CMP_MESSAG','复杂消息','MPMSG','1',4),
 ('MP_MESSAG','消息队列','MPMSG','1',4),
 ('MP_MESSAG_LOG','消息日志','MPMSG','1',4),
 ('MyPlan','我的采办计划','plan','1',0),
 ('plan','01采办计划','plan','0',1),
 ('planMaintain','采办计划','DivisionRule','1',0),
 ('PlanManage','管理采办计划','plan','1',0),
 ('PlanProcess','审批采办计划','plan','1',0),
 ('PR0003','04采办申请','PR0003','1',4),
 ('prcbr','合并分派','DivisionRule','1',0),
 ('prccp','03集中采购','prccp','1',3),
 ('PRW_SCREENFIELD','屏幕字段说明','BASE','1',23),
 ('PUBTOOL','组件服务','BASE','0',16),
 ('PUBTOOL01','通用选择','PUBTOOL','1',0),
 ('PurchaseApplication','采办申请','DivisionRule','1',2),
 ('PurchaseRequisition001','创建采办需求','Requisition','1',0),
 ('Requisition','02采办需求','Requisition','0',2),
 ('rfxform01','05寻源单据','rfxform01','1',5),
 ('sysrpt001','09采办状态追踪报表','sysrpt001','1',9),
 ('systemamin','07系统配置','systemamin','1',7),
 ('SystemCommonModule','00系统公共功能','SystemCommonModule','1',0),
 ('SYS_MESSAG','系统在线消息提醒','BASE','1',4),
 ('unusedModule','10未启用模块','unusedModule','0',9),
 ('WF_MANAGE_FILES','流程定义文件','BASE','1',23),
 ('WF_PROCESS_FILES','流程文件列表','BASE','1',25),
 ('WF_PROCESS_TYPE','流程管理','BASE','1',0),
 ('WORKFLOW','工作流基本操作','BASE','1',0),
 ('WORKFLOW04','示例：差旅报销流程','WORKFLOW','1',NULL);
/*!40000 ALTER TABLE `pub_modules` ENABLE KEYS */;


--
-- Definition of table `pub_online`
--

DROP TABLE IF EXISTS `pub_online`;
CREATE TABLE `pub_online` (
  `SESSION_ID` varchar(128) NOT NULL,
  `USER_ID` varchar(30) NOT NULL,
  `USER_NAME` varchar(30) NOT NULL,
  `CORPORATION_ID` varchar(30) NOT NULL,
  `CORPORATION_NAME` varchar(80) NOT NULL,
  `LOGIN_TIME` varchar(30) DEFAULT NULL,
  `LOGOFF_TIME` varchar(30) DEFAULT NULL,
  `REMOTEADDR` varchar(80) NOT NULL,
  `REMOTEHOST` varchar(80) NOT NULL,
  `REMOTEPORT` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_online`
--

/*!40000 ALTER TABLE `pub_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_online` ENABLE KEYS */;


--
-- Definition of table `pub_online_hist`
--

DROP TABLE IF EXISTS `pub_online_hist`;
CREATE TABLE `pub_online_hist` (
  `SESSION_ID` varchar(128) NOT NULL,
  `USER_ID` varchar(30) NOT NULL,
  `USER_NAME` varchar(30) NOT NULL,
  `CORPORATION_ID` varchar(30) NOT NULL,
  `CORPORATION_NAME` varchar(80) NOT NULL,
  `LOGIN_TIME` varchar(30) DEFAULT NULL,
  `LOGOFF_TIME` varchar(30) DEFAULT NULL,
  `REMOTEADDR` varchar(80) NOT NULL,
  `REMOTEHOST` varchar(80) NOT NULL,
  `REMOTEPORT` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_online_hist`
--

/*!40000 ALTER TABLE `pub_online_hist` DISABLE KEYS */;
INSERT INTO `pub_online_hist` (`SESSION_ID`,`USER_ID`,`USER_NAME`,`CORPORATION_ID`,`CORPORATION_NAME`,`LOGIN_TIME`,`LOGOFF_TIME`,`REMOTEADDR`,`REMOTEHOST`,`REMOTEPORT`) VALUES 
 ('4028ac813b7ae213013b7ae213970000','SUPERADMIN','管理员','1','中国海洋石油总公司','20121208 22:18:54','20121208 22:20:06','127.0.0.1','127.0.0.1',''),
 ('4028ac813b7ae213013b7ae337d10001','SUPERADMIN','管理员','1','中国海洋石油总公司','20121208 22:20:09','20121208 22:20:37','127.0.0.1','127.0.0.1',''),
 ('4028ac813b7ae213013b7ae3b1800002','SUPERADMIN','管理员','1','中国海洋石油总公司','20121208 22:20:40','20121208 22:21:48','127.0.0.1','127.0.0.1',''),
 ('4028ac813b7ae213013b7ae4c53a0003','SUPERADMIN','管理员','1','中国海洋石油总公司','20121208 22:21:51','20121208 22:26:53','127.0.0.1','127.0.0.1',''),
 ('4028ac813b7aeef3013b7aeef3a10000','SUPERADMIN','管理员','1','中国海洋石油总公司','20121208 22:32:58','20121208 22:40:58','127.0.0.1','127.0.0.1',''),
 ('4028ac813b7aeef3013b7af652c30001','SUPERADMIN','管理员','1','中国海洋石油总公司','20121208 22:41:01','20121208 22:42:57','127.0.0.1','127.0.0.1',''),
 ('4028ac813b7af982013b7af982c70000','SUPERADMIN','管理员','1','中国海洋石油总公司','20121208 22:44:30','20121208 22:46:44','127.0.0.1','127.0.0.1',''),
 ('4028ac813b7af982013b7afb98d40001','SUPERADMIN','管理员','1','中国海洋石油总公司','20121208 22:46:47','20121208 22:47:22','127.0.0.1','127.0.0.1',''),
 ('4028ac813b7d7c55013b7d7c55ec0000','SUPERADMIN','管理员','1','广州博冠','20121209 10:26:38','20121209 10:27:39','127.0.0.1','127.0.0.1','');
/*!40000 ALTER TABLE `pub_online_hist` ENABLE KEYS */;


--
-- Definition of table `pub_organ`
--

DROP TABLE IF EXISTS `pub_organ`;
CREATE TABLE `pub_organ` (
  `ORGAN_ID` varchar(200) NOT NULL,
  `ORGAN_CODE` varchar(200) NOT NULL,
  `ORGAN_NAME` varchar(200) NOT NULL,
  `SHORT_NAME` varchar(200) DEFAULT NULL,
  `ORGAN_TYPE` varchar(10) NOT NULL,
  `WORKPLACE_ID` varchar(30) NOT NULL,
  `BEGIN_DATE` char(8) NOT NULL,
  `END_DATE` char(8) NOT NULL DEFAULT '99991231',
  `SCN` int(11) NOT NULL DEFAULT '-1',
  `IN_USE` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ORGAN_ID`),
  KEY `PUBORGAN_FK1` (`ORGAN_TYPE`),
  KEY `PUBORGAN_FK2` (`WORKPLACE_ID`),
  CONSTRAINT `PUBORGAN_FK1` FOREIGN KEY (`ORGAN_TYPE`) REFERENCES `pub_organ_type` (`ORGAN_TYPE`),
  CONSTRAINT `PUBORGAN_FK2` FOREIGN KEY (`WORKPLACE_ID`) REFERENCES `pub_workplace` (`WORKPLACE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_organ`
--

/*!40000 ALTER TABLE `pub_organ` DISABLE KEYS */;
INSERT INTO `pub_organ` (`ORGAN_ID`,`ORGAN_CODE`,`ORGAN_NAME`,`SHORT_NAME`,`ORGAN_TYPE`,`WORKPLACE_ID`,`BEGIN_DATE`,`END_DATE`,`SCN`,`IN_USE`) VALUES 
 ('1','9999','广州博冠','广州博冠','1','1','20000101','99991231',2,'1'),
 ('O00000000000101','999901','interfaceuser','interfaceuser','8','1','20000101','99991231',2,'1');
/*!40000 ALTER TABLE `pub_organ` ENABLE KEYS */;


--
-- Definition of table `pub_organ_hist`
--

DROP TABLE IF EXISTS `pub_organ_hist`;
CREATE TABLE `pub_organ_hist` (
  `ORGAN_ID` varchar(200) NOT NULL,
  `ORGAN_CODE` varchar(200) NOT NULL,
  `ORGAN_NAME` varchar(200) NOT NULL,
  `SHORT_NAME` varchar(200) DEFAULT NULL,
  `ORGAN_TYPE` varchar(10) NOT NULL,
  `WORKPLACE_ID` varchar(30) NOT NULL,
  `BEGIN_DATE` char(8) NOT NULL,
  `END_DATE` char(8) NOT NULL DEFAULT '99991231',
  `SCN` int(11) NOT NULL DEFAULT '-1',
  `IN_USE` char(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_organ_hist`
--

/*!40000 ALTER TABLE `pub_organ_hist` DISABLE KEYS */;
INSERT INTO `pub_organ_hist` (`ORGAN_ID`,`ORGAN_CODE`,`ORGAN_NAME`,`SHORT_NAME`,`ORGAN_TYPE`,`WORKPLACE_ID`,`BEGIN_DATE`,`END_DATE`,`SCN`,`IN_USE`) VALUES 
 ('1','9999','中国海洋石油总公司','中国海洋石油总公司','1','1','20000101','99991231',2,'1');
/*!40000 ALTER TABLE `pub_organ_hist` ENABLE KEYS */;


--
-- Definition of table `pub_organ_parms`
--

DROP TABLE IF EXISTS `pub_organ_parms`;
CREATE TABLE `pub_organ_parms` (
  `ORGAN_ID` varchar(200) NOT NULL,
  `PARMS_NAME` varchar(30) NOT NULL,
  `PARMS_VALUE` varchar(250) NOT NULL,
  `NOTE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ORGAN_ID`,`PARMS_NAME`),
  KEY `PUBORGANPARMS_FK1` (`PARMS_NAME`),
  CONSTRAINT `PUBORGANPARMS_FK1` FOREIGN KEY (`PARMS_NAME`) REFERENCES `pub_organ_parms_t` (`PARMS_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_organ_parms`
--

/*!40000 ALTER TABLE `pub_organ_parms` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_organ_parms` ENABLE KEYS */;


--
-- Definition of table `pub_organ_parms_t`
--

DROP TABLE IF EXISTS `pub_organ_parms_t`;
CREATE TABLE `pub_organ_parms_t` (
  `PARMS_NAME` varchar(30) NOT NULL,
  `PARMS_VALUE` varchar(250) NOT NULL,
  `DATA_RES` char(1) NOT NULL DEFAULT '0',
  `ENUM_NAME` varchar(30) DEFAULT NULL,
  `ENUM_VAULE` varchar(30) DEFAULT NULL,
  `RES_TABLE` varchar(30) DEFAULT NULL,
  `RES_TABLE_NAME` varchar(30) DEFAULT NULL,
  `VALUE_COL` varchar(30) DEFAULT NULL,
  `VALUE_COL_DES` varchar(60) DEFAULT NULL,
  `NAME_COL` varchar(30) DEFAULT NULL,
  `NAME_COL_DES` varchar(60) DEFAULT NULL,
  `IS_WHERE` char(1) DEFAULT '0',
  `FILTER_FIELD` varchar(600) DEFAULT NULL,
  `NOTE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`PARMS_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_organ_parms_t`
--

/*!40000 ALTER TABLE `pub_organ_parms_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_organ_parms_t` ENABLE KEYS */;


--
-- Definition of table `pub_organ_type`
--

DROP TABLE IF EXISTS `pub_organ_type`;
CREATE TABLE `pub_organ_type` (
  `ORGAN_TYPE` varchar(10) NOT NULL,
  `TYPE_NAME` varchar(60) NOT NULL,
  `PARENT_TYPE` varchar(10) NOT NULL,
  `IN_USE` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ORGAN_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_organ_type`
--

/*!40000 ALTER TABLE `pub_organ_type` DISABLE KEYS */;
INSERT INTO `pub_organ_type` (`ORGAN_TYPE`,`TYPE_NAME`,`PARENT_TYPE`,`IN_USE`) VALUES 
 ('1','法人','1','1'),
 ('2','职能部门','2','1'),
 ('6','岗位','6','1'),
 ('8','职工','8','1');
/*!40000 ALTER TABLE `pub_organ_type` ENABLE KEYS */;


--
-- Definition of table `pub_organ_workday`
--

DROP TABLE IF EXISTS `pub_organ_workday`;
CREATE TABLE `pub_organ_workday` (
  `SOLAR_DATE` char(8) NOT NULL,
  `ORGAN_ID` varchar(200) NOT NULL,
  `LUNAR_DATE` char(8) DEFAULT NULL,
  `IS_WORKDAY` char(1) NOT NULL DEFAULT '1',
  `WEEK` int(11) DEFAULT NULL,
  `NOTE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`SOLAR_DATE`,`ORGAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_organ_workday`
--

/*!40000 ALTER TABLE `pub_organ_workday` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_organ_workday` ENABLE KEYS */;


--
-- Definition of table `pub_res_type`
--

DROP TABLE IF EXISTS `pub_res_type`;
CREATE TABLE `pub_res_type` (
  `RES_TYPE_ID` varchar(10) NOT NULL,
  `RES_TYPE_NAME` varchar(60) NOT NULL,
  PRIMARY KEY (`RES_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_res_type`
--

/*!40000 ALTER TABLE `pub_res_type` DISABLE KEYS */;
INSERT INTO `pub_res_type` (`RES_TYPE_ID`,`RES_TYPE_NAME`) VALUES 
 ('00','默认');
/*!40000 ALTER TABLE `pub_res_type` ENABLE KEYS */;


--
-- Definition of table `pub_resources`
--

DROP TABLE IF EXISTS `pub_resources`;
CREATE TABLE `pub_resources` (
  `RESOURCE_ID` varchar(30) NOT NULL,
  `RESOURCE_NAME` varchar(80) NOT NULL,
  `RESOURCE_ALIAS` varchar(80) NOT NULL,
  `URL_NAMES` varchar(3000) NOT NULL,
  `SECURITY_LEVEL` int(11) NOT NULL DEFAULT '0',
  `FUNCTION_ID` varchar(30) NOT NULL,
  `IS_DEFAULT` char(1) NOT NULL DEFAULT '0',
  `IS_AUDIT` char(1) NOT NULL DEFAULT '0',
  `RES_TYPE_ID` varchar(10) NOT NULL DEFAULT '00',
  `SEQ` int(11) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`),
  KEY `PUBRESOURCES_FK1` (`SECURITY_LEVEL`),
  KEY `PUBRESOURCES_FK2` (`FUNCTION_ID`),
  KEY `PUBRESOURCES_FK3` (`RES_TYPE_ID`),
  CONSTRAINT `PUBRESOURCES_FK1` FOREIGN KEY (`SECURITY_LEVEL`) REFERENCES `pub_security_level` (`SECURITY_LEVEL`),
  CONSTRAINT `PUBRESOURCES_FK2` FOREIGN KEY (`FUNCTION_ID`) REFERENCES `pub_functions` (`FUNCTION_ID`),
  CONSTRAINT `PUBRESOURCES_FK3` FOREIGN KEY (`RES_TYPE_ID`) REFERENCES `pub_res_type` (`RES_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_resources`
--

/*!40000 ALTER TABLE `pub_resources` DISABLE KEYS */;
INSERT INTO `pub_resources` (`RESOURCE_ID`,`RESOURCE_NAME`,`RESOURCE_ALIAS`,`URL_NAMES`,`SECURITY_LEVEL`,`FUNCTION_ID`,`IS_DEFAULT`,`IS_AUDIT`,`RES_TYPE_ID`,`SEQ`) VALUES 
 ('applyDaiban','审批采办申请','审批采办申请（待办任务）','taskinfodaiban.cmd?method=getProcessTypeList;taskinfodaiban.cmd?method=getProcessList;',0,'PR000305','0','0','00',0),
 ('applyDraft','采办申请草稿箱','采办申请草稿箱','prwprapplyquery_page_init.cmd?applystate=5;',0,'PR000302','0','0','00',0),
 ('attachment001','附件分类维护','附件分类维护','sc/attachment/list.do;sc/attachment/create.do;sc/attachment/add.do;sc/attachment/save.do;sc/attachment/history/list.do;',0,'attachment','0','0','00',0),
 ('BASE000101','执行','检索组织结构','stru.cmd?method=get;stru.cmd?method=detail;stru.cmd?method=subDetail;stru.cmd?method=eventDetail;stru.cmd?method=versionDetail;tru.cmd?is;stru.cmd?organ;getSelectRoot;selectUserDataResRef',0,'BASE0001','0','0','00',NULL),
 ('BASE000201','执行','获得角色列表帮助','role.cmd?method=selectroot;role.cmd?method=choiceroot;role.cmd?method=selectnode;role.cmd?method=choicenode;role.cmd?method=doHelpTable;userhelp.cmd;help.cmd',0,'BASE0002','0','0','00',NULL),
 ('BASE000301','执行','修改我的用户密码','user.cmd?method=forResetUserPassword;user.cmd?method=resetUserPassword;user.cmd?method=loginResetUserPassword',0,'BASE0003','0','1','00',NULL),
 ('BASE000401','执行','修改我的个人信息','user.cmd?method=userdetail;user.cmd?method=forupdateuser;user.cmd?method=updateuser;userselfdatarefquery.cmd;user.cmd?method=getAvailableAgentUsersCheckRoot;user.cmd?method=getAvailableAgentUsersCheckNode',0,'BASE0004','0','1','00',NULL),
 ('BASE000501','执行','检索行政区域','canthelp.cmd',0,'BASE0005','0','0','00',NULL),
 ('BASE000601','读取','读取我的快捷菜单树','permenudefine.cmd?method=getMenuStruRoot;permenudefine.cmd?method=getMenuStruNode;permenudefine.cmd?method=detail;function.cmd?method=getFunctionRootHelp',0,'BASE0006','0','1','00',NULL),
 ('BASE000602','上移','上移我的快捷菜单','permenudefine.cmd?method=moveUp',0,'BASE0006','0','1','00',NULL),
 ('BASE000603','下移','下移我的快捷菜单','permenudefine.cmd?method=moveDown',0,'BASE0006','0','1','00',NULL),
 ('BASE000604','增加','增加我的快捷菜单','permenudefine.cmd?method=newmenu',0,'BASE0006','0','1','00',NULL),
 ('BASE000605','选择','选择我的系统菜单帮助','menusysitemhelp.cmd;permenudefine.cmd?method=select',0,'BASE0006','0','1','00',NULL),
 ('BASE000606','移动','移动我的快捷菜单','permenudefine.cmd=getMenuStruRootHelp;permenudefine.cmd?method=moveTo',0,'BASE0006','0','1','00',NULL),
 ('BASE000607','删除','删除我的快捷菜单','permenudefine.cmd?method=delete',0,'BASE0006','0','1','00',NULL),
 ('BASE000608','保存','保存我的快捷菜单','newmenusave.cmd',0,'BASE0006','0','1','00',NULL),
 ('BASE000609','克隆','克隆我的快捷菜单','newMenu.cmd=forCloneMenu;newMenu.cmd?method=cloneMenu',0,'BASE0006','0','1','00',NULL),
 ('BASE000610','生效菜单','生效我的快捷菜单','refresh.cmd',0,'BASE0006','0','1','00',NULL),
 ('BASE000611','删除个性化菜单','删除个性化菜单','permenudefine.cmd?method=delMenuStru',0,'BASE0006','0','1','00',NULL),
 ('BASE000612','定义我的快捷菜单','定义我的快捷菜单','permenudefine.cmd?method=getMenuStruRootPerFirst;permenudefine.cmd?method=getMenuStruRootPer',0,'BASE0006','0','1','00',NULL),
 ('BASE000613','导出我的快捷菜单','导出我的快捷菜单','permenudefine.cmd?method=forExportMenuPer',0,'BASE0006','0','1','00',1),
 ('BASE000614','导入我的快捷菜单','导入我的快捷菜单','permenudefine.cmd?method=forImportMenuPer',0,'BASE0006','0','1','00',1),
 ('BASE000701','切换菜单','切换菜单','newMenu.cmd?method=forChangeMenu;newMenu.cmd?method=changMenu;refresh.cmd',0,'BASE0007','0','1','00',NULL),
 ('BASE000801','首页定制','首页定制','commonsingleparms.cmd',0,'BASE0008','1','0','00',NULL),
 ('BASE000901','获取','平台版本','jsp/readVersion.jsp',0,'BASE0009','0','0','00',0),
 ('batchapply002','批量审批','批量审批','batchapplyaction.cmd?method=batchapp',0,'PR000305','0','0','00',0),
 ('BSP000101','读取','读取业务流水信息','pubidtablequery.cmd;pubidtable.cmd?method=detail',0,'BSP0001','1','0','00',NULL),
 ('BSP000102','增加','增加业务流水','pubidtable.cmd?method=forinsert;pubidtable.cmd?method=insert;pubidtable.cmd?method=insertContinue',0,'BSP0001','0','1','00',NULL),
 ('BSP000103','修改','修改业务流水','pubidtable.cmd?method=forupdate;pubidtable.cmd?method=update',0,'BSP0001','0','1','00',NULL),
 ('BSP000104','删除','删除业务流水','pubidtable.cmd?method=delete',0,'BSP0001','0','1','00',NULL),
 ('BSP010101','读取','读取国家（地区）信息','countryquery.cmd;country.cmd?method=detail',0,'BSP0101','1','0','00',NULL),
 ('BSP010102','增加','增加国家（地区）','country.cmd?method=forinsert;country.cmd?method=insert;country.cmd?method=insertContinue',0,'BSP0101','0','1','00',NULL),
 ('BSP010103','修改','修改国家（地区）','country.cmd?method=forupdate;country.cmd?method=update',0,'BSP0101','0','1','00',NULL),
 ('BSP010104','删除','删除国家（地区）','country.cmd?method=delete',0,'BSP0101','0','1','00',NULL),
 ('BSP010201','读取','读取行政区域信息','cantquery.cmd;cant.cmd?method=detail',0,'BSP0102','1','0','00',NULL),
 ('BSP010202','增加','增加行政区域','cant.cmd?method=forinsert;cant.cmd?method=insert;cant.cmd?method=insertContinue',0,'BSP0102','0','1','00',NULL),
 ('BSP010203','修改','修改行政区域','cant.cmd?method=forupdate;cant.cmd?method=update',0,'BSP0102','0','1','00',NULL),
 ('BSP010204','删除','删除行政区域','cant.cmd?method=delete',0,'BSP0102','0','1','00',NULL),
 ('BSP010301','读取','读取工作地点信息','workplacequery.cmd;workplace.cmd?method=detail',0,'BSP0103','1','0','00',NULL),
 ('BSP010302','增加','增加工作地点','workplace.cmd',0,'BSP0103','0','1','00',NULL),
 ('BSP010303','修改','修改工作地点','workplace.cmd?method=forupdate;workplace.cmd?method=update',0,'BSP0103','0','1','00',NULL),
 ('BSP010304','删除','删除工作地点','workplace.cmd?method=delete',0,'BSP0103','0','1','00',NULL),
 ('BSP010401','读取','读取组织类型信息','organtypequery.cmd;organtype.cmd?method=detail',0,'BSP0104','1','0','00',NULL),
 ('BSP010402','增加','增加组织类型','organtype.cmd?method=forinsert;organtype.cmd?method=insert;organtype.cmd?method=insertContinue',0,'BSP0104','0','1','00',NULL),
 ('BSP010403','修改','修改组织类型','organtype.cmd?method=forupdate;organtype.cmd?method=update',0,'BSP0104','0','1','00',NULL),
 ('BSP010404','删除','删除组织类型','organtype.cmd?method=delete',0,'BSP0104','0','1','00',NULL),
 ('BSP010501','读取','读取人事事件类型信息','hrEventTypeQuery.cmd;hreventtype.cmd?method=detail',0,'BSP0105','1','0','00',NULL),
 ('BSP010502','增加','增加人事事件类型','hreventtype.cmd?method=forinsert;hreventtype.cmd?method=insert',0,'BSP0105','0','1','00',NULL),
 ('BSP010503','修改','修改人事事件类型','hreventtype.cmd?method=forupdate;hreventtype.cmd?method=update',0,'BSP0105','0','1','00',NULL),
 ('BSP010504','删除','删除人事事件类型','hreventtype.cmd?method=delete',0,'BSP0105','0','1','00',NULL),
 ('BSP010601','读取','读取组织结构规则信息','strurulequery.cmd;strurule.cmd?method=detail;struruleQueryInit.cmd',0,'BSP0106','1','0','00',NULL),
 ('BSP010602','增加','增加组织结构规则','strurule.cmd?method=forinsert;strurule.cmd?method=insert;strurule.cmd?method=insertContinue',0,'BSP0106','0','1','00',NULL),
 ('BSP010603','修改','修改组织结构规则','strurule.cmd?method=forupdate;strurule.cmd?method=update',0,'BSP0106','0','1','00',NULL),
 ('BSP010604','删除','删除组织结构规则','strurule.cmd?method=delete',0,'BSP0106','0','1','00',NULL),
 ('BSP010701','读取','读取组织信息','stru.cmd?method=getroot;stru.cmd?method=getnode;stru.cmd?method=detailProxy;hreventquery.cmd',0,'BSP0107','1','0','00',NULL),
 ('BSP010702','搜索','搜索组织列表','struquery.cmd',0,'BSP0107','0','1','00',NULL),
 ('BSP010703','增加','增加组织','stru.cmd?method=forInsertOrganType;stru.cmd?method=forInsertProxy;stru.cmd?method=insert;stru.cmd?method=add',0,'BSP0107','0','1','00',NULL),
 ('BSP010704','修改','修改组织','stru.cmd?method=forUpdateProxy;stru.cmd?method=update',0,'BSP0107','0','1','00',NULL),
 ('BSP010705','撤销','撤销组织','stru.cmd?method=forDelete;stru.cmd?method=delete',0,'BSP0107','0','1','00',NULL),
 ('BSP010706','排序','对组织排序','stru.cmd?method=getChangeOrderRoot;stru.cmd?method=changeStruOrder',0,'BSP0107','0','1','00',NULL),
 ('BSP010707','调动','办理组织调动','stru.cmd?method=getMergeRoot;stru.cmd?method=mergeTo',0,'BSP0107','0','1','00',NULL),
 ('BSP010708','导出组织结构','导出组织结构','stru.cmd?method=forExport',0,'BSP0107','0','1','00',1),
 ('BSP010709','导出组织结构','导出组织结构','stru.cmd?method=forImport;stru.cmd?method=import',0,'BSP0107','0','1','00',1),
 ('BSP010801','读取','读取机构参数','organparmsquery.cmd;organparms.cmd?method=detail;organparmsthelp.cmd;dataresquery.cmd;organparmst.cmd?method=enumValueQuery',0,'BSP0108','1','0','00',NULL),
 ('BSP010802','增加','增加机构参数','organparms.cmd?method=forinsert;organparms.cmd?method=insert',0,'BSP0108','0','1','00',NULL),
 ('BSP010803','修改','修改机构参数','organparms.cmd?method=forupdate;organparms.cmd?method=update',0,'BSP0108','0','1','00',NULL),
 ('BSP010804','删除','删除机构参数','organparms.cmd?method=delete',0,'BSP0108','0','1','00',NULL),
 ('BSP010901','读取','读取组织结构类型信息','strutypeQueryInit.cmd;strutypequery.cmd;strutype.cmd?method=detail',0,'BSP0109','1','0','00',NULL),
 ('BSP010902','增加','增加组织结构类型','strutype.cmd?method=forinsert;strutype.cmd?method=insert;strutype.cmd?method=insertContinue',0,'BSP0109','0','1','00',NULL),
 ('BSP010903','修改','修改组织结构类型','strutype.cmd?method=forupdate;strutype.cmd?method=update',0,'BSP0109','0','1','00',NULL),
 ('BSP010904','删除','删除组织结构类型','strutype.cmd?method=fordelete;strutype.cmd?method=delete',0,'BSP0109','0','1','00',NULL),
 ('BSP011001','读取','读取组织结构版本','struversionquery.cmd;stru.cmd?method=getHistRoot',0,'BSP0110','1','0','00',NULL),
 ('BSP011002','增加','保存组织结构版本','struversion.cmd?method=forinsert;struversion.cmd?method=insert',0,'BSP0110','0','1','00',NULL),
 ('BSP011003','修改','修改组织结构版本信息','struversion.cmd?method=forupdate;struversion.cmd?method=update',0,'BSP0110','0','1','00',NULL),
 ('BSP011004','删除','删除组织结构版本','struversion.cmd?method=delete',0,'BSP0110','0','1','00',NULL),
 ('BSP011101','读取','读取机构参数类型','organparmstquery.cmd;organparmst.cmd?method=detail',0,'BSP0111','1','0','00',NULL),
 ('BSP011102','增加','增加机构参数类型','organparmst.cmd?method=forinsert;organparmst.cmd?method=insert',0,'BSP0111','0','1','00',NULL),
 ('BSP011103','修改','修改机构参数类型','organparmst.cmd?method=forupdate;organparmst.cmd?method=update',0,'BSP0111','0','1','00',NULL),
 ('BSP011104','删除','删除机构参数类型','organparmst.cmd?method=delete',0,'BSP0111','0','1','00',NULL),
 ('BSP020101','读取','读取财务期间信息','financialyearquery.cmd;financialyear.cmd?method=detail',0,'BSP0201','1','0','00',NULL),
 ('BSP020102','增加','增加财务期间','financialyear.cmd?method=forinsert;financialyear.cmd?method=insert',0,'BSP0201','0','1','00',NULL),
 ('BSP020103','修改','修改财务期间信息','financialyear.cmd?method=forupdate;financialyear.cmd?method=update',0,'BSP0201','0','1','00',NULL),
 ('BSP020104','删除','删除财务期间','financialyear.cmd?method=delete',0,'BSP0201','0','1','00',NULL),
 ('BSP020201','读取','读取工作日历信息','workday.cmd?method=get;workday.cmd?method=detail',0,'BSP0202','1','0','00',NULL),
 ('BSP020202','增加','增加工作日历','workday.cmd?method=forinsert_info;workday.cmd?method=insert;workday.cmd?method=forinsert',0,'BSP0202','0','1','00',NULL),
 ('BSP020203','修改','修改工作日历','workday.cmd?method=forupdate;workday.cmd?method=update;workday.cmd?method=forupdate',0,'BSP0202','0','1','00',NULL),
 ('BSP020204','删除','删除工作日历','workday.cmd?method=delete',0,'BSP0202','0','1','00',NULL),
 ('BSP030101','用户信息维护','用户信息维护','user/search/toSearchUser.do;user/search/searchCheckboxInit.do;user/search/searchCheckboxList.do;user/search/searchRadioInit.do;user/search/searchRadioList.do;user.cmd?method=get;user.cmd?method=detail;datarestype.cmd;userQuery.cmd;userdatarefquery.cmd;userext.cmd;user.cmd?method=forImportUser;user.cmd?method=importUser;user.cmd?method=forExportUser;user.cmd?method=forExportOneUser;user.cmd?method=get;user.cmd?method=forupdate;user.cmd?method=update;userdataref.cmd;user.cmd?method=changeDepartment;user.cmd?method=get;user.cmd?method=forinsert;user.cmd?method=insert;user.cmd?method=get;user.cmd?method=delete;',0,'BSP0301','1','0','00',0),
 ('BSP030201','角色信息维护','角色信息维护','role.cmd?method=get;role.cmd?method=detail;roleResource.cmd?method=get;role.cmd?method=get;role.cmd?method=forinsert;role.cmd?method=insert;role.cmd?method=forbatchGrant;role.cmd?method=forImportRole;role.cmd?method=importRole;function.cmd?method=query;role.cmd?method=forExportRole;role.cmd?method=forExportOneRole;roleResource.cmd?method=updateRoleResource;role.cmd?method=get;role.cmd?method=forupdate;role.cmd?method=update;role.cmd?method=grantPermission;role.cmd?method=revokePermission;function.cmd?method=getContextRoot;function.cmd?method=getContextNode;role.cmd?method=get;role.cmd?method=delete;jsp/help.jsp?url=role.cmd&method=getUserListOfRoleRoot;',0,'BSP0302','1','0','00',0),
 ('BSP030301','读取','读取角色模板信息','templates.cmd?method=get;trolesquery.cmd;trolesquerypage.cmd',0,'BSP0303','1','0','00',NULL),
 ('BSP030302','增加','增加角色模板','templates.cmd?method=get;templates.cmd?method=treeinsert;templates.cmd?method=insert;templates.cmd?method=forinsert_info',0,'BSP0303','0','1','00',NULL),
 ('BSP030303','修改','修改角色模板','templates.cmd?method=get;templates.cmd?method=treeupdate;templates.cmd?method=update;templates.cmd?method=forupdate_info',0,'BSP0303','0','1','00',NULL),
 ('BSP030304','定义角色','定义角色','templates.cmd?method=get;trolesquery.cmd;troles.cmd;troleoptsquery.cmd;tRoleopts.cmd;roleResource.cmd',0,'BSP0303','0','1','00',NULL),
 ('BSP030305','应用','应用角色模板','templates.cmd',0,'BSP0303','0','1','00',NULL),
 ('BSP030306','删除','删除角色模板','templates.cmd?method=get;templates.cmd?method=delete',0,'BSP0303','0','1','00',NULL),
 ('BSP030307','修改','修改角色模板功能资源类型','tRoleopts.cmd?method=updateTRoleResource',0,'BSP0303','1','0','00',1),
 ('BSP030308','查询','查询角色模板功能资源类型','function.cmd?method=queryTRoles',0,'BSP0303','1','0','00',1),
 ('BSP030309','导入角色模板','导入角色模板','templates.cmd?method=forImportTemplate;templates.cmd?method=importTemplate',0,'BSP0303','0','1','00',1),
 ('BSP030310','导出角色模板','导出角色模板','templates.cmd?method=forExportTemplate',0,'BSP0303','0','1','00',1),
 ('BSP030401','读取','读取不相容角色集信息','conflictRoleSet.cmd?method=get;conflictRoleSet.cmd?method=detail',0,'BSP0304','1','0','00',NULL),
 ('BSP030402','增加','增加不相容角色集','conflictRoleSet.cmd?method=get;conflictRoleSet.cmd?method=forinsert;conflictRoleSet.cmd?method=insert;conflictRoleSet.cmd?method=detail',0,'BSP0304','0','1','00',NULL),
 ('BSP030403','修改','修改不相容角色集','conflictRoleSet.cmd?method=get;conflictRoleSet.cmd?method=forupdate;conflictRoleSet.cmd?method=update;conflictRoleSet.cmd?method=detail',0,'BSP0304','0','1','00',NULL),
 ('BSP030404','删除','删除不相容角色集','conflictRoleSet.cmd?method=get;conflictRoleSet.cmd?method=delete',0,'BSP0304','0','1','00',NULL),
 ('BSP030501','读取','查阅功能资源列表','function.cmd?method=get;module.cmd?method=detail;function.cmd?method=detail;resources.cmd?method=detail',0,'BSP0305','1','0','00',NULL),
 ('BSP0305010','下移功能','下移功能','function.cmd?method=moveDown',0,'BSP0305','1','0','00',1),
 ('BSP0305011','上移资源','上移资源','resources.cmd?method=moveUp',0,'BSP0305','1','0','00',1),
 ('BSP0305012','下移资源','下移资源','resources.cmd?method=moveDown',0,'BSP0305','1','0','00',1),
 ('BSP0305013','转移资源','转移资源','resources.cmd?method=getTransferRoot;resources.cmd?method=getTransferNode;resources.cmd?method=transfer',0,'BSP0305','1','0','00',1),
 ('BSP0305014','选择','选择模块','module.cmd?method=getModuleRoot;module.cmd?method=getModuleNode',0,'BSP0305','1','0','00',1),
 ('BSP030502','增加','增加功能资源','module.cmd?method=forinsert;module.cmd?method=insert;function.cmd?method=forinsertFunction;function.cmd?method=insert;resources.cmd?method=forinsert',0,'BSP0305','0','1','00',NULL),
 ('BSP030503','修改','修改功能资源','module.cmd?method=forupdate;module.cmd?method=update;function.cmd?method=forupdate;function.cmd?method=update;function.cmd?method=transfer;resources.cmd?method=forinsert;resources.cmd?method=insert;resources.cmd?method=forupdate;resources.cmd?method=update',0,'BSP0305','0','1','00',NULL),
 ('BSP030504','删除','删除功能资源','module.cmd?method=delete;function.cmd?method=delete;resources.cmd?method=delete',0,'BSP0305','0','1','00',NULL),
 ('BSP030505','数据导出','功能资源导出','resources.cmd?method=forExport',0,'BSP0305','0','1','00',1),
 ('BSP030506','上移模块','上移模块','module.cmd?method=moveUp',0,'BSP0305','1','0','00',1),
 ('BSP030507','下移模块','下移模块','module.cmd?method=moveDown',0,'BSP0305','1','0','00',1),
 ('BSP030508','转移模块','转移模块','module.cmd?method=getTransferRoot;module.cmd?method=getTransferNode;module.cmd?method=transfer',0,'BSP0305','1','0','00',1),
 ('BSP030509','上移功能','上移功能','function.cmd?method=moveUp',0,'BSP0305','1','0','00',1),
 ('BSP030510','数据导入','功能资源导入向导','expAndImp.cmd?method=forImport',0,'BSP0305','0','1','00',1),
 ('BSP030511','数据导入','功能资源导入','expAndImp.cmd?method=imports',0,'BSP0305','0','1','00',1),
 ('BSP030601','读取','查阅数据资源定义情况','datarestypequery.cmd;datarestype.cmd?method=detail',0,'BSP0306','1','0','00',NULL),
 ('BSP030602','增加','增加数据资源类型','datarestype.cmd?method=forinsert;datarestype.cmd?method=insert;datarestype.cmd?method=insertContinue',0,'BSP0306','0','1','00',NULL),
 ('BSP030603','修改','修改数据资源类型定义','datarestype.cmd?method=forupdate;datarestype.cmd?method=update',0,'BSP0306','0','1','00',NULL),
 ('BSP030604','删除','删除数据资源类型','datarestype.cmd?method=delete',0,'BSP0306','0','1','00',NULL),
 ('BSP030701','执行','切换机构','subcorporationquery.cmd?method=query;changecorporation.cmd',0,'BSP0307','1','1','00',NULL),
 ('BSP030801','执行','重置所有用户密码','user.cmd?method=forResetCorpPassword;user.cmd?method=resetCorpPassword',0,'BSP0308','1','1','00',NULL),
 ('BSP030901','执行','设置登录日期','setLoginDate.cmd',0,'BSP0309','1','1','00',NULL),
 ('BSP031001','查询','查询在线用户','onlinequery.cmd;onlinequerying.cmd;online.cmd?method=detail',0,'BSP0310','1','1','00',NULL),
 ('BSP031002','终断会话','终断会话','online.cmd?method=delete',0,'BSP0310','0','1','00',NULL),
 ('BSP031101','查询','查询用户历史登录记录','onlinehistquery.cmd;onlinehistquerying.cmd;onlinehist.cmd?method=detail;onlinehist.cmd?method=forSearch',0,'BSP0311','1','1','00',NULL),
 ('BSP031102','批量删除','批量删除用户认证日志','onlinehist.cmd?method=fordeletebetween;onlinehist.cmd?method=deleteBetween;onlinehist.cmd?method=fordeleteday;onlinehist.cmd?method=fordeleteweek;onlinehist.cmd?method=fordeletemonth',0,'BSP0311','0','1','00',NULL),
 ('BSP031201','查询','查询审计日志','querySecurityLog.cmd;securityLog.cmd?method=querySessionTerminal',0,'BSP0312','1','1','00',NULL),
 ('BSP031202','批量删除','批量删除用户审计日志','securityLog.cmd?method=forDelete;securityLog.cmd?method=delete',0,'BSP0312','0','1','00',NULL),
 ('BSP031203','查询','查询安全日志明细','securityLog.cmd?method=detail;',0,'BSP0312','0','1','00',NULL),
 ('BSP031301','执行同步','从LDAP同步用户','ldapuserquery.cmd;ldapUser.cmd?method=synchronizeLdap',0,'BSP0313','0','1','00',NULL),
 ('BSP031302','将用户加入系统','将用户加入系统','ldapuserquery.cmd;ldapUser.cmd?method=synchronizeUser',0,'BSP0313','0','1','00',NULL),
 ('BSP031401','读取','读取数字证书与用户映射表信息','certuserquery_page_init.cmd;certuser.cmd?method=detail',0,'BSP0314','0','1','00',NULL),
 ('BSP031402','增加','增加数字证书与用户映射表信息','certuserquery_page_init.cmd;certuser.cmd?method=forinsert;certuser.cmd?method=insert;certuser.cmd?method=insertContinue;role.cmd?method=doHelpTable',0,'BSP0314','0','1','00',NULL),
 ('BSP031403','修改','修改数字证书与用户映射表信息','certuserquery_page_init.cmd;certuser.cmd?method=forupdate;certuser.cmd?method=update;role.cmd?method=doHelpTable',0,'BSP0314','0','1','00',NULL),
 ('BSP031404','删除','删除数字证书与用户映射表信息','certuserquery_page_init.cmd;certuser.cmd?method=delete',0,'BSP0314','0','1','00',NULL),
 ('BSP040101','读取','读取系统菜单','menusysitemquery_page_init.cmd;menusysitem.cmd?method=detail',0,'BSP0401','1','0','00',NULL),
 ('BSP040102','增加','增加系统菜单','menusysitem.cmd?method=forinsert;menusysitem.cmd?method=insert;menusysitem.cmd?method=insertContinue;function.cmd?method=getFunctionRootHelp',0,'BSP0401','0','1','00',NULL),
 ('BSP040103','修改','修改系统菜单','menusysitem.cmd?method=forupdate;menusysitem.cmd?method=update;function.cmd?method=getFunctionRootHelp',0,'BSP0401','0','1','00',NULL),
 ('BSP040104','删除','删除系统菜单','menusysitem.cmd?method=delete',0,'BSP0401','0','1','00',NULL),
 ('BSP040201','系统菜单维护','系统菜单维护','menusys.cmd;menusyssave.cmd;refresh.cmd;menusysitemhelp.cmd',0,'BSP0402','1','0','00',NULL),
 ('BSP040202','导入系统菜单','导入系统菜单','menusys.cmd?method=forImportMenu;menusys.cmd?method=importMenu',0,'BSP0402','1','0','00',1),
 ('BSP040203','导出系统菜单','导出系统菜单','menusys.cmd?method=forExportMenu',0,'BSP0402','1','0','00',1),
 ('BSP040301','读取','定义组织个性化菜单','strumenudefine.cmd?method=getroot;strumenudefine.cmd?method=getnode;strumenudefine.cmd?method=getMenuStruRoot;strumenudefine.cmd?method=getMenuStruNode;strumenudefine.cmd?method=detail;function.cmd?method=getFunctionRootHelp',0,'BSP0403','0','1','00',NULL),
 ('BSP040302','上移','上移组织个性化菜单','strumenudefine.cmd?method=moveUp',0,'BSP0403','0','1','00',NULL),
 ('BSP040303','下移','下移组织个性化菜单','strumenudefine.cmd?method=moveDown',0,'BSP0403','0','1','00',NULL),
 ('BSP040304','增加','增加组织个性化菜单','strumenudefine.cmd?method=newmenu',0,'BSP0403','0','1','00',NULL),
 ('BSP040305','选择','选择组织系统菜单帮助','menusysitemhelp.cmd;strumenudefine.cmd?method=select;pubapp.cmd?method=query',0,'BSP0403','0','1','00',NULL),
 ('BSP040306','移动','移动组织个性化菜单','strumenudefine.cmd=getMenuStruRootHelp;strumenudefine.cmd?method=moveTo',0,'BSP0403','0','1','00',NULL),
 ('BSP040307','删除','删除组织个性化菜单','strumenudefine.cmd?method=delete',0,'BSP0403','0','1','00',NULL),
 ('BSP040308','保存','保存组织个性化菜单','newmenusave.cmd',0,'BSP0403','0','1','00',NULL),
 ('BSP040309','克隆','克隆组织个性化菜单','newMenu.cmd=forCloneMenu;newMenu.cmd?method=cloneMenu',0,'BSP0403','0','1','00',NULL),
 ('BSP040310','生效菜单','生效组织个性化菜单','refresh.cmd',0,'BSP0403','0','1','00',NULL),
 ('BSP040311','删除个性化菜单','删除个性化菜单','strumenudefine.cmd?method=delMenuStru',0,'BSP0403','0','1','00',NULL),
 ('BSP040312','导入组织个性化菜单','导入组织个性化菜单','strumenudefine.cmd?method=forImportMenu;strumenudefine.cmd?method=importMenu',0,'BSP0403','0','1','00',1),
 ('BSP040313','导出组织个性化菜单','导出组织个性化菜单','strumenudefine.cmd?method=forExportMenu',0,'BSP0403','0','1','00',1),
 ('BSP040401','修改用户当前菜单','修改用户当前菜单','strumenudefine.cmd?method=getStruUserRoot;strumenudefine.cmd?method=getStruUserNode;newMenu.cmd?method=forChangeStruMenu;newMenu.cmd?method=changStruMenu',0,'BSP0404','1','0','00',NULL),
 ('BSPDEST0101','首页复制','首页复制','commondesktopcopy.cmd',0,'BSPDEST01','0','0','00',0),
 ('BUOBJECT02','组织架构设置','组织架构设置','jsp/businessunit/bu-list.jsp;jsp/businessunit/inner-bu-list.jsp;jsp/businessunit/bu-tree.jsp;jsp/businessunit/welcome-bui-list.jsp;bu/treeviewmaker.do;bu/list.do;bu/input.do;bu/save.do;bu/delete.do;bu/ishas.do;bu/sync.do;bu/syncBU.do',0,'BUOJBECT01','0','0','00',0),
 ('BUTRANSFER01','自动合并功能设置','自动合并功能设置','bu/assign/list.do;bu/assign/save.do;sc/assignmerge/save.do;',0,'prcbr03','0','0','00',0),
 ('BUTRANSFER02','自动流转设置','自动流转设置','bu/transfer/list.do;bu/transfer/save.do;mh/list.do;currency/history/list.do;',0,'prcbr02','0','0','00',0),
 ('buyPeriodSetting','物料类别采购周期配置','物料类别采购周期配置','plan/materiel/addMateriel.do;plan/materiel/delete.do;history/common/list.do?targetClazz=PurchaseMaterielCode;plan/materiel/findMateriels.do;plan/materiel/save.do;plan/materiel/delete.do;plan/materiel/update.do;',0,'planMaintainFunction','0','0','00',0),
 ('catalog001','一级集中采购目录维护','一级集中采购目录维护','br/catalog-list.do;',0,'prcCatalog','0','0','00',0),
 ('catalogCommon','集采目录公共操作','集采目录公共操作','br/catalog-add.do;br/Index.do;br/history/list.do;br/muLu.do;br/catalog-delete.do;br/info.do;br/toadd.do;',0,'prcCatalog','0','0','00',0),
 ('catalogNo02','二级集中采购目录维护','二级集中采购目录维护','br/listleveltwo.do',0,'prcCatalog','0','0','00',0),
 ('CentralCatalog0008','查询SAP物料和物料组编码','查询SAP物料和物料组编码','pr/group/init.do;pr/product/init.do',0,'prcCatalog','0','0','00',0),
 ('CentralCatalog0010','主要技术指标维护','主要技术指标维护','br/indicatorList.do;br/indicatorUpdate.do;br/indicatorAdd.do;br/updateKeyMeasure.do;br/export.do;br/indicatorDelete.do;',0,'prcCatalog','0','0','00',0),
 ('centralCheck1','审核一级集中采购','审核一级集中采购','pr/central/check/list.do',0,'prccp02','0','0','00',0),
 ('centralCheck2','审核二级集中采购','审核二级集中采购','pr/central/check/listleveltwo.do',0,'prc256889','0','0','00',0),
 ('centralManage2','管理二级集中采购','管理二级集中采购','pr/central/manage/listleveltwo.do',0,'prc2545662','0','0','00',0),
 ('centralMange1','管理一级集中采购','管理一级集中采购','pr/central/manage/list.do',0,'prccp03','0','0','00',0),
 ('centralMerge1','一级集中采购分派','一级集中采购分派','pr/central/merge/list.do',0,'prccp04','0','0','00',0),
 ('centralMerge2','二级集中采购分派','二级集中采购分派','pr/central/merge/listleveltwo.do',0,'prc02510','0','0','00',0),
 ('centralNo1','提报一级集中采购','提报一级集中采购','pr/central/list.do',0,'prccp01','0','0','00',0),
 ('centralNo2','提报二级集中采购','提报二级集中采购','pr/central/listleveltwo.do',0,'prccp07','0','0','00',0),
 ('CentralPurchaseDetails01','CentralPurchaseDetails01','集中采购明细项','pr/central/itemlist.do;pr/attachment/list4central.do;pr/central/show.do;pr/central/listhistory.do;pr/central/itemupdate.do;pr/attachment/form4central.do;pr/attachment/delete4central.do;pr/attachment/save4central.do;pr/central/toitemupdate.do',0,'prccp03','0','0','00',0),
 ('centrialPurchaseDivision','集中采购合并分派公共','集中采购合并分派公共','pr/central/merge/merge.do;pr/central/merge/split.do;pr/central/divide/todivide.do;pr/central/manage/list.do;pr/central/toapply.do;pr/central/divide/confirm.do;user/search/toSearchUser.do;pr/central/divide/redivide.do;pr/central/divide/submit.do;pr/central/merge/reject.do',0,'prccp04','0','0','00',0),
 ('changeRfx01','变更寻源单据','变更寻源单据','rfx/changed_list.do',0,'changeRfx','0','0','00',0),
 ('chooseHeadStatic01','选择总部策略','选择总部策略','chooseHeadStatic.cmd',0,'PR000305','0','0','00',0),
 ('DEMO020101','未读邮件','未读邮件','inboxmailquery.cmd;mailfolder.cmd;mailblacklist.cmd;doccontent.cmd',0,'DEMO0201','1','0','00',NULL),
 ('DEMO020201','我的邮箱','我的邮箱','mailstatusquery.cmd;sendmailquery.cmd;alreadysendmailquery.cmd;draftmailquery.cmd;garbagemailquery.cmd',0,'DEMO0202','1','0','00',NULL),
 ('DEMO020301','新建邮件','新建邮件','mailresource.cmd;mailaddress.cmd',0,'DEMO0203','1','0','00',NULL),
 ('DEMO020401','文件夹','文件夹','mailfoldertree.cmd;custommailquery.cmd',0,'DEMO0204','1','0','00',NULL),
 ('DEMO020501','查询邮件','查询邮件','mailresourcegeneryquery.cmd',0,'DEMO0205','1','0','00',NULL),
 ('DEMO020601','查询联系人','查询联系人','mailaccountgeneryquery.cmd',0,'DEMO0206','1','0','00',NULL),
 ('DEMO020701','邮箱设置','邮箱设置','mailaccount.cmd',0,'DEMO0207','1','0','00',NULL),
 ('DEMO020801','个人地址本','个人地址本','mailaddresscategory.cmd',0,'DEMO0208','1','0','00',NULL),
 ('DEMO020901','黑名单维护','黑名单维护','mailblacklistquery.cmd',0,'DEMO0209','1','0','00',NULL),
 ('DEMO021001','默认邮箱信息','默认邮箱信息','defmailconfig.cmd',0,'DEMO0210','1','0','00',NULL),
 ('EXCEL03','批量导入采办需求','批量导入采办需求','excel/initPr.do;excel/importExcel.do',0,'EXCEL02','0','0','00',0),
 ('EXCELIMPORT003','批量导入审批路径','批量导入审批路径','excel/initPath.do;excel/importExcel.do',0,'EXCELIMPORT002','0','0','00',0),
 ('FEETYPE002','费用类型设置','费用类型设置','jsp/feetype/bu-list.jsp;jsp/feetype/bu-tree.jsp;jsp/feetype/inner-bu-list.jsp;jsp/feetype/welcome-bui-list.jsp;feetype/butreeview.do;feetype/list.do;feetype/input.do;feetype/save.do;feetype/checkValidName.do;feetype/delete.do;feetype/findByOrganId.do;feetype/saveFeeTypeOrgan.do;feetype/copyToSub.do;feetype/getFeeTypeByUser.do',0,'FEETYPE001','0','0','00',0),
 ('FEETYPE003','查询费用类型','查询费用类型','feetype/getFeeTypeByUser.do',0,'FEETYPE001','0','0','00',0),
 ('HandledPlan0101','已处理的采办计划','已处理的采办计划','plan/process/findHandledList.do;plan/process/handledProcessList.do;plan/process/handledProcessDetail.do;plan/process/handledPlanDetail.do;',0,'HandledPlan01','0','0','00',0),
 ('IMPORTPLAN03','批量导入采办计划','批量导入采办计划','excel/initPlan.do;excel/importExcel.do',0,'IMPORTPLAN02','0','0','00',0),
 ('measure001','计量单位维护','计量单位维护','sc/measure/list.do;sc/measure/create.do;sc/measure/ishas.do;sc/measure/save.do;sc/measure/saveselected.do;sc/measure/listuse.do;sc/measure/listdeleted.do;sc/measure/historylist.do;sc/measure/history/export.do;sc/measure/topage.do;',0,'prcmeasure','0','0','00',0),
 ('MH002','修改历史列表','修改历史列表','mh/list.do;mh/export.do;history/common/list.do;history/common/export.do;history/bu/list.do;history/bu/export.do',0,'MH001','0','0','00',0),
 ('MP_CMP_MESSAG01','维护','维护','mpcmpmessag.cmd',0,'MP_CMP_MESSAG','0','0','00',0),
 ('MP_CMP_MESSAG02','查询','查询','mpcmpmessagquery_page_init.cmd',0,'MP_CMP_MESSAG','0','0','00',1),
 ('MP_MESSAG01','维护','维护','mpmessag.cmd',0,'MP_MESSAG','0','0','00',0),
 ('MP_MESSAG02','查询','查询','mpmessagquery_page_init.cmd',0,'MP_MESSAG','0','0','00',1),
 ('MP_MESSAG_LOG01','维护','维护','mpmessaglog.cmd',0,'MP_MESSAG_LOG','0','0','00',0),
 ('MP_MESSAG_LOG02','查询','查询','mpmessaglogquery_page_init.cmd',0,'MP_MESSAG_LOG','0','0','00',1),
 ('MyPlan0101','我的采办计划','我的采办计划','plan/self/list.do;plan/self/toPlanDetail.do;plan/self/toPlanDetail.do;plan/self/toProjectDetail.do;plan/self/toTacticDetail.do;plan/self/toAttachDetail.do;plan/process/batchSubmitApply.do;plan/self/saveStrategy.do;plan/self/update.do;plan/self/saveorupdate.do;plan/self/form.do;plan/self/deleteProject.do;plan/self/submitApply.do;plan/self/toHistory.do;plan/materiel/addMateriel.do;plan/materiel/save.do;plan/self/displayBatchTactic.do;plan/self/batchSubmitApply.do;plan/self/batchSetTactic.do;plan/self/addPlanProject.do;plan/manage/toSelfHistory.do;plan/self/newSubmitApply.do;plan/self/isPositionTransition.do;plan/tactic/findPlanTactic.do;plan/tactic/findTactic.do;plan/self/delete.do;',0,'MyPlan01','0','0','00',0),
 ('PlanManage0101','管理采办计划','管理采办计划','plan/manage/list.do;plan/manage/search.do;plan/manage/searchList.do;plan/manage/toDetail.do;plan/manage/tacticDetail.do;plan/tactic/findTactic.do;plan/tactic/findActionUser.do;plan/manage/searchPlan.do;plan/tactic/findPlanTactic.do;plan/list1.do;plan/manage/delete.do;plan/tactic/findTacticDetail.do;plan/manage/exportExcel.do;plan/tactic/findTacticGroup.do;',0,'PlanManage01','0','0','00',0),
 ('PlanManage0102','管理采办计划详细','管理采办计划详细','plan/manage/toPlanDetail.do;plan/manage/toProjectDetail.do;plan/manage/toTacticDetail.do;plan/manage/toAttachDetail.do;plan/process/batchSubmitApply.do;plan/manage/saveStrategy.do;plan/manage/update.do;plan/manage/saveorupdate.do;plan/manage/form.do;plan/manage/deleteProject.do;plan/manage/submitApply.do;plan/manage/toHistory.do;plan/materiel/addMateriel.do;plan/materiel/save.do;plan/manage/displayBatchTactic.do;plan/manage/batchSubmitApply.do;plan/manage/batchSetTactic.do;plan/manage/addPlanProject.do;',0,'PlanManage01','0','0','00',0),
 ('PlanProcess0101','审批采办计划','审批采办计划','plan/process/handleList.do;plan/process/start.do;plan/process/approve.do;plan/process/reject.do;plan/process/submitApply.do;plan/process/findProcessTactic.do;plan/process/handleProcesses.do;plan/process/approvePlanApply.do;plan/process/processDetail.do;plan/process/submitCenterApply.do;plan/process/approveBatchApply.do;plan/process/batchHandle.do;plan/process/findHandlingList.do;plan/process/displayOpinion.do;plan/attachment/batchAttachSave.do;plan/attachment/batchAttachAdd.do;plan/attachment/batchAttachList.do;plan/attachment/delete.do;plan/attachment/processAttachList.do;',0,'PlanProcess01','0','0','00',0),
 ('PR00030101','已导入采办申请','已导入采办申请','prwprapplyquery_page_init.cmd?applystate=7;',0,'PR000301','0','0','00',0),
 ('PR00030201','提报采办申请新增修改','根据采办需求创建采办申请- 新增、修改','prwprapply.cmd;prwprapplyappropinion.cmd;prwtacticinstance.cmd;taskinfoquery.cmd;prwmaintainprojnamequery_page_init.cmd;selUserHelp.cmd;taskinfo.cmd;prwapplypathutil.cmd;actforprocess.cmd;prwapprovetacticquery_page_init.cmd?ishelp=ok;prcreqitemlist.cmd;prcreqitemlist.cmd?method=forupdate;sc/projname/search.do;pr/attachment/list4apply.do;pr/attachment/list4apply.do;pr/attachment/form4apply.do;pr/attachment/save4apply.do;pr/attachment/delete4apply.do;feetype/getFeeTypeByUser.do;prwpurchasesubmit.cmd;prwpurchasesubmitquery_page_init.cmd;prorderreq.cmd;prorderreqquery_page_init.cmd;prwprapply.cmd?method=todetail;prcreqitemlistquery_page_init.cmd;prwapplyattachments.cmd;prwapplyattachmentsquery_page_init.cmd;prwprapplyappropinion.cmd?method=PrwApplyOpinion;prwprapply.cmd?method=goBack;',0,'PR000302','0','0','00',0),
 ('PR00030202','提报采办申请查看','根据采办需求创建采办申请- 查看','pr/central/requisition/list.do;pr/central/requisition/showitems.do',0,'PR000302','0','0','00',0),
 ('PR00030301','批量导入','批量导入采办申请','excel/initApply.do;excel/importExcel.do',0,'PR000303','0','0','00',0),
 ('PR00030401','管理采办申请-查看','管理采办申请 - 查看','prwpurchaseapplicationquery_page_init.cmd;prwprapplyquery_page_init.cmd?applystate=2;applystate=2;prwprapply.cmd;taskinfo.cmd;',0,'PR000304','0','0','00',0),
 ('PR00030402','变更采办申请','变更采办申请','prwpurchaseapplication.cmd;prwapplypathutil.cmd;prwprapply.cmd;',0,'changeapplypr','0','0','00',0),
 ('PR00030501','审批采办申请','审批采办申请','prwprapplyappropinion.cmd;prwprapply.cmd;actforprocess.cmd;',0,'PR000305','0','0','00',0),
 ('PR00030601','已退回-修改','已退回的采办申请 - 修改','prwprapply.cmd',0,'PR000306','0','0','00',0),
 ('PR00030602','已退回查看','已退回的采办申请 - 查看','prwprapplyquery_page_init.cmd?applystate=3;prwprapply.cmd;taskinfo.cmd',0,'PR000306','0','0','00',0),
 ('PR00030701','已处理采办申请清单','我的已处理采办申请清单（本地）','localTaskInfo.cmd?method=queryZaiBan;localTaskInfo.cmd?method=queryYiBan;',0,'PR000307','0','0','00',0),
 ('PR00030711','已处理采办申请清单','我的已处理采办申请清单（总部)','headTaskInfo.cmd?method=queryZaiBan;headTaskInfo.cmd?method=queryYiBan;',0,'PR000311','0','0','00',0),
 ('PR00030801','授权采办申请审批','授权采办申请审批','wftaskaccreditquery.cmd;wftaskaccredit.cmd;struhelp.cmd;helpgridquery.cmd;stru.cmd;user.cmd?method=getchoiceroot;user.cmd?method=getchoicenode;',0,'PR000308','0','0','00',0),
 ('PR00030802','代理授权','代理授权','wftaskaccreditqueryProxy.cmd;wftaskaccreditProxy.cmd;',0,'PR00089','0','0','00',0),
 ('PR098977','授权采办申请（总部）','授权采办申请（总部）','headTaskInfo.cmd?method=queryProxy;',0,'PR000390','0','0','00',0),
 ('PRC0003','货币单位维护','货币单位维护','sc/currency/list.do;sc/currency/input.do;sc/currency/save.do;sc/currency/delete.do;sc/currency/history/list.do;sc/currency/ishas.do;sc/currency/history/topage.do;sc/currency/history/export.do;',0,'PRC0002','0','0','00',0),
 ('prc022165486','审核集中采购公共','审核集中采购公共','pr/central/check/toreject.do;pr/central/check/reject.do;pr/central/check/toapprove.do;pr/central/check/approve.do;',0,'prc256889','0','0','00',0),
 ('prc256879','集中采购明细项','集中采购明细项','pr/central/itemlist.do;pr/attachment/list4central.do;pr/central/show.do;pr/central/listhistory.do;pr/central/itemupdate.do;pr/attachment/form4central.do;pr/attachment/delete4central.do;pr/attachment/save4central.do;pr/central/toitemupdate.do',0,'prc2545662','0','0','00',0),
 ('prc2884569','集中采购列表公共','集中采购列表公共','pr/central/manage/toPage.do;pr/central/manage/export.do;pr/central/manage/delete.do;pr/central/manage/todetail.do;pr/central/manage/list4detail.do;',0,'prc2545662','0','0','00',0),
 ('prc3258646','集中采购分派合并公共','集中采购分派合并公共','pr/central/alter_cp_flag.do;pr/central/changeCentral.do;pr/central/toapply.do;pr/central/update.do;pr/central/showuser.do;pr/central/submit.do;pr/central/save.do;pr/central/reject.do;pr/central/toreject.do;pr/central/list.do;',0,'prc02510','0','0','00',0),
 ('prcbr010001','分派规则列表','分派规则列表','br/divisionrule/list.do',0,'prcbr01','0','0','00',0),
 ('prcbr010004','增删改分派规则','增删改分派规则','br/divisionrule/toadd.do;br/divisionrule/save.do;br/divisionrule/delete.do',0,'prcbr01','0','0','00',0),
 ('prcbr030001','合并分派列表','合并分派列表','sc/assignmerge/list.do',0,'prcbr03','0','0','00',0),
 ('prccp010002','提交集中采购申请公共','提交集中采购申请公共','pr/central/alter_cp_flag.do;pr/central/changeCentral.do;pr/central/toapply.do;pr/central/update.do;pr/central/showuser.do;pr/central/submit.do;pr/central/save.do;pr/central/reject.do;pr/central/toreject.do;pr/central/list.do;',0,'prccp01','0','0','00',0),
 ('prccp01000205','提交集中采购公共','提交集中采购公共','pr/central/alter_cp_flag.do;pr/central/changeCentral.do;pr/central/toapply.do;pr/central/update.do;pr/central/showuser.do;pr/central/submit.do;pr/central/save.do;pr/central/reject.do;pr/central/toreject.do;',0,'prccp07','0','0','00',0),
 ('prccp020001','审核集中采购公共','审核集中采购公共','pr/central/check/toreject.do;pr/central/check/reject.do;pr/central/check/toapprove.do;pr/central/check/approve.do;',0,'prccp02','0','0','00',0),
 ('prccp030001','集中采购列表公共','集中采购列表公共','pr/central/manage/toPage.do;pr/central/manage/export.do;pr/central/manage/delete.do;pr/central/manage/todetail.do;pr/central/manage/list4detail.do;',0,'prccp03','0','0','00',0),
 ('PRHEAD0101','审批、查看总部申请','审批、查看总部申请（代办，在办，已办）','headTaskInfo.cmd',0,'PRHEAD01','0','0','00',0),
 ('PRLOC0101','审批、查看本地申请','审批、查看本地申请（代办，在办，已办）','localTaskInfo.cmd',0,'PRLOC01','0','0','00',0),
 ('PROCUREMENTWAYS002','全部','全部','procurementways/list.do;procurementways/save.do;procurementways/input.do;procurementways/ishas.do;procurementways/delete.do;procurementways/inputDetail.do;procurementways/saveDetail.do;procurementways/deleteDetail.do;procurementways/isValidDetail.do;',0,'PROCUREMENTWAYS001','0','0','00',0),
 ('PRW_APPROVETACTIC01','维护','维护','prwapprovetactic.cmd;actforprocess.cmd?method=getActListForStactic;prwapprovetacticactquery_page_init.cmd;actlisthelp.cmd;stru.cmd;',0,'PRW_APPROVETACTIC','0','0','00',0),
 ('PRW_APPROVETACTIC02','查询','查询','prwapprovetacticquery_page_init.cmd?processtype=2;',0,'PRW_APPROVETACTIC','0','0','00',0),
 ('PRW_APPROVETACTIC_ACT01','维护','维护','prwapprovetacticact.cmd',0,'PRW_APPROVETACTIC_ACT','0','0','00',0),
 ('PRW_APPROVETACTIC_ACT02','查询','查询','prwapprovetacticactquery_page_init.cmd',0,'PRW_APPROVETACTIC_ACT','0','0','00',1),
 ('PRW_HEADPRAPPLY01','维护','维护','prwheadprapply.cmd;prwapprovetactic.cmd;actlisthelp.cmd;stru.cmd;',0,'PRW_HEADPRAPPLY','0','0','00',0),
 ('PRW_HEADPRAPPLY02','查询','查询','prwapprovetacticquery_page_init.cmd?processtype=1;',0,'PRW_HEADPRAPPLY','0','0','00',0),
 ('PRW_MAINTAINPROJNAME01','维护','维护','sc/projname/list.do;sc/projname/input.do;sc/projname/save.do;sc/projname/delete.do;sc/projname/checkValidName.do;sc/projname/search.do',0,'PRW_MAINTAINPROJNAME','0','0','00',0),
 ('PRW_PRPOSITION_MANAGE01','维护','维护','prwprpositionmanage.cmd;role.cmd;userext.cmd;',0,'PRW_PRPOSITION_MANAGE','0','0','00',0),
 ('PRW_PRPOSITION_MANAGE02','查询','查询','prwprpositionmanagequery_page_init.cmd',0,'PRW_PRPOSITION_MANAGE','0','0','00',1),
 ('PRW_SCREENFIELD01','维护','维护','prwscreenfield.cmd',0,'PRW_SCREENFIELD','0','0','00',0),
 ('PRW_SCREENFIELD02','查询','查询','prwscreenfieldquery_page_init.cmd',0,'PRW_SCREENFIELD','0','0','00',1),
 ('PRW_TACTIC_INSTANCE01','维护','维护','prwtacticinstance.cmd',0,'PRW_TACTIC_INSTANCE','0','0','00',0),
 ('PRW_TACTIC_INSTANCE02','查询','查询','prwtacticinstancequery_page_init.cmd',0,'PRW_TACTIC_INSTANCE','0','0','00',1),
 ('PUBTOOL010101','通用选择组件查询','通用选择组件查询','pubcomhelpquery_page_init.cmd',0,'PUBTOOL0101','0','0','00',0),
 ('PUBTOOL010102','通用选择组件维护','通用选择组件维护','pubcomhelp.cmd',0,'PUBTOOL0101','0','1','00',0),
 ('PUBTOOL010103','通用选择组件调用','通用选择组件调用','helpgridquery.cmd',0,'PUBTOOL0101','1','0','00',0),
 ('PUB_COMHELP01','维护','维护','pubcomhelp.cmd',0,'PUB_COMHELP','0','0','00',0),
 ('PUB_COMHELP02','查询','查询','pubcomhelpquery_page_init.cmd',0,'PUB_COMHELP','0','0','00',0),
 ('PurchaseRequisition004','管理采办需求','管理采办需求','pr/manage/export.do;pr/manage/toDetail.do;pr/manage/list4Details.do;pr/manage/delete.do;pr/manage/list.do;pr/form.do;pr/item/list.do;pr/attachment/list.do;pr/summary/show.do;pr/history/list.do;history/list.do;pr/summary/preview.do;pr/manage/toPage.do;',0,'PurchaseRequisition003','0','0','00',0),
 ('PurchaseRequisition013','需求合并/分派','需求合并/分派','pr/merge/merge.do;pr/merge/sort.do;pr/merge/list.do;pr/merge/split.do;pr/merge/topage.do;pr/merge/tosearch.do;pr/form.do;pr/item/list.do;pr/item/form.do;pr/history/list.do;history/list.do;pr/attachment/list.do;pr/attachment/form.do;pr/summary/show.do;pr/summary/preview.do;pr/merge/showuser.do;pr/merge/todivide.do;pr/division/confirm.do;pr/division/redivide.do;pr/division/submit.do;pr/merge/showitems.do;',0,'PurchaseRequisition010','0','0','00',0),
 ('PurchaseRequisitionSaveAction1','创建采办需求','创建采办需求','pr/form.do;pr/update.do;pr/save.do;pr/item/list.do;pr/manage/toPage.do;pr/item/form.do;pr/item/save.do;pr/summary/show.do;pr/submit.do;pr/history/list.do;history/list.do;pr/summary/preview.do;pr/copy.do;pr/item/delete.do;pr/attachment/list.do;pr/attachment/form.do;pr/attachment/save.do;pr/attachment/delete.do;pr/attachment/download.do;',0,'PurchaseRequisition002','0','0','00',0),
 ('RevokeApply01','撤销审批','撤销审批','prwprapplyappropinion.cmd?method=PrwApplyOpinion;prwprapply.cmd?method=Revoke;pr/attachment/list4apply.do;',0,'RevokeApply','0','0','00',0),
 ('rfxform02url','已处理寻源单据','已处理寻源单据','rfx/cancelRFx.do;rfx/handled_list.do;rfx/prstatus.do;rfx/handled_restore.do;rfx/uid_confirm.do;rfx/handled_search.do;',0,'rfxform03','0','0','00',0),
 ('rfxform03','未处理寻源单据','未处理寻源单据','rfx/unhandled_list.do;rfx/check_catalog.do;rfx/rfx_basic_create.do;rfx/rfx_basic_save.do;rfx/unhandled_delete.do;wslog/list.do;wslog/todetail.do;rfx/unhandled_search.do;user/search/toSearchUser.do;rfxtemp/search.do;user/search/searchRadioInit.do;user/search/searchRadioList.do;rfx/pickup_org.do',0,'rfxform02','0','0','00',0),
 ('RFXTEMP002','维护RFX模板信息','维护RFX模板信息','rfxtemp/list.do;rfxtemp/input.do;rfxtemp/save.do;rfxtemp/delete.do;rfxtemp/checkValidId.do;rfxtemp/checkValidName.do',0,'RFXTEMP001','0','0','00',0),
 ('RFXTEMP003','查询Rfx模板','查询Rfx模板','rfxtemp/search.do',0,'RFXTEMP001','0','0','00',0),
 ('sccheckroleparams00101','sccheckroleparams00101','关键指标设置','sc/checkrule/show.do;sc/checkrule/save.do',0,'sccheckroleparams001','0','0','00',0),
 ('scmCategorySelector01','scmCategorySelector01','类别选择器','pr/group/init.do;pr/group/search.do',0,'scmCategorySelector','0','0','00',0),
 ('scmProductSelector01','scmProductSelector01','物料选择器','pr/product/init.do;pr/product/search.do;',0,'scmProductSelector','0','0','00',0),
 ('scmUserSelector01','scmUserSelector01','用户选择器','user/search/toSearchUser.do;user/search/searchCheckboxInit.do;user/search/searchCheckboxList.do;user/search/searchRadioInit.do;user/search/searchRadioList.do',0,'scmUserSelector','0','0','00',0),
 ('seluserhelp0001','审批路径选择人','审批路径选择人','selUserHelp.cmd?method=selUserHelp',0,'PUB_COMHELP','0','0','00',0),
 ('sysindex013221r1','sysindex013221r1','首页','index/unhandled_rfx.do;index/pri_merge.do;index/cp_auditing.do;index/cp_merge.do;index/prapply_submit.do;index/cp1_submit.do;jsp/content.jsp;commonsingleparms.cmd;',0,'sysindex013221f1','0','0','00',0),
 ('sysrepfunres01','采办状态跟踪报表','采办状态跟踪报表','rpt/status_trace_search.do;rpt/status_trace_list.do',0,'sysrptfun001','0','0','00',0),
 ('SYS_MESSAG01','维护','维护','sysmessag.cmd',0,'SYS_MESSAG','1','0','00',0),
 ('SYS_MESSAG02','查询','我的短消息','mysysmessagquery.cmd',0,'SYS_MESSAG','0','0','00',0),
 ('taskinfoquerynew0001','新工作任务查询','新工作任务查询','taskinfoquerynew.cmd',0,'workflowext01','0','0','00',0),
 ('webeditgrid01','查询','查询','goodsquery_page_init.cmd;foodquery_page_init.cmd;goods.cmd?method=querySearch&forward=forupdate;food.cmd?method=querySearch;goods.cmd?method=querySearch&forward=detail',0,'webeditgrid','0','0','00',0),
 ('webeditgrid02','增加','增加','goods.cmd?method=forinsert;goods.cmd?method=saveandinsert;goods.cmd?method=insert;goods.cmd?method=insertContinue;goods.cmd?method=saveandquery;food.cmd?method=forinsert;food.cmd?method=insert;food.cmd?method=insertContinue;food.cmd?method=saveandquery',0,'webeditgrid','0','0','00',0),
 ('webeditgrid03','修改','修改','goods.cmd?method=forupdate;goods.cmd?method=update;goods.cmd?method=saveandupdate;food.cmd?method=forupdate;food.cmd?method=update;food.cmd?method=querySearch&forward=forupdate;food.cmd?method=saveandupdate',0,'webeditgrid','0','0','00',0),
 ('webeditgrid04','删除','删除','goods.cmd?method=delete;food.cmd?method=delete',0,'webeditgrid','0','0','00',0),
 ('webeditgrid05','明细','明细','goods.cmd?method=detail;food.cmd?method=detail',0,'webeditgrid','0','0','00',0),
 ('webflexgrid01','查询','查询','flexgridquery_page_init.cmd',0,'webflexgrid','0','0','00',0),
 ('webflexgrid02','增加','增加','flexgrid.cmd?method=forinsert;flexgrid.cmd?method=insert;flexgrid.cmd?method=insertContinue',0,'webflexgrid','0','0','00',0),
 ('webflexgrid03','修改','修改','flexgrid.cmd?method=forupdate;flexgrid.cmd?method=update',0,'webflexgrid','0','0','00',0),
 ('webflexgrid04','删除','删除','flexgrid.cmd?method=delete',0,'webflexgrid','0','0','00',0),
 ('webflexgrid05','明细','明细','flexgrid.cmd?method=detail',0,'webflexgrid','0','0','00',0),
 ('webflexgrid06','辅助','辅助','flexgrid.cmd?method=getProvinces;flexgrid.cmd?method=getCitys',0,'webflexgrid','0','0','00',0),
 ('webgrid01','查询','查询','maingridquery_page_init.cmd;product.cmd;maingrid.cmd;productquery_page_init.cmd',0,'webgrid','0','0','00',0),
 ('webgrid02','增加','增加','maingrid.cmd?method=forinsert;maingrid.cmd?method=insert;maingrid.cmd?method=insertContinue;product.cmd?method=forinsert;product.cmd?method=insert;product.cmd?method=insertContinue',0,'webgrid','0','0','00',0),
 ('webgrid03','修改','修改','maingrid.cmd?method=forupdate;maingrid.cmd?method=update;product.cmd?method=forupdate;product.cmd?method=update',0,'webgrid','0','0','00',0),
 ('webgrid04','删除','删除','maingrid.cmd?method=delete;product.cmd?method=delete',0,'webgrid','0','0','00',0),
 ('webgrid05','明细','明细','maingrid.cmd?method=detail;product.cmd?method=detail',0,'webgrid','0','0','00',0),
 ('webhtml01','查询','查询','lsemployeequery_page_init.cmd',0,'webhtml','0','0','00',0),
 ('webhtml02','增加','增加','lsemployee.cmd?method=forinsert;lsemployee.cmd?method=insert;lsemployee.cmd?method=insertContinue',0,'webhtml','0','0','00',0),
 ('webhtml03','修改','修改','lsemployee.cmd?method=forupdate;lsemployee.cmd?method=update',0,'webhtml','0','0','00',0),
 ('webhtml04','删除','删除','lsemployee.cmd?method=delete',0,'webhtml','0','0','00',0),
 ('webhtml05','明细','明细','lsemployee.cmd?method=detail',0,'webhtml','0','0','00',0),
 ('webhtml06','辅助','辅助','lsemployee.cmd?method=getProvinces;lsemployee.cmd?method=getCitys;lsemployee.cmd?method=getImgUrl',0,'webhtml','0','0','00',0),
 ('webhtml07','异步删除','异步删除','lsemployee.cmd?method=asynDelete',0,'webhtml','0','0','00',0),
 ('webtree01','查询','查询','organstruquery_page_init.cmd',0,'webtree','0','0','00',0),
 ('webtree02','增加','增加','organstru.cmd?method=forinsert;organstru.cmd?method=insert;organstru.cmd?method=insertContinue',0,'webtree','0','0','00',0),
 ('webtree03','修改','修改','organstru.cmd?method=forupdate;organstru.cmd?method=update',0,'webtree','0','0','00',0),
 ('webtree04','删除','删除','organstru.cmd?method=delete',0,'webtree','0','0','00',0),
 ('webtree05','明细','明细','organstru.cmd?method=detail',0,'webtree','0','0','00',0),
 ('webtree06','定位','定位','organstru.cmd?method=query',0,'webtree','0','0','00',0),
 ('webtree07','节点','节点','organstru.cmd?method=getRoot;organstru.cmd?method=getChildren',0,'webtree','0','0','00',0),
 ('webtree08','帮助','帮助','organstru.cmd?method=getHelp;organstru.cmd?method=getHelpCh',0,'webtree','0','0','00',0),
 ('webtree09','排序','排序','organstru.cmd?method=changeStruOrder;organstru.cmd?method=getChangeOrderRoot;organstru.cmd?method=getCheckChild',0,'webtree','0','0','00',0),
 ('webupload01','查询','查询','mainblobquery_page_init.cmd',0,'webupload','0','0','00',0),
 ('webupload02','增加','增加','mainblob.cmd?method=forinsert;mainblob.cmd?method=insert;mainblob.cmd?method=insertContinue',0,'webupload','0','0','00',0),
 ('webupload03','修改','修改','mainblob.cmd?method=forupdate;mainblob.cmd?method=update',0,'webupload','0','0','00',0),
 ('webupload04','删除','删除','mainblob.cmd?method=delete',0,'webupload','0','0','00',0),
 ('webupload05','明细','明细','mainblob.cmd?method=detail',0,'webupload','0','0','00',0),
 ('webzuhe01','查询','查询','comboboxtestquery_page_init.cmd;combocollectionquery_page_init.cmd',0,'webzuhe','0','0','00',0),
 ('webzuhe02','增加','增加','comboboxtest.cmd?method=forinsert;comboboxtest.cmd?method=insert;comboboxtest.cmd?method=insertContinue;combocollection.cmd?method=forinsert;combocollection.cmd?method=insert;comboboxtest.cmd?method=test;combocollection.cmd?method=insertContinue',0,'webzuhe','0','0','00',0),
 ('webzuhe03','修改','修改','comboboxtest.cmd?method=forupdate;comboboxtest.cmd?method=update;combocollection.cmd?method=forupdate;combocollection.cmd?method=update',0,'webzuhe','0','0','00',0),
 ('webzuhe04','删除','删除','comboboxtest.cmd?method=delete;combocollection.cmd?method=delete',0,'webzuhe','0','0','00',0),
 ('webzuhe05','明细','明细','comboboxtest.cmd?method=detail;combocollection.cmd?method=detail',0,'webzuhe','0','0','00',0),
 ('WFREPORT1501','明细','表单树','wfreport.cmd?method=gettreeeditroot',0,'WFREPORT15','1','0','00',NULL),
 ('WFREPORT1502','明细','表单树叶子','wfreport.cmd?method=gettreeeditbranch',0,'WFREPORT15','1','0','00',NULL),
 ('WFREPORT1503','表单明细','表单明细','wfreport.cmd?method=queryForm',0,'WFREPORT15','1','0','00',NULL),
 ('WFREPORT1504','增加报表','增加报表','wfreport.cmd?method=forinsert',0,'WFREPORT15','1','0','00',NULL),
 ('WFREPORT1505','修改报表','修改报表','wfreport.cmd?method=forupdate',0,'WFREPORT15','1','0','00',NULL),
 ('WFREPORT1506','保存报表','保存报表','wfreport.cmd?method=insert',0,'WFREPORT15','1','0','00',NULL),
 ('WFREPORT1507','报表明细','报表明细','wfreport.cmd?method=query',0,'WFREPORT15','1','0','00',NULL),
 ('WFREPORT1508','报表明细','报表明细修改','wfreport.cmd?method=update',0,'WFREPORT15','1','0','00',NULL),
 ('WFREPORT1509','报表明细','保存并继续','wfreport.cmd?method=insertContinue',0,'WFREPORT15','1','0','00',NULL),
 ('WFREPORT1510','报表定义','报表定义查询','wfreportdefine.cmd?method=detail',0,'WFREPORT15','1','0','00',NULL),
 ('WFREPORT1511','删除报表','删除报表','wfreport.cmd?method=delete',0,'WFREPORT15','1','0','00',NULL),
 ('WFREPORT1512','报表定义','报表定义保存','wfreportdefine.cmd?method=insert',0,'WFREPORT15','1','0','00',NULL),
 ('WFREPORT1601','明细','查询表单树','wfrptquery.cmd?method=querygettreeeditroot',0,'WFREPORT16','1','0','00',NULL),
 ('WFREPORT1602','明细','查询表单树叶子','wfrptquery.cmd?method=querygettreeeditbranch',0,'WFREPORT16','1','0','00',NULL),
 ('WFREPORT1603','报表查询','报表查询','wfreportdefine.cmd?method=forquery',0,'WFREPORT16','1','0','00',NULL),
 ('WFREPORT1604','报表查询','报表查询','wfreportdefine.cmd?method=query',0,'WFREPORT16','1','0','00',NULL),
 ('WF_MANAGE_FILES01','维护','维护','wfmanagefiles.cmd',0,'WF_MANAGE_FILES','0','0','00',0),
 ('WF_MANAGE_FILES02','查询','查询','wfmanagefilesquery_page_init.cmd',0,'WF_MANAGE_FILES','0','0','00',1),
 ('WF_PROCESS_FILES01','维护','维护','wfprocessfiles.cmd',0,'WF_PROCESS_FILES','0','0','00',0),
 ('WF_PROCESS_FILES02','查询','查询','wfprocessfilesquery_page_init.cmd',0,'WF_PROCESS_FILES','0','0','00',1),
 ('WF_PROCESS_TYPE01','维护','维护','wfprocesstype.cmd',0,'WF_PROCESS_TYPE','0','0','00',0),
 ('WF_PROCESS_TYPE02','查询','查询','wfprocesstypequery_page_init.cmd',0,'WF_PROCESS_TYPE','0','0','00',1),
 ('WORKFLOW0101','查询','查询工作流类型','processtypequery.cmd;processtype.cmd?method=detail;processtype.cmd?method=isExist',0,'WORKFLOW01','1','0','00',NULL),
 ('WORKFLOW0102','增加','增加工作流类型','processtype.cmd?method=forinsert;processtype.cmd?method=insert',0,'WORKFLOW01','1','0','00',NULL),
 ('WORKFLOW0103','修改','修改工作流类型','processtype.cmd?method=forupdate;processtype.cmd?method=update',0,'WORKFLOW01','1','0','00',NULL),
 ('WORKFLOW0104','删除','删除工作流类型','processtype.cmd?method=delete',0,'WORKFLOW01','1','0','00',NULL),
 ('WORKFLOW0105','流程类型帮助','流程类型帮助','processtypehelpquery.cmd',0,'WORKFLOW01','1','0','00',NULL),
 ('WORKFLOW0106','历史环节类型帮助','历史环节类型帮助','historyhelpurlquery.cmd',0,'WORKFLOW01','1','0','00',NULL),
 ('WORKFLOW0201','查询','查询表单','workformmanagerquery.cmd?clear=true;formmanager.cmd?method=detail;formmanager.cmd?method=render;formdataquery.cmd?method=query;formdataquery.cmd;formmanager.cmd?method=getReserveKeysXml;formmanager.cmd?method=getEditFieldsXml;formmanager.cmd?method=getSelectFieldsXml;formmanager.cmd?method=getSpecialEditsXml;formmanager.cmd?method=getVerifysXml;formmanager.cmd?method=getDynamicDefaultsXml;formmanager.cmd?method=getFixedFieldsXml',0,'WORKFLOW02','1','0','00',NULL),
 ('WORKFLOW0202','增加','增加表单','formmanager.cmd?method=forinsert;processtypehelpquery.cmd;formmanager.cmd?method=insert;struhelp.cmd?method=getSelectRoot;struhelp.cmd?method=getHelpTreeNode;formmanager.cmd?method=getReserveKeysXml;formmanager.cmd?method=getEditFieldsXml;formmanager.cmd?method=getSelectFieldsXml;formmanager.cmd?method=getSpecialEditsXml;formmanager.cmd?method=getVerifysXml;formmanager.cmd?method=getDynamicDefaultsXml;formmanager.cmd?method=getFixedFieldsXml',0,'WORKFLOW02','1','0','00',NULL),
 ('WORKFLOW0203','修改','修改表单','formmanager.cmd?method=forupdate;formmanager.cmd?method=update;struhelp.cmd?method=getSelectRoot;struhelp.cmd?method=getHelpTreeNode',0,'WORKFLOW02','1','0','00',NULL),
 ('WORKFLOW0204','删除','删除表单','formmanager.cmd?method=delete',0,'WORKFLOW02','1','0','00',NULL),
 ('WORKFLOW0205','明细','表单明细','formmanager.cmd?method=detail;formmanager.cmd?method=render;formdataquery.cmd?method=query;formdataquery.cmd;formmanager.cmd?method=getReserveKeysXml;formmanager.cmd?method=getEditFieldsXml;formmanager.cmd?method=getSelectFieldsXml;formmanager.cmd?method=getSpecialEditsXml;formmanager.cmd?method=getVerifysXml;formmanager.cmd?method=getDynamicDefaultsXml;formmanager.cmd?method=getFixedFieldsXml',0,'WORKFLOW02','1','0','00',NULL),
 ('WORKFLOW0206','建表','新建数据库表','formmanager.cmd?method=createTables',0,'WORKFLOW02','1','0','00',NULL),
 ('WORKFLOW0207','图片','图片展现','workformgraph.cmd?method=exec; workformgraph.cmd?method= getfiles; workformgraph.cmd?method= updateFile',0,'WORKFLOW02','1','0','00',NULL),
 ('WORKFLOW0301','查询','查询流程','processquery.cmd;process.cmd?method=detail;urlconfig.cmd?method=urlGetSystemConfig;urlconfig.cmd?method=urlGetMenuConfig;urlconfig.cmd?method=getActorFields;urlconfig.cmd?method=getWorkform;urlconfig.cmd?method=urlGetProcess;urlconfig.cmd?method=urlGetSystemOrgan;struhelp.cmd?method=getSelectRoot;struhelp.cmd?method=getHelpTreeNode;roleradio.cmd?method=choiceroot;role.cmd?method=choicenode;workformmanagerhelpquery.cmd;processtemplatequery.cmd;role.cmd?method=getSysRoleRoot;role.cmd?method=getSysRoleNode',0,'WORKFLOW03','1','0','00',NULL),
 ('WORKFLOW0302','增加','增加流程','jspFormsHelpQuery.cmd;process.cmd?method=forinsertpro;processtypehelpquery.cmd;process.cmd?method=forinsert;process.cmd?method=insert;process.cmd?method=insertLoad;urlconfig.cmd?method=urlGetSystemConfig;urlconfig.cmd?method=urlGetMenuConfig;urlconfig.cmd?method=getActorFields;urlconfig.cmd?method=getWorkform;urlconfig.cmd?method=getDefinedForm;urlconfig.cmd?method=getDcworkform;urlconfig.cmd?method=getJspForm;urlconfig.cmd?method=urlGetProcess;urlconfig.cmd?method=urlGetSystemOrgan;struhelp.cmd?method=getSelectRoot;struhelp.cmd?method=getHelpTreeNode;roleradio.cmd?method=choiceroot;role.cmd?method=choicenode;workformmanagerhelpquery.cmd;processtemplatequery.cmd',0,'WORKFLOW03','1','0','00',NULL),
 ('WORKFLOW0303','修改','修改流程','process.cmd?method=forupdatepro;process.cmd?method=forupdate;process.cmd?method=update;process.cmd?method=loadProcess;process.cmd?method=load;process.cmd?method=syndata;process.cmd?method=updateNewVer;urlconfig.cmd?method=urlGetSystemConfig;urlconfig.cmd?method=urlGetMenuConfig;urlconfig.cmd?method=getActorFields;urlconfig.cmd?method=getWorkform;urlconfig.cmd?method=urlGetProcess;urlconfig.cmd?method=urlGetSystemOrgan;struhelp.cmd?method=getSelectRoot;struhelp.cmd?method=getHelpTreeNode;roleradio.cmd?method=choiceroot;role.cmd?method=choicenode;workformmanagerhelpquery.cmd;processtemplatequery.cmd',0,'WORKFLOW03','1','0','00',NULL),
 ('WORKFLOW0304','删除','删除流程','process.cmd?method=delete',0,'WORKFLOW03','1','0','00',NULL),
 ('WORKFLOW0305','明细','流程明细','process.cmd?method=detail;urlconfig.cmd?method=urlGetSystemConfig;urlconfig.cmd?method=urlGetMenuConfig;urlconfig.cmd?method=getActorFields;urlconfig.cmd?method=getWorkform;urlconfig.cmd?method=urlGetProcess;urlconfig.cmd?method=urlGetSystemOrgan',0,'WORKFLOW03','1','0','00',NULL),
 ('WORKFLOW0306','流程导入','流程导入','processExchange.cmd?method=forimport;processExchange.cmd?method=doimport;',0,'WORKFLOW03','1','0','00',NULL),
 ('WORKFLOW0307','流程导出','流程导出','processExchange.cmd?method=forexport;processExchange.cmd?method=export;',0,'WORKFLOW03','1','0','00',NULL),
 ('WORKFLOW0308','工作流升级','工作流升级','upgrade.cmd?method=upgrade;upgrade.cmd?method=upgradeTable;upgrade.cmd?method=upgradeData;',0,'WORKFLOW03','1','0','00',NULL),
 ('WORKFLOW0309','流程定义帮助','流程定义帮助','processhelpquery.cmd',0,'WORKFLOW03','1','0','00',NULL),
 ('WORKFLOW0400','签名图片','签名图片','signpic.cmd?method=query;signpic.cmd?method=delete;signpic.cmd?method=detail;signpic.cmd?method=forInsert;signpic.cmd?method=insert',0,'WORKFLOW03','1','0','00',NULL),
 ('WORKFLOW0401','查询','查询任务列表定制','tasklistquery.cmd;tasklist.cmd?method=detail;',0,'WORKFLOW04','1','0','00',NULL),
 ('WORKFLOW040101','示例：差旅报销流程','示例：差旅报销流程','clbx.cmd?method=create;clbx.cmd?method=createAndSend;clbx.cmd?method=send;clbx.cmd?method=back;clbx.cmd?method=forinsert;clbx.cmd?method=forupdate;clbx.cmd?method=detail;clbx.cmd?method=update',0,'WORKFLOW0401','1','0','00',NULL),
 ('WORKFLOW0402','增加','增加任务列表定制','tasklist.cmd?method=getReservekeys;tasklist.cmd?method=insert',0,'WORKFLOW04','1','0','00',NULL),
 ('WORKFLOW0403','修改','修改任务列表定制','tasklist.cmd?method=forupdate;tasklist.cmd?method=update',0,'WORKFLOW04','1','0','00',NULL),
 ('WORKFLOW0404','删除','删除任务列表定制','tasklist.cmd?method=delete',0,'WORKFLOW04','1','0','00',NULL),
 ('WORKFLOW0405','同步监控人','同步监控人','process.cmd?method=synReposible',0,'WORKFLOW03','1','0','00',NULL),
 ('WORKFLOW0406','增加流程类型','通用帮助的cmd','wfYwHelpInitquery.cmd',0,'WORKFLOW03','1','0','00',NULL),
 ('WORKFLOW0407','jsp表单定义请求url查询','jsp表单定义请求url查询cmd','jspFormRequestsHelpQuery.cmd',0,'WORKFLOW03','1','0','00',NULL);
INSERT INTO `pub_resources` (`RESOURCE_ID`,`RESOURCE_NAME`,`RESOURCE_ALIAS`,`URL_NAMES`,`SECURITY_LEVEL`,`FUNCTION_ID`,`IS_DEFAULT`,`IS_AUDIT`,`RES_TYPE_ID`,`SEQ`) VALUES 
 ('WORKFLOW0501','查询','查询打印模板','formprinttempletquery.cmd;formprinttemplet.cmd?method=detail',0,'WORKFLOW05','1','0','00',NULL),
 ('WORKFLOW0502','增加','增加打印模板','formprinttemplet.cmd?method=forinsert;formprinttemplet.cmd?method=insert',0,'WORKFLOW05','1','0','00',NULL),
 ('WORKFLOW0503','修改','修改打印模板','formprinttemplet.cmd?method=forupdate;formprinttemplet.cmd?method=update',0,'WORKFLOW05','1','0','00',NULL),
 ('WORKFLOW0504','删除','删除打印模板','formprinttemplet.cmd?method=delete',0,'WORKFLOW05','1','0','00',NULL),
 ('WORKFLOW0505','选择模板','选择模板','formprinttemplethelp.cmd;formprinttemplet.cmd?method=detailHidden',0,'WORKFLOW05','1','0','00',NULL),
 ('WORKFLOW0601','新建','新建任务','processlist.cmd?method=processlist;taskinfo.cmd?method=forcreate;taskinfo.cmd?method=createdocument;taskinfo.cmd?method=printForm',0,'WORKFLOW06','1','0','00',NULL),
 ('WORKFLOW0602','待办','待办任务','taskinfoquery.cmd;taskinfo.cmd?method=fordeal;taskinfo.cmd?method=mpfordeal;taskinfo.cmd?method=forwfd_selfdeal;',0,'WORKFLOW06','1','0','00',0),
 ('WORKFLOW0603','在办','在办任务','taskinfozaiban.cmd?method=getProcessTypeList;taskinfozaiban.cmd?method=getProcessList;taskinfoquery.cmd;taskinfo.cmd?method=fordeal;taskinfo.cmd?method=mpfordeal',0,'WORKFLOW06','1','0','00',NULL),
 ('WORKFLOW0604','已办','已办任务','taskinfoyiban.cmd?method=getProcessTypeList;taskinfoyiban.cmd?method=getProcessList;oldtaskinfoquery.cmd;taskinfo.cmd?method=forold;taskinfo.cmd?method=mpforold;taskinfo.cmd?method=forwfd_selfold;taskInfoFinishAndYibanQuery.cmd',0,'WORKFLOW06','1','0','00',0),
 ('WORKFLOW0605','结束','结束任务','taskinfofinish.cmd?method=getProcessTypeList;taskinfofinish.cmd?method=getProcessList;finishtaskinfoquery.cmd;taskinfo.cmd?method=forend;taskinfo.cmd?method=forwfd_selfend',0,'WORKFLOW06','1','0','00',NULL),
 ('WORKFLOW0606','角色','角色任务','taskinforole.cmd?method=getProcessTypeList;taskinforole.cmd?method=getProcessList;roletaskinfoquery.cmd;taskinfo.cmd?method=forrole;taskinfo.cmd?method=delegate',0,'WORKFLOW06','1','0','00',NULL),
 ('WORKFLOW0607','监控','监控任务','taskinfomonitor.cmd?method=getProcessTypeList;taskinfomonitor.cmd?method=getProcessList;restaskinfoquery.cmd;edocmonitorinfoquery.cmd;taskinfo.cmd?method=forres;edocmonitorinfo.cmd?method=detail',0,'WORKFLOW06','1','0','00',NULL),
 ('WORKFLOW0608','所有','所有任务','taskinfoforemp.cmd?method=getTaskInfoForEmp;taskinfoforemp.cmd?method=getProcessList_daiban;taskinfoforemp.cmd?method=getProcessList_zaiban;taskinfoforemp.cmd?method=getProcessList_yiban;taskinfoforemp.cmd?method=getProcessList_finish',0,'WORKFLOW06','1','0','00',NULL),
 ('WORKFLOW0609','出差代理','出差代理','wftaskaccreditquery.cmd;wftaskaccredit.cmd',0,'WORKFLOW06','1','0','00',0),
 ('WORKFLOW0610','通用流程','通用流程','wfuniprocessquery_page_init.cmd;wfuniprocessquery_page_init.cmd?helpQuery=true;wfuniprocess.cmd?method=forDeal;wfuniprocess.cmd?method=save;wfuniprocess.cmd?method=forward;wfuniprocess.cmd?method=delete',0,'WORKFLOW06','1','0','00',NULL),
 ('WORKFLOW0611','jsp表单操作','jsp表单操作','jspformtaskdeal.cmd?method=forcreate; jspformtaskdeal.cmd?method= fordeal; jspformtaskdeal.cmd?method= forold ; jspformtaskdeal.cmd?method= forend;jspformtaskdeal.cmd?method=forres;jspformtaskdeal.cmd?method= forrole; jspformtaskdeal.cmd?method= delegate',0,'WORKFLOW06','1','0','00',NULL),
 ('WORKFLOW0701','查询','查询附件','adjunctquery.cmd;adjunct.cmd?method=detail;pr/attachment/list4apply.do;pr/attachment/download.do;pr/attachment/form4apply.do;pr/attachment/save4apply.do;',0,'WORKFLOW07','1','0','00',0),
 ('WORKFLOW0702','增加','增加附件','adjunct.cmd?method=forinsert;adjunct.cmd?method=insert',0,'WORKFLOW07','1','0','00',NULL),
 ('WORKFLOW0703','删除','删除附件','adjunct.cmd?method=delete',0,'WORKFLOW07','1','0','00',NULL),
 ('WORKFLOW0704','附件选择','附件选择','adjuncthelpquery.cmd',0,'WORKFLOW07','1','0','00',NULL),
 ('WORKFLOW0801','保存数据','保存数据','taskinfo.cmd?method=saveformdata',0,'WORKFLOW08','1','0','00',NULL),
 ('WORKFLOW0802','创建发送','创建发送','taskinfo.cmd?method=createAndSend',0,'WORKFLOW08','1','0','00',NULL),
 ('WORKFLOW0803','发送','发送','taskinfo.cmd?method=send',0,'WORKFLOW08','1','0','00',NULL),
 ('WORKFLOW0804','选择发送','选择发送','taskinfo.cmd?method=getnextactivities;partynextactivityquery.cmd;taskinfo.cmd?method=send',0,'WORKFLOW08','1','0','00',NULL),
 ('WORKFLOW0805','退回','退回','taskinfo.cmd?method=gethistoryactivities;taskinfo.cmd?method=jump;taskinfo.cmd?method=retract;edocmonitorinfoquery.cmd=7',0,'WORKFLOW08','1','0','00',NULL),
 ('WORKFLOW0806','流程定义','流程定义单选','processhelpurlquery.cmd',0,'WORKFLOW08','1','0','00',NULL),
 ('WORKFLOW0901','跳过','跳过流程','taskinfo.cmd?method=jump;taskinfo.cmd?method=getjumpactivities;partynextactivityquery.cmd',0,'WORKFLOW09','1','0','00',NULL),
 ('WORKFLOW0902','冻结','冻结流程','taskinfo.cmd?method=forsuspenddialog;taskinfo.cmd?method=suspend;struhelp.cmd?method=getCheckEmpRoot',0,'WORKFLOW09','1','0','00',NULL),
 ('WORKFLOW0903','解冻','解冻流程','taskinfo.cmd?method=forresumedialog;taskinfo.cmd?method=resume;struhelp.cmd?method=getCheckEmpRoot',0,'WORKFLOW09','1','0','00',NULL),
 ('WORKFLOW0904','回收','回收流程','taskinfo.cmd?method=forterminatedialog;taskinfo.cmd?method=terminate;struhelp.cmd?method=getCheckEmpRoot',0,'WORKFLOW09','1','0','00',NULL),
 ('WORKFLOW0905','改发','改发流程','taskinfo.cmd?method=forassigndialog;taskinfo.cmd?method=assign;struhelp.cmd?method=getEmpRoot;struhelp.cmd?method=getCheckEmpRoot;struhelp.cmd?method=getCheckNode;struhelp.cmd?method=getChoiceNode;taskinfo.cmd?method=addAssign',0,'WORKFLOW09','1','0','00',NULL),
 ('WORKFLOW0906','删除','删除流程','taskinfo.cmd?method=deleteProcess',0,'WORKFLOW09','1','0','00',NULL),
 ('WORKFLOW0907','催办','催办流程','taskinfo.cmd?method=forhastendialog;taskinfo.cmd?method=hasten;struhelp.cmd?method=getCheckEmpRoot;edocmonitortrack.cmd?method=forinsert;edocmonitortrackquery.cmd;edocmonitortrack.cmd?method=insert;edocmonitortrack.cmd?method=delete',0,'WORKFLOW09','1','0','00',NULL),
 ('WORKFLOW0908','限时','限时流程','taskinfo.cmd?method=forlimittime',0,'WORKFLOW09','1','0','00',NULL),
 ('WORKFLOW0909','回执','回执流程','taskinfo.cmd?method=forhuizhi',0,'WORKFLOW09','1','0','00',NULL),
 ('WORKFLOW0910','撤销','撤销流程','taskinfo.cmd?method=undelegate',0,'WORKFLOW09','1','0','00',NULL),
 ('WORKFLOW0911','流转历史','流转历史','taskinfo.cmd?method=displaystatus;urlconfig.cmd?method=urlGetVisualFlow;urlconfig.cmd?method=urlGetXPDL',0,'WORKFLOW09','1','0','00',NULL),
 ('WORKFLOW0912','删除','批量删除流程','taskinfo.cmd?method=delProcessForMonitedTask',0,'WORKFLOW09','1','0','00',NULL),
 ('WORKFLOW0913','改发','重新委派处理人','taskinfo.cmd?method=reAssign',0,'WORKFLOW09','1','0','00',NULL),
 ('WORKFLOW0914','跳过','跳转到指定环节','taskinfo.cmd?method=jumpTo',0,'WORKFLOW09','1','0','00',NULL),
 ('WORKFLOW1003','添加常用意见','添加常用意见','commonremark.cmd?method=specialeditAdd',0,'WORKFLOW10','1','0','00',NULL),
 ('WORKFLOW1004','删除常用意见','删除常用意见','commonremark.cmd?method=specialeditDelete',0,'WORKFLOW10','1','0','00',NULL),
 ('WORKFLOW1005','常用审批意见','常用审批意见','commonremark.cmd?method=specialeditremarkdialog',0,'WORKFLOW10','1','0','00',NULL),
 ('WORKFLOW1006','签名域','签名域','taskinfo.cmd?method=signdialog',0,'WORKFLOW10','1','0','00',NULL),
 ('WORKFLOW1007','选择域','选择域','wf_struhelp.cmd?method=getEmpRoot;wf_struhelp.cmd?method=getCheckEmpRoot;wfdochelpcheckbox.cmd;wfdochelpradio.cmd;wfmeetinghelp.cmd;wf_struhelp.cmd?method=getSelectRoot;wf_struhelp.cmd?method=getHelpTreeNode',0,'WORKFLOW10','1','0','00',NULL),
 ('WORKFLOW1008','交流','交流','actionexchangequery.cmd;actionexchange.cmd?method=forinsert;actionexchange.cmd?method=insert;dochelpcheckbox.cmd',0,'WORKFLOW10','1','0','00',NULL),
 ('WORKFLOW1009','正文','正文','doccontent.cmd?method=detail',0,'WORKFLOW10','1','0','00',NULL),
 ('WORKFLOW1101','流程查询','流程查询','taskquery.cmd;taskinfosearch.cmd?method=search;taskinfosearch.cmd?method=forsearch;hrempforhelpradio.cmd;wf_struhelp.cmd?method=getEmpRoot;wf_struhelp.cmd?method=getChoiceNode;wfdochelpcheckbox.cmd;wfdochelpradio.cmd;wfmeetinghelp.cmd',0,'WORKFLOW11','1','0','00',NULL),
 ('WORKFLOW1102','表单查询','表单查询','workformforquery.cmd;formmanager.cmd?method=render;formdataquery.cmd;',0,'WORKFLOW11','1','0','00',NULL),
 ('WORKFLOW1201','缓存管理','缓存管理','wfadminoperate.cmd?method=cacheAdmin;wfadminoperate.cmd?method=forSetCacheSize;wfadminoperate.cmd?method=setCacheSize;wfadminoperate.cmd?method=clearCache',0,'WORKFLOW12','1','0','00',NULL),
 ('WORKFLOW1301','流程监控','流程监控','processmgradminquery.cmd?clear=true;processendadminquery.cmd;wfadminquery.cmd?method=getProcessList;wfadminquery.cmd?method=getAssignmentEndList;wfadminquery.cmd?method=getActivityEndList;wfadminquery.cmd?method=getAssignmentList;wfadminquery.cmd?method=getActivityList;processmgr.cmd?method=forupload;processmgr.cmd?method=uploadProcess;processmgr.cmd?method=startProcessMgr;processmgr.cmd?method=stopProcessMgr;processmgr.cmd?method=deleteProcessMgr;activityadmin.cmd?method=suspendActivity;activityadmin.cmd?method=resumeActivity;activityadmin.cmd?method=abortActivity;activityadmin.cmd?method=terminateActivity;activityadmin.cmd?method=showhistoryActivity;assignmentadmin.cmd?method=cancelAssignment;assignmentadmin.cmd?method=reAssignment;assignmentadmin.cmd?method=closeAssignment;processadmin.cmd?method=suspendProcess;processadmin.cmd?method=resumeProcess;processadmin.cmd?method=abortProcess;processadmin.cmd?method=terminateProcess;processadmin.cmd?method=terminateProcessAndDeleteProcessEnd;processadmin.cmd?method=showhistoryProcess;processadmin.cmd?method=checklimitProcess;processadmin.cmd?method=historyCompare;processalladmin.cmd?method=startActivity;processalladmin.cmd?method=suspendProcess;processalladmin.cmd?method=resumeProcess;processalladmin.cmd?method=abortProcess;processalladmin.cmd?method=terminateProcess;processalladmin.cmd?method=terminateProcessAndDeleteProcessEnd;processalladmin.cmd?method=showhistoryProcess;processalladmin.cmd?method=checklimitProcess;processalladmin.cmd?method=historyCompare;processalladminquery.cmd;taskinfo.cmd?method=displaystatus;processendadmin.cmd?method=deleteProcessEnd',0,'WORKFLOW13','1','0','00',NULL),
 ('WORKFLOW1302','启动环节','流程监控','activityadmin.cmd?method=startActivity',0,'WORKFLOW13','1','0','00',NULL),
 ('WORKFLOW1501','工作流组织树选择','工作流组织树选择','wf_struhelp.cmd;struhelp.cmd;wforgantypequery.cmd',0,'WORKFLOW15','1','0','00',NULL),
 ('WORKFLOW1601','人员业务量分析','人员或组织的业务量分析','wfpersonanlyze.cmd?method=PersonAnalyzeByDay;wfpersonanlyze.cmd?method=PersonSelectPro;wfpersonanlyze.cmd?method=PersonAnalyze;wfpersonanlyze.cmd?method=PersonAnalyzeByQuarter;wfpersonanlyze.cmd?method=PersonAnalyzeByMonth;',0,'WORKFLOW16','0','0','00',NULL),
 ('WORKFLOW1602','业务流量','流程或流程类型的业务量','wfportfolio.cmd?method=processPortfolioByQuarter;wfportfolio.cmd?method=processPortfolioByMonth;wfportfolio.cmd?method=processPortfolioByYear;processhelpquery.cmd',0,'WORKFLOW16','0','0','00',NULL),
 ('WORKFLOW1603','持续时间','流程或环节的持续时间','wflasttime.cmd?method=activityLastTime;wflasttime.cmd?method=processLastTimeByQuarter;wflasttime.cmd?method=processLastTimeByMonth;wflasttime.cmd?method=processLastTimeByYear;',0,'WORKFLOW16','0','0','00',NULL);
/*!40000 ALTER TABLE `pub_resources` ENABLE KEYS */;


--
-- Definition of table `pub_role_privs`
--

DROP TABLE IF EXISTS `pub_role_privs`;
CREATE TABLE `pub_role_privs` (
  `ROLE_ID` varchar(30) NOT NULL,
  `GRANTED_ROLE` varchar(30) NOT NULL,
  `ADMIN_OPTION` char(1) NOT NULL,
  `DEFAULT_ROLE` char(1) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GRANTED_ROLE`),
  KEY `PUBROLEPRIVS_FK2` (`GRANTED_ROLE`),
  CONSTRAINT `PUBROLEPRIVS_FK1` FOREIGN KEY (`ROLE_ID`) REFERENCES `pub_roles` (`ROLE_ID`),
  CONSTRAINT `PUBROLEPRIVS_FK2` FOREIGN KEY (`GRANTED_ROLE`) REFERENCES `pub_roles` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_role_privs`
--

/*!40000 ALTER TABLE `pub_role_privs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_role_privs` ENABLE KEYS */;


--
-- Definition of table `pub_role_resource`
--

DROP TABLE IF EXISTS `pub_role_resource`;
CREATE TABLE `pub_role_resource` (
  `ROLE_ID` varchar(30) NOT NULL,
  `RESOURCE_ID` varchar(30) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`RESOURCE_ID`),
  KEY `PUBROLERES_FK2` (`RESOURCE_ID`),
  CONSTRAINT `PUBROLERES_FK1` FOREIGN KEY (`ROLE_ID`) REFERENCES `pub_roles` (`ROLE_ID`),
  CONSTRAINT `PUBROLERES_FK2` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `pub_resources` (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_role_resource`
--

/*!40000 ALTER TABLE `pub_role_resource` DISABLE KEYS */;
INSERT INTO `pub_role_resource` (`ROLE_ID`,`RESOURCE_ID`) VALUES 
 ('SUPERADMIN','applyDaiban'),
 ('SUPERADMIN','applyDraft'),
 ('SUPERADMIN','attachment001'),
 ('GPUBLIC','BASE000101'),
 ('SUPERADMIN','BASE000101'),
 ('GPUBLIC','BASE000201'),
 ('SUPERADMIN','BASE000201'),
 ('GPUBLIC','BASE000301'),
 ('SUPERADMIN','BASE000301'),
 ('GPUBLIC','BASE000401'),
 ('SUPERADMIN','BASE000401'),
 ('GPUBLIC','BASE000501'),
 ('SUPERADMIN','BASE000501'),
 ('GPUBLIC','BASE000601'),
 ('SUPERADMIN','BASE000601'),
 ('SYSADMIN','BASE000601'),
 ('GPUBLIC','BASE000602'),
 ('SUPERADMIN','BASE000602'),
 ('SYSADMIN','BASE000602'),
 ('GPUBLIC','BASE000603'),
 ('SUPERADMIN','BASE000603'),
 ('SYSADMIN','BASE000603'),
 ('GPUBLIC','BASE000604'),
 ('SUPERADMIN','BASE000604'),
 ('SYSADMIN','BASE000604'),
 ('GPUBLIC','BASE000605'),
 ('SUPERADMIN','BASE000605'),
 ('SYSADMIN','BASE000605'),
 ('GPUBLIC','BASE000606'),
 ('SUPERADMIN','BASE000606'),
 ('SYSADMIN','BASE000606'),
 ('GPUBLIC','BASE000607'),
 ('SUPERADMIN','BASE000607'),
 ('SYSADMIN','BASE000607'),
 ('GPUBLIC','BASE000608'),
 ('SUPERADMIN','BASE000608'),
 ('SYSADMIN','BASE000608'),
 ('GPUBLIC','BASE000609'),
 ('SUPERADMIN','BASE000609'),
 ('SYSADMIN','BASE000609'),
 ('GPUBLIC','BASE000610'),
 ('SUPERADMIN','BASE000610'),
 ('SYSADMIN','BASE000610'),
 ('GPUBLIC','BASE000611'),
 ('SUPERADMIN','BASE000611'),
 ('SYSADMIN','BASE000611'),
 ('GPUBLIC','BASE000612'),
 ('SUPERADMIN','BASE000612'),
 ('SYSADMIN','BASE000612'),
 ('GPUBLIC','BASE000613'),
 ('SUPERADMIN','BASE000613'),
 ('SYSADMIN','BASE000613'),
 ('GPUBLIC','BASE000614'),
 ('SUPERADMIN','BASE000614'),
 ('SYSADMIN','BASE000614'),
 ('GPUBLIC','BASE000701'),
 ('SUPERADMIN','BASE000701'),
 ('SYSADMIN','BASE000701'),
 ('GPUBLIC','BASE000801'),
 ('SUPERADMIN','BASE000801'),
 ('SYSADMIN','BASE000801'),
 ('GPUBLIC','BASE000901'),
 ('SUPERADMIN','BASE000901'),
 ('SUPERADMIN','batchapply002'),
 ('SUPERADMIN','BSP000101'),
 ('SYSADMIN','BSP000101'),
 ('SUPERADMIN','BSP000102'),
 ('SYSADMIN','BSP000102'),
 ('SUPERADMIN','BSP000103'),
 ('SYSADMIN','BSP000103'),
 ('SUPERADMIN','BSP000104'),
 ('SYSADMIN','BSP000104'),
 ('SUPERADMIN','BSP010101'),
 ('SUPERADMIN','BSP010102'),
 ('SUPERADMIN','BSP010103'),
 ('SUPERADMIN','BSP010104'),
 ('SUPERADMIN','BSP010201'),
 ('SUPERADMIN','BSP010202'),
 ('SUPERADMIN','BSP010203'),
 ('SUPERADMIN','BSP010204'),
 ('SUPERADMIN','BSP010301'),
 ('SUPERADMIN','BSP010302'),
 ('SUPERADMIN','BSP010303'),
 ('SUPERADMIN','BSP010304'),
 ('SUPERADMIN','BSP010401'),
 ('SUPERADMIN','BSP010402'),
 ('SUPERADMIN','BSP010403'),
 ('SUPERADMIN','BSP010404'),
 ('SUPERADMIN','BSP010501'),
 ('SUPERADMIN','BSP010502'),
 ('SUPERADMIN','BSP010503'),
 ('SUPERADMIN','BSP010504'),
 ('SUPERADMIN','BSP010601'),
 ('SUPERADMIN','BSP010602'),
 ('SUPERADMIN','BSP010603'),
 ('SUPERADMIN','BSP010604'),
 ('SUPERADMIN','BSP010701'),
 ('SUPERADMIN','BSP010702'),
 ('SUPERADMIN','BSP010703'),
 ('SUPERADMIN','BSP010704'),
 ('SUPERADMIN','BSP010705'),
 ('SUPERADMIN','BSP010706'),
 ('SUPERADMIN','BSP010707'),
 ('SUPERADMIN','BSP010708'),
 ('SUPERADMIN','BSP010709'),
 ('SUPERADMIN','BSP010801'),
 ('SUPERADMIN','BSP010802'),
 ('SUPERADMIN','BSP010803'),
 ('SUPERADMIN','BSP010804'),
 ('SUPERADMIN','BSP010901'),
 ('SUPERADMIN','BSP010902'),
 ('SUPERADMIN','BSP010903'),
 ('SUPERADMIN','BSP010904'),
 ('SUPERADMIN','BSP011001'),
 ('SUPERADMIN','BSP011002'),
 ('SUPERADMIN','BSP011003'),
 ('SUPERADMIN','BSP011004'),
 ('SUPERADMIN','BSP011101'),
 ('SUPERADMIN','BSP011102'),
 ('SUPERADMIN','BSP011103'),
 ('SUPERADMIN','BSP011104'),
 ('SUPERADMIN','BSP020101'),
 ('SUPERADMIN','BSP020102'),
 ('SUPERADMIN','BSP020103'),
 ('SUPERADMIN','BSP020104'),
 ('SUPERADMIN','BSP020201'),
 ('SUPERADMIN','BSP020202'),
 ('SUPERADMIN','BSP020203'),
 ('SUPERADMIN','BSP020204'),
 ('SUPERADMIN','BSP030101'),
 ('SYSADMIN','BSP030101'),
 ('SUPERADMIN','BSP030201'),
 ('SYSADMIN','BSP030201'),
 ('SUPERADMIN','BSP030301'),
 ('SYSADMIN','BSP030301'),
 ('SUPERADMIN','BSP030302'),
 ('SYSADMIN','BSP030302'),
 ('SUPERADMIN','BSP030303'),
 ('SYSADMIN','BSP030303'),
 ('SUPERADMIN','BSP030304'),
 ('SYSADMIN','BSP030304'),
 ('SUPERADMIN','BSP030305'),
 ('SYSADMIN','BSP030305'),
 ('SUPERADMIN','BSP030306'),
 ('SYSADMIN','BSP030306'),
 ('SUPERADMIN','BSP030307'),
 ('SYSADMIN','BSP030307'),
 ('SUPERADMIN','BSP030308'),
 ('SYSADMIN','BSP030308'),
 ('SUPERADMIN','BSP030309'),
 ('SYSADMIN','BSP030309'),
 ('SUPERADMIN','BSP030310'),
 ('SYSADMIN','BSP030310'),
 ('SUPERADMIN','BSP030401'),
 ('SYSADMIN','BSP030401'),
 ('SUPERADMIN','BSP030402'),
 ('SYSADMIN','BSP030402'),
 ('SUPERADMIN','BSP030403'),
 ('SYSADMIN','BSP030403'),
 ('SUPERADMIN','BSP030404'),
 ('SYSADMIN','BSP030404'),
 ('SUPERADMIN','BSP030501'),
 ('SYSADMIN','BSP030501'),
 ('SUPERADMIN','BSP0305010'),
 ('SYSADMIN','BSP0305010'),
 ('SUPERADMIN','BSP0305011'),
 ('SYSADMIN','BSP0305011'),
 ('SUPERADMIN','BSP0305012'),
 ('SYSADMIN','BSP0305012'),
 ('SUPERADMIN','BSP0305013'),
 ('SYSADMIN','BSP0305013'),
 ('SUPERADMIN','BSP0305014'),
 ('SYSADMIN','BSP0305014'),
 ('SUPERADMIN','BSP030502'),
 ('SYSADMIN','BSP030502'),
 ('SUPERADMIN','BSP030503'),
 ('SYSADMIN','BSP030503'),
 ('SUPERADMIN','BSP030504'),
 ('SYSADMIN','BSP030504'),
 ('SUPERADMIN','BSP030505'),
 ('SYSADMIN','BSP030505'),
 ('SUPERADMIN','BSP030506'),
 ('SYSADMIN','BSP030506'),
 ('SUPERADMIN','BSP030507'),
 ('SYSADMIN','BSP030507'),
 ('SUPERADMIN','BSP030508'),
 ('SYSADMIN','BSP030508'),
 ('SUPERADMIN','BSP030509'),
 ('SYSADMIN','BSP030509'),
 ('SUPERADMIN','BSP030510'),
 ('SYSADMIN','BSP030510'),
 ('SUPERADMIN','BSP030511'),
 ('SYSADMIN','BSP030511'),
 ('SUPERADMIN','BSP030601'),
 ('SYSADMIN','BSP030601'),
 ('SUPERADMIN','BSP030602'),
 ('SYSADMIN','BSP030602'),
 ('SUPERADMIN','BSP030603'),
 ('SYSADMIN','BSP030603'),
 ('SUPERADMIN','BSP030604'),
 ('SYSADMIN','BSP030604'),
 ('SUPERADMIN','BSP030701'),
 ('SUPERADMIN','BSP030801'),
 ('SYSADMIN','BSP030801'),
 ('SUPERADMIN','BSP030901'),
 ('SUPERADMIN','BSP031001'),
 ('SYSADMIN','BSP031001'),
 ('SUPERADMIN','BSP031002'),
 ('SYSADMIN','BSP031002'),
 ('SUPERADMIN','BSP031101'),
 ('SYSADMIN','BSP031101'),
 ('SUPERADMIN','BSP031102'),
 ('SYSADMIN','BSP031102'),
 ('SUPERADMIN','BSP031201'),
 ('SYSADMIN','BSP031201'),
 ('SUPERADMIN','BSP031202'),
 ('SYSADMIN','BSP031202'),
 ('SUPERADMIN','BSP031203'),
 ('SYSADMIN','BSP031203'),
 ('SUPERADMIN','BSP031301'),
 ('SUPERADMIN','BSP031302'),
 ('SUPERADMIN','BSP031401'),
 ('SUPERADMIN','BSP031402'),
 ('SUPERADMIN','BSP031403'),
 ('SUPERADMIN','BSP031404'),
 ('SUPERADMIN','BSP040101'),
 ('SYSADMIN','BSP040101'),
 ('SUPERADMIN','BSP040102'),
 ('SYSADMIN','BSP040102'),
 ('SUPERADMIN','BSP040103'),
 ('SYSADMIN','BSP040103'),
 ('SUPERADMIN','BSP040104'),
 ('SYSADMIN','BSP040104'),
 ('SUPERADMIN','BSP040201'),
 ('SYSADMIN','BSP040201'),
 ('SUPERADMIN','BSP040202'),
 ('SYSADMIN','BSP040202'),
 ('SUPERADMIN','BSP040203'),
 ('SYSADMIN','BSP040203'),
 ('SUPERADMIN','BSP040301'),
 ('SYSADMIN','BSP040301'),
 ('SUPERADMIN','BSP040302'),
 ('SYSADMIN','BSP040302'),
 ('SUPERADMIN','BSP040303'),
 ('SYSADMIN','BSP040303'),
 ('SUPERADMIN','BSP040304'),
 ('SYSADMIN','BSP040304'),
 ('SUPERADMIN','BSP040305'),
 ('SYSADMIN','BSP040305'),
 ('SUPERADMIN','BSP040306'),
 ('SYSADMIN','BSP040306'),
 ('SUPERADMIN','BSP040307'),
 ('SYSADMIN','BSP040307'),
 ('SUPERADMIN','BSP040308'),
 ('SYSADMIN','BSP040308'),
 ('SUPERADMIN','BSP040309'),
 ('SYSADMIN','BSP040309'),
 ('SUPERADMIN','BSP040310'),
 ('SYSADMIN','BSP040310'),
 ('SUPERADMIN','BSP040311'),
 ('SYSADMIN','BSP040311'),
 ('SUPERADMIN','BSP040312'),
 ('SYSADMIN','BSP040312'),
 ('SUPERADMIN','BSP040313'),
 ('SYSADMIN','BSP040313'),
 ('SUPERADMIN','BSP040401'),
 ('SYSADMIN','BSP040401'),
 ('SUPERADMIN','BSPDEST0101'),
 ('SYSADMIN','BSPDEST0101'),
 ('SUPERADMIN','BUOBJECT02'),
 ('SUPERADMIN','BUTRANSFER01'),
 ('SUPERADMIN','BUTRANSFER02'),
 ('SUPERADMIN','buyPeriodSetting'),
 ('SUPERADMIN','catalog001'),
 ('SUPERADMIN','catalogCommon'),
 ('SUPERADMIN','catalogNo02'),
 ('SUPERADMIN','CentralCatalog0008'),
 ('SUPERADMIN','CentralCatalog0010'),
 ('SUPERADMIN','centralCheck1'),
 ('SUPERADMIN','centralCheck2'),
 ('SUPERADMIN','centralManage2'),
 ('SUPERADMIN','centralMange1'),
 ('SUPERADMIN','centralMerge1'),
 ('SUPERADMIN','centralMerge2'),
 ('SUPERADMIN','centralNo1'),
 ('SUPERADMIN','centralNo2'),
 ('SUPERADMIN','CentralPurchaseDetails01'),
 ('SUPERADMIN','centrialPurchaseDivision'),
 ('SUPERADMIN','changeRfx01'),
 ('SUPERADMIN','chooseHeadStatic01'),
 ('GPUBLIC','DEMO020101'),
 ('SUPERADMIN','DEMO020101'),
 ('SUPERADMIN','DEMO020201'),
 ('SUPERADMIN','DEMO020301'),
 ('SUPERADMIN','DEMO020401'),
 ('SUPERADMIN','DEMO020501'),
 ('SUPERADMIN','DEMO020601'),
 ('SUPERADMIN','DEMO020701'),
 ('SUPERADMIN','DEMO020801'),
 ('SUPERADMIN','DEMO020901'),
 ('SUPERADMIN','DEMO021001'),
 ('SUPERADMIN','EXCEL03'),
 ('SUPERADMIN','EXCELIMPORT003'),
 ('SUPERADMIN','FEETYPE002'),
 ('SUPERADMIN','FEETYPE003'),
 ('SUPERADMIN','HandledPlan0101'),
 ('SUPERADMIN','IMPORTPLAN03'),
 ('SUPERADMIN','measure001'),
 ('SUPERADMIN','MH002'),
 ('SUPERADMIN','MP_CMP_MESSAG01'),
 ('SYSADMIN','MP_CMP_MESSAG01'),
 ('SUPERADMIN','MP_CMP_MESSAG02'),
 ('SYSADMIN','MP_CMP_MESSAG02'),
 ('SUPERADMIN','MP_MESSAG01'),
 ('SYSADMIN','MP_MESSAG01'),
 ('SUPERADMIN','MP_MESSAG02'),
 ('SYSADMIN','MP_MESSAG02'),
 ('SUPERADMIN','MP_MESSAG_LOG01'),
 ('SYSADMIN','MP_MESSAG_LOG01'),
 ('SUPERADMIN','MP_MESSAG_LOG02'),
 ('SYSADMIN','MP_MESSAG_LOG02'),
 ('SUPERADMIN','MyPlan0101'),
 ('SUPERADMIN','PlanManage0101'),
 ('SUPERADMIN','PlanManage0102'),
 ('SUPERADMIN','PlanProcess0101'),
 ('SUPERADMIN','PR00030101'),
 ('SUPERADMIN','PR00030201'),
 ('SUPERADMIN','PR00030202'),
 ('SUPERADMIN','PR00030301'),
 ('SUPERADMIN','PR00030401'),
 ('SUPERADMIN','PR00030402'),
 ('SUPERADMIN','PR00030501'),
 ('SUPERADMIN','PR00030601'),
 ('SUPERADMIN','PR00030602'),
 ('SUPERADMIN','PR00030701'),
 ('SUPERADMIN','PR00030711'),
 ('SUPERADMIN','PR00030801'),
 ('SUPERADMIN','PR00030802'),
 ('SUPERADMIN','PR098977'),
 ('SUPERADMIN','PRC0003'),
 ('SUPERADMIN','prc022165486'),
 ('SUPERADMIN','prc256879'),
 ('SUPERADMIN','prc2884569'),
 ('SUPERADMIN','prc3258646'),
 ('SUPERADMIN','prcbr010001'),
 ('SUPERADMIN','prcbr010004'),
 ('SUPERADMIN','prcbr030001'),
 ('SUPERADMIN','prccp010002'),
 ('SUPERADMIN','prccp01000205'),
 ('SUPERADMIN','prccp020001'),
 ('SUPERADMIN','prccp030001'),
 ('SUPERADMIN','PRHEAD0101'),
 ('SUPERADMIN','PRLOC0101'),
 ('SUPERADMIN','PROCUREMENTWAYS002'),
 ('SUPERADMIN','PRW_APPROVETACTIC01'),
 ('SUPERADMIN','PRW_APPROVETACTIC02'),
 ('SUPERADMIN','PRW_APPROVETACTIC_ACT01'),
 ('SUPERADMIN','PRW_APPROVETACTIC_ACT02'),
 ('SUPERADMIN','PRW_HEADPRAPPLY01'),
 ('SUPERADMIN','PRW_HEADPRAPPLY02'),
 ('SUPERADMIN','PRW_MAINTAINPROJNAME01'),
 ('SUPERADMIN','PRW_PRPOSITION_MANAGE01'),
 ('SUPERADMIN','PRW_PRPOSITION_MANAGE02'),
 ('SUPERADMIN','PRW_SCREENFIELD01'),
 ('SUPERADMIN','PRW_SCREENFIELD02'),
 ('SUPERADMIN','PRW_TACTIC_INSTANCE01'),
 ('SUPERADMIN','PRW_TACTIC_INSTANCE02'),
 ('SUPERADMIN','PUBTOOL010101'),
 ('SYSADMIN','PUBTOOL010101'),
 ('SUPERADMIN','PUBTOOL010102'),
 ('SYSADMIN','PUBTOOL010102'),
 ('SUPERADMIN','PUBTOOL010103'),
 ('SYSADMIN','PUBTOOL010103'),
 ('SUPERADMIN','PUB_COMHELP01'),
 ('SUPERADMIN','PUB_COMHELP02'),
 ('SUPERADMIN','PurchaseRequisition004'),
 ('SUPERADMIN','PurchaseRequisition013'),
 ('SUPERADMIN','PurchaseRequisitionSaveAction1'),
 ('SUPERADMIN','RevokeApply01'),
 ('SUPERADMIN','rfxform02url'),
 ('SUPERADMIN','rfxform03'),
 ('SUPERADMIN','RFXTEMP002'),
 ('SUPERADMIN','RFXTEMP003'),
 ('SUPERADMIN','sccheckroleparams00101'),
 ('SUPERADMIN','scmCategorySelector01'),
 ('SUPERADMIN','scmProductSelector01'),
 ('SUPERADMIN','scmUserSelector01'),
 ('SUPERADMIN','seluserhelp0001'),
 ('SUPERADMIN','sysindex013221r1'),
 ('SUPERADMIN','sysrepfunres01'),
 ('SUPERADMIN','SYS_MESSAG01'),
 ('SUPERADMIN','SYS_MESSAG02'),
 ('SUPERADMIN','taskinfoquerynew0001'),
 ('SUPERADMIN','webeditgrid01'),
 ('SUPERADMIN','webeditgrid02'),
 ('SUPERADMIN','webeditgrid03'),
 ('SUPERADMIN','webeditgrid04'),
 ('SUPERADMIN','webeditgrid05'),
 ('SUPERADMIN','webflexgrid01'),
 ('SUPERADMIN','webflexgrid02'),
 ('SUPERADMIN','webflexgrid03'),
 ('SUPERADMIN','webflexgrid04'),
 ('SUPERADMIN','webflexgrid05'),
 ('SUPERADMIN','webflexgrid06'),
 ('SUPERADMIN','webgrid01'),
 ('SUPERADMIN','webgrid02'),
 ('SUPERADMIN','webgrid03'),
 ('SUPERADMIN','webgrid04'),
 ('SUPERADMIN','webgrid05'),
 ('SUPERADMIN','webhtml01'),
 ('SUPERADMIN','webhtml02'),
 ('SUPERADMIN','webhtml03'),
 ('SUPERADMIN','webhtml04'),
 ('SUPERADMIN','webhtml05'),
 ('SUPERADMIN','webhtml06'),
 ('SUPERADMIN','webhtml07'),
 ('SUPERADMIN','webtree01'),
 ('SUPERADMIN','webtree02'),
 ('SUPERADMIN','webtree03'),
 ('SUPERADMIN','webtree04'),
 ('SUPERADMIN','webtree05'),
 ('SUPERADMIN','webtree06'),
 ('SUPERADMIN','webtree07'),
 ('SUPERADMIN','webtree08'),
 ('SUPERADMIN','webtree09'),
 ('SUPERADMIN','webupload01'),
 ('SUPERADMIN','webupload02'),
 ('SUPERADMIN','webupload03'),
 ('SUPERADMIN','webupload04'),
 ('SUPERADMIN','webupload05'),
 ('SUPERADMIN','webzuhe01'),
 ('SUPERADMIN','webzuhe02'),
 ('SUPERADMIN','webzuhe03'),
 ('SUPERADMIN','webzuhe04'),
 ('SUPERADMIN','webzuhe05'),
 ('SUPERADMIN','WFREPORT1501'),
 ('WORKFLOWADMIN','WFREPORT1501'),
 ('SUPERADMIN','WFREPORT1502'),
 ('WORKFLOWADMIN','WFREPORT1502'),
 ('SUPERADMIN','WFREPORT1503'),
 ('WORKFLOWADMIN','WFREPORT1503'),
 ('SUPERADMIN','WFREPORT1504'),
 ('WORKFLOWADMIN','WFREPORT1504'),
 ('SUPERADMIN','WFREPORT1505'),
 ('WORKFLOWADMIN','WFREPORT1505'),
 ('SUPERADMIN','WFREPORT1506'),
 ('WORKFLOWADMIN','WFREPORT1506'),
 ('SUPERADMIN','WFREPORT1507'),
 ('WORKFLOWADMIN','WFREPORT1507'),
 ('SUPERADMIN','WFREPORT1508'),
 ('WORKFLOWADMIN','WFREPORT1508'),
 ('SUPERADMIN','WFREPORT1509'),
 ('WORKFLOWADMIN','WFREPORT1509'),
 ('SUPERADMIN','WFREPORT1510'),
 ('WORKFLOWADMIN','WFREPORT1510'),
 ('SUPERADMIN','WFREPORT1511'),
 ('WORKFLOWADMIN','WFREPORT1511'),
 ('SUPERADMIN','WFREPORT1512'),
 ('WORKFLOWADMIN','WFREPORT1512'),
 ('SUPERADMIN','WFREPORT1601'),
 ('WORKFLOWCOMUSER','WFREPORT1601'),
 ('SUPERADMIN','WFREPORT1602'),
 ('WORKFLOWCOMUSER','WFREPORT1602'),
 ('SUPERADMIN','WFREPORT1603'),
 ('WORKFLOWCOMUSER','WFREPORT1603'),
 ('SUPERADMIN','WFREPORT1604'),
 ('WORKFLOWCOMUSER','WFREPORT1604'),
 ('SUPERADMIN','WF_MANAGE_FILES01'),
 ('SUPERADMIN','WF_MANAGE_FILES02'),
 ('SUPERADMIN','WF_PROCESS_FILES01'),
 ('SUPERADMIN','WF_PROCESS_FILES02'),
 ('SUPERADMIN','WF_PROCESS_TYPE01'),
 ('SUPERADMIN','WF_PROCESS_TYPE02'),
 ('SUPERADMIN','WORKFLOW0101'),
 ('WORKFLOWADMIN','WORKFLOW0101'),
 ('SUPERADMIN','WORKFLOW0102'),
 ('WORKFLOWADMIN','WORKFLOW0102'),
 ('SUPERADMIN','WORKFLOW0103'),
 ('WORKFLOWADMIN','WORKFLOW0103'),
 ('SUPERADMIN','WORKFLOW0104'),
 ('WORKFLOWADMIN','WORKFLOW0104'),
 ('SUPERADMIN','WORKFLOW0105'),
 ('WORKFLOWCOMUSER','WORKFLOW0105'),
 ('SUPERADMIN','WORKFLOW0106'),
 ('WORKFLOWCOMUSER','WORKFLOW0106'),
 ('SUPERADMIN','WORKFLOW0201'),
 ('WORKFLOWADMIN','WORKFLOW0201'),
 ('SUPERADMIN','WORKFLOW0202'),
 ('WORKFLOWADMIN','WORKFLOW0202'),
 ('SUPERADMIN','WORKFLOW0203'),
 ('WORKFLOWADMIN','WORKFLOW0203'),
 ('SUPERADMIN','WORKFLOW0204'),
 ('WORKFLOWADMIN','WORKFLOW0204'),
 ('SUPERADMIN','WORKFLOW0205'),
 ('WORKFLOWCOMUSER','WORKFLOW0205'),
 ('SUPERADMIN','WORKFLOW0206'),
 ('WORKFLOWADMIN','WORKFLOW0206'),
 ('SUPERADMIN','WORKFLOW0207'),
 ('WORKFLOWADMIN','WORKFLOW0207'),
 ('SUPERADMIN','WORKFLOW0301'),
 ('WORKFLOWADMIN','WORKFLOW0301'),
 ('SUPERADMIN','WORKFLOW0302'),
 ('WORKFLOWADMIN','WORKFLOW0302'),
 ('SUPERADMIN','WORKFLOW0303'),
 ('WORKFLOWADMIN','WORKFLOW0303'),
 ('SUPERADMIN','WORKFLOW0304'),
 ('WORKFLOWADMIN','WORKFLOW0304'),
 ('SUPERADMIN','WORKFLOW0305'),
 ('WORKFLOWCOMUSER','WORKFLOW0305'),
 ('SUPERADMIN','WORKFLOW0306'),
 ('WORKFLOWADMIN','WORKFLOW0306'),
 ('SUPERADMIN','WORKFLOW0307'),
 ('WORKFLOWADMIN','WORKFLOW0307'),
 ('SUPERADMIN','WORKFLOW0308'),
 ('WORKFLOWADMIN','WORKFLOW0308'),
 ('SUPERADMIN','WORKFLOW0309'),
 ('WORKFLOWCOMUSER','WORKFLOW0309'),
 ('SUPERADMIN','WORKFLOW0400'),
 ('WORKFLOWADMIN','WORKFLOW0400'),
 ('SUPERADMIN','WORKFLOW0401'),
 ('WORKFLOWADMIN','WORKFLOW0401'),
 ('SUPERADMIN','WORKFLOW040101'),
 ('WORKFLOWADMIN','WORKFLOW040101'),
 ('WORKFLOWCOMUSER','WORKFLOW040101'),
 ('SUPERADMIN','WORKFLOW0402'),
 ('WORKFLOWADMIN','WORKFLOW0402'),
 ('SUPERADMIN','WORKFLOW0403'),
 ('WORKFLOWADMIN','WORKFLOW0403'),
 ('SUPERADMIN','WORKFLOW0404'),
 ('WORKFLOWADMIN','WORKFLOW0404'),
 ('SUPERADMIN','WORKFLOW0405'),
 ('WORKFLOWADMIN','WORKFLOW0405'),
 ('SUPERADMIN','WORKFLOW0406'),
 ('WORKFLOWADMIN','WORKFLOW0406'),
 ('SUPERADMIN','WORKFLOW0407'),
 ('WORKFLOWADMIN','WORKFLOW0407'),
 ('SUPERADMIN','WORKFLOW0501'),
 ('WORKFLOWADMIN','WORKFLOW0501'),
 ('SUPERADMIN','WORKFLOW0502'),
 ('WORKFLOWADMIN','WORKFLOW0502'),
 ('SUPERADMIN','WORKFLOW0503'),
 ('WORKFLOWADMIN','WORKFLOW0503'),
 ('SUPERADMIN','WORKFLOW0504'),
 ('WORKFLOWADMIN','WORKFLOW0504'),
 ('SUPERADMIN','WORKFLOW0505'),
 ('WORKFLOWCOMUSER','WORKFLOW0505'),
 ('SUPERADMIN','WORKFLOW0601'),
 ('WORKFLOWCOMUSER','WORKFLOW0601'),
 ('SUPERADMIN','WORKFLOW0602'),
 ('WORKFLOWCOMUSER','WORKFLOW0602'),
 ('SUPERADMIN','WORKFLOW0603'),
 ('WORKFLOWCOMUSER','WORKFLOW0603'),
 ('SUPERADMIN','WORKFLOW0604'),
 ('WORKFLOWCOMUSER','WORKFLOW0604'),
 ('SUPERADMIN','WORKFLOW0605'),
 ('WORKFLOWCOMUSER','WORKFLOW0605'),
 ('SUPERADMIN','WORKFLOW0606'),
 ('WORKFLOWCOMUSER','WORKFLOW0606'),
 ('SUPERADMIN','WORKFLOW0607'),
 ('WORKFLOWCOMUSER','WORKFLOW0607'),
 ('SUPERADMIN','WORKFLOW0608'),
 ('WORKFLOWCOMUSER','WORKFLOW0608'),
 ('SUPERADMIN','WORKFLOW0609'),
 ('WORKFLOWCOMUSER','WORKFLOW0609'),
 ('SUPERADMIN','WORKFLOW0610'),
 ('WORKFLOWCOMUSER','WORKFLOW0610'),
 ('SUPERADMIN','WORKFLOW0611'),
 ('WORKFLOWCOMUSER','WORKFLOW0611'),
 ('SUPERADMIN','WORKFLOW0701'),
 ('WORKFLOWCOMUSER','WORKFLOW0701'),
 ('SUPERADMIN','WORKFLOW0702'),
 ('WORKFLOWCOMUSER','WORKFLOW0702'),
 ('SUPERADMIN','WORKFLOW0703'),
 ('WORKFLOWCOMUSER','WORKFLOW0703'),
 ('SUPERADMIN','WORKFLOW0704'),
 ('WORKFLOWADMIN','WORKFLOW0704'),
 ('WORKFLOWCOMUSER','WORKFLOW0704'),
 ('SUPERADMIN','WORKFLOW0801'),
 ('WORKFLOWCOMUSER','WORKFLOW0801'),
 ('SUPERADMIN','WORKFLOW0802'),
 ('WORKFLOWCOMUSER','WORKFLOW0802'),
 ('SUPERADMIN','WORKFLOW0803'),
 ('WORKFLOWCOMUSER','WORKFLOW0803'),
 ('SUPERADMIN','WORKFLOW0804'),
 ('WORKFLOWCOMUSER','WORKFLOW0804'),
 ('SUPERADMIN','WORKFLOW0805'),
 ('WORKFLOWCOMUSER','WORKFLOW0805'),
 ('SUPERADMIN','WORKFLOW0806'),
 ('WORKFLOWADMIN','WORKFLOW0806'),
 ('WORKFLOWCOMUSER','WORKFLOW0806'),
 ('SUPERADMIN','WORKFLOW0901'),
 ('WORKFLOWCOMUSER','WORKFLOW0901'),
 ('SUPERADMIN','WORKFLOW0902'),
 ('WORKFLOWCOMUSER','WORKFLOW0902'),
 ('SUPERADMIN','WORKFLOW0903'),
 ('WORKFLOWCOMUSER','WORKFLOW0903'),
 ('SUPERADMIN','WORKFLOW0904'),
 ('WORKFLOWCOMUSER','WORKFLOW0904'),
 ('SUPERADMIN','WORKFLOW0905'),
 ('WORKFLOWCOMUSER','WORKFLOW0905'),
 ('SUPERADMIN','WORKFLOW0906'),
 ('WORKFLOWCOMUSER','WORKFLOW0906'),
 ('SUPERADMIN','WORKFLOW0907'),
 ('WORKFLOWCOMUSER','WORKFLOW0907'),
 ('SUPERADMIN','WORKFLOW0908'),
 ('WORKFLOWCOMUSER','WORKFLOW0908'),
 ('SUPERADMIN','WORKFLOW0909'),
 ('WORKFLOWCOMUSER','WORKFLOW0909'),
 ('SUPERADMIN','WORKFLOW0910'),
 ('WORKFLOWCOMUSER','WORKFLOW0910'),
 ('SUPERADMIN','WORKFLOW0911'),
 ('WORKFLOWCOMUSER','WORKFLOW0911'),
 ('SUPERADMIN','WORKFLOW0912'),
 ('WORKFLOWCOMUSER','WORKFLOW0912'),
 ('SUPERADMIN','WORKFLOW0913'),
 ('WORKFLOWCOMUSER','WORKFLOW0913'),
 ('SUPERADMIN','WORKFLOW0914'),
 ('WORKFLOWCOMUSER','WORKFLOW0914'),
 ('SUPERADMIN','WORKFLOW1003'),
 ('WORKFLOWCOMUSER','WORKFLOW1003'),
 ('SUPERADMIN','WORKFLOW1004'),
 ('WORKFLOWCOMUSER','WORKFLOW1004'),
 ('SUPERADMIN','WORKFLOW1005'),
 ('WORKFLOWCOMUSER','WORKFLOW1005'),
 ('SUPERADMIN','WORKFLOW1006'),
 ('WORKFLOWCOMUSER','WORKFLOW1006'),
 ('SUPERADMIN','WORKFLOW1007'),
 ('WORKFLOWCOMUSER','WORKFLOW1007'),
 ('SUPERADMIN','WORKFLOW1008'),
 ('WORKFLOWCOMUSER','WORKFLOW1008'),
 ('SUPERADMIN','WORKFLOW1009'),
 ('WORKFLOWCOMUSER','WORKFLOW1009'),
 ('SUPERADMIN','WORKFLOW1101'),
 ('WORKFLOWADMIN','WORKFLOW1101'),
 ('WORKFLOWCOMUSER','WORKFLOW1101'),
 ('SUPERADMIN','WORKFLOW1102'),
 ('WORKFLOWCOMUSER','WORKFLOW1102'),
 ('SUPERADMIN','WORKFLOW1201'),
 ('WORKFLOWADMIN','WORKFLOW1201'),
 ('SUPERADMIN','WORKFLOW1301'),
 ('WORKFLOWADMIN','WORKFLOW1301'),
 ('SUPERADMIN','WORKFLOW1302'),
 ('WORKFLOWADMIN','WORKFLOW1302'),
 ('SUPERADMIN','WORKFLOW1501'),
 ('WORKFLOWADMIN','WORKFLOW1501'),
 ('WORKFLOWCOMUSER','WORKFLOW1501'),
 ('SUPERADMIN','WORKFLOW1601'),
 ('WORKFLOWADMIN','WORKFLOW1601'),
 ('SUPERADMIN','WORKFLOW1602'),
 ('WORKFLOWADMIN','WORKFLOW1602'),
 ('SUPERADMIN','WORKFLOW1603'),
 ('WORKFLOWADMIN','WORKFLOW1603');
/*!40000 ALTER TABLE `pub_role_resource` ENABLE KEYS */;


--
-- Definition of table `pub_roles`
--

DROP TABLE IF EXISTS `pub_roles`;
CREATE TABLE `pub_roles` (
  `ROLE_ID` varchar(30) NOT NULL,
  `ROLE_NAME` varchar(30) NOT NULL,
  `ROLE_ALIAS` varchar(30) NOT NULL,
  `CORPORATION_ID` varchar(30) NOT NULL,
  `IS_SYS` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_roles`
--

/*!40000 ALTER TABLE `pub_roles` DISABLE KEYS */;
INSERT INTO `pub_roles` (`ROLE_ID`,`ROLE_NAME`,`ROLE_ALIAS`,`CORPORATION_ID`,`IS_SYS`) VALUES 
 ('GPUBLIC','GPUBLIC','系统公用角色','1','0'),
 ('SUPERADMIN','SUPERADMIN','超级管理员','1','1'),
 ('SYSADMIN','SYSADMIN','系统管理员','1','1'),
 ('WORKFLOWADMIN','WORKFLOWADMIN','工作流管理员','1','0'),
 ('WORKFLOWCOMUSER','WORKFLOWCOMUSER','工作流普通人员','1','0');
/*!40000 ALTER TABLE `pub_roles` ENABLE KEYS */;


--
-- Definition of table `pub_scn_info`
--

DROP TABLE IF EXISTS `pub_scn_info`;
CREATE TABLE `pub_scn_info` (
  `PARAM` varchar(30) NOT NULL,
  `INST` varchar(20) NOT NULL,
  `VAL` int(11) NOT NULL,
  PRIMARY KEY (`PARAM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_scn_info`
--

/*!40000 ALTER TABLE `pub_scn_info` DISABLE KEYS */;
INSERT INTO `pub_scn_info` (`PARAM`,`INST`,`VAL`) VALUES 
 ('SCN','DEFAULT',3);
/*!40000 ALTER TABLE `pub_scn_info` ENABLE KEYS */;


--
-- Definition of table `pub_security_level`
--

DROP TABLE IF EXISTS `pub_security_level`;
CREATE TABLE `pub_security_level` (
  `SECURITY_LEVEL` int(11) NOT NULL,
  `LEVEL_NAME` varchar(60) NOT NULL,
  PRIMARY KEY (`SECURITY_LEVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_security_level`
--

/*!40000 ALTER TABLE `pub_security_level` DISABLE KEYS */;
INSERT INTO `pub_security_level` (`SECURITY_LEVEL`,`LEVEL_NAME`) VALUES 
 (0,'无秘密级'),
 (1,'秘密级-'),
 (2,'秘密级'),
 (3,'秘密级+'),
 (4,'机密级-'),
 (5,'机密级'),
 (6,'机密级+'),
 (7,'绝密级-'),
 (8,'绝密级'),
 (9,'绝密级+');
/*!40000 ALTER TABLE `pub_security_level` ENABLE KEYS */;


--
-- Definition of table `pub_security_log`
--

DROP TABLE IF EXISTS `pub_security_log`;
CREATE TABLE `pub_security_log` (
  `LOG_ID` varchar(30) NOT NULL,
  `SESSION_ID` varchar(128) NOT NULL,
  `USER_ID` varchar(30) NOT NULL,
  `USER_NAME` varchar(30) DEFAULT NULL,
  `USER_LEVEL` int(11) DEFAULT '0',
  `CORPORATION_ID` varchar(30) DEFAULT NULL,
  `CORPORATION_NAME` varchar(80) DEFAULT NULL,
  `LOG_TIME` varchar(30) NOT NULL,
  `REMOTEADDR` varchar(80) NOT NULL,
  `REMOTEHOST` varchar(80) NOT NULL,
  `REMOTEPORT` varchar(80) DEFAULT NULL,
  `LOCALADDR` varchar(80) NOT NULL,
  `LOCALHOST` varchar(80) NOT NULL,
  `LOCALPORT` varchar(80) DEFAULT NULL,
  `RESOURCE_ID` varchar(30) DEFAULT NULL,
  `RESOURCE_ALIAS` varchar(60) DEFAULT NULL,
  `SECURITY_LEVEL` int(11) DEFAULT '0',
  `LOG_TYPE` varchar(10) NOT NULL,
  `LOG_TYPE_NAME` varchar(60) NOT NULL,
  `LOG_CONTENT` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_security_log`
--

/*!40000 ALTER TABLE `pub_security_log` DISABLE KEYS */;
INSERT INTO `pub_security_log` (`LOG_ID`,`SESSION_ID`,`USER_ID`,`USER_NAME`,`USER_LEVEL`,`CORPORATION_ID`,`CORPORATION_NAME`,`LOG_TIME`,`REMOTEADDR`,`REMOTEHOST`,`REMOTEPORT`,`LOCALADDR`,`LOCALHOST`,`LOCALPORT`,`RESOURCE_ID`,`RESOURCE_ALIAS`,`SECURITY_LEVEL`,`LOG_TYPE`,`LOG_TYPE_NAME`,`LOG_CONTENT`) VALUES 
 ('008640327064429727943317802560','494D98E0C1B4A72473BFEFFBF013C28C','SUPERADMIN','管理员',9,'1','广州博冠','20121208 22:47:22','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'14','注销','注销'),
 ('018523198791381929269756515154','191372D3B8324CA87164D7A3F85C397D','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:40:58','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'14','注销','注销'),
 ('032553778459190835435021371860','2FE250D967ACD1D3329015C6222A15ED','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:18:54','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'11','登陆','登陆'),
 ('039540109944817433408902178584','71DBF68DF6F1EA98B4DEC5763E633D6A','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:44:30','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'11','登陆','登陆'),
 ('050579775979824008871942276283','40C68722A11D5642B5DB03452E1B45A4','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:20:37','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'14','注销','注销'),
 ('063404156988305358632452679260','A627ECDC4716F4426E2B468EE3E4C835','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:26:53','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'14','注销','注销'),
 ('071193550215883513659867801338','191372D3B8324CA87164D7A3F85C397D','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:26:57','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'11','登陆','登陆'),
 ('101515214260543111670903580159','0221EE7C2D4B0807AF5DE9680CA61875','superadmin','superadmin',0,'','','20121208 21:41:41','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'10','登陆失败','此帐号在系统中不存在，请确认您的帐户输入是否正确!'),
 ('181590218888977594436270695976','07DD1F036706F5DC62094A05EA89E551','SUPERADMIN','管理员',9,'1','广州博冠','20121209 10:26:38','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'11','登陆','登陆'),
 ('244081969848314237003085252816','78847953479A6E39E82E9575C93A24F2','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:42:59','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'11','登陆','登陆'),
 ('254893813664692572473112209893','4028ac813b7ae213013b7ae4c53a0003','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:24:02','127.0.0.1','127.0.0.1','52592','127.0.0.1','/ei/onlinehistquery.cmd','80','BSP031101','查询用户历史登录记录',0,'21','经授权访问','进行数据查询操作'),
 ('278436818559206803895958839437','07DD1F036706F5DC62094A05EA89E551','SUPERADMIN','管理员',9,'1','广州博冠','20121209 10:27:39','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'14','注销','注销'),
 ('298394212167362030455274716421','2FE250D967ACD1D3329015C6222A15ED','superadmin','superadmin',0,'','','20121208 22:14:35','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'10','登陆失败','此帐号在系统中不存在，请确认您的帐户输入是否正确!'),
 ('301712524255986867060187718813','4028ac813b7ae213013b7ae4c53a0003','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:24:00','127.0.0.1','127.0.0.1','52585','127.0.0.1','/ei/onlinequerying.cmd','80','BSP031001','查询在线用户',0,'21','经授权访问','进行数据查询操作'),
 ('303464014752922936894489618723','4028ac813b7af982013b7af982c70000','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:44:50','127.0.0.1','127.0.0.1','52862','127.0.0.1','/ei/pubidtable.cmd ,访问的方法为：forinsert','80','BSP000102','增加业务流水',0,'21','经授权访问','进行数据保存，数据内容为: [ id=, value=0, name=, cacheSize=0, prefix=, isPrefix=, idLength=0, isGlobal=null, organId=]'),
 ('310064842362869020203692916436','4028ac813b7ae213013b7ae4c53a0003','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:22:49','127.0.0.1','127.0.0.1','52569','127.0.0.1','/ei/resources.cmd ,访问的方法为：delete','80','BSP030504','删除功能资源',0,'21','经授权访问','进行数据删除，删除的数据主键为:null'),
 ('332257569516833947400373689128','2FE250D967ACD1D3329015C6222A15ED','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:20:06','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'14','注销','注销'),
 ('334507144522993438576978101422','494D98E0C1B4A72473BFEFFBF013C28C','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:46:47','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'11','登陆','登陆'),
 ('356467639971680109480702356318','4028ac813b7af982013b7af982c70000','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:45:10','127.0.0.1','127.0.0.1','52862','127.0.0.1','/ei/pubidtable.cmd ,访问的方法为：insert','80','BSP000102','增加业务流水',0,'21','经授权访问','进行数据保存，数据内容为: [ id=test, value=0, name=test, cacheSize=0, prefix=, isPrefix=0, idLength=0, isGlobal=1, organId=]'),
 ('384897435223780675469809952110','4028ac813b7ae213013b7ae4c53a0003','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:24:16','127.0.0.1','127.0.0.1','52600','127.0.0.1','/ei/onlinehistquerying.cmd','80','BSP031101','查询用户历史登录记录',0,'21','经授权访问','进行数据查询操作'),
 ('448642097144199622588965541494','E781D4A9CC3B0243B2FCD6BCA007BA4B','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:21:48','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'14','注销','注销'),
 ('455307414563370253131470190884','4028ac813b7ae213013b7ae4c53a0003','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:22:54','127.0.0.1','127.0.0.1','52584','127.0.0.1','/ei/module.cmd ,访问的方法为：delete','80','BSP030504','删除功能资源',0,'21','经授权访问','进行数据删除，删除的数据主键为:null'),
 ('455346366038397440414972944070','4028ac813b7ae213013b7ae4c53a0003','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:24:04','127.0.0.1','127.0.0.1','52600','127.0.0.1','/ei/onlinehistquerying.cmd','80','BSP031101','查询用户历史登录记录',0,'21','经授权访问','进行数据查询操作'),
 ('503867733354278719111950272147','4028ac813b7ae213013b7ae4c53a0003','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:22:39','127.0.0.1','127.0.0.1','52569','127.0.0.1','/ei/module.cmd ,访问的方法为：delete','80','BSP030504','删除功能资源',0,'21','经授权访问','进行数据删除，删除的数据主键为:null'),
 ('561359904673768270833969824137','191372D3B8324CA87164D7A3F85C397D','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:30:39','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'11','登陆','登陆'),
 ('570416309459891705691345502336','4028ac813b7ae213013b7ae4c53a0003','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:23:12','127.0.0.1','127.0.0.1','52585','127.0.0.1','/ei/module.cmd ,访问的方法为：delete','80','BSP030504','删除功能资源',0,'21','经授权访问','进行数据删除，删除的数据主键为:null'),
 ('573798055955827656759504593161','71DBF68DF6F1EA98B4DEC5763E633D6A','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:46:44','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'14','注销','注销'),
 ('594712374006802027958964519724','40C68722A11D5642B5DB03452E1B45A4','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:20:09','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'11','登陆','登陆'),
 ('603414123589216506017347753970','4028ac813b7ae213013b7ae4c53a0003','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:23:57','127.0.0.1','127.0.0.1','52592','127.0.0.1','/ei/onlinequery.cmd','80','BSP031001','查询在线用户',0,'21','经授权访问','进行数据查询操作'),
 ('605980697040282044328395830058','9855DD2BFDE644129B454D0914D8B736','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:41:01','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'11','登陆','登陆'),
 ('623590247447208800231753889636','4028ac813b7ae213013b7ae4c53a0003','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:23:09','127.0.0.1','127.0.0.1','52592','127.0.0.1','/ei/function.cmd ,访问的方法为：delete','80','BSP030504','删除功能资源',0,'21','经授权访问','进行数据删除，删除的数据主键为:null'),
 ('689520220580122193710632745662','4028ac813b7ae213013b7ae4c53a0003','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:23:05','127.0.0.1','127.0.0.1','52594','127.0.0.1','/ei/resources.cmd ,访问的方法为：delete','80','BSP030504','删除功能资源',0,'21','经授权访问','进行数据删除，删除的数据主键为:null'),
 ('801166358795561042067007046026','4028ac813b7ae213013b7ae4c53a0003','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:24:17','127.0.0.1','127.0.0.1','52600','127.0.0.1','/ei/onlinehistquerying.cmd','80','BSP031101','查询用户历史登录记录',0,'21','经授权访问','进行数据查询操作'),
 ('813253397027587672609314128931','191372D3B8324CA87164D7A3F85C397D','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:32:58','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'11','登陆','登陆'),
 ('819859508317846335264866774966','4028ac813b7ae213013b7ae4c53a0003','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:23:01','127.0.0.1','127.0.0.1','52594','127.0.0.1','/ei/function.cmd ,访问的方法为：delete','80','BSP030504','删除功能资源',0,'21','经授权访问','进行数据删除，删除的数据主键为:null'),
 ('824217721375546590543663526406','A627ECDC4716F4426E2B468EE3E4C835','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:21:51','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'11','登陆','登陆'),
 ('859876290342386224125882600740','4028ac813b7af982013b7af982c70000','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:45:00','127.0.0.1','127.0.0.1','52860','127.0.0.1','/ei/pubidtable.cmd ,访问的方法为：insert','80','BSP000102','增加业务流水',0,'21','经授权访问','进行数据保存，数据内容为:null'),
 ('908606545593432975572325079514','E781D4A9CC3B0243B2FCD6BCA007BA4B','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:20:40','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'11','登陆','登陆'),
 ('964633955053405065451060654995','9855DD2BFDE644129B454D0914D8B736','SUPERADMIN','管理员',9,'1','中国海洋石油总公司','20121208 22:42:57','127.0.0.1','127.0.0.1','*','server','server','*','---','---',0,'14','注销','注销');
/*!40000 ALTER TABLE `pub_security_log` ENABLE KEYS */;


--
-- Definition of table `pub_stru`
--

DROP TABLE IF EXISTS `pub_stru`;
CREATE TABLE `pub_stru` (
  `STRU_ID` varchar(200) NOT NULL,
  `ORGAN_ID` varchar(200) NOT NULL,
  `ORGAN_ALIAS` varchar(200) NOT NULL,
  `STRU_TYPE` varchar(10) NOT NULL,
  `PARENT_ID` varchar(200) DEFAULT NULL,
  `PRINCIPAL_ID` varchar(30) DEFAULT NULL,
  `CORPORATION_ID` varchar(200) DEFAULT NULL,
  `STRU_LEVEL` int(11) NOT NULL,
  `STRU_PATH` varchar(1000) NOT NULL,
  `STRU_ORDER` int(11) NOT NULL DEFAULT '1',
  `GLOBAL_ORDER` int(11) NOT NULL DEFAULT '1',
  `BEGIN_DATE` char(8) NOT NULL,
  `END_DATE` char(8) NOT NULL DEFAULT '99991231',
  `SCN` int(11) NOT NULL DEFAULT '-1',
  `IS_LEAF` char(1) NOT NULL DEFAULT '0',
  `IN_USE` char(1) NOT NULL DEFAULT '1',
  `DEPARTMENT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`STRU_ID`),
  KEY `PUBSTRU_FK2` (`STRU_TYPE`),
  KEY `IDX_PUB_STRU_01` (`ORGAN_ID`),
  KEY `IDX_PUB_STRU_02` (`PARENT_ID`),
  KEY `IDX_PUB_STRU_03` (`CORPORATION_ID`),
  KEY `IDX_PUB_STRU_04` (`STRU_PATH`(255)),
  CONSTRAINT `PUBSTRU_FK1` FOREIGN KEY (`ORGAN_ID`) REFERENCES `pub_organ` (`ORGAN_ID`),
  CONSTRAINT `PUBSTRU_FK2` FOREIGN KEY (`STRU_TYPE`) REFERENCES `pub_stru_type` (`STRU_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_stru`
--

/*!40000 ALTER TABLE `pub_stru` DISABLE KEYS */;
INSERT INTO `pub_stru` (`STRU_ID`,`ORGAN_ID`,`ORGAN_ALIAS`,`STRU_TYPE`,`PARENT_ID`,`PRINCIPAL_ID`,`CORPORATION_ID`,`STRU_LEVEL`,`STRU_PATH`,`STRU_ORDER`,`GLOBAL_ORDER`,`BEGIN_DATE`,`END_DATE`,`SCN`,`IS_LEAF`,`IN_USE`,`DEPARTMENT_ID`) VALUES 
 ('1','1','广州博冠','00','',NULL,'1',1,'1',1,1,'20121208','99991231',3,'0','1','1'),
 ('S00000000000101','O00000000000101','interfaceuser','00','1',NULL,'1',2,'1#S00000000000101',200,1,'20000101','99991231',3,'1','1','1');
/*!40000 ALTER TABLE `pub_stru` ENABLE KEYS */;


--
-- Definition of table `pub_stru_hist`
--

DROP TABLE IF EXISTS `pub_stru_hist`;
CREATE TABLE `pub_stru_hist` (
  `STRU_ID` varchar(200) NOT NULL,
  `ORGAN_ID` varchar(200) NOT NULL,
  `ORGAN_ALIAS` varchar(200) NOT NULL,
  `STRU_TYPE` varchar(10) NOT NULL,
  `PARENT_ID` varchar(200) DEFAULT NULL,
  `PRINCIPAL_ID` varchar(30) DEFAULT NULL,
  `CORPORATION_ID` varchar(200) DEFAULT NULL,
  `STRU_LEVEL` int(11) NOT NULL,
  `STRU_PATH` varchar(1000) NOT NULL,
  `STRU_ORDER` int(11) NOT NULL DEFAULT '1',
  `GLOBAL_ORDER` int(11) NOT NULL DEFAULT '1',
  `BEGIN_DATE` char(8) NOT NULL,
  `END_DATE` char(8) NOT NULL DEFAULT '99991231',
  `SCN` int(11) NOT NULL DEFAULT '-1',
  `IS_LEAF` char(1) NOT NULL DEFAULT '0',
  `IN_USE` char(1) NOT NULL DEFAULT '1',
  `DEPARTMENT_ID` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_stru_hist`
--

/*!40000 ALTER TABLE `pub_stru_hist` DISABLE KEYS */;
INSERT INTO `pub_stru_hist` (`STRU_ID`,`ORGAN_ID`,`ORGAN_ALIAS`,`STRU_TYPE`,`PARENT_ID`,`PRINCIPAL_ID`,`CORPORATION_ID`,`STRU_LEVEL`,`STRU_PATH`,`STRU_ORDER`,`GLOBAL_ORDER`,`BEGIN_DATE`,`END_DATE`,`SCN`,`IS_LEAF`,`IN_USE`,`DEPARTMENT_ID`) VALUES 
 ('1','1','中国海洋石油总公司','00',NULL,'','1',1,'1',1,1,'20000101','99991231',3,'0','1','1');
/*!40000 ALTER TABLE `pub_stru_hist` ENABLE KEYS */;


--
-- Definition of table `pub_stru_rule`
--

DROP TABLE IF EXISTS `pub_stru_rule`;
CREATE TABLE `pub_stru_rule` (
  `RULE_ID` varchar(20) NOT NULL,
  `STRU_TYPE` varchar(10) NOT NULL,
  `SRC_REF` varchar(10) NOT NULL,
  `TARGET_REF` varchar(10) NOT NULL,
  `RULE_NOTE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`RULE_ID`),
  KEY `PUBSTRURULE_FK1` (`SRC_REF`),
  KEY `PUBSTRURULE_FK2` (`TARGET_REF`),
  KEY `PUBSTRURULE_FK3` (`STRU_TYPE`),
  CONSTRAINT `PUBSTRURULE_FK1` FOREIGN KEY (`SRC_REF`) REFERENCES `pub_organ_type` (`ORGAN_TYPE`),
  CONSTRAINT `PUBSTRURULE_FK2` FOREIGN KEY (`TARGET_REF`) REFERENCES `pub_organ_type` (`ORGAN_TYPE`),
  CONSTRAINT `PUBSTRURULE_FK3` FOREIGN KEY (`STRU_TYPE`) REFERENCES `pub_stru_type` (`STRU_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_stru_rule`
--

/*!40000 ALTER TABLE `pub_stru_rule` DISABLE KEYS */;
INSERT INTO `pub_stru_rule` (`RULE_ID`,`STRU_TYPE`,`SRC_REF`,`TARGET_REF`,`RULE_NOTE`) VALUES 
 ('00:1:1','00','1','1','法人单位下可以成立新的法人单位'),
 ('00:1:2','00','1','2','法人单位下可以成立新的部门'),
 ('00:1:6','00','1','6','法人单位下可以设置岗位'),
 ('00:1:8','00','1','8','法人单位下可以委派职工'),
 ('00:2:2','00','2','2','部门下可以成立新的部门'),
 ('00:2:6','00','2','6','部门下可以设置岗位'),
 ('00:6:8','00','6','8','岗位下可以委派职工');
/*!40000 ALTER TABLE `pub_stru_rule` ENABLE KEYS */;


--
-- Definition of table `pub_stru_type`
--

DROP TABLE IF EXISTS `pub_stru_type`;
CREATE TABLE `pub_stru_type` (
  `STRU_TYPE` varchar(10) NOT NULL,
  `TYPE_NAME` varchar(60) NOT NULL,
  `ROOT_ID` varchar(30) NOT NULL,
  `IS_DEFAULT` char(1) NOT NULL DEFAULT '0',
  `NOTE` varchar(250) DEFAULT NULL,
  `IN_USE` char(1) NOT NULL DEFAULT '1',
  `IS_APPLY_RULE` char(1) DEFAULT '1',
  `IS_MATRIX` char(1) DEFAULT '1',
  `IS_KEEP_RECORD` char(1) DEFAULT '1',
  PRIMARY KEY (`STRU_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_stru_type`
--

/*!40000 ALTER TABLE `pub_stru_type` DISABLE KEYS */;
INSERT INTO `pub_stru_type` (`STRU_TYPE`,`TYPE_NAME`,`ROOT_ID`,`IS_DEFAULT`,`NOTE`,`IN_USE`,`IS_APPLY_RULE`,`IS_MATRIX`,`IS_KEEP_RECORD`) VALUES 
 ('00','人力资源','1','1','人力资源','1','1','1','1');
/*!40000 ALTER TABLE `pub_stru_type` ENABLE KEYS */;


--
-- Definition of table `pub_stru_type_ref`
--

DROP TABLE IF EXISTS `pub_stru_type_ref`;
CREATE TABLE `pub_stru_type_ref` (
  `USER_ID` varchar(30) NOT NULL,
  `STRU_TYPE` varchar(10) NOT NULL,
  `STRU_ID` varchar(30) NOT NULL,
  `ORGAN_NAME` varchar(80) NOT NULL,
  PRIMARY KEY (`USER_ID`,`STRU_TYPE`),
  KEY `PUBSTRUTYPEREF_FK2` (`STRU_TYPE`),
  KEY `PUBSTRUTYPEREF_FK3` (`STRU_ID`),
  CONSTRAINT `PUBSTRUTYPEREF_FK1` FOREIGN KEY (`USER_ID`) REFERENCES `pub_users` (`USER_ID`),
  CONSTRAINT `PUBSTRUTYPEREF_FK2` FOREIGN KEY (`STRU_TYPE`) REFERENCES `pub_stru_type` (`STRU_TYPE`),
  CONSTRAINT `PUBSTRUTYPEREF_FK3` FOREIGN KEY (`STRU_ID`) REFERENCES `pub_stru` (`STRU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_stru_type_ref`
--

/*!40000 ALTER TABLE `pub_stru_type_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_stru_type_ref` ENABLE KEYS */;


--
-- Definition of table `pub_stru_version`
--

DROP TABLE IF EXISTS `pub_stru_version`;
CREATE TABLE `pub_stru_version` (
  `VERSION` varchar(30) NOT NULL,
  `VERSION_DATE` char(8) NOT NULL,
  `VERSION_USER` varchar(30) DEFAULT NULL,
  `END_SCN` int(11) NOT NULL,
  `VERSION_NOTE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`VERSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_stru_version`
--

/*!40000 ALTER TABLE `pub_stru_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_stru_version` ENABLE KEYS */;


--
-- Definition of table `pub_templates`
--

DROP TABLE IF EXISTS `pub_templates`;
CREATE TABLE `pub_templates` (
  `TEMPLATE_ID` varchar(30) NOT NULL,
  `TEMPLATE_NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_templates`
--

/*!40000 ALTER TABLE `pub_templates` DISABLE KEYS */;
INSERT INTO `pub_templates` (`TEMPLATE_ID`,`TEMPLATE_NAME`) VALUES 
 ('1','缺省模板');
/*!40000 ALTER TABLE `pub_templates` ENABLE KEYS */;


--
-- Definition of table `pub_trole_opts`
--

DROP TABLE IF EXISTS `pub_trole_opts`;
CREATE TABLE `pub_trole_opts` (
  `ROLE_ID` varchar(30) NOT NULL,
  `RESOURCE_ID` varchar(30) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`RESOURCE_ID`),
  KEY `PUBTROLEOPTS_FK2` (`RESOURCE_ID`),
  CONSTRAINT `PUBTROLEOPTS_FK1` FOREIGN KEY (`ROLE_ID`) REFERENCES `pub_troles` (`ROLE_ID`),
  CONSTRAINT `PUBTROLEOPTS_FK2` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `pub_resources` (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_trole_opts`
--

/*!40000 ALTER TABLE `pub_trole_opts` DISABLE KEYS */;
INSERT INTO `pub_trole_opts` (`ROLE_ID`,`RESOURCE_ID`) VALUES 
 ('SUPERADMIN','applyDaiban'),
 ('SUPERADMIN','applyDraft'),
 ('SUPERADMIN','attachment001'),
 ('GPUBLIC','BASE000101'),
 ('SUPERADMIN','BASE000101'),
 ('GPUBLIC','BASE000201'),
 ('SUPERADMIN','BASE000201'),
 ('GPUBLIC','BASE000301'),
 ('SUPERADMIN','BASE000301'),
 ('GPUBLIC','BASE000401'),
 ('SUPERADMIN','BASE000401'),
 ('GPUBLIC','BASE000501'),
 ('SUPERADMIN','BASE000501'),
 ('GPUBLIC','BASE000601'),
 ('SUPERADMIN','BASE000601'),
 ('SYSADMIN','BASE000601'),
 ('GPUBLIC','BASE000602'),
 ('SUPERADMIN','BASE000602'),
 ('SYSADMIN','BASE000602'),
 ('GPUBLIC','BASE000603'),
 ('SUPERADMIN','BASE000603'),
 ('SYSADMIN','BASE000603'),
 ('GPUBLIC','BASE000604'),
 ('SUPERADMIN','BASE000604'),
 ('SYSADMIN','BASE000604'),
 ('GPUBLIC','BASE000605'),
 ('SUPERADMIN','BASE000605'),
 ('SYSADMIN','BASE000605'),
 ('GPUBLIC','BASE000606'),
 ('SUPERADMIN','BASE000606'),
 ('SYSADMIN','BASE000606'),
 ('GPUBLIC','BASE000607'),
 ('SUPERADMIN','BASE000607'),
 ('SYSADMIN','BASE000607'),
 ('GPUBLIC','BASE000608'),
 ('SUPERADMIN','BASE000608'),
 ('SYSADMIN','BASE000608'),
 ('GPUBLIC','BASE000609'),
 ('SUPERADMIN','BASE000609'),
 ('SYSADMIN','BASE000609'),
 ('GPUBLIC','BASE000610'),
 ('SUPERADMIN','BASE000610'),
 ('SYSADMIN','BASE000610'),
 ('GPUBLIC','BASE000611'),
 ('SUPERADMIN','BASE000611'),
 ('SYSADMIN','BASE000611'),
 ('GPUBLIC','BASE000612'),
 ('SUPERADMIN','BASE000612'),
 ('SYSADMIN','BASE000612'),
 ('GPUBLIC','BASE000613'),
 ('SUPERADMIN','BASE000613'),
 ('SYSADMIN','BASE000613'),
 ('GPUBLIC','BASE000614'),
 ('SUPERADMIN','BASE000614'),
 ('SYSADMIN','BASE000614'),
 ('GPUBLIC','BASE000701'),
 ('SUPERADMIN','BASE000701'),
 ('SYSADMIN','BASE000701'),
 ('GPUBLIC','BASE000801'),
 ('SUPERADMIN','BASE000801'),
 ('SYSADMIN','BASE000801'),
 ('SUPERADMIN','batchapply002'),
 ('SUPERADMIN','BSP000101'),
 ('SYSADMIN','BSP000101'),
 ('SUPERADMIN','BSP000102'),
 ('SYSADMIN','BSP000102'),
 ('SUPERADMIN','BSP000103'),
 ('SYSADMIN','BSP000103'),
 ('SUPERADMIN','BSP000104'),
 ('SYSADMIN','BSP000104'),
 ('SUPERADMIN','BSP010101'),
 ('SUPERADMIN','BSP010102'),
 ('SUPERADMIN','BSP010103'),
 ('SUPERADMIN','BSP010104'),
 ('SUPERADMIN','BSP010201'),
 ('SUPERADMIN','BSP010202'),
 ('SUPERADMIN','BSP010203'),
 ('SUPERADMIN','BSP010204'),
 ('SUPERADMIN','BSP010301'),
 ('SUPERADMIN','BSP010302'),
 ('SUPERADMIN','BSP010303'),
 ('SUPERADMIN','BSP010304'),
 ('SUPERADMIN','BSP010401'),
 ('SUPERADMIN','BSP010402'),
 ('SUPERADMIN','BSP010403'),
 ('SUPERADMIN','BSP010404'),
 ('SUPERADMIN','BSP010501'),
 ('SUPERADMIN','BSP010502'),
 ('SUPERADMIN','BSP010503'),
 ('SUPERADMIN','BSP010504'),
 ('SUPERADMIN','BSP010601'),
 ('SUPERADMIN','BSP010602'),
 ('SUPERADMIN','BSP010603'),
 ('SUPERADMIN','BSP010604'),
 ('SUPERADMIN','BSP010701'),
 ('SUPERADMIN','BSP010702'),
 ('SUPERADMIN','BSP010703'),
 ('SUPERADMIN','BSP010704'),
 ('SUPERADMIN','BSP010705'),
 ('SUPERADMIN','BSP010706'),
 ('SUPERADMIN','BSP010707'),
 ('SUPERADMIN','BSP010708'),
 ('SUPERADMIN','BSP010709'),
 ('SUPERADMIN','BSP010801'),
 ('SUPERADMIN','BSP010802'),
 ('SUPERADMIN','BSP010803'),
 ('SUPERADMIN','BSP010804'),
 ('SUPERADMIN','BSP010901'),
 ('SUPERADMIN','BSP010902'),
 ('SUPERADMIN','BSP010903'),
 ('SUPERADMIN','BSP010904'),
 ('SUPERADMIN','BSP011001'),
 ('SUPERADMIN','BSP011002'),
 ('SUPERADMIN','BSP011003'),
 ('SUPERADMIN','BSP011004'),
 ('SUPERADMIN','BSP011101'),
 ('SUPERADMIN','BSP011102'),
 ('SUPERADMIN','BSP011103'),
 ('SUPERADMIN','BSP011104'),
 ('SUPERADMIN','BSP020101'),
 ('SUPERADMIN','BSP020102'),
 ('SUPERADMIN','BSP020103'),
 ('SUPERADMIN','BSP020104'),
 ('SUPERADMIN','BSP020201'),
 ('SUPERADMIN','BSP020202'),
 ('SUPERADMIN','BSP020203'),
 ('SUPERADMIN','BSP020204'),
 ('SUPERADMIN','BSP030101'),
 ('SYSADMIN','BSP030101'),
 ('SUPERADMIN','BSP030201'),
 ('SYSADMIN','BSP030201'),
 ('SUPERADMIN','BSP030301'),
 ('SYSADMIN','BSP030301'),
 ('SUPERADMIN','BSP030302'),
 ('SYSADMIN','BSP030302'),
 ('SUPERADMIN','BSP030303'),
 ('SYSADMIN','BSP030303'),
 ('SUPERADMIN','BSP030304'),
 ('SYSADMIN','BSP030304'),
 ('SUPERADMIN','BSP030305'),
 ('SYSADMIN','BSP030305'),
 ('SUPERADMIN','BSP030306'),
 ('SYSADMIN','BSP030306'),
 ('SUPERADMIN','BSP030307'),
 ('SYSADMIN','BSP030307'),
 ('SUPERADMIN','BSP030308'),
 ('SYSADMIN','BSP030308'),
 ('SUPERADMIN','BSP030309'),
 ('SYSADMIN','BSP030309'),
 ('SUPERADMIN','BSP030310'),
 ('SYSADMIN','BSP030310'),
 ('SUPERADMIN','BSP030401'),
 ('SYSADMIN','BSP030401'),
 ('SUPERADMIN','BSP030402'),
 ('SYSADMIN','BSP030402'),
 ('SUPERADMIN','BSP030403'),
 ('SYSADMIN','BSP030403'),
 ('SUPERADMIN','BSP030404'),
 ('SYSADMIN','BSP030404'),
 ('SUPERADMIN','BSP030501'),
 ('SYSADMIN','BSP030501'),
 ('SUPERADMIN','BSP0305010'),
 ('SYSADMIN','BSP0305010'),
 ('SUPERADMIN','BSP0305011'),
 ('SYSADMIN','BSP0305011'),
 ('SUPERADMIN','BSP0305012'),
 ('SYSADMIN','BSP0305012'),
 ('SUPERADMIN','BSP0305013'),
 ('SYSADMIN','BSP0305013'),
 ('SUPERADMIN','BSP0305014'),
 ('SYSADMIN','BSP0305014'),
 ('SUPERADMIN','BSP030502'),
 ('SYSADMIN','BSP030502'),
 ('SUPERADMIN','BSP030503'),
 ('SYSADMIN','BSP030503'),
 ('SUPERADMIN','BSP030504'),
 ('SYSADMIN','BSP030504'),
 ('SUPERADMIN','BSP030505'),
 ('SYSADMIN','BSP030505'),
 ('SUPERADMIN','BSP030506'),
 ('SYSADMIN','BSP030506'),
 ('SUPERADMIN','BSP030507'),
 ('SYSADMIN','BSP030507'),
 ('SUPERADMIN','BSP030508'),
 ('SYSADMIN','BSP030508'),
 ('SUPERADMIN','BSP030509'),
 ('SYSADMIN','BSP030509'),
 ('SUPERADMIN','BSP030510'),
 ('SYSADMIN','BSP030510'),
 ('SUPERADMIN','BSP030511'),
 ('SYSADMIN','BSP030511'),
 ('SUPERADMIN','BSP030601'),
 ('SYSADMIN','BSP030601'),
 ('SUPERADMIN','BSP030602'),
 ('SYSADMIN','BSP030602'),
 ('SUPERADMIN','BSP030603'),
 ('SYSADMIN','BSP030603'),
 ('SUPERADMIN','BSP030604'),
 ('SYSADMIN','BSP030604'),
 ('SUPERADMIN','BSP030701'),
 ('SUPERADMIN','BSP030801'),
 ('SYSADMIN','BSP030801'),
 ('SUPERADMIN','BSP030901'),
 ('SUPERADMIN','BSP031001'),
 ('SYSADMIN','BSP031001'),
 ('SUPERADMIN','BSP031002'),
 ('SYSADMIN','BSP031002'),
 ('SUPERADMIN','BSP031101'),
 ('SYSADMIN','BSP031101'),
 ('SUPERADMIN','BSP031102'),
 ('SYSADMIN','BSP031102'),
 ('SUPERADMIN','BSP031201'),
 ('SYSADMIN','BSP031201'),
 ('SUPERADMIN','BSP031202'),
 ('SYSADMIN','BSP031202'),
 ('SUPERADMIN','BSP031203'),
 ('SYSADMIN','BSP031203'),
 ('SUPERADMIN','BSP031301'),
 ('SUPERADMIN','BSP031302'),
 ('SUPERADMIN','BSP031401'),
 ('SUPERADMIN','BSP031402'),
 ('SUPERADMIN','BSP031403'),
 ('SUPERADMIN','BSP031404'),
 ('SUPERADMIN','BSP040101'),
 ('SYSADMIN','BSP040101'),
 ('SUPERADMIN','BSP040102'),
 ('SYSADMIN','BSP040102'),
 ('SUPERADMIN','BSP040103'),
 ('SYSADMIN','BSP040103'),
 ('SUPERADMIN','BSP040104'),
 ('SYSADMIN','BSP040104'),
 ('SUPERADMIN','BSP040201'),
 ('SYSADMIN','BSP040201'),
 ('SUPERADMIN','BSP040202'),
 ('SYSADMIN','BSP040202'),
 ('SUPERADMIN','BSP040203'),
 ('SYSADMIN','BSP040203'),
 ('SUPERADMIN','BSP040301'),
 ('SYSADMIN','BSP040301'),
 ('SUPERADMIN','BSP040302'),
 ('SYSADMIN','BSP040302'),
 ('SUPERADMIN','BSP040303'),
 ('SYSADMIN','BSP040303'),
 ('SUPERADMIN','BSP040304'),
 ('SYSADMIN','BSP040304'),
 ('SUPERADMIN','BSP040305'),
 ('SYSADMIN','BSP040305'),
 ('SUPERADMIN','BSP040306'),
 ('SYSADMIN','BSP040306'),
 ('SUPERADMIN','BSP040307'),
 ('SYSADMIN','BSP040307'),
 ('SUPERADMIN','BSP040308'),
 ('SYSADMIN','BSP040308'),
 ('SUPERADMIN','BSP040309'),
 ('SYSADMIN','BSP040309'),
 ('SUPERADMIN','BSP040310'),
 ('SYSADMIN','BSP040310'),
 ('SUPERADMIN','BSP040311'),
 ('SYSADMIN','BSP040311'),
 ('SUPERADMIN','BSP040312'),
 ('SYSADMIN','BSP040312'),
 ('SUPERADMIN','BSP040313'),
 ('SYSADMIN','BSP040313'),
 ('SUPERADMIN','BSP040401'),
 ('SYSADMIN','BSP040401'),
 ('SUPERADMIN','BSPDEST0101'),
 ('SYSADMIN','BSPDEST0101'),
 ('SUPERADMIN','BUOBJECT02'),
 ('SUPERADMIN','BUTRANSFER01'),
 ('SUPERADMIN','BUTRANSFER02'),
 ('SUPERADMIN','buyPeriodSetting'),
 ('SUPERADMIN','catalog001'),
 ('SUPERADMIN','catalogCommon'),
 ('SUPERADMIN','catalogNo02'),
 ('SUPERADMIN','CentralCatalog0008'),
 ('SUPERADMIN','CentralCatalog0010'),
 ('SUPERADMIN','centralCheck1'),
 ('SUPERADMIN','centralCheck2'),
 ('SUPERADMIN','centralManage2'),
 ('SUPERADMIN','centralMange1'),
 ('SUPERADMIN','centralMerge1'),
 ('SUPERADMIN','centralMerge2'),
 ('SUPERADMIN','centralNo1'),
 ('SUPERADMIN','centralNo2'),
 ('SUPERADMIN','CentralPurchaseDetails01'),
 ('SUPERADMIN','centrialPurchaseDivision'),
 ('SUPERADMIN','changeRfx01'),
 ('SUPERADMIN','chooseHeadStatic01'),
 ('SUPERADMIN','EXCEL03'),
 ('SUPERADMIN','EXCELIMPORT003'),
 ('SUPERADMIN','FEETYPE002'),
 ('SUPERADMIN','FEETYPE003'),
 ('SUPERADMIN','HandledPlan0101'),
 ('SUPERADMIN','IMPORTPLAN03'),
 ('SUPERADMIN','measure001'),
 ('SUPERADMIN','MH002'),
 ('SUPERADMIN','MP_CMP_MESSAG01'),
 ('SYSADMIN','MP_CMP_MESSAG01'),
 ('SUPERADMIN','MP_CMP_MESSAG02'),
 ('SYSADMIN','MP_CMP_MESSAG02'),
 ('SUPERADMIN','MP_MESSAG01'),
 ('SYSADMIN','MP_MESSAG01'),
 ('SUPERADMIN','MP_MESSAG02'),
 ('SYSADMIN','MP_MESSAG02'),
 ('SUPERADMIN','MP_MESSAG_LOG01'),
 ('SYSADMIN','MP_MESSAG_LOG01'),
 ('SUPERADMIN','MP_MESSAG_LOG02'),
 ('SYSADMIN','MP_MESSAG_LOG02'),
 ('SUPERADMIN','MyPlan0101'),
 ('SUPERADMIN','PlanManage0101'),
 ('SUPERADMIN','PlanManage0102'),
 ('SUPERADMIN','PlanProcess0101'),
 ('SUPERADMIN','PR00030101'),
 ('SUPERADMIN','PR00030201'),
 ('SUPERADMIN','PR00030202'),
 ('SUPERADMIN','PR00030301'),
 ('SUPERADMIN','PR00030401'),
 ('SUPERADMIN','PR00030402'),
 ('SUPERADMIN','PR00030501'),
 ('SUPERADMIN','PR00030601'),
 ('SUPERADMIN','PR00030602'),
 ('SUPERADMIN','PR00030701'),
 ('SUPERADMIN','PR00030711'),
 ('SUPERADMIN','PR00030801'),
 ('SUPERADMIN','PR00030802'),
 ('SUPERADMIN','PR098977'),
 ('SUPERADMIN','PRC0003'),
 ('SUPERADMIN','prc022165486'),
 ('SUPERADMIN','prc256879'),
 ('SUPERADMIN','prc2884569'),
 ('SUPERADMIN','prc3258646'),
 ('SUPERADMIN','prcbr010001'),
 ('SUPERADMIN','prcbr010004'),
 ('SUPERADMIN','prcbr030001'),
 ('SUPERADMIN','prccp010002'),
 ('SUPERADMIN','prccp01000205'),
 ('SUPERADMIN','prccp020001'),
 ('SUPERADMIN','prccp030001'),
 ('SUPERADMIN','PRHEAD0101'),
 ('SUPERADMIN','PRLOC0101'),
 ('SUPERADMIN','PROCUREMENTWAYS002'),
 ('SUPERADMIN','PRW_APPROVETACTIC01'),
 ('SUPERADMIN','PRW_APPROVETACTIC02'),
 ('SUPERADMIN','PRW_APPROVETACTIC_ACT01'),
 ('SUPERADMIN','PRW_APPROVETACTIC_ACT02'),
 ('SUPERADMIN','PRW_HEADPRAPPLY01'),
 ('SUPERADMIN','PRW_HEADPRAPPLY02'),
 ('SUPERADMIN','PRW_MAINTAINPROJNAME01'),
 ('SUPERADMIN','PRW_PRPOSITION_MANAGE01'),
 ('SUPERADMIN','PRW_PRPOSITION_MANAGE02'),
 ('SUPERADMIN','PRW_SCREENFIELD01'),
 ('SUPERADMIN','PRW_SCREENFIELD02'),
 ('SUPERADMIN','PRW_TACTIC_INSTANCE01'),
 ('SUPERADMIN','PRW_TACTIC_INSTANCE02'),
 ('SUPERADMIN','PUBTOOL010101'),
 ('SYSADMIN','PUBTOOL010101'),
 ('SUPERADMIN','PUBTOOL010102'),
 ('SYSADMIN','PUBTOOL010102'),
 ('SUPERADMIN','PUBTOOL010103'),
 ('SYSADMIN','PUBTOOL010103'),
 ('SUPERADMIN','PUB_COMHELP01'),
 ('SUPERADMIN','PUB_COMHELP02'),
 ('SUPERADMIN','PurchaseRequisition004'),
 ('SUPERADMIN','PurchaseRequisition013'),
 ('SUPERADMIN','PurchaseRequisitionSaveAction1'),
 ('SUPERADMIN','RevokeApply01'),
 ('SUPERADMIN','rfxform02url'),
 ('SUPERADMIN','rfxform03'),
 ('SUPERADMIN','RFXTEMP002'),
 ('SUPERADMIN','RFXTEMP003'),
 ('SUPERADMIN','sccheckroleparams00101'),
 ('SUPERADMIN','scmCategorySelector01'),
 ('SUPERADMIN','scmProductSelector01'),
 ('SUPERADMIN','scmUserSelector01'),
 ('SUPERADMIN','seluserhelp0001'),
 ('SUPERADMIN','sysindex013221r1'),
 ('SUPERADMIN','sysrepfunres01'),
 ('SUPERADMIN','SYS_MESSAG01'),
 ('SUPERADMIN','SYS_MESSAG02'),
 ('SUPERADMIN','taskinfoquerynew0001'),
 ('SUPERADMIN','WFREPORT1501'),
 ('WORKFLOWADMIN','WFREPORT1501'),
 ('SUPERADMIN','WFREPORT1502'),
 ('WORKFLOWADMIN','WFREPORT1502'),
 ('SUPERADMIN','WFREPORT1503'),
 ('WORKFLOWADMIN','WFREPORT1503'),
 ('SUPERADMIN','WFREPORT1504'),
 ('WORKFLOWADMIN','WFREPORT1504'),
 ('SUPERADMIN','WFREPORT1505'),
 ('WORKFLOWADMIN','WFREPORT1505'),
 ('SUPERADMIN','WFREPORT1506'),
 ('WORKFLOWADMIN','WFREPORT1506'),
 ('SUPERADMIN','WFREPORT1507'),
 ('WORKFLOWADMIN','WFREPORT1507'),
 ('SUPERADMIN','WFREPORT1508'),
 ('WORKFLOWADMIN','WFREPORT1508'),
 ('SUPERADMIN','WFREPORT1509'),
 ('WORKFLOWADMIN','WFREPORT1509'),
 ('SUPERADMIN','WFREPORT1510'),
 ('WORKFLOWADMIN','WFREPORT1510'),
 ('SUPERADMIN','WFREPORT1511'),
 ('WORKFLOWADMIN','WFREPORT1511'),
 ('SUPERADMIN','WFREPORT1512'),
 ('WORKFLOWADMIN','WFREPORT1512'),
 ('SUPERADMIN','WFREPORT1601'),
 ('WORKFLOWCOMUSER','WFREPORT1601'),
 ('SUPERADMIN','WFREPORT1602'),
 ('WORKFLOWCOMUSER','WFREPORT1602'),
 ('SUPERADMIN','WFREPORT1603'),
 ('WORKFLOWCOMUSER','WFREPORT1603'),
 ('SUPERADMIN','WFREPORT1604'),
 ('WORKFLOWCOMUSER','WFREPORT1604'),
 ('SUPERADMIN','WF_MANAGE_FILES01'),
 ('SUPERADMIN','WF_MANAGE_FILES02'),
 ('SUPERADMIN','WF_PROCESS_FILES01'),
 ('SUPERADMIN','WF_PROCESS_FILES02'),
 ('SUPERADMIN','WF_PROCESS_TYPE01'),
 ('SUPERADMIN','WF_PROCESS_TYPE02'),
 ('SUPERADMIN','WORKFLOW0101'),
 ('WORKFLOWADMIN','WORKFLOW0101'),
 ('SUPERADMIN','WORKFLOW0102'),
 ('WORKFLOWADMIN','WORKFLOW0102'),
 ('SUPERADMIN','WORKFLOW0103'),
 ('WORKFLOWADMIN','WORKFLOW0103'),
 ('SUPERADMIN','WORKFLOW0104'),
 ('WORKFLOWADMIN','WORKFLOW0104'),
 ('SUPERADMIN','WORKFLOW0105'),
 ('WORKFLOWCOMUSER','WORKFLOW0105'),
 ('SUPERADMIN','WORKFLOW0106'),
 ('SUPERADMIN','WORKFLOW0201'),
 ('WORKFLOWADMIN','WORKFLOW0201'),
 ('SUPERADMIN','WORKFLOW0202'),
 ('WORKFLOWADMIN','WORKFLOW0202'),
 ('SUPERADMIN','WORKFLOW0203'),
 ('WORKFLOWADMIN','WORKFLOW0203'),
 ('SUPERADMIN','WORKFLOW0204'),
 ('WORKFLOWADMIN','WORKFLOW0204'),
 ('SUPERADMIN','WORKFLOW0205'),
 ('WORKFLOWCOMUSER','WORKFLOW0205'),
 ('SUPERADMIN','WORKFLOW0206'),
 ('WORKFLOWADMIN','WORKFLOW0206'),
 ('SUPERADMIN','WORKFLOW0207'),
 ('SUPERADMIN','WORKFLOW0301'),
 ('WORKFLOWADMIN','WORKFLOW0301'),
 ('SUPERADMIN','WORKFLOW0302'),
 ('WORKFLOWADMIN','WORKFLOW0302'),
 ('SUPERADMIN','WORKFLOW0303'),
 ('WORKFLOWADMIN','WORKFLOW0303'),
 ('SUPERADMIN','WORKFLOW0304'),
 ('WORKFLOWADMIN','WORKFLOW0304'),
 ('SUPERADMIN','WORKFLOW0305'),
 ('WORKFLOWCOMUSER','WORKFLOW0305'),
 ('SUPERADMIN','WORKFLOW0306'),
 ('WORKFLOWADMIN','WORKFLOW0306'),
 ('SUPERADMIN','WORKFLOW0307'),
 ('WORKFLOWADMIN','WORKFLOW0307'),
 ('SUPERADMIN','WORKFLOW0308'),
 ('WORKFLOWADMIN','WORKFLOW0308'),
 ('SUPERADMIN','WORKFLOW0309'),
 ('WORKFLOWCOMUSER','WORKFLOW0309'),
 ('SUPERADMIN','WORKFLOW0400'),
 ('SUPERADMIN','WORKFLOW0401'),
 ('WORKFLOWADMIN','WORKFLOW0401'),
 ('SUPERADMIN','WORKFLOW0402'),
 ('WORKFLOWADMIN','WORKFLOW0402'),
 ('SUPERADMIN','WORKFLOW0403'),
 ('WORKFLOWADMIN','WORKFLOW0403'),
 ('SUPERADMIN','WORKFLOW0404'),
 ('WORKFLOWADMIN','WORKFLOW0404'),
 ('SUPERADMIN','WORKFLOW0405'),
 ('SUPERADMIN','WORKFLOW0406'),
 ('SUPERADMIN','WORKFLOW0407'),
 ('SUPERADMIN','WORKFLOW0501'),
 ('WORKFLOWADMIN','WORKFLOW0501'),
 ('SUPERADMIN','WORKFLOW0502'),
 ('WORKFLOWADMIN','WORKFLOW0502'),
 ('SUPERADMIN','WORKFLOW0503'),
 ('WORKFLOWADMIN','WORKFLOW0503'),
 ('SUPERADMIN','WORKFLOW0504'),
 ('WORKFLOWADMIN','WORKFLOW0504'),
 ('SUPERADMIN','WORKFLOW0505'),
 ('WORKFLOWCOMUSER','WORKFLOW0505'),
 ('SUPERADMIN','WORKFLOW0601'),
 ('WORKFLOWCOMUSER','WORKFLOW0601'),
 ('SUPERADMIN','WORKFLOW0602'),
 ('WORKFLOWCOMUSER','WORKFLOW0602'),
 ('SUPERADMIN','WORKFLOW0603'),
 ('WORKFLOWCOMUSER','WORKFLOW0603'),
 ('SUPERADMIN','WORKFLOW0604'),
 ('WORKFLOWCOMUSER','WORKFLOW0604'),
 ('SUPERADMIN','WORKFLOW0605'),
 ('WORKFLOWCOMUSER','WORKFLOW0605'),
 ('SUPERADMIN','WORKFLOW0606'),
 ('WORKFLOWCOMUSER','WORKFLOW0606'),
 ('SUPERADMIN','WORKFLOW0607'),
 ('WORKFLOWCOMUSER','WORKFLOW0607'),
 ('SUPERADMIN','WORKFLOW0608'),
 ('WORKFLOWCOMUSER','WORKFLOW0608'),
 ('SUPERADMIN','WORKFLOW0609'),
 ('WORKFLOWCOMUSER','WORKFLOW0609'),
 ('SUPERADMIN','WORKFLOW0610'),
 ('WORKFLOWCOMUSER','WORKFLOW0610'),
 ('SUPERADMIN','WORKFLOW0611'),
 ('WORKFLOWCOMUSER','WORKFLOW0611'),
 ('SUPERADMIN','WORKFLOW0701'),
 ('WORKFLOWCOMUSER','WORKFLOW0701'),
 ('SUPERADMIN','WORKFLOW0702'),
 ('WORKFLOWCOMUSER','WORKFLOW0702'),
 ('SUPERADMIN','WORKFLOW0703'),
 ('WORKFLOWCOMUSER','WORKFLOW0703'),
 ('SUPERADMIN','WORKFLOW0704'),
 ('WORKFLOWADMIN','WORKFLOW0704'),
 ('WORKFLOWCOMUSER','WORKFLOW0704'),
 ('SUPERADMIN','WORKFLOW0801'),
 ('WORKFLOWCOMUSER','WORKFLOW0801'),
 ('SUPERADMIN','WORKFLOW0802'),
 ('WORKFLOWCOMUSER','WORKFLOW0802'),
 ('SUPERADMIN','WORKFLOW0803'),
 ('WORKFLOWCOMUSER','WORKFLOW0803'),
 ('SUPERADMIN','WORKFLOW0804'),
 ('WORKFLOWCOMUSER','WORKFLOW0804'),
 ('SUPERADMIN','WORKFLOW0805'),
 ('WORKFLOWCOMUSER','WORKFLOW0805'),
 ('SUPERADMIN','WORKFLOW0806'),
 ('WORKFLOWADMIN','WORKFLOW0806'),
 ('WORKFLOWCOMUSER','WORKFLOW0806'),
 ('SUPERADMIN','WORKFLOW0901'),
 ('WORKFLOWCOMUSER','WORKFLOW0901'),
 ('SUPERADMIN','WORKFLOW0902'),
 ('WORKFLOWCOMUSER','WORKFLOW0902'),
 ('SUPERADMIN','WORKFLOW0903'),
 ('WORKFLOWCOMUSER','WORKFLOW0903'),
 ('SUPERADMIN','WORKFLOW0904'),
 ('WORKFLOWCOMUSER','WORKFLOW0904'),
 ('SUPERADMIN','WORKFLOW0905'),
 ('WORKFLOWCOMUSER','WORKFLOW0905'),
 ('SUPERADMIN','WORKFLOW0906'),
 ('WORKFLOWCOMUSER','WORKFLOW0906'),
 ('SUPERADMIN','WORKFLOW0907'),
 ('WORKFLOWCOMUSER','WORKFLOW0907'),
 ('SUPERADMIN','WORKFLOW0908'),
 ('WORKFLOWCOMUSER','WORKFLOW0908'),
 ('SUPERADMIN','WORKFLOW0909'),
 ('WORKFLOWCOMUSER','WORKFLOW0909'),
 ('SUPERADMIN','WORKFLOW0910'),
 ('WORKFLOWCOMUSER','WORKFLOW0910'),
 ('SUPERADMIN','WORKFLOW0911'),
 ('WORKFLOWCOMUSER','WORKFLOW0911'),
 ('SUPERADMIN','WORKFLOW0912'),
 ('WORKFLOWCOMUSER','WORKFLOW0912'),
 ('SUPERADMIN','WORKFLOW0913'),
 ('WORKFLOWCOMUSER','WORKFLOW0913'),
 ('SUPERADMIN','WORKFLOW0914'),
 ('WORKFLOWCOMUSER','WORKFLOW0914'),
 ('SUPERADMIN','WORKFLOW1003'),
 ('WORKFLOWCOMUSER','WORKFLOW1003'),
 ('SUPERADMIN','WORKFLOW1004'),
 ('WORKFLOWCOMUSER','WORKFLOW1004'),
 ('SUPERADMIN','WORKFLOW1005'),
 ('WORKFLOWCOMUSER','WORKFLOW1005'),
 ('SUPERADMIN','WORKFLOW1006'),
 ('WORKFLOWCOMUSER','WORKFLOW1006'),
 ('SUPERADMIN','WORKFLOW1007'),
 ('WORKFLOWCOMUSER','WORKFLOW1007'),
 ('SUPERADMIN','WORKFLOW1008'),
 ('WORKFLOWCOMUSER','WORKFLOW1008'),
 ('SUPERADMIN','WORKFLOW1009'),
 ('WORKFLOWCOMUSER','WORKFLOW1009'),
 ('SUPERADMIN','WORKFLOW1101'),
 ('SUPERADMIN','WORKFLOW1102'),
 ('WORKFLOWCOMUSER','WORKFLOW1102'),
 ('SUPERADMIN','WORKFLOW1201'),
 ('WORKFLOWADMIN','WORKFLOW1201'),
 ('SUPERADMIN','WORKFLOW1301'),
 ('WORKFLOWADMIN','WORKFLOW1301'),
 ('SUPERADMIN','WORKFLOW1302'),
 ('WORKFLOWADMIN','WORKFLOW1302'),
 ('SUPERADMIN','WORKFLOW1501'),
 ('WORKFLOWADMIN','WORKFLOW1501'),
 ('WORKFLOWCOMUSER','WORKFLOW1501'),
 ('SUPERADMIN','WORKFLOW1601'),
 ('WORKFLOWADMIN','WORKFLOW1601'),
 ('SUPERADMIN','WORKFLOW1602'),
 ('WORKFLOWADMIN','WORKFLOW1602'),
 ('SUPERADMIN','WORKFLOW1603'),
 ('WORKFLOWADMIN','WORKFLOW1603');
/*!40000 ALTER TABLE `pub_trole_opts` ENABLE KEYS */;


--
-- Definition of table `pub_troles`
--

DROP TABLE IF EXISTS `pub_troles`;
CREATE TABLE `pub_troles` (
  `ROLE_ID` varchar(30) NOT NULL,
  `ROLE_NAME` varchar(30) NOT NULL,
  `ROLE_ALIAS` varchar(30) NOT NULL,
  `IS_SYS` char(1) NOT NULL DEFAULT '0',
  `USERS_LIMIT` int(11) NOT NULL DEFAULT '-1',
  `TEMPLATE_ID` varchar(30) NOT NULL,
  PRIMARY KEY (`ROLE_ID`),
  KEY `PUBTROLES_FK1` (`TEMPLATE_ID`),
  CONSTRAINT `PUBTROLES_FK1` FOREIGN KEY (`TEMPLATE_ID`) REFERENCES `pub_templates` (`TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_troles`
--

/*!40000 ALTER TABLE `pub_troles` DISABLE KEYS */;
INSERT INTO `pub_troles` (`ROLE_ID`,`ROLE_NAME`,`ROLE_ALIAS`,`IS_SYS`,`USERS_LIMIT`,`TEMPLATE_ID`) VALUES 
 ('GPUBLIC','GPUBLIC','系统公用角色','0',-1,'1'),
 ('SUPERADMIN','SUPERADMIN','超级管理员','0',-1,'1'),
 ('SYSADMIN','SYSADMIN','系统管理员','0',-1,'1'),
 ('WORKFLOWADMIN','WORKFLOWADMIN','工作流管理员','0',-1,'1'),
 ('WORKFLOWCOMUSER','WORKFLOWCOMUSER','工作流普通人员','0',-1,'1');
/*!40000 ALTER TABLE `pub_troles` ENABLE KEYS */;


--
-- Definition of table `pub_urls`
--

DROP TABLE IF EXISTS `pub_urls`;
CREATE TABLE `pub_urls` (
  `URL_ID` varchar(30) NOT NULL,
  `URL_NAME` varchar(500) NOT NULL,
  `RESOURCE_ID` varchar(30) NOT NULL,
  `FUNCTION_ID` varchar(30) NOT NULL,
  `URL_NOTE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`URL_ID`),
  KEY `PubUrls_FK1` (`RESOURCE_ID`),
  KEY `PubUrls_FK2` (`FUNCTION_ID`),
  CONSTRAINT `PubUrls_FK1` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `pub_resources` (`RESOURCE_ID`),
  CONSTRAINT `PubUrls_FK2` FOREIGN KEY (`FUNCTION_ID`) REFERENCES `pub_functions` (`FUNCTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_urls`
--

/*!40000 ALTER TABLE `pub_urls` DISABLE KEYS */;
INSERT INTO `pub_urls` (`URL_ID`,`URL_NAME`,`RESOURCE_ID`,`FUNCTION_ID`,`URL_NOTE`) VALUES 
 ('BPM000000000000000000000000001','taskinfo.cmd?method=jumpTo','WORKFLOW0914','WORKFLOW09','null'),
 ('BPM000000000000000000000000002','taskinfo.cmd?method=reAssign','WORKFLOW0913','WORKFLOW09','null'),
 ('BPM000000000000000000000000003','taskinfo.cmd?method=delProcessForMonitedTask','WORKFLOW0912','WORKFLOW09','null'),
 ('BPM000000000000000000000000004','taskinfo.cmd?method=displaystatus','WORKFLOW0911','WORKFLOW09','null'),
 ('BPM000000000000000000000000005','urlconfig.cmd?method=urlGetVisualFlow','WORKFLOW0911','WORKFLOW09','null'),
 ('BPM000000000000000000000000006','urlconfig.cmd?method=urlGetXPDL','WORKFLOW0911','WORKFLOW09','null'),
 ('BPM000000000000000000000000007','taskinfo.cmd?method=undelegate','WORKFLOW0910','WORKFLOW09','null'),
 ('BPM000000000000000000000000008','taskinfo.cmd?method=forhuizhi','WORKFLOW0909','WORKFLOW09','null'),
 ('BPM000000000000000000000000009','taskinfo.cmd?method=forlimittime','WORKFLOW0908','WORKFLOW09','null'),
 ('BPM000000000000000000000000010','taskinfo.cmd?method=forhastendialog','WORKFLOW0907','WORKFLOW09','null'),
 ('BPM000000000000000000000000011','taskinfo.cmd?method=hasten','WORKFLOW0907','WORKFLOW09','null'),
 ('BPM000000000000000000000000012','struhelp.cmd?method=getCheckEmpRoot','WORKFLOW0907','WORKFLOW09','null'),
 ('BPM000000000000000000000000013','edocmonitortrack.cmd?method=forinsert','WORKFLOW0907','WORKFLOW09','null'),
 ('BPM000000000000000000000000014','edocmonitortrackquery.cmd','WORKFLOW0907','WORKFLOW09','null'),
 ('BPM000000000000000000000000015','edocmonitortrack.cmd?method=insert','WORKFLOW0907','WORKFLOW09','null'),
 ('BPM000000000000000000000000016','edocmonitortrack.cmd?method=delete','WORKFLOW0907','WORKFLOW09','null'),
 ('BPM000000000000000000000000017','taskinfo.cmd?method=deleteProcess','WORKFLOW0906','WORKFLOW09','null'),
 ('BPM000000000000000000000000018','taskinfo.cmd?method=forassigndialog','WORKFLOW0905','WORKFLOW09','null'),
 ('BPM000000000000000000000000019','taskinfo.cmd?method=assign','WORKFLOW0905','WORKFLOW09','null'),
 ('BPM000000000000000000000000020','struhelp.cmd?method=getEmpRoot','WORKFLOW0905','WORKFLOW09','null'),
 ('BPM000000000000000000000000021','struhelp.cmd?method=getCheckEmpRoot','WORKFLOW0905','WORKFLOW09','null'),
 ('BPM000000000000000000000000022','taskinfo.cmd?method=forterminatedialog','WORKFLOW0904','WORKFLOW09','null'),
 ('BPM000000000000000000000000023','taskinfo.cmd?method=terminate','WORKFLOW0904','WORKFLOW09','null'),
 ('BPM000000000000000000000000024','struhelp.cmd?method=getCheckEmpRoot','WORKFLOW0904','WORKFLOW09','null'),
 ('BPM000000000000000000000000025','taskinfo.cmd?method=forresumedialog','WORKFLOW0903','WORKFLOW09','null'),
 ('BPM000000000000000000000000026','taskinfo.cmd?method=resume','WORKFLOW0903','WORKFLOW09','null'),
 ('BPM000000000000000000000000027','struhelp.cmd?method=getCheckEmpRoot','WORKFLOW0903','WORKFLOW09','null'),
 ('BPM000000000000000000000000028','taskinfo.cmd?method=forsuspenddialog','WORKFLOW0902','WORKFLOW09','null'),
 ('BPM000000000000000000000000029','taskinfo.cmd?method=suspend','WORKFLOW0902','WORKFLOW09','null'),
 ('BPM000000000000000000000000030','struhelp.cmd?method=getCheckEmpRoot','WORKFLOW0902','WORKFLOW09','null'),
 ('BPM000000000000000000000000031','taskinfo.cmd?method=jump','WORKFLOW0901','WORKFLOW09','null'),
 ('BPM000000000000000000000000032','taskinfo.cmd?method=getjumpactivities','WORKFLOW0901','WORKFLOW09','null'),
 ('BPM000000000000000000000000033','partynextactivityquery.cmd','WORKFLOW0901','WORKFLOW09','null'),
 ('BPM000000000000000000000000034','processhelpurlquery.cmd','WORKFLOW0806','WORKFLOW08','null'),
 ('BPM000000000000000000000000035','taskinfo.cmd?method=gethistoryactivities','WORKFLOW0805','WORKFLOW08','null'),
 ('BPM000000000000000000000000036','taskinfo.cmd?method=jump','WORKFLOW0805','WORKFLOW08','null'),
 ('BPM000000000000000000000000037','taskinfo.cmd?method=retract','WORKFLOW0805','WORKFLOW08','null'),
 ('BPM000000000000000000000000038','edocmonitorinfoquery.cmd&infoType=7','WORKFLOW0805','WORKFLOW08','null'),
 ('BPM000000000000000000000000039','taskinfo.cmd?method=getnextactivities','WORKFLOW0804','WORKFLOW08','null'),
 ('BPM000000000000000000000000040','taskinfo.cmd?processId=','WORKFLOW0804','WORKFLOW08','null'),
 ('BPM000000000000000000000000041','taskinfo.cmd?curActDefId=','WORKFLOW0804','WORKFLOW08','null'),
 ('BPM000000000000000000000000042','partynextactivityquery.cmd','WORKFLOW0804','WORKFLOW08','null'),
 ('BPM000000000000000000000000043','taskinfo.cmd?method=send','WORKFLOW0804','WORKFLOW08','null'),
 ('BPM000000000000000000000000044','taskinfo.cmd?method=send','WORKFLOW0803','WORKFLOW08','null'),
 ('BPM000000000000000000000000045','taskinfo.cmd?method=createAndSend','WORKFLOW0802','WORKFLOW08','null'),
 ('BPM000000000000000000000000046','taskinfo.cmd?method=saveformdata','WORKFLOW0801','WORKFLOW08','null'),
 ('BPM000000000000000000000000047','adjuncthelpquery.cmd','WORKFLOW0704','WORKFLOW07','null'),
 ('BPM000000000000000000000000048','adjunct.cmd?method=delete','WORKFLOW0703','WORKFLOW07','null'),
 ('BPM000000000000000000000000049','adjunct.cmd?method=forinsert','WORKFLOW0702','WORKFLOW07','null'),
 ('BPM000000000000000000000000050','adjunct.cmd?method=insert','WORKFLOW0702','WORKFLOW07','null'),
 ('BPM000000000000000000000000051','adjunctquery.cmd','WORKFLOW0701','WORKFLOW07','null'),
 ('BPM000000000000000000000000052','adjunct.cmd?method=detail','WORKFLOW0701','WORKFLOW07','null'),
 ('BPM000000000000000000000000053','wfuniprocessquery_page_init.cmd','WORKFLOW0610','WORKFLOW06','null'),
 ('BPM000000000000000000000000054','wfuniprocessquery_page_init.cmd?helpQuery=true','WORKFLOW0610','WORKFLOW06','null'),
 ('BPM000000000000000000000000055','wfuniprocess.cmd?method=forDeal','WORKFLOW0610','WORKFLOW06','null'),
 ('BPM000000000000000000000000056','wfuniprocess.cmd?method=save','WORKFLOW0610','WORKFLOW06','null'),
 ('BPM000000000000000000000000057','wfuniprocess.cmd?method=forward','WORKFLOW0610','WORKFLOW06','null'),
 ('BPM000000000000000000000000058','wfuniprocess.cmd?method=delete','WORKFLOW0610','WORKFLOW06','null'),
 ('BPM000000000000000000000000059','wftaskaccreditquery.cmd','WORKFLOW0609','WORKFLOW06','null'),
 ('BPM000000000000000000000000060','wftaskaccredit.cmd?method=detail','WORKFLOW0609','WORKFLOW06','null'),
 ('BPM000000000000000000000000061','wftaskaccredit.cmd?method=forinsert','WORKFLOW0609','WORKFLOW06','null'),
 ('BPM000000000000000000000000062','wftaskaccredit.cmd?method=insert','WORKFLOW0609','WORKFLOW06','null'),
 ('BPM000000000000000000000000063','wftaskaccredit.cmd?method=insertContinue','WORKFLOW0609','WORKFLOW06','null'),
 ('BPM000000000000000000000000064','wftaskaccredit.cmd?method=forupdate','WORKFLOW0609','WORKFLOW06','null'),
 ('BPM000000000000000000000000065','wftaskaccredit.cmd?method=update','WORKFLOW0609','WORKFLOW06','null'),
 ('BPM000000000000000000000000066','wftaskaccredit.cmd?method=delete','WORKFLOW0609','WORKFLOW06','null'),
 ('BPM000000000000000000000000067','taskinfoforemp.cmd?method=getTaskInfoForEmp','WORKFLOW0608','WORKFLOW06','null'),
 ('BPM000000000000000000000000068','taskinfoforemp.cmd?method=getProcessList_daiban','WORKFLOW0608','WORKFLOW06','null'),
 ('BPM000000000000000000000000069','taskinfoforemp.cmd?method=getProcessList_zaiban','WORKFLOW0608','WORKFLOW06','null'),
 ('BPM000000000000000000000000070','taskinfoforemp.cmd?method=getProcessList_yiban','WORKFLOW0608','WORKFLOW06','null'),
 ('BPM000000000000000000000000071','taskinfoforemp.cmd?method=getProcessList_finish','WORKFLOW0608','WORKFLOW06','null'),
 ('BPM000000000000000000000000072','taskinfomonitor.cmd?method=getProcessTypeList','WORKFLOW0607','WORKFLOW06','null'),
 ('BPM000000000000000000000000073','taskinfomonitor.cmd?method=getProcessList','WORKFLOW0607','WORKFLOW06','null'),
 ('BPM000000000000000000000000074','restaskinfoquery.cmd','WORKFLOW0607','WORKFLOW06','null'),
 ('BPM000000000000000000000000075','edocmonitorinfoquery.cmd','WORKFLOW0607','WORKFLOW06','null'),
 ('BPM000000000000000000000000076','taskinfo.cmd?method=forres','WORKFLOW0607','WORKFLOW06','null'),
 ('BPM000000000000000000000000077','edocmonitorinfo.cmd?method=detail','WORKFLOW0607','WORKFLOW06','null'),
 ('BPM000000000000000000000000078','taskinforole.cmd?method=getProcessTypeList','WORKFLOW0606','WORKFLOW06','null'),
 ('BPM000000000000000000000000079','taskinforole.cmd?method=getProcessList','WORKFLOW0606','WORKFLOW06','null'),
 ('BPM000000000000000000000000080','roletaskinfoquery.cmd','WORKFLOW0606','WORKFLOW06','null'),
 ('BPM000000000000000000000000081','taskinfo.cmd?method=forrole','WORKFLOW0606','WORKFLOW06','null'),
 ('BPM000000000000000000000000082','taskinfo.cmd?method=delegate','WORKFLOW0606','WORKFLOW06','null'),
 ('BPM000000000000000000000000083','taskinfofinish.cmd?method=getProcessTypeList','WORKFLOW0605','WORKFLOW06','null'),
 ('BPM000000000000000000000000084','taskinfofinish.cmd?method=getProcessList','WORKFLOW0605','WORKFLOW06','null'),
 ('BPM000000000000000000000000085','finishtaskinfoquery.cmd','WORKFLOW0605','WORKFLOW06','null'),
 ('BPM000000000000000000000000086','taskinfo.cmd?method=forend','WORKFLOW0605','WORKFLOW06','null'),
 ('BPM000000000000000000000000087','taskinfoyiban.cmd?method=getProcessTypeList','WORKFLOW0604','WORKFLOW06','null'),
 ('BPM000000000000000000000000088','taskinfoyiban.cmd?method=getProcessList','WORKFLOW0604','WORKFLOW06','null'),
 ('BPM000000000000000000000000089','oldtaskinfoquery.cmd','WORKFLOW0604','WORKFLOW06','null'),
 ('BPM000000000000000000000000090','taskinfo.cmd?method=forold','WORKFLOW0604','WORKFLOW06','null'),
 ('BPM000000000000000000000000091','taskinfo.cmd?method=mpforold','WORKFLOW0604','WORKFLOW06','null'),
 ('BPM000000000000000000000000092','taskinfozaiban.cmd?method=getProcessTypeList','WORKFLOW0603','WORKFLOW06','null'),
 ('BPM000000000000000000000000093','taskinfozaiban.cmd?method=getProcessList','WORKFLOW0603','WORKFLOW06','null'),
 ('BPM000000000000000000000000094','taskinfoquery.cmd','WORKFLOW0603','WORKFLOW06','null'),
 ('BPM000000000000000000000000095','taskinfo.cmd?method=fordeal','WORKFLOW0603','WORKFLOW06','null'),
 ('BPM000000000000000000000000096','taskinfo.cmd?method=mpfordeal','WORKFLOW0603','WORKFLOW06','null'),
 ('BPM000000000000000000000000097','taskinfodaiban.cmd?method=getProcessTypeList','WORKFLOW0602','WORKFLOW06','null'),
 ('BPM000000000000000000000000098','taskinfodaiban.cmd?method=getProcessList','WORKFLOW0602','WORKFLOW06','null'),
 ('BPM000000000000000000000000099','taskinfoquery.cmd','WORKFLOW0602','WORKFLOW06','null'),
 ('BPM000000000000000000000000100','taskinfo.cmd?method=fordeal','WORKFLOW0602','WORKFLOW06','null'),
 ('BPM000000000000000000000000101','taskinfo.cmd?method=mpfordeal','WORKFLOW0602','WORKFLOW06','null'),
 ('BPM000000000000000000000000102','processlist.cmd?method=processlist','WORKFLOW0601','WORKFLOW06','null'),
 ('BPM000000000000000000000000103','taskinfo.cmd?method=forcreate','WORKFLOW0601','WORKFLOW06','null'),
 ('BPM000000000000000000000000104','taskinfo.cmd?method=createdocument','WORKFLOW0601','WORKFLOW06','null'),
 ('BPM000000000000000000000000105','formprinttemplethelp.cmd','WORKFLOW0505','WORKFLOW05','null'),
 ('BPM000000000000000000000000106','formprinttemplet.cmd?method=detailHidden','WORKFLOW0505','WORKFLOW05','null'),
 ('BPM000000000000000000000000107','formprinttemplet.cmd?method=delete','WORKFLOW0504','WORKFLOW05','null'),
 ('BPM000000000000000000000000108','formprinttemplet.cmd?method=forupdate','WORKFLOW0503','WORKFLOW05','null'),
 ('BPM000000000000000000000000109','formprinttemplet.cmd?method=update','WORKFLOW0503','WORKFLOW05','null'),
 ('BPM000000000000000000000000110','formprinttemplet.cmd?method=forinsert','WORKFLOW0502','WORKFLOW05','null'),
 ('BPM000000000000000000000000111','formprinttemplet.cmd?method=insert','WORKFLOW0502','WORKFLOW05','null'),
 ('BPM000000000000000000000000112','formprinttempletquery.cmd','WORKFLOW0501','WORKFLOW05','null'),
 ('BPM000000000000000000000000113','formprinttemplet.cmd?method=detail','WORKFLOW0501','WORKFLOW05','null'),
 ('BPM000000000000000000000000114','tasklist.cmd?method=delete','WORKFLOW0404','WORKFLOW04','null'),
 ('BPM000000000000000000000000115','tasklist.cmd?method=forupdate','WORKFLOW0403','WORKFLOW04','null'),
 ('BPM000000000000000000000000116','tasklist.cmd?method=update','WORKFLOW0403','WORKFLOW04','null'),
 ('BPM000000000000000000000000117','tasklist.cmd?method=getReservekeys','WORKFLOW0402','WORKFLOW04','null'),
 ('BPM000000000000000000000000118','tasklist.cmd?method=insertReservKeys','WORKFLOW0402','WORKFLOW04','null'),
 ('BPM000000000000000000000000119','tasklistquery.cmd','WORKFLOW0401','WORKFLOW04','null'),
 ('BPM000000000000000000000000120','tasklist.cmd?method=detail','WORKFLOW0401','WORKFLOW04','null'),
 ('BPM000000000000000000000000121','signpic.cmd?method=query','WORKFLOW0400','WORKFLOW03','null'),
 ('BPM000000000000000000000000122','signpic.cmd?method=delete','WORKFLOW0400','WORKFLOW03','null'),
 ('BPM000000000000000000000000123','signpic.cmd?method=detail','WORKFLOW0400','WORKFLOW03','null'),
 ('BPM000000000000000000000000124','signpic.cmd?method=forInsert','WORKFLOW0400','WORKFLOW03','null'),
 ('BPM000000000000000000000000125','signpic.cmd?method=insert','WORKFLOW0400','WORKFLOW03','null'),
 ('BPM000000000000000000000000126','processhelpquery.cmd','WORKFLOW0309','WORKFLOW03','null'),
 ('BPM000000000000000000000000127','upgrade.cmd?method=upgrade','WORKFLOW0308','WORKFLOW03','null'),
 ('BPM000000000000000000000000128','upgrade.cmd?method=upgradeTable','WORKFLOW0308','WORKFLOW03','null'),
 ('BPM000000000000000000000000129','upgrade.cmd?method=upgradeData','WORKFLOW0308','WORKFLOW03','null'),
 ('BPM000000000000000000000000130','processExchange.cmd?method=forexport','WORKFLOW0307','WORKFLOW03','null'),
 ('BPM000000000000000000000000131','processExchange.cmd?method=export','WORKFLOW0307','WORKFLOW03','null'),
 ('BPM000000000000000000000000132','processExchange.cmd?method=forimport','WORKFLOW0306','WORKFLOW03','null'),
 ('BPM000000000000000000000000133','processExchange.cmd?method=doimport','WORKFLOW0306','WORKFLOW03','null'),
 ('BPM000000000000000000000000134','process.cmd?method=detail','WORKFLOW0305','WORKFLOW03','null'),
 ('BPM000000000000000000000000135','urlconfig.cmd?method=urlGetSystemConfig','WORKFLOW0305','WORKFLOW03','null'),
 ('BPM000000000000000000000000136','urlconfig.cmd?method=urlGetMenuConfig','WORKFLOW0305','WORKFLOW03','null'),
 ('BPM000000000000000000000000137','urlconfig.cmd?method=getActorFields','WORKFLOW0305','WORKFLOW03','null'),
 ('BPM000000000000000000000000138','urlconfig.cmd?method=getWorkform','WORKFLOW0305','WORKFLOW03','null'),
 ('BPM000000000000000000000000139','urlconfig.cmd?method=urlGetProcess','WORKFLOW0305','WORKFLOW03','null'),
 ('BPM000000000000000000000000140','urlconfig.cmd?method=urlGetSystemOrgan','WORKFLOW0305','WORKFLOW03','null'),
 ('BPM000000000000000000000000141','process.cmd?method=delete','WORKFLOW0304','WORKFLOW03','null'),
 ('BPM000000000000000000000000142','process.cmd?method=forupdatepro','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000143','process.cmd?method=forupdate','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000144','process.cmd?method=update','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000145','process.cmd?method=loadProcess','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000146','process.cmd?method=load','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000147','process.cmd?method=syndata','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000148','process.cmd?method=updateNewVer','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000149','urlconfig.cmd?method=urlGetSystemConfig','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000150','urlconfig.cmd?method=urlGetMenuConfig','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000151','urlconfig.cmd?method=getActorFields','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000152','urlconfig.cmd?method=getWorkform','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000153','urlconfig.cmd?method=urlGetProcess','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000154','urlconfig.cmd?method=urlGetSystemOrgan','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000155','struhelp.cmd?method=getSelectRoot','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000156','struhelp.cmd?method=getHelpTreeNode','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000157','roleradio.cmd?method=choiceroot','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000158','role.cmd?method=choicenode','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000159','workformmanagerhelpquery.cmd','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000160','processtemplatequery.cmd','WORKFLOW0303','WORKFLOW03','null'),
 ('BPM000000000000000000000000193','formmanager.cmd?method=createTables','WORKFLOW0206','WORKFLOW02','null'),
 ('BPM000000000000000000000000194','formmanager.cmd?method=detail','WORKFLOW0205','WORKFLOW02','null'),
 ('BPM000000000000000000000000195','formmanager.cmd?method=render','WORKFLOW0205','WORKFLOW02','null'),
 ('BPM000000000000000000000000196','formdataquery.cmd?method=query','WORKFLOW0205','WORKFLOW02','null'),
 ('BPM000000000000000000000000197','formdataquery.cmd','WORKFLOW0205','WORKFLOW02','null'),
 ('BPM000000000000000000000000198','formmanager.cmd?method=getReserveKeysXml','WORKFLOW0205','WORKFLOW02','null'),
 ('BPM000000000000000000000000199','formmanager.cmd?method=getEditFieldsXml','WORKFLOW0205','WORKFLOW02','null'),
 ('BPM000000000000000000000000200','formmanager.cmd?method=getSelectFieldsXml','WORKFLOW0205','WORKFLOW02','null'),
 ('BPM000000000000000000000000201','formmanager.cmd?method=getSpecialEditsXml','WORKFLOW0205','WORKFLOW02','null'),
 ('BPM000000000000000000000000202','formmanager.cmd?method=getVerifysXml','WORKFLOW0205','WORKFLOW02','null'),
 ('BPM000000000000000000000000203','formmanager.cmd?method=getDynamicDefaultsXml','WORKFLOW0205','WORKFLOW02','null'),
 ('BPM000000000000000000000000204','formmanager.cmd?method=getFixedFieldsXml','WORKFLOW0205','WORKFLOW02','null'),
 ('BPM000000000000000000000000205','formmanager.cmd?method=delete','WORKFLOW0204','WORKFLOW02','null'),
 ('BPM000000000000000000000000206','formmanager.cmd?method=forupdate','WORKFLOW0203','WORKFLOW02','null'),
 ('BPM000000000000000000000000207','formmanager.cmd?method=update','WORKFLOW0203','WORKFLOW02','null'),
 ('BPM000000000000000000000000208','struhelp.cmd?method=getSelectRoot','WORKFLOW0203','WORKFLOW02','null'),
 ('BPM000000000000000000000000209','struhelp.cmd?method=getHelpTreeNode','WORKFLOW0203','WORKFLOW02','null'),
 ('BPM000000000000000000000000210','formmanager.cmd?method=forinsert','WORKFLOW0202','WORKFLOW02','null'),
 ('BPM000000000000000000000000211','processtypehelpquery.cmd','WORKFLOW0202','WORKFLOW02','null'),
 ('BPM000000000000000000000000212','formmanager.cmd?method=insert','WORKFLOW0202','WORKFLOW02','null'),
 ('BPM000000000000000000000000213','struhelp.cmd?method=getSelectRoot','WORKFLOW0202','WORKFLOW02','null'),
 ('BPM000000000000000000000000214','struhelp.cmd?method=getHelpTreeNode','WORKFLOW0202','WORKFLOW02','null'),
 ('BPM000000000000000000000000215','formmanager.cmd?method=getReserveKeysXml','WORKFLOW0202','WORKFLOW02','null'),
 ('BPM000000000000000000000000216','formmanager.cmd?method=getEditFieldsXml','WORKFLOW0202','WORKFLOW02','null'),
 ('BPM000000000000000000000000217','formmanager.cmd?method=getSelectFieldsXml','WORKFLOW0202','WORKFLOW02','null'),
 ('BPM000000000000000000000000218','formmanager.cmd?method=getSpecialEditsXml','WORKFLOW0202','WORKFLOW02','null'),
 ('BPM000000000000000000000000219','formmanager.cmd?method=getVerifysXml','WORKFLOW0202','WORKFLOW02','null'),
 ('BPM000000000000000000000000220','formmanager.cmd?method=getDynamicDefaultsXml','WORKFLOW0202','WORKFLOW02','null'),
 ('BPM000000000000000000000000221','formmanager.cmd?method=getFixedFieldsXml','WORKFLOW0202','WORKFLOW02','null'),
 ('BPM000000000000000000000000222','workformmanagerquery.cmd','WORKFLOW0201','WORKFLOW02','null'),
 ('BPM000000000000000000000000223','formmanager.cmd?method=detail','WORKFLOW0201','WORKFLOW02','null'),
 ('BPM000000000000000000000000224','formmanager.cmd?method=render','WORKFLOW0201','WORKFLOW02','null'),
 ('BPM000000000000000000000000225','formdataquery.cmd?method=query','WORKFLOW0201','WORKFLOW02','null'),
 ('BPM000000000000000000000000226','formdataquery.cmd','WORKFLOW0201','WORKFLOW02','null'),
 ('BPM000000000000000000000000227','formmanager.cmd?method=getReserveKeysXml','WORKFLOW0201','WORKFLOW02','null'),
 ('BPM000000000000000000000000228','formmanager.cmd?method=getEditFieldsXml','WORKFLOW0201','WORKFLOW02','null'),
 ('BPM000000000000000000000000229','formmanager.cmd?method=getSelectFieldsXml','WORKFLOW0201','WORKFLOW02','null'),
 ('BPM000000000000000000000000230','formmanager.cmd?method=getSpecialEditsXml','WORKFLOW0201','WORKFLOW02','null'),
 ('BPM000000000000000000000000231','formmanager.cmd?method=getVerifysXml','WORKFLOW0201','WORKFLOW02','null'),
 ('BPM000000000000000000000000232','formmanager.cmd?method=getDynamicDefaultsXml','WORKFLOW0201','WORKFLOW02','null'),
 ('BPM000000000000000000000000233','formmanager.cmd?method=getFixedFieldsXml','WORKFLOW0201','WORKFLOW02','null'),
 ('BPM000000000000000000000000234','processtypehelpquery.cmd','WORKFLOW0105','WORKFLOW01','null'),
 ('BPM000000000000000000000000235','processtype.cmd?method=delete','WORKFLOW0104','WORKFLOW01','null'),
 ('BPM000000000000000000000000236','processtype.cmd?method=forupdate','WORKFLOW0103','WORKFLOW01','null'),
 ('BPM000000000000000000000000237','processtype.cmd?method=update','WORKFLOW0103','WORKFLOW01','null'),
 ('BPM000000000000000000000000238','processtype.cmd?method=forinsert','WORKFLOW0102','WORKFLOW01','null'),
 ('BPM000000000000000000000000239','processtype.cmd?method=insert','WORKFLOW0102','WORKFLOW01','null'),
 ('BPM000000000000000000000000240','processtypequery.cmd','WORKFLOW0101','WORKFLOW01','null'),
 ('BPM000000000000000000000000241','processtype.cmd?method=detail','WORKFLOW0101','WORKFLOW01','null'),
 ('BPM000000000000000000000000242','workformgraph.cmd?method=exec','WORKFLOW0207','WORKFLOW02','null'),
 ('BPM000000000000000000000000243','workformgraph.cmd?method=getfiles','WORKFLOW0207','WORKFLOW02','null'),
 ('BPM000000000000000000000000244','workformgraph.cmd?method=updateFile','WORKFLOW0207','WORKFLOW02','null'),
 ('BPM000000000000000000000000252','jspformtaskdeal.cmd?method= forend','WORKFLOW0611','WORKFLOW06','null'),
 ('BPM000000000000000000000000253','jspformtaskdeal.cmd?method=forcreate','WORKFLOW0611','WORKFLOW06','null'),
 ('BPM000000000000000000000000254','jspformtaskdeal.cmd?method=forold','WORKFLOW0611','WORKFLOW06','null'),
 ('BPM000000000000000000000000255','jspformtaskdeal.cmd?method=fordeal','WORKFLOW0611','WORKFLOW06','null'),
 ('BPM000000000000000000000000256','jspformtaskdeal.cmd?method=delegate','WORKFLOW0611','WORKFLOW06','null'),
 ('BPM000000000000000000000000257','jspformtaskdeal.cmd?method=forres','WORKFLOW0611','WORKFLOW06','null'),
 ('BPM000000000000000000000000258','jspformtaskdeal.cmd?method=forrole','WORKFLOW0611','WORKFLOW06','null'),
 ('BPM000000000000000000000000281','commonremark.cmd?method=specialeditAdd','WORKFLOW1003','WORKFLOW10','null'),
 ('BPM000000000000000000000000282','commonremark.cmd?method=specialeditDelete','WORKFLOW1004','WORKFLOW10','null'),
 ('BPM000000000000000000000000283','commonremark.cmd?method=specialeditremarkdialog','WORKFLOW1005','WORKFLOW10','null'),
 ('BPM000000000000000000000000284','process.cmd?method=forinsertpro','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000285','processtypehelpquery.cmd','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000287','jspFormsHelpQuery.cmd','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000288','process.cmd?method=forinsert','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000289','process.cmd?method=insert','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000290','process.cmd?method=insertLoad','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000291','urlconfig.cmd?method=urlGetSystemConfig','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000292','urlconfig.cmd?method=urlGetMenuConfig','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000293','urlconfig.cmd?method=getActorFields','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000294','urlconfig.cmd?method=getWorkform','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000295','urlconfig.cmd?method=getDefinedForm','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000296','urlconfig.cmd?method=getDcworkform','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000297','urlconfig.cmd?method=getJspForm','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000298','urlconfig.cmd?method=urlGetProcess','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000299','urlconfig.cmd?method=urlGetSystemOrgan','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000300','struhelp.cmd?method=getSelectRoot','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000301','struhelp.cmd?method=getHelpTreeNode','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000302','roleradio.cmd?method=choiceroot','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000303','role.cmd?method=choicenode','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000304','workformmanagerhelpquery.cmd','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000305','processtemplatequery.cmd','WORKFLOW0302','WORKFLOW03','null'),
 ('BPM000000000000000000000000306','taskinfo.cmd?method=signdialog','WORKFLOW1006','WORKFLOW10','null'),
 ('BPM000000000000000000000000307','wf_struhelp.cmd?method=getEmpRoot','WORKFLOW1007','WORKFLOW10','null'),
 ('BPM000000000000000000000000308','wf_struhelp.cmd?method=getCheckEmpRoot','WORKFLOW1007','WORKFLOW10','null'),
 ('BPM000000000000000000000000309','wfdochelpcheckbox.cmd','WORKFLOW1007','WORKFLOW10','null'),
 ('BPM000000000000000000000000310','wfdochelpradio.cmd','WORKFLOW1007','WORKFLOW10','null'),
 ('BPM000000000000000000000000311','wfmeetinghelp.cmd','WORKFLOW1007','WORKFLOW10','null'),
 ('BPM000000000000000000000000312','actionexchangequery.cmd','WORKFLOW1008','WORKFLOW10','null'),
 ('BPM000000000000000000000000313','actionexchange.cmd?method=forinsert','WORKFLOW1008','WORKFLOW10','null'),
 ('BPM000000000000000000000000314','actionexchange.cmd?method=insert','WORKFLOW1008','WORKFLOW10','null'),
 ('BPM000000000000000000000000315','dochelpcheckbox.cmd','WORKFLOW1008','WORKFLOW10','null'),
 ('BPM000000000000000000000000316','doccontent.cmd?method=detail','WORKFLOW1009','WORKFLOW10','null'),
 ('BPM000000000000000000000000317','taskquery.cmd','WORKFLOW1101','WORKFLOW11','null'),
 ('BPM000000000000000000000000318','taskinfosearch.cmd','WORKFLOW1101','WORKFLOW11','null'),
 ('BPM000000000000000000000000319','hrempforhelpradio.cmd','WORKFLOW1101','WORKFLOW11','null'),
 ('BPM000000000000000000000000320','wf_struhelp.cmd?method=getEmpRoot','WORKFLOW1101','WORKFLOW11','null'),
 ('BPM000000000000000000000000321','wf_struhelp.cmd?method=getChoiceNode','WORKFLOW1101','WORKFLOW11','null'),
 ('BPM000000000000000000000000322','wfdochelpcheckbox.cmd','WORKFLOW1101','WORKFLOW11','null'),
 ('BPM000000000000000000000000323','wfdochelpradio.cmd','WORKFLOW1101','WORKFLOW11','null'),
 ('BPM000000000000000000000000324','wfmeetinghelp.cmd','WORKFLOW1101','WORKFLOW11','null'),
 ('BPM000000000000000000000000325','workformforquery.cmd','WORKFLOW1102','WORKFLOW11','null'),
 ('BPM000000000000000000000000326','formmanager.cmd?method=render','WORKFLOW1102','WORKFLOW11','null'),
 ('BPM000000000000000000000000327','formdataquery.cmd','WORKFLOW1102','WORKFLOW11','null'),
 ('BPM000000000000000000000000328','wfadminoperate.cmd?method=cacheAdmin','WORKFLOW1201','WORKFLOW12','null'),
 ('BPM000000000000000000000000329','wfadminoperate.cmd?method=forSetCacheSize','WORKFLOW1201','WORKFLOW12','null'),
 ('BPM000000000000000000000000330','wfadminoperate.cmd?method=setCacheSize','WORKFLOW1201','WORKFLOW12','null'),
 ('BPM000000000000000000000000331','wfadminoperate.cmd?method=clearCache','WORKFLOW1201','WORKFLOW12','null'),
 ('BPM000000000000000000000000332','processquery.cmd','WORKFLOW0301','WORKFLOW03','null'),
 ('BPM000000000000000000000000333','process.cmd?method=detail','WORKFLOW0301','WORKFLOW03','null'),
 ('BPM000000000000000000000000334','urlconfig.cmd?method=urlGetSystemConfig','WORKFLOW0301','WORKFLOW03','null'),
 ('BPM000000000000000000000000335','urlconfig.cmd?method=urlGetMenuConfig','WORKFLOW0301','WORKFLOW03','null'),
 ('BPM000000000000000000000000336','urlconfig.cmd?method=getActorFields','WORKFLOW0301','WORKFLOW03','null'),
 ('BPM000000000000000000000000337','urlconfig.cmd?method=getWorkform','WORKFLOW0301','WORKFLOW03','null'),
 ('BPM000000000000000000000000338','urlconfig.cmd?method=urlGetProcess','WORKFLOW0301','WORKFLOW03','null'),
 ('BPM000000000000000000000000339','urlconfig.cmd?method=urlGetSystemOrgan','WORKFLOW0301','WORKFLOW03','null'),
 ('BPM000000000000000000000000340','struhelp.cmd?method=getSelectRoot','WORKFLOW0301','WORKFLOW03','null'),
 ('BPM000000000000000000000000341','struhelp.cmd?method=getHelpTreeNode','WORKFLOW0301','WORKFLOW03','null'),
 ('BPM000000000000000000000000342','roleradio.cmd?method=choiceroot','WORKFLOW0301','WORKFLOW03','null'),
 ('BPM000000000000000000000000343','role.cmd?method=choicenode','WORKFLOW0301','WORKFLOW03','null'),
 ('BPM000000000000000000000000344','workformmanagerhelpquery.cmd','WORKFLOW0301','WORKFLOW03','null'),
 ('BPM000000000000000000000000345','processtemplatequery.cmd','WORKFLOW0301','WORKFLOW03','null'),
 ('BPM000000000000000000000000347','activityadmin.cmd?method=startActivity','WORKFLOW1302','WORKFLOW13','null'),
 ('BPM000000000000000000000000348','processmgradminquery.cmd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000349','processendadminquery.cmd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000350','wfadminquery.cmd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000351','processmgr.cmd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000352','activityadmin.cmd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000353','assignmentadmin.cmd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000354','processadmin.cmd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000355','processalladmin.cmd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000356','processalladminquery.cmd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000357','taskinfo.cmd?method=displaystatus','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000358','processendadmin.cmd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000359','wf_struhelp.cmd','WORKFLOW1501','WORKFLOW15','null'),
 ('BPM000000000000000000000000360','struhelp.cmd','WORKFLOW1501','WORKFLOW15','null'),
 ('BPM000000000000000000000000361','wforgantypequery.cmd','WORKFLOW1501','WORKFLOW15','null'),
 ('BPM000000000000000000000000366','wfreport.cmd?method=gettreeeditroot','WFREPORT1501','WFREPORT15','null'),
 ('BPM000000000000000000000000367','wfreport.cmd?method=gettreeeditbranch','WFREPORT1502','WFREPORT15','null'),
 ('BPM000000000000000000000000368','wfreport.cmd?method=queryForm','WFREPORT1503','WFREPORT15','null'),
 ('BPM000000000000000000000000369','wfreport.cmd?method=forinsert','WFREPORT1504','WFREPORT15','null'),
 ('BPM000000000000000000000000370','wfreport.cmd?method=forupdate','WFREPORT1505','WFREPORT15','null'),
 ('BPM000000000000000000000000371','wfreport.cmd?method=insert','WFREPORT1506','WFREPORT15','null'),
 ('BPM000000000000000000000000372','wfreport.cmd?method=query','WFREPORT1507','WFREPORT15','null'),
 ('BPM000000000000000000000000373','wfreport.cmd?method=update','WFREPORT1508','WFREPORT15','null'),
 ('BPM000000000000000000000000374','wfreport.cmd?method=insertContinue','WFREPORT1509','WFREPORT15','null'),
 ('BPM000000000000000000000000375','wfreportdefine.cmd?method=detail','WFREPORT1510','WFREPORT15','null'),
 ('BPM000000000000000000000000376','wfreport.cmd?method=delete','WFREPORT1511','WFREPORT15','null'),
 ('BPM000000000000000000000000377','wfreportdefine.cmd?method=insert','WFREPORT1512','WFREPORT15','null'),
 ('BPM000000000000000000000000378','wfrptquery.cmd?method=querygettreeeditroot','WFREPORT1601','WFREPORT16','null'),
 ('BPM000000000000000000000000379','wfrptquery.cmd?method=querygettreeeditbranch','WFREPORT1602','WFREPORT16','null'),
 ('BPM000000000000000000000000380','wfreportdefine.cmd?method=forquery','WFREPORT1603','WFREPORT16','null'),
 ('BPM000000000000000000000000381','wfreportdefine.cmd?method=query','WFREPORT1604','WFREPORT16','null'),
 ('BPM000000000000000000000000382','wfpersonanlyze.cmd?method=PersonAnalyzeByDay','WORKFLOW1601','WORKFLOW16','null'),
 ('BPM000000000000000000000000383','wfpersonanlyze.cmd?method=PersonSelectPro','WORKFLOW1601','WORKFLOW16','null'),
 ('BPM000000000000000000000000384','wfpersonanlyze.cmd?method=PersonAnalyze','WORKFLOW1601','WORKFLOW16','null'),
 ('BPM000000000000000000000000385','wfpersonanlyze.cmd?method=PersonAnalyzeByQuarter','WORKFLOW1601','WORKFLOW16','null'),
 ('BPM000000000000000000000000386','wfpersonanlyze.cmd?method=PersonAnalyzeByMonth','WORKFLOW1601','WORKFLOW16','null'),
 ('BPM000000000000000000000000387','wfportfolio.cmd?method=processPortfolioByQuarter','WORKFLOW1602','WORKFLOW16','null'),
 ('BPM000000000000000000000000388','wfportfolio.cmd?method=processPortfolioByMonth','WORKFLOW1602','WORKFLOW16','null'),
 ('BPM000000000000000000000000389','wfportfolio.cmd?method=processPortfolioByYear','WORKFLOW1602','WORKFLOW16','null'),
 ('BPM000000000000000000000000390','processhelpquery.cmd','WORKFLOW1602','WORKFLOW16','null'),
 ('BPM000000000000000000000000391','wflasttime.cmd?method=activityLastTime','WORKFLOW1603','WORKFLOW16','null'),
 ('BPM000000000000000000000000392','wflasttime.cmd?method=processLastTimeByQuarter','WORKFLOW1603','WORKFLOW16','null'),
 ('BPM000000000000000000000000393','wflasttime.cmd?method=processLastTimeByMonth','WORKFLOW1603','WORKFLOW16','null'),
 ('BPM000000000000000000000000394','wflasttime.cmd?method=processLastTimeByYear','WORKFLOW1603','WORKFLOW16','null'),
 ('BPM000000000000000000000000395','historyhelpurlquery.cmd','WORKFLOW0106','WORKFLOW01','null'),
 ('BPM000000000000000000000000396','process.cmd?method=synReposible','WORKFLOW0405','WORKFLOW03','null'),
 ('BPM000000000000000000000000397','wfYwHelpInitquery.cmd','WORKFLOW0406','WORKFLOW03','null'),
 ('BPM000000000000000000000000398','taskinfo.cmd?method=addAssign','WORKFLOW0905','WORKFLOW09','null'),
 ('BPM000000000000000000000000399','taskinfo.cmd?method=printForm','WORKFLOW0601','WORKFLOW06','null'),
 ('BPM000000000000000000000000400','role.cmd?method=getSysRoleRoot','WORKFLOW0301','WORKFLOW03','null'),
 ('BPM000000000000000000000000401','wf_struhelp.cmd?method=getSelectRoot','WORKFLOW1007','WORKFLOW10','null'),
 ('BPM000000000000000000000000402','processmgr.cmd?method=stopProcessMgr','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000403','processmgr.cmd?method=startProcessMgr','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000404','processmgr.cmd?method=deleteProcessMgr','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000405','processendadmin.cmd?method=deleteProcessEnd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000406','processalladmin.cmd?method=suspendProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000407','processalladmin.cmd?method=abortProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000408','processalladmin.cmd?method=terminateProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000409','processalladmin.cmd?method=terminateProcessAndDeleteProcessEnd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000410','processalladmin.cmd?method=checklimitProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000411','wfadminquery.cmd?method=getActivityList','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000412','processalladmin.cmd?method=resumeProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000413','processalladmin.cmd?method=showhistoryProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000414','struhelp.cmd?method=getChoiceNode','WORKFLOW0905','WORKFLOW09','null'),
 ('BPM000000000000000000000000415','struhelp.cmd?method=getCheckNode','WORKFLOW0905','WORKFLOW09','null'),
 ('BPM000000000000000000000000416','wf_struhelp.cmd?method=getHelpTreeNode','WORKFLOW1007','WORKFLOW10','null'),
 ('BPM000000000000000000000000417','jspFormRequestsHelpQuery.cmd','WORKFLOW0407','WORKFLOW03','null'),
 ('BPM000000000000000000000000418','processmgradminquery.cmd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000419','processendadminquery.cmd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000420','wfadminquery.cmd?method=getProcessList','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000421','wfadminquery.cmd?method=getAssignmentEndList','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000422','wfadminquery.cmd?method=getActivityEndList','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000423','wfadminquery.cmd?method=getAssignmentList','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000424','wfadminquery.cmd?method=getActivityList','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000425','processmgr.cmd?method=forupload','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000426','processmgr.cmd?method=uploadProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000427','processmgr.cmd?method=startProcessMgr','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000428','processmgr.cmd?method=stopProcessMgr','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000429','processmgr.cmd?method=deleteProcessMgr','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000430','activityadmin.cmd?method=suspendActivity','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000431','activityadmin.cmd?method=resumeActivity','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000432','activityadmin.cmd?method=abortActivity','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000433','activityadmin.cmd?method=terminateActivity','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000434','activityadmin.cmd?method=showhistoryActivity','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000435','assignmentadmin.cmd?method=cancelAssignment','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000436','assignmentadmin.cmd?method=reAssignment','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000437','assignmentadmin.cmd?method=closeAssignment','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000438','processadmin.cmd?method=suspendProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000439','processadmin.cmd?method=resumeProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000440','processadmin.cmd?method=abortProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000441','processadmin.cmd?method=terminateProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000442','processadmin.cmd?method=terminateProcessAndDeleteProcessEnd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000443','processadmin.cmd?method=showhistoryProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000444','processadmin.cmd?method=checklimitProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000445','processadmin.cmd?method=historyCompare','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000446','processalladmin.cmd?method=startActivity','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000447','processalladmin.cmd?method=suspendProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000448','processalladmin.cmd?method=resumeProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000449','processalladmin.cmd?method=abortProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000450','processalladmin.cmd?method=terminateProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000451','processalladmin.cmd?method=terminateProcessAndDeleteProcessEnd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000452','processalladmin.cmd?method=showhistoryProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000453','processalladmin.cmd?method=checklimitProcess','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000454','processalladmin.cmd?method=historyCompare','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000455','processalladminquery.cmd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000456','taskinfo.cmd?method=displaystatus','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000457','processendadmin.cmd?method=deleteProcessEnd','WORKFLOW1301','WORKFLOW13','null'),
 ('BPM000000000000000000000000458','role.cmd?method=getSysRoleNode','WORKFLOW0301','WORKFLOW03','null'),
 ('BPM040101000000000000000000001','clbx.cmd?method=create','WORKFLOW040101','WORKFLOW0401','null'),
 ('BPM040101000000000000000000002','clbx.cmd?method=createAndSend','WORKFLOW040101','WORKFLOW0401','null'),
 ('BPM040101000000000000000000003','clbx.cmd?method=send','WORKFLOW040101','WORKFLOW0401','null'),
 ('BPM040101000000000000000000004','clbx.cmd?method=back','WORKFLOW040101','WORKFLOW0401','null'),
 ('BPM040101000000000000000000005','clbx.cmd?method=forinsert','WORKFLOW040101','WORKFLOW0401','null'),
 ('BPM040101000000000000000000006','clbx.cmd?method=forupdate','WORKFLOW040101','WORKFLOW0401','null'),
 ('BPM040101000000000000000000007','clbx.cmd?method=detail','WORKFLOW040101','WORKFLOW0401','null'),
 ('BPM040101000000000000000000008','clbx.cmd?method=update','WORKFLOW040101','WORKFLOW0401','null'),
 ('COMMON00000000000000000002','jsp/readVersion.jsp','BASE000901','BASE0009','null'),
 ('DEMO02010101','inboxmailquery.cmd','DEMO020101','DEMO0201','null'),
 ('DEMO02010102','mailfolder.cmd?method=getNewMessageCount','DEMO020101','DEMO0201','null'),
 ('DEMO02010103','mailblacklist.cmd?method=forinsert','DEMO020101','DEMO0201','null'),
 ('DEMO02010104','mailfolder.cmd?method=getMailInfo','DEMO020101','DEMO0201','null'),
 ('DEMO02010105','mailblacklist.cmd?method=insertForBlackList','DEMO020101','DEMO0201','null'),
 ('DEMO02010106','mailblacklist.cmd?method=delete','DEMO020101','DEMO0201','null'),
 ('DEMO02010107','mailblacklist.cmd?method=insert','DEMO020101','DEMO0201','null'),
 ('DEMO02010108','doccontent.cmd?method=detail','DEMO020101','DEMO0201','null'),
 ('DEMO02020101','mailstatusquery.cmd','DEMO020201','DEMO0202','null'),
 ('DEMO02020102','sendmailquery.cmd','DEMO020201','DEMO0202','null'),
 ('DEMO02020103','alreadysendmailquery.cmd','DEMO020201','DEMO0202','null'),
 ('DEMO02020104','draftmailquery.cmd','DEMO020201','DEMO0202','null'),
 ('DEMO02020105','garbagemailquery.cmd','DEMO020201','DEMO0202','null'),
 ('DEMO02030101','mailresource.cmd?method=sendDraft','DEMO020301','DEMO0203','null'),
 ('DEMO02030102','mailresource.cmd?method=updateDraft','DEMO020301','DEMO0203','null'),
 ('DEMO02030103','mailresource.cmd?method=deleteDetail','DEMO020301','DEMO0203','null'),
 ('DEMO02030104','mailresource.cmd?method=forback','DEMO020301','DEMO0203','null'),
 ('DEMO02030105','mailaddress.cmd?method=gettreeroot_category_card','DEMO020301','DEMO0203','null'),
 ('DEMO02030106','mailresource.cmd?method=saveBack','DEMO020301','DEMO0203','null'),
 ('DEMO02030107','mailresource.cmd?method=sendBack','DEMO020301','DEMO0203','null'),
 ('DEMO02030108','mailresource.cmd?method=fortransmit','DEMO020301','DEMO0203','null'),
 ('DEMO02030109','mailaddress.cmd?method=forInboxCardInsert','DEMO020301','DEMO0203','null'),
 ('DEMO02030110','mailresource.cmd?method=delete','DEMO020301','DEMO0203','null'),
 ('DEMO02030111','mailresource.cmd?method=thoroughDelete','DEMO020301','DEMO0203','null'),
 ('DEMO02030112','mailresource.cmd?method=saveTransmit','DEMO020301','DEMO0203','null'),
 ('DEMO02030113','mailresource.cmd?method=sendTransmit','DEMO020301','DEMO0203','null'),
 ('DEMO02030114','mailaddress.cmd?method=gettreebranch_category_card2','DEMO020301','DEMO0203','null'),
 ('DEMO02030115','mailaddress.cmd?method=inboxCardInsert','DEMO020301','DEMO0203','null'),
 ('DEMO02030116','mailresource.cmd?method=sendMail','DEMO020301','DEMO0203','null'),
 ('DEMO02030117','mailresource.cmd?method=detail','DEMO020301','DEMO0203','null'),
 ('DEMO02030118','mailresource.cmd?method=forinsertAddrss','DEMO020301','DEMO0203','null'),
 ('DEMO02030119','mailaddress.cmd?method=forupdate','DEMO020301','DEMO0203','null'),
 ('DEMO02030120','mailresource.cmd?method=saveDraft','DEMO020301','DEMO0203','null'),
 ('DEMO02030121','mailaddress.cmd?method=update','DEMO020301','DEMO0203','null'),
 ('DEMO02030122','mailresource.cmd?method=forinsert','DEMO020301','DEMO0203','null'),
 ('DEMO02030123','mailresource.cmd?method=forupdate','DEMO020301','DEMO0203','null'),
 ('DEMO02030124','mailaddress.cmd?method=gettreebranch','DEMO020301','DEMO0203','null'),
 ('DEMO02030125','mailaddress.cmd?method=forinsert','DEMO020301','DEMO0203','null'),
 ('DEMO02030126','mailaddress.cmd?method=detail','DEMO020301','DEMO0203','null'),
 ('DEMO02030127','mailaddress.cmd?method=insert','DEMO020301','DEMO0203','null'),
 ('DEMO02030128','mailaddress.cmd?method=impOrgToTeamRoot','DEMO020301','DEMO0203','null'),
 ('DEMO02030129','mailaddress.cmd?method=gettreebranch_category_card','DEMO020301','DEMO0203','null'),
 ('DEMO02030130','mailaddress.cmd?method=impOrgToTeamNode','DEMO020301','DEMO0203','null'),
 ('DEMO02030131','mailaddress.cmd?method=forInsertOrganToMailAddressGroup','DEMO020301','DEMO0203','null'),
 ('DEMO02030132','mailaddress.cmd?method=insertOrganToMailAddressGroup','DEMO020301','DEMO0203','null'),
 ('DEMO02030133','mailaddress.cmd?method=delete','DEMO020301','DEMO0203','null'),
 ('DEMO02030134','mailresource.cmd?method=thoroughDeleteDetail','DEMO020301','DEMO0203','null'),
 ('DEMO02030135','mailaddress.cmd?method=forInsertCardInGroup','DEMO020301','DEMO0203','null'),
 ('DEMO02030136','mailaddress.cmd?method=insertCardInGroup','DEMO020301','DEMO0203','null'),
 ('DEMO02030137','mailaddress.cmd?method=getPersonAddressRoot','DEMO020301','DEMO0203','null'),
 ('DEMO02030138','mailaddress.cmd?method=getEmpRoot','DEMO020301','DEMO0203','null'),
 ('DEMO02030139','mailaddress.cmd?method=getChoiceNode','DEMO020301','DEMO0203','null'),
 ('DEMO02030140','mailaddress.cmd?method=addressMain','DEMO020301','DEMO0203','null'),
 ('DEMO02030141','mailaddress.cmd?method=getPersonAddressNode','DEMO020301','DEMO0203','null'),
 ('DEMO02040101','mailfoldertree.cmd?method=getServerType','DEMO020401','DEMO0204','null'),
 ('DEMO02040102','custommailquery.cmd','DEMO020401','DEMO0204','null'),
 ('DEMO02050101','mailresourcegeneryquery.cmd','DEMO020501','DEMO0205','null'),
 ('DEMO02060101','mailaccountgeneryquery.cmd','DEMO020601','DEMO0206','null'),
 ('DEMO02070101','mailaccount.cmd?method=forupdate','DEMO020701','DEMO0207','null'),
 ('DEMO02070102','mailaccount.cmd?method=verify','DEMO020701','DEMO0207','null'),
 ('DEMO02070103','mailaccount.cmd?method=update','DEMO020701','DEMO0207','null'),
 ('DEMO02080101','mailaddresscategory.cmd?method=gettreeparent','DEMO020801','DEMO0208','null'),
 ('DEMO02080102','mailaddresscategory.cmd?method=gettreeroot','DEMO020801','DEMO0208','null'),
 ('DEMO02080103','mailaddresscategory.cmd?method=detail','DEMO020801','DEMO0208','null'),
 ('DEMO02080104','mailaddresscategory.cmd?method=forinsert','DEMO020801','DEMO0208','null'),
 ('DEMO02080105','mailaddresscategory.cmd?method=forupdate','DEMO020801','DEMO0208','null'),
 ('DEMO02080106','mailaddresscategory.cmd?method=delete','DEMO020801','DEMO0208','null'),
 ('DEMO02080107','mailaddresscategory.cmd?method=insert','DEMO020801','DEMO0208','null'),
 ('DEMO02080108','mailaddresscategory.cmd?method=update','DEMO020801','DEMO0208','null'),
 ('DEMO02090101','mailblacklistquery.cmd','DEMO020901','DEMO0209','null'),
 ('DEMO02100101','defmailconfig.cmd?method=update','DEMO021001','DEMO0210','null'),
 ('DEMO02100102','defmailconfig.cmd?method=forupdate','DEMO021001','DEMO0210','null'),
 ('webeditgrid0101','goodsquery_page_init.cmd','webeditgrid01','webeditgrid',NULL),
 ('webeditgrid0102','goods.cmd?method=querySearch','webeditgrid01','webeditgrid',NULL),
 ('webeditgrid0103','foodquery_page_init.cmd','webeditgrid01','webeditgrid',NULL),
 ('webeditgrid0104','food.cmd?method=querySearch','webeditgrid01','webeditgrid',NULL),
 ('webeditgrid0201','goods.cmd?method=forinsert','webeditgrid02','webeditgrid',NULL),
 ('webeditgrid0202','goods.cmd?method=saveandinsert','webeditgrid02','webeditgrid',NULL),
 ('webeditgrid0203','goods.cmd?method=insert','webeditgrid02','webeditgrid',NULL),
 ('webeditgrid0204','goods.cmd?method=insertContinue','webeditgrid02','webeditgrid',NULL),
 ('webeditgrid0205','goods.cmd?method=saveandquery','webeditgrid02','webeditgrid',NULL),
 ('webeditgrid0206','food.cmd?method=forinsert','webeditgrid02','webeditgrid',NULL),
 ('webeditgrid0207','food.cmd?method=insert','webeditgrid02','webeditgrid',NULL),
 ('webeditgrid0208','food.cmd?method=insertContinue','webeditgrid02','webeditgrid',NULL),
 ('webeditgrid0209','food.cmd?method=saveandquery','webeditgrid02','webeditgrid',NULL),
 ('webeditgrid0301','goods.cmd?method=forupdate','webeditgrid03','webeditgrid',NULL),
 ('webeditgrid0302','goods.cmd?method=update','webeditgrid03','webeditgrid',NULL),
 ('webeditgrid0303','goods.cmd?method=saveandupdate','webeditgrid03','webeditgrid',NULL),
 ('webeditgrid0304','food.cmd?method=forupdate','webeditgrid03','webeditgrid',NULL),
 ('webeditgrid0305','food.cmd?method=update','webeditgrid03','webeditgrid',NULL),
 ('webeditgrid0306','food.cmd?method=saveandupdate','webeditgrid03','webeditgrid',NULL),
 ('webeditgrid0401','goods.cmd?method=delete','webeditgrid04','webeditgrid',NULL),
 ('webeditgrid0402','food.cmd?method=delete','webeditgrid04','webeditgrid',NULL),
 ('webeditgrid0501','goods.cmd?method=detail','webeditgrid05','webeditgrid',NULL),
 ('webeditgrid0502','food.cmd?method=detail','webeditgrid05','webeditgrid',NULL),
 ('webflexgrid0101','flexgridquery_page_init.cmd','webflexgrid01','webflexgrid',NULL),
 ('webflexgrid0201','flexgrid.cmd?method=forinsert','webflexgrid02','webflexgrid',NULL),
 ('webflexgrid0202','flexgrid.cmd?method=insert','webflexgrid02','webflexgrid',NULL),
 ('webflexgrid0203','flexgrid.cmd?method=insertContinue','webflexgrid02','webflexgrid',NULL),
 ('webflexgrid0301','flexgrid.cmd?method=update','webflexgrid03','webflexgrid',NULL),
 ('webflexgrid0302','flexgrid.cmd?method=forupdate','webflexgrid03','webflexgrid',NULL),
 ('webflexgrid0401','flexgrid.cmd?method=delete','webflexgrid04','webflexgrid',NULL),
 ('webflexgrid0501','flexgrid.cmd?method=detail','webflexgrid05','webflexgrid',NULL),
 ('webflexgrid0601','flexgrid.cmd?method=getProvinces','webflexgrid06','webflexgrid',NULL),
 ('webflexgrid0602','flexgrid.cmd?method=getCitys','webflexgrid06','webflexgrid',NULL),
 ('webgrid0101','productquery_page_init.cmd','webgrid01','webgrid',NULL),
 ('webgrid0102','maingridquery_page_init.cmd','webgrid01','webgrid',NULL),
 ('webgrid0201','maingrid.cmd?method=insert','webgrid02','webgrid',NULL),
 ('webgrid0202','product.cmd?method=insertContinue','webgrid02','webgrid',NULL),
 ('webgrid0203','product.cmd?method=insert','webgrid02','webgrid',NULL),
 ('webgrid0204','product.cmd?method=forinsert','webgrid02','webgrid',NULL),
 ('webgrid0205','maingrid.cmd?method=insertContinue','webgrid02','webgrid',NULL),
 ('webgrid0206','maingrid.cmd?method=forinsert','webgrid02','webgrid',NULL),
 ('webgrid0301','product.cmd?method=forupdate','webgrid03','webgrid',NULL),
 ('webgrid0302','maingrid.cmd?method=forupdate','webgrid03','webgrid',NULL),
 ('webgrid0303','product.cmd?method=update','webgrid03','webgrid',NULL),
 ('webgrid0304','maingrid.cmd?method=update','webgrid03','webgrid',NULL),
 ('webgrid0401','maingrid.cmd?method=delete','webgrid04','webgrid',NULL),
 ('webgrid0402','product.cmd?method=delete','webgrid04','webgrid',NULL),
 ('webgrid0501','product.cmd?method=detail','webgrid05','webgrid',NULL),
 ('webgrid0502','maingrid.cmd?method=detail','webgrid05','webgrid',NULL),
 ('webhtml0101','lsemployeequery_page_init.cmd','webhtml01','webhtml',NULL),
 ('webhtml0201','lsemployee.cmd?method=insert','webhtml02','webhtml',NULL),
 ('webhtml0202','lsemployee.cmd?method=forinsert','webhtml02','webhtml',NULL),
 ('webhtml0203','lsemployee.cmd?method=insertContinue','webhtml02','webhtml',NULL),
 ('webhtml0301','lsemployee.cmd?method=forupdate','webhtml03','webhtml',NULL),
 ('webhtml0302','lsemployee.cmd?method=update','webhtml03','webhtml',NULL),
 ('webhtml0401','lsemployee.cmd?method=delete','webhtml04','webhtml',NULL),
 ('webhtml0501','lsemployee.cmd?method=detail','webhtml05','webhtml',NULL),
 ('webhtml0601','lsemployee.cmd?method=getProvinces','webhtml06','webhtml',NULL),
 ('webhtml0602','lsemployee.cmd?method=getCitys','webhtml06','webhtml',NULL),
 ('webhtml0603','lsemployee.cmd?method=getImgUrl','webhtml06','webhtml',NULL),
 ('webhtml0701','lsemployee.cmd?method=asynDelete','webhtml07','webhtml',NULL),
 ('webtree0101','organstruquery_page_init.cmd','webtree01','webtree',NULL),
 ('webtree0201','organstru.cmd?method=insert','webtree02','webtree',NULL),
 ('webtree0202','organstru.cmd?method=forinsert','webtree02','webtree',NULL),
 ('webtree0203','organstru.cmd?method=insertContinue','webtree02','webtree',NULL),
 ('webtree0301','organstru.cmd?method=forupdate','webtree03','webtree',NULL),
 ('webtree0302','organstru.cmd?method=update','webtree03','webtree',NULL),
 ('webtree0401','organstru.cmd?method=delete','webtree04','webtree',NULL),
 ('webtree0501','organstru.cmd?method=detail','webtree05','webtree',NULL),
 ('webtree0601','organstru.cmd?method=query','webtree06','webtree',NULL),
 ('webtree0701','organstru.cmd?method=getRoot','webtree07','webtree',NULL),
 ('webtree0702','organstru.cmd?method=getChildren','webtree07','webtree',NULL),
 ('webtree0801','organstru.cmd?method=getHelp','webtree08','webtree',NULL),
 ('webtree0802','organstru.cmd?method=getHelpCh','webtree08','webtree',NULL),
 ('webtree0901','organstru.cmd?method=changeStruOrder','webtree09','webtree',NULL),
 ('webtree0902','organstru.cmd?method=getChangeOrderRoot','webtree09','webtree',NULL),
 ('webtree0903','organstru.cmd?method=getCheckChild','webtree09','webtree',NULL),
 ('webupload0101','mainblobquery_page_init.cmd','webupload01','webupload',NULL),
 ('webupload0201','mainblob.cmd?method=forinsert','webupload02','webupload',NULL),
 ('webupload0202','mainblob.cmd?method=insertContinue','webupload02','webupload',NULL),
 ('webupload0203','mainblob.cmd?method=insert','webupload02','webupload',NULL),
 ('webupload0301','mainblob.cmd?method=update','webupload03','webupload',NULL),
 ('webupload0302','mainblob.cmd?method=forupdate','webupload03','webupload',NULL),
 ('webupload0401','mainblob.cmd?method=delete','webupload04','webupload',NULL),
 ('webupload0501','mainblob.cmd?method=detail','webupload05','webupload',NULL),
 ('webzuhe0101','combocollectionquery_page_init.cmd','webzuhe01','webzuhe',NULL),
 ('webzuhe0102','comboboxtestquery_page_init.cmd','webzuhe01','webzuhe',NULL),
 ('webzuhe0201','combocollection.cmd?method=insert','webzuhe02','webzuhe',NULL),
 ('webzuhe0202','comboboxtest.cmd?method=test','webzuhe02','webzuhe',NULL),
 ('webzuhe0203','comboboxtest.cmd?method=forinsert','webzuhe02','webzuhe',NULL),
 ('webzuhe0204','combocollection.cmd?method=insertContinue','webzuhe02','webzuhe',NULL),
 ('webzuhe0205','comboboxtest.cmd?method=insertContinue','webzuhe02','webzuhe',NULL),
 ('webzuhe0206','comboboxtest.cmd?method=insert','webzuhe02','webzuhe',NULL),
 ('webzuhe0207','combocollection.cmd?method=forinsert','webzuhe02','webzuhe',NULL),
 ('webzuhe0301','comboboxtest.cmd?method=update','webzuhe03','webzuhe',NULL),
 ('webzuhe0302','combocollection.cmd?method=update','webzuhe03','webzuhe',NULL),
 ('webzuhe0303','comboboxtest.cmd?method=forupdate','webzuhe03','webzuhe',NULL),
 ('webzuhe0304','combocollection.cmd?method=forupdate','webzuhe03','webzuhe',NULL),
 ('webzuhe0401','combocollection.cmd?method=delete','webzuhe04','webzuhe',NULL),
 ('webzuhe0402','comboboxtest.cmd?method=delete','webzuhe04','webzuhe',NULL),
 ('webzuhe0501','combocollection.cmd?method=detail','webzuhe05','webzuhe',NULL),
 ('webzuhe0502','comboboxtest.cmd?method=detail','webzuhe05','webzuhe',NULL);
/*!40000 ALTER TABLE `pub_urls` ENABLE KEYS */;


--
-- Definition of table `pub_user_dataref`
--

DROP TABLE IF EXISTS `pub_user_dataref`;
CREATE TABLE `pub_user_dataref` (
  `REF_ID` varchar(30) NOT NULL,
  `USER_ID` varchar(30) NOT NULL,
  `RES_VALUE` varchar(80) NOT NULL,
  `DATA_RES_TYPE` varchar(10) NOT NULL,
  `IS_DEFAULT` char(1) NOT NULL DEFAULT '0',
  `IN_USE` char(1) NOT NULL DEFAULT '1',
  `STRU_ID` varchar(30) DEFAULT NULL,
  `STRU_TYPE` varchar(10) DEFAULT NULL,
  `IS_WRITABLE` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`REF_ID`),
  KEY `IDX_PUB_DATAREF_01` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_user_dataref`
--

/*!40000 ALTER TABLE `pub_user_dataref` DISABLE KEYS */;
INSERT INTO `pub_user_dataref` (`REF_ID`,`USER_ID`,`RES_VALUE`,`DATA_RES_TYPE`,`IS_DEFAULT`,`IN_USE`,`STRU_ID`,`STRU_TYPE`,`IS_WRITABLE`) VALUES 
 ('30428836659686349298','GPUBLIC','4','MSG_TYPE','1','1',NULL,'null','1');
/*!40000 ALTER TABLE `pub_user_dataref` ENABLE KEYS */;


--
-- Definition of table `pub_user_parms`
--

DROP TABLE IF EXISTS `pub_user_parms`;
CREATE TABLE `pub_user_parms` (
  `USER_ID` varchar(30) NOT NULL,
  `PARMS_NAME` varchar(60) NOT NULL,
  `PARMS_VALUE` varchar(250) NOT NULL,
  `NOTE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`PARMS_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_user_parms`
--

/*!40000 ALTER TABLE `pub_user_parms` DISABLE KEYS */;
INSERT INTO `pub_user_parms` (`USER_ID`,`PARMS_NAME`,`PARMS_VALUE`,`NOTE`) VALUES 
 ('SUPERADMIN','PUB_BSP_NEWMENU','S01',NULL);
/*!40000 ALTER TABLE `pub_user_parms` ENABLE KEYS */;


--
-- Definition of table `pub_user_proxy`
--

DROP TABLE IF EXISTS `pub_user_proxy`;
CREATE TABLE `pub_user_proxy` (
  `USER_ID` varchar(30) NOT NULL,
  `PROXY_USER_ID` varchar(30) NOT NULL,
  PRIMARY KEY (`USER_ID`,`PROXY_USER_ID`),
  KEY `PUBUSERPROXY_FK2` (`PROXY_USER_ID`),
  CONSTRAINT `PUBUSERPROXY_FK1` FOREIGN KEY (`USER_ID`) REFERENCES `pub_users` (`USER_ID`),
  CONSTRAINT `PUBUSERPROXY_FK2` FOREIGN KEY (`PROXY_USER_ID`) REFERENCES `pub_users` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_user_proxy`
--

/*!40000 ALTER TABLE `pub_user_proxy` DISABLE KEYS */;
INSERT INTO `pub_user_proxy` (`USER_ID`,`PROXY_USER_ID`) VALUES 
 ('CPUBLIC','INTERFACEUSER'),
 ('GPUBLIC','INTERFACEUSER'),
 ('CPUBLIC','SUPERADMIN'),
 ('GPUBLIC','SUPERADMIN'),
 ('CPUBLIC','SYSADMIN'),
 ('GPUBLIC','SYSADMIN');
/*!40000 ALTER TABLE `pub_user_proxy` ENABLE KEYS */;


--
-- Definition of table `pub_user_role`
--

DROP TABLE IF EXISTS `pub_user_role`;
CREATE TABLE `pub_user_role` (
  `USER_ID` varchar(30) NOT NULL,
  `GRANTED_ROLE` varchar(30) NOT NULL,
  `ADMIN_OPTION` char(1) NOT NULL DEFAULT '0',
  `DEFAULT_ROLE` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`USER_ID`,`GRANTED_ROLE`),
  KEY `PUBUSERROLE_FK2` (`GRANTED_ROLE`),
  CONSTRAINT `PUBUSERROLE_FK1` FOREIGN KEY (`USER_ID`) REFERENCES `pub_users` (`USER_ID`),
  CONSTRAINT `PUBUSERROLE_FK2` FOREIGN KEY (`GRANTED_ROLE`) REFERENCES `pub_roles` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_user_role`
--

/*!40000 ALTER TABLE `pub_user_role` DISABLE KEYS */;
INSERT INTO `pub_user_role` (`USER_ID`,`GRANTED_ROLE`,`ADMIN_OPTION`,`DEFAULT_ROLE`) VALUES 
 ('GPUBLIC','GPUBLIC','1','1'),
 ('INTERFACEUSER','SUPERADMIN','1','1'),
 ('SUPERADMIN','SUPERADMIN','1','1'),
 ('SYSADMIN','SYSADMIN','1','1');
/*!40000 ALTER TABLE `pub_user_role` ENABLE KEYS */;


--
-- Definition of table `pub_users`
--

DROP TABLE IF EXISTS `pub_users`;
CREATE TABLE `pub_users` (
  `USER_ID` varchar(30) NOT NULL,
  `EXTERNAL_USER` varchar(30) NOT NULL,
  `USER_NAME` varchar(200) NOT NULL,
  `PASSWORD` varchar(128) NOT NULL,
  `ACCOUNT_STATUS` char(2) NOT NULL DEFAULT '11',
  `SECURITY_LEVEL` int(11) NOT NULL,
  `MAX_SESSIONS` int(11) NOT NULL DEFAULT '-1',
  `IS_SYS` char(1) NOT NULL DEFAULT '0',
  `IS_CPUBLIC` char(1) NOT NULL DEFAULT '0',
  `CREATE_TIME` char(17) NOT NULL,
  `LOCK_TIME` char(17) DEFAULT NULL,
  `EXPIRED_TIME` char(17) DEFAULT NULL,
  `PSWD_UPT_TIME` char(17) DEFAULT NULL,
  `PSWD_TIME` char(17) DEFAULT NULL,
  `CORPORATION_ID` varchar(200) NOT NULL,
  `DEPARTMENT_ID` varchar(200) NOT NULL,
  `EMPLOYEE_ID` varchar(200) DEFAULT NULL,
  `E_MAIL` varchar(80) DEFAULT NULL,
  `MSN` varchar(80) DEFAULT NULL,
  `QQ` varchar(20) DEFAULT NULL,
  `MOBILE` varchar(60) DEFAULT NULL,
  `CHAR_1` varchar(60) DEFAULT NULL,
  `CHAR_2` varchar(60) DEFAULT NULL,
  `NUM_1` decimal(10,0) DEFAULT NULL,
  `NUM_2` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `IDX_PUB_USERS_01` (`CORPORATION_ID`),
  KEY `IDX_PUB_USERS_02` (`DEPARTMENT_ID`),
  KEY `IDX_PUB_USERS_03` (`EMPLOYEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_users`
--

/*!40000 ALTER TABLE `pub_users` DISABLE KEYS */;
INSERT INTO `pub_users` (`USER_ID`,`EXTERNAL_USER`,`USER_NAME`,`PASSWORD`,`ACCOUNT_STATUS`,`SECURITY_LEVEL`,`MAX_SESSIONS`,`IS_SYS`,`IS_CPUBLIC`,`CREATE_TIME`,`LOCK_TIME`,`EXPIRED_TIME`,`PSWD_UPT_TIME`,`PSWD_TIME`,`CORPORATION_ID`,`DEPARTMENT_ID`,`EMPLOYEE_ID`,`E_MAIL`,`MSN`,`QQ`,`MOBILE`,`CHAR_1`,`CHAR_2`,`NUM_1`,`NUM_2`) VALUES 
 ('CPUBLIC','CPUBLIC','CPUBLIC','6f0ab45e4fa20959cde003299b4650e8','11',9,0,'0','1','20100101 00:00:00',NULL,'99991231 23:59:59','99991231 23:59:59','99991231 23:59:59','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
 ('GPUBLIC','GPUBLIC','GPUBLIC','6f0ab45e4fa20959cde003299b4650e8','11',9,0,'0','0','20100101 00:00:00',NULL,'99991231 23:59:59','99991231 23:59:59','99991231 23:59:59','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
 ('INTERFACEUSER','01','interfaceuser','cdfffceb6461c2df2edaae5b584e1611','11',0,-1,'1','0','20100101 00:00:00',NULL,'99991231 23:59:59','99991231 23:59:59','99991231 23:59:59','1','1','S00000000000101',NULL,NULL,NULL,NULL,'0',NULL,'0','0'),
 ('SUPERADMIN','01','管理员','3717899947309943906f34b6305900e2','11',9,-1,'1','0','20100101 00:00:00',NULL,'99991231 23:59:59','99991231 23:59:59','99991231 23:59:59','1','1','Smessage0105',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
 ('SYSADMIN','SYSADMIN','SYSADMIN','f54a1af3fe3dfe9625c5e3fba04df4b2','11',9,100,'1','0','20100101 00:00:00',NULL,'99991231 23:59:59','99991231 23:59:59','99991231 23:59:59','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0');
/*!40000 ALTER TABLE `pub_users` ENABLE KEYS */;


--
-- Definition of table `pub_workplace`
--

DROP TABLE IF EXISTS `pub_workplace`;
CREATE TABLE `pub_workplace` (
  `WORKPLACE_ID` varchar(30) NOT NULL,
  `WORKPLACE_CODE` varchar(30) NOT NULL,
  `WORKPLACE_NAME` varchar(100) NOT NULL,
  `SHORT_NAME` varchar(30) DEFAULT NULL,
  `CANT_CODE` varchar(20) NOT NULL,
  `LINKMAN` varchar(120) DEFAULT NULL,
  `TEL` varchar(80) DEFAULT NULL,
  `FAX` varchar(80) DEFAULT NULL,
  `E_MAIL` varchar(80) DEFAULT NULL,
  `WWW` varchar(250) DEFAULT NULL,
  `POST_CODE` varchar(20) DEFAULT NULL,
  `POST_ADDRESS` varchar(250) DEFAULT NULL,
  `ENGLISH_ADDRESS` varchar(250) DEFAULT NULL,
  `AM_START_TIME` char(8) NOT NULL,
  `AM_END_TIME` char(8) NOT NULL,
  `PM_START_TIME` char(8) NOT NULL,
  `PM_END_TIME` char(8) NOT NULL,
  PRIMARY KEY (`WORKPLACE_ID`),
  KEY `PUBWORKPLACE_FK1` (`CANT_CODE`),
  CONSTRAINT `PUBWORKPLACE_FK1` FOREIGN KEY (`CANT_CODE`) REFERENCES `pub_cant` (`CANT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pub_workplace`
--

/*!40000 ALTER TABLE `pub_workplace` DISABLE KEYS */;
INSERT INTO `pub_workplace` (`WORKPLACE_ID`,`WORKPLACE_CODE`,`WORKPLACE_NAME`,`SHORT_NAME`,`CANT_CODE`,`LINKMAN`,`TEL`,`FAX`,`E_MAIL`,`WWW`,`POST_CODE`,`POST_ADDRESS`,`ENGLISH_ADDRESS`,`AM_START_TIME`,`AM_END_TIME`,`PM_START_TIME`,`PM_END_TIME`) VALUES 
 ('1','01','缺省工作地点','缺省工作地点','100000','无','无','无','无','无','无','无','无','08:00:00','12:00:00','14:00:00','18:00:00');
/*!40000 ALTER TABLE `pub_workplace` ENABLE KEYS */;


--
-- Definition of table `selectdata`
--

DROP TABLE IF EXISTS `selectdata`;
CREATE TABLE `selectdata` (
  `ID` varchar(255) NOT NULL,
  `DATAID` varchar(255) NOT NULL,
  `FIELDNAME` varchar(60) DEFAULT NULL,
  `DISPLAYURL` varchar(255) DEFAULT NULL,
  `DISPLAYSTR` varchar(255) DEFAULT NULL,
  `KEYVALUE` varchar(255) DEFAULT NULL,
  `FORMID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`,`DATAID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `selectdata`
--

/*!40000 ALTER TABLE `selectdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `selectdata` ENABLE KEYS */;


--
-- Definition of table `service_task_info`
--

DROP TABLE IF EXISTS `service_task_info`;
CREATE TABLE `service_task_info` (
  `ID` varchar(32) NOT NULL,
  `SERVICE` varchar(50) NOT NULL,
  `METHOD` varchar(50) NOT NULL,
  `REGISTER_TIME` char(17) DEFAULT NULL,
  `START_TIME` char(17) DEFAULT NULL,
  `END_TIME` char(17) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service_task_info`
--

/*!40000 ALTER TABLE `service_task_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_task_info` ENABLE KEYS */;


--
-- Definition of table `wf_accredit_event_audit`
--

DROP TABLE IF EXISTS `wf_accredit_event_audit`;
CREATE TABLE `wf_accredit_event_audit` (
  `EVENT_AUDIT_ID` varchar(40) NOT NULL,
  `OLD_USER_NAME` varchar(255) DEFAULT NULL,
  `OLD_NAME` varchar(255) DEFAULT NULL,
  `NEW_USER_NAME` varchar(255) DEFAULT NULL,
  `NEW_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EVENT_AUDIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_accredit_event_audit`
--

/*!40000 ALTER TABLE `wf_accredit_event_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_accredit_event_audit` ENABLE KEYS */;


--
-- Definition of table `wf_activity`
--

DROP TABLE IF EXISTS `wf_activity`;
CREATE TABLE `wf_activity` (
  `ACTIVITY_ID` varchar(255) NOT NULL,
  `PROCESS_ID` varchar(255) DEFAULT NULL,
  `SET_DEFINITION_ID` varchar(60) DEFAULT NULL,
  `DEFINITION_ID` varchar(60) DEFAULT NULL,
  `SUB_FLOW_ID` varchar(60) DEFAULT NULL,
  `BLOCK_ID` varchar(60) DEFAULT NULL,
  `IS_ACCEPTED` char(1) DEFAULT NULL,
  `ACTIVITY_NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `CURRENT_STATE` varchar(255) DEFAULT NULL,
  `PRIORITY` decimal(18,0) DEFAULT NULL,
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIVATED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ACCEPTED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_STATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `FORM_ID` varchar(60) DEFAULT NULL,
  `SOURCE_REFERENCE_ID` varchar(60) DEFAULT NULL,
  `PREVIOUS_ACTIVITY` varchar(255) DEFAULT NULL,
  `PREVIOUS_ACTIVITY_NAME` varchar(255) DEFAULT NULL,
  `PREVIOUS_RESOURCE` varchar(60) DEFAULT NULL,
  `PREVIOUS_RESOURCE_NAME` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ACTIVITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_activity`
--

/*!40000 ALTER TABLE `wf_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_activity` ENABLE KEYS */;


--
-- Definition of table `wf_activity_end`
--

DROP TABLE IF EXISTS `wf_activity_end`;
CREATE TABLE `wf_activity_end` (
  `PROCESS_ID` varchar(255) DEFAULT NULL,
  `ACTIVITY_ID` varchar(255) NOT NULL,
  `SET_DEFINITION_ID` varchar(60) DEFAULT NULL,
  `DEFINITION_ID` varchar(60) DEFAULT NULL,
  `SUB_FLOW_ID` varchar(60) DEFAULT NULL,
  `BLOCK_ID` varchar(60) DEFAULT NULL,
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIVATED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_STATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ACTIVITY_NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRIORITY` decimal(18,0) DEFAULT NULL,
  `FORM_ID` varchar(60) DEFAULT NULL,
  `SOURCE_REFERENCE_ID` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ACTIVITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_activity_end`
--

/*!40000 ALTER TABLE `wf_activity_end` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_activity_end` ENABLE KEYS */;


--
-- Definition of table `wf_activity_event_audit`
--

DROP TABLE IF EXISTS `wf_activity_event_audit`;
CREATE TABLE `wf_activity_event_audit` (
  `EVENT_AUDIT_ID` varchar(50) NOT NULL,
  `ACTIVITY_ID` varchar(255) DEFAULT NULL,
  `PRE_ACTIVITY_ID` varchar(255) DEFAULT NULL,
  `PRE_RES_KEY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EVENT_AUDIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_activity_event_audit`
--

/*!40000 ALTER TABLE `wf_activity_event_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_activity_event_audit` ENABLE KEYS */;


--
-- Definition of table `wf_activity_variable`
--

DROP TABLE IF EXISTS `wf_activity_variable`;
CREATE TABLE `wf_activity_variable` (
  `ACTIVITY_ID` varchar(255) NOT NULL,
  `DEFINITION_ID` varchar(255) NOT NULL,
  `VAR_VALUE` longblob,
  `IS_MODIFIED` char(1) DEFAULT NULL,
  PRIMARY KEY (`ACTIVITY_ID`,`DEFINITION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_activity_variable`
--

/*!40000 ALTER TABLE `wf_activity_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_activity_variable` ENABLE KEYS */;


--
-- Definition of table `wf_and_join`
--

DROP TABLE IF EXISTS `wf_and_join`;
CREATE TABLE `wf_and_join` (
  `AND_JOIN_ID` varchar(40) NOT NULL,
  `PROCESS_ID` varchar(255) DEFAULT NULL,
  `ACTIVITY_ID` varchar(255) DEFAULT NULL,
  `ACTIVITY_DEF_ID` varchar(255) DEFAULT NULL,
  `ACTIVITY_SET_DEF_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AND_JOIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_and_join`
--

/*!40000 ALTER TABLE `wf_and_join` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_and_join` ENABLE KEYS */;


--
-- Definition of table `wf_application_map`
--

DROP TABLE IF EXISTS `wf_application_map`;
CREATE TABLE `wf_application_map` (
  `PACKAGE_ID` varchar(255) NOT NULL,
  `PROCESS_DEF_ID` varchar(255) NOT NULL,
  `APPLICATION_DEF_ID` varchar(255) NOT NULL,
  `TOOL_AGENT_NAME` varchar(255) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `PASSWD` varchar(255) DEFAULT NULL,
  `APPLICATION_NAME` varchar(255) DEFAULT NULL,
  `APPLICATION_MODE` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`PACKAGE_ID`,`PROCESS_DEF_ID`,`APPLICATION_DEF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_application_map`
--

/*!40000 ALTER TABLE `wf_application_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_application_map` ENABLE KEYS */;


--
-- Definition of table `wf_assignment`
--

DROP TABLE IF EXISTS `wf_assignment`;
CREATE TABLE `wf_assignment` (
  `ACTIVITY_ID` varchar(255) NOT NULL,
  `PROCESS_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(255) NOT NULL,
  `FROM_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `THRU_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `STATUS_ID` varchar(40) DEFAULT NULL,
  `READ_MARK` decimal(18,0) DEFAULT NULL,
  `WORK_ORDER` decimal(18,0) DEFAULT NULL,
  `OLD_USER_ID` varchar(255) DEFAULT NULL,
  `OLD_RESOURCE_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ACTIVITY_ID`,`USER_ID`,`RESOURCE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_assignment`
--

/*!40000 ALTER TABLE `wf_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_assignment` ENABLE KEYS */;


--
-- Definition of table `wf_assignment_end`
--

DROP TABLE IF EXISTS `wf_assignment_end`;
CREATE TABLE `wf_assignment_end` (
  `ACTIVITY_ID` varchar(255) NOT NULL,
  `PROCESS_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `FROM_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `THRU_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ACTIVITY_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_assignment_end`
--

/*!40000 ALTER TABLE `wf_assignment_end` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_assignment_end` ENABLE KEYS */;


--
-- Definition of table `wf_assignment_event_audit`
--

DROP TABLE IF EXISTS `wf_assignment_event_audit`;
CREATE TABLE `wf_assignment_event_audit` (
  `EVENT_AUDIT_ID` varchar(40) NOT NULL,
  `OLD_USER_NAME` varchar(255) DEFAULT NULL,
  `OLD_NAME` varchar(255) DEFAULT NULL,
  `NEW_USER_NAME` varchar(255) DEFAULT NULL,
  `NEW_NAME` varchar(255) DEFAULT NULL,
  `IS_ACCEPTED` char(1) DEFAULT NULL,
  `OLD_TYPE` varchar(255) DEFAULT NULL,
  `NEW_TYPE` varchar(255) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EVENT_AUDIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_assignment_event_audit`
--

/*!40000 ALTER TABLE `wf_assignment_event_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_assignment_event_audit` ENABLE KEYS */;


--
-- Definition of table `wf_create_process_event_audit`
--

DROP TABLE IF EXISTS `wf_create_process_event_audit`;
CREATE TABLE `wf_create_process_event_audit` (
  `EVENT_AUDIT_ID` varchar(40) NOT NULL,
  `P_ACTIVITY_ID` varchar(255) DEFAULT NULL,
  `P_ACTIVITY_DEF_ID` varchar(255) DEFAULT NULL,
  `P_PROCESS_ID` varchar(255) DEFAULT NULL,
  `P_PROCESS_NAME` varchar(255) DEFAULT NULL,
  `P_PROCESS_DEF_ID` varchar(255) DEFAULT NULL,
  `P_PROCESS_DEF_NAME` varchar(255) DEFAULT NULL,
  `P_PROCESS_DEF_VER` varchar(255) DEFAULT NULL,
  `P_PACKAGE_ID` varchar(255) DEFAULT NULL,
  `P_ACTIVITY_SET_DEFINITION_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EVENT_AUDIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_create_process_event_audit`
--

/*!40000 ALTER TABLE `wf_create_process_event_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_create_process_event_audit` ENABLE KEYS */;


--
-- Definition of table `wf_data_event_audit`
--

DROP TABLE IF EXISTS `wf_data_event_audit`;
CREATE TABLE `wf_data_event_audit` (
  `EVENT_AUDIT_ID` varchar(40) NOT NULL,
  `OLD_DATA` varchar(255) DEFAULT NULL,
  `NEW_DATA` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EVENT_AUDIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_data_event_audit`
--

/*!40000 ALTER TABLE `wf_data_event_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_data_event_audit` ENABLE KEYS */;


--
-- Definition of table `wf_dataref`
--

DROP TABLE IF EXISTS `wf_dataref`;
CREATE TABLE `wf_dataref` (
  `ORGAN_ID` varchar(50) NOT NULL,
  `RES_ID` varchar(255) NOT NULL,
  `RES_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`ORGAN_ID`,`RES_ID`,`RES_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_dataref`
--

/*!40000 ALTER TABLE `wf_dataref` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_dataref` ENABLE KEYS */;


--
-- Definition of table `wf_deadline`
--

DROP TABLE IF EXISTS `wf_deadline`;
CREATE TABLE `wf_deadline` (
  `DEADLINE_ID` varchar(40) NOT NULL,
  `PROCESS_ID` varchar(255) DEFAULT NULL,
  `ACTIVITY_ID` varchar(255) DEFAULT NULL,
  `EXCEPTION_NAME` varchar(255) DEFAULT NULL,
  `TIME_LIMIT` decimal(18,0) DEFAULT NULL,
  `IS_SYNC` char(1) DEFAULT NULL,
  PRIMARY KEY (`DEADLINE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_deadline`
--

/*!40000 ALTER TABLE `wf_deadline` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_deadline` ENABLE KEYS */;


--
-- Definition of table `wf_event_audit`
--

DROP TABLE IF EXISTS `wf_event_audit`;
CREATE TABLE `wf_event_audit` (
  `EVENT_AUDIT_ID` varchar(40) NOT NULL,
  `AUDIT_TIME` varchar(255) DEFAULT NULL,
  `AUDIT_TYPE` varchar(255) DEFAULT NULL,
  `PACKAGE_ID` varchar(255) DEFAULT NULL,
  `PROCESS_ID` varchar(255) DEFAULT NULL,
  `PROCESS_NAME` varchar(255) DEFAULT NULL,
  `PROCESS_DEF_ID` varchar(255) DEFAULT NULL,
  `PROCESS_DEF_NAME` varchar(255) DEFAULT NULL,
  `PROCESS_DEF_VER` varchar(255) DEFAULT NULL,
  `ACTIVITY_ID` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME` varchar(255) DEFAULT NULL,
  `ACTIVITY_DEF_ID` varchar(255) DEFAULT NULL,
  `ACTIVITY_SET_DEFINITION_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EVENT_AUDIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_event_audit`
--

/*!40000 ALTER TABLE `wf_event_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_event_audit` ENABLE KEYS */;


--
-- Definition of table `wf_manage_configs`
--

DROP TABLE IF EXISTS `wf_manage_configs`;
CREATE TABLE `wf_manage_configs` (
  `CONFIG_NAME` varchar(255) NOT NULL,
  `CONFIG_CONTENT` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_manage_configs`
--

/*!40000 ALTER TABLE `wf_manage_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_manage_configs` ENABLE KEYS */;


--
-- Definition of table `wf_manage_files`
--

DROP TABLE IF EXISTS `wf_manage_files`;
CREATE TABLE `wf_manage_files` (
  `PROCESS_TYPE` varchar(255) NOT NULL,
  `FILE_NAME` varchar(255) NOT NULL,
  `FILE_CONTENT` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_manage_files`
--

/*!40000 ALTER TABLE `wf_manage_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_manage_files` ENABLE KEYS */;


--
-- Definition of table `wf_mapping`
--

DROP TABLE IF EXISTS `wf_mapping`;
CREATE TABLE `wf_mapping` (
  `MAPPING_ID` varchar(40) NOT NULL,
  `PROCESS_ID` varchar(255) DEFAULT NULL,
  `ACTIVITY_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MAPPING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_mapping`
--

/*!40000 ALTER TABLE `wf_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_mapping` ENABLE KEYS */;


--
-- Definition of table `wf_operation`
--

DROP TABLE IF EXISTS `wf_operation`;
CREATE TABLE `wf_operation` (
  `OPERATION_TYPE` varchar(50) NOT NULL,
  `OPERATION_ID` varchar(255) NOT NULL,
  `PROCESS_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`OPERATION_TYPE`,`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_operation`
--

/*!40000 ALTER TABLE `wf_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_operation` ENABLE KEYS */;


--
-- Definition of table `wf_participant_map`
--

DROP TABLE IF EXISTS `wf_participant_map`;
CREATE TABLE `wf_participant_map` (
  `PARTICIPANT_MAP_ID` varchar(40) NOT NULL,
  `PACKAGE_ID` varchar(255) DEFAULT NULL,
  `PROCESS_DEF_ID` varchar(255) DEFAULT NULL,
  `PARTICIPANT_ID` varchar(255) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `IS_GROUP_USER` char(1) DEFAULT NULL,
  PRIMARY KEY (`PARTICIPANT_MAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_participant_map`
--

/*!40000 ALTER TABLE `wf_participant_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_participant_map` ENABLE KEYS */;


--
-- Definition of table `wf_process`
--

DROP TABLE IF EXISTS `wf_process`;
CREATE TABLE `wf_process` (
  `PROCESS_ID` varchar(255) NOT NULL,
  `PROCESS_TYPE` varchar(255) DEFAULT NULL,
  `PROCESS_RESERVE_TYPE_ID` varchar(255) DEFAULT NULL,
  `DEFINITION_ID` varchar(60) DEFAULT NULL,
  `MGR_NAME` varchar(255) DEFAULT NULL,
  `ACTIVITY_REQ_PROCESS_ID` varchar(60) DEFAULT NULL,
  `ACTIVITY_REQ_ID` varchar(60) DEFAULT NULL,
  `RESOURCE_REQ_ID` varchar(60) DEFAULT NULL,
  `RESOURCE_REQ_NAME` varchar(60) DEFAULT NULL,
  `PROCESS_NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `CURRENT_STATE` varchar(255) DEFAULT NULL,
  `PRIORITY` decimal(18,0) DEFAULT NULL,
  `STARTED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LAST_STATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `RESOURCE_REQ_ORG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PROCESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_process`
--

/*!40000 ALTER TABLE `wf_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_process` ENABLE KEYS */;


--
-- Definition of table `wf_process_end`
--

DROP TABLE IF EXISTS `wf_process_end`;
CREATE TABLE `wf_process_end` (
  `PROCESS_ID` varchar(255) NOT NULL,
  `PROCESS_TYPE` varchar(255) DEFAULT NULL,
  `PROCESS_RESERVE_TYPE_ID` varchar(255) DEFAULT NULL,
  `DEFINITION_ID` varchar(60) DEFAULT NULL,
  `MGR_NAME` varchar(255) DEFAULT NULL,
  `ACTIVITY_REQ_PROCESS_ID` varchar(60) DEFAULT NULL,
  `ACTIVITY_REQ_ID` varchar(60) DEFAULT NULL,
  `RESOURCE_REQ_ID` varchar(60) DEFAULT NULL,
  `RESOURCE_REQ_NAME` varchar(60) DEFAULT NULL,
  `PROCESS_NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `CURRENT_STATE` varchar(255) DEFAULT NULL,
  `PRIORITY` decimal(18,0) DEFAULT NULL,
  `STARTED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LAST_STATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `FORM_ID` varchar(60) DEFAULT NULL,
  `SOURCE_REFERENCE_ID` varchar(60) DEFAULT NULL,
  `ORG_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PROCESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_process_end`
--

/*!40000 ALTER TABLE `wf_process_end` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_process_end` ENABLE KEYS */;


--
-- Definition of table `wf_process_files`
--

DROP TABLE IF EXISTS `wf_process_files`;
CREATE TABLE `wf_process_files` (
  `PROCESS_ID` varchar(36) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `TYPE_ID` varchar(36) NOT NULL,
  `TYPE_NAME` varchar(80) NOT NULL,
  `ORGAN_ID` varchar(40) NOT NULL,
  `ORGAN_NAME` varchar(100) NOT NULL,
  `ISALLSUB` char(1) NOT NULL,
  `FORMID` varchar(40) DEFAULT NULL,
  `FORMNAME` varchar(100) DEFAULT NULL,
  `RESERVETYPE` varchar(40) DEFAULT NULL,
  `AUTHPR` varchar(80) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `SAVEIMPORT` varchar(10) DEFAULT NULL,
  `VERSIONID` varchar(30) DEFAULT NULL,
  `ISTEMPLET` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(300) DEFAULT NULL,
  `NOTE` varchar(30) DEFAULT NULL,
  `NOTE2` varchar(30) DEFAULT NULL,
  `NOTE3` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PROCESS_ID`),
  KEY `TYPE_ID` (`TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_process_files`
--

/*!40000 ALTER TABLE `wf_process_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_process_files` ENABLE KEYS */;


--
-- Definition of table `wf_process_mgr`
--

DROP TABLE IF EXISTS `wf_process_mgr`;
CREATE TABLE `wf_process_mgr` (
  `MGR_NAME` varchar(255) NOT NULL,
  `PACKAGE_ID` varchar(60) DEFAULT NULL,
  `DEFINITION_ID` varchar(60) DEFAULT NULL,
  `PROCESS_NAME` varchar(255) DEFAULT NULL,
  `PROCESS_TYPE` varchar(255) DEFAULT NULL,
  `PROC_VERSION` varchar(255) DEFAULT NULL,
  `CREATED` varchar(255) DEFAULT NULL,
  `CURRENT_STATE` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`MGR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_process_mgr`
--

/*!40000 ALTER TABLE `wf_process_mgr` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_process_mgr` ENABLE KEYS */;


--
-- Definition of table `wf_process_type`
--

DROP TABLE IF EXISTS `wf_process_type`;
CREATE TABLE `wf_process_type` (
  `TYPE_ID` varchar(36) NOT NULL,
  `NAME` varchar(80) NOT NULL,
  `ORGAN_ID` varchar(40) NOT NULL,
  `ORGAN_NAME` varchar(100) NOT NULL,
  `ISALLSUB` char(1) NOT NULL,
  `SORTNUM` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(300) DEFAULT NULL,
  `NOTE` varchar(30) DEFAULT NULL,
  `NOTE2` varchar(30) DEFAULT NULL,
  `NOTE3` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_process_type`
--

/*!40000 ALTER TABLE `wf_process_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_process_type` ENABLE KEYS */;


--
-- Definition of table `wf_process_variable`
--

DROP TABLE IF EXISTS `wf_process_variable`;
CREATE TABLE `wf_process_variable` (
  `PROCESS_ID` varchar(255) NOT NULL,
  `DEFINITION_ID` varchar(255) NOT NULL,
  `VAR_VALUE` longblob,
  PRIMARY KEY (`PROCESS_ID`,`DEFINITION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_process_variable`
--

/*!40000 ALTER TABLE `wf_process_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_process_variable` ENABLE KEYS */;


--
-- Definition of table `wf_reportdefine`
--

DROP TABLE IF EXISTS `wf_reportdefine`;
CREATE TABLE `wf_reportdefine` (
  `REPORTID` varchar(10) NOT NULL,
  `R_DEMENSION` varchar(1023) NOT NULL,
  `C_DEMENSION` varchar(1023) NOT NULL,
  `DATA_TARTGET` varchar(1023) NOT NULL,
  `R_STAT` varchar(254) NOT NULL,
  `C_STAT` varchar(254) NOT NULL,
  `DATA_SUM` varchar(254) NOT NULL,
  PRIMARY KEY (`REPORTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_reportdefine`
--

/*!40000 ALTER TABLE `wf_reportdefine` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_reportdefine` ENABLE KEYS */;


--
-- Definition of table `wf_repository`
--

DROP TABLE IF EXISTS `wf_repository`;
CREATE TABLE `wf_repository` (
  `XPDL_ID` varchar(40) NOT NULL,
  `XPDL_VERSION` varchar(255) NOT NULL,
  `XPDL_NAME` varchar(255) NOT NULL,
  `XPDL_DATA` longblob,
  `IS_HISTORICAL` char(1) DEFAULT NULL,
  PRIMARY KEY (`XPDL_ID`,`XPDL_VERSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_repository`
--

/*!40000 ALTER TABLE `wf_repository` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_repository` ENABLE KEYS */;


--
-- Definition of table `wf_repository_ref`
--

DROP TABLE IF EXISTS `wf_repository_ref`;
CREATE TABLE `wf_repository_ref` (
  `XPDL_ID` varchar(40) NOT NULL,
  `XPDL_VERSION` varchar(255) NOT NULL,
  `REF_XPDL_ID` varchar(40) NOT NULL,
  PRIMARY KEY (`XPDL_ID`,`XPDL_VERSION`,`REF_XPDL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_repository_ref`
--

/*!40000 ALTER TABLE `wf_repository_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_repository_ref` ENABLE KEYS */;


--
-- Definition of table `wf_requester`
--

DROP TABLE IF EXISTS `wf_requester`;
CREATE TABLE `wf_requester` (
  `REQUESTER_ID` varchar(40) NOT NULL,
  `PROCESS_ID` varchar(255) NOT NULL,
  `FROM_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `THRU_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `CLASS_NAME` varchar(255) DEFAULT NULL,
  `CLASS_DATA` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`REQUESTER_ID`,`PROCESS_ID`,`FROM_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_requester`
--

/*!40000 ALTER TABLE `wf_requester` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_requester` ENABLE KEYS */;


--
-- Definition of table `wf_resource`
--

DROP TABLE IF EXISTS `wf_resource`;
CREATE TABLE `wf_resource` (
  `USER_NAME` varchar(255) NOT NULL,
  `RESOURCE_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_resource`
--

/*!40000 ALTER TABLE `wf_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_resource` ENABLE KEYS */;


--
-- Definition of table `wf_responsibles`
--

DROP TABLE IF EXISTS `wf_responsibles`;
CREATE TABLE `wf_responsibles` (
  `PROCESS_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `USER_TYPE` varchar(255) NOT NULL,
  `ACTIVITY_ID` varchar(255) DEFAULT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PROCESS_ID`,`USER_ID`,`USER_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_responsibles`
--

/*!40000 ALTER TABLE `wf_responsibles` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_responsibles` ENABLE KEYS */;


--
-- Definition of table `wf_state_event_audit`
--

DROP TABLE IF EXISTS `wf_state_event_audit`;
CREATE TABLE `wf_state_event_audit` (
  `EVENT_AUDIT_ID` varchar(40) NOT NULL,
  `OLD_STATE` varchar(255) DEFAULT NULL,
  `NEW_STATE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_state_event_audit`
--

/*!40000 ALTER TABLE `wf_state_event_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_state_event_audit` ENABLE KEYS */;


--
-- Definition of table `wf_taskaccredit`
--

DROP TABLE IF EXISTS `wf_taskaccredit`;
CREATE TABLE `wf_taskaccredit` (
  `ID` varchar(36) NOT NULL,
  `OLDORGANID` varchar(30) DEFAULT NULL,
  `AGENTORGANID` varchar(30) DEFAULT NULL,
  `TYPE` char(1) NOT NULL,
  `DATAID` varchar(100) DEFAULT NULL,
  `DATANAME` varchar(100) DEFAULT NULL,
  `TIME` varchar(18) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `ENDTIME` varchar(18) DEFAULT NULL,
  `FLAG` int(11) NOT NULL,
  `NOTE` varchar(30) DEFAULT NULL,
  `NOTE2` varchar(30) DEFAULT NULL,
  `NOTE3` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `WF_TACTTYPE` (`TYPE`),
  KEY `FLAG` (`FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wf_taskaccredit`
--

/*!40000 ALTER TABLE `wf_taskaccredit` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_taskaccredit` ENABLE KEYS */;


--
-- Definition of view `v_organ_hist`
--

DROP TABLE IF EXISTS `v_organ_hist`;
DROP VIEW IF EXISTS `v_organ_hist`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_organ_hist` AS select `pub_organ`.`ORGAN_ID` AS `ORGAN_ID`,`pub_organ`.`ORGAN_CODE` AS `ORGAN_CODE`,`pub_organ`.`ORGAN_NAME` AS `ORGAN_NAME`,`pub_organ`.`SHORT_NAME` AS `SHORT_NAME`,`pub_organ`.`ORGAN_TYPE` AS `ORGAN_TYPE`,`pub_organ`.`WORKPLACE_ID` AS `WORKPLACE_ID`,`pub_organ`.`BEGIN_DATE` AS `BEGIN_DATE`,`pub_organ`.`END_DATE` AS `END_DATE`,`pub_organ`.`SCN` AS `SCN`,`pub_organ`.`IN_USE` AS `IN_USE` from `pub_organ` union all select `pub_organ_hist`.`ORGAN_ID` AS `ORGAN_ID`,`pub_organ_hist`.`ORGAN_CODE` AS `ORGAN_CODE`,`pub_organ_hist`.`ORGAN_NAME` AS `ORGAN_NAME`,`pub_organ_hist`.`SHORT_NAME` AS `SHORT_NAME`,`pub_organ_hist`.`ORGAN_TYPE` AS `ORGAN_TYPE`,`pub_organ_hist`.`WORKPLACE_ID` AS `WORKPLACE_ID`,`pub_organ_hist`.`BEGIN_DATE` AS `BEGIN_DATE`,`pub_organ_hist`.`END_DATE` AS `END_DATE`,`pub_organ_hist`.`SCN` AS `SCN`,`pub_organ_hist`.`IN_USE` AS `IN_USE` from `pub_organ_hist`;

--
-- Definition of view `v_stru_hist`
--

DROP TABLE IF EXISTS `v_stru_hist`;
DROP VIEW IF EXISTS `v_stru_hist`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_stru_hist` AS select `pub_stru`.`STRU_ID` AS `STRU_ID`,`pub_stru`.`ORGAN_ID` AS `ORGAN_ID`,`pub_stru`.`ORGAN_ALIAS` AS `ORGAN_ALIAS`,`pub_stru`.`STRU_TYPE` AS `STRU_TYPE`,`pub_stru`.`PARENT_ID` AS `PARENT_ID`,`pub_stru`.`PRINCIPAL_ID` AS `PRINCIPAL_ID`,`pub_stru`.`CORPORATION_ID` AS `CORPORATION_ID`,`pub_stru`.`STRU_LEVEL` AS `STRU_LEVEL`,`pub_stru`.`STRU_PATH` AS `STRU_PATH`,`pub_stru`.`STRU_ORDER` AS `STRU_ORDER`,`pub_stru`.`GLOBAL_ORDER` AS `GLOBAL_ORDER`,`pub_stru`.`BEGIN_DATE` AS `BEGIN_DATE`,`pub_stru`.`END_DATE` AS `END_DATE`,`pub_stru`.`SCN` AS `SCN`,`pub_stru`.`IS_LEAF` AS `IS_LEAF`,`pub_stru`.`IN_USE` AS `IN_USE`,`pub_stru`.`DEPARTMENT_ID` AS `DEPARTMENT_ID` from `pub_stru` union all select `pub_stru_hist`.`STRU_ID` AS `STRU_ID`,`pub_stru_hist`.`ORGAN_ID` AS `ORGAN_ID`,`pub_stru_hist`.`ORGAN_ALIAS` AS `ORGAN_ALIAS`,`pub_stru_hist`.`STRU_TYPE` AS `STRU_TYPE`,`pub_stru_hist`.`PARENT_ID` AS `PARENT_ID`,`pub_stru_hist`.`PRINCIPAL_ID` AS `PRINCIPAL_ID`,`pub_stru_hist`.`CORPORATION_ID` AS `CORPORATION_ID`,`pub_stru_hist`.`STRU_LEVEL` AS `STRU_LEVEL`,`pub_stru_hist`.`STRU_PATH` AS `STRU_PATH`,`pub_stru_hist`.`STRU_ORDER` AS `STRU_ORDER`,`pub_stru_hist`.`GLOBAL_ORDER` AS `GLOBAL_ORDER`,`pub_stru_hist`.`BEGIN_DATE` AS `BEGIN_DATE`,`pub_stru_hist`.`END_DATE` AS `END_DATE`,`pub_stru_hist`.`SCN` AS `SCN`,`pub_stru_hist`.`IS_LEAF` AS `IS_LEAF`,`pub_stru_hist`.`IN_USE` AS `IN_USE`,`pub_stru_hist`.`DEPARTMENT_ID` AS `DEPARTMENT_ID` from `pub_stru_hist`;

--
-- Definition of view `v_stru_organ`
--

DROP TABLE IF EXISTS `v_stru_organ`;
DROP VIEW IF EXISTS `v_stru_organ`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_stru_organ` AS select `o`.`ORGAN_ID` AS `ORGAN_ID`,`o`.`ORGAN_CODE` AS `ORGAN_CODE`,`o`.`ORGAN_NAME` AS `ORGAN_NAME`,`o`.`SHORT_NAME` AS `SHORT_NAME`,`o`.`ORGAN_TYPE` AS `ORGAN_TYPE`,`o`.`WORKPLACE_ID` AS `WORKPLACE_ID`,`s`.`STRU_ID` AS `STRU_ID`,`s`.`ORGAN_ALIAS` AS `ORGAN_ALIAS`,`s`.`STRU_TYPE` AS `STRU_TYPE`,`s`.`PARENT_ID` AS `PARENT_ID`,`s`.`PRINCIPAL_ID` AS `PRINCIPAL_ID`,`s`.`CORPORATION_ID` AS `CORPORATION_ID`,`s`.`DEPARTMENT_ID` AS `DEPARTMENT_ID` from (`pub_stru` `s` join `pub_organ` `o`) where (`s`.`ORGAN_ID` = `o`.`ORGAN_ID`);

--
-- Definition of view `v_stru_rule`
--

DROP TABLE IF EXISTS `v_stru_rule`;
DROP VIEW IF EXISTS `v_stru_rule`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_stru_rule` AS select `r`.`RULE_ID` AS `RULE_ID`,`r`.`STRU_TYPE` AS `STRU_TYPE`,`t`.`TYPE_NAME` AS `TYPE_NAME`,`r`.`SRC_REF` AS `SRC_REF`,`o1`.`TYPE_NAME` AS `SRC_NAME`,`r`.`TARGET_REF` AS `TARGET_REF`,`o2`.`TYPE_NAME` AS `TARGET_NAME`,`r`.`RULE_NOTE` AS `RULE_NOTE` from (((`pub_stru_rule` `r` join `pub_organ_type` `o1`) join `pub_organ_type` `o2`) join `pub_stru_type` `t`) where ((`r`.`SRC_REF` = `o1`.`ORGAN_TYPE`) and (`r`.`TARGET_REF` = `o2`.`ORGAN_TYPE`) and (`r`.`STRU_TYPE` = `t`.`STRU_TYPE`));

--
-- Definition of view `v_workplace`
--

DROP TABLE IF EXISTS `v_workplace`;
DROP VIEW IF EXISTS `v_workplace`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_workplace` AS select `w`.`WORKPLACE_ID` AS `WORKPLACE_ID`,`w`.`WORKPLACE_CODE` AS `WORKPLACE_CODE`,`w`.`WORKPLACE_NAME` AS `WORKPLACE_NAME`,`w`.`SHORT_NAME` AS `SHORT_NAME`,`w`.`LINKMAN` AS `LINKMAN`,`w`.`TEL` AS `TEL`,`w`.`FAX` AS `FAX`,`w`.`E_MAIL` AS `E_MAIL`,`w`.`WWW` AS `WWW`,`w`.`POST_CODE` AS `POST_CODE`,`w`.`POST_ADDRESS` AS `POST_ADDRESS`,`w`.`ENGLISH_ADDRESS` AS `ENGLISH_ADDRESS`,`w`.`AM_END_TIME` AS `AM_END_TIME`,`w`.`PM_END_TIME` AS `PM_END_TIME`,`w`.`CANT_CODE` AS `CANT_CODE`,`c`.`CANT_NAME` AS `CANT_NAME` from (`pub_workplace` `w` join `pub_cant` `c`) where (`w`.`CANT_CODE` = `c`.`CANT_CODE`);

--
-- Definition of view `wf_act_list`
--

DROP TABLE IF EXISTS `wf_act_list`;
DROP VIEW IF EXISTS `wf_act_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wf_act_list` AS select `wf_process`.`PROCESS_ID` AS `PROCESS_ID`,`wf_process`.`RESOURCE_REQ_ID` AS `RESOURCE_REQ_ID`,`wf_process`.`PROCESS_NAME` AS `PROCESS_NAME`,`wf_process`.`RESOURCE_REQ_NAME` AS `RESOURCE_REQ_NAME`,`wf_process`.`PROCESS_TYPE` AS `PROCESS_TYPE`,`wf_process`.`PROCESS_RESERVE_TYPE_ID` AS `PROCESS_RESERVE_TYPE_ID`,`wf_process`.`DEFINITION_ID` AS `PRO_DEFINITION_ID`,`wf_process`.`DESCRIPTION` AS `PRO_DESCRIPTION`,`wf_process`.`CURRENT_STATE` AS `PRO_CURRENT_STATE`,`wf_process`.`STARTED_TIME` AS `PRO_STARTED_TIME`,`wf_process`.`MGR_NAME` AS `MGR_NAME`,`wf_activity`.`ACTIVITY_ID` AS `ACTIVITY_ID`,`wf_process`.`PRIORITY` AS `PRIORITY`,`wf_activity`.`DEFINITION_ID` AS `ACT_DEFINITION_ID`,`wf_activity`.`CURRENT_STATE` AS `ACT_CURRENT_STATE`,`wf_activity`.`ACTIVITY_NAME` AS `ACTIVITY_NAME`,`wf_activity`.`FORM_ID` AS `FORM_ID`,`wf_activity`.`SOURCE_REFERENCE_ID` AS `SOURCE_REFERENCE_ID`,`wf_activity`.`PREVIOUS_ACTIVITY` AS `PREVIOUS_ACTIVITY`,`wf_activity`.`CREATE_TIME` AS `CREATE_TIME`,`wf_activity`.`PREVIOUS_ACTIVITY_NAME` AS `PREVIOUS_ACTIVITY_NAME`,`wf_activity`.`PREVIOUS_RESOURCE` AS `PREVIOUS_RESOURCE`,`wf_activity`.`PREVIOUS_RESOURCE_NAME` AS `PREVIOUS_RESOURCE_NAME`,`wf_responsibles`.`USER_ID` AS `USER_ID`,`wf_responsibles`.`USER_TYPE` AS `USER_TYPE`,`wf_assignment`.`USER_ID` AS `CUR_USER_ID`,`wf_assignment`.`USER_NAME` AS `CUR_USER_NAME`,`wf_assignment`.`RESOURCE_TYPE` AS `RESOURCE_TYPE`,`wf_assignment`.`FROM_DATE` AS `FROM_DATE`,`wf_assignment`.`STATUS_ID` AS `STATUS_ID`,`wf_assignment`.`READ_MARK` AS `READ_MARK`,`wf_assignment`.`WORK_ORDER` AS `WORK_ORDER` from (((`wf_process` join `wf_activity`) join `wf_responsibles`) join `wf_assignment`) where ((`wf_process`.`PROCESS_ID` = `wf_activity`.`PROCESS_ID`) and (`wf_process`.`PROCESS_ID` = `wf_responsibles`.`PROCESS_ID`) and (`wf_activity`.`PROCESS_ID` = `wf_assignment`.`PROCESS_ID`) and (`wf_activity`.`ACTIVITY_ID` = `wf_assignment`.`ACTIVITY_ID`));

--
-- Definition of view `wf_ass_event_list`
--

DROP TABLE IF EXISTS `wf_ass_event_list`;
DROP VIEW IF EXISTS `wf_ass_event_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wf_ass_event_list` AS select `wf_event_audit`.`EVENT_AUDIT_ID` AS `EVENT_AUDIT_ID`,`wf_event_audit`.`AUDIT_TIME` AS `AUDIT_TIME`,`wf_event_audit`.`AUDIT_TYPE` AS `AUDIT_TYPE`,`wf_event_audit`.`PACKAGE_ID` AS `PACKAGE_ID`,`wf_event_audit`.`PROCESS_ID` AS `PROCESS_ID`,`wf_event_audit`.`PROCESS_NAME` AS `PROCESS_NAME`,`wf_event_audit`.`PROCESS_DEF_ID` AS `PROCESS_DEF_ID`,`wf_assignment_event_audit`.`OLD_USER_NAME` AS `OLD_USER_NAME`,`wf_assignment_event_audit`.`OLD_NAME` AS `OLD_NAME`,`wf_assignment_event_audit`.`OLD_TYPE` AS `OLD_TYPE`,`wf_assignment_event_audit`.`NEW_USER_NAME` AS `NEW_USER_NAME`,`wf_assignment_event_audit`.`NEW_NAME` AS `NEW_NAME`,`wf_assignment_event_audit`.`NEW_TYPE` AS `NEW_TYPE`,`wf_assignment_event_audit`.`IS_ACCEPTED` AS `IS_ACCEPTED` from (`wf_event_audit` join `wf_assignment_event_audit`) where (`wf_event_audit`.`EVENT_AUDIT_ID` = `wf_assignment_event_audit`.`EVENT_AUDIT_ID`);

--
-- Definition of view `wf_end_task_list`
--

DROP TABLE IF EXISTS `wf_end_task_list`;
DROP VIEW IF EXISTS `wf_end_task_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wf_end_task_list` AS select `wf_process_end`.`PROCESS_ID` AS `PROCESS_ID`,`wf_process_end`.`RESOURCE_REQ_ID` AS `RESOURCE_REQ_ID`,`wf_process_end`.`PROCESS_NAME` AS `PROCESS_NAME`,`wf_process_end`.`RESOURCE_REQ_NAME` AS `RESOURCE_REQ_NAME`,`wf_process_end`.`PROCESS_TYPE` AS `PROCESS_TYPE`,`wf_process_end`.`PROCESS_RESERVE_TYPE_ID` AS `PROCESS_RESERVE_TYPE_ID`,`wf_process_end`.`DEFINITION_ID` AS `PRO_DEFINITION_ID`,`wf_process_end`.`DESCRIPTION` AS `PRO_DESCRIPTION`,`wf_process_end`.`CURRENT_STATE` AS `PRO_CURRENT_STATE`,`wf_process_end`.`STARTED_TIME` AS `PRO_STARTED_TIME`,`wf_process_end`.`LAST_STATE_TIME` AS `LAST_STATE_TIME`,`wf_process_end`.`ORG_ID` AS `ORG_ID`,`wf_process_end`.`MGR_NAME` AS `MGR_NAME`,`wf_activity_end`.`ACTIVITY_ID` AS `ACTIVITY_ID`,`wf_activity_end`.`DEFINITION_ID` AS `ACT_DEFINITION_ID`,`wf_activity_end`.`ACTIVITY_NAME` AS `ACTIVITY_NAME`,`wf_activity_end`.`FORM_ID` AS `FORM_ID`,`wf_activity_end`.`SOURCE_REFERENCE_ID` AS `SOURCE_REFERENCE_ID`,`wf_activity_end`.`CREATE_TIME` AS `CREATE_TIME`,`wf_process_end`.`PRIORITY` AS `PRIORITY`,`wf_assignment_end`.`USER_ID` AS `USER_ID`,`wf_assignment_end`.`USER_NAME` AS `USER_NAME`,`wf_assignment_end`.`FROM_DATE` AS `FROM_DATE`,`wf_assignment_end`.`THRU_DATE` AS `THRU_DATE` from ((`wf_process_end` join `wf_activity_end`) join `wf_assignment_end`) where ((`wf_process_end`.`PROCESS_ID` = `wf_activity_end`.`PROCESS_ID`) and (`wf_activity_end`.`ACTIVITY_ID` = `wf_assignment_end`.`ACTIVITY_ID`));

--
-- Definition of view `wf_participant_list`
--

DROP TABLE IF EXISTS `wf_participant_list`;
DROP VIEW IF EXISTS `wf_participant_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wf_participant_list` AS select `p`.`PROCESS_ID` AS `PROCESS_ID`,`p`.`PROCESS_RESERVE_TYPE_ID` AS `PROCESS_RESERVE_TYPE_ID`,`p`.`DEFINITION_ID` AS `PRO_DEFINITION_ID`,`p`.`PROCESS_NAME` AS `PROCESS_NAME`,`p`.`CURRENT_STATE` AS `PRO_CURRENT_STATE`,`p`.`STARTED_TIME` AS `PRO_STARTED_TIME`,`p`.`PROCESS_TYPE` AS `PROCESS_TYPE`,`a`.`ACTIVITY_ID` AS `ACTIVITY_ID`,`a`.`ACTIVITY_NAME` AS `ACTIVITY_NAME`,`a`.`DEFINITION_ID` AS `ACT_DEFINITION_ID`,`a`.`SOURCE_REFERENCE_ID` AS `SOURCE_REFERENCE_ID`,`a`.`PREVIOUS_ACTIVITY` AS `PREVIOUS_ACTIVITY`,`a`.`PREVIOUS_ACTIVITY_NAME` AS `PREVIOUS_ACTIVITY_NAME`,`a`.`CURRENT_STATE` AS `ACT_CURRENT_STATE`,`a`.`PREVIOUS_RESOURCE_NAME` AS `PREVIOUS_RESOURCE_NAME`,`a`.`FORM_ID` AS `FORM_ID`,`a`.`CREATE_TIME` AS `CREATE_TIME`,`b`.`READ_MARK` AS `READ_MARK`,`b`.`RESOURCE_TYPE` AS `RESOURCE_TYPE`,`d`.`NEW_USER_NAME` AS `USER_ID`,`d`.`NEW_NAME` AS `USER_NAME`,`d`.`NEW_TYPE` AS `OLD_RESOURCE_TYPE`,`b`.`FROM_DATE` AS `FROM_DATE`,`b`.`USER_ID` AS `CUR_USER_ID`,`b`.`USER_NAME` AS `CUR_USER_NAME` from ((((`wf_process` `p` join `wf_activity` `a`) join `wf_assignment` `b`) join `wf_event_audit` `c`) join `wf_assignment_event_audit` `d`) where ((`p`.`PROCESS_ID` = `a`.`PROCESS_ID`) and (`a`.`CURRENT_STATE` = 'open.running') and (`a`.`PREVIOUS_ACTIVITY` = `c`.`ACTIVITY_DEF_ID`) and (`a`.`PROCESS_ID` = `c`.`PROCESS_ID`) and (`c`.`AUDIT_TYPE` = 'activityAssignmentChanged') and (`c`.`EVENT_AUDIT_ID` = `d`.`EVENT_AUDIT_ID`) and (`d`.`STATUS` = 'TASK_ACCEPTED') and (`a`.`ACTIVITY_ID` = `b`.`ACTIVITY_ID`));

--
-- Definition of view `wf_task_list`
--

DROP TABLE IF EXISTS `wf_task_list`;
DROP VIEW IF EXISTS `wf_task_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wf_task_list` AS select `wf_process`.`PROCESS_ID` AS `PROCESS_ID`,`wf_process`.`RESOURCE_REQ_ID` AS `RESOURCE_REQ_ID`,`wf_process`.`PROCESS_NAME` AS `PROCESS_NAME`,`wf_process`.`RESOURCE_REQ_NAME` AS `RESOURCE_REQ_NAME`,`wf_process`.`PROCESS_TYPE` AS `PROCESS_TYPE`,`wf_process`.`PROCESS_RESERVE_TYPE_ID` AS `PROCESS_RESERVE_TYPE_ID`,`wf_process`.`MGR_NAME` AS `MGR_NAME`,`wf_process`.`DEFINITION_ID` AS `PRO_DEFINITION_ID`,`wf_process`.`DESCRIPTION` AS `PRO_DESCRIPTION`,`wf_process`.`CURRENT_STATE` AS `PRO_CURRENT_STATE`,`wf_process`.`STARTED_TIME` AS `PRO_STARTED_TIME`,`wf_activity`.`ACTIVITY_ID` AS `ACTIVITY_ID`,`wf_process`.`PRIORITY` AS `PRIORITY`,`wf_activity`.`DEFINITION_ID` AS `ACT_DEFINITION_ID`,`wf_activity`.`CURRENT_STATE` AS `ACT_CURRENT_STATE`,`wf_activity`.`ACTIVITY_NAME` AS `ACTIVITY_NAME`,`wf_activity`.`FORM_ID` AS `FORM_ID`,`wf_activity`.`SOURCE_REFERENCE_ID` AS `SOURCE_REFERENCE_ID`,`wf_activity`.`CREATE_TIME` AS `CREATE_TIME`,`wf_activity`.`PREVIOUS_ACTIVITY` AS `PREVIOUS_ACTIVITY`,`wf_activity`.`PREVIOUS_ACTIVITY_NAME` AS `PREVIOUS_ACTIVITY_NAME`,`wf_activity`.`PREVIOUS_RESOURCE` AS `PREVIOUS_RESOURCE`,`wf_activity`.`PREVIOUS_RESOURCE_NAME` AS `PREVIOUS_RESOURCE_NAME`,`wf_assignment`.`USER_ID` AS `USER_ID`,`wf_assignment`.`USER_NAME` AS `USER_NAME`,`wf_assignment`.`RESOURCE_TYPE` AS `RESOURCE_TYPE`,`wf_assignment`.`FROM_DATE` AS `FROM_DATE`,`wf_assignment`.`STATUS_ID` AS `STATUS_ID`,`wf_assignment`.`THRU_DATE` AS `THRU_DATE`,`wf_assignment`.`WORK_ORDER` AS `WORK_ORDER`,`wf_assignment`.`READ_MARK` AS `READ_MARK` from ((`wf_process` join `wf_activity`) join `wf_assignment`) where ((`wf_process`.`PROCESS_ID` = `wf_activity`.`PROCESS_ID`) and (`wf_activity`.`ACTIVITY_ID` = `wf_assignment`.`ACTIVITY_ID`));



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
