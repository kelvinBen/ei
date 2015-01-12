<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<%@ page import="java.util.Map"%> 

<HTML>
<HEAD><TITLE>系统菜单导入 </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
 <% 
 	Map menu = (Map)request.getAttribute("menu");  
 %> 
<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="系统菜单导入" height="200"> 
<table>
<tr>
	<td><font color="red">导入系统菜单文件成功！</font></td> 
</tr><tr> 
	<td><font color="red">插入系统菜单PUB_MENU_SYS表<%=(String)menu.get("insertMenuSys")%>条记录！</font></td> 
</tr><tr>	
	<td><font color="red">更新系统菜单PUB_MENU_SYS表<%=(String)menu.get("updateMenuSys")%>条记录！</font></td> 
</tr><tr>	
	<td><font color="red">插入系统菜单PUB_MENU_SYSITEM表<%=(String)menu.get("insertMenuSysItem")%>条记录！</font></td> 
</tr><tr>	
	<td><font color="red">更新系统菜单PUB_MENU_SYSITEM表<%=(String)menu.get("updateMenuSysItem")%>条记录！</font></td> 
</tr>
</table>
</widgets:container>
</html:form>
</BODY>
</HTML> 


