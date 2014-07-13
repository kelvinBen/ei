<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>数字证书与用户映射表明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="数字证书与用户映射表明细" >
<bsp:containbutton action="certuser.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="certuserquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$dn" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("CERT_USER.DN")%>：</td>
      <td class="tdRight"><html:hidden name="dn" property="dn" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("CERT_USER.USER_ID")%>：</td>
      <td class="tdRight"><html:hidden name="userId" property="userId" write="true"/></td>
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
  document.forms[0].action ="certuser.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="certuserquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>