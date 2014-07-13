--模块
INSERT INTO  pub_modules(MODULE_ID, MODULE_NAME, PARENT_MODULE_ID, IS_LEAF, SEQ ) VALUES ( 'WORKFLOW04', '示例：差旅报销流程', 'WORKFLOW', '1', null );

--功能
INSERT INTO  pub_functions(FUNCTION_ID, FUNCTION_CODE, FUNCTION_NAME, MODULE_ID, IS_SYS, DATA_RES_TYPE, SEQ ) VALUES ( 'WORKFLOW0401', 'WORKFLOW0401', '示例：差旅报销流程', 'WORKFLOW04', '0', null, null );

--资源
INSERT INTO  pub_resources(RESOURCE_ID, RESOURCE_NAME, RESOURCE_ALIAS, URL_NAMES, SECURITY_LEVEL, FUNCTION_ID, IS_DEFAULT, IS_AUDIT, RES_TYPE_ID, SEQ ) VALUES ( 'WORKFLOW040101', '示例：差旅报销流程', '示例：差旅报销流程', 'clbx.cmd?method=create;clbx.cmd?method=createAndSend;clbx.cmd?method=send;clbx.cmd?method=back;clbx.cmd?method=forinsert;clbx.cmd?method=forupdate;clbx.cmd?method=detail;clbx.cmd?method=update', 0, 'WORKFLOW0401', '1', '0', '00', null );

--赋给角色
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW040101');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWCOMUSER', 'WORKFLOW040101');

--精确匹配
INSERT INTO  pub_urls(URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE )  VALUES ( 'BPM040101000000000000000000001',  'clbx.cmd?method=create', 'WORKFLOW040101', 'WORKFLOW0401', 'null' );
INSERT INTO  pub_urls(URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE )  VALUES ( 'BPM040101000000000000000000002',  'clbx.cmd?method=createAndSend', 'WORKFLOW040101', 'WORKFLOW0401', 'null' );
INSERT INTO  pub_urls(URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE )  VALUES ( 'BPM040101000000000000000000003',  'clbx.cmd?method=send', 'WORKFLOW040101', 'WORKFLOW0401', 'null' );
INSERT INTO  pub_urls(URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE )  VALUES ( 'BPM040101000000000000000000004',  'clbx.cmd?method=back', 'WORKFLOW040101', 'WORKFLOW0401', 'null' );
INSERT INTO  pub_urls(URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE )  VALUES ( 'BPM040101000000000000000000005',  'clbx.cmd?method=forinsert', 'WORKFLOW040101', 'WORKFLOW0401', 'null' );
INSERT INTO  pub_urls(URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE )  VALUES ( 'BPM040101000000000000000000006',  'clbx.cmd?method=forupdate', 'WORKFLOW040101', 'WORKFLOW0401', 'null' );
INSERT INTO  pub_urls(URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE )  VALUES ( 'BPM040101000000000000000000007',  'clbx.cmd?method=detail', 'WORKFLOW040101', 'WORKFLOW0401', 'null' );
INSERT INTO  pub_urls(URL_ID, URL_NAME, RESOURCE_ID, FUNCTION_ID, URL_NOTE )  VALUES ( 'BPM040101000000000000000000008',  'clbx.cmd?method=update', 'WORKFLOW040101', 'WORKFLOW0401', 'null' );

------------------------删除superadmin具有的资源
DELETE FROM PUB_ROLE_RESOURCE WHERE ROLE_ID='SUPERADMIN';
--将所有其他资源赋予superadmin
INSERT INTO PUB_ROLE_RESOURCE SELECT 'SUPERADMIN',RESOURCE_ID FROM PUB_RESOURCES ;
