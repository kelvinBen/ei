<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.bsp.permit.pap.data.Role"%>
<%
     List result = (List)request.getAttribute("result");
     List result1 = (List)request.getAttribute("result1");
     List result2 = (List)request.getAttribute("result2");
     String userName = (String)request.getAttribute("userName");
%>

<html>
<head>
<title>用户访问能力表</title>
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
&nbsp;&nbsp;&nbsp;<font size="3">用户帐号:<%=userName%></font>
<div align="center">
    <p>
	<font size="3">用户拥有的角色统计表</font>
	<p>
	<table border="1" width="98%" style="border-collapse:collapse;border:1 solid #5b99c8;" cellpadding=2 cellspacing=0>
		<TR align="center">
			<TH width="10%">序号</TH>
			<TH width="22.5%">角色名称</TH>
			<TH width="22.5%">角色业务含义</TH>
			<TH width="22.5%">所属法人</TH>
			<TH width="22.5%">是否系统管理员</TH>
		</TR>
	<%
	for (int i=0;i<result.size();i++){
		Role role = (Role)result.get(i);
	%>
		<TR align="CENTER">
		    <TD align="center"><%=i+1%></TD>
		    <TD align="left"><%=role.getRoleName()%></TD>
		    <TD align="left"><%=role.getRoleAlias()%></TD>
		    <TD align="left"><%=role.getCorporation().getOrganAlias()%></TD>
		    <TD align="left"><%=role.getIsSys().equalsIgnoreCase("1")?"是":"否"%></TD>
		</TR>
	<%
	}
	%>
	</table>	
</div>

<div align="center">
    <p>
	<font size="3">用户数据权限统计表</font>
	<p>
	<table border="1" width="98%" style="border-collapse:collapse;border:1 solid #5b99c8;" cellpadding=2 cellspacing=0>
		<TR align="center">
			<TH width="10%">序号</TH>
			<TH width="15%">资源名称</TH>
			<TH width="15%">参考类型</TH>
			<TH width="15%">是否缺省</TH>
			<TH width="45%">权限来源</TH>
		</TR>
	<%
	for (int i=0;i<result1.size();i++){
		Map map = (Map)result1.get(i);
	%>
		<TR align="CENTER">
		    <TD align="center"><%=i+1%></TD>
		    <TD align="left"><%=map.get("typeName")%></TD>
		    <TD align="left"><%=map.get("dataResourceName")%></TD>
		    <TD align="left"><%=map.get("isDefault")%></TD>
		    <TD align="left"><%=map.get("userName")%></TD>
		</TR>
	<%
	}
	%>
	</table>	
</div>
<div align="center">
    <p>
	<font size="3">用户可访问的菜单统计表</font>
	<p>
	<table border="1" width="98%" style="border-collapse:collapse;border:1 solid #5b99c8;" cellpadding=2 cellspacing=0>
		<TR align="center">
			<TH width="10%">序号</TH>
			<TH width="45%">菜单</TH>
			<TH width="45%">权限来源</TH>
		</TR>
	<%
	for (int i=0;i<result2.size();i++){
		Map map = (Map)result2.get(i);
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
	<table width="80%" cellpadding=2 cellspacing=0 border=0>
			<TR align="center">
				<TD align="left" style="border:0">制表人:<%=request.getAttribute("tabMan")%></TD>
				<TD align="right" style="border:0">制表日期:<%=request.getAttribute("tabDate")%></TD>
		    </TR>
	</table>
</div>
</body>
</html>