<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.bsp.permit.pap.data.User"%>
<%
     List list = (List)request.getAttribute("list");
	 String typeName = (String)request.getAttribute("typeName");
	 String organName = (String)request.getAttribute("organName");
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
<body topmargin="10px" bgcolor="#eff7ff">
&nbsp;&nbsp;&nbsp;<font size="3">组织结构类型:<%=typeName%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;访问权限：<%=organName%></font>
<div align="center">
    <p>
	<font size="3">在组织结构类型下具有访问权限的用户列表</font>
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
	for (int i=0;i<list.size();i++){
		User user = (User)list.get(i);
		StringBuffer employee=new StringBuffer();
		if(user.getEmployeeId()==null||user.getEmployeeId()=="")
		{
			employee=employee.append("本帐号不对应具体用户");
		}else{
		    employee=employee.append(user.getEmployee().getOrgan().getOrganName());
		}
	%>
		<TR align="center">
			<TD align="center"><%=i+1%></TD>
			<TD align="left"><%=user.getUserId()%></TD>
			<TD align="left"><%=employee%></TD>
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