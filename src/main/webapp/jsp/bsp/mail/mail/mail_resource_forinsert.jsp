
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.waf.ext.service.dict.DictService"%>
<%@ page import="net.mast.commons.exception.BaseRuntimeException"%>
<%@ page import="net.mast.waf.ComponentFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.bsp.mail.TitleServerMapMail"%>
<HTML>
<HEAD>
<TITLE>�ҵ��ʼ�-�½��ʼ�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src='<mast:ui js='grid.js'/>'></script>
<script language="javascript" src='<mast:ui js='calendar.js'/>'></script>
<script language="javascript">
var winArr;
function setHtml(str)
{
  document.frames("dhtmlFrm").document.all.tbContentElement.DocumentHTML=str;

}
function showImg()
{
alert("��֧��");
}
function showAddress(){
	
	winArr = new Array();
	winArr[0]=document.forms[0].sendTo1.value;
	winArr[1]=document.forms[0].sendTo1Desc.value;
	winArr[2]=document.forms[0].sendCc1.value;
	winArr[3]=document.forms[0].sendCc1Desc.value;
    	

	var url="jsp/help.jsp?url=mailaddress.cmd&method=addressMain";
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:510px;dialogHeight:600px");
	if(win==null)return;

	document.forms[0].sendTo1.value=win[0];
	document.forms[0].sendTo1Desc.value=win[1];
	document.forms[0].sendCc1.value=win[2];
	document.forms[0].sendCc1Desc.value=win[3];
}
function checkMailResource(){
		<% float attachmentSizeConfig=0;
       DictService dictService=(DictService)ComponentFactory
					.getBean("DictService");
       Object attachmentSize = dictService.getValueByKey("COMMON_PARMS",
		"MAIL_ATTACHMENT_SIZE");
if ((attachmentSize == null)
				|| (String.valueOf(attachmentSize).equalsIgnoreCase(""))) {
			attachmentSizeConfig=-1;
		}
	else{	
            try {
			attachmentSizeConfig= Float.parseFloat(String.valueOf(attachmentSize)) * 1024 * 1024;
		  } catch (NumberFormatException e) {
			throw new BaseRuntimeException("����������С����ӦΪ����.");
		    }

        }
 %>

    var attachmentSizeConf=<%=attachmentSizeConfig%>;
    var sendTo1 = document.forms[0].sendTo1;
	var sendTo2 = document.forms[0].sendTo2;
	var sendCc2 = document.forms[0].sendCc2;
	var attachmentSizeConfMb=attachmentSizeConf/(1024*1024);
    fileObj=document.all("fileObj");
    if ((trim(sendTo1.value)=="")&&(trim(sendTo2.value)==""))
	{
	alert("�������ռ��ˣ�");
	sendTo2.focus();
	return false;
	}
	//����ʽ�е����ģ�
	if(sendTo2.value.indexOf("��")!=-1){
	alert("��ʹ��Ӣ��;�������ռ��˵�ַ��");
	sendTo2.focus();
	return false;
	}
	if(sendCc2.value.indexOf("��")!=-1){
	alert("��ʹ��Ӣ��;�����������˵�ַ��");
	sendCc2.focus();
	return false;
	}
	var subject = document.forms[0].subject;
	if (trim(subject.value)=="")
	{subject.value="������";
	}
	subject.value = trim(subject.value) ;
   if(byteLength(subject.value) > 200) {
  	  alert('����Ӧ����200���ַ���');
  	  subject.focus();
  	  return false;
  }
	var content = document.forms[0].content;
	if (trim(content.value)=="")
	{
	alert("���������ݣ�");
    //content.focus();
	return false;
	}
	if(content.value.length>16350){
    alert("�ʼ����ݹ���,�������������ݣ����ʵĳ���Ϊ16340���ַ����£�");
    //content.focus();
    return false;
    }
//��鸽�� 
try{
	var rowcount=grid.returnRowCount();    
	for(var i=1;i<=rowcount;i++){
		var attachementSize=fileObj.getFileSize(file); 
		var myfile=file.split("\\"); 
		// �����ԣ��������ⳤ���������77�����֣��յ����ʼ�����Ҽ����渽��ʱ����������롣
		if(byteLength(myfile[myfile.length-1])>140)
		{
			alert("��������ĳ��Ȳ��ܳ���140�ֽ�,����70�����֣�");
			return false;
		}
		if(file.trim()==""){
			alert("������"+i+"�в�ӦΪ�գ�");
			return false;
		}
		if(attachmentSizeConf!=-1)
		  if(attachementSize>attachmentSizeConf){
			alert("����������С���ܳ���Ĭ����������:"+attachmentSizeConfMb+"Mb");
			return false;
		}
	}
}catch(ex){} 
//У�鸽����������
for(var i=1;i<rowcount;i++)
{	var fileI=grid.getCellValue(i,1);
	var myfileI=fileI.split("\\");
	var fileNameI=myfileI[myfileI.length-1];
	for(var j=i+1;j<=rowcount;j++)
	{	
		var fileJ=grid.getCellValue(j,1);
		var myfileJ=fileJ.split("\\");
		var fileNameJ=myfileJ[myfileJ.length-1];
		if(fileNameI==fileNameJ){
		alert("�ϴ��ĸ����벻Ҫ������");
		return false;
		}
		
	}
}
	
    //Ч�鷢�ʼ������ַ����ȷ��
	var splitSendTo = sendTo2.value;
	if(trim(splitSendTo) != ""){
		splitSendTo = sendTo2.value.split(";");
		for(var i = 0; i < splitSendTo.length ;i++){
			if(!__checkEmail(trim(splitSendTo[i]))){
				alert("�ռ��������ַ�����д�����������д��");
				sendTo2.focus();
				return false;
			}
		}
	}
	//Ч�鳭���ʼ������ַ����ȷ��
	var splitCopyTo = sendCc2.value;
	if(trim(splitCopyTo) != ""){
		splitCopyTo = sendCc2.value.split(";");
		for(var i = 0; i < splitCopyTo.length ;i++){
			if(!__checkEmail(trim(splitCopyTo[i]))){
				alert("�����������ַ�����д�����������д��");
				sendCc2.focus();
				return false;
			}
		}
	}
  	return true
}

</script>

</HEAD>
<%
	String serverType = "" + request.getAttribute( "serverType" );
	TitleServerMapMail titleServer = new TitleServerMapMail();
	String sendTitle = titleServer.getSendTitle();
%>
<BODY topmargin="10px" onload="init()">

<html:form  name="frmList"  action="" method="post" enctype="multipart/form-data">
<span id="message"><html:messages/></span>
<bsp:container title="�½��ʼ�" >
	<bsp:containbutton onclick="forSendMail()" name="btn_send_mail" text="�����ʼ�" ></bsp:containbutton>
	<bsp:containbutton onclick="forSaveDraft()" name="btn_save_draft" text="����ݸ�" ></bsp:containbutton>	
<fieldset class="FieldsetCss" style='height=100px'><legend>�ʼ���Ϣ</legend>
  <table width="100%" cellpadding="0" class="tblContent">
		<html:hidden name="accountId" property="accountId"/>
		<html:hidden name="senderName" property="senderName"/>
		<html:hidden name="sendFrom" property="sendFrom"/>
		<html:hidden name="sendTo1" property="sendTo1"/>
		<html:hidden name="sendCc1" property="sendCc1"/>		
		<tr>
		<td class="TdLeft"><span style="text-decoration:underline;cursor:hand" onclick="showAddress()"><%=ResourcesFactory.getString("MAIL_RESOURCE.SEND_TO")%></span>��</td>		
		<td  colspan="3"><html:text name="sendTo1Desc" readonly="true" property="sendTo1Desc" size="60" style="background:#C0E0FD"/></td>
		</tr>
		<tr>
		<td></td>		
		<td class="tdRight" colspan="3"><html:text name="sendTo2" property="sendTo2" size="60"  /><span id="sendTo2_span" class="xinghaoCss">*</span>(���ռ������÷ֺŷָ�)</td>
		</tr>
		
		<tr>
		<td class="TdLeft"><span style="text-decoration:underline;cursor:hand" onclick="showAddress()"><%=ResourcesFactory.getString("MAIL_RESOURCE.SEND_CC")%></span>��</td>
		<td colspan="3"><html:text name="sendCc1Desc" property="sendCc1Desc" readonly="true" size="60" style="background:#C0E0FD"/></td>
		</tr> 
		
		<tr>
		<td></td>
		<td class="tdRight" colspan="3"><html:text name="sendCc2" property="sendCc2" size="60"/>(�೭�������÷ֺŷָ�)</td>
		</tr>                   
                                       
		<tr>
		<td class="TdLeft"><%=ResourcesFactory.getString("MAIL_RESOURCE.SUBJECT")%>��</td>
		<td class="tdRight" colspan="3"><html:text name="subject" property="subject" size="60" maxlength="200" /></td>
		</tr>
		
		<tr>
		<td class="TdLeft" style="width:100px"><%=ResourcesFactory.getString("MAIL_RESOURCE.IS_SCHEDULE")%>��</td>
		<td class="tdRight">
		<html:checkbox name="isSchedule" property="isSchedule" value="1" onclick="change()"/></td>
		<td class="TdLeft" style="width:100px"><%=ResourcesFactory.getString("MAIL_RESOURCE.SCHEDULE_TIME")%>��</td>
		<td class="tdRight" valign="top">
		<date:date name="scheduleTime" property="scheduleTime" position="relative" hastime="true" divname="div1" readonly="true" onchange="change1()" sourceFormat="yyyyMMdd HH:mm" targetFormat="yyyyMMdd HH:mm"/></td>
		</tr>
		
		<tr>
		<td class="TdLeft"><%=ResourcesFactory.getString("MAIL_RESOURCE.PRIORITY")%>��</td>
		<td class="tdRight"><html:select name="priority" property="priority">
		<html:options collection="MAILRESOURCE_PRIORITY_COLLECTION" labelProperty="value" property="key"/>
		</html:select>
		<td class="TdLeft" style="width:100px"><%=ResourcesFactory.getString("MAIL_RESOURCE.IS_RETURN_RECEIPT")%>��</td>
		<td class="tdRight">
		<html:checkbox name="isReturnReceipt" property="isReturnReceipt" value="1"/></td>		
		</tr>
		<%if(serverType.equals("1")){%>
		<tr>
		<td class="TdLeft"><%=ResourcesFactory.getString("MAIL_RESOURCE.IS_SAVE")%>��</td>
		<td class="tdRight" colspan="3"><html:checkbox name="isSave" property="isSave" value="1"/></td>
		</tr>
		<%} else {%>
		<tr>
		<td class="TdLeft">�Ƿ񱣴浽<%=sendTitle%>��</td>
		<td class="tdRight" colspan="3"><html:checkbox name="isSave" property="isSave" value="1"/></td>
		</tr>
		<%}%>
   </table>
</fieldset>

<fieldset class="FieldsetCss" style='height=300px'><legend>�ʼ�����</legend>
	<html:textarea name="content" property="content" style="display:'none';width:100%;height=300px" />
	<div id=divifrm style="visibility:'';width:100%;">
	<iframe src='jsp/bsp/editor/edit.html' frameborder=0 style="width:100%;height=300px;Z-INDEX:1" id="dhtmlFrm"></iframe>
	</div>
</fieldset>
<div style="visibility:'';width:100%;">
<fieldset class="FieldsetCss"><legend>�ʼ�����</legend>
	<table cellspacing='0' class="tblContent">
	<tr>
	<td class="TdRight">
	<html:button name="addRow" value='���Ӹ���' onclick="myAddRow()"></html:button>
	<html:button name="delRow" value='ɾ������' onclick="myDelRow()"></html:button>
	</td>
	</tr>
	</table>
	<grid:grid name="grid" property="attachmentRefList" hasSum="false" type="input" width="100%" height="125" headHeight="22" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false">
	<grid:textCol property="attachFile" name="attachFile" caption='����' index="1" width="450"  style="width:100%" styleClass="default">
	</grid:textCol>
	</grid:grid>	
</fieldset>
</div>
<img  id="loading" src="<%=SkinUtils.getRootUrl(request)+"skins/default/images/loading.gif"%>" width="200" height="50" style="position:absolute;top:100;left:200;display:none;z-index:100">
<div style="display:'none'" >
<OBJECT id="fileObj" CLASSID="CLSID:3DE10180-4375-4269-B3FA-2EC92DCA840F" CODEBASE='<%=SkinUtils.getRootUrl(request)%>' VIEWASTEXT></OBJECT>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function init(){
	change();
	document.forms[0].delRow.focus();
	document.forms[0].btn_send_mail.focus();
	var str = document.forms[0].content.value;
	if (str!=""){
	  setHtml(str);
	}		
	grid.show();
	grid.setCellHtml(0,1,'<input type="file"  name="attachmentRefList.attachFile"  id="attachmentRefList.attachFile"   value="" onkeydown="return false;" style="ime-mode disabled"  oncontextmenu="return false;">');
}
function change(){
  var isSchedule=document.forms[0].isSchedule;
  var btn_send_mail=document.forms[0].btn_send_mail;
  var isSave=document.forms[0].isSave;
  if (isSchedule.checked){
  	btn_send_mail.disabled=true;
  	isSave.checked=true;
  	isSave.disabled=true;
  	document.all("scheduleTime").disabled=false;
  }else{  	
  	btn_send_mail.disabled=false;
  	isSave.checked=true;
  	isSave.disabled=false;
  	document.all("scheduleTime").disabled=true;
  	document.all("scheduleTime").value='';
  }
}
function change1(){
	var isSchedule=document.forms[0].isSchedule;
	if(!isSchedule.checked){
		alert("����ȷ����Ҫ��ʱ������ѡ����ʱ�䣡");
		document.all("scheduleTime").value='';
	}
}
function myAddRow()
{
	var row=grid.addRow();
	var cnt=grid.returnRowCount();
	//grid.setCellHtml(cnt,1,'<input type="file"  name="attachmentRefList.attachFile"  id="attachmentRefList.attachFile"   value="" onkeydown="return false;" style="ime-mode disabled"  oncontextmenu="return false;">');
	grid.rename();
}
function myDelRow()
{
if(grid.getCurrentLine()!=null){
	if(!confirm('<%=ResourcesFactory.getString("query.delconfirm")%>'))return;
   	grid.delRow();
   	}
   else return;
}
function forSendMail(){
  var text = document.frames("dhtmlFrm").document.all("tbContentElement").DOM;
  document.forms[0].content.value=text.body.innerHTML;
  
  if(!checkMailResource()) return; 
  initMessage(); 
  document.all("btn_send_mail").disabled=true;
  document.all("btn_save_draft").disabled=true;
  displayLoading("loading");
  document.forms[0].action ="mailresource.cmd?method=sendMail";
  document.forms[0].submit();	
}
function forSaveDraft(){
  var isSchedule = document.forms[0].isSchedule;
  var scheduleTime = document.all("scheduleTime").value;
  if(isSchedule.checked && scheduleTime==''){
  	alert('��ѡ��ʱ�������ڣ�');
  	return false;
  }
  var subject = document.forms[0].subject;
  if (trim(subject.value)=="")
   {subject.value="������";
   }
   	subject.value = trim(subject.value) ;
   if(byteLength(subject.value) > 200) {
  	  alert('����Ӧ����200���ַ���');
  	  subject.focus();
  	  return false;
  }
  var text = document.frames("dhtmlFrm").document.all("tbContentElement").DOM;
  document.forms[0].content.value=text.body.innerHTML;
  initMessage();
  document.forms[0].action ="mailresource.cmd?method=saveDraft";
  document.forms[0].submit();	
}
function initMessage(){
  if (document.getElementById("message").innerText!=""){
  	document.getElementById("message").innerText=" ";
  }
}
</script>