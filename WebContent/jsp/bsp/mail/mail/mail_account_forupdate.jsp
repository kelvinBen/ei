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
<TITLE>�ҵ��ʼ� - ��������</TITLE>
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
	
	var mailUserId = document.forms[0].mailUserId;
	if (trim(mailUserId.value)=="")
	{
		alert("�������û�����");
		mailUserId.focus();    
		return false;
	}
	if (byteLength(trim(mailUserId.value))>30){
		alert("�û�����������������д��");
		mailUserId.focus();   
		return false;
	}
	//�е��ʼ��������û���Ϊ�����ַ(formail)	
	if ((__isQuoteIn(trim(mailUserId.value)))&&(!__checkEmail(trim(mailUserId.value)))){
		alert("�û�����д������������д��"); 
		mailUserId.focus();   
		return false;
	}
	mailUserId.value = trim(mailUserId.value) ;
	
	var mailPassword = document.forms[0].mailPassword;
	if (trim(mailPassword.value)=="")
	{
	alert("���������룡"); 
	mailPassword.focus();    
	return false;
	}
	mailPassword.value = trim(mailPassword.value) ;		
	
	var mailAddress = document.forms[0].mailAddress;
	if (trim(mailAddress.value)=="")
	{
	alert("�����������ַ��"); 
	mailAddress.focus();   
	return false;
	}
	if (!__checkEmail(trim(mailAddress.value)))
	{
	alert("�����ַ��д������������д��"); 
	mailAddress.focus();    
	return false;
	}
	mailAddress.value = trim(mailAddress.value) ;
	
	var mailUserName = document.forms[0].mailUserName;
	if (trim(mailUserName.value)=="")
	{
		alert("������������");
		mailUserName.focus();    
		return false;
	}
	if (byteLength(trim(mailUserName.value))>80){
		alert("������������������д��");
		mailUserName.focus();   
		return false;
	}
	if (__isQuoteIn(trim(mailUserName.value))){
		alert("������д������������д��"); 
		mailUserName.focus();   
		return false;
	}
	mailUserName.value = trim(mailUserName.value) ;	
	
        var interval=document.forms[0].interval;
	if (!__isNum(trim(interval.value))||(interval.value<=0))
	{
		alert("ʱ����Ӧ��Ϊ�������������");		
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
<bsp:container title="��������" >
	<bsp:containbutton onclick="forVerify()" name="btn_verify" text="������֤" ></bsp:containbutton>
	<bsp:containbutton onclick="forSave()" name="btn_save" text="����" ></bsp:containbutton>	
<span id="message"><html:messages/></span>
<div align="center">
<fieldset class="FieldsetCss">
  <table width="100%" cellspacing="0" class="tblContent">
  		<html:hidden name="accountId" property="accountId"/>
  		<html:hidden name="userId" property="userId"/>
  		<html:hidden name="status" property="status"/>
  		<html:hidden name="inUse" property="inUse"/>
		<tr>
		<td class="tdLeft">�ռ���������</td>
		<td class="tdRight">
		<html:radio name="serverType" property="serverType" onclick="onshowdocnote(1)" value="1">POP3��</html:radio>
		</td>
		<td class="tdRight" id="pop3" style = "display:none">
		<html:text name="pop3Server" property="pop3Server" maxlength="80" /><span id="pop3Server_span" class="xinghaoCss">*</span>
		</td>
		<td class="tdRight">
		<html:radio name="serverType" property="serverType" onclick="onshowdocnote(2)" value="2">IMAP��</html:radio>
		</td>
		<td class="tdRight" id="imap" style="display:none">
		<html:text name="imapServer" property="imapServer" maxlength="80" /><span id="imapServer_span" class="xinghaoCss">*</span>
		</td>
		</tr>
		
		<tr>
		<td class="tdLeft"><%=ResourcesFactory.getString("MAIL_ACCOUNT.SMTP_SERVER")%>��</td>
		<td valign=top class="tdRight" colspan="4"><html:text name="smtpServer" property="smtpServer" size="30" maxlength="80" /><span id="smtpServer_span" class="xinghaoCss">*</span></td>
		</tr>
		
		<tr>
		<td class="tdLeft"><%=ResourcesFactory.getString("MAIL_ACCOUNT.MAIL_USER_ID")%>��</td>
		<td valign=top class="tdRight" colspan="4"><html:text name="mailUserId" property="mailUserId" size="30" maxlength="30" /><span id="mailUserId_span" class="xinghaoCss">*</span></td>
		</tr>   
		
		<tr>		
		<td class="tdLeft"><%=ResourcesFactory.getString("MAIL_ACCOUNT.MAIL_PASSWORD")%>��</td>
		<td valign=top class="tdRight" colspan="4"><html:password name="mailPassword" property="mailPassword" size="30" maxlength="30" /><span id="mailPassword_span" class="xinghaoCss">*</span></td>
		</tr> 
		
		<tr>		
		<td class="tdLeft"><%=ResourcesFactory.getString("MAIL_ACCOUNT.MAIL_ADDRESS")%>��</td>
		<td valign=top class="tdRight" colspan="4"><html:text name="mailAddress" property="mailAddress" size="30" maxlength="80" /><span id="mailAddress_span" class="xinghaoCss">*</span></td>
		</tr> 
		
		<tr>
		<td class="tdLeft"><%=ResourcesFactory.getString("MAIL_ACCOUNT.MAIL_USER_NAME")%>��</td>
		<td valign=top class="tdRight" colspan="4"><html:text name="mailUserName" property="mailUserName" size="30" maxlength="80" /><span id="mailUserName_span" class="xinghaoCss">*</span></td>
		</tr>                              
   </table>

</fieldset>
<fieldset class="FieldsetCss" ><legend>��������</legend>
  <table width="100%" cellspacing="0" class="tblContent">
		<tr>
		<td class="tdLeft" colspan="2">
		<html:checkbox name="isAutoReceive" property="isAutoReceive" onclick="change()" value="1"/>
		ÿ��
		<html:text name="interval" property="interval" size="2" maxlength="8" />
		�����Զ�������ʼ�(���µ�½��Ч)
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