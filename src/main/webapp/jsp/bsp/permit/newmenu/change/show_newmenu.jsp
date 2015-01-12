<%@ page contentType="text/html;charset=GBK" %> 
<%
	String typeId=(String)request.getAttribute("typeId");
String url=null;
if(!StringUtils.isEmpty(typeId)){
 SessionCreatingServlet sessionServlet=(SessionCreatingServlet)ComponentFactory.getBean("sessionServlet");
 url=(String)sessionServlet.getMenuType().get(typeId);
}

String app=request.getContextPath();
%>
<%@page import="net.mast.waf.ComponentFactory"%>
<%@page import="net.mast.bsp.permit.pep.ui.SessionCreatingServlet"%>
<%@page import="net.mast.util.StringUtils"%>
<HTML>
<HEAD>
<TITLE>切换菜单</TITLE> 
</HEAD>
<BODY topmargin="10px"> 

</BODY>

<script language="javascript">
<%
if(url!=null){
	%>

top.location.href="<%=app%><%=url%>";
<%
}else{
%>
alert("您没有该系统的访问权限!");
window.history.back();
<%}%>
//init();
function init(){
		var r=sendxmlhttp("refresh.cmd?typeId=<%=typeId%>");
		if(r.length>50){
			r="刷新菜单出错！";
		}
		alert(r);
		top.location.reload();
}
function sendxmlhttp(url){
	var conn = new ActiveXObject("Microsoft.XMLHTTP");
	conn.open("POST", url, false);
	conn.setRequestHeader("Content-Type","text/xml;charset=GBK");
        conn.send();
        return conn.responseText;
} 
</script>