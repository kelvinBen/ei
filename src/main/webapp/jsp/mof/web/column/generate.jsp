<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<% 
	String mofTableId = request.getParameter("mofTableId");
	if (mofTableId==null){
	mofTableId="";
	}
	String mofTableName = request.getParameter("mofTableName");
	if (mofTableName==null){
	mofTableName="";
	}
	String parent = request.getParameter("parent_window");
	String main_pk = (String)request.getAttribute("main_primaryKey");
	if( main_pk == null )
		main_pk = request.getParameter("main_primaryKey");
%>
<HTML>
<HEAD>
<TITLE>生成结果</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
	<html:hidden name="parent_window" value="<%=parent%>" />
	<input type="hidden" name="main_primaryKey" value="<%=main_pk%>" />
<widgets:container title="生成结果">
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
	<html:hidden name="mofTableId" value="<%=mofTableId%>"/>
	<html:hidden name="mofTableName" value="<%=mofTableName%>"/>
	<tr>
	<td class="tdTitle">生成结果：</td>
	<td class="tdRight">生成成功！</td>
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
  document.forms[0].action="mofexecquery.cmd?window_name=mof_column&parent_window=mof_table";
  document.forms[0].submit();	
}
</script>
