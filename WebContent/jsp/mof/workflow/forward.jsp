<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%
String ret_url = request.getParameter("return_url");
if( ret_url != null ){
%>
<jsp:forward page="<%=ret_url%>" />
<%}else{%>

<HTML>
<HEAD>
<TITLE>�����ύ�ɹ�</TITLE>

<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<widgets:container title="���̲����ɹ�" >
	<table width="100%" cellpadding="0" class="tblContent" style="border:1px solid #000000">
	<tr>
		<td class="tdTitle" style="text-align:left" colspan="4">���̲����ɹ�!</td>
	</tr>
	</table>

</widgets:container>
</html:form>
</BODY>
</HTML>
<%}%>