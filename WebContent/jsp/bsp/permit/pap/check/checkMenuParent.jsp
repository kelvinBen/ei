<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-html" prefix="html"%> 
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%> 
<% 
//�����б� 
List checklist=(List)request.getAttribute("checkMenuParent");
%>
<html>
<head>
<title>�˵����ڵ���</title>
</head>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

<body>
<style>
.tdCss td
{
border:1 solid #000000;
}
</style>
<html:form  name="frmList"  action="">
<bsp:container title="�˵��ڵ���" >

<bsp:containbutton text="����" onclick="javascript:window.history.go(-1)"></bsp:containbutton>
<html:messages></html:messages>
<div align="center" >
	�������ʾΪ:�����ڸ��ڵ�PARENT_IDֵ�ļ�¼(���ڵ����)!
<%
for(int i=0;i<checklist.size();i++){
	List list =(List) checklist.get(i);
%>
<TABLE align="CENTER" cellpadding="1" border=1 class="tdCss" style="border:1 solid #000000" width="100%" >
	<br>
		<tr>
			<%
				Map mapTemp=(Map)list.get(0);
				String menuCheck = (String)mapTemp.get("MENU_CHECK");
				String menuType = (String)mapTemp.get("MENU_TYPE"); 
				if(menuType==null){
					out.println("�˵����ͣ�"+(String)mapTemp.get("TYPE_NAME"));
				}
		 
			%>
			<font color="red">
			<%
			 
				if(menuCheck!=null && menuCheck.equals("OK")){
					out.println("(�˵��ڵ�������!)");
				}
			%>
			</font>
		</tr>
	<br>
		<%
			if(menuType!=null){
		%>
		<TR align="CENTER" >
			<Td width="40%" style="font-size:20"><b>ID</b></Td>
		<%
			} else{
		%>
		<TR align="CENTER" >
			<Td width="40%" style="font-size:20"><b>MENU_SYS_ID</b></Td>
		
		<%
			}
		%>
			<Td width="60%"  style="font-size:20"><b>PARENT_ID</b></Td>
		</TR>
<%
for(int t=0;t<list.size();t++){
	Map map=(Map)list.get(t);
	String id = (String)map.get("ID");
	if(id!=null){
		out.println("<tr><td class=\"tdRight\">"+id);
		out.println("</td><td class=\"tdRight\">");
		out.println((String)map.get("PARENT"));
		out.println("</td><tr>");
	}
}
%>
</TABLE>
<%
}
%>
</div>

</bsp:container>
</html:form>

</body>
</html>
