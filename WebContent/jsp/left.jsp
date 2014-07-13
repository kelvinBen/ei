<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<meta http-equiv=Content-Type content="text/html;  charset=GB2312">
<link href="include/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<mast:ui css='main.css'/>">
<script language="javascript" src="<%=request.getContextPath()%>/js/jquery/jquery.js"></script>
<script language="javascript" src="<%=request.getContextPath() %>/js/jquery/jquery.query.js"></script>
<TITLE></TITLE>

<script>
function getvalue(b){
	if(b=="menu"){
		window.document.all("new_date").style.display="none";
		window.document.all("new_menu").style.display="block";
		//menu.background="<mast:ui img='menu1_h.gif'/>";
		//tree.background="<mast:ui img='tree1.gif'/>";
		
	}else{
		window.document.all("new_menu").style.display="none";
		window.document.all("new_date").style.display="block";
		//menu.background="<mast:ui img='menu1.gif'/>";
		//tree.background="<mast:ui img='tree1_h.gif'/>";
}
}
function openDiv(){
	$('#card_all').css('display', 'block');
}
function closeDiv(){
	$('#card_all').css('display', 'none');
}
</script>
</HEAD>
<BODY  leftmargin="0" topmargin="0" scrolling="no" class="menubg" style="height:100%;width:100%;">
<div style="height:100%;width:100%;">
<DIV class="body" id="card_all" style="height:100%;width:100%;display:none;z-index:999;position:absolute;background:#fff;filter:alpha(opacity=75);">
	
</DIV>
<div style="height:100%;width:100%;">
<div class="title" >&nbsp;**** 菜  单 **** </div>
<table border="0" style="display:none" cellspacing="0" cellpadding="0"><tr><td id="menu" onclick="getvalue('menu');"> </td><td id="tree"  width="100" height="24" onclick="getvalue('date');" align="center" > </td></tr></table>

<IFRAME border="0" style="display:block;height:expression(document.body.clientHeight-25);" id="new_menu" name="new_menu" marginWidth=0 frameSpacing=0 marginHeight=0 src="menu.jsp" frameBorder=0 noResize width="100%" height="100%" scrolling="no" vspale="0" ></IFRAME>
<IFRAME border="0" style="display:none;height:expression(document.body.clientHeight-25);" id="new_date" name="new_date" marginWidth=0 frameSpacing=0 marginHeight=0  frameBorder=0  width="100%"  ></IFRAME>
</div>
</div>
</BODY>
</HTML>
