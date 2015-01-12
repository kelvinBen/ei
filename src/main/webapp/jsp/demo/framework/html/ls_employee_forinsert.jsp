<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ page import="java.util.*"%>

<%@ page import="net.mast.web.taglib.util.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>

<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp1.css'/>">
<web:js src="MultiSelect.js"/>
<web:js src="calendar.js"/>
<web:js src="mastfunction.js"/>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("LS_EMPLOYEE.INSERT.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<script language="javascript">
function checkLsEmployee(){
	var employeeCode = document.forms[0].employeeCode;
  	if ( __isQuoteIn(employeeCode.value) )
	{
	    alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.CODEFORMAT")%>');
	    employeeCode.select();
	    employeeCode.focus();
	    return false;
	}
    if (trim(employeeCode.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTCODE")%>');    
	  employeeCode.focus();
	  return false;
	}
    employeeCode.value = trim(employeeCode.value) ;

	var employeeName = document.forms[0].employeeName;
      if (trim(employeeName.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTNAME")%>');    
	  employeeName.focus();
	  return false;
	}
    employeeName.value = trim(employeeName.value) ;

  	var employeeSex = document.forms[0].employeeSex;
	var isemployeeSexReturn=false;	  
	if(employeeSex.length>0){
	     for(var k=0;k<employeeSex.length;k++){
	  	if(employeeSex[k].checked){
	  	     isemployeeSexReturn=true;
	  	     break;
	  	}	  	
	     }
	}
	if(!isemployeeSexReturn){
	     alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTSEX")%>'); 
	     return false;
	} 
	  
  	var employeeAge = document.forms[0].employeeAge;
      if (trim(employeeAge.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTAGE")%>');    
	  employeeAge.focus();
	  return false;
	}
	if (!((employeeAge.value>16)&&(employeeAge.value<100))){
	alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.SELECTAGE")%>');
	 employeeAge.focus();  
	  return false;
	}
    employeeAge.value = trim(employeeAge.value) ;
  	  
  	  var employeeMarry = document.forms[0].employeeMarry;
  	  var isemployeeMarryReturn=false;
      if (employeeMarry.length>0){ 
      	for(var k=0;k<employeeMarry.length;k++){
	  	if(employeeMarry[k].checked){
	  	    isemployeeMarryReturn=true;
	  	     break;
	  	        }	  	
	       }
      }
     if(!isemployeeMarryReturn){
	     alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTMARRY")%>'); 
	     return false;
	 } 
  	 var employeeBirth = document.forms[0].employeeBirth;
      if (trim(employeeBirth.value)=="")
	 {
	     alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTBIRTH")%>');    
	     employeeBirth.focus();
	     return false;
	 }
     var     riqi=   new   Date();   
     var   year=riqi.getFullYear();//get current year 
     var     month=riqi.getMonth()+1;//get current month 
     var     date=riqi.getDate();//get current day
	 var todayStr=""+year+(month <10?( "0"+month):month)+date;
	 if(employeeBirth.value>=todayStr){
		alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTREALBIRTH")%>');
		return false;
	 }
     if(todayStr.substring(0,4)-employeeBirth.value.substring(0,4)!=employeeAge.value){
		alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTAGEANDBIRTH")%>');
		return false;
	 }
     employeeBirth.value = trim(employeeBirth.value) ;
     if ( !__checkStdDate(employeeBirth ) )
     {
         alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_BIRTH")%>'+sError);
         employeeBirth.focus();
         return false;
    }  

    var employeePreference= document.forms[0].employeePreference;
  	   var isemployeePreferenceReturn=false;
       if (employeePreference.length>0){ 
      	 for(var k=0;k<employeePreference.length;k++){
	  	   if(employeePreference[k].checked){
	  	      isemployeePreferenceReturn=true;
	  	      break;
	  	        }	  	
	       }
      }
    if(!isemployeePreferenceReturn){
	     alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTHOBBY")%>'); 
	     return false;
	} 
    var employeeDegree = document.forms[0].employeeDegree;
      if (trim(employeeDegree.value)=="")
	{
	     alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTDEGREE")%>');    
	     employeeDegree.focus();
	     return false;
	}
    employeeDegree.value = trim(employeeDegree.value) ;

    var employeeCompany = document.forms[0].employeeCompany;
      if (trim(employeeCompany.value)=="")
	{
	     alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTUNIT")%>');    
	     employeeCompany.focus();
	     return false;
	}
    employeeCompany.value = trim(employeeCompany.value) ;

    var employeeDept = document.forms[0].employeeDept;
      if (trim(employeeDept.value)=="")
	{
	     alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTDEP")%>');    
	     employeeDept.focus();
	     return false;
	}
    employeeDept.value = trim(employeeDept.value) ;

	  var employeeEnterDate = document.forms[0].employeeEnterDate;
      if (trim(employeeEnterDate.value)=="")
	{
	     alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTENTRYDATE")%>');    
	     employeeEnterDate.focus();
	     return false;
	}
	if(employeeEnterDate.value > todayStr){
		 alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTREALENTRYDATE")%>');
		 return false;
	 }
    employeeEnterDate.value = trim(employeeEnterDate.value) ;
     if ( !__checkStdDate(employeeEnterDate ) )
    {
         alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_ENTER_DATE")%>'+sError);
         employeeEnterDate.focus();
         return false;
    }  
	  var employeeCountry = document.forms[0].employeeCountry;
      if (trim(employeeCountry.value)=="")
	{
	     alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTCOUNTRY")%>');    
	     employeeCountry.focus();
	     return false;
	}
    employeeCountry.value = trim(employeeCountry.value) ;
  	  var employeeProvince = document.forms[0].employeeProvince;
      if (trim(employeeProvince.value)=="")
	{
	      alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTPROVINCE")%>');    
	      employeeProvince.focus();
	      return false;
	}
    employeeProvince.value = trim(employeeProvince.value) ;
  	  var employeeCity = document.forms[0].employeeCity;
      if (trim(employeeCity.value)=="")
	{
	      alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTCITY")%>');    
	      employeeCity.focus();
	      return false;
	}
    employeeCity.value = trim(employeeCity.value) ;
  	  
    var employeePhone = document.forms[0].employeePhone;
      if (trim(employeePhone.value)=="")
	{
	      alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTMOBILEPHONE")%>');    
	      employeePhone.focus();
	      return false;
	}
	var phone=/^1(3\d|(58|59))\d{8}$/;
	if(!phone.test(employeePhone.value)){
	      alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INVALIDPHONENUMBER")%>');
	      employeePhone.focus(); 
	      return false;
	}
    employeePhone.value = trim(employeePhone.value) ;
  	  var employeeFax = document.forms[0].employeeFax;
      if (trim(employeeFax.value)=="")
	{
	      alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTFAX")%>');    
	      employeeFax.focus();
	      return false;
	}
	if(!__isFixedTelephone(employeeFax.value)){
	      alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INVALIDFAX")%>');
	      return false;  
	}
    employeeFax.value = trim(employeeFax.value);  	 
  	  
  	var employeePost = document.forms[0].employeePost;
      if (trim(employeePost.value)=="")
	{
	      alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTZIP")%>');    
	      employeePost.focus();
	      return false;
	}
	if(!__checkChinaPostCode(employeePost.value)){
	      alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INVALIDZIP")%>');
	      employeePost.focus(); 
	      return false;
	}
    employeePost.value = trim(employeePost.value);      
    
  	var employeeNote = document.forms[0].employeeNote;
      if (trim(employeeNote.value)=="")
	{
	      alert('<%=ResourcesFactory.getString("LS_EMPLOYEE.INPUTREMARK")%>');    
	      employeeNote.focus();
	      return false;
	}	
    employeeNote.value = trim(employeeNote.value) ;
  	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="" enctype="multipart/form-data">
<html:hidden name="primaryKey" value="ddddd"/>
<bsp:container title='<%=ResourcesFactory.getString("LS_EMPLOYEE.INSERT.TITLE")%>' >
<bsp:containbutton action="lsemployee.cmd?method=insert" text='<%=ResourcesFactory.getString("COMMON.SAVE")%>' onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="lsemployee.cmd?method=insertContinue" text='<%=ResourcesFactory.getString("COMMON.SAVECON")%>' onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text='<%=ResourcesFactory.getString("COMMON.RESET")%>' onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="lsemployeequery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center"><h3><%=ResourcesFactory.getString("LS_EMPLOYEE.INSERT.TITLE")%></h3>
  <table width="95%" cellpadding="0" class="tblContent">  
<tr>
    <td class="tdTitle" style="width:10%;height:40" ><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_CODE")%>:</td>
    <td class="tdRight" style="width:25%"><html:text name="employeeCode" property="employeeCode" size="20" maxlength="30" /></td>
    <td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_NAME")%>:</td>
    <td class="tdRight" style="width:25%"><html:text name="employeeName" property="employeeName" size="20" maxlength="30" /></td>
    <td style="border:1px solid #8DB1D3;" rowspan="4" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.PHOTO")%>:</td>
    <td class="tdRight"  style="width:20%" rowspan="4" >
    <img id="uploadFileImg"  width="200" height="150">
    <br><html:file name="uploadFile" value="" onchange="preview()" onkeydown="return false;" style="ime-mode isabled"  oncontextmenu="return false;"  style="width:200"/></td>
</tr>                    
<tr>
    <td class="tdTitle" style="width:10%;height:40"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_SEX")%>:</td>
    <td class="tdRight" style="width:25%"><html:radioGroup name="employeeSex" value="1" property="employeeSex" collection="LSEMPLOYEE_EMPLOYEESEX_COLLECTION" labelProperty="value" labelKey="key"/></td>
    <td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_AGE")%>:</td>
    <td class="tdRight" style="width:25%"><html:text name="employeeAge" property="employeeAge" size="8" maxlength="8" /></td>
</tr>
<tr>
	<td class="tdTitle" style="width:10%;height:40"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_MARRY")%>:</td>
	<td class="tdRight" style="width:25%"><html:radio name="employeeMarry" property="employeeMarry" value="1" ><%=ResourcesFactory.getString("LS_EMPLOYEE.UNMARRIED")%></html:radio><html:radio name="employeeMarry" property="employeeMarry" value="2"><%=ResourcesFactory.getString("LS_EMPLOYEE.MARRIED")%></html:radio></td>
	<td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_BIRTH")%>:</td>
	<td class="tdRight" valign=middle style="width:25%"><date:date  readonly="true" name="employeeBirth" hastime="true" hasecond="true" divname="employeeBirthdd" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd"></date:date></td>
</tr> 
<tr>
    <td class="tdTitle" style="width:10%;height:40"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_PREFERENCE")%>:</td>
    <td class="tdRight" style="width:25%"><html:checkboxGroup name="employeePreference" property="employeePreference" collection="LSEMPLOYEE_EMPLOYEEPREFERENCE_COLLECTION" labelProperty="value" labelKey="key"/></td>
    <td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_DEGREE")%>:</td>
    <td class="tdRight" style="width:25%"><html:select name="employeeDegree" property="employeeDegree" ><html:options collection="LSEMPLOYEE_EMPLOYEEDEGREE_COLLECTION" labelProperty="value" property="key"/></html:select></td>
</tr> 	                   
<tr>
    <td class="tdTitle" style="width:10%;height:40"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_COMPANY")%>:</td>
    <td class="tdRight" style="width:25%"><html:text name="employeeCompany" property="employeeCompany" size="20" maxlength="30" /></td>
    <td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_DEPT")%>:</td>
    <td class="tdRight" style="width:25%"><html:text name="employeeDept" property="employeeDept" size="15" maxlength="15" /></td>
    <td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_ENTER_DATE")%>:</td><td class="tdRight" valign=top style="width:25%"><date:date  readonly="true" name="employeeEnterDate" divname="employeeEnterDatedd" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd"></date:date></td>
</tr>
<tr>
	<td class="tdTitle" style="width:10%;height:40"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_COUNTRY")%>:</td>
	<td class="tdRight" style="width:25%"><html:multiSelect name="employeeCountry" property="employeeCountry" onchange="getProvinces()"><html:multiOptions property="id" collection="countrys" labelProperty="name" filterKey="id"></html:multiOptions></html:multiSelect></td>
	<td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_PROVINCE")%>:</td>
	<td class="tdRight" style="width:25%"><html:multiSelect name="employeeProvince" property="employeeProvince"onchange="getCitys()"></html:multiSelect></td>
	<td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_CITY")%>:</td>
	<td class="tdRight" style="width:25%"><html:multiSelect name="employeeCity" property="employeeCity"></html:multiSelect></td>
</tr>   			                
<tr>   
    <td class="tdTitle" style="width:10%;height:40"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_PHONE")%>:</td>
    <td class="tdRight" style="width:25%"><html:text name="employeePhone" property="employeePhone" size="15" maxlength="15" /></td>
    <td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_FAX")%>:</td>
    <td class="tdRight" style="width:25%"><html:text name="employeeFax" property="employeeFax" size="15" maxlength="15" /></td>
    <td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_POST")%>:</td>
    <td class="tdRight" style="width:20%"><html:text name="employeePost" property="employeePost" size="6" maxlength="6" /></td>
</tr> 
 <tr>
    <td class="tdTitle" style="width:10%"><%=ResourcesFactory.getString("LS_EMPLOYEE.EMPLOYEE_NOTE")%>:</td>
    <td class="tdRight" colspan="5"><html:textarea name="employeeNote" property="employeeNote" rows="5" cols="80" maxlength="100"/></td>
</tr>      
</table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
 function preview(){
	document.all.uploadFileImg.src="file:///"+document.all.uploadFile.value;

  }
var ss=new MultiSelect("ss");
document.all('employeeCountry').onchange();
document.all('employeeProvince').onchange();
function getProvinces(){
   ss.fillData('employeeCountry','employeeProvince',"lsemployee.cmd?method=getProvinces&countryId="+document.all('employeeCountry').value);
document.all('employeeProvince').onchange();

}
function getCitys(){
   ss.fillData('employeeProvince','employeeCity',"lsemployee.cmd?method=getCitys&provinceId="+document.all('employeeProvince').value); 
     
}
function forSave(){
  document.all("primaryKey").value=document.all("employeeCode").value;
  if(!checkLsEmployee()) return;	
  document.forms[0].action ="lsemployee.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkLsEmployee()) return;
  document.forms[0].action ="lsemployee.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="lsemployeequery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>