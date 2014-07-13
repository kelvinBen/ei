<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*,net.mast.mof.model.MofWindow"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%
	List windows = (List)request.getAttribute("WINDOWS");
	Map validationMsg = (Map)request.getAttribute("VALIDATIONMSG");
	Map warningMsg = (Map)request.getAttribute("WARNINGMSG");
%>
<HTML>
<HEAD>
<TITLE>代码生成成功</TITLE>

<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<widgets:container title="代码生成成功" >

<tab:tab  id="tab1" type="table">
	<tab:card text="成功生成代码的窗口模型" id="mofwindows">
		<table width="100%" cellpadding="0" class="tblContent" style="border:1px solid #000000">
		<tr>
			<td class="tdTitle" style="text-align:left" colspan="4">以下窗口模型已经成功的代码生成：</td>
		</tr>
		<% for( int i = 0; i < windows.size(); i ++ ){
			MofWindow mof_win = (MofWindow)windows.get(i);
		%>
			<tr>
					<td class="tdTitle" width="10%">窗口名称：</td>
					<td class="tdRight"  align="left"><%=mof_win.getName()%></td>
					<td class="tdTitle" width="10%">版本号：</td>
					<td class="tdRight"  align="left"><%=mof_win.getVersion()%></td>
			</tr>
		<%
		}
		%>
		</table>
	</tab:card>
	<tab:card text="错误信息" id="errormessages">
		<table width="100%" cellpadding="0" class="tblContent" style="border:1px solid #000000">
		<tr>
			<td class="tdTitle" style="text-align:left" colspan="4">以下窗口代码生成时出现错误，无法生成代码：</td>
		</tr>
		<%
			if (validationMsg != null) {
				Iterator iter = validationMsg.keySet().iterator();
				while (iter.hasNext()) {
					String winName = (String)iter.next();
		%>
			<tr>
					<td class="tdTitle" width="10%">窗口名称：</td>
					<td class="tdRight"  align="left"><%=winName%></td>
			</tr>		
		<%
					List msg = (List)validationMsg.get(winName);
					for (int i = 0; i < msg.size(); i++) {
		%>
			<tr>
					<td class="tdTitle" width="10%">错误<%=i+1%>：</td>
					<td class="tdRight" align="left"><%=msg.get(i)%></td>
			</tr>
		<%
					}
				}
			}
		%>
		
		</table>
	</tab:card>
	<tab:card text="警告信息" id="warningmessages">
		<table width="100%" cellpadding="0" class="tblContent" style="border:1px solid #000000">
		<tr>
			<td class="tdTitle" style="text-align:left" colspan="4">以下窗口代码生成时有警告信息：</td>
		</tr>
		<%
			if (warningMsg != null) {
				Iterator iter = warningMsg.keySet().iterator();
				while (iter.hasNext()) {
					String winName = (String)iter.next();
		%>
			<tr>
					<td class="tdTitle" width="10%">窗口名称：</td>
					<td class="tdRight"  align="left"><%=winName%></td>
			</tr>		
		<%
					List msg = (List)warningMsg.get(winName);
					for (int i = 0; i < msg.size(); i++) {
		%>
			<tr>
					<td class="tdTitle" width="10%">警告<%=i+1%>：</td>
					<td class="tdRight" align="left"><%=msg.get(i)%></td>
			</tr>
		<%
					}
				}
			}
		%>
		
		</table>
	</tab:card>
</tab:tab>
</widgets:container>
</html:form>
</BODY>
</HTML>