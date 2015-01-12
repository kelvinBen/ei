<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAINBLOB.QUERY.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<web:js src="flexgrid.js"/>
<web:js src="calendar.js"/>
</HEAD>
<BODY topmargin="10px">
<% 
    String main_id = request.getParameter("main_idSearch");
	if (main_id==null){
	  main_id="";
	}
    String main_operatorcode = request.getParameter("main_operatorcodeSearch");
	if (main_operatorcode==null){
	  main_operatorcode="";
	}
    String main_operatedate = request.getParameter("main_operatedateSearch");
	if (main_operatedate==null){
	  main_operatedate="";
	}
%>
<bsp:container title='<%=ResourcesFactory.getString("MAINBLOB.QUERY.TITLE")%>' >
<bsp:containbutton action="mainblob.cmd?method=forinsert" onclick="forInsert()" text='<%=ResourcesFactory.getString("COMMON.ADD")%>'></bsp:containbutton>
<bsp:containbutton action="mainblob.cmd?method=forupdate" onclick="forUpdate()" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>'></bsp:containbutton>
<bsp:containbutton action="mainblob.cmd?method=detail" onclick="forDetail()" text='<%=ResourcesFactory.getString("COMMON.DETAIL")%>'></bsp:containbutton>
<bsp:containbutton action="mainblob.cmd?method=delete" onclick="forDelete()" text='<%=ResourcesFactory.getString("COMMON.DELETE")%>'></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="mainblobquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td><%=ResourcesFactory.getString("MAINBLOB.MAIN_ID")%>:<flex:searchText name="main_idSearch" property="main_idSearch" searchName="MAINBLOB.MAIN_ID" dataType="java.lang.String" operSymbol="="  size="12">
	</flex:searchText></td>
    <td><%=ResourcesFactory.getString("MAINBLOB.MAIN_OPERATORCODE")%>:<flex:searchText name="main_operatorcodeSearch" property="main_operatorcodeSearch" searchName="MAINBLOB.MAIN_OPERATORCODE" dataType="java.lang.String" operSymbol="="  size="12">
	</flex:searchText></td>
    <td><%=ResourcesFactory.getString("MAINBLOB.MAIN_OPERATEDATE")%>:<flex:searchDate name="main_operatedateSearch"  divname="main_operatedateSearchdd" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd"searchName="MAINBLOB.MAIN_OPERATEDATE" dataType="java.lang.String" operSymbol="=" >
	 </flex:searchDate></td>
	<td><flex:searchImg name="chaxun" action="mainblobquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
                
				<flex:checkboxCol caption='<%=ResourcesFactory.getString("COMMON.CHOOSE")%>' width="100" property="mainId" name="primaryKey" sortName="MAINBLOB.MAIN_ID"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MAINBLOB.MAIN_ID")%>' width="100" property="mainId" sortName="MAINBLOB.MAIN_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MAINBLOB.MAIN_OPERATORCODE")%>' width="100" property="mainOperatorcode" sortName="MAINBLOB.MAIN_OPERATORCODE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MAINBLOB.MAIN_OPERATEDATE")%>' width="100" property="mainOperatedate" sortName="MAINBLOB.MAIN_OPERATEDATE"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="mainblobquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="mainblob.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mainblob.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mainblob.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mainblob.cmd?method=delete";    
  document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert('<%=ResourcesFactory.getString("COMMON.SELECT_A_RECORD")%>');
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert('<%=ResourcesFactory.getString("COMMON.SELECT_A_RECORD")%>');
    return false;
  }  
  return true;
}
function getDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert('<%=ResourcesFactory.getString("COMMON.SELECT_DELETE_RECORD")%>');
    return false;
  }
  if (!confirm('<%=ResourcesFactory.getString("COMMON.DELETE_CONFIRM")%>')) {
   	     return false;
   	     }  
  return true;
}
</script>