<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>用户明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<widgets:container title="用户明细" >
<widgets:containbutton text="修改" onclick="forUpdate()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$userId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("USERS.USER_ID")%>：</td>
      <td class="tdRight"><html:hidden name="userId" property="userId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("USERS.USER_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="userName" property="userName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("USERS.PASSWORD")%>：</td>
      <td class="tdRight"><html:hidden name="password" property="password" write="false"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("USERS.E_MAIL")%>：</td>
      <td class="tdRight"><html:hidden name="email" property="email" write="true"/></td>
    </tr>
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="users.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="usersquery.cmd";
  document.forms[0].submit();	
}
</script>