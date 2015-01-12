<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>订阅者类型明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="订阅者类型明细" >
<bsp:containbutton action="mpsubscribertypequery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$subscrTypeCode" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCRIBER_TYPE.SUBSCR_TYPE_CODE")%>：</td>
      <td class="tdRight"><html:hidden name="subscrTypeCode" property="subscrTypeCode" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCRIBER_TYPE.SUBSCR_TYPE_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="subscrTypeName" property="subscrTypeName" write="true"/></td>
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
  document.forms[0].action ="mpsubscribertype.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpsubscribertypequery_page_init.cmd";
  document.forms[0].submit();	
}
</script>