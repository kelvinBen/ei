<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.bsp.permit.pap.data.User"%>
<%
	 String userName = (String)request.getAttribute("userName");
	 String moduleName = (String)request.getAttribute("moduleName");
	 List result = (List)request.getAttribute("result");
%>

<html>
<head>
<title>����Ȩ�޲�ѯ</title>
</head>
<style>
td
{
font-size:10pt;
border:1 solid #5b99c8;
}
th
{
font-size:12pt;
background-color:#8fcae9;
border:1 solid #5b99c8;
}
</style>
<body topmargin="10px" bgcolor="#eff7ff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="3">�û��ʺ�:<%=userName%>&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������Դ��Χ��<%=moduleName%></font>
<div align="center">
    <p>
	<font size="3">��������Ȩ�޲�ѯͳ�Ʊ�</font>
	<p>
		<table border="1" width="98%" style="border-collapse:collapse;border:1 solid #5b99c8;" cellpadding=2 cellspacing=0>
		<TR align="center">
			<TH width="2%">���</TH>
			<TH width="32.5%">����</TH>
			<TH width="15.5%">����Ȩ������</TH>
			<TH width="27.5%">����Ȩ��</TH>
		</TR>
	<%
	for (int i=0;i<result.size();i++){
		Map map = (Map)result.get(i);
	%>
		<TR align="CENTER">
		    <TD align="center"><%=i+1%></TD>
		    <TD align="left"><%=map.get("funName")%></TD>
		    <TD align="left"><%=map.get("dataResTypeName")%></TD>
		    <TD align="left"><%=map.get("dataResName")%></TD>
		</TR>
	<%
	}
	%>
	
	</table>
</div>
<div align="center">
	<p>
	<table width="80%" cellpadding=2 cellspacing=0 border=0>
			<TR align="center">
				<TD align="left" style="border:0">�Ʊ���:<%=request.getAttribute("tabMan")%></TD>
				<TD align="right" style="border:0">�Ʊ�����:<%=request.getAttribute("tabDate")%></TD>
		    </TR>
	</table>
</div>
</body>
</html>