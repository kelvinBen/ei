<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%@ page import="net.mast.waf.ComponentFactory" %>

<%@ page import="java.util.*"%>
<%@ page import="net.mast.bsp.util.database.*"%>


<% 

//�����б�
//List checklist=new ArrayList();
List checklist=(List)request.getAttribute("checkUserStruList");
%>
<html>
<head>
<title>�û�������֯���</title>
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
<bsp:container title="�û�������֯���" >

<bsp:containbutton text="����" onclick="javascript:window.history.go(-1)"></bsp:containbutton>
<html:messages></html:messages>
<div align="center" >

		<TABLE align="CENTER" cellpadding="1" border=1 class="tdCss" style="border:1 solid #000000" width="100%" >
		<br>
		<tr>
		�ü���еĲ�һ������޷���ϵͳ�Զ��޸���ֻ���ֹ��޸���
		</tr>
		<br>
		<TR align="CENTER" >
			<Td width="40%" style="font-size:20"><b>�û�</b></Td>
			<Td width="60%"  style="font-size:20"><b>�����</b></Td>
		</TR>
<%

for(int t=0;t<checklist.size();t++){
	Map map=(Map)checklist.get(t);
	out.println("<tr><td class=\"tdRight\">"+(String)map.get("USER_ID"));
	out.println("</td><td class=\"tdRight\">");
	out.println((String)map.get("DESCRIBE"));
	out.println("</td><tr>");
}
%>

</table>
</div>

</bsp:container>
</html:form>

</body>
</html>
