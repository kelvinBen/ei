--用户参数表
CREATE TABLE PUB_USER_PARMS
(
            USER_ID VARCHAR (30) NOT NULL ,
            PARMS_NAME VARCHAR (60) NOT NULL ,
            PARMS_VALUE VARCHAR (250) NOT NULL ,
            NOTE VARCHAR (250) 
);


--系统菜单项
CREATE TABLE PUB_MENU_SYSITEM
(
            MENU_ID VARCHAR (30) NOT NULL ,
            TEXT VARCHAR (30) ,
            TITLE VARCHAR (30) ,
            TYPE CHAR (1) ,
            VALUE VARCHAR (250) ,
            TARGET VARCHAR (30) ,
            OPTIONS VARCHAR (250) ,
            FUNCTION_ID VARCHAR (30) ,
            APP_ID VARCHAR(30)
);


--菜单类型
CREATE TABLE PUB_MENU_TYPE
(
            TYPE_ID VARCHAR (10) NOT NULL ,
            TYPE_NAME VARCHAR (60) ,
            IS_CURRENT CHAR (1) 
);


--系统菜单
CREATE TABLE PUB_MENU_SYS
(
            MENU_SYS_ID VARCHAR (30) NOT NULL ,
            MENU_ID VARCHAR (30) NOT NULL ,
            TYPE_ID VARCHAR (10) NOT NULL ,
            MENU_ALIAS VARCHAR (30) ,
            PARENT_ID VARCHAR (30) ,
            SEQ INTEGER ,
            IS_LEAF CHAR (1) 
);


--个性化菜单项
CREATE TABLE PUB_MENU_PERITEM
(
            MENU_ID VARCHAR (30) NOT NULL ,
            TEXT VARCHAR (30) ,
            TITLE VARCHAR (30) ,
            TYPE CHAR (1) ,
            VALUE VARCHAR (250) ,
            TARGET VARCHAR (30) ,
            OPTIONS VARCHAR (250) ,
            FUNCTION_ID VARCHAR (30) ,
            APP_ID VARCHAR(30)
);


--组织机构菜单类型
CREATE TABLE PUB_MENU_STRU_TYPE
(
            STRU_TYPE_ID VARCHAR (30) NOT NULL ,
            STRU_TYPE_NAME VARCHAR (60) NOT NULL ,
            STRU_ID VARCHAR (30) NOT NULL 
);


--组织机构菜单
CREATE TABLE PUB_MENU_STRU
(
            MENU_STRU_ID VARCHAR (30) NOT NULL ,
            MENU_ID VARCHAR (30) NOT NULL ,
            STRU_TYPE_ID VARCHAR (30) NOT NULL ,
            IS_SYS CHAR (1) NOT NULL ,
            MENU_ALIAS VARCHAR (30) ,
            PARENT_ID VARCHAR (30) ,
            SEQ INTEGER ,
            IS_LEAF CHAR (1) 
);

CREATE TABLE PUB_APP
(
                APP_ID VARCHAR (30) NOT NULL ,
                APP_NAME VARCHAR (100) NOT NULL ,
                CORPORATION_ID VARCHAR (30) NOT NULL ,
                TP VARCHAR (30) NOT NULL ,
                IP VARCHAR (15),
                PORT VARCHAR (6),
                CONTEXT VARCHAR (50),
                DOMAINNAME VARCHAR (100),
                NOTE VARCHAR (100) 
);

COMMIT;

ALTER TABLE PUB_USER_PARMS
    ADD CONSTRAINT PubUserParms_PK 
    PRIMARY KEY (USER_ID,PARMS_NAME);
 ALTER TABLE PUB_MENU_SYSITEM
    ADD CONSTRAINT PubMenuSysitem_PK 
    PRIMARY KEY (MENU_ID);
 ALTER TABLE PUB_MENU_TYPE
    ADD CONSTRAINT PubMenuType_PK 
    PRIMARY KEY (TYPE_ID);
 ALTER TABLE PUB_MENU_SYS
    ADD CONSTRAINT PubMenuSys_PK 
    PRIMARY KEY (MENU_SYS_ID);
 ALTER TABLE PUB_MENU_PERITEM
    ADD CONSTRAINT PubMenuPeritem_PK 
    PRIMARY KEY (MENU_ID);
 ALTER TABLE PUB_MENU_STRU_TYPE
    ADD CONSTRAINT PubMenuStruType_PK 
    PRIMARY KEY (STRU_TYPE_ID);
 ALTER TABLE PUB_MENU_STRU
    ADD CONSTRAINT PubMenuStru_PK 
    PRIMARY KEY (MENU_STRU_ID);
 ALTER TABLE PUB_APP
    ADD CONSTRAINT PubApp_PK 
    PRIMARY KEY (APP_ID);
 COMMIT;
ALTER TABLE PUB_MENU_SYS
    ADD CONSTRAINT PubMenuSys_FK1 FOREIGN KEY (MENU_ID)
    REFERENCES PUB_MENU_SYSITEM (MENU_ID);
ALTER TABLE PUB_MENU_SYS
    ADD CONSTRAINT PubMenuSys_FK2 FOREIGN KEY (TYPE_ID)
    REFERENCES PUB_MENU_TYPE (TYPE_ID);
ALTER TABLE PUB_MENU_STRU_TYPE
    ADD CONSTRAINT PubMenuStruType_FK FOREIGN KEY (STRU_ID)
    REFERENCES PUB_STRU (STRU_ID);
ALTER TABLE PUB_MENU_STRU
    ADD CONSTRAINT PubMenuStru_FK1 FOREIGN KEY (STRU_TYPE_ID)
    REFERENCES PUB_MENU_STRU_TYPE (STRU_TYPE_ID);
 COMMIT;