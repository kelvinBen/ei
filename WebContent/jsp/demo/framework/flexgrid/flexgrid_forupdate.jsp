<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.demo.flexgrid.view.FlexgridView"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>
<HEAD>
<% String flexId = request.getParameter("primaryKey");	
%>
<TITLE><%=ResourcesFactory.getString("FLEXGRID.UPDATE.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<web:js src="calendar.js"/>
<web:js src="MultiSelect.js"/>
<web:js src="mastfunction.js"/>
<script language="javascript">
function checkFlexgrid(){
	var flexId = document.forms[0].flexId;
  	if (trim(flexId.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("FLEXGRID.INPUTCODE")%>');   
	  flexId.focus(); 
	  return false;
	}
    flexId.value = trim(flexId.value) ;
      	var flexText = document.forms[0].flexText;
  	if (trim(flexText.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("FLEXGRID.INPUTTEXTCOLUMN")%>');   
	  flexText.focus(); 
	  return false;
	}
    flexText.value = trim(flexText.value) ;
      	var flexCurrency = document.forms[0].flexCurrency;
  	if (trim(flexCurrency.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("FLEXGRID.INPUTCURRENCYCOLUMN")%>');   
	  flexCurrency.focus(); 
	  return false;
	}
    flexCurrency.value = trim(flexCurrency.value) ;
      	var flexDate = document.forms[0].flexDate;
  	if (trim(flexDate.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("FLEXGRID.INPUTDATECOLUMN")%>');   
	  flexDate.focus(); 
	  return false;
	}
    flexDate.value = trim(flexDate.value) ;
      	var flexNumeric = document.forms[0].flexNumeric;
  	if (trim(flexNumeric.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("FLEXGRID.INPUTNUMERICCOLUMN")%>');   
	  flexNumeric.focus(); 
	  return false;
	}
	if ( !__checkStdDate(flexDate ) )
   {
      alert('<%=ResourcesFactory.getString("MAINBLOB.MAIN_OPERATEDATE")%>'+sError);
	  flexDate.value="";
      flexDate.focus();
      return false;
    }  
    flexNumeric.value = trim(flexNumeric.value) ;
      	var flexEnum = document.forms[0].flexEnum;
  	if (trim(flexEnum.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("FLEXGRID.INPUTENUMCOLUMN")%>');   
	  flexEnum.focus(); 
	  return false;
	}
    flexEnum.value = trim(flexEnum.value) ;
      	 var flexListenum= document.forms[0].flexListenum;
  	  var isflexListenumReturn=false;
      if (flexListenum.length>0){ 
      	for(var k=0;k<flexListenum.length;k++){
	  	if(flexListenum[k].checked){
	  	     isflexListenumReturn=true;
	  	     break;
	  	        }	  	
	       }
      }
if(!isflexListenumReturn){
	     alert('<%=ResourcesFactory.getString("FLEXGRID.INPUTENUMARRAYCOLUMN")%>'); 
	     return false;
	} 
    flexListenum.value = trim(flexListenum.value);
      	var flexSql = document.forms[0].flexSql;
  	if (trim(flexSql.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("FLEXGRID.INPUTSQLCOLLECTIONCOLUMN")%>');   
	  flexSql.focus(); 
	  return false;
	}
    flexSql.value = trim(flexSql.value) ;
      	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value="ddddd"/>
<bsp:container title='<%=ResourcesFactory.getString("FLEXGRID.UPDATE.TITLE")%>' >
<bsp:containbutton action="flexgrid.cmd?method=update" text='<%=ResourcesFactory.getString("COMMON.SAVE")%>' onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text='<%=ResourcesFactory.getString("COMMON.RESET")%>' onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="flexgridquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.FLEX_ID")%>:</td>
                    <td class="tdRight"><html:hidden name="flexIdDefault" property="flexId"></html:hidden><html:text name="flexId" property="flexId" size="30" readonly="true" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.FLEX_TEXT")%>:</td>
                    <td class="tdRight"><html:text name="flexText" property="flexText" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.FLEX_CURRENCY")%>:</td>
                    <td class="tdRight"><html:text name="flexCurrency" property="flexCurrency" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.FLEX_DATE")%>:</td>
                    <td class="tdRight" valign=top><date:date property="flexDate" name="flexDate" divname="flexDatedd" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd" onblur="checkDateFormat();"></date:date></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.FLEX_NUMERIC")%>:</td>
                    <td class="tdRight"><html:text name="flexNumeric" property="flexNumeric" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.FLEX_ENUM")%>:</td>
                    <td class="tdRight">
                    	<html:select name="flexEnum" property="flexEnum" >
	                        <html:options collection="FLEXGRID_FLEXENUM_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.FLEX_LISTENUM")%>:</td>
                    <td class="tdRight">
                    	<html:checkboxGroup name="flexListenum" property="flexListenum"collection="FLEXGRID_FLEXLISTENUM_COLLECTION"labelProperty="value" labelKey="key"/>	
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.FLEX_SQL")%>:</td>
                    <td class="tdRight">                	
                    <html:select name="flexSql"  property="flexSql">
                    <html:options collection="messageCollection" property="EMPLOYEE_CODE" labelProperty="EMPLOYEE_CODE"/>
                    </html:select>
                    </td>
                    </tr>   
                    <tr>
	                <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.COUNTRY")%>:</td>
	                <td class="tdRight" >
	                   <html:multiSelect name="employeeCountry" property="employeeCountry" onchange="getProvinces()">
	                      <html:multiOptions property="id" collection="COUNTRYS" labelProperty="name" filterKey="id"/>                        
	                   </html:multiSelect>					   
					    </td>
	                </tr>   
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.PROVINCE")%>:</td>
	                <td class="tdRight">
	                  <html:hidden name="employeeProvinceDefault" property="employeeProvince"></html:hidden>
	                  <html:multiSelect name="employeeProvince" property="employeeProvince" onchange="getCitys()">               
	                  </html:multiSelect>
	                </td>
	                </tr>   
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.CITY")%>:</td>
	                <td class="tdRight">
	                  <html:hidden name="employeeCityDefault" property="employeeCity"></html:hidden>
	                  <html:multiSelect name="employeeCity" property="employeeCity">	                  
	                  </html:multiSelect></td>
	                  </tr>					 

</table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>

<script language="javascript">
var ss=new MultiSelect("ss");
document.all('employeeCountry').onchange();
//document.all('employeeProvince').onchange();
function getProvinces(){
   ss.fillData('employeeCountry','employeeProvince',"flexgrid.cmd?method=getProvinces&countryId="+document.all('employeeCountry').value+"&default="+document.all('employeeProvinceDefault').value);
  document.all('employeeProvince').onchange();
}
function getCitys(){
  ss.fillData('employeeProvince','employeeCity',"flexgrid.cmd?method=getCitys&provinceId="+document.all('employeeProvince').value+"&default="+document.all('employeeCityDefault').value);   
}

function forSave(){
	document.all("primaryKey").value=document.all("flexId").value;
	var flexCurrency = document.all('flexCurrency').value;
	var flexNumeric = document.all('flexNumeric').value;
  if(!checkFlexgrid()) return;
  if(!__checkMoney(flexCurrency)){alert('<%=ResourcesFactory.getString("FLEXGRID.INVALIDCURRENCY")%>');return;}
  if(!__isNum(flexNumeric)){alert('<%=ResourcesFactory.getString("FLEXGRID.INVALIDNUMERIC")%>');return;}
  document.forms[0].action ="flexgrid.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="flexgridquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();
  document.all('employeeCountry').onchange();
  document.all('employeeProvince').onchange();	
}
</script>