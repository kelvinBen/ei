<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/pubcommonhelp" prefix="help"%>

<%@page import="net.mast.bsp.permit.context.GetBspInfo"%>
<HTML>
<HEAD>
<TITLE>����������ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<% 
    String superCode = (String)request.getAttribute("superCode");
    String country = (String)request.getAttribute("country");	
    String parentCode = (String)request.getAttribute("parentCode");
        if(country==null || country.equals("")){
		country="CN";
      }
      if(superCode==null || superCode.equals("")){
		superCode=country;
      }
	  if(parentCode==null || parentCode.equals("")){
			parentCode="CN";
	}
  
  List s=new ArrayList();
  request.setAttribute("flexgrid.data",s);
  for(int i=0;i<10;i++){
	  Map m=new HashMap();
	 m.put("cantCode",i+"c");
	 m.put("cantName",i+"����");
	 m.put("shortName",i+"���");
	 s.add(m);
  }
  String 	sourceReferenceId=request.getParameter("sourceReferenceId");
	if(sourceReferenceId==null)sourceReferenceId="";	
 
String procDefId = request.getParameter("procDefId");
		String actDefId=request.getParameter("actDefId");
		String actDefName=request.getParameter("actDefName");
		String fromActListPage=request.getParameter("fromActListPage");

    Map map = new HashMap();
map.put("viewprop","����ֵ");
map.put("dateprop",new Date());
request.setAttribute("html.data", map);
%>
<widgets:container title=" �б�" >

<html:form name="frmList" action="testprocess.jsp">

</html:form>
</widgets:container>

<script language="javascript">

//�Լ�����ѡ����
function createP(){

	document.forms[0].submit();

	
}


</script>

<script Language="JavaScript">

var msg="����һ�������Ч����JavaScript�ĵ�";

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

