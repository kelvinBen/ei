<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>人事事件明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="人事事件明细" >
<bsp:containbutton text="修改" onclick="forUpdate()" action="hrevent.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action="hreventquery.cmd"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$eventId" write="false"/>

  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT.STRU_ID")%>：</td>
      <td class="tdRight">
      <html:hidden name="struId" property="struId" write="true"/>
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT.SCN")%>：</td>
      <td class="tdRight"><html:hidden name="scn" property="scn" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT.EVENT_TYPE")%>：</td>
      <td class="tdRight">
      	<html:hidden name="eventType" property="eventType" write="true"/>
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT.EVENT_DATE")%>：</td>
      <td class="tdRight"><html:hidden name="eventDate" property="eventDate" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT.EVENT_MEMO")%>：</td>
      <td class="tdRight"><html:hidden name="eventMemo" property="eventMemo" write="true"/></td>
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
  document.forms[0].action ="hrevent.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="hreventquery.cmd";
  document.forms[0].submit();	
}
</script>