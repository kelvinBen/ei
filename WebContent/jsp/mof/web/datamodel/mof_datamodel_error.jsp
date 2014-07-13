<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<html>
<head>
<title>执行SQL语句错误</title>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="<mast:ui js='mof.js'/>"></script>
</head>
<body topmargin="10px">
<html:form method="post" action="">
<widgets:container title="错误信息" >
<widgets:containbutton onclick="doReturn()" text="返回"></widgets:containbutton>
<html:form action="">
<table>
	<tr>
	    <td class="tdTitle">执行SQL语句发生错误:</td>
        <td class="tdRight">请查看SQL语法或者是否有执行权限,并查看相关日志!</td>
	</tr>
</table>
</html:form>
</widgets:container>
</html:form>
</body>
</html>
<script language="javascript">
function doReturn(){
	window.history.go(-1);
	disableButton(true);
}
</script>
