<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("ORGAN_STRU.QUERY.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<web:js src="flexgrid.js"/>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<% 
    String organ_id = request.getParameter("organ_idSearch");
	if (organ_id==null){
	  organ_id="";
	}
    String organ_alias = request.getParameter("organ_aliasSearch");
	if (organ_alias==null){
	  organ_alias="";
	}
    String organ_type = request.getParameter("organ_typeSearch");
	if (organ_type==null){
	  organ_type="";
	}
    String parent_id = request.getParameter("parent_idSearch");
	if (parent_id==null){
	  parent_id="";
	}
    String principal_id = request.getParameter("principal_idSearch");
	if (principal_id==null){
	  principal_id="";
	}
    String stru_path = request.getParameter("stru_pathSearch");
	if (stru_path==null){
	  stru_path="";
	}
    String organ_order = request.getParameter("organ_orderSearch");
	if (organ_order==null){
	  organ_order="";
	}
    String begin_date = request.getParameter("begin_dateSearch");
	if (begin_date==null){
	  begin_date="";
	}
    String end_date = request.getParameter("end_dateSearch");
	if (end_date==null){
	  end_date="";
	}
    String is_leaf = request.getParameter("is_leafSearch");
	if (is_leaf==null){
	  is_leaf="";
	}
%>
<bsp:container title='<%=ResourcesFactory.getString("ORGAN_STRU.QUERY.TITLE")%>' >
<bsp:containbutton action="organstru.cmd?method=forupdate" onclick="forUpdate()" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>'></bsp:containbutton>
<bsp:containbutton action="organstru.cmd?method=detail" onclick="forDetail()" text='<%=ResourcesFactory.getString("COMMON.DETAIL")%>'></bsp:containbutton>
<bsp:containbutton action="organstru.cmd?method=delete" onclick="forDelete()" text='<%=ResourcesFactory.getString("COMMON.DELETE")%>'></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="organstruquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td><%=ResourcesFactory.getString("ORGAN_STRU.ORGAN_ID")%>:<flex:searchText name="organ_idSearch" property="organ_idSearch" searchName="ORGAN_STRU.ORGAN_ID" dataType="java.lang.String" operSymbol="="  size="12">
	</flex:searchText></td>
    <td><%=ResourcesFactory.getString("ORGAN_STRU.PARENT_ID")%>:<flex:searchText name="parent_idSearch" property="parent_idSearch" searchName="ORGAN_STRU.PARENT_ID" dataType="java.lang.String" operSymbol="="  size="12">
	</flex:searchText></td>
    <td><%=ResourcesFactory.getString("ORGAN_STRU.STRU_PATH")%>:<flex:searchText name="stru_pathSearch" property="stru_pathSearch" searchName="ORGAN_STRU.STRU_PATH" dataType="java.lang.String" operSymbol="=" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="organstruquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
				<flex:checkboxCol caption='<%=ResourcesFactory.getString("COMMON.CHOOSE")%>' width="100" property="organId" name="primaryKey" sortName="ORGAN_STRU.ORGAN_ID"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("ORGAN_STRU.ORGAN_ID")%>' width="100" property="organId" sortName="ORGAN_STRU.ORGAN_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("ORGAN_STRU.ORGAN_ALIAS")%>' width="100" property="organAlias" sortName="ORGAN_STRU.ORGAN_ALIAS"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("ORGAN_STRU.ORGAN_TYPE")%>' width="100" property="organType" type="enum" enumCollection="ORGANSTRU_ORGANTYPE_COLLECTION" enumKey ="key" enumValue="value" sortName="ORGAN_STRU.ORGAN_TYPE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("ORGAN_STRU.PARENT_ID")%>' width="100" property="parentId" sortName="ORGAN_STRU.PARENT_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("ORGAN_STRU.PRINCIPAL_ID")%>' width="100" property="principalName" sortName="ORGAN_STRU.PRINCIPAL_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("ORGAN_STRU.STRU_PATH")%>' width="100" property="struPath" sortName="ORGAN_STRU.STRU_PATH"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("ORGAN_STRU.ORGAN_ORDER")%>' width="100" property="organOrder" sortName="ORGAN_STRU.ORGAN_ORDER"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("ORGAN_STRU.BEGIN_DATE")%>' width="100" property="beginDate" sortName="ORGAN_STRU.BEGIN_DATE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("ORGAN_STRU.END_DATE")%>' width="100" property="endDate" sortName="ORGAN_STRU.END_DATE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("ORGAN_STRU.IS_LEAF")%>' width="100" property="isLeaf" type="enum" enumCollection="ORGANSTRU_ISLEAF_COLLECTION" enumKey ="key" enumValue="value" sortName="ORGAN_STRU.IS_LEAF"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="organstruquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="organstru.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="organstru.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="organstru.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="organstru.cmd?method=delete";    
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