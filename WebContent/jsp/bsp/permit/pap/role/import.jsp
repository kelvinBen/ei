<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<%@ page import="java.util.Map"%> 

<HTML>
<HEAD><TITLE>��ɫ���� </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script> 
 <% 
	String refreshId =(String) request.getAttribute("refreshId"); 
 	Map role = (Map)request.getAttribute("role");  
 %> 
<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="��ɫ����" height="200"> 
<table>
<tr>
	<td><font color="red">�����ɫ�ļ��ɹ���</font></td> 
</tr><tr> 
	<td><font color="red">�����ɫ<%=(String)role.get("insertRole")%>����¼��</font></td> 
</tr><tr>	
	<td><font color="red">���½�ɫ<%=(String)role.get("updateRole")%>����¼��</font></td> 
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

