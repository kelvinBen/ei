<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>人事事件类型明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<%
String organTypeParent=(String)request.getAttribute("organTypeParent");
%>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="人事事件类型明细" >
<bsp:containbutton text="修改" onclick="forUpdate()" action="hreventtype.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action="hrEventTypeQuery.cmd"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  	 <tr>
  					<html:hidden name="organType" property="organType" write="false"/>
				<tr>   
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT_TYPE.EVENT_TYPE")%>：</td>
      <td class="tdRight"><html:hidden name="eventType" property="eventType" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT_TYPE.TYPE_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="typeName" property="typeName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT_TYPE.IS_SYS")%>：</td>
      <td class="tdRight"><html:hidden name="sys" property="sys" write="true"/></td>
    </tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("eventType").value;
  document.forms[0].action ="hreventtype.cmd?method=forupdate&organTypeParent=<%=organTypeParent%>";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="hrEventTypeQuery.cmd?organType=<%=organTypeParent%>";
  document.forms[0].submit();	
}
</script>