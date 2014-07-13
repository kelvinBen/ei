<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("COMBOBOX_TEST.QUERY.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<web:js src="flexgrid.js"/>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<bsp:container title='<%=ResourcesFactory.getString("COMBOBOX_TEST.QUERY.TITLE")%>' >
<bsp:containbutton action="comboboxtest.cmd?method=forinsert" onclick="forInsert()" text='<%=ResourcesFactory.getString("COMMON.ADD")%>'></bsp:containbutton>
<bsp:containbutton action="comboboxtest.cmd?method=forupdate" onclick="forUpdate()" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>'></bsp:containbutton>
<bsp:containbutton action="comboboxtest.cmd?method=detail" onclick="forDetail()" text='<%=ResourcesFactory.getString("COMMON.DETAIL")%>'></bsp:containbutton>
<bsp:containbutton action="comboboxtest.cmd?method=delete" onclick="forDelete()" text='<%=ResourcesFactory.getString("COMMON.DELETE")%>'></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="comboboxtestquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td><%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_ID")%>:<flex:searchText name="combobox_idSearch" property="combobox_idSearch" searchName="COMBOBOX_TEST.COMBOBOX_ID" dataType="java.lang.String" operSymbol="=" size="12">
	</flex:searchText></td>
    <td><%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_NAME")%>:<flex:searchText name="combobox_nameSearch" property="combobox_nameSearch" searchName="COMBOBOX_TEST.COMBOBOX_NAME" dataType="java.lang.String" operSymbol="=" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="comboboxtestquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
				<flex:checkboxCol caption='<%=ResourcesFactory.getString("COMMON.CHOOSE")%>' width="100" property="comboBoxId" name="primaryKey" sortName="COMBOBOX_TEST.COMBOBOX_ID"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_NAME")%>' width="100" property="comboBoxName" sortName="COMBOBOX_TEST.COMBOBOX_NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_SEX")%>' width="100" property="comboBoxSex" type="enum" enumCollection="COMBOBOXTEST_COMBOBOXSEX_COLLECTION" enumKey ="key" enumValue="value" sortName="COMBOBOX_TEST.COMBOBOX_SEX"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_NATION")%>' width="100" property="comboBoxNation" sortName="COMBOBOX_TEST.COMBOBOX_NATION" type="enum" enumKey ="key" enumValue="value" enumCollection="nationCollection"></flex:flexCol>				
				<flex:flexCol caption='<%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_ADDRESS")%>' width="100" property="comboBoxAddress" type="enum" enumCollection="COMBOBOXTEST_COMBOBOXADDRESS_COLLECTION" enumKey ="COMBO_ID" enumValue="COMBO_NAME" sortName="COMBOBOX_TEST.COMBOBOX_ADDRESS"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="comboboxtestquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="comboboxtest.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="comboboxtest.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="comboboxtest.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="comboboxtest.cmd?method=delete";    
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