<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<%@ page import="java.util.Map"%> 

<HTML>
<HEAD><TITLE>ϵͳ�˵����� </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
 <% 
 	Map menu = (Map)request.getAttribute("menu");  
 %> 
<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="ϵͳ�˵�����" height="200"> 
<table>
<tr>
	<td><font color="red">����ϵͳ�˵��ļ��ɹ���</font></td> 
</tr><tr> 
	<td><font color="red">����ϵͳ�˵�PUB_MENU_SYS��<%=(String)menu.get("insertMenuSys")%>����¼��</font></td> 
</tr><tr>	
	<td><font color="red">����ϵͳ�˵�PUB_MENU_SYS��<%=(String)menu.get("updateMenuSys")%>����¼��</font></td> 
</tr><tr>	
	<td><font color="red">����ϵͳ�˵�PUB_MENU_SYSITEM��<%=(String)menu.get("insertMenuSysItem")%>����¼��</font></td> 
</tr><tr>	
	<td><font color="red">����ϵͳ�˵�PUB_MENU_SYSITEM��<%=(String)menu.get("updateMenuSysItem")%>����¼��</font></td> 
</tr>
</table>
</widgets:container>
</html:form>
</BODY>
</HTML> 


