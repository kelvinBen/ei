<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@page import="net.mast.util.RequestUtil"%>
<%@page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@page import="net.mast.bsp.permit.context.BspInfo"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-date" prefix="data"%>
<%@page import="net.mast.bsp.util.DateUtil"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@page import="org.proposal.attachment.view.ProposalAttachmentView"%>
<%@page import="org.proposal.reply.view.ProposalReplyView"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
String app=request.getContextPath();
ProposalReplyView	proposalReplyView=(ProposalReplyView)request.getAttribute("html.data");
BspInfo pfUser=GetBspInfo.getBspInfo();

%> 
<head>
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="JavaScript" src="<mast:ui js='validate.js'/>"  ></script>
<script language="javascript" type="text/javascript" src="<mast:ui js='prototype-1.4.0.js'/>" ></script>
<script language="JavaScript" src="<mast:ui js='attach.js'/>"  ></script>
<script language="javascript" type="text/javascript" src="<mast:ui js='json.js'/>"></script>
<script language="javascript" type="text/javascript" src="<mast:ui js='calendar.js'/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<style type="text/css">
<!--
body { margin:0; background-color:#F1F1F1;
}
.Shadow {
	filter: DropShadow(Color=#E7E7E7, OffX=4, OffY=4, Positive=45);
	width:920px; margin:auto; margin-top:15px; margin-bottom:15px;
}
.Shadow1 {
	width:920px; margin:auto;
}
.boxCss { border:1px solid #cccccc; margin-right:4px; margin-bottom:4px; background-color:#FFFFFF; padding:60px 80px 40px 80px; font-size:16px}
.title { font-size:28px; text-align:center; font-weight:bold; color:red; padding-bottom:20px}
.title1 { font-size:45px; text-align:center; font-weight:bold; color:red; padding-bottom:20px}
.line {
	border-bottom:1px solid red;
	border-top:3px solid red;
	margin-bottom:40px; height:2px; overflow:hidden;
}
P {
	LINE-HEIGHT: 200%
}
-->
</style>
</head>

<script language="JavaScript">

//下载附件
function downloadAtt(url){
 url="<%=app%>/"+url;
window.open(url);
}
function printT(){
	if(confirm("确定要打印吗？")){
	//	beforePrint();
		window.print();
	//	afterPrint();
	}
}
</script>

<body>
<form name="listForm" enctype="multipart/form-data" method="post">
<input type="hidden" name="id" value="<html:value property="proposalid" />" />
<input type="hidden" name="pk" value="<html:value property="id" />" />

<html:hidden name="caseno" property="caseno"  />
<html:hidden name="processdept" property="processdept"  />
<html:hidden name="processdeptid" property="processdeptid"  />
<html:hidden name="state" property="state"  />
<html:hidden name="jbdate" property="jbdate"  />
<html:hidden name="depttype" property="depttype"  />
<html:hidden name="period" property="period"  />
<html:hidden name="meeting" property="meeting"  />
<html:hidden name="areaname" property="areaname"  />
<html:hidden name="areaid" property="areaid"  />
<html:hidden name="limitdate" property="limitdate"  />
<html:hidden name="isredo" property="isredo"  />
<html:hidden name="note" property="note"  />
<html:hidden name="note2" property="note2"  />
<html:hidden name="note3" property="note3"  />


<div class="Shadow1">
<div class="boxCss" style="margin:0">
  <div class="title1"><html:value property="areaname"/><html:value property="processdept" />文件
</div>
  <div style="text-align:center; font-size:16px; font-weight:bold; padding-bottom:10px">
  <table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><html:value property="word" /></td>
    <td>函</td>
    <td>[<html:value property="year" />][<html:value property="no" />]号</td>
    <td>    
    <html:label name="type" property="type" collection="PROPOSALREPLY_TYPE_COLLECTION" labelProperty="value" labelKey="key"/>
    </td>
  </tr>
</table>

</div>
<div class="line"></div>
<div style="font-size:26px; line-height:44px; padding-bottom:20px; text-align:center; font-weight:bold">
关于<html:value property="areaname"/>政协第<html:value property="period"/>届第<html:value property="meeting"/>次会议委员
第<html:value property="caseno"/>号提案的答复
</div>
<div style="background-image:url(images/bg1.gif); line-height:26px; padding:4px 0 0 10px"><strong>复文正文：</strong></div>
<div style="padding-bottom:30px">
 <pre><html:value property="content"/></pre>

</div>
<div style="border-bottom:1px solid #cccccc; font-size:14px; font-weight:bold; line-height:28px; margin-bottom:15px">相关附件： 
<table>
 <%   
 List<ProposalAttachmentView> att = proposalReplyView.getAttList();
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
		
		
</div>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="line-height:32px">
  <tr>
    <td align="left">联系电话：<html:value property="telephone"/></td>
    </tr>
  <tr>
    <td align="left">负&nbsp;责&nbsp;人：<html:value property="leader"/></td>
    </tr>
  <tr>
    <td align="left"><p>经&nbsp;办&nbsp;人：<html:value property="processor"/></p></td>
    </tr>
  <tr>
    <td align="right">日期：	<html:value property="issueddate" format="yyyy年MM月dd日"/></td>
    </tr>
    <br><br>
    <tr align="center">
    
    <td style=" padding:10px 0px 30px 0">       
			&nbsp;<input style="font-size: 17px;" type="button" value="打 印" onClick='printT()'> 
&nbsp; 
			<input style="font-size: 17px;" type="button" value="关 闭" onClick="window.close();">
    </td>
  </tr>
</table>

</div>
</div>
</form>

</body>
</html>
