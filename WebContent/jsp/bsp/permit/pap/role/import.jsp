<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<%@ page import="java.util.Map"%> 

<HTML>
<HEAD><TITLE>角色导入 </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script> 
 <% 
	String refreshId =(String) request.getAttribute("refreshId"); 
 	Map role = (Map)request.getAttribute("role");  
 %> 
<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="角色导入" height="200"> 
<table>
<tr>
	<td><font color="red">导入角色文件成功！</font></td> 
</tr><tr> 
	<td><font color="red">插入角色<%=(String)role.get("insertRole")%>条记录！</font></td> 
</tr><tr>	
	<td><font color="red">更新角色<%=(String)role.get("updateRole")%>条记录！</font></td> 
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

