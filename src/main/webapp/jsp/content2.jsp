<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@page import="net.mast.bsp.permit.context.BspInfo"%>
<%@page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%
String app=request.getContextPath();
BspInfo userinfo=GetBspInfo.getBspInfo(request);
%>
<%@page import="net.mast.bsp.permit.pap.domain.support.PermitBeanFactory"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skinportal.css'/>">
<title></title>
<link rel="stylesheet" type="text/css" href="<mast:ui css='ntmast/style.css'/>">
<base target="_self">
</head>
<style>
BODY
{
padding:0;
margin:0;
background-color:#ffffff;

scrollbar-face-color: #CEE0EE;
scrollbar-highlight-color: #FFFFFF;
scrollbar-shadow-color: #CFE0F0;
scrollbar-3dlight-color: #8DB1D3;
scrollbar-arrow-color:  #006699;
scrollbar-track-color: #AEC4DC;
scrollbar-darkshadow-color: #8DB1D3;
}
td
{
font-size:10pt;
}

</style>
<BODY style="margin-right:0px;">
<table cellspacing="0" border="0" cellpadding=1 width="100%"
	height="100%">
	<tr>
	<%if(PermitBeanFactory.hasPermission(userinfo,"billportalAction.cmd?method=auditlist")){ %>
		<td colspan="1" rowspan="1" valign=top>
		<table width="100%" border=0 height="100%" cellpadding=0 cellspacing=0
			class="portal_title_tab">
			<tr height="23" class="portaltd1bgimg">
				<td nowrap width="24" class="portaltd2bgimg">&nbsp;</td>
				<td width="99%" class="portal_title_td"><a><b>议案建议审查</b></a></td>
			</tr>
			<tr height="99%">
				<td colspan=2><iframe src="<%=app %>/billportalAction.cmd?method=auditlist" width="100%"
					height="100%" scrolling=auto frameborder=0></iframe></td>
			</tr>
		</table>
		</td>
		<%}
	if(PermitBeanFactory.hasPermission(userinfo,"billportalAction.cmd?method=userlist")){	
	%>
		<td colspan="1" rowspan="1" valign=top>
		<table width="100%" border=0 height="100%" cellpadding=0 cellspacing=0
			class="portal_title_tab">
<tr height="23" class="portaltd1bgimg">
				<td nowrap width="24" class="portaltd2bgimg">&nbsp;</td>
				<td width="99%" class="portal_title_td"><a><b>我的议案建议</b></a></td>
			</tr>
			<tr height="99%">
				<td colspan=2><iframe
					src="<%=app %>/billportalAction.cmd?method=userlist" width="100%"
					height="100%" scrolling=auto frameborder=0></iframe></td>
			</tr>
		</table>
		</td>
		<%} %>
	</tr>

	<tr>
	<%if(PermitBeanFactory.hasPermission(userinfo,"billportalAction.cmd?method=jiaobanlist")){ %>
		<td colspan="1" rowspan="1" valign=top>
		<table width="100%" border=0 height="100%" cellpadding=0 cellspacing=0
			class="portal_title_tab">
			<tr height="23" class="portaltd1bgimg">
				<td nowrap width="24" class="portaltd2bgimg">&nbsp;</td>
				<td width="99%" class="portal_title_td"><a><b>议案建议交办</b></a></td>
			</tr>
			<tr height="99%">
				<td colspan=2><iframe src="<%=app %>/billportalAction.cmd?method=jiaobanlist"
					width="100%" height="100%" scrolling=auto frameborder=0></iframe></td>
			</tr>
		</table>
		</td>
			<%}
	if(PermitBeanFactory.hasPermission(userinfo,"billportalAction.cmd?method=deptlist")){	
	%>
		<td colspan="1" rowspan="1" valign=top>
		<table width="100%" border=0 height="100%" cellpadding=0 cellspacing=0
			class="portal_title_tab">
<tr height="23" class="portaltd1bgimg">
				<td nowrap width="24" class="portaltd2bgimg">&nbsp;</td>
				<td width="99%" class="portal_title_td"><a><b>议案建议办理</b></a></td>
			</tr>
			<tr height="99%">
				<td colspan=2><iframe
					src="<%=app %>/billportalAction.cmd?method=deptlist" width="100%"
					height="100%" scrolling=auto frameborder=0></iframe></td>
			</tr>
		</table>
		</td>	
		<%} %>
	</tr>
		<tr>
		<td colspan="2" rowspan="1" valign=top>
		<table width="100%" border=0 height="100%" cellpadding=0 cellspacing=0
			class="portal_title_tab">
			<tr height="23" class="portaltd1bgimg">
				<td nowrap width="24" class="portaltd2bgimg">&nbsp;</td>
				<td width="99%" class="portal_title_td"><a><b>切换系统</b></a></td>
			</tr>
			<tr height="99%">
				<td colspan=2><iframe src="<%=app %>/newMenu.cmd?method=forChangeMenu"
					width="100%" height="100%" scrolling=auto frameborder=0></iframe></td>
			</tr>
		</table>
		</td>

	</tr>
	
	<tr></tr>
</table>
</BODY>
</html>
