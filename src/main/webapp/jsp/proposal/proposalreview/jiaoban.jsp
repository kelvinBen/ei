<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@page import="java.util.*"%>
<%@page import="net.mast.util.DateUtil"%>
<%
String app=request.getContextPath();
String rejiaoban=request.getParameter("method");
BspInfo pfUser=GetBspInfo.getBspInfo();
String registerdept=pfUser.getCorporation().getOrganAlias();
ProposalBuziView proposalBuzi=(ProposalBuziView)request.getAttribute("proposalBuzi");
if(proposalBuzi==null)
	proposalBuzi=(ProposalBuziView)request.getAttribute("html.data");
%>
<%@page import="org.proposal.proposaluser.view.ProposalUserView"%>
<%@page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@page import="net.mast.bsp.permit.context.BspInfo"%>
<%@page import="org.proposal.proposalbuzi.view.ProposalBuziView"%>
<%@page import="org.proposal.joint.view.ProposalJointView"%>
<%@page import="org.proposal.attachment.view.ProposalAttachmentView"%>
<HTML>
<HEAD>
<TITLE>�᰸����</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="JavaScript" src="<mast:ui js='validate.js'/>"  ></script>
<script language="JavaScript" src="<mast:ui js='attach.js'/>"  ></script>
<script language="javascript" type="text/javascript" src="<mast:ui js='calendar.js'/>"></script>

<!--media=print ������Կ����ڴ�ӡʱ��Ч-->
<STYLE media=print>
.noprint {
	DISPLAY: none
}

#Shadow1 {
	MARGIN: auto;
	WIDTH: 630px
}

#boxCss {
	BORDER-RIGHT: #cccccc 0px solid;
	PADDING-RIGHT: 30px;
	BORDER-TOP: #cccccc 0px solid;
	PADDING-LEFT: 30px;
	FONT-SIZE: 14px;
	PADDING-BOTTOM: 15px;
	BORDER-LEFT: #cccccc 0px solid;
	PADDING-TOP: 20px;
	BORDER-BOTTOM: #cccccc 0px solid
}

#title1 {
	FONT-SIZE: 24px
}

#wy {
	FONT-SIZE: 22px
}

.PageNext {
	PAGE-BREAK-AFTER: always
}

#line {
	DISPLAY: none
}
</STYLE>

<STYLE type=text/css>
BODY {
	MARGIN: 0px;
	BACKGROUND-COLOR: #f1f1f1
}

.Shadow1 {
	MARGIN: auto;
	WIDTH: 920px
}

.boxCss {
	BORDER-RIGHT: #cccccc 1px solid;
	PADDING-RIGHT: 80px;
	BORDER-TOP: #cccccc 1px solid;
	PADDING-LEFT: 80px;
	FONT-SIZE: 16px;
	MARGIN-BOTTOM: 4px;
	PADDING-BOTTOM: 40px;
	BORDER-LEFT: #cccccc 1px solid;
	MARGIN-RIGHT: 4px;
	PADDING-TOP: 60px;
	BORDER-BOTTOM: #cccccc 1px solid;
	BACKGROUND-COLOR: #ffffff
}

.title1 {
	FONT-WEIGHT: bold;
	FONT-SIZE: 30px;
	PADDING-BOTTOM: 20px;
	COLOR: black;
	TEXT-ALIGN: center
}

.line {
	BORDER-TOP: black 3px solid;
	MARGIN-BOTTOM: 40px;
	OVERFLOW: hidden;
	BORDER-BOTTOM: black 1px solid;
	HEIGHT: 2px
}

P {
	LINE-HEIGHT: 200%
}

.wy {
	FONT-WEIGHT: bold;
	FONT-SIZE: 26px;
	PADDING-BOTTOM: 10px;
	TEXT-ALIGN: center
}
</STYLE>
<LINK href="<%=app %>/jsp/proposal/css/css1.css" type=text/css	rel=stylesheet>

<SCRIPT language=JavaScript>

 function   beforePrint()  
  {  
  document.all.content.style.display   =   "none";  
   document.all.contentTR.style.display   =   "none";  
  document.all.divContent.innerText   =   document.all.content.value;  
  document.all.headTD.innerHTML   =   document.all.head.innerHTML; 
  document.all.head.style.display   =   "none";  
  document.all.headTR.style.display   =   "";  
   
  }  
  //��ӡ֮�����ص�����Ϣ����ʾ����  
  function   afterPrint()  
  {  
  document.all.content.style.display   =   "inline";  
  document.all.headTD.innerHTML   =   ""; 
  document.all.contentTR.style.display   =   "";
  document.all.divContent.innerText   =   "";  
  document.all.head.style.display   =   "inline";  
  document.all.headTR.style.display   =   "none";  
  }

function printT(){
	if(confirm("ȷ��Ҫ��ӡ��")){
		beforePrint();
		window.print();
		afterPrint();
	}
}
</SCRIPT>

<META content="MSHTML 6.00.2900.5945" name=GENERATOR>
</HEAD>
<BODY
	onload="document.getElementById('content').style.height=document.getElementById('content').scrollHeight;">
 <form name="listForm" method="post" style="margin: px;">
<input type="hidden" name="proposalid" value="<html:value property="id"/>">
<html:hidden name="id" property="id"></html:hidden>
<DIV class=Shadow1 id=Shadow1 style="MARGIN-TOP: 10px">
<DIV class=boxCss id=boxCss style="MARGIN: 0px">
<DIV id=head>
<DIV class=title1 id=title1>��Э<html:value property="areaname" />��<html:value
	property="period" />��ίԱ���<html:value property="meeting" />�λ���</DIV>
<DIV class=wy id=wy>
<TABLE cellSpacing=0 cellPadding=0 border=0>
	<TBODY>
		<TR>
			<TD>ί Ա �� ��</TD>
			<TD>(��&nbsp;<html:value property="caseno" />&nbsp;��)</TD>
		</TR>
	</TBODY>
</TABLE>
</DIV>
</DIV>
<DIV class=line id=line></DIV>
<TABLE style="BORDER-COLLAPSE: collapse" borderColor=#d7d7d7
	cellSpacing=0 cellPadding=0 width="100%" border=1>
	<TBODY>
		<TR id=headTR style="DISPLAY: none" height=32>
			<TD id=headTD
				style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 5px; PADDING-TOP: 10px"
				colSpan=4></TD>
		</TR>
		<TR height=32>
			<TD align=middle width="16%" bgColor=#f4f4f4>�᰸��Ŀ</TD>
			<TD
				style="PADDING-RIGHT: 0px; PADDING-LEFT: 4px; PADDING-BOTTOM: 8px; PADDING-TOP: 8px"
				colSpan=3>&nbsp;&nbsp;<html:value property="title" /></TD>
		</TR>
		<TR>
			<TD align=middle width=120 bgColor=#f4f4f4>�������</TD>
			<TD
				style="PADDING-RIGHT: 0px; PADDING-LEFT: 4px; PADDING-BOTTOM: 8px; PADDING-TOP: 8px"
				colSpan=3>&nbsp;&nbsp;<html:label name="type" property="type"
				collection="PROPOSALBUZI_TYPE_COLLECTION" labelProperty="value"
				labelKey="key" /></TD>
		</TR>
		<TR>
			<TD
				style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px"
				colSpan=4>
			<TABLE
				style="PADDING-RIGHT: 4px; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; LINE-HEIGHT: normal; PADDING-TOP: 4px; BORDER-COLLAPSE: collapse"
				borderColor=#97bddd cellSpacing=0 cellPadding=0 width="100%"
				border=1>
				<TBODY>
					<TR
						style="FONT-WEIGHT: bold; FONT-SIZE: 14px; BACKGROUND-COLOR: #f1f9ff">
						<TD noWrap align=middle>���&nbsp;&nbsp;</TD>
						<TD noWrap align=middle>ίԱ����</TD>
						<TD noWrap align=middle>���</TD>
						<TD noWrap align=middle>��ϵ�绰</TD>
						<TD align=middle>������λ</TD>
						<TD align=middle>ְ��</TD>
					</TR>
					<% List<ProposalJointView> proposalJointList=proposalBuzi.getProposalJointList();
  for(int i=0;i<proposalJointList.size();i++){
	  ProposalJointView s=proposalJointList.get(i);	 
	  %>
					<TR>
						<TD align=middle><%=s.getNo()%></TD>
						<TD align=middle><%=s.getName()%></TD>
						<TD align=middle><%=s.getConstituency()%></TD>
						<TD align=middle><%=s.getPhone() %></TD>
						<TD align=middle><%=s.getDept()%></TD>
						<TD align=middle><%=s.getDuty()%></TD>
					</TR>
					<%} %>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
		<TR>
			<TD align=middle bgColor=#f4f4f4>�᰸����</TD>
			<TD
				style="PADDING-RIGHT: 0px; PADDING-LEFT: 4px; PADDING-BOTTOM: 8px; PADDING-TOP: 8px"
				colSpan=3>&nbsp;&nbsp;<html:label name="category"
				property="category" collection="PROPOSALBUZI_CATEGORY_COLLECTION"
				labelProperty="value" labelKey="key" /></TD>
		</TR>
		<TR>
			<TD colSpan=4>
			<TABLE width="100%">
				<TBODY>
					<TR>
						<TD
							style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px"
							align=middle width="9%" bgColor=#f4f4f4>
						<DIV style="WIDTH: 16px; LINE-HEIGHT: 24px">������</DIV>
						</TD>
          <TD 
          style="PADDING-RIGHT: 4px; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; PADDING-TOP: 4px" 
          width="41%">
          <html:value property="proposalReview.reviewcomment" />
          </TD>						

						<TD align=middle width="9%" bgColor=#f4f4f4>
						<DIV style="WIDTH: 16px; LINE-HEIGHT: 24px">�������</DIV>
						</TD>
						<TD
							style="PADDING-RIGHT: 4px; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; PADDING-TOP: 4px"
							width="41%">
						<DIV>
						����������ѡ�����쵥λ��Э�쵥λ��
						</DIV>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
		<TR>
			<TD
				style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 6px; PADDING-TOP: 6px"
				align=middle bgColor=#f4f4f4 colSpan=4>�᰸����</TD>
		</TR>
		<TR id=contentTR>
			<TD style="PADDING-TOP: 5px" colSpan=4>
			<DIV style="LINE-HEIGHT: 32px; TEXT-ALIGN: center"><TEXTAREA
				id=content
				style="BORDER-RIGHT: 1px; BORDER-TOP: 1px; FONT-SIZE: 16px; OVERFLOW: hidden; BORDER-LEFT: 1px; WIDTH: 94%; WORD-BREAK: break-all; LINE-HEIGHT: 32px; BORDER-BOTTOM: 1px"
				readOnly><html:value property="content" /></TEXTAREA></DIV>
			</TD>
		</TR>
		<TR class=noprint height=30>
			<TD align=middle width=120 bgColor=#f4f4f4>��ظ���</TD>
			<TD	style="PADDING-RIGHT: 0px; PADDING-LEFT: 4px; PADDING-BOTTOM: 8px; PADDING-TOP: 8px"
				colSpan=3>
			    	<table>
   		 <%   
   		  List<ProposalAttachmentView> att = proposalBuzi.getAttList();
   		  for(int n=0;n<att.size();n++){
   			ProposalAttachmentView attach = (ProposalAttachmentView)att.get(n);
%>
<tr style="line-height: 20px;">
<td style="font-size: 15px;" align="left">
&nbsp;&nbsp;<a href="#" class="linkh" onClick="downloadAtt('<%=attach.getFilepath()%>')"><%=attach.getFilename()%></a>&nbsp;&nbsp;&nbsp;
</td>
</tr>
<%} %>
   	</table>	
				</TD>
		</TR>
	</TBODY>
</TABLE>

<div id = "czid">
	 <table width="100%" border="1" style="border-collapse:collapse;line-height:30px" bordercolor="#9DBAD1" cellpadding="0" cellspacing="0">
	   			<tr height="30">
				   <td height="30" colspan="2" align="left" class="td13" style="font-size:18px;">&nbsp;&nbsp;<strong>�������</strong></td>
				   </tr>
				   <tr>
				   <td colspan="2">

				   <div style="margin-bottom: 10px;">
				   		 <div style="text-align: center;">
 <table  width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#cccccc" style="border-collapse:collapse; line-height:30px; ">
  <tr>
    <td   align="right" bgcolor="#F8F8F8">���죺</td>
    <td   align="left" style="padding: 0 2px 0 2px">
    <input name="processdeptlist" readonly="readonly" type="text" class="input1" value='<html:value property="processdeptlist" />' id="processdeptlist"  size="30" cn_name="���쵥λ" nullable="no" datatype="text"  maxsize="255" onclick="selzb()">
	<input type="hidden" id="processdeptIDlist" name="processdeptIDlist"  value='<html:value property="processdeptIDlist" />'>
						</td>
	 <td  align="right" bgcolor="#F8F8F8">����ʱ�ޣ�</td>
    <td width="40%" align="left" style="padding: 0 2px 0 2px">
    <input type="text" size="10" name="zbdealedtimelimit" id="zbdealedtimelimit" value="<html:value property="zbdealedtimelimit" format="yyyy-MM-dd" />" nullable="no" onblur="displayDays(this,'zbdealeddays','');" datatype="text" cn_name="����ʱ��"  style="text-align: center;border:1px solid #fff; background-color:#f7f7f7; border-bottom:1px solid #555;font-size:14px; height:18px;" />
֮ǰ�򽻰��    <input type="text" size="4" name="zbdealeddays" id="zbdealeddays" style="text-align: center;border:1px solid #fff; background-color:#f7f7f7; border-bottom:1px solid #555; font-size:14px; height:18px" nullable="no" datatype="integer" cn_name="����ʱ��" onchange="displayDays(this,'zbdealedtimelimit','dateStr')"/>��
�����    </td>					
     
   </tr>
   
  <tr>
    <td align="right" bgcolor="#F8F8F8">Э�죺</td>
    <td  align="left"  style="padding: 0 2px 0 2px"> 
    <input name="xbprocessdeptlist" readonly="readonly" type="text" class="input1" id="xbprocessdeptlist" value='<html:value property="xbprocessdeptlist" />'  size="30" cn_name="Э�쵥λ"  datatype="text" value="" maxsize="255" onclick="selxb();">
						<input type="hidden" id="xbprocessdeptIDlist" name="xbprocessdeptIDlist" value='<html:value property="xbprocessdeptIDlist" />'>
						</td>
	 <td   align="right" bgcolor="#F8F8F8">Э��ʱ�ޣ�</td>
    <td   align="left" style="padding: 0 2px 0 2px">
   		<input type="text" size="10" name="xbdealedtimelimit" id="xbdealedtimelimit" value='<html:value property="xbdealedtimelimitstr" />' onblur="displayDays(this,'xbdealeddays','');" nullable="yes" datatype="text" cn_name="Э��ʱ��"  style="text-align: center;border:1px solid #fff; background-color:#f7f7f7; border-bottom:1px solid #555;font-size:14px; height:18px;"/>
֮ǰ�򽻰�� <input type="text" size="4" name="xbdealeddays" id="xbdealeddays" style="text-align: center;border:1px solid #fff; background-color:#f7f7f7; border-bottom:1px solid #555; font-size:14px; height:18px" nullable="yes" datatype="integer" cn_name="Э��ʱ��" onchange="displayDays(this,'xbdealedtimelimit','dateStr')"/>��
�����    </td>
   </tr>
  
  <tr>
    <td align="right" bgcolor="#F8F8F8">��ע��</td>
    <td colspan="3"  align="left" style="padding-bottom: 5px;"> &nbsp;<textarea name="registercomment" id="registercomment" rows="5" cols="50" style="width: 95%" cn_name="��ע"  datatype="text"  maxsize="255"></textarea></td>
    </tr>
    <tr>
    <td align="right" bgcolor="#F8F8F8">����ʱ�䣺</td>
    <td  align="left"> 
    <input type="text" readonly="readonly" name="registerdate" id="registerdate" size="30"  nullable="no" datatype="text" cn_name="����ʱ��" value="<%=DateUtil.getCursorDate("yyyy-MM-dd") %>"   style="BORDER: #cccccc 1px solid; BACKGROUND-COLOR: #F4F4F4; font-size:14px; height:18px"/>
    </td>
     <td align="right" bgcolor="#F8F8F8">���쵥λ��</td>
    <td align="left"> 
     <input type="text"  name="registerdept" id="registerdept" value="<%=registerdept %>" size="30" nullable="no" datatype="text" cn_name="���쵥λ"  style="BORDER: #cccccc 1px solid; BACKGROUND-COLOR: #F4F4F4; font-size:14px; height:18px"/>
<html:hidden name="registeroruserid" value="<%=pfUser.getUserId() %>" /> <!-- ������ -->
<html:hidden name="registeror" value="<%=pfUser.getUserName() %>" />

    </td>
   
  </tr>
    
  </table></div>

        <html:hidden name="id" property="proposalReview.id" ></html:hidden>
        <html:hidden name="reviewor" property="proposalReview.reviewor" />
        <html:hidden name="revieworid" property="proposalReview.revieworid" />
        <html:hidden name="superior" property="proposalReview.superior" />
        <html:hidden name="superiorid" property="proposalReview.superiorid" />
<DIV style="MARGIN-TOP: 30px; TEXT-ALIGN: center">
<TABLE>
  <TBODY>
  <TR>
				<td>
				<% if("rejiaoban".equals(rejiaoban)){ %>
				<input style="width: 80px;height: 30px;font-size: 16px" type="button"  value="���½���" onClick="sub('proposalbuzi.cmd?method=rejiaoban')"/>
				 <%}else{ %>
				<input style="width: 80px;height: 30px;font-size: 16px" type="button"  value="��&nbsp;��" onClick="sub('proposalbuzi.cmd?method=jiaoban')"/>
				 <%} %>
				 </td>
    <TD><INPUT style="FONT-SIZE: 16px; HEIGHT: 30px" onclick=window.close() type=button value=��&nbsp;��> 
    </TD></TR></TBODY></TABLE></DIV></DIV></DIV></DIV></BODY>
</form>
</HTML>

<script language="JavaScript">
    
  function sub(path){
	try{
		if(validateAll(document.listForm)){
			var xbDeptIds = document.getElementById('xbprocessdeptIDlist').value;
			var zbDeptIds = document.getElementById('processdeptIDlist').value;
			if(xbDeptIds!=null&&xbDeptIds!=""){
				if(!compare(xbDeptIds,zbDeptIds)){
					return;
				}
			}
			document.listForm.action = path;
			document.listForm.submit();
		}
	}catch(e){
		alert(e.description);
	}
	}

	function displayDays(el,targetId,flag){
	  if(el.value!="")
		if(flag=="dateStr"){
			if(!isInteger(el.value)){
				alert("ʱ������Ϊ����������������д��");
				return;
			}
			var dateStr = getDateStr(el.value);
			document.getElementById(targetId).value=dateStr;
		}else{
			var days = getDays(el.value);
			document.getElementById(targetId).value=days;
		}
	}
	//��ȡʱ������
	function getDays(dateStr){
		var date = getDate(dateStr);
		var registerDateStr = document.getElementById("registerdate").value; 
		var today = null;
		if(registerDateStr==""){
			today = new Date();
		}else{
			today = getDate(registerDateStr);
		}
		today = new Date(today.getYear(),today.getMonth(),today.getDate());
		var days = Math.round((date.getTime()-today.getTime())/(24*3600*1000));
		return days;
	}	
	
	function getDate(dateStr){
	   if(!IsValidDate(dateStr))
	   	  return false;
		var arr = dateStr.split("-",3);
		var year = arr[0];
		var month = arr[1];
		var day = arr[2];
		var date = new Date(year,month-1,day);
		return date;
	}	
	//��ȡʱ�޵��ַ�����ʾ����yyyy-MM-dd
	function getDateStr(days){
		var registerDateStr = document.getElementById("registerdate").value; 
		var today = null;
		if(registerDateStr==""){
			today = new Date();
		}else{
			today = getDate(registerDateStr);
		}
		today.setTime(today.getTime()+days*3600*24*1000);
		var year = today.getYear();
		var month = today.getMonth();
		var day = today.getDate();
		if((month+1)<10){
			month = "0"+(month+1);
		}
		if(day<10){
			day = "0"+day;
		}
		return year+"-"+month+"-"+day;
	}
	
	//�޸Ľ�������ʱ�������Զ�����ʱ������
	function updateDays(){
		var zbdateStr = document.getElementById("zbdealedtimelimit").value; 
		if(zbdateStr!=""){
			document.getElementById("zbdealeddays").value = getDays(zbdateStr);
		}
		var xbdateStr = document.getElementById("xbdealedtimelimit").value; 
		if(xbdateStr!=""){
			document.getElementById("xbdealeddays").value = getDays(xbdateStr);
		}
	}			
  function compare(xbDeptIds,zbDeptIds){//�ж��Ƿ����ظ���
  	var xb = xbDeptIds.split(',');
  	var zb = zbDeptIds.split(',');
  	for(var i=0;i<zb.length;i++){
  		for(var j=0;j<xb.length;j++){
  			if(zb[i]==xb[j]){
  				alert("Э�쵥λ�����쵥λ�ظ�,������ѡ��Э�쵥λ��");
  				document.getElementById('xbprocessdeptlist').focus();
  				return false;
  			}
  		}
  	}
  	return true;
  }
  
  function selOrg(organizationId,ouType,multiselect,ctx_ouId,ctx_ouname){
  	select_organization(organizationId,ouType,multiselect,ctx_ouId,ctx_ouname);
  }
	
//���ظ���
function downloadAtt(url){
 url="<%=app%>/"+url;
window.open(url);
}
//ѡ������
function selzb(){
   var cmdUrl="stru.cmd&method=getSelectRoot&rootId=1&organType=1&isCheckBox=1&isIncludeSelf=0&isTree=0&isIncludeStruPath=0&isExact=0&exceptOrganType=199";
  var url ="jsp/help.jsp?url="+cmdUrl;     
 sel1= document.all("processdeptlist").value;
 sel3= document.all("processdeptIDlist").value;
 var selopts="";
 if(sel1!=""){
 	var organName= sel1.split(",");
    var organCode= sel3.split(",");
    var organId="";  var struId=""; var arr4=",,";
  //1 struId 2 organCode 3 organName 4 organId 5 ���δ���
    for(var i=0;i<organName.length;i++){
      if(selopts=="")
    	  selopts=struId+","+organCode[i]+","+organName[i]+","+organId+","+arr4+":"+organName[i];
	  else   
	  	 selopts=selopts+"|"+struId+","+organCode[i]+","+organName[i]+","+organId+","+arr4+":"+organName[i];
    }
 }
  // alert(selopts);
   url+="&SEL_OPTS="+selopts;
  //alert(url);
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:640px;dialogHeight:480px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("processdeptlist").value=win[1];
  document.all("processdeptIDlist").value=win[3];
  }
   
}
//ѡ��Э��
function selxb(){
    var cmdUrl="stru.cmd&method=getSelectRoot&rootId=1&organType=1&isCheckBox=1&isIncludeSelf=0&isTree=0&isIncludeStruPath=0&isExact=0&exceptOrganType=199";
  var url ="jsp/help.jsp?url="+cmdUrl;     
 sel1= document.all("xbprocessdeptlist").value;
 sel3= document.all("xbprocessdeptIDlist").value;
 var selopts="";
 if(sel1!=""){
 	var organName= sel1.split(",");
    var organCode= sel3.split(",");
    var organId="";  var struId=""; var arr4=",,";
  //1 struId 2 organCode 3 organName 4 organId 5 ���δ���
    for(var i=0;i<organName.length;i++){
      if(selopts=="")
    	  selopts=struId+","+organCode[i]+","+organName[i]+","+organId+","+arr4+":"+organName[i];
	  else   
	  	 selopts=selopts+"|"+struId+","+organCode[i]+","+organName[i]+","+organId+","+arr4+":"+organName[i];
    }
 }
  // alert(selopts);
   url+="&SEL_OPTS="+selopts;
  
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:640px;dialogHeight:480px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("xbprocessdeptlist").value=win[1];
  document.all("xbprocessdeptIDlist").value=win[3];
  }
   
}
<% if("rejiaoban".equals(rejiaoban)){ %>
displayDays($('zbdealedtimelimit'),"zbdealeddays");
displayDays($('xbdealedtimelimit'),"xbdealeddays");

<%}%>
    </script>