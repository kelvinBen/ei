<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.bsp.permit.pap.data.User"%>
<%
     List result = (List)request.getAttribute("result");
     String dataResourceNames = (String)request.getAttribute("dataResourceNames");
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
<body topmargin="10px" bgcolor="#eff7ff">
&nbsp;&nbsp;&nbsp;<font size="3">������Դ:<%=dataResourceNames%></font>
<div align="center">
    <p>
	<font size="3">���з��ʸ�������Դ���û��б�</font>
	<p>
		<table border="1" width="98%" style="border-collapse:collapse;border:1 solid #5b99c8;" cellpadding=2 cellspacing=0>
		<TR align="center">
			<TH width="10%">���</TH>
			<TH width="22.5%">�û��ʺ�</TH>
			<TH width="22.5%">�ʺ�������</TH>
			<TH width="22.5%">��������</TH>
			<TH width="22.5%">��������</TH>
		</TR>
	<%
	for (int i=0;i<result.size();i++){
		User user = (User)result.get(i);
	%>
		<TR align="center">
			<TD align="center"><%=i+1%></TD>
			<TD align="left"><%=user.getUserId()%></TD>
			<TD align="left"><%=user.getUserName()%></TD>
			<TD align="left"><%=user.getCorporation().getOrganAlias()%></TD>
			<TD align="left"><%=user.getDepartment().getOrganAlias()%></TD>
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