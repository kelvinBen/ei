<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.mof.model.MofWindowManager"%>
<%@ page import="net.mast.mof.model.MofProcessManager"%>
<%
String msg = "资源刷新成功!";
try{
	MofWindowManager.refershCache();
	MofProcessManager.refershCache();
}catch(Exception e){
  msg = e.getMessage() + ":" + e;
}
%>
<h1>
<%=msg%>
</h1>