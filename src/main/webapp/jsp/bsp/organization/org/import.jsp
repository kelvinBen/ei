<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<%@ page import="java.util.Map"%> 

<HTML>
<HEAD><TITLE>组织结构导入 </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script> 
 <% 
 	Map stru = (Map)request.getAttribute("stru");  
	String refreshId =(String) request.getAttribute("refreshId");   
 %> 
<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="组织结构导入" height="200"> 
<table>
<tr>
	<td><font color="red">导入组织结构文件成功！</font></td> 
</tr><tr> 
	<td><font color="red">插入组织结构数据<%=(String)stru.get("insertStru")%>条记录！</font></td> 
</tr><tr>	
	<td><font color="red">更新组织结构数据<%=(String)stru.get("updateStru")%>条记录！</font></td> 
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

