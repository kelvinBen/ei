<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>

<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("DOC_DOCUMENT.HELP")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<% 
    String document_name = request.getParameter("doc_subject");
	if (document_name==null){
	  document_name="";
	}
%>
<TABLE   width="100%" class="TabTitleCss" valign=top height=28 cellspacing=0 cellpadding=0>
<TR>
	<TD valign="top"><img src="<mast:ui img='hdReport.gif'/>" height=10>&nbsp;<span id="tdBar"><%=ResourcesFactory.getString("DOC_DOCUMENT.DOCINFO")%></span></td></tr>
<tr>
</table>
<html:form name="frmList" action="dochelpradio.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
	<td><%=ResourcesFactory.getString("DOC_DOCUMENT.DOCUMENT_NAME")%>:</td>
    <td><flex:searchText name="doc_subject" searchName="DOC_DOCUMENT.DOCUMENT_NAME" dataType="java.lang.String" operSymbol="=" value="<%=document_name%>" size="12">
	</flex:searchText>
	</td>
	<td><flex:searchImg name="query" action="dochelpradio.cmd" image="search.gif"/></td>
	</tr>
</flex:search>

<table border=0 width=100%>
<tr><td width=100%>
<support:flexgrid name="grid" height="250" action="" isSubmit="false">                        
	<flex:radioCol caption='<%=ResourcesFactory.getString("dcwork.select")%>' width="50" property="documentId" name="primaryKey" sortName="DOC_DOCUMENT.DOCUMENT_ID"></flex:radioCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("DOC_DOCUMENT.DOCUMENT_ID")%>' width="100" property="documentId" name="primaryKey" sortName="DOC_DOCUMENT.DOCUMENT_ID" style="display:none"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("DOC_DOCUMENT.DOCUMENT_NAME")%>' width="300" property="documentName" sortName="DOC_DOCUMENT.DOCUMENT_NAME"></flex:flexCol>                          
</support:flexgrid>
<flex:pagePolit action="dochelpradio.cmd">
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
<script language="javascript">
grid.show();
function getSelect(){
  var row=grid.getCheckAll();

if ((row==null) ||(row=="")){
	alert('<%=ResourcesFactory.getString("query.select")%>');
	return false;
}
  return true;
}
function doConfirm(){
	if(!getSelect()) return;
         
    var row=grid.getCheckAll();
    
    
    var startIndex=row.indexOf(",");
    
    var row1=row.substring(startIndex+1);
    var startIndex=row1.indexOf(",");
    var val2=row1.substring(0,startIndex);
    
    var row2=row1.substring(startIndex+1);
    var startIndex=row2.indexOf(",");
    var val3=row2.substring(0,startIndex);
            
	 var result=new Array();
	 var val=new Array();
	 
     val[0]=val2;
	 val[1]=val3;

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