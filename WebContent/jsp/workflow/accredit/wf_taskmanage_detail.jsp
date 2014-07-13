<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>授权代理明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<div class="btnareaCss">
<html:button onclick="forReturn()" name="btn_return"  value="返回"></html:button>
</div>
<html:messages></html:messages>
<fieldset class="FieldsetCss"><legend>授权代理明细</legend>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  	 <tr>
      <td class="tdTitle">当前审批人：</td>
      <td class="tdRight">
      <input type="text" name="oldorganName" value="<%=request.getParameter("_oldUsername") %>" size="30" readonly="true" />
    </tr>	
    <tr>
      <td class="tdTitle">代理人：</td>
      <td class="tdRight">
      <input type="text" name="agentorganName" value="<%=request.getParameter("agentorganName") %>" size="30" readonly="true" />
    </tr>
  </table>
</div>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forReturn(){
var url ="taskQueryCmd.cmd";
 document.forms[0].action=url;
  document.forms[0].submit();	
}
</script>