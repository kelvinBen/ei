<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<%
	String serverType=(String)request.getAttribute("serverType");
	if(serverType==null)
	{
		serverType="";
	}
%>
<HEAD>
<TITLE>系统设置 - 默认邮箱信息设置</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript">
function checkMailAccount(){
	var pop3Server = document.forms[0].pop3Server;	
	var imapServer=document.forms[0].imapServer;
	var smtpServer = document.forms[0].smtpServer;
	var serverType = document.forms[0].serverType;
	
	if (serverType[0].checked)
	{
		if (trim(pop3Server.value)=="")
		{
			alert("请输入POP3收件服务器！");
			pop3Server.focus();
			return false;
		}
		if (byteLength(trim(pop3Server.value))>80)
		{
			alert("POP3收件服务器输入的数据超长，请重新填写！");
			pop3Server.focus();
			return false;
		}
		if (__isQuoteInMail(trim(pop3Server.value)) || !checkDomainName(trim(pop3Server.value)))
		{
			alert("POP3收件服务器输入的数据有误，请重新填写！");
			pop3Server.focus();
			return false;
		}
	}
	pop3Server.value = trim(pop3Server.value);
	
	if (serverType[1].checked)
	{
		if(trim(imapServer.value)=="")
		{
			alert("请输入IMAP收件服务器！");
			imapServer.focus();
			return false;
		}
		if (byteLength(trim(imapServer.value))>80)
		{
			alert("IMAP收件服务器输入的数据超长，请重新填写！");
			imapServer.focus();
			return false;
		}
		if (__isQuoteInMail(trim(imapServer.value)) || !checkDomainName(trim(imapServer.value)))
		{
			alert("IMAP收件服务器输入的数据有误，请重新填写！");
			imapServer.focus();
			return false;
		}
	}
	imapServer.value = trim(imapServer.value);
	
	if (trim(smtpServer.value)=="")
	{
		alert("请输入发件服务器SMTP！");
		smtpServer.focus();
		return false;
	}
	if (byteLength(trim(smtpServer.value))>80){
		alert("发件服务器SMTP数据超长，请重新填写！");
		smtpServer.focus();
		return false;
	}
	if (__isQuoteInMail(trim(smtpServer.value)) || !checkDomainName(trim(smtpServer.value))){
		alert("发件服务器SMTP填写有误，请重新填写！");
		smtpServer.focus();
		return false;
	}
	smtpServer.value = trim(smtpServer.value);	
	
	var attachmentSize = document.forms[0].attachmentSize;
	if (trim(attachmentSize.value)=="")
	{
		alert("请输入单个附件大小限制！");
		attachmentSize.focus();    
		return false;
	}

	if (!__isFloat(trim(attachmentSize.value))||(trim(attachmentSize.value)<=0))
	{
		alert("单个附件大小限制应该为大于零的数字！");
		attachmentSize.focus();    
		return false;
	}
	attachmentSize.value = trim(attachmentSize.value);
	
	var mailSize = document.forms[0].mailSize;
	if (trim(mailSize.value)=="")
	{
		alert("请输入单个邮件大小限制！");
		mailSize.focus();    
		return false;
	}

	if (!__isFloat(trim(mailSize.value))||(trim(mailSize.value)<=0))
	{
		alert("单个邮件大小限制应该为大于零的数字！");
		mailSize.focus();    
		return false;
	}
	mailSize.value = trim(mailSize.value);
	
	var mailboxSize = document.forms[0].mailboxSize;
	if (trim(mailboxSize.value)=="")
	{
		alert("请输入邮箱大小限制！");
		mailboxSize.focus();    
		return false;
	}
	if (!__isFloat(trim(mailboxSize.value))||(trim(mailboxSize.value)<=0))
	{
		alert("邮箱大小限制应该为大于零的数字！");
		mailboxSize.focus();    
		return false;
	}
	mailboxSize.value = trim(mailboxSize.value);
	if(parseInt(attachmentSize.value)>parseInt(mailSize.value)){
		alert("单个邮件大小限制应该大于等于单个附件大小限制！");
		return false;
	}
	if(parseInt(mailSize.value)>parseInt(mailboxSize.value)){
		alert("本地邮箱大小限制应该大于等于单个邮件大小限制！");
		return false;
	}
	return true
}
</script>
</HEAD>

<BODY topmargin="10px">

<html:form  name="frmList"  action="">
<html:hidden name="tpId" value="1"/>
<span id="message"><html:messages/></span>
<div class="btnareaCss">
	<html:button onclick="forSave()" name="btn_save" value="保存"></html:button>
</div>

<div align="center">
<fieldset class="FieldsetCss" ><legend>邮箱信息</legend>
  <table width="100%" cellspacing="0" class="tblContent">
  		<tr>
		<td class="tdLeft">收件服务器：</td>
		<td class="tdRight">
		<html:radio name="serverType" property="serverType" onclick="onshowdocnote(1)" value="1">POP3：</html:radio>
		</td>
		<td class="tdRight" id="pop3" style = "display:none">
		<html:text name="pop3Server" property="pop3Server" maxlength="80" /><onchange="checkinputNullInDcWork ('pop3Server','pop3Server_span')" /><span id="pop3Server_span" class="xinghaoCss">*</span>
		</td>
		<td class="tdRight">
		<html:radio name="serverType" property="serverType" onclick="onshowdocnote(2)" value="2">IMAP：</html:radio>
		</td>
		<td class="tdRight" id="imap" style="display:none">
		<html:text name="imapServer" property="imapServer" maxlength="80" /><onchange="checkinputNullInDcWork ('imapServer','imapServer_span')" /><span id="imapServer_span" class="xinghaoCss">*</span>
		</td>
		</tr>                    
		<tr>
		<td class="tdLeft"><%=ResourcesFactory.getString("DEF_MAIL_CONFIG.SMTP_SERVER")%>：</td>
		<td valign=top class="tdRight" colspan="4">
		<html:text name="smtpServer" property="smtpServer" maxlength="80" /><onchange="checkinputNullInDcWork ('smtpServer','smtpServer_span')" /><span id="smtpServer_span" class="xinghaoCss">*</span>
		</td>
		</tr>                    
		<tr>
		<td class="tdLeft"><%=ResourcesFactory.getString("DEF_MAIL_CONFIG.ATTACHMENT_SIZE")%>：</td>
		<td valign=top class="tdRight" colspan="4">
		<html:text name="attachmentSize" property="attachmentSize" size="4" maxlength="80" /><onchange="checkinputNullInDcWork ('attachmentSize','attachmentSize_span')" /><span id="attachmentSize_span" class="xinghaoCss">*</span>&nbsp;M
		</td>
		</tr>
		<tr>
		<td class="tdLeft"><%=ResourcesFactory.getString("DEF_MAIL_CONFIG.MAIL_SIZE")%>：</td>
		<td valign=top class="tdRight" colspan="4">
		<html:text name="mailSize" property="mailSize" size="4" maxlength="80" /><onchange="checkinputNullInDcWork ('mailSize','mailSize_span')" /><span id="mailSize_span" class="xinghaoCss">*</span>&nbsp;M
		</td>
		</tr>   
		<tr>
		<td class="tdLeft">本地邮箱大小限制：</td>
		<td valign=top class="tdRight" colspan="4">
		<html:text name="mailboxSize" property="mailboxSize" size="4" maxlength="80" /><onchange="checkinputNullInDcWork ('mailboxSize','mailboxSize_span')" /><span id="mailboxSize_span" class="xinghaoCss">*</span>&nbsp;M
		</td>		
		</tr>
		<tr>
		<%if(serverType.equals("1")){%>
		<td class="tdLeft">登录系统时刻是否检查新邮件：</td>
		<%} else {%>
		<td class="tdLeft">登录系统时刻是否检查未读邮件：</td>
		<%}%>
		<td valign=top class="tdRight" colspan="4">
		<html:checkbox name="isCheckFirst" property="isCheckFirst"  value="1"/>
		</td>		
		</tr>		
		
   </table>
</fieldset>
</div>
</html:form>
</BODY>
</HTML>
<script language="javascript">
init();
function init()
{
	var serverType="<%=serverType%>";
	if(serverType == ""){
		serverType = "1";
		document.forms[0].serverType[0].checked = true;
	}
	onshowdocnote(serverType);
	
	
}
function forSave(){
  if(!checkMailAccount()) return;
  initMessage();
  document.forms[0].action ="defmailconfig.cmd?method=update";
  document.forms[0].submit();	
}
function initMessage(){
  if (document.getElementById("message").innerText!=""){
  	document.getElementById("message").innerText=" ";
  }
}
function onshowdocnote(vartmp){

	if(vartmp==1)
	{
	document.all("pop3").style.display='block';
	document.all("imap").style.display="none";	
	}
	else if(vartmp==2)
	{
	document.all("pop3").style.display="none";
	document.all("imap").style.display='block';
	}
}
</script>