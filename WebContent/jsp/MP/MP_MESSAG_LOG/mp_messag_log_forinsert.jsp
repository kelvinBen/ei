<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>消息日志增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkMpMessagLog(){
	  var id = document.forms[0].id;
  	  if ( __isQuoteIn(id.value) )
	  {
	    alert("主键不能含有引号或单引号!");
	    id.select();
	    id.focus();
	    return false;
	  }
      if (trim(id.value)=="")
	{
	  alert("请输入主键！");    
	  id.focus();
	  return false;
	}
    id.value = trim(id.value) ;
  	  var sender = document.forms[0].sender;
      if (trim(sender.value)=="")
	{
	  alert("请输入消息发送人！");    
	  sender.focus();
	  return false;
	}
    sender.value = trim(sender.value) ;
  	  var receiver = document.forms[0].receiver;
      if (trim(receiver.value)=="")
	{
	  alert("请输入消息接收人！");    
	  receiver.focus();
	  return false;
	}
    receiver.value = trim(receiver.value) ;
  	  var receiveAddress = document.forms[0].receiveAddress;
      if (trim(receiveAddress.value)=="")
	{
	  alert("请输入消息接收地址！");    
	  receiveAddress.focus();
	  return false;
	}
    receiveAddress.value = trim(receiveAddress.value) ;
  	  var senderType = document.forms[0].senderType;
      if (trim(senderType.value)=="")
	{
	  alert("请输入消息发送方式！");    
	  senderType.focus();
	  return false;
	}
    senderType.value = trim(senderType.value) ;
  	  var contents = document.forms[0].contents;
	  var isComplex = document.forms[0].isComplex;
	  var messageType = document.forms[0].messageType;
	  var sendTime = document.forms[0].sendTime;
	  var exception = document.forms[0].exception;
	  var state = document.forms[0].state;
	  var sendeNum = document.forms[0].sendeNum;
	  var receipt = document.forms[0].receipt;
	  var note = document.forms[0].note;
	  var note2 = document.forms[0].note2;
	  var note3 = document.forms[0].note3;
	return true
}

</script>
</HEAD>
<BODY topmargin="10px" onKeyDown="ctlent(event);">
<html:form  name="frmList"  action="">
<bsp:container title="消息日志增加" >
<bsp:containbutton action="mpmessaglog.cmd?method=insert" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="mpmessaglog.cmd?method=insertContinue" text="保存并继续" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="mpmessaglogquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
		<tr>	                   
<!-- 主键 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAG_LOG.ID")%>：  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="id" property="id" size="35"  onblur="checkId(this);"  maxlength="30" /> </td>
<!-- 消息发送人 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAG_LOG.Sender")%>：  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="sender" property="sender" size="35"  maxlength="300" /> </td>
		</tr>
		<tr>	                   
<!-- 消息接收人 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAG_LOG.receiver")%>：  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="receiver" property="receiver" size="35"  maxlength="300" /> </td>
<!-- 消息接收地址 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAG_LOG.receive_address")%>：  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="receiveAddress" property="receiveAddress" size="35"  maxlength="200" /> </td>
		</tr>
		<tr>	                   
<!-- 消息发送方式 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAG_LOG.Sender_type")%>：  <span style="color: red">*</span> 	</td>
                    <td class="tdRight">
                    	<html:select name="senderType" property="senderType" >
	                        <html:options collection="MPMESSAGLOG_SENDERTYPE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
<!-- 消息内容 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAG_LOG.Contents")%>： 	</td>
					<td class="tdRight">
						<html:textarea name="contents" cols="35" style="width:75%" property="contents"/>
					</td>
		</tr>
		<tr>	                   
<!-- 是否复杂消息 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAG_LOG.IS_complex")%>： 	</td>
                    <td class="tdRight">
                    	<html:select name="isComplex" property="isComplex" >
	                        <html:options collection="MPMESSAGLOG_ISCOMPLEX_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
<!-- 消息类型 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAG_LOG.message_type")%>： 	</td>
                    <td class="tdRight">
                    	<html:select name="messageType" property="messageType" >
	                        <html:options collection="MPMESSAGLOG_MESSAGETYPE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
		</tr>
		<tr>	                   
<!-- 发送时间 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAG_LOG.Send_Time")%>： 	</td>
                    <td class="tdRight"><html:text name="sendTime" property="sendTime" size="35"  maxlength="8" /> </td>
<!-- 异常原因 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAG_LOG.Exception")%>： 	</td>
					<td class="tdRight">
						<html:textarea name="exception" cols="35" style="width:75%" property="exception"/>
					</td>
		</tr>
		<tr>	                   
<!-- 消息状态 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAG_LOG.state")%>： 	</td>
                    <td class="tdRight">
                    	<html:select name="state" property="state" >
	                        <html:options collection="MPMESSAGLOG_STATE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
<!-- 发送次数 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAG_LOG.Sende_NUM")%>： 	</td>
                    <td class="tdRight"><html:text name="sendeNum" property="sendeNum" size="35"  maxlength="8" /> </td>
		</tr>
		<tr>	                   
<!-- 回执 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAG_LOG.receipt")%>： 	</td>
                    <td class="tdRight"><html:text name="receipt" property="receipt" size="35"  maxlength="300" /> </td>
<!-- NOTE -->
					<td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAG_LOG.NOTE")%>： 	</td>
                    <td class="tdRight"><html:text name="note" property="note" size="35"  maxlength="300" /> </td>
		</tr>
		<tr>	                   
<!-- NOTE2 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAG_LOG.NOTE2")%>： 	</td>
                    <td class="tdRight"><html:text name="note2" property="note2" size="35"  maxlength="200" /> </td>
<!-- NOTE3 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAG_LOG.NOTE3")%>： 	</td>
                    <td class="tdRight"><html:text name="note3" property="note3" size="35"  maxlength="200" /> </td>
		</tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMpMessagLog()) return;	
  document.forms[0].action ="mpmessaglog.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkMpMessagLog()) return;
  document.forms[0].action ="mpmessaglog.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
	window.history.back(); 

}
function forReset(){  
  document.forms[0].reset();	
}
function ctlent(event) {
	if((event.ctrlKey && event.keyCode == 13) || (event.altKey && event.keyCode == 83)) {
			forSave();
			return;
	}
}
//检查主键是否已经被使用, 该功能目前只支持单主键，多主键需要修改
function checkId(obj){
	var primaryKey= obj.value;
	if(primaryKey=="")
		return ;
	var result= xmlhttp("mpmessaglog.cmd?method=isExist&primaryKey="+primaryKey);
	//alert(result);//返回字符串为空时，表示该主键没被使用
	if(result!=""){
		alert("主键已经被使用，请使用其他编码！");
		obj.focus();
		obj.value="";
	}
}

</script>