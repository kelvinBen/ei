<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<html>
<head>
<title>ִ��SQL������</title>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="<mast:ui js='mof.js'/>"></script>
</head>
<body topmargin="10px">
<html:form method="post" action="">
<widgets:container title="������Ϣ" >
<widgets:containbutton onclick="doReturn()" text="����"></widgets:containbutton>
<html:form action="">
<table>
	<tr>
	    <td class="tdTitle">ִ��SQL��䷢������:</td>
        <td class="tdRight">��鿴SQL�﷨�����Ƿ���ִ��Ȩ��,���鿴�����־!</td>
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
