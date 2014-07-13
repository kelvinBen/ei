<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui css='flexgrid.js'/>"></script>
<html:form action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="组织机构版本明细" >
<bsp:containbutton text="返回" onclick="forReturn()" action="struversionquery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_VERSION.VERSION")%>：</td>
      <td class="tdRight"><html:hidden name="version" property="version" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_VERSION.VERSION_DATE")%>：</td>
      <td class="tdRight"><html:hidden name="versionDate" property="versionDate" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_VERSION.VERSION_USER")%>：</td>
      <td class="tdRight"><html:hidden name="versionUser" property="versionUser" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_VERSION.VERSION_NOTE")%>：</td>
      <td class="tdRight"><html:hidden name="versionNote" property="versionNote" write="true"/></td>
    </tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("version").value;
  document.forms[0].action ="struversion.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="struversionquery.cmd";
  document.forms[0].submit();	
}
</script>