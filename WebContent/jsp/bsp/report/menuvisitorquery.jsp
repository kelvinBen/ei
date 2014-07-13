<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.bsp.permit.pap.data.Role"%>
<%@ page import="net.mast.bsp.permit.pap.data.User"%>
<%
	List roleList=(List)request.getAttribute("roleList");
	List userList=(List)request.getAttribute("userList");
	String menuText=request.getParameter("menuText");
	String departmentName=request.getParameter("departmentName");
%>
<html>
<head>
<title>ӵ�в˵�����Ȩ�޵Ľ�ɫ���û�ͳ�Ʊ�</title>
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
&nbsp;&nbsp;&nbsp;<font size="3">�˵���<%=menuText%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�û��ʺ�����������<%=departmentName%></font>
<div align="center">
	<p>
	<font size="3">��Ȩ�޷��ʲ˵��Ľ�ɫͳ�Ʊ�</font>
	<p>
	<table border="1" width="98%" style="border-collapse:collapse;border:1 solid #5b99c8;" cellpadding=2 cellspacing=0>
		<TR align="center">
			<TH width="10%">���</TH>
			<TH width="20%">��ɫ����</TH>
			<TH width="25%">��ɫҵ����</TH>
			<TH width="25%">��������</TH>
			<TH width="20%">�Ƿ�ϵͳ����Ա</TH>
		</TR>
	<%
	for (int i=0;i<roleList.size();i++){
		Role role = (Role)roleList.get(i);
	%>
		<TR align="center">
			<TD align="center"><%=i+1%></TD>
			<TD align="left"><%=role.getRoleName()%></TD>
			<TD align="left"><%=role.getRoleAlias()%></TD>
			<TD align="left"><%=role.getCorporation().getOrganAlias()%></TD>
		    <TD align="left"><%=role.getIsSys().equalsIgnoreCase("1")?"��":"��"%></TD>
			
			
		</TR>
	<%
	}
	%>
	</table>
</div>

<div align="center">
	<p>
	<font size="3">��Ȩ�޷��ʲ˵����û�ͳ�Ʊ�</font>
	<p>
	<table border="1" width="98%" style="border-collapse:collapse;border:1 solid #5b99c8;" cellpadding=2 cellspacing=0>
		<TR align="center">
			<TH width="10%">���</TH>
			<TH width="20%">�û��ʺ�</TH>
			<TH width="25%">�ʺ�������</TH>
			<TH width="25%">��������</TH>
			<TH width="20%">��������</TH>
		</TR>
	<%
	
	for (int i=0;i<userList.size();i++){
		StringBuffer employee=new StringBuffer();
		User user = (User)userList.get(i);
		if(user.getEmployeeId()==null||user.getEmployeeId()=="")
		{
			employee=employee.append("���ʺŲ���Ӧ�����û�");
		}else{
		    employee=employee.append(user.getEmployee().getOrgan().getOrganName());
		}
		
	%>
		<TR align="center">
			<TD align="center"><%=i+1%></TD>
			<TD align="left"><%=user.getUserId()%></TD>
			<TD align="left"><%=employee %></TD>
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