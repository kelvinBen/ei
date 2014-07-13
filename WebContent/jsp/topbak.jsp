<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
String app = request.getContextPath();
%>
<HTML>
<HEAD>
<meta http-equiv=Content-Type content="text/html;  charset=GB2312">
<TITLE>top</TITLE>

</HEAD>
<BODY bgcolor="#CCCCCC" topmargin="0" leftmargin="0" onresize="doresize();">
<TABLE width="100%" cellspacing=0 border=0 cellpadding=0 style="border:1 solid gray;border-bottom-width:0px;">
<TR style="background-color:#D2E9EE">
<TD colspan=2 height=50  >
	<div style="height:49px;overflow:hidden">
	<img src="<mast:ui img='ntmast/desktop008.png'/>" height=75px border=0 align=left></div></TD></TR><TR>
	<TD  style="background-image:url('<mast:ui img='top-center.jpg'/>');" ><div style="overflow:hidden;width:1px;" id="showmenu"></div>
	</TD>
	<TD  width="52px" style="background-image:url('<mast:ui img='top-center.jpg'/>');"><img onclick="moveleft()"  src="<mast:ui img='moveleft.jpg'/>" style="cursor:hand;"><img onclick="moveright()"  src="<mast:ui img='moveright.jpg'/>" style="cursor:hand;"></TD>
</TR>
</TABLE>
</BODY>
<script>
try{
var tab=document.body.getElementsByTagName("TABLE")[0];
var mvBtn=tab.rows[1].cells[1];
var muDiv=document.all("showmenu");
var fTd=0;
function doresize(){
	var dis=parseInt(muDiv.style.width,10)+60-parseInt(document.body.offsetWidth,10);
	if(dis>0)
		muDiv.style.width=parseInt(muDiv.style.width,10)-dis;
	else{
		muDiv.style.width=Math.min(parseInt(document.body.offsetWidth,10),limit,parseInt(muDiv.style.width,10)-dis);
		for(var k=0;k<len;k++)
			muTab.rows[0].cells[k].style.display="";
	}
}
//左移动
function moveleft()
{
	var divall=document.all("showmenu");
var tab=divall.children[0];
//alert(tab.offsetWidth+","+divall.offsetWidth);
if(tab.offsetWidth<=divall.offsetWidth) return;
//alert(tab.offsetWidth+","+tab.clientWidth);
//alert(tab.rows[0].cells[8].offsetWidth+","+tab.rows[0].cells[8].clientWidth);
for(var i=0;i<tab.rows[0].cells.length;i++)
	{
	var otd=tab.rows[0].cells[i];
	if(otd.style.display!="none")
		{
		otd.style.display="none";
		break;
		}
	}

}
//右移动
function moveright()
{
	var divall=document.all("showmenu");
var tab=divall.children[0];
//if(tab.offsetWidth<=divall.offsetWidth) return;
for(var i=tab.rows[0].cells.length-1;i>-1;i--)
	{
	var otd=tab.rows[0].cells[i];
	if(otd.style.display=="none")
		{
		otd.style.display="";
		break;
		}
	}

}

function createFileds()
{
var xmldoc=loadData("<%=app%>/menuxml.cmd",1);
//alert(xmldoc.xml);
if(typeof xmldoc=="undefined")
	return;
var tabstr='<table width="100%" height="19" border=0 cellspacing=0 cellpadding=2><tr>';
for(var i=0;i<xmldoc.selectNodes("menu").length;i++)
	{
	var onode=xmldoc.selectNodes("menu")[i];
	//tabstr+='<td onmouseover="this.className=\'netbankblack\';" onmouseout="this.className=\'\';" type="text"></td>';
	tabstr+='<td nowrap align=center onclick="doclick('+i+');" url="'+onode.getAttribute("url")+'" targetframe="'+onode.getAttribute("targetframe")+'">';
	tabstr+='<span style="font-size:10pt;cursor:hand;" url="'+onode.getAttribute("url")+'"  title="'+onode.getAttribute("text")+'">|&nbsp;'+onode.getAttribute("text")+'&nbsp;</span></td>';
	}
document.all("showmenu").innerHTML=tabstr+'</tr></table>';
}
//xml读取数据，数据来自一个xml文件，参数是这个xml文件的url
function loadData (url,param) {
		  //xmlDoc.load(window.location.protocol + "//" + window.location.host+url);
	var xmlDoc = new ActiveXObject("Msxml.DOMDocument");
	xmlDoc.async = false;
	xmlDoc.preserveWhiteSpace = true;
	if (param == null)
	{
		var restr=/>\s</g;
		url=url.replace(restr,"");
	  xmlDoc.loadXML(url);
	 }
	else
	   xmlDoc.load(url);
	if(xmlDoc.childNodes[1]!=null)
		return xmlDoc.childNodes[1];
}

function doclick(icell)
{
		var otd=event.srcElement;
		while(otd.tagName!="TD")
			otd=otd.parentElement;
	if(otd.url!="null")
	{
		var restr=/\|/g;
		var urls=otd.url.replace(restr,"&");
		var targetframe=otd.targetframe;
		var	baseUrl="<%=app%>";
		if(urls.indexOf("logout.cmd")!=-1&&!confirm("确实要执行"+otd.children[0].title+"吗？")) return;
		if(urls!=null &&urls.substring(0,4).toUpperCase()!="HTTP"){
		urls = baseUrl+"/"+urls;
		}
		if(targetframe=="_tree")
		{
		//top.main.location.href="frames1.htm";
		//alert(top.main.document.all("framestree"));
		if(urls!=null && urls!="")
			{
		top.main.location.href="content.jsp";
		top.contents.new_date.location.href=urls;
		top.contents.document.all("new_date").style.display="block";
		top.contents.document.all("new_menu").style.display="none";
		//top.content.treebar.location.href="treebar.jsp";
		//top.content.main.location.href="content.jsp";
			}
		return;
		}
	//top.content.document.all("framestree").cols='0,*';
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
	}else{
	top.main.location.href="content.jsp";
	var isportal="1";
	top.contents.menu.click();
	top.contents.new_menu.createMenuById(icell,isportal);
	}
}
createFileds();
var muTab=muDiv.children[0];
var len=muTab.rows[0].cells.length;
var limit=0;
for(var j=0;j<len;j++)
	limit+=muTab.rows[0].cells[j].offsetWidth;
//var initW=Math.min(parseInt(document.body.offsetWidth,10),limit);
muDiv.style.width=Math.min(parseInt(document.body.offsetWidth,10)-60,limit);
}catch(ex){}
</script>
</HTML>
<!-- 自动接收邮件 Frame 状态：隐藏 -->
<iframe name="autoFrm" src="<%=app%>/mailfolder.cmd?method=getMailInfo" style="display:none;"></iframe>
