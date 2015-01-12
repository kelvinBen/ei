<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>系统变量明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<bsp:container title="系统变量明细">	
<bsp:containbutton onclick="forUpdate()" text="修改" action=""></bsp:containbutton> 
<bsp:containbutton onclick="forReturn()" text="返回" action=""></bsp:containbutton>
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
 
<html:messages></html:messages> 
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$parmsCode" write="false"/>
    <tr>
      <td class="TdLeft"><%=ResourcesFactory.getString("COMMON_PARMS.PARMS_CODE")%>：</td>
      <td class="TdRight"><html:hidden name="parmsCode" property="parmsCode" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft"><%=ResourcesFactory.getString("COMMON_PARMS.PARMS_NAME")%>：</td>
      <td class="TdRight"><html:hidden name="parmsName" property="parmsName" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft"><%=ResourcesFactory.getString("COMMON_PARMS.PARMS_VALUE")%>：</td>
      <td class="TdRight"><html:hidden name="parmsValue" property="parmsValue" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft"><%=ResourcesFactory.getString("COMMON_PARMS.NOTE")%>：</td>
      <td class="TdRight"><html:hidden name="note" property="note" write="true"/></td>
    </tr>
  </table> 
</html:form>
</bsp:container>
</BODY>
</HTML>
<script language="javascript">
//setTitleInTreeBar('设置中心-系统变量设置-系统变量明细');
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="commonparms.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="commonparmsquery.cmd";
  document.forms[0].submit();	
}
</script>