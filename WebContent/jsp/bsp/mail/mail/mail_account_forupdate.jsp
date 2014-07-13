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
<TITLE>我的邮件 - 邮箱设置</TITLE>
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
	
	var mailUserId = document.forms[0].mailUserId;
	if (trim(mailUserId.value)=="")
	{
		alert("请输入用户名！");
		mailUserId.focus();    
		return false;
	}
	if (byteLength(trim(mailUserId.value))>30){
		alert("用户名超长，请重新填写！");
		mailUserId.focus();   
		return false;
	}
	//有的邮件服务器用户名为邮箱地址(formail)	
	if ((__isQuoteIn(trim(mailUserId.value)))&&(!__checkEmail(trim(mailUserId.value)))){
		alert("用户名填写有误，请重新填写！"); 
		mailUserId.focus();   
		return false;
	}
	mailUserId.value = trim(mailUserId.value) ;
	
	var mailPassword = document.forms[0].mailPassword;
	if (trim(mailPassword.value)=="")
	{
	alert("请输入密码！"); 
	mailPassword.focus();    
	return false;
	}
	mailPassword.value = trim(mailPassword.value) ;		
	
	var mailAddress = document.forms[0].mailAddress;
	if (trim(mailAddress.value)=="")
	{
	alert("请输入邮箱地址！"); 
	mailAddress.focus();   
	return false;
	}
	if (!__checkEmail(trim(mailAddress.value)))
	{
	alert("邮箱地址填写有误，请重新填写！"); 
	mailAddress.focus();    
	return false;
	}
	mailAddress.value = trim(mailAddress.value) ;
	
	var mailUserName = document.forms[0].mailUserName;
	if (trim(mailUserName.value)=="")
	{
		alert("请输入姓名！");
		mailUserName.focus();    
		return false;
	}
	if (byteLength(trim(mailUserName.value))>80){
		alert("姓名超长，请重新填写！");
		mailUserName.focus();   
		return false;
	}
	if (__isQuoteIn(trim(mailUserName.value))){
		alert("姓名填写有误，请重新填写！"); 
		mailUserName.focus();   
		return false;
	}
	mailUserName.value = trim(mailUserName.value) ;	
	
        var interval=document.forms[0].interval;
	if (!__isNum(trim(interval.value))||(interval.value<=0))
	{
		alert("时间间隔应该为大于零的整数！");		
		if (interval.disabled==false){
			interval.focus();
		}		
		return false;
	}	
        interval.value = trim(interval.value) ;	
	return true
}
</script>
</HEAD>
<BODY topmargin="10px" onload="init()">

<html:form  name="frmList"  action="">
<bsp:container title="邮箱设置" >
	<bsp:containbutton onclick="forVerify()" name="btn_verify" text="邮箱验证" ></bsp:containbutton>
	<bsp:containbutton onclick="forSave()" name="btn_save" text="保存" ></bsp:containbutton>	
<span id="message"><html:messages/></span>
<div align="center">
<fieldset class="FieldsetCss">
  <table width="100%" cellspacing="0" class="tblContent">
  		<html:hidden name="accountId" property="accountId"/>
  		<html:hidden name="userId" property="userId"/>
  		<html:hidden name="status" property="status"/>
  		<html:hidden name="inUse" property="inUse"/>
		<tr>
		<td class="tdLeft">收件服务器：</td>
		<td class="tdRight">
		<html:radio name="serverType" property="serverType" onclick="onshowdocnote(1)" value="1">POP3：</html:radio>
		</td>
		<td class="tdRight" id="pop3" style = "display:none">
		<html:text name="pop3Server" property="pop3Server" maxlength="80" /><span id="pop3Server_span" class="xinghaoCss">*</span>
		</td>
		<td class="tdRight">
		<html:radio name="serverType" property="serverType" onclick="onshowdocnote(2)" value="2">IMAP：</html:radio>
		</td>
		<td class="tdRight" id="imap" style="display:none">
		<html:text name="imapServer" property="imapServer" maxlength="80" /><span id="imapServer_span" class="xinghaoCss">*</span>
		</td>
		</tr>
		
		<tr>
		<td class="tdLeft"><%=ResourcesFactory.getString("MAIL_ACCOUNT.SMTP_SERVER")%>：</td>
		<td valign=top class="tdRight" colspan="4"><html:text name="smtpServer" property="smtpServer" size="30" maxlength="80" /><span id="smtpServer_span" class="xinghaoCss">*</span></td>
		</tr>
		
		<tr>
		<td class="tdLeft"><%=ResourcesFactory.getString("MAIL_ACCOUNT.MAIL_USER_ID")%>：</td>
		<td valign=top class="tdRight" colspan="4"><html:text name="mailUserId" property="mailUserId" size="30" maxlength="30" /><span id="mailUserId_span" class="xinghaoCss">*</span></td>
		</tr>   
		
		<tr>		
		<td class="tdLeft"><%=ResourcesFactory.getString("MAIL_ACCOUNT.MAIL_PASSWORD")%>：</td>
		<td valign=top class="tdRight" colspan="4"><html:password name="mailPassword" property="mailPassword" size="30" maxlength="30" /><span id="mailPassword_span" class="xinghaoCss">*</span></td>
		</tr> 
		
		<tr>		
		<td class="tdLeft"><%=ResourcesFactory.getString("MAIL_ACCOUNT.MAIL_ADDRESS")%>：</td>
		<td valign=top class="tdRight" colspan="4"><html:text name="mailAddress" property="mailAddress" size="30" maxlength="80" /><span id="mailAddress_span" class="xinghaoCss">*</span></td>
		</tr> 
		
		<tr>
		<td class="tdLeft"><%=ResourcesFactory.getString("MAIL_ACCOUNT.MAIL_USER_NAME")%>：</td>
		<td valign=top class="tdRight" colspan="4"><html:text name="mailUserName" property="mailUserName" size="30" maxlength="80" /><span id="mailUserName_span" class="xinghaoCss">*</span></td>
		</tr>                              
   </table>

</fieldset>
<fieldset class="FieldsetCss" ><legend>其它设置</legend>
  <table width="100%" cellspacing="0" class="tblContent">
		<tr>
		<td class="tdLeft" colspan="2">
		<html:checkbox name="isAutoReceive" property="isAutoReceive" onclick="change()" value="1"/>
		每隔
		<html:text name="interval" property="interval" size="2" maxlength="8" />
		分钟自动检测新邮件(重新登陆有效)
		</td>
		</tr>                              
   </table>
</fieldset>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function init(){
	var serverType="<%=serverType%>";
	if(serverType == ""){
		serverType = "1";
		document.forms[0].serverType[0].checked = true;
	}
	onshowdocnote(serverType);
  var isAutoReceive=document.forms[0].isAutoReceive;
  if (!isAutoReceive.checked){
  	var interval=document.forms[0].interval;
  	interval.readOnly=true;
  	interval.style.backgroundColor="#C0E0FD";
  }
}
function change(){
  var isAutoReceive=document.forms[0].isAutoReceive;
  var interval=document.forms[0].interval;
  if (!isAutoReceive.checked){  	
  	interval.readOnly=true;
  	interval.style.backgroundColor="#C0E0FD";
  }else{
  	interval.readOnly=false;
  	interval.style.backgroundColor="white";
  }
}
function forSave(){
  if(!checkMailAccount()) return;	
  initMessage();
  document.forms[0].action ="mailaccount.cmd?method=update";
  document.forms[0].submit();	
}
function forVerify(){  
  if(!checkMailAccount()) return;	
  initMessage();
  document.forms[0].action ="mailaccount.cmd?method=verify";
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