<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">                                         
$(function(){
   $("#j_username").attr("value",$.query.get('username'));
   $("#j_password").attr("value",$.query.get('password'));
   $("#checkform").submit();
 });                                 
 </script> 
</head>
<body>
<div style="display:none;">
<form  id="checkform" action="<s:url value='/j_spring_security_check'/>" method="post">
<input type="text" name="j_username" id="j_username" /><BR> 
<input type="password" name="j_password" id="j_password" /><BR>
</form>
</div>
</body>
</html>