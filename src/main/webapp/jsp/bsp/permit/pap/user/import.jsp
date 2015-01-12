<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<%@ page import="java.util.Map"%> 

<HTML>
<HEAD><TITLE>用户导入 </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script> 
 <% 
	String refreshId =(String) request.getAttribute("refreshId");  
 	Map role = (Map)request.getAttribute("user");  
 %> 
<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="用户导入" height="200"> 
<table>
<tr>
	<td><font color="red">导入用户文件成功！</font></td> 
</tr><tr> 
	<td><font color="red">插入用户<%=(String)role.get("insertUser")%>条记录！</font></td> 
</tr><tr>	
	<td><font color="red">更新用户<%=(String)role.get("updateUser")%>条记录！</font></td> 
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

