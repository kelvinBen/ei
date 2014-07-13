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
<TITLE>ϵͳ���� - Ĭ��������Ϣ����</TITLE>
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
			alert("������POP3�ռ���������");
			pop3Server.focus();
			return false;
		}
		if (byteLength(trim(pop3Server.value))>80)
		{
			alert("POP3�ռ���������������ݳ�������������д��");
			pop3Server.focus();
			return false;
		}
		if (__isQuoteInMail(trim(pop3Server.value)) || !checkDomainName(trim(pop3Server.value)))
		{
			alert("POP3�ռ����������������������������д��");
			pop3Server.focus();
			return false;
		}
	}
	pop3Server.value = trim(pop3Server.value);
	
	if (serverType[1].checked)
	{
		if(trim(imapServer.value)=="")
		{
			alert("������IMAP�ռ���������");
			imapServer.focus();
			return false;
		}
		if (byteLength(trim(imapServer.value))>80)
		{
			alert("IMAP�ռ���������������ݳ�������������д��");
			imapServer.focus();
			return false;
		}
		if (__isQuoteInMail(trim(imapServer.value)) || !checkDomainName(trim(imapServer.value)))
		{
			alert("IMAP�ռ����������������������������д��");
			imapServer.focus();
			return false;
		}
	}
	imapServer.value = trim(imapServer.value);
	
	if (trim(smtpServer.value)=="")
	{
		alert("�����뷢��������SMTP��");
		smtpServer.focus();
		return false;
	}
	if (byteLength(trim(smtpServer.value))>80){
		alert("����������SMTP���ݳ�������������д��");
		smtpServer.focus();
		return false;
	}
	if (__isQuoteInMail(trim(smtpServer.value)) || !checkDomainName(trim(smtpServer.value))){
		alert("����������SMTP��д������������д��");
		smtpServer.focus();
		return false;
	}
	smtpServer.value = trim(smtpServer.value);	
	
	var attachmentSize = document.forms[0].attachmentSize;
	if (trim(attachmentSize.value)=="")
	{
		alert("�����뵥��������С���ƣ�");
		attachmentSize.focus();    
		return false;
	}

	if (!__isFloat(trim(attachmentSize.value))||(trim(attachmentSize.value)<=0))
	{
		alert("����������С����Ӧ��Ϊ����������֣�");
		attachmentSize.focus();    
		return false;
	}
	attachmentSize.value = trim(attachmentSize.value);
	
	var mailSize = document.forms[0].mailSize;
	if (trim(mailSize.value)=="")
	{
		alert("�����뵥���ʼ���С���ƣ�");
		mailSize.focus();    
		return false;
	}

	if (!__isFloat(trim(mailSize.value))||(trim(mailSize.value)<=0))
	{
		alert("�����ʼ���С����Ӧ��Ϊ����������֣�");
		mailSize.focus();    
		return false;
	}
	mailSize.value = trim(mailSize.value);
	
	var mailboxSize = document.forms[0].mailboxSize;
	if (trim(mailboxSize.value)=="")
	{
		alert("�����������С���ƣ�");
		mailboxSize.focus();    
		return false;
	}
	if (!__isFloat(trim(mailboxSize.value))||(trim(mailboxSize.value)<=0))
	{
		alert("�����С����Ӧ��Ϊ����������֣�");
		mailboxSize.focus();    
		return false;
	}
	mailboxSize.value = trim(mailboxSize.value);
	if(parseInt(attachmentSize.value)>parseInt(mailSize.value)){
		alert("�����ʼ���С����Ӧ�ô��ڵ��ڵ���������С���ƣ�");
		return false;
	}
	if(parseInt(mailSize.value)>parseInt(mailboxSize.value)){
		alert("���������С����Ӧ�ô��ڵ��ڵ����ʼ���С���ƣ�");
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
	<html:button onclick="forSave()" name="btn_save" value="����"></html:button>
</div>

<div align="center">
<fieldset class="FieldsetCss" ><legend>������Ϣ</legend>
  <table width="100%" cellspacing="0" class="tblContent">
  		<tr>
		<td class="tdLeft">�ռ���������</td>
		<td class="tdRight">
		<html:radio name="serverType" property="serverType" onclick="onshowdocnote(1)" value="1">POP3��</html:radio>
		</td>
		<td class="tdRight" id="pop3" style = "display:none">
		<html:text name="pop3Server" property="pop3Server" maxlength="80" /><onchange="checkinputNullInDcWork ('pop3Server','pop3Server_span')" /><span id="pop3Server_span" class="xinghaoCss">*</span>
		</td>
		<td class="tdRight">
		<html:radio name="serverType" property="serverType" onclick="onshowdocnote(2)" value="2">IMAP��</html:radio>
		</td>
		<td class="tdRight" id="imap" style="display:none">
		<html:text name="imapServer" property="imapServer" maxlength="80" /><onchange="checkinputNullInDcWork ('imapServer','imapServer_span')" /><span id="imapServer_span" class="xinghaoCss">*</span>
		</td>
		</tr>                    
		<tr>
		<td class="tdLeft"><%=ResourcesFactory.getString("DEF_MAIL_CONFIG.SMTP_SERVER")%>��</td>
		<td valign=top class="tdRight" colspan="4">
		<html:text name="smtpServer" property="smtpServer" maxlength="80" /><onchange="checkinputNullInDcWork ('smtpServer','smtpServer_span')" /><span id="smtpServer_span" class="xinghaoCss">*</span>
		</td>
		</tr>                    
		<tr>
		<td class="tdLeft"><%=ResourcesFactory.getString("DEF_MAIL_CONFIG.ATTACHMENT_SIZE")%>��</td>
		<td valign=top class="tdRight" colspan="4">
		<html:text name="attachmentSize" property="attachmentSize" size="4" maxlength="80" /><onchange="checkinputNullInDcWork ('attachmentSize','attachmentSize_span')" /><span id="attachmentSize_span" class="xinghaoCss">*</span>&nbsp;M
		</td>
		</tr>
		<tr>
		<td class="tdLeft"><%=ResourcesFactory.getString("DEF_MAIL_CONFIG.MAIL_SIZE")%>��</td>
		<td valign=top class="tdRight" colspan="4">
		<html:text name="mailSize" property="mailSize" size="4" maxlength="80" /><onchange="checkinputNullInDcWork ('mailSize','mailSize_span')" /><span id="mailSize_span" class="xinghaoCss">*</span>&nbsp;M
		</td>
		</tr>   
		<tr>
		<td class="tdLeft">���������С���ƣ�</td>
		<td valign=top class="tdRight" colspan="4">
		<html:text name="mailboxSize" property="mailboxSize" size="4" maxlength="80" /><onchange="checkinputNullInDcWork ('mailboxSize','mailboxSize_span')" /><span id="mailboxSize_span" class="xinghaoCss">*</span>&nbsp;M
		</td>		
		</tr>
		<tr>
		<%if(serverType.equals("1")){%>
		<td class="tdLeft">��¼ϵͳʱ���Ƿ������ʼ���</td>
		<%} else {%>
		<td class="tdLeft">��¼ϵͳʱ���Ƿ���δ���ʼ���</td>
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