<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.bsp.permit.pep.ui.AuthenticationProcessingFilter" %>
<%
String j_auth_action=request.getContextPath()+"/j_bsp_security_check/ad";
String url = request.getContextPath()+"/jsp/ad.jsp";
%>
<html>
<head>
<title>adµÇÂ¼</title>
</head>
<body >
<form name="form1" action="" method="post">
     <input type="hidden" name="j_username" value="" >
	 <input type="hidden" name="j_password" value="" >
   </form>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
if(self!=top){
	top.location=self.location;
}else{
   init();
}
function init(){	
	var uri ="<%=url%>";
	 var win = showModalDialog(uri,window,"scroll:yes;status:no;dialogWidth:324px;dialogHeight:235px"); 
	  if (win == null) {  
		 closed();		 
	  }
	  else{
	document.all("j_username").value=win[0];
	document.all("j_password").value=win[1];
	document.forms[0].action ="<%=j_auth_action%>";
    document.forms[0].submit();      
	 }
}
function closed()
{
var ua=navigator.userAgent 
var ie=navigator.appName=="Microsoft Internet Explorer"?true:false 
if(ie){ 
var IEversion=parseFloat(ua.substring(ua.indexOf("MSIE ")+5,ua.indexOf(";",ua.indexOf("MSIE ")))) 
if(IEversion< 5.5){ 
var str = '<object id=noTipClose classid="clsid:ADB880A6-D8FF-11CF-9377-00AA003B7A11">' 
str += '<param name="Command" value="Close"></object>'; 
document.body.insertAdjacentHTML("beforeEnd", str); 
document.all.noTipClose.Click(); 
} 
else{ 
window.opener =null; 
window.close(); 
} 
} 
else{ 
window.close() ;
} 
}
</SCRIPT>
