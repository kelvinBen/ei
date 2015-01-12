<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>

<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("DOC_DOCUMENT.HELP")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<% 
    String document_name = request.getParameter("document_nameSearch");
	if (document_name==null){
	  document_name="";
	}
	
%>

<widgets:container title='<%=ResourcesFactory.getString("DOC_DOCUMENT.DOCINFO")%>' >
<html:form name="frmList" action="wfdochelpradio.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
	<td><%=ResourcesFactory.getString("DOC_DOCUMENT.DOCUMENT_NAME")%>:</td>
    <td><flex:searchText name="document_nameSearch"   size="12" searchName="DOC_DOCUMENT.DOCUMENT_NAME" dataType="java.lang.String" operSymbol="=" value="<%=document_name%>">
	</flex:searchText>
	</td>
	<td><flex:searchImg name="query" action="wfdochelpradio.cmd" image="search.gif"/></td>
	</tr>
</flex:search>

<table border=0 width=100%>
<tr><td width=100%>
<support:flexgrid name="grid" height="250" action="" isSubmit="false">                        
	<flex:radioCol caption='<%=ResourcesFactory.getString("dcwork.select")%>' width="100" property="documentId" name="primaryKey" sortName="DOC_DOCUMENT.DOCUMENT_ID"></flex:radioCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("DOC_DOCUMENT.DOCUMENT_ID")%>' width="100" property="documentId" name="primaryKey" sortName="DOC_DOCUMENT.DOCUMENT_ID" style="display:none"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("DOC_DOCUMENT.DOCUMENT_NAME")%>' width="300" property="documentName" sortName="DOC_DOCUMENT.DOCUMENT_NAME"></flex:flexCol>                          
</support:flexgrid>
<flex:pagePolit action="wfdochelpradio.cmd" pageSize="10">
</flex:pagePolit>
</td>
</tr>
</table>
<div align=center>
<table width=170><tr>
<td><button name="btnClose" onclick="doConfirm()"  class="advbutton"><%=ResourcesFactory.getString("button.confirm")%></button></td>
<td><button name="btnClose" onclick="doClose()"  class="advbutton"><%=ResourcesFactory.getString("button.close")%></button></td>
<td><button name="btnCancel" onclick="doCancel()"  class="advbutton"><%=ResourcesFactory.getString("button.cancel")%></button></td></tr></table></div>
</html:form>	
</widgets:container>
<script language="javascript">
grid.show();
function getSelect(){
if(grid.getCurrentLine()==null){
	alert('<%=ResourcesFactory.getString("query.select")%>');
	return false;
}
  return true;
}
function doConfirm(){
	if(!getSelect()) return;
	var row=grid.getCurrentLine();
	var result=new Array();
	var val=new Array();
	val["primary-value"]=grid.getCellValue(row,2);
	val["display-str"]=grid.getCellValue(row,3);
	val["display-url"]='<%=MatrixHref.getUrl("Document")%>'+grid.getCellValue(row,2);	
	result[0]=val;
	parent.returnValue = result;
	parent.close();
}
function doCancel(){
	parent.returnValue="";
	parent.close();
}
function doClose(){
	parent.close();
}
</script>