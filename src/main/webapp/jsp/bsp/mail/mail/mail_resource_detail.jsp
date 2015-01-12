<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.bsp.util.MatrixHref"%>
<HTML>
<HEAD>
<TITLE>邮件信息表修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src='<mast:ui js='grid.js'/>'></script>
<script language="javascript">
function setHtml(str)
{
  document.frames("dhtmlFrm").document.all.tbContentElement.DocumentHTML=str;

}
function showImg()
{
alert("不支持");
}
function checkMailResource(){
	var subject = document.forms[0].subject;
	if (trim(subject.value)=="")
	{subject.value="无主题";
	}
	subject.value = trim(subject.value) ;
	
	var content = document.forms[0].content;
	if (trim(content.value)=="")
	{
	alert("请输入内容！");
	content.focus();
	return false;
	}
	content.value = trim(content.value) ;     
  	return true
}

</script>
</HEAD>
<%
	String resourceId = String.valueOf(request.getAttribute("resourceId"));
	String mailType = String.valueOf(request.getAttribute("mailType"));
	String isReceipt = String.valueOf(request.getAttribute("isReceipt"));
	String mailStatus= String.valueOf(request.getAttribute("mailStatus"));
	String mailType1="";
	if(request.getAttribute("mailType1")!=null)
	{
		mailType1 = String.valueOf(request.getAttribute("mailType1"));
	}
	
	//记忆查询条件
	String condtion = "";
	if(request.getAttribute("condtion")!=null)
	{
		condtion = (String)request.getAttribute("condtion");
	}
	//记忆查询条件
	
	
	String fullName = (String)request.getAttribute("fullName");
	String serverType = (String)request.getAttribute("serverType");
	String ishtml = (String)request.getAttribute("ishtml");
	if(ishtml==null) ishtml="";
%>
<BODY topmargin="10px">
<span id="message"><html:messages/></span>
<html:form  name="frmList"  action="" method="post" enctype="multipart/form-data">
<bsp:container title="邮件明细" >
<%
	if(mailType.equals("0") || mailType.equals("4") ||mailType.equals("5"))
	{
%>
<bsp:containbutton onclick="forBack()" name="btn_send_mail" text="回复" ></bsp:containbutton>
<bsp:containbutton onclick="forBackALL()" name="btn_send_mail" text="全部回复" ></bsp:containbutton>
<%

	}
	if(!mailType.equals("3")&&!mailType.equals("1")){
%>
<bsp:containbutton onclick="forZhuanSendMail()" name="btn_send_mail" text="转发" ></bsp:containbutton>
<%
	}
	if(!mailType.equals("4")){
%>
<bsp:containbutton onclick="forDel()" name="btn_send_mail" text="删除" ></bsp:containbutton>
<%
	}
%>
<bsp:containbutton onclick="forThoroughDelete()" name="btn_send_mail" text="彻底删除" ></bsp:containbutton>
<%if(serverType.trim().equals("2")){%>
<bsp:containbutton onclick="moveTo()" name="btn_move" text="移动" ></bsp:containbutton>
<%}%>
<bsp:containbutton onclick="forReturn()" name="btn_send_mail" text="返回" ></bsp:containbutton>

<html:hidden name="fullName" value="<%=fullName%>"/>
<html:hidden name="serverType" value="<%=serverType%>"/>
<fieldset class="FieldsetCss"><legend>邮件信息</legend>
  <table width="100%" cellpadding="0" cellspacing="0"  border="0" class="tblcontent">
		<input type="hidden" name="resourceId" value="<%=resourceId%>" />
		<input type="hidden" name="mailType" value="<%=mailType%>" />
		<input type="hidden" name="mailType1" value="<%=mailType1%>" />
		
		<!--记忆查询条件-->
		<input type="hidden" name="condtion" value="<%=condtion%>"> 
		<!--记忆查询条件-->
  
		<html:hidden name="accountId" property="accountId"/>
		<html:hidden name="senderName" property="senderName"/>
		<html:hidden name="sendFrom" property="sendFrom"/>
		<html:hidden name="sendTime" property="sendTime"/>
		<html:textarea name="content" property="content" style="display:'none';width:100%;height=500px"></html:textarea>
		
		<tr>
		<td class="TdLeft" width="30%"><%=ResourcesFactory.getString("MAIL_RESOURCE.SUBJECT")%>：</td>
		<td class="tdRight" width="70%"><html:hidden name="subject" property="subject" write="true"/></td>
		</tr>
		
		<tr>
		<td class="TdLeft" width="30%"><%=ResourcesFactory.getString("MAIL_RESOURCE.SENDER_NAME")%>：</td>
		<td class="tdRight" width="70%"><html:hidden name="senderName" property="senderName" write="true"/></td>
		</tr>
		
		<tr>
		<td class="TdLeft" width="30%"><%=ResourcesFactory.getString("MAIL_RESOURCE.SEND_TIME")%>：</td>
		<td class="tdRight"width="70%"><html:hidden name="sendTime" property="sendTime" write="true"/></td>
		</tr>
		
		<tr>
		<td class="TdLeft" width="30%"><%=ResourcesFactory.getString("MAIL_RESOURCE.SEND_TO")%>：</td>
		<td class="tdRight" width="70%"><html:textarea rows="2" readonly="true" style="background:#EAF4FD;border:1 solid" cols="60" name="sendTo2" property="sendTo2"/></td>
		</tr>
		
		<tr>
		<td class="TdLeft" width="30%"><%=ResourcesFactory.getString("MAIL_RESOURCE.SEND_CC")%>：</td>
		<td class="tdRight"width="70%"><html:textarea rows="2" readonly="true" style="background:#EAF4FD;border:1 solid" cols="60" name="sendCc2" property="sendCc2"/></td>
		</tr>

         
   </table>
</fieldset>
<fieldset class="FieldsetCss" style='height=300px'><legend>邮件内容</legend>
	<div id=divifrm style="visibility:'';width:100%;">
	
	<%if(ishtml.equals("0")){ %>
		<html:textarea name="content" property="content" readonly="true" style="width:100%;height=500px"></html:textarea>
	<%} else  {%>
		<span id="htmlContent" style="height:300px;overflow:auto;width:100%"></span>
	<%} %>
	</div>
</fieldset>
<div style="visibility:'';width:100%;">
<fieldset class="FieldsetCss"><legend>邮件附件</legend>
	<grid:grid name="grid1" property="attachmentRefList1" hasSum="false" type="edit" width="100%" height="125" headHeight="22" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false">
	<grid:hideCol property="fileId" name="fileId" caption='附件' index="0" width="60"  style="width:100%" styleClass="default">
	</grid:hideCol>	
	<grid:textCol defaultValue="" name="url" caption='附件' index="1" width="60"  style="width:100%" styleClass="default">
	</grid:textCol>
	<grid:hideCol property="fileName" name="fileName" caption='附件' index="2" width="60"  style="width:100%" styleClass="default">
	</grid:hideCol>
	</grid:grid>	
</fieldset>
</div>
<!--李向阳增加-->
<input type="hidden" name="net.mast.web.taglib.util.GRIDLENGTH" id="net.mast.web.taglib.util.GRIDLENGTH" value="0">
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
init();
function init(){
	var str = document.forms[0].content.value;
	var fullName=document.all("fullName").value;
	var resourceId = document.all("resourceId").value;
	<%if(!ishtml.equals("0")){ %>
		document.getElementById("htmlContent").innerHTML=str;
	<%}	%>
	grid1.show();
	var serverType = document.all("serverType").value;
	if(serverType==1){
		for (var i=1;i<=grid1.returnRowCount();i++){
			grid1.setCellHtml(i,2,'<span title='+grid1.getCellValue(i,3)+' nowrap>'+getHrefNoBlank('<%=MatrixHref.getUrl("DocContent")%>',transMatrix(grid1.getCellValue(i,1),grid1.getCellValue(i,3)))+'</span>');
		}
	} else if(serverType==2){
		for (var i=1;i<=grid1.returnRowCount();i++){
			var fileId = grid1.getCellValue(i,1);
			var fileName = grid1.getCellValue(i,3);
			var url = "<a href=\"mailresource.cmd?method=detailAttach&fileId="+fileId+"&resourceId="+resourceId+"&fileName="+fileName+"\">"+fileName+"</a>";
			grid1.setCellHtml(i,2,'<span title='+fileName+' nowrap>'+url+'</span>');
		}
	}
	


}
function forSendMail(){
  var text = document.frames("dhtmlFrm").document.all("tbContentElement").DOM;
  document.forms[0].content.value=text.body.innerHTML;
  
  if(!checkMailResource()) return;   
  document.forms[0].action ="mailresource.cmd?method=sendMail";
  document.forms[0].submit();
}
function forThoroughDelete(){
if (!confirm("将要彻底删除选中的邮件，此操作不可恢复，要继续吗？")) {
   	     return false;
   	     }  
   var mailSt=<%=mailStatus%>;
   if(mailSt==null)
	  document.forms[0].action ="mailresource.cmd?method=thoroughDeleteDetail";    
	else
		document.forms[0].action ="mailresource.cmd?method=thoroughDeleteDetail&mailStatus=0";	
  document.forms[0].submit();	
}
function forDel(){
if (!confirm("将要删除选中的邮件，要继续吗？")) {
   	     return false;
   	     }  
   	     
   var mailSt=<%=mailStatus%>;
  if(mailSt==null)//////////////////////////////////////////
  		document.forms[0].action ="mailresource.cmd?method=deleteDetail";    
  else
  		document.forms[0].action ="mailresource.cmd?method=deleteDetail&mailStatus=0"; 
  		
  document.forms[0].submit();	
}

function forReturn()
{	var mailType = document.forms[0].mailType.value;
	var mailType1 = document.forms[0].mailType1.value;
	var mailSt=<%=mailStatus%>;
	var fullName = document.all("fullName").value;
	var serverType = document.all("serverType").value;
	if(mailType1=="-1")
	{
		document.forms[0].action ="mailresourcegeneryquery.cmd?mailType=-1&condtion=<%=condtion%>";    
  		document.forms[0].submit();	
  		return;
	}
	var tempUrl = "";
	switch (mailType){
	case "0" :
	{	
		
		if(mailSt==null)////////////////////////////
			tempUrl="inboxmailquery.cmd?mailType=0";
		else
			tempUrl="inboxmailquery.cmd?mailType=0&mailStatus=0";
	}
	break;
	case "1" :
	tempUrl="sendmailquery.cmd?mailType=1&fullName="+fullName+"&serverType="+serverType;
	break;
	case "2" :
	tempUrl="alreadysendmailquery.cmd?mailType=2&fullName="+fullName+"&serverType="+serverType;
	break;
	case "3" :
	tempUrl="draftmailquery.cmd?mailType=3&fullName="+fullName+"&serverType="+serverType;
	break;
	case "4" :
	tempUrl="garbagemailquery.cmd?mailType=4&fullName="+fullName+"&serverType="+serverType;
	break;
	case "5" :
	tempUrl="custommailquery.cmd?mailType=5&fullName="+fullName+"&serverType="+serverType;
	break;
	case "6" :
	tempUrl="mailresourcegeneryquery.cmd?mailType=-1&condtion=<%=condtion%>";
	break;
	}

	document.forms[0].action =tempUrl;    
  	document.forms[0].submit();	
}
function forZhuanSendMail()
{
	var mailSt=<%=mailStatus%>;
	if(mailSt==null)/////////////////////////////
		document.forms[0].action ="mailresource.cmd?method=fortransmit";  
	else
		document.forms[0].action ="mailresource.cmd?method=fortransmit&mailStatus=0";   
  	document.forms[0].submit();	
}
function forBack()
{	var mailSt=<%=mailStatus%>;
	if(mailSt==null)///////////////////////////
		document.forms[0].action ="mailresource.cmd?method=forback";    
	else
		document.forms[0].action ="mailresource.cmd?method=forback&mailStatus=0"; 
		
  	document.forms[0].submit();
}
function forBackALL()
{	
	var mailSt=<%=mailStatus%>;
	if(mailSt==null)////////////////////////
		document.forms[0].action ="mailresource.cmd?method=forback&sign=1";   
	else
		 document.forms[0].action ="mailresource.cmd?method=forback&sign=1&mailStatus=0"; 
		 
  	document.forms[0].submit();
}
function moveTo(){
	var fullName = document.all("fullName").value;
	var resourceId = document.all("resourceId").value;
	var mailSt=<%=mailStatus%>;
	var url = "jsp/help.jsp?url=mailresource.cmd&method=mailFolderList&fullName="+fullName;
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
	if(win==null)return;
	var folderFullName = win[0];
	if(mailSt==null)
		document.forms[0].action ="mailresource.cmd?method=copyToFolder&folderFullName="+folderFullName+"&resourceId="+resourceId;
	else
		document.forms[0].action ="mailresource.cmd?method=copyToFolder&folderFullName="+folderFullName+"&resourceId="+resourceId+"&mailStatus=0";
	document.forms[0].submit();
}
</script>