<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>消息明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="消息明细" >
<%
	String confirm = (String)request.getAttribute("confirm");
	if(confirm!=null&&confirm.equals("true")){
%>
<bsp:containbutton action="mpmessage.cmd?method=forupdate" text="确认" onclick="confirm()"></bsp:containbutton>
<bsp:containbutton action="mpmessage.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<%}else{%>
<bsp:containbutton action="mpmessage.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="mpmessage.cmd?method=confirm" text="确认" onclick="confirm()"></bsp:containbutton>
<%}%>
<bsp:containbutton action="mpmessagequery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$msgId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.MSG_ID")%>：</td>
      <td class="tdRight"><html:hidden name="msgId" property="msgId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.MSG_TYPE_CODE")%>：</td>
      <td class="tdRight">
      	<html:label name="msgTypeCode" property="msgTypeCode" collection="mpMessageType" labelProperty="MSG_TYPE_NAME" labelKey="MSG_TYPE_CODE" />
      </td>
    </tr>
    <tr style="display:none">
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.OBJECTID")%>：</td>
      <td class="tdRight"><html:hidden name="objectid" property="objectid" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.SUBJECT")%>：</td>
      <td class="tdRight"><html:hidden name="subject" property="subject" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.CONTENT")%>：</td>
      <td class="tdRight"><html:hidden name="content" property="content" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.CREATER")%>：</td>
      <td class="tdRight">
      <html:hidden name="creater" property="creater"/>
      <html:hidden name="createrName" property="createrName" write="true"/>
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.SCHEDULE")%>：</td>
      <td class="tdRight"><html:hidden name="schedule" property="schedule" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.USEFUL_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="usefulTime" property="usefulTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.CREATE_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="createTime" property="createTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.RECEIVE_ADDRESS")%>：</td>
      <td class="tdRight"><html:hidden name="receiveAddress" property="receiveAddress" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.RECEIVE_MANNER_CODE")%>：</td>
      <td class="tdRight">
      	<html:label name="receiveMannerCode" property="receiveMannerCode" collection="mpInceptManner" labelProperty="RECEIVE_MANNER_NAME" labelKey="RECEIVE_MANNER_CODE" />
      </td>
    </tr>
    <!--
    <tr style="display:none">
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.ATTACHMENT")%>：</td>
      <td class="tdRight"><html:hidden name="attachment" property="attachment" write="true"/></td>
    </tr>
        -->
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.STATUS")%>：</td>
      <td class="tdRight">
      <html:label name="status" property="status" collection="MP_MESSAGE_STATUS" labelProperty="value" labelKey="key" />
      </td>
    </tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function confirm(){
	if(document.all.status.value=="1"){
	alert("已经确认不能重复确认");
	return ;
	}
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="mpmessage.cmd?method=confirm";
  document.forms[0].submit();	
}
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="mpmessage.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpmessagequery_page_init.cmd";
  document.forms[0].submit();	
}
</script>