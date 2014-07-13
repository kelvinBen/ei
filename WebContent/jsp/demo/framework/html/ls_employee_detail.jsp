<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<% String employeeCode=(String)request.getAttribute("primaryKey");
%>
<TITLE><%=ResourcesFactory.getString("LS_EMPLOYEE.DETAIL.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title='<%=ResourcesFactory.getString("LS_EMPLOYEE.DETAIL.TITLE")%>' >
<bsp:containbutton action="lsemployee.cmd?method=forupdate" onclick="forUpdate()" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>'></bsp:containbutton>
<bsp:containbutton action="lsemployeequery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<html:hidden name="primaryKey" value=""/>
<div align="center"><h3><%=ResourcesFactory.getString("LS_EMPLOYEE.DETAIL.TITLE")%></h3>
  <table width="90%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$employeeCode" write="false"/>
  	
<tr>
	<td class="tdTitle" style="width:10%;height:30"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_CODE")%>:</td>
	<td class="tdRight" style="width:25%"><html:hidden name="employeeCode" property="employeeCode" write="true"/></td>
	<td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_NAME")%>:</td>
	<td class="tdRight" style="width:25%"><html:hidden name="employeeName" property="employeeName" write="true"/></td>
	<td style="border:1px solid #8DB1D3;" rowspan="4" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.PHOTO")%>:</td>
	<td class="tdRight"  style="width:20%" rowspan="4" ><img id="uploadFileImg" src="lsemployee.cmd?method=getImgUrl&primaryKey=<%=employeeCode%>" "width="170" height="140"></td>
</tr>
<tr>
    <td class="tdTitle" style="width:10%;height:30"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_SEX")%>:</td>
    <td class="tdRight" style="width:25%"><html:label name="employeeSex" property="employeeSex" collection="LSEMPLOYEE_EMPLOYEESEX_COLLECTION" labelProperty="value" labelKey="key" /></td>
    <td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_AGE")%>:</td>
    <td class="tdRight" style="width:25%"><html:hidden name="employeeAge" property="employeeAge" write="true"/></td>   
</tr>
<tr>
    <td class="tdTitle" style="width:10%;height:30"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_MARRY")%>:</td>
    <td class="tdRight" style="width:25%"><html:label name="employeeMarry" property="employeeMarry" collection="LSEMPLOYEE_EMPLOYEEMARRY_COLLECTION" labelProperty="value" labelKey="key" /></td>
    <td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_BIRTH")%>:</td>
    <td class="tdRight" style="width:25%"><html:hidden name="employeeBirth" property="employeeBirth" write="true"/></td>    
</tr>
<tr>
    <td class="tdTitle" style="width:10%;height:30"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_PREFERENCE")%>:</td>
    <td class="tdRight" style="width:25%"><html:multiLabel name="employeePreference" property="employeePreference" collection="LSEMPLOYEE_EMPLOYEEPREFERENCE_COLLECTION" labelProperty="value" labelKey="key" write="true"/></td>
    <td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_DEGREE")%>:</td>
    <td class="tdRight" style="width:25%"><html:label name="employeeDegree" property="employeeDegree" collection="LSEMPLOYEE_EMPLOYEEDEGREE_COLLECTION" labelProperty="value" labelKey="key" /></td>
</tr>
<tr>
    <td class="tdTitle" style="width:10%;height:30"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_COMPANY")%>:</td>
    <td class="tdRight" style="width:25%"><html:hidden name="employeeCompany" property="employeeCompany" write="true"/></td>
    <td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_DEPT")%>:</td>
    <td class="tdRight" style="width:25%"><html:hidden name="employeeDept" property="employeeDept" write="true"/></td>
    <td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_ENTER_DATE")%>:</td>
    <td class="tdRight" style="width:25%"><html:hidden name="employeeEnterDate" property="employeeEnterDate" write="true"/></td>
</tr>
<tr>
	<td class="tdTitle" style="width:10%;height:30"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_PHONE")%>:</td>
	<td class="tdRight" style="width:25%"><html:hidden name="employeePhone" property="employeePhone" write="true"/></td>
	<td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_FAX")%>:</td>
	<td class="tdRight" style="width:25%"><html:hidden name="employeeFax" property="employeeFax" write="true"/></td>
	<td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_POST")%>:</td>
	<td class="tdRight" style="width:25%"><html:hidden name="employeePost" property="employeePost" write="true"/></td>
</tr>
<tr>
    <td class="tdTitle" style="width:10%;height:30"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_COUNTRY")%>:</td>
    <td class="tdRight" style="width:25%"><html:multiLabel name="employeeCountry" property="employeeCountry" collection="COUNTRYS" labelProperty="name" labelKey="id" write="true"/></td>
    <td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_PROVINCE")%>:</td>
    <td class="tdRight" style="width:25%"><html:multiLabel name="employeeProvince" property="employeeProvince" collection="PROVINCES" labelProperty="name" labelKey="id" write="true"/></td>
    <td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_CITY")%>:</td>
    <td class="tdRight" style="width:25%"><html:multiLabel name="employeeCity" property="employeeCity" collection="CITYS" labelProperty="name" labelKey="id" write="true"/></td>
</tr>

<tr>
    <td class="tdTitle" style="width:10%;height:30"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_NOTE")%>:</td>
    <td class="tdRight" style="width:25%"><html:hidden name="employeeNote" property="employeeNote" write="true"/></td>
</tr>
</table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){  
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="lsemployee.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="lsemployeequery_page_init.cmd";
  document.forms[0].submit();	
}
</script>