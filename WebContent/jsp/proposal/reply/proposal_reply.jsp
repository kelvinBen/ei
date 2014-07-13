<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@page import="net.mast.util.RequestUtil"%>
<%@page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@page import="net.mast.bsp.permit.context.BspInfo"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-date" prefix="data"%>
<%@page import="net.mast.bsp.util.DateUtil"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@page import="org.proposal.reply.view.ProposalReplyView"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
String app=request.getContextPath();

BspInfo pfUser=GetBspInfo.getBspInfo();
request.getAttribute("");
ProposalReplyView view=(ProposalReplyView)request.getAttribute("html.data");
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
<title>填写复文</title>
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

var flag=true;  	       
function contentFocus(ta){
if(flag){
ta.value="";
flag=false;
}
}
function contentBlur(ta){
if(ta.value==""){
ta.value="     ( 提示：“您(你们)提出的关于XX号提案的收悉，现答复如下：一、办理主要作法；二、办理结果。)";
flag=true;
  	        	}
  	        }
function save(){
if(validateAll(document.listForm)){
	window.confirm("你确要答复吗?");
	document.listForm.action="proposalreply.cmd?method=reply";
	document.listForm.submit();
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
    <td><input type="text" name="word" id="word"  maxsize="12" nullable="no" datatype="text" cn_name="字" 
    value="<html:value property="word"/>" style="border:1px solid #ffffff; border-bottom:1px solid #eca00c; background-color:#FFFFFF; width:45px"/></td>
    <td>函</td>
    <td>[<input  type="text" name="year" size="8" maxsize="8" nullable="no" datatype="text" cn_name="年号" 
    value="<html:value property="year"/>"  style="border:1px solid #ffffff; border-bottom:1px solid #eca00c; background-color:#FFFFFF; width:45px"/>]
    [<input type="text" name="no" size="5" maxsize="5" nullable="no" datatype="text" cn_name="文号" 
    value="<html:value property="no"/>"  style="border:1px solid #ffffff;border-bottom:1px solid #eca00c ;  background-color:#FFFFFF; width:45px"/>]号</td>
    <td><select name="type"  nullable="no" datatype="text" cn_name="类别">
          <option value="">请选择级类别</option>
         <option value="A"  >A</option>
	     <option value="B" >B</option>
	 	 <option value="C" >C</option>
      </select>
      类</td>
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
<%if(view.getIsredo()==0){ %>
 <textarea name="content" id="content" cols="88" maxsize="4000" nullable="no" datatype="text"  cn_name="复文正文"   onclick='contentFocus(this);' onblur="contentBlur(this);" title='( 答复格式提示：“您(你们)提出的关于XX号提案的收悉，现答复如下：一、办理主要作法；二、办理结果。) ' style="BORDER-RIGHT: #eca00c 1px solid; BORDER-TOP: #eca00c 1px solid; BORDER-LEFT: #eca00c 1px solid; BORDER-BOTTOM: #eca00c 1px solid; BACKGROUND-COLOR: #F8F8F8;width:744px; height:400px; padding:6px; line-height:20px">
  ( 答复格式提示：“您(你们)提出的关于XX号提案的收悉，现答复如下：一、办理主要作法；二、办理结果。)  
<%}else{ 
%>
<textarea name="content" id="content" cols="88" maxsize="4000" nullable="no" datatype="text"  cn_name="复文正文" title='( 答复格式提示：“您(你们)提出的关于XX号提案的收悉，现答复如下：一、办理主要作法；二、办理结果。) ' style="BORDER-RIGHT: #eca00c 1px solid; BORDER-TOP: #eca00c 1px solid; BORDER-LEFT: #eca00c 1px solid; BORDER-BOTTOM: #eca00c 1px solid; BACKGROUND-COLOR: #F8F8F8;width:744px; height:400px; padding:6px; line-height:20px">
<html:value property="content"></html:value>
<%}%></textarea>
</div>
<div style="border-bottom:1px solid #cccccc; font-size:14px; font-weight:bold; line-height:28px; margin-bottom:15px">相关附件： 

		<a href="javascript:;" name="attach" id="attach" onClick="add();this.childNodes[0].nodeValue='继续添加附件';"
		title="如果您要发送多附件，您只需多次点击“继续添加附件”即可。要注意附件总量不能超过发送限制的大小。" class="linkh">添加附件</a><span id="idfilespan"><br></span>
		
		
</div>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="line-height:32px">
  <tr>
    <td align="left">联系电话：<input type="text" name="telephone" size="20" maxsize="20" nullable="no" datatype="text" cn_name="联系电话" 
    value="<html:value property="telephone"/>" style="BORDER: #cccccc 1px solid; BACKGROUND-COLOR: #F4F4F4; font-size:14px; width:180px; height:18px"/></td>
    </tr>
  <tr>
    <td align="left">负&nbsp;责&nbsp;人：<INPUT type="text" name="leader" size="20" maxsize="20" nullable="no" datatype="text" cn_name="负责人" 
    value="<html:value property="leader"/>" style="BORDER: #cccccc 1px solid; BACKGROUND-COLOR: #F4F4F4; font-size:14px; width:180px; height:18px"></td>
    </tr>
  <tr>
    <td align="left"><p>经&nbsp;办&nbsp;人：<input type="text" name="processor" size="20" maxsize="20" nullable="no" datatype="text" cn_name="经办人" 
    value="<html:value property="processor"/>" style="BORDER: #cccccc 1px solid; BACKGROUND-COLOR: #F4F4F4; font-size:14px; width:180px; height:18px"/></p></td>
    </tr>
  <tr>
    <td align="right">日期：	<data:date name="issueddate" divname="issueddate1" property="issueddatestr" sourceFormat="yyyy-MM-dd"></data:date></td>
    </tr>
    <br><br>
    <tr align="center">
    
    <td style=" padding:10px 0px 30px 0">       
    <%if(view.getIsredo()==0){ %>
			&nbsp;<input type="button" value="确定回复" name="B1" onclick="save()">&nbsp; 
<%}else{ %>
			&nbsp;<input type="button" class='advbutton' value="重新答复" name="B1" onclick="save()">&nbsp; 
<%}%>			<input style="" type="button" value="关 闭" onClick="window.close();">
    </td>
  </tr>
</table>

</div>
</div>
</form>

</body>
</html>
