<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<%@ page import="java.util.Map"%> 

<HTML>
<HEAD><TITLE>组织个性化菜单导入 </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
 <% 
 	Map menu = (Map)request.getAttribute("menu");  
 %> 
<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="组织个性化菜单导入" height="200"> 
<table>
<tr>
	<td><font color="red">导入组织个性化菜单文件成功！</font></td> 
</tr><tr> 
	<td><font color="red">插入组织机构菜单PUB_MENU_STRU表<%=(String)menu.get("insertMenuStru")%>条记录！</font></td> 
</tr><tr>	
	<td><font color="red">更新组织机构菜单PUB_MENU_STRU表<%=(String)menu.get("updateMenuStru")%>条记录！</font></td> 
</tr><tr>	
	<td><font color="red">插入个性化菜单项PUB_MENU_PERITEM表<%=(String)menu.get("insertMenuPerItem")%>条记录！</font></td> 
</tr><tr>	
	<td><font color="red">更新个性化菜单项PUB_MENU_PERITEM表<%=(String)menu.get("updateMenuPerItem")%>条记录！</font></td> 
</tr>
</table>
</widgets:container>
</html:form>
</BODY>
</HTML> 


