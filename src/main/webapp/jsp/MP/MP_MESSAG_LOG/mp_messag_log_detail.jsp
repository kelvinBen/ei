<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>消息日志明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="消息日志明细" >
<bsp:containbutton action="mpmessaglog.cmd?method=forupdate" text="改发" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="mpmessaglogquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$id" write="false"/>
	<tr>	                   
<!-- 主键 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_MESSAG_LOG.ID")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="id" property="id" write="true"/></td>
     
<!-- 消息发送人 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_MESSAG_LOG.Sender")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="sender" property="sender" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 消息接收人 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_MESSAG_LOG.receiver")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="receiver" property="receiver" write="true"/></td>
     
<!-- 消息接收地址 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_MESSAG_LOG.receive_address")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="receiveAddress" property="receiveAddress" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 消息发送方式 -->
  	
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_MESSAG_LOG.Sender_type")%>：</td>
      <td class="tdRight" width="35%">
      	<html:label name="senderType" property="senderType" collection="MPMESSAGLOG_SENDERTYPE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
     
<!-- 消息内容 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_MESSAG_LOG.Contents")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="contents" property="contents" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 是否复杂消息 -->
  	
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_MESSAG_LOG.IS_complex")%>：</td>
      <td class="tdRight" width="35%">
      	<html:label name="isComplex" property="isComplex" collection="MPMESSAGLOG_ISCOMPLEX_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
     
<!-- 消息类型 -->
  	
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_MESSAG_LOG.message_type")%>：</td>
      <td class="tdRight" width="35%">
      	<html:label name="messageType" property="messageType" collection="MPMESSAGLOG_MESSAGETYPE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
     
		</tr>
	<tr>	                   
<!-- 发送时间 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_MESSAG_LOG.Send_Time")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="sendTime" property="sendTime" write="true"/></td>
     
<!-- 异常原因 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_MESSAG_LOG.Exception")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="exception" property="exception" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 消息状态 -->
  	
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_MESSAG_LOG.state")%>：</td>
      <td class="tdRight" width="35%">
      	<html:label name="state" property="state" collection="MPMESSAGLOG_STATE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
     
<!-- 发送次数 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_MESSAG_LOG.Sende_NUM")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="sendeNum" property="sendeNum" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 回执 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_MESSAG_LOG.receipt")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="receipt" property="receipt" write="true"/></td>
     
<!-- NOTE -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_MESSAG_LOG.NOTE")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note" property="note" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- NOTE2 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_MESSAG_LOG.NOTE2")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note2" property="note2" write="true"/></td>
     
<!-- NOTE3 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_MESSAG_LOG.NOTE3")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note3" property="note3" write="true"/></td>
     
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
  document.forms[0].action ="mpmessaglog.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
if(window.opener){
	window.close();
}else{
  document.forms[0].action ="mpmessaglogquery_page_init.cmd";
  document.forms[0].submit();	
  }
}
</script>