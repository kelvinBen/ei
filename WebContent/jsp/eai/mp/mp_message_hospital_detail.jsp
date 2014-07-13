<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>消息错误诊断明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="消息错误诊断明细" >
<bsp:containbutton action="mpmessagehospital.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="mpmessagehospitalquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$errorMsgId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.ERROR_MSG_ID")%>：</td>
      <td class="tdRight"><html:hidden name="errorMsgId" property="errorMsgId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.MSG_ID")%>：</td>
      <td class="tdRight"><html:hidden name="msgId" property="msgId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.SEND_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="sendTime" property="sendTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.RECEIVE_MANNER_CODE")%>：</td>
      <td class="tdRight">
			<html:label name="receiveMannerCode" property="receiveMannerCode" collection="mpInceptManner" labelProperty="RECEIVE_MANNER_NAME" labelKey="RECEIVE_MANNER_CODE" />      
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.RECEIVE_ADDRESS")%>：</td>
      <td class="tdRight"><html:hidden name="receiveAddress" property="receiveAddress" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.STATUS")%>：</td>
      <td class="tdRight"><html:hidden name="status" property="status" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.DESCRIPTION")%>：</td>
      <td class="tdRight"><html:hidden name="description" property="description" write="true"/></td>
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
  document.forms[0].action ="mpmessagehospital.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpmessagehospitalquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>