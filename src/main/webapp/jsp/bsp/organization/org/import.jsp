<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<%@ page import="java.util.Map"%> 

<HTML>
<HEAD><TITLE>��֯�ṹ���� </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script> 
 <% 
 	Map stru = (Map)request.getAttribute("stru");  
	String refreshId =(String) request.getAttribute("refreshId");   
 %> 
<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="��֯�ṹ����" height="200"> 
<table>
<tr>
	<td><font color="red">������֯�ṹ�ļ��ɹ���</font></td> 
</tr><tr> 
	<td><font color="red">������֯�ṹ����<%=(String)stru.get("insertStru")%>����¼��</font></td> 
</tr><tr>	
	<td><font color="red">������֯�ṹ����<%=(String)stru.get("updateStru")%>����¼��</font></td> 
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

