<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>主机和应用映射表明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="主机和应用映射表明细" >
<bsp:containbutton action="pubapp.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="pubappquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$appId" write="false"/>
    <tr style="display:none">
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.APP_ID")%>：</td>
      <td class="tdRight"><html:hidden name="appId" property="appId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.APP_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="appName" property="appName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.CORPORATION_ID")%>：</td>
      <td class="tdRight"><html:hidden name="corporationId" property="corporationId"/><html:hidden name="corporationName" property="corporationName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.TP")%>：</td>
      <td class="tdRight"><html:hidden name="tp" property="tp" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.IP")%>：</td>
      <td class="tdRight"><html:hidden name="ip" property="ip" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.PORT")%>：</td>
      <td class="tdRight"><html:hidden name="port" property="port" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.CONTEXT")%>：</td>
      <td class="tdRight"><html:hidden name="context" property="context" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.DOMAINNAME")%>：</td>
      <td class="tdRight"><html:hidden name="domainname" property="domainname" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.NOTE")%>：</td>
      <td class="tdRight"><html:hidden name="note" property="note" write="true"/></td>
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
  document.forms[0].action ="pubapp.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="pubappquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>