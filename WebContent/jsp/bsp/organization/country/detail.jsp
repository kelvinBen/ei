<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>����(����)������ϸ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="����(����)������ϸ" >
<bsp:containbutton text="�޸�" onclick="forUpdate()" action="country.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton text="����" onclick="forReturn()" action="countryquery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COUNTRY.COUNTRY_CODE")%>��</td>
      <td class="tdRight"><html:hidden name="countryCode" property="countryCode" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COUNTRY.COUNTRY_NAME")%>��</td>
      <td class="tdRight"><html:hidden name="countryName" property="countryName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COUNTRY.SHORT_NAME")%>��</td>
      <td class="tdRight"><html:hidden name="shortName" property="shortName" write="true"/></td>
    </tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("countryCode").value;
  document.forms[0].action ="country.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="countryquery.cmd";
  document.forms[0].submit();	
}
</script>