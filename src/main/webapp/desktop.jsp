<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.bsp.permit.context.BspInfo" %>
<%@ page import="net.mast.bsp.permit.context.BspInfoKey" %>
<%	
String app=request.getContextPath();
BspInfo bspInfo=(BspInfo)request.getSession().getAttribute(BspInfoKey.BSPINFOKEY);
if(bspInfo==null){
%>
<link href="../skins/default/css/ntmast/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../skins/default/js/ntmast/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../skins/default/js/ntmast/jquery.pngFix.pack.js"></script>
<style type="text/css">
html{ overflow:hidden}
body{ overflow:hidden}
</style>
<script>
$(function(){
  //ie6 png bug
  $(document).pngFix();	
  //
  var w=$(window).width();
  var h=$(window).height();
  var top=(h-380)/2;
  var left=(w-634)/2;
  $("#land #gxz").css({"top":top,"left":left});
  $(window).resize(function(){
  w=$(window).width();
  h=$(window).height();
  top=(h-380)/2;
  left=(w-634)/2;
  $("#land #gxz").css({"top":top,"left":left});
  
  })
  //图标拖动
  $('#land h1').bind('drag',function(event){
  $("#land #gxz").css({
  "top": event.offsetY,
  "left": event.offsetX
  });
  }); 		   
})
</script>
<script type="text/javascript" >
alert("您的还没有登录系统，请重新登录!");
window.location.href="../jsp/login.jsp";
</script>
<%
return;
} 
%>

<% 
String user=bspInfo.getUserName();
String userid=bspInfo.getUserId();
String compony=bspInfo.getLoginCorporation().getOrgan().getOrganName();
String servername=request.getServerName();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>网络平台桌面</title>

    <link rel="stylesheet" type="text/css" href="../ext3.1/resources/css/ext-all.css" />
    <link rel="stylesheet" type="text/css" href="css/desktop.css" />
	<link href="../skins/default/css/ntmast/style.css" rel="stylesheet" type="text/css" />
<!--<script type="text/javascript" src="../skins/default/js/ntmast/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../skins/default/js/ntmast/jquery.pngFix.pack.js"></script> --> 
<script type="text/javascript" >
//应用上下文路径
var app="<%=app%>";
var user="<%=user%>";
var compony="<%=compony%>";
//alert(app);
window.onbeforeunload=logout;
	function logout(){
	
	     if(document.body.clientWidth-event.clientX< 170&&event.clientY< 0||event.altKey){ 	   	 
		 	xmlhttp(app+"/logout.cmd?method=logout");
	     }
      }

</script>
    <!-- GC -->
 	<!-- LIBS -->
 	<script type="text/javascript" src="../ext3.1/adapter/ext/ext-base.js"></script>
 	<!-- ENDLIBS -->

    <script type="text/javascript" src="../ext3.1/ext-all.js"></script>

    <!-- DESKTOP -->
    <script type="text/javascript" src="js/StartMenu.js"></script>
    <script type="text/javascript" src="js/TaskBar.js"></script>
    <script type="text/javascript" src="js/Desktop.js"></script>
    <script type="text/javascript" src="js/App.js"></script>
    <script type="text/javascript" src="js/Module.js"></script>
    <script type="text/javascript" src="sample.js"></script>
<!--<script>
$(function(){
  //ie6 png bug
  $(document).pngFix();	
  //
  var w=$(window).width();
  var h=$(window).height();
  var top=(h-380)/2;
  var left=(w-634)/2;
  $("#land #gxz").css({"top":top,"left":left});
  $(window).resize(function(){
  w=$(window).width();
  h=$(window).height();
  top=(h-380)/2;
  left=(w-634)/2;
  $("#land #gxz").css({"top":top,"left":left});
  
  })
  //图标拖动
  $('#land h1').bind('drag',function(event){
  $("#land #gxz").css({
  "top": event.offsetY,
  "left": event.offsetX
  });
  }); 		   
})
</script> -->

</head>
<body scroll="no">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td  height="100" class="topLine">
	<div style="float:left; padding-left:60px; margin-top:14px"><img src="../skins/default/images/ntmast/desktop008.png"></div>
	<div class="tuichu"><img src="../skins/default/images/ntmast/desktop009.png" width="15" height="15">  <a href="#">注销用户</a></div>
	<div style="float:right; font-size:13px; padding-top:30px">您好，<span style="color:#007D35">admin</span>  欢迎登录系统！</div>	</td>
  </tr>
  <tr>
    <td height="100%"  valign="top">
	<div id="gxz">

  <ul id="desk_list">
 <!-- <li url="show.html"><a href="index.html"><img src="../skins/default/images/ntmast/desktopIco01.png" width="76" height="74"/><p>个人空间</p></a></li>
  <li url="show.html"><a href="index.html"><img src="../skins/default/images/ntmast/desktopIco02.png" width="76" height="74"/><p>数据分析</p></a></li>
  <li url="show.html"><a href="index.html"><img src="../skins/default/images/ntmast/desktopIco03.png" width="76" height="74"/><p>用户属性</p></a></li>
  <li url="show.html"><a href="index.html"><img src="../skins/default/images/ntmast/desktopIco04.png" width="76" height="74"/><p>值班考勤</p></a></li>
   <li url="show.html"><a href="index.html"><img src="../skins/default/images/ntmast/desktopIco01.png" width="76" height="74"/><p>个人空间</p></a></li> -->

  <div id="x-desktop">
    <dl id="x-shortcuts">
        <dt id="grid-win-shortcut">
            <a href="#"><img src="images/s.gif" />
            <div><font size="2">新的提案</font></div></a>
        </dt>
        <dt id="acc-win-shortcut">
            <a href="#"><img src="images/s.gif" />
            <div><font size="2">新建审批事项 </font></div></a>
        </dt>
    </dl>

<iframe name="main" width="80%" height="98%" align="right" frameborder="0" src="<%=app%>/taskinfodaiban.cmd?method=getProcessTypeList&clear=true"  ></iframe>

</div>
  </ul>
  

</div>	</td>
  </tr>
  <tr>
    <td height="31" valign="top">
	<!--<div style="height:31px; width:100%; position:absolute; z-index:110;background-image:url(../skins/default/images/ntmast/002.jpg)">
	<div class="startBtn1"><a href="#" class="startBtn"></a></div>
	</div> -->
	
	<div id="ux-taskbar">
	<div id="ux-taskbar-start"></div>
	<div id="ux-taskbuttons-panel"></div>
	<div class="x-clear"></div>
</div>
	</td>
  </tr>
</table> 

 



</body>
</html>
