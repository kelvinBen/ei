<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>历史消息明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="历史消息明细" >
<bsp:containbutton action="mpmessagehistory.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="mpmessagehistoryquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$msgId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.MSG_ID")%>：</td>
      <td class="tdRight"><html:hidden name="msgId" property="msgId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.MSG_TYPE_CODE")%>：</td>
      <td class="tdRight">
      <html:label name="msgTypeCode" property="msgTypeCode" collection="mpMessageType" labelProperty="MSG_TYPE_NAME" labelKey="MSG_TYPE_CODE" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.OBJECTID")%>：</td>
      <td class="tdRight"><html:hidden name="objectid" property="objectid" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.SUBJECT")%>：</td>
      <td class="tdRight"><html:hidden name="subject" property="subject" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.CONTENT")%>：</td>
      <td class="tdRight"><html:hidden name="content" property="content" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.SCHEDULE")%>：</td>
      <td class="tdRight"><html:hidden name="schedule" property="schedule" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.USEFUL_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="usefulTime" property="usefulTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.CREATE_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="createTime" property="createTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.SEND_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="sendTime" property="sendTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.CREATER")%>：</td>
      <td class="tdRight"><html:hidden name="createrName" property="createrName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.RECEIVE_ADDRESS")%>：</td>
      <td class="tdRight"><html:hidden name="receiveAddress" property="receiveAddress" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.RECEIVE_MANNER_CODE")%>：</td>
      <td class="tdRight">
      	<html:label name="receiveMannerCode" property="receiveMannerCode" collection="mpInceptManner" labelProperty="RECEIVE_MANNER_NAME" labelKey="RECEIVE_MANNER_CODE" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.STATUS")%>：</td>
      <td class="tdRight"><html:hidden name="status" property="status" write="true"/></td>
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
  document.forms[0].action ="mpmessagehistory.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpmessagehistoryquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>