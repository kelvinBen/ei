<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<%@ page import="java.util.Map"%> 

<HTML>
<HEAD><TITLE>�û����� </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script> 
 <% 
	String refreshId =(String) request.getAttribute("refreshId");  
 	Map role = (Map)request.getAttribute("user");  
 %> 
<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="�û�����" height="200"> 
<table>
<tr>
	<td><font color="red">�����û��ļ��ɹ���</font></td> 
</tr><tr> 
	<td><font color="red">�����û�<%=(String)role.get("insertUser")%>����¼��</font></td> 
</tr><tr>	
	<td><font color="red">�����û�<%=(String)role.get("updateUser")%>����¼��</font></td> 
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

