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
<TITLE>行政区划查询</TITLE>
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
	 m.put("cantName",i+"名称");
	 m.put("shortName",i+"简称");
	 s.add(m);
  }
  String 	sourceReferenceId=request.getParameter("sourceReferenceId");
	if(sourceReferenceId==null)sourceReferenceId="";	
 
String procDefId = request.getParameter("procDefId");
		String actDefId=request.getParameter("actDefId");
		String actDefName=request.getParameter("actDefName");
		String fromActListPage=request.getParameter("fromActListPage");

    Map map = new HashMap();
map.put("viewprop","参数值");
map.put("dateprop",new Date());
request.setAttribute("html.data", map);
%>
<widgets:container title=" 列表" >

<html:form name="frmList" action="testprocess.jsp">

</html:form>
</widgets:container>

<script language="javascript">

//自己设置选中项
function createP(){

	document.forms[0].submit();

	
}


</script>

<script Language="JavaScript">

var msg="这是一个跑马灯效果的JavaScript文档";

var interval = 100; //setTimeout执行一次的时间.

var spacelen = 120;

var space10=" ";

var seq=0;

function Scroll() { 
  
   len = msg.length;
  
   window.status = msg.substring(0, seq+1);
  
   seq++;
  
   if ( seq >= len ) { //如果msg字符串全部显示出来
  
    seq = spacelen; 
   
    window.setTimeout("Scroll2();", interval );   //跑马开始
  
   }
  
   else
  
    window.setTimeout("Scroll();", interval );

} 

function Scroll2() { 
  
   var out="";
  
   for (i=1; i<=spacelen/space10.length; i++)    //space10.length始终是1,spacelen为120恒久不变;这里为的就是在msg前加上120个空格
  
    out += space10;   //空格字符串
  
   out = out + msg; //形成这个样的字符串:"             这是一个跑马灯效果的JavaScript文档"
  
   len=out.length;
  
   window.status=out.substring(seq, len);   //每一次都减少一个前面的空格
  
   seq++;
  
   if ( seq >= len ) { seq = 0; };   //如果字符串跑完了,使seq=0.重新再跑
  
   window.setTimeout("Scroll2();", interval );

} 

Scroll();

</script>

