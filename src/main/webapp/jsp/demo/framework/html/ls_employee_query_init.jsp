<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("LS_EMPLOYEE.QUERY.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<web:js src="flexgrid.js"/>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<% 
    String employee_code = request.getParameter("employee_codeSearch");
	if (employee_code==null){
	  employee_code="";
	}
    String employee_name = request.getParameter("employee_nameSearch");
	if (employee_name==null){
	  employee_name="";
	}
    String employee_marry = request.getParameter("employee_marrySearch");
	if (employee_marry==null){
	  employee_marry="";
	}
    String employee_company = request.getParameter("employee_companySearch");
	if (employee_company==null){
	  employee_company="";
	}
    String employee_degree = request.getParameter("employee_degreeSearch");
	if (employee_degree==null){
	  employee_degree="";
	}
    String employee_fax = request.getParameter("employee_faxSearch");
	if (employee_fax==null){
	  employee_fax="";
	}
    String employee_country = request.getParameter("employee_countrySearch");
	if (employee_country==null){
	  employee_country="";
	}
    String employee_province = request.getParameter("employee_provinceSearch");
	if (employee_province==null){
	  employee_province="";
	}
    String employee_phone = request.getParameter("employee_phoneSearch");
	if (employee_phone==null){
	  employee_phone="";
	}
    String employee_dept = request.getParameter("employee_deptSearch");
	if (employee_dept==null){
	  employee_dept="";
	}
    String employee_post = request.getParameter("employee_postSearch");
	if (employee_post==null){
	  employee_post="";
	}
    String employee_preference = request.getParameter("employee_preferenceSearch");
	if (employee_preference==null){
	  employee_preference="";
	}
    String employee_note = request.getParameter("employee_noteSearch");
	if (employee_note==null){
	  employee_note="";
	}
%>
<bsp:container title='<%=ResourcesFactory.getString("LS_EMPLOYEE.QUERY.TITLE")%>' >
<bsp:containbutton action="lsemployee.cmd?method=forinsert" onclick="forInsert()" text='<%=ResourcesFactory.getString("COMMON.ADD")%>'></bsp:containbutton>
<bsp:containbutton action="lsemployee.cmd?method=forupdate" onclick="forUpdate()" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>'></bsp:containbutton>
<bsp:containbutton action="lsemployee.cmd?method=detail" onclick="forDetail()" text='<%=ResourcesFactory.getString("COMMON.DETAIL")%>'></bsp:containbutton>
<bsp:containbutton action="lsemployee.cmd?method=delete" onclick="forDelete()" text='<%=ResourcesFactory.getString("COMMON.DELETE")%>'></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="lsemployeequery_page_init.cmd">
<table id="tblSearch">
<flex:search>
<tr>
  <td><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_CODE")%>:<flex:searchText name="employee_codeSearch" property="employee_codeSearch" searchName="LS_EMPLOYEE.EMPLOYEE_CODE" dataType="java.lang.String" operSymbol="="  size="12">
	</flex:searchText></td>
  <td><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_NAME")%>:<flex:searchText name="employee_nameSearch" property="employee_nameSearch" searchName="LS_EMPLOYEE.EMPLOYEE_NAME" dataType="java.lang.String" operSymbol="="  size="12">
	</flex:searchText></td> 
  <td><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_COMPANY")%>:<flex:searchText name="employee_companySearch" property="employee_companySearch" searchName="LS_EMPLOYEE.EMPLOYEE_COMPANY" dataType="java.lang.String" operSymbol="="  size="12">
	</flex:searchText></td>  
</tr>   
<tr>
   <td><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_FAX")%>:<flex:searchText name="employee_faxSearch" property="employee_faxSearch" searchName="LS_EMPLOYEE.EMPLOYEE_FAX" dataType="java.lang.String" operSymbol="=" size="12">
	 </flex:searchText></td>
   <td><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_DEPT")%>:<flex:searchText name="employee_deptSearch" property="employee_deptSearch" searchName="LS_EMPLOYEE.EMPLOYEE_DEPT" dataType="java.lang.String" operSymbol="=" size="12">
	 </flex:searchText></td>
   <td><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_POST")%>:<flex:searchText name="employee_postSearch" property="employee_postSearch" searchName="LS_EMPLOYEE.EMPLOYEE_POST" dataType="java.lang.String" operSymbol="=" size="12">
	 </flex:searchText></td>
   <td><flex:searchImg name="chaxun" action="lsemployeequery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
				<flex:checkboxCol caption='<%=ResourcesFactory.getString("COMMON.CHOOSE")%>' width="100" property="employeeCode" name="primaryKey" sortName="LS_EMPLOYEE.EMPLOYEE_CODE"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_SEX")%>' width="100" property="employeeSex" type="enum" enumCollection="LSEMPLOYEE_EMPLOYEESEX_COLLECTION" enumKey ="key" enumValue="value" sortName="LS_EMPLOYEE.EMPLOYEE_SEX"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_NAME")%>' width="100" property="employeeName" sortName="LS_EMPLOYEE.EMPLOYEE_NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_AGE")%>' width="100" property="employeeAge" sortName="LS_EMPLOYEE.EMPLOYEE_AGE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_MARRY")%>' width="100" property="employeeMarry" type="enum" enumCollection="LSEMPLOYEE_EMPLOYEEMARRY_COLLECTION" enumKey ="key" enumValue="value" sortName="LS_EMPLOYEE.EMPLOYEE_MARRY"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_BIRTH")%>' width="100" property="employeeBirth" sortName="LS_EMPLOYEE.EMPLOYEE_BIRTH"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_ENTER_DATE")%>' width="100" property="employeeEnterDate" sortName="LS_EMPLOYEE.EMPLOYEE_ENTER_DATE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_COMPANY")%>' width="100" property="employeeCompany" sortName="LS_EMPLOYEE.EMPLOYEE_COMPANY"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_DEGREE")%>' width="100" property="employeeDegree" type="enum" enumCollection="LSEMPLOYEE_EMPLOYEEDEGREE_COLLECTION" enumKey ="key" enumValue="value" sortName="LS_EMPLOYEE.EMPLOYEE_DEGREE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_FAX")%>' width="100" property="employeeFax" sortName="LS_EMPLOYEE.EMPLOYEE_FAX"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_PHONE")%>' width="100" property="employeePhone" sortName="LS_EMPLOYEE.EMPLOYEE_PHONE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_DEPT")%>' width="100" property="employeeDept" sortName="LS_EMPLOYEE.EMPLOYEE_DEPT"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_POST")%>' width="100" property="employeePost" sortName="LS_EMPLOYEE.EMPLOYEE_POST"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_PREFERENCE")%>' width="100" property="employeePreference" type="enum" enumCollection="LSEMPLOYEE_EMPLOYEEPREFERENCE_COLLECTION" enumKey ="key" enumValue="value" sortName="LS_EMPLOYEE.EMPLOYEE_PREFERENCE" hasDelimiter="true"></flex:flexCol> 
				<flex:flexCol caption='<%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_NOTE")%>' width="100" property="employeeNote" sortName="LS_EMPLOYEE.EMPLOYEE_NOTE"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="lsemployeequery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="lsemployee.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="lsemployee.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="lsemployee.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="lsemployee.cmd?method=delete";    
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