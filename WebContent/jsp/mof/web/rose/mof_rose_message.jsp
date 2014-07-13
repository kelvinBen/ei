<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>

<HTML>
<HEAD>
<TITLE>上传文件明细</TITLE>
</HEAD>
<script language="javascript" src="<%=SkinUtils.getJS(request,"flexgrid.js")%>"></script>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"flexgrid.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<BODY topmargin="10px">
<html:form method="post" action="">
<widgets:container title="上传结果">
<html:form action="">
<table>
	<tr>
	    <td class="tdTitle">上传文件</td>
	    <td class="tdRight"><html:hidden name="theFile" property="theFile" write="true"/></td>
	</tr>
	<tr>
		<td class="tdTitle">数据库表名模版:</td>
		<td class="tdRight"><html:hidden name="tablePatten" property="tablePatten" write="true"/></td>
	</tr>   
	<tr>
		<td class="tdTitle">数据库列名模版:</td>
		<td class="tdRight"><html:hidden name="columnPatten" property="columnPatten" write="true"/></td>
	</tr>  
	<tr>
		<td class="tdTitle">默认主键列模版:</td>
		<td class="tdRight"><html:hidden name="keyColumnPattern" property="keyColumnPattern" write="true"/></td>
	</tr> 
</table>
</html:form>
</widgets:container>
</html:form>
</BODY>
</HTML>
