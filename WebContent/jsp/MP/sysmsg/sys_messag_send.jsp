<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%@ page import="org.ld.soa.util.*"%>
<%@page import="net.mast.bsp.permit.context.BspInfo"%>
<%@page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@page import="net.mast.messageplatform.sys_message.data.SysMessag"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/tags/pubcommonhelp" prefix="help"%>

<%
String app=request.getContextPath();
String actionName=(String)request.getAttribute("action");
if(actionName==null){
	actionName="edit";
}
SysMessag view= (SysMessag)request.getAttribute("html.data"); 
if(view==null)
	view=new SysMessag();
%> 

<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='validate.js'/>"></script>
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>

<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<HEAD><STYLE>
/* Rule 1 of forumdata/cache/style_8.css */ 
{
	WORD-WRAP: break-word
}

/* Rule 483 of forumdata/cache/style_8.css */ 
.container {
	OVERFLOW: hidden;
	WIDTH: 100%
}

/* Rule 45 of forumdata/cache/style_8.css */ 
.wrap {
	MARGIN: 0px auto;
	WIDTH: 98%;
	TEXT-ALIGN: left
}

/* Rule 2 of forumdata/cache/style_8.css */ 
BODY {
	BACKGROUND: #fff;
	TEXT-ALIGN: center
}

/* Rule 3 of forumdata/cache/style_8.css */ 
BODY {
	FONT: 12px/1.6em 宋体, Arial;
	COLOR: #000000
}

/* Rule 9 of forumdata/cache/style_8.css */ 
BODY {
	PADDING-RIGHT: 0px;
	PADDING-LEFT: 0px;
	PADDING-BOTTOM: 0px;
	MARGIN: 0px;
	PADDING-TOP: 0px
}
TH {
	
}

/* Rule 484 of forumdata/cache/style_8.css */ 
.content {
	FLOAT: left;
	WIDTH: 88%
}

/* Rule 20 of forumdata/cache/style_8.css */ 
FORM {
	PADDING-RIGHT: 0px;
	PADDING-LEFT: 0px;
	PADDING-BOTTOM: 0px;
	MARGIN: 0px;
	PADDING-TOP: 0px
}

/* Rule 190 of forumdata/cache/style_8.css */ 
.mainbox {
	BORDER-RIGHT: #1591c3 1px solid;
	PADDING-RIGHT: 1px;
	BORDER-TOP: #1591c3 1px solid;
	PADDING-LEFT: 1px;
	BACKGROUND: #fff;
	MARGIN-BOTTOM: 8px;
	PADDING-BOTTOM: 1px;
	BORDER-LEFT: #1591c3 1px solid;
	PADDING-TOP: 1px;
	BORDER-BOTTOM: #1591c3 1px solid
}

/* Rule 485 of forumdata/cache/style_8.css */ 
.content .mainbox {
	PADDING-BOTTOM: 5px
}

/* Rule 44 of forumdata/cache/style_8.css */ 
TABLE {
	BORDER-COLLAPSE: collapse;
	empty-cells: show
}

/* Rule 196 of forumdata/cache/style_8.css */ 
.mainbox TABLE {
	WIDTH: 100%
}

/* Rule 269 of forumdata/cache/style_8.css */ 
#pmlist {
	TABLE-LAYOUT: fixed
}

/* Rule 4 of forumdata/cache/style_8.css */ 
TD {
	FONT: 12px/1.6em 宋体, Arial;
	COLOR: #000000
}

/* Rule 206 of forumdata/cache/style_8.css */ 
.mainbox TBODY TD {
	PADDING-RIGHT: 5px;
	BORDER-TOP: #77c9ff 1px solid;
	PADDING-LEFT: 5px;
	PADDING-BOTTOM: 5px;
	PADDING-TOP: 5px
}

/* Rule 490 of forumdata/cache/style_8.css */ 
.content .mainbox TBODY TD {
	BORDER-TOP-STYLE: none;
	BORDER-BOTTOM: #77c9ff 1px solid
}

/* Rule 600 of forumdata/cache/style_8.css */ 
.formbox TD {
	PADDING-RIGHT: 5px;
	PADDING-LEFT: 5px;
	PADDING-BOTTOM: 5px;
	PADDING-TOP: 5px
}

/* Rule 602 of forumdata/cache/style_8.css */ 
.formbox TD {
	BORDER-BOTTOM: #77c9ff 1px solid
}

/* Rule 687 of forumdata/cache/style_8.css */ 
.btns TD {
	BORDER-TOP-STYLE: none !important;
	BORDER-RIGHT-STYLE: none !important;
	BORDER-LEFT-STYLE: none !important;
	BORDER-BOTTOM-STYLE: none !important
}

/* Rule 37 of forumdata/cache/style_8.css */ 
A {
	COLOR: #002757;
	TEXT-DECORATION: none
}

/* Rule 603 of forumdata/cache/style_8.css */ 
.formbox TABLE A {
	COLOR: #169ed1
}

/* Rule 40 of forumdata/cache/style_8.css */ 
EM {
	FONT-WEIGHT: normal;
	FONT-STYLE: normal
}

/* Rule 208 of forumdata/cache/style_8.css */ 
.mainbox TBODY EM {
	LINE-HEIGHT: 1.3em
}

/* Rule 671 of forumdata/cache/style_8.css */ 
.btns EM {
	COLOR: #169ed1
}

/* Rule 8 of forumdata/cache/style_8.css */ 
BUTTON {
	FONT: 12px/1.6em 宋体, Arial;
	COLOR: #000000
}

/* Rule 594 of forumdata/cache/style_8.css */ 
BUTTON {
	BORDER-RIGHT: #169ed1 1px solid;
	BORDER-TOP: #77c9ff 1px solid;
	BACKGROUND: #f4fbff;
	BORDER-LEFT: #77c9ff 1px solid;
	CURSOR: pointer;
	LINE-HEIGHT: 2em;
	BORDER-BOTTOM: #169ed1 1px solid;
	HEIGHT: 2em
}

/* Rule 595 of forumdata/cache/style_8.css */ 
#postsubmit {
	BORDER-RIGHT: #fdb939 1px solid;
	PADDING-RIGHT: 10px;
	BORDER-TOP: #fffdee 1px solid;
	PADDING-LEFT: 10px;
	BACKGROUND: #fff8c5;
	PADDING-BOTTOM: 0px;
	BORDER-LEFT: #fffdee 1px solid;
	COLOR: #000000;
	MARGIN-RIGHT: 1em;
	PADDING-TOP: 0px;
	BORDER-BOTTOM: #fdb939 1px solid
}

/* Rule 596 of forumdata/cache/style_8.css */ 
BUTTON.submit {
	BORDER-RIGHT: #fdb939 1px solid;
	PADDING-RIGHT: 10px;
	BORDER-TOP: #fffdee 1px solid;
	PADDING-LEFT: 10px;
	BACKGROUND: #fff8c5;
	PADDING-BOTTOM: 0px;
	BORDER-LEFT: #fffdee 1px solid;
	COLOR: #000000;
	MARGIN-RIGHT: 1em;
	PADDING-TOP: 0px;
	BORDER-BOTTOM: #fdb939 1px solid
}

/* Rule 43 of forumdata/cache/style_8.css */ 
TH {
	FONT-WEIGHT: normal;
	FONT-STYLE: normal
}

/* Rule 205 of forumdata/cache/style_8.css */ 
.mainbox TBODY TH {
	PADDING-RIGHT: 5px;
	BORDER-TOP: #77c9ff 1px solid;
	PADDING-LEFT: 5px;
	PADDING-BOTTOM: 5px;
	PADDING-TOP: 5px
}

/* Rule 489 of forumdata/cache/style_8.css */ 
.content .mainbox TBODY TH {
	BORDER-TOP-STYLE: none;
	BORDER-BOTTOM: #77c9ff 1px solid
}

/* Rule 598 of forumdata/cache/style_8.css */ 
.formbox TH {
	WIDTH: 180px;
	TEXT-ALIGN: left
}

/* Rule 599 of forumdata/cache/style_8.css */ 
.formbox TH {
	PADDING-RIGHT: 5px;
	PADDING-LEFT: 5px;
	PADDING-BOTTOM: 5px;
	PADDING-TOP: 5px
}

/* Rule 601 of forumdata/cache/style_8.css */ 
.formbox TH {
	BORDER-BOTTOM: #77c9ff 1px solid
}

/* Rule 686 of forumdata/cache/style_8.css */ 
.btns TH {
	BORDER-TOP-STYLE: none !important;
	BORDER-RIGHT-STYLE: none !important;
	BORDER-LEFT-STYLE: none !important;
	BORDER-BOTTOM-STYLE: none !important
}

/* Rule 604 of forumdata/cache/style_8.css */ 
.formbox LABEL {
	CURSOR: pointer
}

/* Rule 5 of forumdata/cache/style_8.css */ 
INPUT {
	FONT: 12px/1.6em 宋体, Arial;
	COLOR: #000000
}

/* Rule 588 of forumdata/cache/style_8.css */ 
INPUT {
	BORDER-TOP-WIDTH: 1px;
	PADDING-RIGHT: 2px;
	PADDING-LEFT: 2px;
	BORDER-LEFT-WIDTH: 1px;
	BORDER-LEFT-COLOR: #1591c3;
	BACKGROUND: #fff;
	BORDER-BOTTOM-WIDTH: 1px;
	BORDER-BOTTOM-COLOR: #1591c3;
	PADDING-BOTTOM: 2px;
	BORDER-TOP-COLOR: #1591c3;
	PADDING-TOP: 2px;
	BORDER-RIGHT-WIDTH: 1px;
	BORDER-RIGHT-COLOR: #1591c3
}

/* Rule 6 of forumdata/cache/style_8.css */ 
TEXTAREA {
	FONT: 12px/1.6em 宋体, Arial;
	COLOR: #000000
}

/* Rule 186 of forumdata/cache/style_8.css */ 
.autosave {
	BEHAVIOR: url(#default#userdata)
}

/* Rule 589 of forumdata/cache/style_8.css */ 
TEXTAREA {
	BORDER-TOP-WIDTH: 1px;
	PADDING-RIGHT: 2px;
	PADDING-LEFT: 2px;
	BORDER-LEFT-WIDTH: 1px;
	BORDER-LEFT-COLOR: #1591c3;
	BACKGROUND: #fff;
	BORDER-BOTTOM-WIDTH: 1px;
	BORDER-BOTTOM-COLOR: #1591c3;
	PADDING-BOTTOM: 2px;
	BORDER-TOP-COLOR: #1591c3;
	PADDING-TOP: 2px;
	BORDER-RIGHT-WIDTH: 1px;
	BORDER-RIGHT-COLOR: #1591c3
}

/* Rule 672 of forumdata/cache/style_8.css */ 
#smilieslist {
	BORDER-RIGHT: #77c9ff 1px solid;
	BORDER-TOP: #77c9ff 1px solid;
	OVERFLOW: hidden;
	BORDER-LEFT: #77c9ff 1px solid;
	BORDER-BOTTOM: #77c9ff 1px solid;
	TEXT-ALIGN: center
}

/* Rule 512 of forumdata/cache/style_8.css */ 
.popupmenu_popup {
	BORDER-RIGHT: #1591c3 1px solid;
	PADDING-RIGHT: 10px;
	BORDER-TOP: #1591c3 1px solid;
	PADDING-LEFT: 10px;
	BACKGROUND: #f5fcfe repeat-x 0px 1px;
	PADDING-BOTTOM: 10px;
	OVERFLOW: hidden;
	BORDER-LEFT: #1591c3 1px solid;
	LINE-HEIGHT: 1.4em;
	PADDING-TOP: 10px;
	BORDER-BOTTOM: #1591c3 1px solid;
	TEXT-ALIGN: left
}

/* Rule 679 of forumdata/cache/style_8.css */ 
#smilieslist .popupmenu_popup {
	PADDING-RIGHT: 10px;
	PADDING-LEFT: 10px;
	PADDING-BOTTOM: 5px;
	OVERFLOW: visible;
	PADDING-TOP: 5px;
	WHITE-SPACE: nowrap
}

/* Rule 675 of forumdata/cache/style_8.css */ 
#smilieslist TD {
	PADDING-RIGHT: 0px;
	PADDING-LEFT: 0px;
	PADDING-BOTTOM: 8px;
	CURSOR: pointer;
	BORDER-TOP-STYLE: none;
	PADDING-TOP: 8px;
	BORDER-RIGHT-STYLE: none;
	BORDER-LEFT-STYLE: none;
	BORDER-BOTTOM-STYLE: none
}

/* Rule 17 of forumdata/cache/style_8.css */ 
H4 {
	PADDING-RIGHT: 0px;
	PADDING-LEFT: 0px;
	PADDING-BOTTOM: 0px;
	MARGIN: 0px;
	PADDING-TOP: 0px
}

/* Rule 25 of forumdata/cache/style_8.css */ 
H4 {
	FONT-SIZE: 1em
}

/* Rule 678 of forumdata/cache/style_8.css */ 
#smilieslist H4 {
	PADDING-RIGHT: 5px;
	PADDING-LEFT: 5px;
	BACKGROUND: #fff;
	PADDING-BOTTOM: 5px;
	COLOR: #169ed1;
	LINE-HEIGHT: 20px;
	PADDING-TOP: 5px;
	BORDER-BOTTOM: #77c9ff 1px solid;
	TEXT-ALIGN: left
}

/* Rule 10 of forumdata/cache/style_8.css */ 
UL {
	PADDING-RIGHT: 0px;
	PADDING-LEFT: 0px;
	PADDING-BOTTOM: 0px;
	MARGIN: 0px;
	PADDING-TOP: 0px
}

/* Rule 136 of forumdata/cache/style_8.css */ 
.tabs {
	BORDER-TOP: #fff 1px solid;
	BACKGROUND: #f4fbff;
	MARGIN-BOTTOM: 15px;
	PADDING-BOTTOM: 26px;
	BORDER-BOTTOM: #1591c3 1px solid
}

/* Rule 32 of forumdata/cache/style_8.css */ 
.tabs LI {
	LIST-STYLE-TYPE: none
}

/* Rule 35 of forumdata/cache/style_8.css */ 
.formbox LI {
	LIST-STYLE-TYPE: none
}

/* Rule 137 of forumdata/cache/style_8.css */ 
.tabs LI {
	BORDER-RIGHT: #77c9ff 1px solid;
	FLOAT: left;
	LINE-HEIGHT: 25px
}

/* Rule 139 of forumdata/cache/style_8.css */ 
.tabs LI A {
	PADDING-RIGHT: 10px;
	PADDING-LEFT: 10px;
	FLOAT: left;
	PADDING-BOTTOM: 0px;
	PADDING-TOP: 0px
}

/* Rule 138 of forumdata/cache/style_8.css */ 
.tabs LI.current {
	FONT-WEIGHT: bold;
	BACKGROUND: #fff;
	HEIGHT: 27px
}

/* Rule 142 of forumdata/cache/style_8.css */ 
.sendpm A {
	PADDING-RIGHT: 20px !important;
	PADDING-LEFT: 35px !important;
	BACKGROUND: url(../..//images08/buddy_sendpm.gif) no-repeat 15px 50%;
	PADDING-BOTTOM: 0px !important;
	COLOR: #000000;
	PADDING-TOP: 0px !important
}

H1 {
	PADDING-RIGHT: 0px;
	PADDING-LEFT: 0px;
	PADDING-BOTTOM: 0px;
	MARGIN: 0px;
	PADDING-TOP: 0px;
	FONT-SIZE: 1em;
	LINE-HEIGHT: 31px
}

</STYLE></HEAD>
<BODY onkeydown="if(event.keyCode==27) return false;"><DIV class="wrap"><DIV class="container">

<DIV class="content">
 <FORM id="postform" onSubmit="return toSend(this)" action="sysmessag.cmd?method=insert" method="post">
 <input type="hidden" name="id" value="<%=view.getId()%>" /> 
  <DIV class="mainbox bgcolor4 formbox">
   <H1 style="background-color: #1591c3" align="center">
    短消息发送
   </H1>
   <UL class="tabs">
    <LI class="current sendpm">
     <A href="sysmessag.cmd?method=forinsert">发送短消息</A> 
    </LI>
    <LI>
     <A href="mysysmessagquery.cmd?method=shoujian&state=2&clear=true">收件箱</A> 
    </LI>
    <LI>
     <A href="mysysmessagquery.cmd?method=caogao&state=1&clear=true">草稿箱</A> 
    </LI>
    <LI>
     <A href="mysysmessagquery.cmd?method=yifashong&state=2&clear=true">已发送</A> 
    </LI>
    <LI>
     <A href="mysysmessagquery.cmd?method=list&clear=true">搜索短消息</A> 
    </LI>
   </UL>
   <TABLE id="pmlist" cellSpacing="0" cellPadding="0" summary="发送短消息">
    <TBODY>
     <TR>
      <TH>
       <LABEL for="receiver">发送到</LABEL>    
      </TH>
      <TD>
       <INPUT id="note2" readonly="readonly" TYPE="text"   cn_name="消息接收人" nullable="no" datatype="text" size="65" name="note2" value="<%=view.getNote2()%>" /> 
  <div style="display: none;">   <help:helpsearch name="receiver" property="receiver" style="display:none" size="40" param="CORPORATION_ID=1"   helpid="helpUser" ismulti="true"  changefield="receiver#1,note2#2"/> 
      &nbsp;
  </div>    <button type="button" onClick="receiver_dialog();" >选择收信人</button>
      
      </TD>
     </TR>
     <TR>
      <TH>
       <LABEL for="subject">标题</LABEL>
      </TH>
      <TD>
       <INPUT id="subject" size="65" name="subject" cn_name="消息标题" nullable="false" datatype="text" value="<%=view.getSubject()%>" maxsize="400" maxlength="400"  />
      </TD>
     </TR>
     <TR>
      <TH vAlign="top">
       <LABEL for="contents">内容</LABEL> 
       
      </TH>
      <TD>
       <TEXTAREA class="autosave" id="contents" cn_name="消息内容" nullable="no" onKeyDown="ctlent(event);" style="WIDTH: 95%" name="contents" rows="15" cols="10" class="textareaA" onmouseover="this.className='textareaB'" maxsize="4000" maxlength="4000"><%=view.getContents()%></TEXTAREA> <BR />
		  <LABEL>
			  <select name="state" >
			  		<option value="20" selected="selected">直接发送消息</option>
					<option value="1">不发送，只保存到草稿箱中</option>					
               </select>
			   </LABEL> 
			    <select style="display:none" name="messageType" >
			    	<option value="02" selected="selected">用户消息</option>
					<option value="01">系统消息</option>					
					<option value="03">其他消息</option>
                     </select>
      </TD>
     </TR>
     <TR class="btns">
      <TH>&nbsp;
       
      </TH>
      <TD>
       <BUTTON class="submit" id="postsubmit" name="pmsubmit" type="submit" value="true">提交</BUTTON> <EM>[完成后可按 Ctrl+Enter 发布]</EM> &nbsp;<BUTTON class="submit" id="restoredata" title="恢复上次自动保存的数据" onClick="forReset()" >恢复数据</BUTTON> 
      </TD>
     </TR>
    </TBODY>
   </TABLE>
  </DIV>
 </FORM>

 <SCRIPT type="text/javascript">

  var url="sysmessag.cmd?method=getCount";    //获取消息
  var result= xmlhttp(url);  
  var flag=true;
  if(result>80){
  	alert("您的收件箱已满，请及时删除不需要的短消息!");
  	$('postsubmit').disabled=true;
  	var flag=false;
  	}
function forReset(){  
  document.forms[0].reset();	
}
function toSend(theform){

	return validateAll(theform);
}

function ctlent(event) {
	if(flag)
	if((event.ctrlKey && event.keyCode == 13) || (event.altKey && event.keyCode == 83)) {
			if(toSend(document.forms[0]))
				document.forms[0].submit();
			return;
	}
	
}

 
 </SCRIPT>
</DIV>

</DIV></DIV></BODY></HTML>