<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ request.getContextPath() + "/";
%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>接口日志重处理</title>

	<%@ include file="/WEB-INF/jsp/metadata.jsp"%>

  </head>
  
  <body>
  	<font color="red"><s:property value="result"/></font>
  	<s:form action="retry.do" namespace="wslog">
  		<s:textfield label="日志编号" name="id"></s:textfield>
  		<s:submit value="提交重处理"></s:submit>
  	</s:form>
  	
  </body>
</html>
