<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<HTML>
<HEAD><TITLE>��ɫģ�嵼�� </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
<%
	String refreshId =(String) request.getAttribute("refreshId");
%>
<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="��ɫģ�嵼��" height="200">
<widgets:containbutton onclick="doSave();" text="����"></widgets:containbutton> 
<table>
<tr>
	<td><font color="red">��ѡ��Ҫ����Ľ�ɫģ���ļ�:</font></td>
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
		alert("��ѡ��Ҫ����Ľ�ɫģ���ļ���");
		return;
	}
	if(files.value.lastIndexOf(".xml")==-1){
		alert("��ѡ���ļ���ʽΪ*.xml���ļ�");
		return; 
	} 
	document.forms[0].action="templates.cmd?method=importTemplate&refreshId="+"<%=refreshId%>"; 
	document.forms[0].submit();
}
</script>


