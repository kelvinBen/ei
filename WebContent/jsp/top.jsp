<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@page import="net.mast.util.DateUtil"%>
<%@page import="net.mast.bsp.permit.context.BspInfo"%>
<%@page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date,
				java.util.Locale"%>
<%@ page import="net.mast.bsp.permit.context.BspInfoKey" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>

<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%
	String app = request.getContextPath();
%>
<%
	SimpleDateFormat bartDateFormat=new SimpleDateFormat("yyyy-MM-dd-EEEE HH:mm");
	Date date=new Date();
	
	BspInfo bspInfo=(BspInfo)request.getSession().getAttribute(BspInfoKey.BSPINFOKEY);
	String user=bspInfo.getUserName();
	String userid=bspInfo.getUserId();
	String compony=bspInfo.getLoginCorporation().getOrgan().getOrganName();
	String servername=request.getServerName();
%>
<%
	String message="欢迎使用企业信息管理系统: "+user+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	String corporation=(String)session.getAttribute("CORPORATIONNAME");
	message=message+"<br>"+corporation;
%>

<%@page import="org.apache.catalina.core.ApplicationContext"%><HTML>
<HEAD>
<meta http-equiv=Content-Type content="text/html;  charset=GB2312">
<TITLE>top</TITLE>
<script language="javascript" src="<%=request.getContextPath()%>/js/jquery/jquery.js"></script>
<script language="javascript" src="<%=request.getContextPath() %>/js/jquery/jquery.query.js"></script>
<script type="text/javascript">
function openDiv(){
	$('#card_all').css('display', 'block');
}
function closeDiv(){
	$('#card_all').css('display', 'none');
}
</script>
</HEAD>
<BODY topmargin="0" leftmargin="0" onresize="doresize();" style="height:100%;width:100%;">
<div style="height:100%;width:100%;">
<DIV id="card_all" style="height:100%;width:100%;display:none;z-index:999;position:absolute;background:#fff;filter:alpha(opacity=75);">
	
</DIV>
<div style="height:100%;width:100%;">
<TABLE width="100%" cellspacing=0 border=0 cellpadding=0 style="border:1 solid gray;border-bottom-width:0px;">
    <TR>
    <TD colspan=2 height=50  background="<mast:ui img='yop1.JPG'/>">
	<img src="<mast:ui img='cnooclogo1.jpg'/>" border=0 align=left><div align=right style="color: #FFFFFF; font-size: 9pt"><br /><strong><%=message%></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></TD>
	</TR>
	<TR>
	<TD  style="background-image:url('<mast:ui img='top-center.jpg'/>');" ><div style="overflow:hidden;width:1px;" id="showmenu"></div>
	</TD>
	<TD  width="60px" style="background-image:url('<mast:ui img='top-center.jpg'/>');"><img onclick="moveleft()"  src="<mast:ui img='moveleft.jpg'/>" style="cursor:hand;"><img onclick="moveright()"  src="<mast:ui img='moveright.jpg'/>" style="cursor:hand;"></TD>
</TR>
</TABLE>
</div>
</div>
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
		if(top.main.main!=null){
		   top.main.main.location.href="content.jsp";
		}else{
		   top.main.location.href="content.jsp";
		}	
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
		if(targetframe==""||targetframe=="main"||targetframe=="main.main"){
		     if(top.main.main!=null){
				 top.main.main.location.href=urls;
			  }else{
				  top.main.location.href=urls;
			  }
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
	if(top.main.main!=null){
		   top.main.main.location.href="content1.jsp";
		}else{
		   top.main.location.href="content1.jsp";
		}	
	var isportal="1";
	//顶部菜单 高亮 
	
	// 清空高亮
	var otr = otd.parentElement;
	var tds = otr.getElementsByTagName("td");
	for(var i=0;i<tds.length;i++){
		tds[i].style.fontWeight="";
	}
	//为当前菜单高亮
	otd.style.fontWeight="bold";
	
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
<!-- 自动接收邮件 Frame 状态：隐藏 
<iframe name="autoFrm" src="<%=app%>/mailfolder.cmd?method=getMailInfo" style="display:none;"></iframe>-->
