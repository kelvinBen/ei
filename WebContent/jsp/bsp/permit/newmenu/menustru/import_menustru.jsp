<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<%@ page import="java.util.Map"%> 

<HTML>
<HEAD><TITLE>��֯���Ի��˵����� </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
 <% 
 	Map menu = (Map)request.getAttribute("menu");  
 %> 
<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="��֯���Ի��˵�����" height="200"> 
<table>
<tr>
	<td><font color="red">������֯���Ի��˵��ļ��ɹ���</font></td> 
</tr><tr> 
	<td><font color="red">������֯�����˵�PUB_MENU_STRU��<%=(String)menu.get("insertMenuStru")%>����¼��</font></td> 
</tr><tr>	
	<td><font color="red">������֯�����˵�PUB_MENU_STRU��<%=(String)menu.get("updateMenuStru")%>����¼��</font></td> 
</tr><tr>	
	<td><font color="red">������Ի��˵���PUB_MENU_PERITEM��<%=(String)menu.get("insertMenuPerItem")%>����¼��</font></td> 
</tr><tr>	
	<td><font color="red">���¸��Ի��˵���PUB_MENU_PERITEM��<%=(String)menu.get("updateMenuPerItem")%>����¼��</font></td> 
</tr>
</table>
</widgets:container>
</html:form>
</BODY>
</HTML> 


