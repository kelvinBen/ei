<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%	String app=request.getContextPath();
%>
<HTML>
<HEAD>
<meta http-equiv=Content-Type content="text/html;  charset=GB2312">
<TITLE>menu2</TITLE>
<script>
var urlBasePath="";//���Ըĳ�Ӧ�õ�·��;
//��ʾ��
function viewtree(b){
	c=b.split("|");
	if(c[0]=="menu"){
		parent.document.all("new_date").style.display="none";
		parent.document.all("new_menu").style.display="block";
		parent.document.all("menu").background="<mast:ui img='menu1_h.gif'/>";
		parent.document.all("tree").background="<mast:ui img='tree1.gif'/>";
	}else{
		parent.document.all("new_date").src=c[0];
		parent.document.all("new_menu").style.display="none";
		parent.document.all("new_date").style.display="block";
		
		parent.document.all("tree").background="<mast:ui img='tree1_h.gif'/>";
		parent.document.all("menu").background="<mast:ui img='menu1.gif'/>";
		parent.document.all("tree").innerText='��';
	}
}
//����TOPҳ�ĺ�����ģ���л�
function settop(b){
	top.banner.setmenuid(b);
	
}
//��TOPҳ���ʱ���˵�ģ���л�
function setmenuid(b){
	window.document.menu2.SetVariable("_root.menuid",b);
}
//���ò˵�xml��url����ʼ��ʱ����
function setmenuXml(){
	window.document.menu2.SetVariable("_root.menuURL","<%=app%>/");
	window.document.menu2.SetVariable("_root.menuXml","<%=app%>/menuxml.cmd");
}
function viewzhux(url)
{
	
   if(confirm("��ȷ��Ҫע����"))
   {
	  top.location.href="../"+url;
   }
}
function viewtreecard(){
}
</script>
</HEAD>

<BODY onload="setmenuXml();">
<!-- URL's used in the movie-->
<!-- text used in the movie-->
<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
 WIDTH="100%" HEIGHT="100%" id="menu2" ALIGN="">
 <PARAM NAME=movie VALUE="<mast:ui img='menu.swf'/>"> <PARAM NAME=menu VALUE=false> <PARAM NAME=quality VALUE=high> <PARAM NAME=scale VALUE=noscale> <PARAM NAME=salign VALUE=LT> <PARAM NAME=devicefont VALUE=true> <EMBED src="<mast:ui img='menu.swf'/>" menu=false quality=high scale=noscale salign=LT devicefont=true bgcolor=#FFFFFF  WIDTH="200" HEIGHT="400" NAME="menu2" ALIGN=""
 TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
</OBJECT>

</BODY>
</HTML>
