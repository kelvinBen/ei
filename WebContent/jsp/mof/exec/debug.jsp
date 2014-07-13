<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.mof.model.*"%>
<%request.setAttribute("html.data", new java.util.HashMap());
			String window_name = request.getParameter("window_name");
			if (window_name == null)
				window_name = "";
			String tab_name = request.getParameter("tab_name");
			if (tab_name == null)
				tab_name = "";
			String field_name = request.getParameter("field_name");
			if (field_name == null)
				field_name = "";
			String msg = "";
			MofTab tab = null;
			MofField field = null;
			MofWindow mof_win = MofWindowManager.getMofService().getWindowByName(window_name);
			if (mof_win == null)
				msg = "û������Ϊ["+window_name+"]��Window";
			else {
				if (tab_name == null || tab_name.equals(""))
					tab = mof_win.getFirstTab();
				else
					tab = mof_win.getTab(tab_name);
				if (tab == null)
					msg = "Window[" + window_name + "]��û������Ϊ[" + tab_name + "]��Tab";
				else{
					field = tab.getField(field_name);
					if( field == null )
						msg = "Tab["+tab.getName()+"]��δ������Ϊ["+field_name+"]��Field";
				}
			}
			if (!msg.equals(""))
				msg = msg + "������������ʱ���ִ�������log��־�ļ�!";
			else
				msg = "δ���ִ���";
%>
<HTML>
<HEAD>
<TITLE>Ԫ�������</TITLE>
<link rel="stylesheet" type="text/css"
	href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="0px">

<html:form name="frmList" action="debug.jsp">
	<widgets:container title="Ԫ�������">
		<div align="center">
		<table width="100%" cellpadding="0" class="tblContent">
			<tr>
				<td class="tdTitle">Window���ƻ��ܱ�ţ�</td>
				<td class="tdRight" colspan="3"><input type="text" name="window_name"
					value="<%=window_name%>" /><font color="#FF0000">*</font></td>
			<tr>
			<tr>
				<td class="tdTitle">Tab���ƣ�</td>
				<td class="tdRight" colspan="3"><input type="text" name="tab_name"
					value="<%=tab_name%>" />Ĭ��Ϊ��һ��Tab</td>
			<tr>
			<tr>
				<td class="tdTitle">Field���ƣ�</td>
				<td class="tdRight" colspan="3"><input type="text" name="field_name"
					value="<%=field_name%>" /><font color="#FF0000">*</font></td>
			<tr>
			<tr>
				<td colspan="4" class="tdRight"><html:button name="debug"
					value="��ʼ���" onclick="document.forms[0].submit()" /></td>
			</tr>
			<tr>
				<td colspan="4" class="tdTitle" style="text-align:left">��Ͻ��</td>
			</tr>
			<tr>
				<td colspan="4" class="tdRight"><br><font color="#FF0000"><%=msg%></font></br></td>
			</tr>
			<%if(mof_win!=null){ %>
			<tr>
				<td class="tdTitle">Window ID ��</td>
				<td class="tdRight"><%=mof_win.getId()%></td>
				<td class="tdTitle">�������� ��</td>
				<td class="tdRight"><%=mof_win.getDescription()%></td>
			<tr>
			<%} %>
			
			<%if(tab!=null){ %>
			<tr>
				<td class="tdTitle">Tab ID ��</td>
				<td class="tdRight"><%=tab.getId()%></td>
				<td class="tdTitle">�������� ��</td>
				<td class="tdRight"><%=tab.getDescription()%></td>
			<tr>
			<%} %>
			
			<%if(field!=null){ %>
			<tr>
				<td class="tdTitle">Field ID ��</td>
				<td class="tdRight"><%=field.getId()%></td>
				<td class="tdTitle">�������� ��</td>
				<td class="tdRight"><%=field.getDescription()%></td>
			<tr>
			<%} %>
		</table>
		</div>
	</widgets:container>
</html:form>
</BODY>
</html>
