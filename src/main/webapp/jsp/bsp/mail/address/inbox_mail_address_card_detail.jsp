<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.TREETITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<%
	String categoryName = "" + request.getAttribute( "categoryName" );
	String addtype = ""+request.getAttribute("addtype");
%>
<html:form  name="frmList"  action="">
<span id="message"><html:messages/></span>
<html:hidden name="primaryKey" value=""/>
<html:hidden name="addressId" property="addressId" write="false"/>	
<html:hidden name="addressType" property="addressType" write="false"/>	
<html:hidden name="categoryId" property="categoryId" write="false"/>

<fieldset class="FieldsetCss"><legend>联系人信息</legend>
  <table width="100%" cellspacing="0" cellpadding="0" class="tblContent">

    <tr>
      <td class="TdLeft" width="20%"><%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_NAME_CARD")%>：</td>
      <td class="TdRight" width="80%"><html:hidden name="addressName" property="addressName" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft" width="20%"><%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_EMAIL")%>：</td>
      <td class="TdRight" width="80%"><html:hidden name="addressEmail" property="addressEmail" write="true"/></td>
    </tr>
	<tr>
      <td class="TdLeft" width="20%"><%=addtype%>：</td>
      <td class="TdRight" width="80%"><html:hidden name="categoryName" value="<%=categoryName%>" write="true"/></td>
    </tr>
  </table>
</fieldset>
<table width="100%" cellspacing="0" cellpadding="0" >
	<tr>
	<td colspan="2" align="center">
		<html:button onclick="forReturn()" name="btn_detail" value="关闭"></html:button>&nbsp;&nbsp;&nbsp;
	</td>
	</tr>
</table>
</html:form>
</BODY>
</HTML>
<script language="javascript">

function forReturn(){
window.close();
}
</script>