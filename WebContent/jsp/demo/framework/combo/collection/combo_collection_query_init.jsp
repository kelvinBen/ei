<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("COMBO_COLLECTION.QUERY.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<web:js src="flexgrid.js"/>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<bsp:container title='<%=ResourcesFactory.getString("COMBO_COLLECTION.QUERY.TITLE")%>' >
<bsp:containbutton action="combocollection.cmd?method=forinsert" onclick="forInsert()" text='<%=ResourcesFactory.getString("COMMON.ADD")%>'></bsp:containbutton>
<bsp:containbutton action="combocollection.cmd?method=forupdate" onclick="forUpdate()" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>'></bsp:containbutton>
<bsp:containbutton action="combocollection.cmd?method=detail" onclick="forDetail()" text='<%=ResourcesFactory.getString("COMMON.DETAIL")%>'></bsp:containbutton>
<bsp:containbutton action="combocollection.cmd?method=delete" onclick="forDelete()" text='<%=ResourcesFactory.getString("COMMON.DELETE")%>'></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="combocollectionquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td><%=ResourcesFactory.getString("COMBO_COLLECTION.COMBO_ID")%>:<flex:searchText name="combo_idSearch" property="combo_idSearch" searchName="COMBO_COLLECTION.COMBO_ID" dataType="java.lang.String" operSymbol="=" size="12">
	</flex:searchText></td>
    <td><%=ResourcesFactory.getString("COMBO_COLLECTION.COMBO_NAME")%>:<flex:searchText name="combo_nameSearch" property="combo_nameSearch" searchName="COMBO_COLLECTION.COMBO_NAME" dataType="java.lang.String" operSymbol="="  size="12">
	</flex:searchText></td>
    <td><%=ResourcesFactory.getString("COMBO_COLLECTION.COMBO_HELP")%>:<flex:searchText name="combo_helpSearch" property="combo_helpSearch" searchName="COMBO_COLLECTION.COMBO_HELP" dataType="java.lang.String" operSymbol="="  size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="combocollectionquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
				<flex:checkboxCol caption='<%=ResourcesFactory.getString("COMMON.CHOOSE")%>' width="100" property="comboId" name="primaryKey" sortName="COMBO_COLLECTION.COMBO_ID"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("COMBO_COLLECTION.COMBO_NAME")%>' width="100" property="comboName" sortName="COMBO_COLLECTION.COMBO_NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("COMBO_COLLECTION.COMBO_HELP")%>' width="100" property="comboHelp" sortName="COMBO_COLLECTION.COMBO_HELP"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="combocollectionquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="combocollection.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="combocollection.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="combocollection.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="combocollection.cmd?method=delete";    
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