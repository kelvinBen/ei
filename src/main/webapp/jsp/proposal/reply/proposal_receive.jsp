<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@page import="java.util.*"%>
<%
String app=request.getContextPath();
ProposalBuziView proposalBuzi=(ProposalBuziView)request.getAttribute("proposalBuzi");
String depttype= request.getParameter("depttype");
if(proposalBuzi==null)
	proposalBuzi=(ProposalBuziView)request.getAttribute("html.data");
%>
<%@page import="org.proposal.proposaluser.view.ProposalUserView"%>
<%@page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@page import="net.mast.bsp.permit.context.BspInfo"%>
<%@page import="org.proposal.proposalbuzi.view.ProposalBuziView"%>
<%@page import="org.proposal.joint.view.ProposalJointView"%>
<%@page import="org.proposal.attachment.view.ProposalAttachmentView"%>
<%@page import="net.mast.util.DateUtil"%>
<HTML>
<HEAD>
<TITLE>�᰸��ϸ��Ϣ</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
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
//���ظ���
function downloadAtt(url){
 url="<%=app%>/"+url;
 window.open(url);
}

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
						<DIV style="OVERFLOW: auto; WIDTH: 98%; WORD-BREAK: break-all"><html:value
							property="proposalReview.reviewcomment" /></DIV>
						</TD>
						<TD align=middle width="9%" bgColor=#f4f4f4>
						<DIV style="WIDTH: 16px; LINE-HEIGHT: 24px">�������</DIV>
						</TD>
						<TD
							style="PADDING-RIGHT: 4px; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; PADDING-TOP: 4px"
							width="41%">
						<DIV>
						<TABLE style="LINE-HEIGHT: 24px" width="100%">
							<TBODY>
								<TR>
									<TD style="VERTICAL-ALIGN: top" noWrap align="left" width="30%"><FONT
										color=blue>���쵥λ��<html:value property="processdeptlist" /></FONT></TD>
									<TD>���ޣ�<html:value property="zbdealedtimelimitstr" /></TD>
								</TR>
								<%if(!"".equals(proposalBuzi.getXbprocessdeptidlist())) {%>
								<TR>
									<TD style="VERTICAL-ALIGN: top" align="left"><FONT
										color=blue>Э�쵥λ��<html:value
										property="xbprocessdeptlist" /></FONT></TD>
									<TD>���ޣ�<html:value property="xbdealedtimelimitstr" /></TD>
								</TR>
								<%} %>
								<TR>
									<TD style="VERTICAL-ALIGN: top" align="left"><FONT
										color=blue>���쵥λ��<html:value property="registerdept" /></FONT></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD style="VERTICAL-ALIGN: top" colspan="2" align="left"><FONT
										color=blue>�����<html:value property="registercomment" /></FONT></TD>
									
								</TR>
							</TBODY>
						</TABLE>
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
<form name="listForm" method="post">
<html:hidden name="proposalid" property="id"  />
<html:hidden name="caseno" property="caseno"  />
<html:hidden name="depttype" value="<%=depttype %>"  />
<html:hidden name="processdate" value="<%=DateUtil.getCursorDate("yyyy-MM-dd") %>"  />
	 <table width="100%" border="0" cellpadding="0" cellspacing="0">
	     <tr>
		<td height="30" width="650" colspan="2" bgcolor="#FFFFE1" style="border: 1px solid #DDDD00">
		   <p><b><br>&nbsp;��ѡ�����ѡ�� (������ѡһ��) </font>
			</b></p>
			<p>&nbsp; <input onclick="thjy.value='';jsjy.value=''" type="radio" value="1" name="state" checked > ȷ�Ͻ����᰸
		<p>&nbsp; <input onclick="thjy.value='';jsjy.value=''" type="radio" value="2" name="state" > ȷ�Ͻ����᰸��ͬʱ�������� 
			<input type="text" name="jsjy" size="31" style="border: 1px solid #C0C0C0" value=""> �ȵ�λһ��а�</p>
			<p>&nbsp; <input onclick="thjy.value='';jsjy.value=''" type="radio" name="state" value="3" > �˻��᰸�������� <input type="text" name="thjy" size="42" style="border: 1px solid #C0C0C0" value =""> �ȵ�λ���а�</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �˻�����<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <textarea rows="4" name="thly" cols="42"></textarea> </p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="ȷ������" onclick="list_save()" name="B1">&nbsp;&nbsp;&nbsp; <input type="button" value="�ر�" onClick="window.close();" name="B2"><br>
��         </p>
		</td>
		</tr>
		</table>
        </form>
        </div>		

</div>
<script language="JavaScript">
function list_save(){
      	  if(document.listForm.state[1].checked&&document.listForm.jsjy.value==""){
	 		alert("�������ӵ�λ����Ϊ�գ�����д���ӵ�λ��");
	 		document.listForm.jsjy.focus();
	 		return;
	      }
      	  if(document.listForm.state[2].checked&&document.listForm.thly.value==""){
	 		alert("�˻����ɲ���Ϊ�գ�����д�˻����ɣ�");
	 		document.listForm.thly.focus();
	 		return;
	      }
	  document.listForm.action ="proposalreply.cmd?method=recive";    
	  document.listForm.submit();
}
</script>
</div>
</body>
<>
</html>
