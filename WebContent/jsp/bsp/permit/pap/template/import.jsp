<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<%@ page import="java.util.Map"%> 

<HTML>
<HEAD><TITLE>��ɫģ�嵼�� </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script> 
 <% 
	String refreshId =(String) request.getAttribute("refreshId"); 
 
 	Map template = (Map)request.getAttribute("template");  
 %> 
<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="��ɫģ�嵼��" height="200"> 
<table>
<tr>
	<td><font color="red">�����ɫģ���ļ��ɹ���</font></td> 
</tr><tr> 
	<td><font color="red">������Ȩģ���ɫ<%=(String)template.get("insertTrole")%>����¼��</font></td> 
</tr><tr>	
	<td><font color="red">������Ȩģ���ɫ<%=(String)template.get("updateTrole")%>����¼��</font></td> 
</tr> 
</table>
</widgets:container>
</html:form>
</BODY>
</HTML> 


<script language="javascript" >
init();
function init(){	 
	var refreshId ="<%=refreshId%>"; 
	if(getTreeFrame().seltree!=null)
		getTreeFrame().seltree.refreshNodeById(refreshId); 
}
</script>
