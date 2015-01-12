<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>会话跟踪</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="会话跟踪" >
<bsp:containbutton onclick="forBeanDetail()" text="对应Cmd 明细"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="history.go(-1)" />
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="securityLogId" property="logId" write="false"/>
     
      
      <html:hidden name="sessionId" property="sessionId" write="false"/>
   
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.USER_ID")%>：</td>
      <td class="tdRight"><html:hidden name="userId" property="userId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.USER_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="userName" property="userName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.USER_LEVEL")%>：</td>
      <td class="tdRight"><html:hidden name="userLevel" property="userLevel" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.CORPORATION_ID")%>：</td>
      <td class="tdRight"><html:hidden name="corporationId" property="corporationId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.CORPORATION_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="corporationName" property="corporationName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOG_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="logTime" property="logTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.REMOTEADDR")%>：</td>
      <td class="tdRight"><html:hidden name="remoteaddr" property="remoteaddr" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.REMOTEHOST")%>：</td>
      <td class="tdRight"><html:hidden name="remotehost" property="remotehost" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.REMOTEPORT")%>：</td>
      <td class="tdRight"><html:hidden name="remoteport" property="remoteport" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOCALADDR")%>：</td>
      <td class="tdRight"><html:hidden name="localaddr" property="localaddr" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOCALHOST")%>：</td>
      <td class="tdRight"><html:hidden name="localhost" property="localhost" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOCALPORT")%>：</td>
      <td class="tdRight"><html:hidden name="localport" property="localport" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.RESOURCE_ID")%>：</td>
      <td class="tdRight"><html:hidden name="resourceId" property="resourceId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.RESOURCE_ALIAS")%>：</td>
      <td class="tdRight"><html:hidden name="resourceAlias" property="resourceAlias" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.SECURITY_LEVEL")%>：</td>
      <td class="tdRight"><html:hidden name="securityLevel" property="securityLevel" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOG_TYPE")%>：</td>
      <td class="tdRight"><html:hidden name="logType" property="logType" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOG_TYPE_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="logTypeName" property="logTypeName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOG_CONTENT")%>：</td>
      <td class="tdRight"><html:hidden name="logContent" property="logContent" write="true"/></td>
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
  document.forms[0].action ="securityLog.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forBeanDetail(){

  document.forms[0].action ="CmdLog.cmd?method=detailCmdBean";    
  document.forms[0].submit();	
}
function forReturn(){
  self.location.href ="querySecurityLog.cmd?clear=true";
}
</script>