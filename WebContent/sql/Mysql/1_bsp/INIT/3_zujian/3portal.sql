
INSERT INTO PUB_MENU_SYSITEM (MENU_ID, TEXT, TITLE, TYPE, VALUE, TARGET, OPTIONS, FUNCTION_ID, APP_ID ) VALUES ( 'BSP000001177', '���ƹ���̨', '', '0', 'commondesktopcopy.cmd?method=forcopy', '', '', '', '' );  

INSERT INTO PUB_MENU_SYS (MENU_SYS_ID, MENU_ID, TYPE_ID, MENU_ALIAS, PARENT_ID, SEQ, IS_LEAF ) VALUES ( 'BSP000001177', 'BSP000001177', '01', '���ƹ���̨', 'BSP000000000000000000000000029', 6, ' ' ); 

INSERT INTO PUB_FUNCTIONS (FUNCTION_ID, FUNCTION_CODE, FUNCTION_NAME, MODULE_ID, IS_SYS, DATA_RES_TYPE, SEQ ) VALUES ( 'BSPDEST01', 'BSPDEST01', '��ҳ����', 'BSP00', '1', null, 0 ); 

INSERT INTO PUB_RESOURCES (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'BSPDEST0101', '��ҳ����', '��ҳ����', 'commondesktopcopy.cmd', 0, 'BSPDEST01', '0', '0', '00', 0 ); 

-- �������ݳ�ʼ��
INSERT INTO PUB_COMHELP (HELP_ID, HELP_TITLE, HELP_SQL, ID_FIELD, NAME_FIELD, SHOW_FIELD, RETURN_FIELD, SHEARCH_FIELD, SHOW_NAME, HELP_TABLE, HELP_NOTE, DATASOURCE, NOTE, NOTE2, NOTE3 ) VALUES ( 'helpUser', 'ѡ���û�', 'select USER_ID,USER_NAME from PUB_USERS where CORPORATION_ID =''@CORPORATION_ID@''', 'USER_ID', 'USER_NAME', 'USER_ID,USER_NAME', 'USER_ID,USER_NAME', 'USER_ID,USER_NAME', 'USER_ID#�û��ʺ�#,USER_NAME#�û�����#', 'PUB_USERS', '���ݴ���ķ��˵�STRU_ID ,��ʾ�÷���������û�', '', '', '', '' ); 

INSERT INTO PUB_ROLE_RESOURCE (ROLE_ID, RESOURCE_ID ) VALUES ( 'SUPERADMIN', 'BSPDEST0101' );  