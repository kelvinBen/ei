<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<HTML>
<HEAD><TITLE>��ɫ���� </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
<%
	String refreshId =(String) request.getAttribute("refreshId");
%>
<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="��ɫ����" height="200">
<widgets:containbutton onclick="doSave();" text="����"></widgets:containbutton> 
<table>
<tr>
	<td><font color="red">��ѡ��Ҫ����Ľ�ɫ�ļ�:</font></td>
	<td><html:file name="uploadFile" value="" onkeydown="return false;" style="ime-mode isabled"  oncontextmenu="return false;"/></td>
</tr>
</table>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function doSave(){
	var files=document.forms[0].uploadFile;
 
	if(files.value==""){
		alert("��ѡ��Ҫ����Ľ�ɫ�ļ���");
		return;
	}
	if(files.value.lastIndexOf(".xml")==-1){
		alert("��ѡ���ļ���ʽΪ*.xml���ļ�");
		return; 
	} 
	document.forms[0].action="role.cmd?method=importRole&refreshId="+"<%=refreshId%>"; 
	document.forms[0].submit();
}
</script>

