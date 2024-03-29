--删除由Hibernate创建的表结构，改由脚本创建
DROP TABLE PUB_ORGAN CASCADE CONSTRAINTS;
DROP TABLE PUB_STRU CASCADE CONSTRAINTS;
DROP TABLE PUB_USERS CASCADE CONSTRAINTS;

--BSP所有的数据库初始化脚本
----创建BSP中的相关表以及视图
CREATE TABLE PUB_IDTABLE (
		  ID_ID VARCHAR(30) NOT NULL , 
		  ID_VALUE INT NOT NULL , 
		  ID_NAME VARCHAR(50) NOT NULL , 
		  CACHE_SIZE INT NOT NULL , 
		  ID_PREFIX VARCHAR(10) , 
		  IS_PREFIX CHAR(1) NOT NULL , 
		  ID_LENGTH INT NOT NULL,
		  IS_SUFFIX CHAR(1)  ,  
		  ID_SUFFIX VARCHAR(10) , 
		  IS_GLOBAL CHAR(1)  NOT NULL,  
		  ORGAN_ID VARCHAR(30) 
		  )  ;
CREATE TABLE PUB_COUNTRY
(
            COUNTRY_CODE VARCHAR (10) NOT NULL ,
            COUNTRY_NAME VARCHAR (100) NOT NULL ,
            SHORT_NAME VARCHAR (20) NOT NULL ,
            IN_USE CHAR (1) DEFAULT '1' NOT NULL 
) ; 

CREATE TABLE PUB_CANT_TYPE
(
            CANT_TYPE VARCHAR (10) NOT NULL ,
            TYPE_NAME VARCHAR (60) NOT NULL ,
            IN_USE CHAR (1) DEFAULT '1' NOT NULL 
) ; 

CREATE TABLE PUB_CANT
(
            CANT_CODE VARCHAR (20) NOT NULL ,
            CANT_NAME VARCHAR (250) NOT NULL ,
            SHORT_NAME VARCHAR (120) ,
            CANT_TYPE VARCHAR (10) NOT NULL ,
            SUPER_CODE VARCHAR (20) NOT NULL ,
            COUNTRY_CODE VARCHAR (10) NOT NULL ,
            CANT_NOTE VARCHAR (250) ,
            IN_USE CHAR (1) DEFAULT '1' NOT NULL 
) ; 

CREATE TABLE PUB_WORKPLACE
(
            WORKPLACE_ID VARCHAR (30) NOT NULL ,
            WORKPLACE_CODE VARCHAR (30) NOT NULL ,
            WORKPLACE_NAME VARCHAR (100) NOT NULL ,
            SHORT_NAME VARCHAR (30) ,
            CANT_CODE VARCHAR (20) NOT NULL ,
            LINKMAN VARCHAR (120),
            TEL VARCHAR (80)  ,
            FAX VARCHAR (80) ,
            E_MAIL VARCHAR (80) ,
            WWW VARCHAR (250) ,
            POST_CODE VARCHAR (20)  ,
            POST_ADDRESS VARCHAR (250) ,
            ENGLISH_ADDRESS VARCHAR (250) ,
            AM_START_TIME CHAR (8) NOT NULL ,
            AM_END_TIME CHAR (8) NOT NULL,
            PM_START_TIME CHAR (8)  NOT NULL,
            PM_END_TIME CHAR (8)  NOT NULL 
) ; 

CREATE TABLE PUB_ORGAN_TYPE
(
            ORGAN_TYPE VARCHAR (10) NOT NULL ,
            TYPE_NAME VARCHAR (60) NOT NULL ,
            PARENT_TYPE VARCHAR (10) NOT NULL ,
            IN_USE CHAR (1) DEFAULT '1' NOT NULL 
) ; 


CREATE TABLE PUB_HR_EVENT_TYPE
(
            EVENT_TYPE VARCHAR (10) NOT NULL ,
            ORGAN_TYPE VARCHAR (10) NOT NULL ,
            TYPE_NAME VARCHAR (60) NOT NULL ,
            IS_SYS CHAR (1) NOT NULL 
);

CREATE TABLE PUB_STRU_TYPE
(
            STRU_TYPE VARCHAR (10) NOT NULL ,
            TYPE_NAME VARCHAR (60) NOT NULL ,
            ROOT_ID VARCHAR (30) NOT NULL ,
            IS_DEFAULT CHAR (1) DEFAULT '0' NOT NULL ,
            NOTE VARCHAR (250) ,
            IN_USE CHAR (1) DEFAULT '1' NOT NULL ,
            IS_APPLY_RULE CHAR (1) DEFAULT '1' ,
            IS_MATRIX CHAR (1) DEFAULT '1',
            IS_KEEP_RECORD CHAR (1) DEFAULT '1'  
) ; 

CREATE TABLE PUB_STRU_VERSION
(
            VERSION VARCHAR (30) NOT NULL ,
            VERSION_DATE CHAR (8) NOT NULL ,
            VERSION_USER VARCHAR (30) ,
            END_SCN INT NOT NULL ,
            VERSION_NOTE VARCHAR (255) 
) ; 

CREATE TABLE PUB_SCN_INFO
(
            PARAM VARCHAR (30) NOT NULL ,
            INST VARCHAR (20) NOT NULL ,
            VAL INT NOT NULL 
) ; 

CREATE TABLE PUB_HR_EVENT
(
            EVENT_ID VARCHAR (30) NOT NULL ,
            STRU_ID VARCHAR (200) NOT NULL ,
            SCN INT NOT NULL ,
            EVENT_TYPE VARCHAR (10) NOT NULL ,
            EVENT_DATE CHAR (8) NOT NULL ,
            EVENT_MEMO VARCHAR (250) 
); 

CREATE TABLE PUB_ORGAN
(
            ORGAN_ID VARCHAR (200) NOT NULL ,
            ORGAN_CODE VARCHAR (200) NOT NULL ,
            ORGAN_NAME VARCHAR (200) NOT NULL ,
            SHORT_NAME VARCHAR (200) ,
            ORGAN_TYPE VARCHAR (10) NOT NULL ,
            WORKPLACE_ID VARCHAR (30) NOT NULL ,
            BEGIN_DATE CHAR (8) NOT NULL ,
            END_DATE CHAR (8) DEFAULT '99991231' NOT NULL ,
            SCN INT DEFAULT -1 NOT NULL ,
            IN_USE CHAR (1) DEFAULT '1' NOT NULL 
) ; 

CREATE TABLE PUB_ORGAN_HIST
(
            ORGAN_ID VARCHAR (200) NOT NULL ,
            ORGAN_CODE VARCHAR (200) NOT NULL ,
            ORGAN_NAME VARCHAR (200) NOT NULL ,
            SHORT_NAME VARCHAR (200) ,
            ORGAN_TYPE VARCHAR (10) NOT NULL ,
            WORKPLACE_ID VARCHAR (30) NOT NULL ,
            BEGIN_DATE CHAR (8) NOT NULL ,
            END_DATE CHAR (8) DEFAULT '99991231' NOT NULL ,
            SCN INT DEFAULT -1 NOT NULL ,
            IN_USE CHAR (1) DEFAULT '1' NOT NULL 
) ; 

CREATE TABLE PUB_STRU
(
            STRU_ID VARCHAR (200) NOT NULL ,
            ORGAN_ID VARCHAR (200) NOT NULL ,
            ORGAN_ALIAS VARCHAR (200) NOT NULL ,
            STRU_TYPE VARCHAR (10) NOT NULL ,
            PARENT_ID VARCHAR (200) ,
            PRINCIPAL_ID VARCHAR (30) ,
            CORPORATION_ID VARCHAR (200) ,
            STRU_LEVEL INT NOT NULL ,
            STRU_PATH VARCHAR (1000) NOT NULL ,
            STRU_ORDER INT DEFAULT 1 NOT NULL ,
            GLOBAL_ORDER INT DEFAULT 1 NOT NULL ,
            BEGIN_DATE CHAR (8) NOT NULL ,
            END_DATE CHAR (8) DEFAULT '99991231' NOT NULL ,
            SCN INT DEFAULT -1 NOT NULL ,
            IS_LEAF CHAR (1) DEFAULT '0' NOT NULL ,
            IN_USE CHAR (1) DEFAULT '1' NOT NULL ,
            DEPARTMENT_ID VARCHAR (30)           
) ; 

CREATE TABLE PUB_STRU_HIST
(
            STRU_ID VARCHAR (200) NOT NULL ,
            ORGAN_ID VARCHAR (200) NOT NULL ,
            ORGAN_ALIAS VARCHAR (200) NOT NULL ,
            STRU_TYPE VARCHAR (10) NOT NULL ,
            PARENT_ID VARCHAR (200) ,
            PRINCIPAL_ID VARCHAR (30) ,
            CORPORATION_ID VARCHAR (200) ,
            STRU_LEVEL INT NOT NULL ,
            STRU_PATH VARCHAR (1000) NOT NULL ,
            STRU_ORDER INT DEFAULT 1 NOT NULL ,
            GLOBAL_ORDER INT DEFAULT 1 NOT NULL ,
            BEGIN_DATE CHAR (8) NOT NULL ,
            END_DATE CHAR (8) DEFAULT '99991231' NOT NULL ,
            SCN INT DEFAULT -1 NOT NULL ,
            IS_LEAF CHAR (1) DEFAULT '0' NOT NULL ,
            IN_USE CHAR (1) DEFAULT '1' NOT NULL,
            DEPARTMENT_ID VARCHAR (30)
) ; 

CREATE TABLE PUB_STRU_RULE
(
            RULE_ID VARCHAR (20) NOT NULL ,
            STRU_TYPE VARCHAR (10) NOT NULL ,
            SRC_REF VARCHAR (10) NOT NULL ,
            TARGET_REF VARCHAR (10) NOT NULL ,
            RULE_NOTE VARCHAR (250) 
) ; 

CREATE TABLE PUB_ORGAN_PARMS
(
            ORGAN_ID VARCHAR (200) NOT NULL ,
            PARMS_NAME VARCHAR (30) NOT NULL ,
            PARMS_VALUE VARCHAR (250) NOT NULL ,
            NOTE VARCHAR (250) 
) ; 

CREATE TABLE PUB_ORGAN_PARMS_T
(
            PARMS_NAME VARCHAR (30) NOT NULL ,
            PARMS_VALUE VARCHAR (250) NOT NULL ,
            DATA_RES CHAR (1) default '0' NOT NULL ,
            ENUM_NAME VARCHAR (30) ,
            ENUM_VAULE VARCHAR (30) ,
            RES_TABLE VARCHAR (30) ,
            RES_TABLE_NAME VARCHAR (30) ,
            VALUE_COL VARCHAR (30) ,
            VALUE_COL_DES VARCHAR (60) ,
            NAME_COL VARCHAR (30) ,
            NAME_COL_DES VARCHAR (60) ,
            IS_WHERE CHAR (1) default '0' ,
            FILTER_FIELD VARCHAR (600) ,
            NOTE VARCHAR (250) 
) ;

CREATE TABLE PUB_ORGAN_WORKDAY
(
            SOLAR_DATE CHAR (8) NOT NULL ,
            ORGAN_ID VARCHAR (200) NOT NULL ,
            LUNAR_DATE CHAR (8) ,
            IS_WORKDAY CHAR DEFAULT '1' NOT NULL ,
            WEEK INT ,
            NOTE VARCHAR (250) 
) ; 

CREATE TABLE PUB_EXAMPLE_ORGAN
(
            ORGAN_ID VARCHAR (200) NOT NULL ,
            TEL VARCHAR (30) ,
            WWW VARCHAR (80) ,
            E_MAIL VARCHAR (80) ,
            MSN VARCHAR (80) ,
            QQ VARCHAR (30) 
) ; 

CREATE TABLE PUB_URLS
(
            URL_ID VARCHAR (30) NOT NULL ,
            URL_NAME VARCHAR (500) NOT NULL ,
            RESOURCE_ID VARCHAR (30) NOT NULL ,
            FUNCTION_ID VARCHAR (30) NOT NULL ,
            URL_NOTE VARCHAR (50) 
);

CREATE TABLE PUB_GLOBAL
(
            SYSTEM_ID VARCHAR (128) NOT NULL ,
            SYSTEM_NAME VARCHAR (128) NOT NULL ,
            GPUBLIC_USER VARCHAR (30) DEFAULT 'GPUBLIC' NOT NULL ,
            SUPERADMIN_USER VARCHAR (30) DEFAULT 'superadmin' NOT NULL ,
            SYSADMIN_USER VARCHAR (30) DEFAULT 'sysadmin' NOT NULL ,
            SUPERADMIN_ROLE VARCHAR (30) DEFAULT 'SUPERADMIN' NOT NULL ,
            SYSADMIN_ROLE VARCHAR (30) DEFAULT 'SYSADMIN' NOT NULL ,
            DEFAULT_LEVEL INT NOT NULL ,
            PSWD_LIFE_TIME INT NOT NULL ,
            LOGIN_ATTEMPTS INT NOT NULL ,
            PSWD_LOCK_TIME INT NOT NULL ,
            PSWD_GRACE_TIME INT NOT NULL 
) ; 

CREATE TABLE PUB_SECURITY_LEVEL
(
            SECURITY_LEVEL INT NOT NULL ,
            LEVEL_NAME VARCHAR (60) NOT NULL 
) ; 

CREATE TABLE PUB_USERS
(
            USER_ID VARCHAR (30) NOT NULL ,
            EXTERNAL_USER VARCHAR (30) NOT NULL ,
            USER_NAME VARCHAR (200) NOT NULL ,
            PASSWORD VARCHAR (128) NOT NULL ,
            ACCOUNT_STATUS CHAR (2) DEFAULT '11' NOT NULL ,
            SECURITY_LEVEL INT NOT NULL ,
            MAX_SESSIONS INT DEFAULT -1 NOT NULL ,
            IS_SYS CHAR (1) DEFAULT '0' NOT NULL ,
            IS_CPUBLIC CHAR (1) DEFAULT '0' NOT NULL ,
            CREATE_TIME CHAR (17) NOT NULL ,
            LOCK_TIME CHAR (17) ,
            EXPIRED_TIME CHAR (17) ,
            PSWD_UPT_TIME CHAR (17) ,
            PSWD_TIME CHAR (17) ,
            CORPORATION_ID VARCHAR (200) NOT NULL ,
            DEPARTMENT_ID VARCHAR (200) NOT NULL ,
            EMPLOYEE_ID VARCHAR (200) ,
            E_MAIL VARCHAR (80) ,
            MSN VARCHAR (80) ,
            QQ VARCHAR (20) ,
            MOBILE VARCHAR (60) ,
            CHAR_1 VARCHAR (60) ,
            CHAR_2 VARCHAR (60) ,
            NUM_1 DECIMAL ,
            NUM_2 DECIMAL 
) ; 

CREATE TABLE PUB_LDAP_USER
(
            USER_ID VARCHAR (30) NOT NULL ,
            USER_NAME VARCHAR (30) NOT NULL ,
            PASSWORD VARCHAR (128),
            E_MAIL VARCHAR (80) ,
            MOBILE VARCHAR (20) 
) ; 

CREATE TABLE PUB_USER_PROXY
(
            USER_ID VARCHAR (30) NOT NULL ,
            PROXY_USER_ID VARCHAR (30) NOT NULL 
) ; 

CREATE TABLE PUB_DATA_RES_TYPE
(
            DATA_RES_TYPE VARCHAR (10) NOT NULL ,
            TYPE_NAME VARCHAR (30) NOT NULL ,
            IS_STRU CHAR (1) NOT NULL ,
            RES_TABLE VARCHAR (30) ,
            RES_TABLE_NAME VARCHAR (30) ,
            VALUE_COL VARCHAR (30) ,
            VALUE_COL_DES VARCHAR (60) ,
            NAME_COL VARCHAR (30) ,
            NAME_COL_DES VARCHAR (60) ,
            IS_WHERE CHAR (1) DEFAULT '0' ,
            FILTER_FIELD VARCHAR (600) ,
            MEMO VARCHAR (30) 
) ; 

CREATE TABLE PUB_ROLES
(
            ROLE_ID VARCHAR (30) NOT NULL ,
            ROLE_NAME VARCHAR (30) NOT NULL ,
            ROLE_ALIAS VARCHAR (30) NOT NULL ,
            CORPORATION_ID VARCHAR (30) NOT NULL ,
            IS_SYS CHAR (1) DEFAULT '0' NOT NULL 
) ; 

CREATE TABLE PUB_USER_ROLE
(
            USER_ID VARCHAR (30) NOT NULL ,
            GRANTED_ROLE VARCHAR (30) NOT NULL ,
            ADMIN_OPTION CHAR (1) DEFAULT '0' NOT NULL ,
            DEFAULT_ROLE CHAR (1) DEFAULT '1' NOT NULL 
) ; 

CREATE TABLE PUB_USER_DATAREF
(
            REF_ID VARCHAR (30) NOT NULL ,
            USER_ID VARCHAR (30) NOT NULL ,
            RES_VALUE VARCHAR (80) NOT NULL ,
            DATA_RES_TYPE VARCHAR (10) NOT NULL ,
            IS_DEFAULT CHAR (1) DEFAULT '0' NOT NULL ,
            IN_USE CHAR (1) DEFAULT '1' NOT NULL ,
            STRU_ID VARCHAR (30) ,
            STRU_TYPE VARCHAR (10) ,
            IS_WRITABLE CHAR (1) DEFAULT '1' NOT NULL
) ;

CREATE TABLE PUB_ROLE_PRIVS
(
            ROLE_ID VARCHAR (30) NOT NULL ,
            GRANTED_ROLE VARCHAR (30) NOT NULL ,
            ADMIN_OPTION CHAR (1) NOT NULL ,
            DEFAULT_ROLE CHAR (1) NOT NULL 
) ; 

CREATE TABLE PUB_CONF_ROLESET
(
            SET_ID VARCHAR (30) NOT NULL ,
            SET_NAME VARCHAR (30) NOT NULL ,
            CARDINALITY INT DEFAULT -1 NOT NULL ,
            CORPORATION_ID VARCHAR (30) NOT NULL 
) ; 

CREATE TABLE PUB_CONF_ROLES
(
            ROLE_ID VARCHAR (30) NOT NULL ,
            SET_ID VARCHAR (30) NOT NULL 
) ; 

CREATE TABLE PUB_MODULES
(
            MODULE_ID VARCHAR (30) NOT NULL ,
            MODULE_NAME VARCHAR (40) NOT NULL ,
            PARENT_MODULE_ID VARCHAR (30) NOT NULL ,
            IS_LEAF CHAR (1) DEFAULT '0' NOT NULL ,
            SEQ INTEGER 
) ; 


CREATE TABLE PUB_FUNCTIONS
(
            FUNCTION_ID VARCHAR (30) NOT NULL ,
            FUNCTION_CODE VARCHAR (99) NOT NULL ,
            FUNCTION_NAME VARCHAR (40) NOT NULL ,
            MODULE_ID VARCHAR (30) NOT NULL ,
            IS_SYS CHAR (1) DEFAULT '0' NOT NULL ,
            DATA_RES_TYPE VARCHAR(10) ,
            SEQ INTEGER 
) ; 

CREATE TABLE PUB_RESOURCES
(
            RESOURCE_ID VARCHAR (30) NOT NULL ,
            RESOURCE_NAME VARCHAR (80) NOT NULL ,
            RESOURCE_ALIAS VARCHAR (80) NOT NULL ,
            URL_NAMES VARCHAR (3000) NOT NULL ,
            SECURITY_LEVEL INT DEFAULT 0 NOT NULL ,
            FUNCTION_ID VARCHAR (30) NOT NULL ,
            IS_DEFAULT CHAR (1) DEFAULT '0' NOT NULL ,
            IS_AUDIT CHAR (1) DEFAULT '0' NOT NULL ,
            RES_TYPE_ID VARCHAR(10) DEFAULT '00' NOT NULL ,
            SEQ INTEGER 
) ; 

CREATE TABLE PUB_ROLE_RESOURCE
(
            ROLE_ID VARCHAR (30) NOT NULL ,
            RESOURCE_ID VARCHAR (30) NOT NULL 
) ; 

CREATE TABLE PUB_TEMPLATES
(
            TEMPLATE_ID VARCHAR (30) NOT NULL ,
            TEMPLATE_NAME VARCHAR (100) NOT NULL 
) ; 

CREATE TABLE PUB_TROLES
(
            ROLE_ID VARCHAR (30) NOT NULL ,
            ROLE_NAME VARCHAR (30) NOT NULL ,
            ROLE_ALIAS VARCHAR (30) NOT NULL ,
            IS_SYS CHAR (1) DEFAULT '0' NOT NULL ,
            USERS_LIMIT INT DEFAULT -1 NOT NULL ,
            TEMPLATE_ID VARCHAR (30) NOT NULL 
) ; 

CREATE TABLE PUB_TROLE_OPTS
(
            ROLE_ID VARCHAR (30) NOT NULL ,
            RESOURCE_ID VARCHAR (30) NOT NULL 
) ; 

CREATE TABLE PUB_FIN_YEAR
(
            ID VARCHAR (30) NOT NULL ,
            ORGAN_ID VARCHAR (30) NOT NULL ,
            FIN_YEAR CHAR (4) NOT NULL ,
            BEGIN_DATE CHAR (8) NOT NULL ,
            END_DATE CHAR (8) NOT NULL ,
            PERIOD_NUM INT NOT NULL 
) ; 

CREATE TABLE PUB_FIN_MONTH
(
            ID VARCHAR (30) NOT NULL ,
            ORGAN_ID VARCHAR (30) NOT NULL ,
            FIN_YEAR CHAR (4) NOT NULL ,
            FIN_MONTH CHAR (6) NOT NULL ,
            BEGIN_DATE CHAR (8) NOT NULL ,
            END_DATE CHAR (8) NOT NULL ,
            SEQ INT NOT NULL ,
            IS_CLOSED CHAR (1) NOT NULL 
) ; 

CREATE TABLE PUB_FIN_MPERIOD
(
            ID VARCHAR (30) NOT NULL ,
            ORGAN_ID VARCHAR (30) NOT NULL ,
            FIN_YEAR CHAR (4) NOT NULL ,
            PTYPE VARCHAR (10) NOT NULL ,
            BEGIN_MONTH CHAR (6) NOT NULL ,
            END_MONTH CHAR (6) NOT NULL ,
            SEQ INT NOT NULL 
) ; 

CREATE TABLE PUB_FIN_PTYPE
(
            PTYPE VARCHAR (10) NOT NULL ,
            TYPE_NAME VARCHAR (40) NOT NULL ,
            IN_USE CHAR (1) DEFAULT '1' NOT NULL 
) ; 

CREATE TABLE PUB_STRU_TYPE_REF (
	  USER_ID VARCHAR (30) NOT NULL , 
	  STRU_TYPE VARCHAR (10) NOT NULL , 
	  STRU_ID VARCHAR (30) NOT NULL ,   
	  ORGAN_NAME VARCHAR (80) NOT NULL
	  )  ;

CREATE TABLE PUB_ONLINE
(
            SESSION_ID VARCHAR (128) NOT NULL ,
            USER_ID VARCHAR (30) NOT NULL ,
            USER_NAME VARCHAR (30) NOT NULL ,
            CORPORATION_ID VARCHAR (30) NOT NULL ,
            CORPORATION_NAME VARCHAR (80) NOT NULL ,
            LOGIN_TIME VARCHAR (30) ,
            LOGOFF_TIME VARCHAR (30) ,
            REMOTEADDR VARCHAR (80) NOT NULL ,
            REMOTEHOST VARCHAR (80) NOT NULL ,
            REMOTEPORT VARCHAR (80)
);

CREATE TABLE PUB_ONLINE_HIST
(
            SESSION_ID VARCHAR (128) NOT NULL ,
            USER_ID VARCHAR (30) NOT NULL ,
            USER_NAME VARCHAR (30) NOT NULL ,
            CORPORATION_ID VARCHAR (30) NOT NULL ,
            CORPORATION_NAME VARCHAR (80) NOT NULL ,
            LOGIN_TIME VARCHAR (30) ,
            LOGOFF_TIME VARCHAR (30) ,
            REMOTEADDR VARCHAR (80) NOT NULL ,
            REMOTEHOST VARCHAR (80) NOT NULL ,
            REMOTEPORT VARCHAR (80) 
);

CREATE TABLE PUB_SECURITY_LOG
(
	    LOG_ID VARCHAR (30) NOT NULL ,
            SESSION_ID VARCHAR (128) NOT NULL ,
            USER_ID VARCHAR (30) NOT NULL ,
            USER_NAME VARCHAR (30) ,
            USER_LEVEL INT DEFAULT 0 ,
            CORPORATION_ID VARCHAR (30) ,
            CORPORATION_NAME VARCHAR (80) ,
            LOG_TIME VARCHAR (30) NOT NULL ,
            REMOTEADDR VARCHAR (80) NOT NULL ,
            REMOTEHOST VARCHAR (80) NOT NULL ,
            REMOTEPORT VARCHAR (80) ,
            LOCALADDR VARCHAR (80) NOT NULL ,
            LOCALHOST VARCHAR (80) NOT NULL ,
            LOCALPORT VARCHAR (80) ,
            RESOURCE_ID VARCHAR (30) ,
            RESOURCE_ALIAS VARCHAR (60) ,
            SECURITY_LEVEL INT DEFAULT 0 ,
            LOG_TYPE VARCHAR (10) NOT NULL ,
            LOG_TYPE_NAME VARCHAR (60) NOT NULL ,
            LOG_CONTENT VARCHAR (500) 
);

CREATE TABLE PUB_CMD_LOG(
			LOG_ID VARCHAR(30) NOT NULL ,
			BEAN_ID VARCHAR (50) NOT NULL , 
			METHOD VARCHAR (50) ,
			BEAN_CLASS VARCHAR (200) NOT NULL ,
			STARTTIME NUMERIC(18,0) ,
			ENDTIME NUMERIC(18,0) ,
			SECURITY_LOG_ID VARCHAR(30),
			CONN_NUMBER INT,
			PRIMARY KEY(LOG_ID)
);

CREATE TABLE PUB_CERT_USER
(
            DN VARCHAR (250) NOT NULL ,
            USER_ID VARCHAR (250) NOT NULL 
);

CREATE TABLE PUB_COMMON_SINGLE_PARMS
(
            ORGAN_ID VARCHAR (30) NOT NULL ,
            EDIT_FILE_ID VARCHAR (30) ,
            SHOW_FILE_ID VARCHAR (30) ,
            SINGEL_STYLE VARCHAR (80)
) ;

CREATE TABLE PUB_DOC_CONTENT
(
            FILE_ID VARCHAR (30) NOT NULL ,
            FILE_NAME VARCHAR (300) NOT NULL ,
            FILE_TYPE VARCHAR (50) ,
            CONTENT LONG RAW 
) ; 
CREATE TABLE PUB_RES_TYPE (
      RES_TYPE_ID VARCHAR (10) NOT NULL ,
      RES_TYPE_NAME VARCHAR (60) NOT NULL           
  );
--创建视图
CREATE VIEW V_STRU_HIST AS SELECT 
STRU_ID,
ORGAN_ID,
ORGAN_ALIAS,
STRU_TYPE,
PARENT_ID,
PRINCIPAL_ID,
CORPORATION_ID,
STRU_LEVEL,
STRU_PATH,
STRU_ORDER,
GLOBAL_ORDER,
BEGIN_DATE,
END_DATE,
SCN,
IS_LEAF,
IN_USE,
DEPARTMENT_ID  
FROM PUB_STRU  
UNION ALL 
SELECT 
STRU_ID,
ORGAN_ID,
ORGAN_ALIAS,
STRU_TYPE,
PARENT_ID,
PRINCIPAL_ID,
CORPORATION_ID,
STRU_LEVEL,
STRU_PATH,
STRU_ORDER,
GLOBAL_ORDER,
BEGIN_DATE,
END_DATE,
SCN,
IS_LEAF,
IN_USE ,
DEPARTMENT_ID 
FROM PUB_STRU_HIST ; 

CREATE  VIEW V_ORGAN_HIST 
AS SELECT 
ORGAN_ID,
ORGAN_CODE,
ORGAN_NAME,
SHORT_NAME,
ORGAN_TYPE,
WORKPLACE_ID,
BEGIN_DATE,
END_DATE,
SCN ,
IN_USE 
FROM PUB_ORGAN  
 UNION ALL SELECT 
ORGAN_ID,
ORGAN_CODE,
ORGAN_NAME,
SHORT_NAME,
ORGAN_TYPE,
WORKPLACE_ID,
BEGIN_DATE,
END_DATE,
SCN,
IN_USE 
FROM PUB_ORGAN_HIST;

CREATE VIEW V_WORKPLACE 
AS SELECT 
W.WORKPLACE_ID,
W.WORKPLACE_CODE,
W.WORKPLACE_NAME,
W.SHORT_NAME,
W.LINKMAN,
W.TEL, 
W.FAX, 
W.E_MAIL,
W.WWW,
W.POST_CODE,
W.POST_ADDRESS,
W.ENGLISH_ADDRESS,
W.AM_END_TIME,
W.PM_END_TIME,
W.CANT_CODE,
C.CANT_NAME AS CANT_NAME 
FROM PUB_WORKPLACE W,PUB_CANT C  
WHERE 
W.CANT_CODE=C.CANT_CODE;

CREATE VIEW V_STRU_ORGAN AS SELECT
 O.ORGAN_ID,
 O.ORGAN_CODE,
 O.ORGAN_NAME,
 O.SHORT_NAME,
 O.ORGAN_TYPE,
 O.WORKPLACE_ID,
 S.STRU_ID,
 S.ORGAN_ALIAS,
 S.STRU_TYPE,
 S.PARENT_ID ,
 S.PRINCIPAL_ID,
 S.CORPORATION_ID ,
 S.DEPARTMENT_ID 
 FROM PUB_STRU S,PUB_ORGAN O
 WHERE 
 S.ORGAN_ID=O.ORGAN_ID ;
 
 CREATE VIEW V_STRU_RULE 
AS 
SELECT 
R.RULE_ID,
R.STRU_TYPE,
T.TYPE_NAME,
R.SRC_REF,
O1.TYPE_NAME AS SRC_NAME,
R.TARGET_REF,
O2.TYPE_NAME AS TARGET_NAME ,
R.RULE_NOTE 
FROM 
PUB_STRU_RULE R,PUB_ORGAN_TYPE O1,PUB_ORGAN_TYPE O2,PUB_STRU_TYPE T  
WHERE 
R.SRC_REF=O1.ORGAN_TYPE AND R.TARGET_REF=O2.ORGAN_TYPE AND R.STRU_TYPE=T.STRU_TYPE;

----提交创建BSP表以及视图的SQL
COMMIT;


----创建BSP中的相关主键
ALTER TABLE PUB_COUNTRY
    ADD CONSTRAINT PUBCOUNTRY_PK 
    PRIMARY KEY (COUNTRY_CODE);
 ALTER TABLE PUB_CANT_TYPE
    ADD CONSTRAINT PUBCANTTYPE_PK 
    PRIMARY KEY (CANT_TYPE);
 ALTER TABLE PUB_CANT
    ADD CONSTRAINT PUBCANT_PK 
    PRIMARY KEY (CANT_CODE);
 ALTER TABLE PUB_WORKPLACE
    ADD CONSTRAINT PUBWORKPLACE_PK 
    PRIMARY KEY (WORKPLACE_ID);
 ALTER TABLE PUB_ORGAN_TYPE
    ADD CONSTRAINT PUBORGANTYPE_PK 
    PRIMARY KEY (ORGAN_TYPE);
 ALTER TABLE PUB_HR_EVENT_TYPE
    ADD CONSTRAINT PUBHREVTP_PK 
    PRIMARY KEY (EVENT_TYPE);
 ALTER TABLE PUB_STRU_TYPE
    ADD CONSTRAINT PUBSTRUTYPE_PK 
    PRIMARY KEY (STRU_TYPE);
 ALTER TABLE PUB_STRU_VERSION
    ADD CONSTRAINT PUBSTRUVERSION_PK 
    PRIMARY KEY (VERSION);
 ALTER TABLE PUB_SCN_INFO
    ADD CONSTRAINT PUBSCNINFO_PK 
    PRIMARY KEY (PARAM);
 ALTER TABLE PUB_HR_EVENT
    ADD CONSTRAINT PUBHREVENT_PK 
        PRIMARY KEY (EVENT_ID);
 ALTER TABLE PUB_ORGAN
    ADD CONSTRAINT PUBORGAN_PK 
    PRIMARY KEY (ORGAN_ID);
 ALTER TABLE PUB_STRU
    ADD CONSTRAINT PUBSTRU_PK 
    PRIMARY KEY (STRU_ID);
 ALTER TABLE PUB_STRU_RULE
    ADD CONSTRAINT PUBSTRURULE_PK 
    PRIMARY KEY (RULE_ID);
 ALTER TABLE PUB_ORGAN_PARMS
    ADD CONSTRAINT PUBORGANPARMS_PK 
    PRIMARY KEY (ORGAN_ID,PARMS_NAME);
 ALTER TABLE PUB_ORGAN_PARMS_T
    ADD CONSTRAINT PUBORGANPARMST_PK 
    PRIMARY KEY (PARMS_NAME);
 ALTER TABLE PUB_ORGAN_WORKDAY
    ADD CONSTRAINT PUBORGANWORKDAY_PK 
    PRIMARY KEY (SOLAR_DATE,ORGAN_ID);
 ALTER TABLE PUB_EXAMPLE_ORGAN
    ADD CONSTRAINT PUBEXAMPLEORGAN_PK 
    PRIMARY KEY (ORGAN_ID);
 ALTER TABLE PUB_GLOBAL
    ADD CONSTRAINT PUBGLOBAL_PK 
    PRIMARY KEY (SYSTEM_ID);
 ALTER TABLE PUB_SECURITY_LEVEL
    ADD CONSTRAINT PUBSECURITYLEVE_PK 
    PRIMARY KEY (SECURITY_LEVEL);
 ALTER TABLE PUB_USERS
    ADD CONSTRAINT PUBUSERS_PK 
    PRIMARY KEY (USER_ID);
 ALTER TABLE PUB_USER_PROXY
    ADD CONSTRAINT PUBUSERPROXY_PK 
    PRIMARY KEY (USER_ID,PROXY_USER_ID);
 ALTER TABLE PUB_DATA_RES_TYPE
    ADD CONSTRAINT PUBDATARESTYPE_PK 
    PRIMARY KEY (DATA_RES_TYPE);
 ALTER TABLE PUB_ROLES
    ADD CONSTRAINT PUBROLES_PK 
    PRIMARY KEY (ROLE_ID);
 ALTER TABLE PUB_USER_ROLE
    ADD CONSTRAINT PUBUSERROLE_PK 
    PRIMARY KEY (USER_ID,GRANTED_ROLE);
 ALTER TABLE PUB_USER_DATAREF
    ADD CONSTRAINT PUBUSERDATAREF_PK 
    PRIMARY KEY (REF_ID);
 ALTER TABLE PUB_ROLE_PRIVS
    ADD CONSTRAINT PUBROLEPRIVS_PK 
    PRIMARY KEY (ROLE_ID,GRANTED_ROLE);
 ALTER TABLE PUB_CONF_ROLESET
    ADD CONSTRAINT PUBCONFROLESET_PK 
    PRIMARY KEY (SET_ID);
 ALTER TABLE PUB_CONF_ROLES
    ADD CONSTRAINT PUBCONFROLES_PK 
    PRIMARY KEY (ROLE_ID,SET_ID);
 ALTER TABLE PUB_MODULES
    ADD CONSTRAINT PUBMODULES_PK 
    PRIMARY KEY (MODULE_ID);
 ALTER TABLE PUB_FUNCTIONS
    ADD CONSTRAINT PUBFUNCTIONS_PK 
    PRIMARY KEY (FUNCTION_ID);
 ALTER TABLE PUB_RESOURCES
    ADD CONSTRAINT PUBRESOURCES_PK 
    PRIMARY KEY (RESOURCE_ID);
 ALTER TABLE PUB_ROLE_RESOURCE
    ADD CONSTRAINT PUBROLERESOURCE_PK 
    PRIMARY KEY (ROLE_ID,RESOURCE_ID);
 ALTER TABLE PUB_TEMPLATES
    ADD CONSTRAINT PUBTEMPLATES_PK 
    PRIMARY KEY (TEMPLATE_ID);
 ALTER TABLE PUB_TROLES
    ADD CONSTRAINT PUBTROLES_PK 
    PRIMARY KEY (ROLE_ID);
 ALTER TABLE PUB_TROLE_OPTS
    ADD CONSTRAINT PUBTROLEOPTS_PK 
    PRIMARY KEY (ROLE_ID,RESOURCE_ID);
ALTER TABLE PUB_FIN_YEAR
    ADD CONSTRAINT PUBFINYEAR_PK 
    PRIMARY KEY (ID);
 ALTER TABLE PUB_FIN_MONTH
    ADD CONSTRAINT PUBFINMONTH_PK 
    PRIMARY KEY (ID);
 ALTER TABLE PUB_FIN_MPERIOD
    ADD CONSTRAINT PUBFINMPERIOD_PK 
    PRIMARY KEY (ID);
 ALTER TABLE PUB_FIN_PTYPE
    ADD CONSTRAINT PUBFINPTYPE_PK 
    PRIMARY KEY (PTYPE);
 ALTER TABLE PUB_STRU_TYPE_REF
    ADD CONSTRAINT PUBSTRUTYPEREF_PK 
    PRIMARY KEY (USER_ID,STRU_TYPE);
 ALTER TABLE PUB_ONLINE
    ADD CONSTRAINT PUBONLINE_PK 
    PRIMARY KEY (SESSION_ID); 
 ALTER TABLE PUB_ONLINE_HIST
    ADD CONSTRAINT PUBONLINEHIST_PK 
    PRIMARY KEY (SESSION_ID); 
 ALTER TABLE PUB_SECURITY_LOG
    ADD CONSTRAINT PUBSERCLOG_PK 
    PRIMARY KEY (LOG_ID);
 ALTER TABLE PUB_LDAP_USER
    ADD CONSTRAINT PubLdapUser_PK 
    PRIMARY KEY (USER_ID);
 ALTER TABLE PUB_CERT_USER
    ADD CONSTRAINT PubCertUser_PK 
    PRIMARY KEY (DN);
 ALTER TABLE PUB_URLS
    ADD CONSTRAINT PubUrls_PK 
    PRIMARY KEY (URL_ID);
 ALTER TABLE PUB_COMMON_SINGLE_PARMS
    ADD CONSTRAINT PubCommonSingle_PK
    PRIMARY KEY (ORGAN_ID); 
 ALTER TABLE PUB_DOC_CONTENT
    ADD CONSTRAINT PubDocContent_PK 
    PRIMARY KEY (FILE_ID);
 ALTER TABLE PUB_RES_TYPE
    ADD CONSTRAINT PubResType_PK 
    PRIMARY KEY (RES_TYPE_ID);
 ----提交创建BSP中相关主键的SQL
 COMMIT;
 
 ----创建BSP中的相关外键的SQL
 ALTER TABLE PUB_CANT
    ADD CONSTRAINT PUBCANT_FK1 FOREIGN KEY (CANT_TYPE)
    REFERENCES PUB_CANT_TYPE (CANT_TYPE);
ALTER TABLE PUB_CANT
    ADD CONSTRAINT PUBCANT_FK2 FOREIGN KEY (COUNTRY_CODE)
    REFERENCES PUB_COUNTRY (COUNTRY_CODE);
ALTER TABLE PUB_WORKPLACE
    ADD CONSTRAINT PUBWORKPLACE_FK1 FOREIGN KEY (CANT_CODE)
    REFERENCES PUB_CANT (CANT_CODE);
ALTER TABLE PUB_HR_EVENT
    ADD CONSTRAINT PUBHREVENT_FK1 FOREIGN KEY (EVENT_TYPE)
    REFERENCES PUB_HR_EVENT_TYPE (EVENT_TYPE);
ALTER TABLE PUB_ORGAN
    ADD CONSTRAINT PUBORGAN_FK1 FOREIGN KEY (ORGAN_TYPE)
    REFERENCES PUB_ORGAN_TYPE (ORGAN_TYPE);
ALTER TABLE PUB_ORGAN
    ADD CONSTRAINT PUBORGAN_FK2 FOREIGN KEY (WORKPLACE_ID)
    REFERENCES PUB_WORKPLACE (WORKPLACE_ID);
ALTER TABLE PUB_STRU
    ADD CONSTRAINT PUBSTRU_FK1 FOREIGN KEY (ORGAN_ID)
    REFERENCES PUB_ORGAN (ORGAN_ID);
ALTER TABLE PUB_STRU
    ADD CONSTRAINT PUBSTRU_FK2 FOREIGN KEY (STRU_TYPE)
    REFERENCES PUB_STRU_TYPE (STRU_TYPE);
ALTER TABLE PUB_STRU_RULE
    ADD CONSTRAINT PUBSTRURULE_FK1 FOREIGN KEY (SRC_REF)
    REFERENCES PUB_ORGAN_TYPE (ORGAN_TYPE);
ALTER TABLE PUB_STRU_RULE
    ADD CONSTRAINT PUBSTRURULE_FK2 FOREIGN KEY (TARGET_REF)
    REFERENCES PUB_ORGAN_TYPE (ORGAN_TYPE);
ALTER TABLE PUB_STRU_RULE
    ADD CONSTRAINT PUBSTRURULE_FK3 FOREIGN KEY (STRU_TYPE)
    REFERENCES PUB_STRU_TYPE (STRU_TYPE);
ALTER TABLE PUB_EXAMPLE_ORGAN
    ADD CONSTRAINT PUBEXAMPLEORGAN_FK FOREIGN KEY (ORGAN_ID)
    REFERENCES PUB_ORGAN (ORGAN_ID);
ALTER TABLE PUB_USER_PROXY
    ADD CONSTRAINT PUBUSERPROXY_FK1 FOREIGN KEY (USER_ID)
    REFERENCES PUB_USERS (USER_ID);
ALTER TABLE PUB_USER_PROXY
    ADD CONSTRAINT PUBUSERPROXY_FK2 FOREIGN KEY ( PROXY_USER_ID )
    REFERENCES PUB_USERS (USER_ID);
ALTER TABLE PUB_USER_ROLE
    ADD CONSTRAINT PUBUSERROLE_FK1 FOREIGN KEY (USER_ID)
    REFERENCES PUB_USERS (USER_ID);
ALTER TABLE PUB_USER_ROLE
    ADD CONSTRAINT PUBUSERROLE_FK2 FOREIGN KEY (GRANTED_ROLE)
    REFERENCES PUB_ROLES (ROLE_ID);
ALTER TABLE PUB_ROLE_PRIVS
    ADD CONSTRAINT PUBROLEPRIVS_FK1 FOREIGN KEY (ROLE_ID)
    REFERENCES PUB_ROLES (ROLE_ID);
ALTER TABLE PUB_ROLE_PRIVS
    ADD CONSTRAINT PUBROLEPRIVS_FK2 FOREIGN KEY (GRANTED_ROLE)
    REFERENCES PUB_ROLES (ROLE_ID);
ALTER TABLE PUB_CONF_ROLES
    ADD CONSTRAINT PUBCONFROLES_FK1 FOREIGN KEY (ROLE_ID)
    REFERENCES PUB_ROLES (ROLE_ID);
ALTER TABLE PUB_CONF_ROLES
    ADD CONSTRAINT PUBCONFROLES_FK2 FOREIGN KEY (SET_ID)
    REFERENCES PUB_CONF_ROLESET (SET_ID);
ALTER TABLE PUB_FUNCTIONS
    ADD CONSTRAINT PUBFUNCTIONS_FK1 FOREIGN KEY (MODULE_ID)
    REFERENCES PUB_MODULES (MODULE_ID);
ALTER TABLE PUB_RESOURCES
    ADD CONSTRAINT PUBRESOURCES_FK1 FOREIGN KEY (SECURITY_LEVEL)
    REFERENCES PUB_SECURITY_LEVEL (SECURITY_LEVEL);
ALTER TABLE PUB_RESOURCES
    ADD CONSTRAINT PUBRESOURCES_FK2 FOREIGN KEY (FUNCTION_ID)
    REFERENCES PUB_FUNCTIONS (FUNCTION_ID);    
ALTER TABLE PUB_ROLE_RESOURCE
    ADD CONSTRAINT PUBROLERES_FK1 FOREIGN KEY (ROLE_ID)
    REFERENCES PUB_ROLES (ROLE_ID);
ALTER TABLE PUB_ROLE_RESOURCE
    ADD CONSTRAINT PUBROLERES_FK2 FOREIGN KEY (RESOURCE_ID)
    REFERENCES PUB_RESOURCES (RESOURCE_ID);
ALTER TABLE PUB_TROLES
    ADD CONSTRAINT PUBTROLES_FK1 FOREIGN KEY (TEMPLATE_ID)
    REFERENCES PUB_TEMPLATES (TEMPLATE_ID);
ALTER TABLE PUB_TROLE_OPTS
    ADD CONSTRAINT PUBTROLEOPTS_FK1 FOREIGN KEY (ROLE_ID)
    REFERENCES PUB_TROLES (ROLE_ID);
ALTER TABLE PUB_TROLE_OPTS
    ADD CONSTRAINT PUBTROLEOPTS_FK2 FOREIGN KEY (RESOURCE_ID)
    REFERENCES PUB_RESOURCES (RESOURCE_ID);
ALTER TABLE PUB_STRU_TYPE_REF
    ADD CONSTRAINT PUBSTRUTYPEREF_FK1 FOREIGN KEY (USER_ID)
    REFERENCES PUB_USERS  (USER_ID);
ALTER TABLE PUB_STRU_TYPE_REF
    ADD CONSTRAINT PUBSTRUTYPEREF_FK2 FOREIGN KEY (STRU_TYPE)
    REFERENCES PUB_STRU_TYPE  (STRU_TYPE);
ALTER TABLE PUB_STRU_TYPE_REF
    ADD CONSTRAINT PUBSTRUTYPEREF_FK3 FOREIGN KEY (STRU_ID)
    REFERENCES PUB_STRU   (STRU_ID);
ALTER TABLE PUB_ORGAN_PARMS
    ADD CONSTRAINT PUBORGANPARMS_FK1 FOREIGN KEY (PARMS_NAME)
    REFERENCES PUB_ORGAN_PARMS_T (PARMS_NAME);    
ALTER TABLE PUB_URLS
    ADD CONSTRAINT PubUrls_FK1 FOREIGN KEY (RESOURCE_ID)
    REFERENCES PUB_RESOURCES (RESOURCE_ID);
ALTER TABLE PUB_URLS
    ADD CONSTRAINT PubUrls_FK2 FOREIGN KEY (FUNCTION_ID)
    REFERENCES PUB_FUNCTIONS (FUNCTION_ID);
ALTER TABLE PUB_RESOURCES
    ADD CONSTRAINT PUBRESOURCES_FK3 FOREIGN KEY (RES_TYPE_ID)
    REFERENCES PUB_RES_TYPE (RES_TYPE_ID);    
----提交创建BSP中相关外键的SQL

----创建BSP中的相关索引
CREATE UNIQUE INDEX IDTABLE_IDX ON PUB_IDTABLE 
(ID_ID ASC,ORGAN_ID ASC);
----提交创建BSP中的相关索引
COMMIT;

