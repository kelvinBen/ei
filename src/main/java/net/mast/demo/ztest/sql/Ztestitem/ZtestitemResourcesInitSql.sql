--���Ŀͻ����۵�
INSERT INTO pub_modules (MODULE_ID, MODULE_NAME, PARENT_MODULE_ID, IS_LEAF, RESULT_LIMITS, APP_ID, SEQ ) VALUES ( 'ztestitem001', '��������Ŀ', 'business01', '1', 0, '', 1 );  



--����
INSERT INTO pub_functions (FUNCTION_ID, FUNCTION_CODE, FUNCTION_NAME, MODULE_ID, IS_SYS, DATA_RES_TYPE, SEQ ) VALUES ( 'ztestitem002', 'ztestitem002', '��������Ŀ', 'ztestitem001', '0', '', 0 ); 


--��Դ
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0001', '��������Ŀ��ѯ', '��������Ŀ��ѯ', 'ztestitemquery_page_init.cmd', 0, 'ztestitem002', '0', '0', '00', 0 );  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0002', '��������Ŀ����-forinsert', '��������Ŀ����-forinsert', 'ztestitem.cmd?method=forinsert', 0, 'ztestitem002', '0', '0', '00', 1 );  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0003', '��������Ŀ����-insert', '��������Ŀ����-insert', 'ztestitem.cmd?method=insert', 0, 'ztestitem002', '0', '0', '00', 2 );  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0004', '��������Ŀ�޸�-forupdate', '��������Ŀ�޸�-forupdate', 'ztestitem.cmd?method=forupdate', 0, 'ztestitem002', '0', '0', '00', 3 );  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0005', '��������Ŀ�޸�-update', '��������Ŀ�޸�-update', 'ztestitem.cmd?method=update', 0, 'ztestitem002', '0', '0', '00', 4);  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0006', '��������Ŀ��ϸ-detail', '��������Ŀ��ϸ-detail', 'ztestitem.cmd?method=detail', 0, 'ztestitem002', '0', '0', '00', 5 );  
--INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0007', '���沢����', '���沢����', 'ztestitem.cmd?method=insertContinue', 0, 'ztestitem002', '0', '0', '00', 6 );  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0008', '��������Ŀɾ��-delete', '��������Ŀɾ��-delete', 'ztestitem.cmd?method=delete', 0, 'ztestitem002', '0', '0', '00', 7 );
--INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem0009', '��������Ŀ��ҳ��-forDetailList', '��������Ŀ��ҳ��-forDetailList', 'ztestitem.cmd?method=forDetailList', 0, 'ztestitem002', '0', '0', '00', 8 );  
--INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem00010', '��������Ŀ����ҳ��-forDetailto', '��������Ŀ����ҳ��-fordetailto', 'ztestitem.cmd?method=fordetailto', 0, 'ztestitem002', '0', '0', '00', 9 );  
--INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem00011', '��������Ŀ�޸�����ҳ��-forupdateto', '��������Ŀ�޸�����ҳ��-forupdateto', 'ztestitem.cmd?method=forupdateto', 0, 'ztestitem002', '0', '0', '00', 10 );  

--WF
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem00012', '��������Ŀ-createAndSend', '��������Ŀ-createAndSend', 'ztestitem.cmd?method=createAndSend', 0, 'ztestitem002', '0', '0', '00', 11 );  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem00013', '��������Ŀ-send', '��������Ŀ-send', 'ztestitem.cmd?method=send', 0, 'ztestitem002', '0', '0', '00', 12 );  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem00014', '��������Ŀ-back', '��������Ŀ-back', 'ztestitem.cmd?method=back', 0, 'ztestitem002', '0', '0', '00', 13 );  
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztestitem00015', '��������Ŀ-create', '��������Ŀ-create', 'ztestitem.cmd?method=create', 0, 'ztestitem002', '0', '0', '00', 14 );  





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



------------------------ɾ��superadmin���е���Դ
DELETE FROM PUB_ROLE_RESOURCE WHERE ROLE_ID='SUPERADMIN';
--������������Դ����superadmin
INSERT INTO PUB_ROLE_RESOURCE SELECT 'SUPERADMIN',RESOURCE_ID FROM PUB_RESOURCES ;


--url
--delete from pub_urls where  FUNCTION_ID='ztestitem002';
--��Դ
--delete from pub_resources where  FUNCTION_ID='ztestitem002';
--����
--delete from pub_functions where  FUNCTION_ID='ztestitem002';
--ģ��
--delete from pub_modules  where module_id='ztestitem001';



--OBJ
--delete from DICT_OBJOPERATIONMAIN  where OBJID='ZTESTITEMOBJ'


INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem01', 'ZTESTITEMOBJ', '', 'ztestitemquery_page_init.cmd', '��������Ŀ��ѯ', 'ztestitem0001', 'query', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem02', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=forinsert', '��������Ŀ����-forinsert', 'ztestitem0002', 'forinsert', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem03', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=insert', '��������Ŀ����-insert', 'ztestitem0003', 'insert', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem04', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=forupdate', '��������Ŀ�޸�-forupdate', 'ztestitem0004', 'forupdate', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem05', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=update', '��������Ŀ�޸�-update', 'ztestitem0005', 'update', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem06', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=detail', '��������Ŀ��ϸ-detail', 'ztestitem0006', 'detail', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem07', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=insertContinue', '��������Ŀ����-insertContinue', 'ztestitem0007', 'insertContinue', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem08', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=delete', '��������Ŀɾ��-delete', 'ztestitem0008', 'delete', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem09', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=forDetailList', '��������Ŀ��ϸ��ҳ��-forDetailList', 'ztestitem0009', 'forDetailList', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem10', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=forDetailto', '��������Ŀ��ϸ��ҳ��-forDetailto', 'ztestitem0010', 'forDetailto', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem11', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=forupdateto', '��������Ŀ�޸�-forupdateto', 'ztestitem0011', 'forupdateto', '1', '', '', '', '', '' );

--WF
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem12', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=createAndSend', '��������Ŀ��������', 'ztestitem0012', 'createAndSend', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem13', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=send', '��������Ŀ����', 'ztestitem0013', 'send', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem14', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=back', '��������Ŀ�˻�', 'ztestitem0014', 'back', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztestitem15', 'ZTESTITEMOBJ', '', 'ztestitem.cmd?method=create', '��������Ŀ����', 'ztestitem0015', 'create', '1', '', '', '', '', '' ); 



 