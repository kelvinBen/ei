<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAIN_GRID.QUERY.TITLE")%></TITLE>
<web:js src="flexgrid.js"/>
<web:js src="calendar.js"/>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<% 
    String main_grid_id = request.getParameter("main_grid_idSearch");
	if (main_grid_id==null){
	  main_grid_id="";
	}
    String operator_code = request.getParameter("operator_codeSearch");
	if (operator_code==null){
	  operator_code="";
	}
    String operate_name = request.getParameter("operate_nameSearch");
	if (operate_name==null){
	  operate_name="";
	}
    String operate_cooperate = request.getParameter("operate_cooperateSearch");
	if (operate_cooperate==null){
	  operate_cooperate="";
	}
    String operate_dept = request.getParameter("operate_deptSearch");
	if (operate_dept==null){
	  operate_dept="";
	}
    String operate_date = request.getParameter("operate_dateSearch");
	if (operate_date==null){
	  operate_date="";
	}
    String operate_effdate = request.getParameter("operate_effdateSearch");
	if (operate_effdate==null){
	  operate_effdate="";
	}
    String operator_status = request.getParameter("operator_statusSearch");
	if (operator_status==null){
	  operator_status="";
	}
    String operator_depot = request.getParameter("operator_depotSearch");
	if (operator_depot==null){
	  operator_depot="";
	}
%>
<bsp:container title='<%=ResourcesFactory.getString("MAIN_GRID.QUERY.TITLE")%>' >
<bsp:containbutton action="maingrid.cmd?method=forinsert" onclick="forInsert()" text='<%=ResourcesFactory.getString("COMMON.ADD")%>'></bsp:containbutton>
<bsp:containbutton action="maingrid.cmd?method=forupdate" onclick="forUpdate()" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>'></bsp:containbutton>
<bsp:containbutton action="maingrid.cmd?method=detail" onclick="forDetail()" text='<%=ResourcesFactory.getString("COMMON.DETAIL")%>'></bsp:containbutton>
<bsp:containbutton action="maingrid.cmd?method=delete" onclick="forDelete()" text='<%=ResourcesFactory.getString("COMMON.DELETE")%>'></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="maingridquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td><%=ResourcesFactory.getString("MAIN_GRID.MAIN_GRID_ID")%>:<flex:searchText name="main_grid_idSearch" property="main_grid_idSearch" searchName="MAIN_GRID.MAIN_GRID_ID" dataType="java.lang.String" operSymbol="=" size="12">
	</flex:searchText></td>
    <td><%=ResourcesFactory.getString("MAIN_GRID.OPERATOR_CODE")%>:<flex:searchText name="operator_codeSearch" property="operator_codeSearch" searchName="MAIN_GRID.OPERATOR_CODE" dataType="java.lang.String" operSymbol="="  size="12">
	</flex:searchText></td>
	</tr>
	<tr>
	<td><%=ResourcesFactory.getString("MAIN_GRID.OPERATE_COOPERATE")%>:<flex:searchText name="operate_cooperateSearch" property="operate_cooperateSearch" searchName="MAIN_GRID.OPERATE_COOPERATE" dataType="java.lang.String" operSymbol="="  size="12">
	</flex:searchText></td>	 
	<td><%=ResourcesFactory.getString("MAIN_GRID.OPERATE_DATE")%>:<flex:searchDate name="operate_dateSearch" property="operate_dateSearch" divname="operate_dateSearchdd" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd" searchName="MAIN_GRID.OPERATE_DATE" dataType="java.lang.String" operSymbol="=">
	 </flex:searchDate></td>
	</tr>
	<tr>	
    <td><%=ResourcesFactory.getString("MAIN_GRID.OPERATE_EFFDATE")%>:<flex:searchDate name="operate_effdateSearch" property="operate_effdateSearch" divname="operate_effdateSearchdd" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd"searchName="MAIN_GRID.OPERATE_EFFDATE" dataType="java.lang.String" operSymbol="=" >
	 </flex:searchDate></td> 
	 <td><%=ResourcesFactory.getString("MAIN_GRID.OPERATOR_STATUS")%>:<flex:searchSelect size="1" name="operator_statusSearch" searchName="FLEXGRID.FLEX_ENUM" dataType="java.lang.String" property="operator_statusSearch" operSymbol="=" >	    
	    <option value=""><%=ResourcesFactory.getString("COMMON.SELECT")%></option><%--
		<html:options collection="MAINGRID_OPERATORSTATUS_COLLECTION" labelProperty="value" property="key"/>
	  --%></flex:searchSelect></td> 
	</tr>
	<tr>	 
    <td><%=ResourcesFactory.getString("MAIN_GRID.OPERATOR_DEPOT")%>:
	<flex:searchSelect size="1" name="operator_depotSearch" searchName="FLEXGRID.FLEX_ENUM" dataType="java.lang.String" property="operator_depotSearch" operSymbol="=" >
	    <option value=""><%=ResourcesFactory.getString("COMMON.SELECT")%></option><%--
	    <html:options collection="MAINGRID_OPERATORDEPOT_COLLECTION" labelProperty="value" property="key"/>
	  --%></flex:searchSelect></td><td></td>
	<td><flex:searchImg name="chaxun" action="maingridquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
				<flex:checkboxCol caption='<%=ResourcesFactory.getString("COMMON.CHOOSE")%>' width="100" property="mainGridId" name="primaryKey" sortName="MAIN_GRID.MAIN_GRID_ID"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MAIN_GRID.OPERATOR_CODE")%>' width="100" property="operatorCode" sortName="MAIN_GRID.OPERATOR_CODE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MAIN_GRID.OPERATE_NAME")%>' width="100" property="operateName" sortName="MAIN_GRID.OPERATE_NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MAIN_GRID.OPERATE_COOPERATE")%>' width="100" property="operateCooperate" sortName="MAIN_GRID.OPERATE_COOPERATE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MAIN_GRID.OPERATE_DEPT")%>' width="100" property="operateDept" sortName="MAIN_GRID.OPERATE_DEPT"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MAIN_GRID.OPERATE_DATE")%>' width="100" property="operateDate" sortName="MAIN_GRID.OPERATE_DATE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MAIN_GRID.OPERATE_EFFDATE")%>' width="100" property="operateEffdate" sortName="MAIN_GRID.OPERATE_EFFDATE"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MAIN_GRID.OPERATOR_STATUS")%>' width="100" property="operatorStatus" sortName="MAIN_GRID.OPERATOR_STATUS" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MAIN_GRID.OPERATOR_DEPOT")%>' width="100" property="operatorDepot" sortName="MAIN_GRID.OPERATOR_DEPOT" style="display:none"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="maingridquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="maingrid.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="maingrid.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="maingrid.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="maingrid.cmd?method=delete";    
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