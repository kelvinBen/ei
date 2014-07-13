<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
	List list = new ArrayList();
%>
<HTML>
<HEAD>
<TITLE>报表查询条件页面已生成</TITLE>

<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp3.css'/>">
</HEAD>
<BODY topmargin="10px">
<widgets:container title="报表查询条件页面生成" >
	<table width="100%" cellpadding="0" class="tblContent" style="border:1px solid #000000">
	<tr>
		<td class="tdTitle" style="text-align:left" colspan="4">以下报表查询条件页面已生成：</td>
	</tr>
	<% for( int i = 0; i < list.size(); i ++ ){
		String rp_name = (String)list.get(i);
	%>
	<tr>
				<td class="tdTitle" width="10%">报表名称：</td>
				<td class="tdRight"  align="left" colspan="3"><%=rp_name%></td>
	</tr>
	<%
	}
	%>
	</table>

</widgets:container>
</html:form>
</BODY>
</HTML>