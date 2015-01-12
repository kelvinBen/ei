<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>用户消息明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="用户消息明细" >
<bsp:containbutton action="mpusermessagequery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$userMessageId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.USER_MESSAGE_ID")%>：</td>
      <td class="tdRight"><html:hidden name="userMessageId" property="userMessageId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.MSG_TYPE_CODE")%>：</td>
      <td class="tdRight">
      	<html:label name="msgTypeCode" property="msgTypeCode" collection="mpMessageType" labelProperty="MSG_TYPE_NAME" labelKey="MSG_TYPE_CODE" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.SUBSCRIBERID")%>：</td>
      <td class="tdRight"><html:hidden name="subscriberid" property="subscriberid" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.SUBSCR_TYPE_CODE")%>：</td>
      <td class="tdRight">
      <html:label name="subscrTypeCode" property="subscrTypeCode" collection="mpSubscriberType" labelProperty="SUBSCR_TYPE_NAME" labelKey="SUBSCR_TYPE_CODE" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.SUBJECT")%>：</td>
      <td class="tdRight"><html:hidden name="subject" property="subject" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.CONTENT")%>：</td>
      <td class="tdRight"><html:hidden name="content" property="content" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.CREATER")%>：</td>
      <td class="tdRight"><html:hidden name="createrName" property="createrName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.CREATE_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="createTime" property="createTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.ARRIVE_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="arriveTime" property="arriveTime" write="true"/></td>
    </tr>
    <!--
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.ATTACHMENT")%>：</td>
      <td class="tdRight"><html:hidden name="attachment" property="attachment" write="true"/></td>
    </tr>
    -->
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.STATUS")%>：</td>
      <td class="tdRight">
      <html:label name="status" property="status" collection="MP_USER_MESSAGE_STATUS" labelProperty="value" labelKey="key" />
      </td>
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
  document.forms[0].action ="mpusermessage.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpusermessagequery_page_init.cmd";
  document.forms[0].submit();	
}
</script>