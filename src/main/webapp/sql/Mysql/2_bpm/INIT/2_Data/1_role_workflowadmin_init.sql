--PUB_ROLES 角色
INSERT INTO PUB_ROLES VALUES ('WORKFLOWADMIN', 'WORKFLOWADMIN', '工作流管理员', '1', '0');

--PUB_TROLES 授权模板角色定义
INSERT INTO PUB_TROLES VALUES ('WORKFLOWADMIN', 'WORKFLOWADMIN', '工作流管理员', '0', -1, '1');

--PUB_ROLE_RESOURCE 角色资源对应

--工作流类型
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0101');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0102');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0103');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0104');

--表单管理
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0201');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0202');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0203');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0204');
--2006.04.25增加说明:WORKFLOW0206是建表操作
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0206');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0207');

--流程管理
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0301');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0302');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0303');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0304');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0306');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0307');
-- 工作流表结构升级
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0308');
--增加签名图片
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0400');
--增加流程类型通用帮助
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0406');
--增加同步监控人
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0405');
--20070823 jsp表单定义请求url查询
INSERT INTO  PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN','WORKFLOW0407');

--任务列表定制
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0401');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0402');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0403');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0404');

--表单打印模板
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0501');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0502');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0503');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0504');
						   
--流程查询					   
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW1101');

--缓存管理
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW1201');
--流程监控
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW1301');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW1302');
--工作流统计分析
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW1601');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW1602');
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW1603');
						   
--PUB_TROLE_OPTS 授权模板角色资源		   
						   
--工作流类型
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0101');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0102');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0103');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0104');

--表单管理
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0201');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0202');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0203');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0204');
--2006.04.26增加表单"建表"
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0206');

--流程管理
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0301');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0302');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0303');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0304');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0306');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0307');
--工作流升级
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0308');

--任务列表定制
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0401');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0402');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0403');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0404');

--表单打印模板
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0501');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0502');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0503');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0504');


--缓存管理
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW1201');
--流程监控
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW1301');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW1302');
--工作流统计分析
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW1601');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW1602');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW1603');

--工作报表
--默认的权限给工作流管理员
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN' ,'WFREPORT1501') ;
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN' ,'WFREPORT1501') ;
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN' ,'WFREPORT1502') ;
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN' ,'WFREPORT1502') ;
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN' ,'WFREPORT1503') ;
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN' ,'WFREPORT1503') ;
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN' ,'WFREPORT1504') ;
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN' ,'WFREPORT1504') ;
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN' ,'WFREPORT1505') ;
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN' ,'WFREPORT1505') ;
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN' ,'WFREPORT1506') ;
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN' ,'WFREPORT1506') ;
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN' ,'WFREPORT1507') ;
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN' ,'WFREPORT1507') ;
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN' ,'WFREPORT1508') ;
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN' ,'WFREPORT1508') ;
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN' ,'WFREPORT1509') ;
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN' ,'WFREPORT1509') ;
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN' ,'WFREPORT1510') ;
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN' ,'WFREPORT1510') ;
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN' ,'WFREPORT1511') ;
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN' ,'WFREPORT1511') ;
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN' ,'WFREPORT1512') ;
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN' ,'WFREPORT1512') ;

--2005.11.29修正
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW1501');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW1501');
--2006.04.20增加,流程定义选择
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0806');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0806');
--2006.04.20增加,附件选择
INSERT INTO PUB_ROLE_RESOURCE VALUES ('WORKFLOWADMIN', 'WORKFLOW0704');
INSERT INTO PUB_TROLE_OPTS VALUES ('WORKFLOWADMIN', 'WORKFLOW0704');
