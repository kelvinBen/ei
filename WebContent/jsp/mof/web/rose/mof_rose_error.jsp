<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<html>
<head>
<title>�ϴ��ļ�����ҳ��</title>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body topmargin="10px">
<html:form method="post" action="">
<widgets:container title="������Ϣ" >
<widgets:containbutton onclick="doReturn()" text="����"></widgets:containbutton>
<html:form action="">
<table>
	<tr>
	    <td class="tdTitle">������ͼ��������:</td>
        <td class="tdRight">��ȷ����mdl��ʽ�ļ�,���鿴�����־!</td>
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
