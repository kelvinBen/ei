INSERT INTO ei.pub_modules (MODULE_ID, MODULE_NAME, PARENT_MODULE_ID, IS_LEAF,  SEQ ) VALUES ( 'ztest001', '������', 'unusedModule', '1',   1 );

INSERT INTO ei.pub_functions (FUNCTION_ID, FUNCTION_CODE, FUNCTION_NAME, MODULE_ID, IS_SYS, DATA_RES_TYPE, SEQ ) VALUES ( 'ztest002', 'ztest002', '������', 'ztest001', '0', '', 0 ); 


INSERT INTO ei.pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztest0001', '�����в�ѯ', '�����в�ѯ', 'ztestquery_page_init.cmd', 0, 'ztest002', '0', '0', '00', 0 );  
INSERT INTO ei.pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztest0002', '����������-forinsert', '����������-forinsert', 'ztest.cmd?method=forinsert', 0, 'ztest002', '0', '0', '00', 1 );  
INSERT INTO ei.pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztest0003', '����������-insert', '����������-insert', 'ztest.cmd?method=insert', 0, 'ztest002', '0', '0', '00', 2 );  
INSERT INTO ei.pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztest0004', '�������޸�-forupdate', '�������޸�-forupdate', 'ztest.cmd?method=forupdate', 0, 'ztest002', '0', '0', '00', 3 );  
INSERT INTO ei.pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztest0005', '�������޸�-update', '�������޸�-update', 'ztest.cmd?method=update', 0, 'ztest002', '0', '0', '00', 4);  
INSERT INTO ei.pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztest0006', '��������ϸ-detail', '��������ϸ-detail', 'ztest.cmd?method=detail', 0, 'ztest002', '0', '0', '00', 5 );  
INSERT INTO ei.pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'ztest0008', '������ɾ��-delete', '������ɾ��-delete', 'ztest.cmd?method=delete', 0, 'ztest002', '0', '0', '00', 7 );






--url
INSERT INTO ei.pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztest01', 'ztestquery_page_init.cmd', 'ztest0001', 'ztest002', '' ); 
INSERT INTO ei.pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztest02', 'ztest.cmd?method=forinsert', 'ztest0002', 'ztest002', '' ); 
INSERT INTO ei.pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztest03', 'ztest.cmd?method=insert', 'ztest0003', 'ztest002', '' ); 
INSERT INTO ei.pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztest04', 'ztest.cmd?method=forupdate', 'ztest0004', 'ztest002', '' ); 
INSERT INTO ei.pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztest05', 'ztest.cmd?method=update', 'ztest0005', 'ztest002', '' ); 
INSERT INTO ei.pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztest06', 'ztest.cmd?method=detail', 'ztest0006', 'ztest002', '' ); 
INSERT INTO ei.pub_urls (URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE ) VALUES ( 'ztest08', 'ztest.cmd?method=delete', 'ztest0008', 'ztest002', '' ); 



------------------------ɾ��superadmin���е���Դ
DELETE FROM ei.pub_ROLE_RESOURCE WHERE ROLE_ID='SUPERADMIN';
--������������Դ����superadmin
INSERT INTO ei.pub_ROLE_RESOURCE SELECT 'SUPERADMIN',RESOURCE_ID FROM ei.pub_RESOURCES ;


--url
--delete from ei.pub_urls where  FUNCTION_ID='ztest002';
--��Դ
--delete from ei.pub_resources where  FUNCTION_ID='ztest002';
--����
--delete from ei.pub_functions where  FUNCTION_ID='ztest002';
--ģ��
--delete from ei.pub_modules  where module_id='ztest001';



--OBJ
--delete from DICT_OBJOPERATIONMAIN  where OBJID='ZTESTOBJ'


INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztest01', 'ZTESTOBJ', '', 'ztestquery_page_init.cmd', '�����в�ѯ', 'ztest0001', 'query', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztest02', 'ZTESTOBJ', '', 'ztest.cmd?method=forinsert', '����������-forinsert', 'ztest0002', 'forinsert', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztest03', 'ZTESTOBJ', '', 'ztest.cmd?method=insert', '����������-insert', 'ztest0003', 'insert', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztest04', 'ZTESTOBJ', '', 'ztest.cmd?method=forupdate', '�������޸�-forupdate', 'ztest0004', 'forupdate', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztest05', 'ZTESTOBJ', '', 'ztest.cmd?method=update', '�������޸�-update', 'ztest0005', 'update', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztest06', 'ZTESTOBJ', '', 'ztest.cmd?method=detail', '��������ϸ-detail', 'ztest0006', 'detail', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztest07', 'ZTESTOBJ', '', 'ztest.cmd?method=insertContinue', '����������-insertContinue', 'ztest0007', 'insertContinue', '1', '', '', '', '', '' ); 
INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztest08', 'ZTESTOBJ', '', 'ztest.cmd?method=delete', '������ɾ��-delete', 'ztest0008', 'delete', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztest09', 'ZTESTOBJ', '', 'ztest.cmd?method=forDetailList', '��������ϸ��ҳ��-forDetailList', 'ztest0009', 'forDetailList', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztest10', 'ZTESTOBJ', '', 'ztest.cmd?method=forDetailto', '��������ϸ��ҳ��-forDetailto', 'ztest0010', 'forDetailto', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztest11', 'ZTESTOBJ', '', 'ztest.cmd?method=forupdateto', '�������޸�-forupdateto', 'ztest0011', 'forupdateto', '1', '', '', '', '', '' );

--WF
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztest12', 'ZTESTOBJ', '', 'ztest.cmd?method=createAndSend', '�����д�������', 'ztest0012', 'createAndSend', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztest13', 'ZTESTOBJ', '', 'ztest.cmd?method=send', '�����з���', 'ztest0013', 'send', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztest14', 'ZTESTOBJ', '', 'ztest.cmd?method=back', '�������˻�', 'ztest0014', 'back', '1', '', '', '', '', '' ); 
--INSERT INTO DICT_OBJOPERATIONMAIN (CODEID, OBJID, OBJNAME, COMMADNURL, COMMANDNAME, COMMANDID, COMMANDTYPE, ISHAVEPAGE, FIELD_KZ_ONE, FIELD_KZ_TWO, FIELD_KZ_THREE, FIELD_KZ_FOUR, FIELD_KZ_FIVE ) VALUES ( 'ztest15', 'ZTESTOBJ', '', 'ztest.cmd?method=create', '�����д���', 'ztest0015', 'create', '1', '', '', '', '', '' ); 



 