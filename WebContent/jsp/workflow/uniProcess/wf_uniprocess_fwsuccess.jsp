<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<br>
<div class="btnareaCss">
<html:button name="¹Ø±Õ" value="¹Ø±Õ" onclick="forClose()"></html:button>
</div>
<html:form  name="frmList"  action="">
<fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0">
		<tr>
			<td align="center">
				<font color=red size=4><html:messages/></font>
	          </td>
		</tr> 				                  
	</table>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forClose(){
  window.parent.close();
}
</script>