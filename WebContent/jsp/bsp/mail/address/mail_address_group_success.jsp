<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>


<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">

</HEAD>

<BODY topmargin="10px">
<html:form  name="frmList"  action=""> 
<html:messages/>
<table width="100%" height="80%"cellpadding="0" cellspacing="0" border="0"> 
			<tr height="60%">
			</tr>
           <tr>
           <td align="center">
			 <input type="button" name="Ok" onclick="display()" value="È·¶¨">
			<td>
           </tr>
</table>
    
</html:form>
</BODY>
<script language="javascript">
function display(){
	parent.display("<%=(String)request.getParameter("msg")%>")
}
</script>
</HTML>
