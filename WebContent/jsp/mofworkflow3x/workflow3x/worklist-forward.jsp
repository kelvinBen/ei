<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.Map,net.mast.mof.exec.MofCommand" %>
<%@ page import="net.mast.mof.util.MultiRequestUtil"%>
<%
   String extReturnUrl = MultiRequestUtil.getParameter(request,"EXT_RETURN_URL");
 
   request.removeAttribute("__bsp_integration_fitlerapplied");

%>

<form name="site" method="post" action="" >
</form>
<script>
function pub_in()
{
document.forms[0].action="<%=extReturnUrl%>";
document.forms[0].submit();
}
</script>
<SCRIPT FOR=window EVENT=onload>

pub_in();

</SCRIPT>