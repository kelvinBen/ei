<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.bsp.permit.pap.data.User"%>
<%
     List result = (List)request.getAttribute("result");
     List result1 = (List)request.getAttribute("result1");
     String roleAlias = (String)request.getAttribute("roleAlias");
     String departmentName = (String)request.getAttribute("departmentName");
%>
<html>
<head>
<title>角色访问能力表</title>
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
&nbsp;&nbsp;&nbsp;<font size="3">角色:<%=roleAlias%></font>
&nbsp;&nbsp;&nbsp;<font size="3">用户帐户所属机构：<%=departmentName%></font>	
<div align="center">
    <p>
	<font size="3">角色可访问的菜单统计表</font>
	<p>
	<table border="1" width="98%" style="border-collapse:collapse;border:1 solid #5b99c8;" cellpadding=2 cellspacing=0>
		<TR align="center">
			<TH width="10%">序号</TH>
			<TH width="45%">菜单</TH>
			<TH width="45%">权限来源</TH>
		</TR>
	<%
	for (int i=0;i<result.size();i++){
		Map map = (Map)result.get(i);
	%>
		<TR align="CENTER">
		    <TD align="center"><%=i+1%></TD>
		    <TD align="left"><%=map.get("menuPath")%></TD>
		    <TD align="left"><%=map.get("roleAlias")%></TD>
		</TR>
	<%
	}
	%>
	</table>	
</div>

<div align="center">
	<p>
	<font size="3">拥有角色的用户统计表</font>
	<p>
	<table border="1" width="98%" style="border-collapse:collapse;border:1 solid #5b99c8;" cellpadding=2 cellspacing=0>
		<TR align="center">
			<TH width="10%">序号</TH>
			<TH width="22.5%">用户帐号</TH>
			<TH width="22.5%">帐号所有人</TH>
			<TH width="22.5%">所属法人</TH>
			<TH width="22.5%">所属部门</TH>
		</TR>
	<%
	for (int i=0;i<result1.size();i++){
		User user = (User)result1.get(i);
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
				<TD align="left" style="border:0">制表人:<%=request.getAttribute("tabMan")%></TD>
				<TD align="right" style="border:0">制表日期:<%=request.getAttribute("tabDate")%></TD>
		    </TR>
	</table>
</div>
</body>
</html>