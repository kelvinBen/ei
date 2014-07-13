<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>用户在线历史记录明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="用户在线历史记录明细" >
<bsp:containbutton text="返回" onclick="history.go(-1)"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$sessionId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ONLINE_HIST.USER_ID")%>：</td>
      <td class="tdRight"><html:hidden name="userId" property="userId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ONLINE_HIST.USER_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="userName" property="userName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ONLINE_HIST.CORPORATION_ID")%>：</td>
      <td class="tdRight"><html:hidden name="corporationId" property="corporationId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ONLINE_HIST.CORPORATION_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="corporationName" property="corporationName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ONLINE_HIST.LOGIN_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="loginTime" property="loginTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ONLINE_HIST.LOGOFF_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="logoffTime" property="logoffTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ONLINE_HIST.REMOTEADDR")%>：</td>
      <td class="tdRight"><html:hidden name="remoteaddr" property="remoteaddr" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ONLINE_HIST.REMOTEHOST")%>：</td>
      <td class="tdRight"><html:hidden name="remotehost" property="remotehost" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ONLINE_HIST.REMOTEPORT")%>：</td>
      <td class="tdRight"><html:hidden name="remoteport" property="remoteport" write="true"/></td>
    </tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forReturn(){
  document.forms[0].action ="onlinehistquery.cmd";
  document.forms[0].submit();	
}
</script>