<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@page import="net.mast.bsp.permit.context.BspInfo"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@page import="net.mast.bsp.util.DateUtil"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
String app=request.getContextPath();
String iswrite=request.getParameter("iswrite");
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<!--media=print 这个属性可以在打印时有效--> 
<style media=print> 
.noprint{display:none;} 
#Shadow1 {
	width:630px; margin:auto;
}
#boxCss {border:0px solid #cccccc;  font-size:14px;padding:20px 30px 15px 30px;}
#title1 { font-size:24px; }
#wy{
	font-size:22px;
}
.PageNext{page-break-after: always;} 
#line {
	display: none;
}
</style> 
<STYLE type=text/css>BODY {
	MARGIN: 0px; BACKGROUND-COLOR: #f1f1f1
}
.Shadow {
	FILTER: DropShadow(Color=#E7E7E7, OffX=4, OffY=4, Positive=45); MARGIN: 15px auto; WIDTH: 920px
}
.Shadow1 {
	MARGIN: auto; WIDTH: 920px
}
.boxCss {
	BORDER-RIGHT: #cccccc 1px solid; PADDING-RIGHT: 80px; BORDER-TOP: #cccccc 1px solid; PADDING-LEFT: 80px; FONT-SIZE: 16px; MARGIN-BOTTOM: 4px; PADDING-BOTTOM: 40px; BORDER-LEFT: #cccccc 1px solid; MARGIN-RIGHT: 4px; PADDING-TOP: 60px; BORDER-BOTTOM: #cccccc 1px solid; BACKGROUND-COLOR: #ffffff
}
.title {
	FONT-WEIGHT: bold; FONT-SIZE: 28px; PADDING-BOTTOM: 20px; COLOR: black; TEXT-ALIGN: center
}
.title1 {
	FONT-WEIGHT: bold; FONT-SIZE: 45px; PADDING-BOTTOM: 20px; COLOR: black; TEXT-ALIGN: center
}
.line {
	BORDER-TOP: black 3px solid; MARGIN-BOTTOM: 40px; OVERFLOW: hidden; BORDER-BOTTOM: black 1px solid; HEIGHT: 2px
}
P {
	LINE-HEIGHT: 200%
}
</STYLE>
<script language="JavaScript" src="<mast:ui js='validate.js'/>"  ></script>
<script language="JavaScript">
 function save(){
var state= document.listForm.state.value;
 if(state=="7"){//已反馈
 	if(!window.confirm("您已经评价过，是否要重新评价?")){
 		return ;
 	}
 }
  var ob=document.all.listForm;
  if(validateAll(ob)){
	document.listForm.action="proposalbuzi.cmd?method=dofankui";
	document.listForm.submit();
	}
}

function reset(){
	document.listForm.attitsatisfy.value='';
	document.listForm.resultsatisfy.value='';
	document.listForm.feedbackcomment.value='';
}

</script>
</head>

<body>

<FORM name=listForm method=post>
<html:hidden name="id" property="id"></html:hidden>
<html:hidden name="state" property="state"></html:hidden>
<html:hidden name="PROCESSDEPTID" value="<%=request.getParameter("PROCESSDEPTID") %>"></html:hidden>
<DIV style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 8px; MARGIN: auto; WIDTH: 100%; PADDING-TOP: 8px; BACKGROUND-COLOR: #ffffff">
<DIV style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FONT-WEIGHT: bold; FONT-SIZE: 14px; BACKGROUND-IMAGE: url(/images/tian/bg1.gif); MARGIN-BOTTOM: 12px; PADDING-BOTTOM: 0px; COLOR: #8d4d12; LINE-HEIGHT: 30px; PADDING-TOP: 0px; HEIGHT: 30px">
反馈提案的办复意见
</DIV>
<TABLE 
style="PADDING-LEFT: 6px; FONT-SIZE: 14px; LINE-HEIGHT: 32px; BORDER-COLLAPSE: collapse" 
borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%" border=1>
  <TBODY>
  <TR>
    <TD align='right' width='30%'>满意度：</TD>
    <TD>
    <%if("1".equals(iswrite)){ %>
     <html:radioGroup name="satisfy" property="satisfy" collection="PROPOSALSATISFY_COLLECTION" labelProperty="value" labelKey="key"></html:radioGroup>
     <%}else{ %>
    <html:label property="satisfy" name="satisfy" collection="PROPOSALBUZI_SATISFY_COLLECTION" labelProperty="value" labelKey="key" />
    <%} %>
      </TD></TR>
  <TR>
    <TD vAlign="middle" align='right' width='30%'>意见：</TD>
    <TD 
    style="PADDING-RIGHT: 0px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px">
    <%if("1".equals(iswrite)){ %>
    <TEXTAREA id=feedbackcomment style="BORDER-RIGHT: #c8c8c8 1px solid; BORDER-TOP: #c8c8c8 1px solid; BORDER-LEFT: #c8c8c8 1px solid; WIDTH: 540px; BORDER-BOTTOM: #c8c8c8 1px solid; BACKGROUND-COLOR: #f5f5f5" name=feedbackcomment rows=10 cols=75 cn_name="代表意见" datatype="text" nullable="yes" maxsize="4000"><html:value property="feedbackcomment"/></TEXTAREA> 
    <%}else{ %>
    <html:value property="feedbackcomment"/>
    <%} %>
    </TD></TR>
        <%if("1".equals(iswrite)){ %>
  <TR>
    <TD align=right>&nbsp;</TD>
    <TD height=36>
    <A onclick="save()" 
      href="#">
       提&nbsp;交</A> &nbsp;&nbsp;&nbsp; 
       <A onclick="reset()" 
      href="#">
	  重&nbsp;填</A>
	  </TD></TR>
		  <%} %>  
	  </TBODY></TABLE></DIV></FORM>
      
</body>
</html>
