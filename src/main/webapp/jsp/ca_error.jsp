<%@ page contentType="text/html;charset=GBK" %>
<%@ page isErrorPage="true" %>
<%@ page import="net.mast.bsp.permit.pep.ui.AuthenticationProcessingFilter" %>
<%@ page import="net.mast.bsp.permit.pep.ui.SessionCreatingFilter" %>
<%@ page import="net.mast.bsp.permit.exception.AuthenticationException" %>
<%@ page import="java.sql.*,
                net.mast.commons.exception.*,                
                net.mast.util.Utils,
                net.mast.util.IExceptionHandler,
                java.util.Map,
                java.util.Iterator,
                java.io.PrintWriter,
                java.io.ByteArrayOutputStream,
                net.mast.commons.exception.BaseInvocationTargetException                
                " %>
<%
Throwable obj=     (AuthenticationException) session.getAttribute(AuthenticationProcessingFilter.AUTHENTICATION_EXCEPTION);
if(obj==null){
	obj = (AuthenticationException) session.getAttribute(SessionCreatingFilter.SESSION_FAILED_EXCEPTION);
}
if(obj!=null){
	AuthenticationException ex =(AuthenticationException)obj;
}
%>
<script language="javascript">
function showMessage(){
	var message = document.getElementById("MESSAGE");
	if(message.style.display == "block")
		message.style.display = "none";
	else
		message.style.display = "block";
}

</script>
<html>
<head>
<title></title>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0">
<form>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1">
  <tr>
    <td width="100%" height="12">    
    </td>
  </tr>
  <tr>
    <td width="100%" height="12" bgcolor="#E8E8E8"><font size="1" color="#E8E8E8">1</font></td>
  </tr>
  <tr>
    <td width="100%" height="12">
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber3">
      <tr>
        <td width="5%">¡¡</td>
        <td width="33%">¡¡</td>
        <td width="5%">¡¡</td>
      </tr>
      <tr>
        <td width="5%">¡¡</td>
        <td width="33%">
        <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber4">
          <tr>
            <td width="100%" bgcolor="#B3D7F5">
            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber5">
              <tr>
                <td width="100%">¡¡</td>
              </tr>
              <tr>
              <td width="100%">
              <div id="sqld" style="display:block">
              </div>
              </tr>                 
              <tr>
              <td width="100%">
              <div id="dd" style="display:block">
              <%  
						out.print(obj.getClass().getName());
						out.print("<br>"+obj.getMessage());
	
	      %>
              
              </div>
              </tr>
           
              <tr>
                <td width="100%">
                <p align="right"><a href="javascript:showMessage();">ÏêÏ¸ÄÚÈÝ</a></td>
              </tr>
              <tr>
              <td width="100%">
              <div id="MESSAGE" style="display:none;overflow:auto;height:150px">
               <%  
				
				ByteArrayOutputStream buf=new ByteArrayOutputStream();				
				obj.printStackTrace(new PrintWriter(buf, true));	
				out.print("<br>"+buf.toString());
		%>             
              </div>
              </tr>
            </table>
            </td>
          </tr>
          <tr>
            <td width="100%" bgcolor="#EBEBEB">¡¡</td>
          </tr>
        </table>
        </td>
        <td width="5%">¡¡</td>
      </tr>
      <tr>
        <td width="5%">¡¡</td>
        <td width="33%">¡¡</td>
        <td width="5%">¡¡</td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td width="100%">
</td>
  </tr>
  <tr>
    <td width="100%">
                <p align="center">                 
                  <button name="B1" onclick="winclose()">¹Ø±Õ</button>
                </td>
  </tr>
</table>
<script language="javascript">
if(window.history.length==0){
	document.all("B1").innerText="¹Ø±Õ";
	document.all("B1").onclick=winclose;
}else{	
}
function winclose(){
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

</script>
</body>
</form>
</html>


