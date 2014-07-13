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
<title>数据权限查询</title>
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="3">用户帐号:<%=userName%>&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;功能资源范围：<%=moduleName%></font>
<div align="center">
    <p>
	<font size="3">功能数据权限查询统计表</font>
	<p>
		<table border="1" width="98%" style="border-collapse:collapse;border:1 solid #5b99c8;" cellpadding=2 cellspacing=0>
		<TR align="center">
			<TH width="2%">序号</TH>
			<TH width="32.5%">功能</TH>
			<TH width="15.5%">数据权限类型</TH>
			<TH width="27.5%">数据权限</TH>
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
				<TD align="left" style="border:0">制表人:<%=request.getAttribute("tabMan")%></TD>
				<TD align="right" style="border:0">制表日期:<%=request.getAttribute("tabDate")%></TD>
		    </TR>
	</table>
</div>
</body>
</html>