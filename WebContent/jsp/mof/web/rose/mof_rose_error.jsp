<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<html>
<head>
<title>上传文件错误页面</title>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body topmargin="10px">
<html:form method="post" action="">
<widgets:container title="错误信息" >
<widgets:containbutton onclick="doReturn()" text="返回"></widgets:containbutton>
<html:form action="">
<table>
	<tr>
	    <td class="tdTitle">导入类图发生错误:</td>
        <td class="tdRight">请确认是mdl格式文件,并查看相关日志!</td>
	</tr>
</table>
</html:form>
</widgets:container>
</html:form>
</body>
</html>
<script language="javascript">
function doReturn(){
    document.forms[0].action="mofRose.cmd?method=forImport";
    document.forms[0].submit();
}
</script>
