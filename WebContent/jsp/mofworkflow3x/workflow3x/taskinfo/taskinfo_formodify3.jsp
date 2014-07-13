<%@ page contentType="text/html;charset=gb2312" %>

<%
   String jsp_url = (String)request.getAttribute("formHtml") ;
     
   String extReturnUrl=(String)request.getAttribute("EXT_RETURN_URL");
   
   request.removeAttribute("__bsp_integration_fitlerapplied");   
 
%>
<form name="site" method="post" action="" >
<input type="hidden" name="EXT_RETURN_URL" value="<%=extReturnUrl%>">
</form>
<script>
function put_in()
{
document.forms[0].action="<%=jsp_url%>";
document.forms[0].submit();}
</script>
<SCRIPT FOR=window EVENT=onload>
put_in();
</SCRIPT>
 

 