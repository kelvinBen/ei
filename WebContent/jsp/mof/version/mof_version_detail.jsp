<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>版本管理明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="版本管理明细" >
<bsp:containbutton action="mofversion.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="mofversionquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$version" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_VERSION.VERSION")%>：</td>
      <td class="tdRight"><html:hidden name="version" property="version" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_VERSION.VERSION_DATE")%>：</td>
      <td class="tdRight"><html:hidden name="versionDate" property="versionDate" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_VERSION.VERSION_USER")%>：</td>
      <td class="tdRight"><html:hidden name="versionUser" property="versionUser" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_VERSION.VERSION_NOTE")%>：</td>
      <td class="tdRight"><html:hidden name="versionNote" property="versionNote" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_VERSION.VERSION_TYPE")%>：</td>
      <td class="tdRight">
      	<html:label name="versionType" property="versionType" collection="MOFVERSION_VERSIONTYPE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
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
  document.forms[0].action ="mofversion.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mofversionquery_page_init.cmd?clear=true";
  document.forms[0].submit();	
}
</script>