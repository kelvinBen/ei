<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="net.mast.bsp.lc.skin.BspSkin" %>
<%@ page import="net.mast.waf.ComponentFactory"%>
<%@ page import="net.mast.bsp.lc.service.ICommonSingleParmsService"%>
<%@ page import="net.mast.bsp.lc.view.CommonSingleParmsView"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>

<HTML>
<HEAD><TITLE>��ҵ��Ϣ����ϵͳ</TITLE>
<META http-equiv="Content-Type" content="text/html;charset=gb2312">
</HEAD>
<SCRIPT LANGUAGE="JavaScript">
var xmlHttp;
function createXMLHttpRequest() {
    if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    } 
    else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
}
function startRequest(url) {
    createXMLHttpRequest();
    xmlHttp.open("GET", url, false);
    xmlHttp.send(null);
    return xmlHttp.responseText;
}   
</SCRIPT>
<script for="window" event="onbeforeunload">  
 
      if(document.body.clientWidth-event.clientX< 170&&event.clientY< 0||event.altKey){ 	   	 
		 	startRequest("logout.cmd?method=logout");
      }
window.status="��ҵ��Ϣ����ϵͳ";      
</script>
<%
//��������
/*
ICommonSingleParmsService sps=(ICommonSingleParmsService)ComponentFactory.getBean("commonSingleParmsService");
String organId = GetBspInfo.getBspInfo().getEmployee().getOrgan().getOrganId();
CommonSingleParmsView view = (CommonSingleParmsView) sps.getCommonSingleParmsView(organId); 

if (view.getSingelStyle() != null && !view.getSingelStyle().equals(""))
{
	BspSkin skin=new BspSkin(request,view.getSingelStyle());	 
	session.setAttribute("Key.Skin",skin);
}
*/
%>
<frameset rows="85,*" id="fraTop"    frameSpacing="0" frameBorder="0">
	<FRAME id="banner" name="banner" src="jsp/top.jsp" noResize scrolling="no" target="contents">
  <FRAMESET id="fraContent" cols="10,170,0,*,8" framespacing="3" frameBorder="0" title="�������">
    <frame src="jsp/leftLine.html" name="leftLine" scrolling="No" noresize="noresize" id="leftLine" title="leftLine"  /> 
	<FRAME id="contents" name="contents"   src="jsp/left.jsp"  noresize="noresize" scrolling="no" target="main" TOPMARGIN="0" LEFTMARGIN="0" FRAMEBORDER="no" style="border-right:1 solid gray;">
    <FRAME  name="_tree" scrolling="auto" border="0" id="_tree" title="��" TOPMARGIN="0" LEFTMARGIN="0" FRAMEBORDER="no"  /> 

	<FRAME id="main" name="main" border="0" marginWidth="0" marginHeight="0" src="jsp/content.jsp" frameBorder="0"  target="_self" TOPMARGIN="0" LEFTMARGIN="0"  bordercolor="#C2DBF1" style="border-left:1 solid gray;">
  <frame src="jsp/content.jsp" name="rightLine" scrolling="No" noresize="noresize" id="rightLine" title="rightLine" /> 
  </FRAMESET>
   <noframes>
  <body>

  <p>����ҳʹ���˿�ܣ��������������֧�ֿ�ܡ�</p>

  </body>
  </noframes>
</frameset>
</HTML>
<script Language="JavaScript">
var msg="��ҵ��Ϣ����ϵͳ";
var interval = 100; //setTimeoutִ��һ�ε�ʱ��.
var spacelen = 120;
var space10=" ";
var seq=0;
function Scroll() { 
   len = msg.length;
   window.status = msg.substring(0, seq+1);
   seq++;
   if ( seq >= len ) { //���msg�ַ���ȫ����ʾ����
    seq = spacelen; 
    window.setTimeout("Scroll2();", interval );   //����ʼ
   }
   else
    window.setTimeout("Scroll();", interval );
} 
function Scroll2() { 
   var out="";
   for (i=1; i<=spacelen/space10.length; i++)    //space10.lengthʼ����1,spacelenΪ120��ò���;����Ϊ�ľ�����msgǰ����120���ո�
    out += space10;   //�ո��ַ���
   out = out + msg; //�γ���������ַ���:"             ����һ�������Ч����JavaScript�ĵ�"
   len=out.length;
   window.status=out.substring(seq, len);   //ÿһ�ζ�����һ��ǰ��Ŀո�
   seq++;
   if ( seq >= len ) { seq = 0; };   //����ַ���������,ʹseq=0.��������
   window.setTimeout("Scroll2();", interval );
} 

Scroll();

</script>


