<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<% 
	String parent = request.getParameter("parent_window");
	String main_pk = (String)request.getAttribute("primaryKey");
	if( main_pk == null )
		main_pk = request.getParameter("primaryKey");
%>
<HTML>
<HEAD>
<TITLE>���ɽ��</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
	<html:hidden name="parent_window" value="<%=parent%>" />
	<input type="hidden" name="main_primaryKey" value="<%=main_pk%>" />
<widgets:container title="���ɽ��">
<widgets:containbutton text="����" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
	<tr>
	<td class="tdTitle">���ɽ����</td>
	<td class="tdRight">���ɳɹ���</td>
	</tr>
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forReturn(){
  //document.forms[0].action ="mofcolumnquery.cmd";
  document.forms[0].action="mofexecquery.cmd?window_name=mof_wfactivity&parent_window=mof_wfprocess";
  document.forms[0].submit();	
}
</script>
