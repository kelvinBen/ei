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
<TITLE>�л��˵�</TITLE> 
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
alert("��û�и�ϵͳ�ķ���Ȩ��!");
window.history.back();
<%}%>
//init();
function init(){
		var r=sendxmlhttp("refresh.cmd?typeId=<%=typeId%>");
		if(r.length>50){
			r="ˢ�²˵�����";
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