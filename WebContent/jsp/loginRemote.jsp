<%@ page import ="org.apache.commons.codec.net.URLCodec"%>
<%
String userId = (String)request.getAttribute("userId");
String password = (String)request.getAttribute("password");
String token = (String) request.getAttribute("token");
if(token!=null){
	URLCodec urlCodec = new URLCodec();
	token = urlCodec.encode(token);
}
System.out.println("userId:"+userId+"|password:"+password+"|token:"+token);
String url = request.getContextPath()+"/j_bsp_security_check/up?j_username="+userId+"&j_password="+password+"&j_token="+token;
response.sendRedirect(url); 
%>