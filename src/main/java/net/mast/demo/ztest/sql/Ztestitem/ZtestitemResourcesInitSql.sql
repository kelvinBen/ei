--更改客户报价单
INSERT INTO pub_modules (MODULE_ID, MODULE_NAME, PARENT_MODULE_ID, IS_LEAF, RESULT_LIMITS, APP_ID, SEQ ) VALUES ( 'ztestitem001', '测试行项目', 'business01', '1', 0, '', 1 );  



--功能
INSERT INTO pub_functions (FUNCTION_ID, FUNCTION_CODE, FUNCTION_NAME, MODULE_ID, IS_SYS, DATA_RES_TYPE, SEQ ) VALUES ( 'ztestitem002', 'ztestitem002', '测试行项目', 'ztestitem001', '0', '', 0 ); 


--资源
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0001', '测试行项目查询', '测试行项目查询', 'ztestitemquery_page_init.cmd', 0, 'ztestitem002', '0', '0', '00', 0 );  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0002', '测试行项目新增-forinsert', '测试行项目新增-forinsert', 'ztestitem.cmd?method=forinsert', 0, 'ztestitem002', '0', '0', '00', 1 );  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0003', '测试行项目新增-insert', '测试行项目新增-insert', 'ztestitem.cmd?method=insert', 0, 'ztestitem002', '0', '0', '00', 2 );  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0004', '测试行项目修改-forupdate', '测试行项目修改-forupdate', 'ztestitem.cmd?method=forupdate', 0, 'ztestitem002', '0', '0', '00', 3 );  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0005', '测试行项目修改-update', '测试行项目修改-update', 'ztestitem.cmd?method=update', 0, 'ztestitem002', '0', '0', '00', 4);  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0006', '测试行项目明细-detail', '测试行项目明细-detail', 'ztestitem.cmd?method=detail', 0, 'ztestitem002', '0', '0', '00', 5 );  
--INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0007', '保存并继续', '保存并继续', 'ztestitem.cmd?method=insertContinue', 0, 'ztestitem002', '0', '0', '00', 6 );  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0008', '测试行项目删除-delete', '测试行项目删除-delete', 'ztestitem.cmd?method=delete', 0, 'ztestitem002', '0', '0', '00', 7 );
--INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0009', '测试行项目子页面-forDetailList', '测试行项目子页面-forDetailList', 'ztestitem.cmd?method=forDetailList', 0, 'ztestitem002', '0', '0', '00', 8 );  
--INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem00010', '测试行项目条件页面-forDetailto', '测试行项目条件页面-fordetailto', 'ztestitem.cmd?method=fordetailto', 0, 'ztestitem002', '0', '0', '00', 9 );  
--INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem00011', '测试行项目修改条件页面-forupdateto', '测试行项目修改条件页面-forupdateto', 'ztestitem.cmd?method=forupdateto', 0, 'ztestitem002', '0', '0', '00', 10 );  

--WF
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem00012', '测试行项目-createAndSend', '测试行项目-createAndSend', 'ztestitem.cmd?method=createAndSend', 0, 'ztestitem002', '0', '0', '00', 11 );  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem00013', '测试行项目-send', '测试行项目-send', 'ztestitem.cmd?method=send', 0, 'ztestitem002', '0', '0', '00', 12 );  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem00014', '测试行项目-back', '测试行项目-back', 'ztestitem.cmd?method=back', 0, 'ztestitem002', '0', '0', '00', 13 );  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem00015', '测试行项目-create', '测试行项目-create', 'ztestitem.cmd?method=create', 0, 'ztestitem002', '0', '0', '00', 14 );  





--url
INSERT INTO pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztestitem01', 'ztestitemquery_page_init.cmd', 'ztestitem0001', 'ztestitem002', '' ); 
INSERT INTO pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztestitem02', 'ztestitem.cmd?method=forinsert', 'ztestitem0002', 'ztestitem002', '' ); 
INSERT INTO pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztestitem03', 'ztestitem.cmd?method=insert', 'ztestitem0003', 'ztestitem002', '' ); 
INSERT INTO pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztestitem04', 'ztestitem.cmd?method=forupdate', 'ztestitem0004', 'ztestitem002', '' ); 
INSERT INTO pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztestitem05', 'ztestitem.cmd?method=update', 'ztestitem0005', 'ztestitem002', '' ); 
INSERT INTO pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztestitem06', 'ztestitem.cmd?method=detail', 'ztestitem0006', 'ztestitem002', '' ); 
--INSERT INTO pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztestitem07', 'ztestitem.cmd?method=insertContinue', 'ztestitem0007', 'ztestitem002', '' ); 
INSERT INTO pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztestitem08', 'ztestitem.cmd?method=delete', 'ztestitem0008', 'ztestitem002', '' ); 
--INSERT INTO pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztestitem09', 'ztestitem.cmd?method=forDetailList', 'ztestitem0009', 'ztestitem002', '' ); 
--INSERT INTO pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztestitem010', 'ztestitem.cmd?method=forDetailto', 'ztestitem00010', 'ztestitem002', '' ); 
--INSERT INTO pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztestitem011', 'ztestitem.cmd?method=forupdateto', 'ztestitem00011', 'ztestitem002', '' ); 
--WF
INSERT INTO pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztestitem012', 'ztestitem.cmd?method=createAndSend', 'ztestitem00012', 'ztestitem002', '' ); 
INSERT INTO pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztestitem013', 'ztestitem.cmd?method=send', 'ztestitem00013', 'ztestitem002', '' ); 
INSERT INTO pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztestitem014', 'ztestitem.cmd?method=back', 'ztestitem00014', 'ztestitem002', '' ); 
INSERT INTO pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztestitem015', 'ztestitem.cmd?method=create', 'ztestitem00015', 'ztestitem002', '' ); 



------------------------删除superadmin具有的资源
DELETE FROM PUB_ROLE_RESOURCE WHERE ROLE_ID='SUPERADMIN';
--将所有其他资源赋予superadmin
INSERT INTO PUB_ROLE_RESOURCE SELECT 'SUPERADMIN',RESOURCE_ID FROM PUB_RESOURCES ;


--url
--delete from pub_urls where  FUNCTION_ID='ztestitem002';
--资源
--delete from pub_resources where  FUNCTION_ID='ztestitem002';
--功能
--delete from pub_functions where  FUNCTION_ID='ztestitem002';
--模块
--delete from pub_modules  where module_id='ztestitem001';



--OBJ
--delete from DICT_OBJOPERATIONMAIN  where OBJID='ZTESTITEMOBJ'


INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem01', 'ZTESTITEMOBJ', '', 'ztestitemquery_page_init.cmd', '测试行项目查询', 'ztestitem0001', 'query', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem02', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=forinsert', '测试行项目新增-forinsert', 'ztestitem0002', 'forinsert', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem03', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=insert', '测试行项目新增-insert', 'ztestitem0003', 'insert', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem04', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=forupdate', '测试行项目修改-forupdate', 'ztestitem0004', 'forupdate', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem05', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=update', '测试行项目修改-update', 'ztestitem0005', 'update', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem06', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=detail', '测试行项目明细-detail', 'ztestitem0006', 'detail', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem07', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=insertContinue', '测试行项目新增-insertContinue', 'ztestitem0007', 'insertContinue', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem08', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=delete', '测试行项目删除-delete', 'ztestitem0008', 'delete', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem09', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=forDetailList', '测试行项目明细子页面-forDetailList', 'ztestitem0009', 'forDetailList', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem10', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=forDetailto', '测试行项目明细子页面-forDetailto', 'ztestitem0010', 'forDetailto', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem11', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=forupdateto', '测试行项目修改-forupdateto', 'ztestitem0011', 'forupdateto', '1', '', '', '', '', '' );

--WF
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem12', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=createAndSend', '测试行项目创建发送', 'ztestitem0012', 'createAndSend', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem13', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=send', '测试行项目发送', 'ztestitem0013', 'send', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem14', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=back', '测试行项目退回', 'ztestitem0014', 'back', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem15', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=create', '测试行项目创建', 'ztestitem0015', 'create', '1', '', '', '', '', '' ); 



 