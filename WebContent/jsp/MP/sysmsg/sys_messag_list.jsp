<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
<%
String style="green";//默认样式
BspInfo pfUser = GetBspInfo.getBspInfo();
String app=request.getContextPath();

List list=(List)request.getAttribute("flexgrid.data"); //查询出来的数据
//out.println(list);
if(list==null){
	list=new ArrayList();
}
String actionName=(String)request.getAttribute("action");
if(actionName==null){
	actionName="search";
}
 
%> 
<% 
//保存查询条件
 
    String id = RequestUtil.getPara2String(request,"ID");
    String sender = RequestUtil.getPara2String(request,"Sender");
    String receiver = RequestUtil.getPara2String(request,"receiver");
    String send_time = RequestUtil.getPara2String(request,"Send_Time");
    String contents = RequestUtil.getPara2String(request,"Contents");
    String message_type = RequestUtil.getPara2String(request,"message_type");
    String subject = RequestUtil.getPara2String(request,"subject");
    String state = RequestUtil.getPara2String(request,"state");
    String note2 = RequestUtil.getPara2String(request,"NOTE2");
%>


<%@page import="net.mast.messageplatform.sys_message.view.SysMessagView"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">

<HEAD><STYLE>
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

/* Rule 484 of forumdata/cache/style_8.css */ 
.content {
	FLOAT: left;
	WIDTH: 88%
}

/* Rule 46 of forumdata/cache/style_8.css */ 
.notice {
	BORDER-RIGHT: #1591c3 1px solid;
	PADDING-RIGHT: 1em;
	BORDER-TOP: #1591c3 1px solid;
	PADDING-LEFT: 3em;
	FONT-SIZE: 14px;
	BACKGROUND: url(../..//images08/notice.gif) #ffffdd no-repeat 1em 0.7em;
	MARGIN-BOTTOM: 8px;
	PADDING-BOTTOM: 0.3em;
	BORDER-LEFT: #1591c3 1px solid;
	COLOR: #000000;
	PADDING-TOP: 0.5em;
	BORDER-BOTTOM: #1591c3 1px solid
}

/* Rule 40 of forumdata/cache/style_8.css */ 
EM {
	FONT-WEIGHT: normal;
	FONT-STYLE: normal
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

/* Rule 212 of forumdata/cache/style_8.css */ 
.footoperation {
	PADDING-RIGHT: 5px;
	BORDER-TOP: #1591c3 1px solid;
	PADDING-LEFT: 5px;
	BACKGROUND: #f4fbff;
	PADDING-BOTTOM: 5px;
	PADDING-TOP: 5px
}

/* Rule 214 of forumdata/cache/style_8.css */ 
.footoperation {
	VERTICAL-ALIGN: middle
}

/* Rule 486 of forumdata/cache/style_8.css */ 
.content .footoperation {
	BORDER-TOP-STYLE: none;
	BORDER-BOTTOM: #77c9ff 1px solid
}

/* Rule 8 of forumdata/cache/style_8.css */ 
BUTTON {
	FONT: 12px/1.6em 宋体, Arial;
	COLOR: #000000
}

/* Rule 216 of forumdata/cache/style_8.css */ 
.footoperation BUTTON {
	BORDER-RIGHT: #77c9ff 1px solid;
	PADDING-RIGHT: 5px;
	BORDER-TOP: #77c9ff 1px solid;
	DISPLAY: inline;
	PADDING-LEFT: 5px;
	BACKGROUND: #fff;
	PADDING-BOTTOM: 2px;
	MARGIN-LEFT: 2px;
	OVERFLOW: visible;
	BORDER-LEFT: #77c9ff 1px solid;
	WIDTH: 0px;
	CURSOR: pointer;
	COLOR: #169ed1;
	LINE-HEIGHT: 1em;
	PADDING-TOP: 3px;
	BORDER-BOTTOM: #77c9ff 1px solid
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

/* Rule 215 of forumdata/cache/style_8.css */ 
.footoperation LABEL {
	CURSOR: pointer;
	MARGIN-RIGHT: 1em
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

/* Rule 592 of forumdata/cache/style_8.css */ 
.checkbox {
	BACKGROUND: none transparent scroll repeat 0% 0%;
	BORDER-TOP-STYLE: none;
	BORDER-RIGHT-STYLE: none;
	BORDER-LEFT-STYLE: none;
	BORDER-BOTTOM-STYLE: none
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

/* Rule 208 of forumdata/cache/style_8.css */ 
.mainbox TBODY EM {
	LINE-HEIGHT: 1.3em
}

/* Rule 37 of forumdata/cache/style_8.css */ 
A {
	COLOR: #002757;
	TEXT-DECORATION: none
}

/* Rule 395 of forumdata/cache/style_8.css */ 
TD.selector {
	WIDTH: 20px;
	TEXT-ALIGN: center
}

/* Rule 200 of forumdata/cache/style_8.css */ 
.mainbox THEAD TD {
	PADDING-RIGHT: 5px;
	PADDING-LEFT: 5px;
	BACKGROUND: #f4fbff;
	PADDING-BOTTOM: 2px;
	COLOR: #002757;
	LINE-HEIGHT: 22px;
	PADDING-TOP: 2px
}

/* Rule 394 of forumdata/cache/style_8.css */ 
TD.time {
	WIDTH: 120px
}

/* Rule 488 of forumdata/cache/style_8.css */ 
.content .mainbox THEAD TD {
	BORDER-TOP-STYLE: none;
	BORDER-BOTTOM: #77c9ff 1px solid
}

/* Rule 392 of forumdata/cache/style_8.css */ 
TD.user {
	WIDTH: 120px
}


/* Rule 199 of forumdata/cache/style_8.css */ 
.mainbox THEAD {
	PADDING-RIGHT: 5px;
	PADDING-LEFT: 5px;
	BACKGROUND: #f4fbff;
	PADDING-BOTTOM: 2px;
	COLOR: #002757;
	LINE-HEIGHT: 22px;
	PADDING-TOP: 2px
}

/* Rule 487 of forumdata/cache/style_8.css */ 
.content .mainbox THEAD  {
	BORDER-TOP-STYLE: none;
	BORDER-BOTTOM: #77c9ff 1px solid
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

/* Rule 140 of forumdata/cache/style_8.css */ 
.headertabs {
	BACKGROUND: #fff;
	MARGIN-BOTTOM: 0px
}

/* Rule 32 of forumdata/cache/style_8.css */ 
.tabs LI {
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

/* Rule 141 of forumdata/cache/style_8.css */ 
.headertabs LI.current {
	BACKGROUND-COLOR: #f4fbff
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
	PADDING-LEFT: 1em;
	PADDING-BOTTOM: 0px;
	MARGIN: 0px;
	PADDING-TOP: 0px;
	BACKGROUND: #1591c3 repeat-x 0px 0px;
	FONT-SIZE: 1em;
	LINE-HEIGHT: 31px
}
.TH{
text-align:center;
}

</STYLE></HEAD>
<BODY onkeydown="if(event.keyCode==27) return false;"><DIV class="wrap"><DIV class="container">

<DIV class="content">
 <FORM id="postform" method="post">
  <DIV class="mainbox bgcolor4 formbox">
   <H1 class="bgcolor4 ">
    搜索短消息
   </H1>
   <UL class="tabs link2">
    <LI >
     <A href="sysmessag.cmd?method=forinsert">发送短消息</A> 
    </LI>
    <LI >
     <A href="mysysmessagquery.cmd?method=shoujian&state=2&clear=true">收件箱</A> 
    </LI>
    <LI>
     <A href="mysysmessagquery.cmd?method=caogao&state=1&clear=true">草稿箱</A> 
    </LI>
    <LI >
     <A href="mysysmessagquery.cmd?method=yifashong&state=2&clear=true">已发送</A> 
    </LI>
    <LI class="current sendpm">
     <A href="mysysmessagquery.cmd?method=list&clear=true">搜索短消息</A> 
    </LI>
   </UL>
  <!-- 查询条件显示区域 -->
<flex:search>
<table id="tblSearch" width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">
	<tr class='td6'>
    
    <td>发送到：
<flex:searchText name="NOTE2" searchName="SYS_MESSAG.RECEIVER" dataType="java.lang.String" operSymbol="=" value="<%=note2%>" size="12"/>
	</td>
    <td>标题：
<flex:searchText name="subject" searchName="SYS_MESSAG.SUBJECT" dataType="java.lang.String" operSymbol="=" value="<%=subject%>" size="12"/>
	</td>
    <td>消息状态：
           <flex:searchSelect name="state" searchName="SYS_MESSAG.STATE" dataType="java.lang.String" operSymbol="=" value="<%=state%>" >
	         <option value="">全部</option>
	         <html:options collection="SYSMESSAG_STATE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
	</td>
 	<td><flex:searchImg name="chaxun" action="mysysmessagquery.cmd" image="search.gif"/></td>

	</tr>
</table>
</flex:search>
	                  <table class="table12" width="100%" border="1" style="border-collapse:collapse" cellpadding="0" cellspacing="0">
                            <tr height="22" class="tab_title_bg">
                              <th class="TH" height="22" width="20" align="center">
                              <input name="selectall_checkbox" type="checkbox" title="全选/取消" onclick="selectall(document.forms[0],this,'primaryKey')" />
                              </th>
	<!-- 一般列-->   <th align="center" title='消息标题'>消息标题</th>
	<!-- 一般列 -->  <th align="center" width="100" title='消息发送人'>来自</th>
	<!-- 一般列 -->  <th align="center" width="100" title='消息接收人'>发送到</th>
	<!-- 一般列-->   <th align="center" width="140" title='发送时间'>时间</th>
	<!-- 枚举列-->   <th align="center" width="100" title='消息类型'>消息类型</th>

	<!-- 枚举列  --><th align="center" width="100" title='消息状态'>消息状态</th>  

                    <th align="center" width="100">操 作</th>                    
                            </tr>
                            
				<%//数据循环输出
				if(list!=null){
				for(int i=0;i<list.size();i++){
					SysMessagView view= (SysMessagView)list.get(i); 
				%>
                          <tr height="22" class="<%if(i%2==0){%>td6<%}else{%>td7<%}%>" onmouseover="this.className='tr_o'"  <%if(i%2==0){%>onmouseout="this.className='tr_s'"<%}else{%>onmouseout="this.className='tr_d'"<%}%>>
<!-- 主键选择列,多主键的话就将多个字段数据拼成一个字符串  view.getId()  ,自己在后台解析-->
                            <td align="center" width="20"><input id="primaryKey" type="checkbox" name="primaryKey" value="<%= view.getId() %>"></td>
	<!-- 一般列-->   <td  title='消息标题' id="sb<%=i%>"> <%=view.getSubjectNb()%>  </td>
	<!-- 一般列 -->  <td align="center" width="100" title='消息发送人'><%=view.getNote()%></td>
	<!-- 一般列 -->  <td align="center" width="100" title='消息接收人'> <%=view.getNote2()%></td>
	<!-- 一般列-->   <td align="center" width="140" title='发送时间'> <%=view.getSendTime()%></td>

	<!-- 枚举列-->   <td align="center" width="100" title='消息类型'> <html:label name="msg" value="<%=view.getMessageType()%>" labelKey="key" labelProperty="value" collection="SYSMESSAG_MESSAGETYPE_COLLECTION"></html:label></td>

	<!-- 枚举列-->   <td align="center" width="100" title='消息状态'><html:label name="msg" value="<%=view.getState()%>" labelKey="key" labelProperty="value" collection="SYSMESSAG_STATE_COLLECTION" /> </td>
						<td align="center">
                            <!--   <a href="#" onclick="forDelete('<%= view.getId() %>')" ><font color="blue">&nbsp;删除</font></a>--> 
                              <a onclick="view('<%=i%>','<%= view.getId() %>','<%=pfUser.getUserName().equals(view.getReceiver()) %>')" style="cursor: hand"><font color="blue">&nbsp;查看</font></a>
                        </td>
                            </tr>
						<tr id="contents<%=i%>" style="display: none"><td>&nbsp;</td><td align="left" colspan="6" ><label><pre> <%=view.getContents()%> </pre></label></td></tr>	
				<%}}%>
                          </table>
  </DIV>
 <div style="text-align: left;">
 <flex:pagePolit action="mysysmessagquery.cmd" pageSize="15"/>
 </div>
  </FORM>

 <SCRIPT type="text/javascript">
  
function view( i,primaryKey,isRead){
  var content=$('contents'+i);
  if(content.style.display=="none")
      content.style.display="block";
  else
      content.style.display="none";
  var sb=$('sb'+i);
  sb.innerHTML=sb.innerText;
  if(isRead=='true'){
  var url="sysmessag.cmd?method=setRead&primaryKey="+primaryKey;    //设置当前消息为已读
  var result= xmlhttp(url);
  }
  //alert(isRead);
}
function edit( primaryKey){
    var url="sysmessag.cmd?method=setRead&primaryKey="+primaryKey;    //设置当前消息为已读
  var result= xmlhttp(url);
  document.forms[0].action ="sysmessag.cmd?method=forupdate&primaryKey="+primaryKey;    
  document.forms[0].submit();	
}
 
 
//搜索
function forSearch(){
	var url="mysysmessagquery.cmd?method=list";
	document.forms[0].action =url;
  	document.forms[0].submit();	
}

 
 </SCRIPT>
</DIV>

</DIV></DIV></BODY></HTML>