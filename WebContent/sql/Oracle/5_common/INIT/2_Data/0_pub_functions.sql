--在pub_functions表中增加新菜单项信息
INSERT INTO pub_functions(FUNCTION_ID, FUNCTION_CODE, FUNCTION_NAME, MODULE_ID, IS_SYS, DATA_RES_TYPE, SEQ ) VALUES ( 'BASE0009', 'BASE0009', '平台版本', 'BASE00', '1', '', 8 );
--在pub_resources表中增加新菜单项信息
INSERT INTO pub_resources (RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'BASE000901', '获取', '平台版本', 'jsp/readVersion.jsp', 0, 'BASE0009', '0', '0', '00', 0 );