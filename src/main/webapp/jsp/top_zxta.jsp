<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@page import="net.mast.util.DateUtil"%>
<%@page import="net.mast.bsp.permit.context.BspInfo"%>
<%@page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%
String app = request.getContextPath();
BspInfo user=GetBspInfo.getBspInfo(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="include/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="include/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="include/jquery.pngFix.pack.js"></script>
<style type="text/css">
html{ overflow:hidden; height:100%}
</style>
<script language="JavaScript">
$(function(){
  //ie6 png bug
  $(document).pngFix();		   
})
</script>
</head>

<body style="background-image:url(images/005.jpg); background-repeat:no-repeat; background-position:left top">
<table  width="100%" height="23" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="94%">
	<div><img src="images/001.png" /></div>
	<div class="nameIfo"><img src="images/007.png" /> 欢迎您，<span style="color:#FF0000"><%=user.getUserName() %></span> [<%=user.getDepartment().getOrganAlias() %>]</div>
	</td>
    <td width="6%" align="right"><img src="images/002.png" />
	<div class="outIfo"><img src="images/008.png" /> <a href="#" onclick="toDesk()" class="blueLink">桌面</a>&nbsp;&nbsp;
	<img src="images/01.gif" /><a href="#" onclick="reshworkspace()" class="blueLink">工作台</a>&nbsp;&nbsp;
	<img src="images/desktop009.png" /> <a href="#" onclick="logout()" class="blueLink">退出</a></div>
	</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td width="15px"> </td>
    <td width="60px"><img src="zxtb.jpg"  height="53"/></td>
    <td width="230px" valign="middle" align="left" style="vertical-align:middle;font-size: 24px;color: red">
	<b>政&nbsp;协&nbsp;提&nbsp;案&nbsp;管&nbsp;理&nbsp;系&nbsp;统</b>
	</td>
    <td valign="bottom" style="padding-left:50px">

	<table id="menutable" border="0" cellspacing="0" cellpadding="0" class="BtnCss">
  <tr id="menulist" >
 <!--     <td class="select">结果查询</td>
    <td class="line"></td>
	<td onclick="doclick('2','null','')">通知通告</td>
	<td class="line"></td>
	<td>值班考情</td>-->
  </tr>
</table>

	</td>
    <td valign="bottom" align="right"><div style="color:#ffffff; padding-bottom:13px; padding-right:14px"><img src="images/005.png" /> 今天是 
      <!-- #BeginDate format:fcIS1 --><%=DateUtil.getCursorDate("yyyy-MM-dd")%><!-- #EndDate --></div></td>
  </tr>
</table>

<div style="height:100%; position:absolute; right:0; top:0; z-index:1"><img src="images/006.png" /></div>
</body>
</html>

<script language="JavaScript">

$.ajax({
url: "<%=app%>/menuxml.cmd",
global: false,// 禁用全局Ajax事件.
dataType: 'String',
error: function(){
	alert('加载菜单失败');
},
success: function(xml){
  //var s= xml.childNodes[1];
 // alert(xml);
 var s=$(xml);
  
   for(var i=1;i<s.size()-1;i++){
   	var t=s.get(i);
    //alert("i="+i+t.getAttribute("text"));
      var tr1=$('#menulist');
      //alert(tr1.html());
      
      tr1.append('<td  id="menu'+i+'" onclick="doclick(\''+(i-1)+'\',\''+t.getAttribute("url")+'\',\''+t.getAttribute("targetframe")+'\')">'+t.getAttribute("text")+'</td>');
	  tr1.append('<td class="line"></td>');
//	  alert($('#menu'+i).html());
//	  $('#menu'+i).noWrap=true;
    // var menutable = document.getElementById('menutable');
    // alert(menutable.innerHTML);
    //     var tr1=table1.lastChild;
   //   var tr1=document.getElementById('menulist');
     // alert(tr1.innerHTML);
//	  var td= tr1.insertCell();
//	  td.className="line";
//	  td= tr1.insertCell();
//	  td.innerHTML=t.getAttribute("text");
	  
   }
   $(document).pngFix();
//   var s1= s.children().get(0);
//  alert(s.getAttribute("text"));
}
});


function doclick(icell ,url ,targetframe)
{
	var lastselect=$(".select");
 	lastselect.removeClass("select");
 	//lastselect.addClass("notselect");
	var otd=event.srcElement;
//	$(otd).removeClass("notselect");
//	$(otd).addClass("select");
	otd.className="select";
	 $(document).pngFix();
	// alert(icell+",url="+url+",targetframe="+targetframe);
	if(url!="null")
	{
		var restr=/\|/g;
		var urls=url.replace(restr,"&");
	//	var targetframe=otd.targetframe;
		var	baseUrl="<%=app%>";

		if(urls!=null &&urls.substring(0,4).toUpperCase()!="HTTP"){
		urls = baseUrl+"/"+urls;
		}
		if(targetframe=="_tree")
		{
		if(urls!=null && urls!="")
			{
		top.main.location.href="content.jsp";
		top.contents.new_date.location.href=urls;
		top.contents.document.all("new_date").style.display="block";
		top.contents.document.all("new_menu").style.display="none";
			}
		return;
		}

		if(urls!=null && urls!="")
			if(targetframe==""||targetframe=="main"){
					top.main.location.href=urls;
					top.contents.document.all("new_date").style.display="none";
					top.contents.document.all("new_menu").style.display="block";
					//return ;
				}
				if(targetframe=="_blank"){
					window.open(urls,"","");
					//return ;
				}
				if(targetframe=="_top"){
					top.location.href=urls;
					//return ;
				}
				top.contents.menu.click();
		top.contents.new_menu.createMenuById(icell,isportal);		
	}else{
		//top.main.location.href="content.jsp";
		var isportal="1";
		// alert(icell+",url="+url+",isportal="+isportal);
		top.contents.menu.click();
		top.contents.new_menu.createMenuById(icell,isportal);
	}
}

function logout(){
if(confirm("您要退出系统吗?"))
	top.location.href="<%=app%>/logout.cmd?method=logout";
}

function toDesk(){
	top.location.href="<%=app%>/desktop/desktop.jsp";
}
function reshworkspace(){
	top.main.location.href="content.jsp"; 
}
</script>