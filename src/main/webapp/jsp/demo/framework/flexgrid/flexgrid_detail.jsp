<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<% String flexId=(String)request.getAttribute("primaryKey");
%>
<TITLE><%=ResourcesFactory.getString("FLEXGRID.DETAIL.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title='<%=ResourcesFactory.getString("FLEXGRID.DETAIL.TITLE")%>' >
<bsp:containbutton action="flexgrid.cmd?method=forupdate" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>' onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="flexgridquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$flexId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.FLEX_ID")%>:</td>
      <td class="tdRight"><html:hidden name="flexId" property="flexId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.FLEX_TEXT")%>:</td>
      <td class="tdRight"><html:hidden name="flexText" property="flexText" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.FLEX_CURRENCY")%>:</td>
      <td class="tdRight"><html:hidden name="flexCurrency" property="flexCurrency" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.FLEX_DATE")%>:</td>
      <td class="tdRight"><html:hidden name="flexDate" property="flexDate" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.FLEX_NUMERIC")%>:</td>
      <td class="tdRight"><html:hidden name="flexNumeric" property="flexNumeric" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.FLEX_ENUM")%>:</td>
      <td class="tdRight">
      	<html:label name="flexEnum" property="flexEnum" collection="FLEXGRID_FLEXENUM_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.FLEX_LISTENUM")%>:</td>
      <td class="tdRight">
      	<html:multiLabel name="flexListenum" property="flexListenum" collection="FLEXGRID_FLEXLISTENUM_COLLECTION" labelProperty="value" labelKey="key" write="true"/>
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.FLEX_SQL")%>:</td>
      <td class="tdRight"><html:hidden name="flexSql" property="flexSql" write="true"/></td>
    </tr>
     <tr>
	                <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.COUNTRY")%>:</td>
	                <td class="tdRight" ><html:multiLabel name="employeeCountry" property="employeeCountry" collection="COUNTRYS" labelProperty="name" labelKey="id" write="true"/></td>	                
	                </tr>   
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.PROVINCE")%>:</td>
	                <td class="tdRight"><html:multiLabel name="employeeProvince" property="employeeProvince" collection="PROVINCES" labelProperty="name" labelKey="id" write="true"/></td>
	                </tr>   
                    <tr><td class="tdTitle"><%=ResourcesFactory.getString("FLEXGRID.CITY")%>:</td>
	                <td class="tdRight"><html:multiLabel name="employeeCity" property="employeeCity" collection="CITYS" labelProperty="name" labelKey="id" write="true"/></td>
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
  document.forms[0].action ="flexgrid.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="flexgridquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>