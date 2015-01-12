<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("PRODUCT.DETAIL.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title='<%=ResourcesFactory.getString("PRODUCT.DETAIL.TITLE")%>' >
<bsp:containbutton action="product.cmd?method=forupdate" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>' onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="productquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$itemProductid" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PRODUCT.ITEM_PRODUCTID")%>:</td>
      <td class="tdRight"><html:hidden name="itemProductid" property="itemProductid" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PRODUCT.ITEM_PRODUCTNAME")%>:</td>
      <td class="tdRight"><html:hidden name="itemProductname" property="itemProductname" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PRODUCT.ITEM_UNITPRICE")%>:</td>
      <td class="tdRight"><html:hidden name="itemUnitprice" property="itemUnitprice" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PRODUCT.ITEM_QUANTITY")%>:</td>
      <td class="tdRight"><html:hidden name="itemQuantity" property="itemQuantity" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PRODUCT.ITEM_AMOUNT")%>:</td>
      <td class="tdRight"><html:hidden name="itemAmount" property="itemAmount" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PRODUCT.ITEM_LEVEL")%>:</td>
      <td class="tdRight">
      	<html:label name="itemLevel" property="itemLevel" collection="PRODUCT_ITEMLEVEL_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="product.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="productquery_page_init.cmd?clear=true&clearsearch=true";
  document.forms[0].submit();	
}
</script>