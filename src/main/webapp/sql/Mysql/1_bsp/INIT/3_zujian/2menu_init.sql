
INSERT INTO PUB_MENU_SYSITEM (MENU_ID, TEXT, TITLE, TYPE, VALUE, TARGET, OPTIONS, FUNCTION_ID, APP_ID ) VALUES ( 'PUBTOOL00000001001', '�������', null, '0', null, null, null, null, '' ); 
INSERT INTO PUB_MENU_SYSITEM (MENU_ID, TEXT, TITLE, TYPE, VALUE, TARGET, OPTIONS, FUNCTION_ID, APP_ID ) VALUES ( 'PUBTOOL00000001003', 'ͨ��ѡ��', null, '0', 'pubcomhelpquery_page_init.cmd?clear=true', null, null, null, '' ); 

INSERT INTO PUB_MENU_SYS (MENU_SYS_ID, MENU_ID, TYPE_ID, MENU_ALIAS, PARENT_ID, SEQ, IS_LEAF ) VALUES ( 'PUBTOOL00000001002', 'PUBTOOL00000001001', '01', '�������', 'BSP000000000000000000000000001', 7, '' );  
INSERT INTO PUB_MENU_SYS (MENU_SYS_ID, MENU_ID, TYPE_ID, MENU_ALIAS, PARENT_ID, SEQ, IS_LEAF ) VALUES ( 'PUBTOOL00000001004', 'PUBTOOL00000001003', '01', 'ͨ��ѡ��', 'PUBTOOL00000001002', 0, '' );

INSERT INTO PUB_MODULES (MODULE_ID, MODULE_NAME, PARENT_MODULE_ID, IS_LEAF, SEQ ) VALUES ( 'PUBTOOL', '�������', 'PUBTOOL', '0', 0 );  
INSERT INTO PUB_MODULES (MODULE_ID, MODULE_NAME, PARENT_MODULE_ID, IS_LEAF, SEQ ) VALUES ( 'PUBTOOL01', 'ͨ��ѡ��', 'PUBTOOL', '1', 0 );  

INSERT INTO PUB_FUNCTIONS (FUNCTION_ID, FUNCTION_CODE, FUNCTION_NAME, MODULE_ID, IS_SYS, DATA_RES_TYPE, SEQ ) VALUES ( 'PUBTOOL0101', 'PUBTOOL0101', 'ͨ��ѡ���������', 'PUBTOOL01', '1', null, 0 );  

INSERT INTO PUB_RESOURCES (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'PUBTOOL010101', 'ͨ��ѡ�������ѯ', 'ͨ��ѡ�������ѯ', 'pubcomhelpquery_page_init.cmd', 0, 'PUBTOOL0101', '0', '0', '00', 0 );  
INSERT INTO PUB_RESOURCES (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'PUBTOOL010102', 'ͨ��ѡ�����ά��', 'ͨ��ѡ�����ά��', 'pubcomhelp.cmd', 0, 'PUBTOOL0101', '0', '1', '00', 0 );  
INSERT INTO PUB_RESOURCES (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'PUBTOOL010103', 'ͨ��ѡ���������', 'ͨ��ѡ���������', 'helpgridquery.cmd', 0, 'PUBTOOL0101', '1', '0', '00', 0 );  

