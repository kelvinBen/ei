<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>¶©ÔÄµØÖ·Ã÷Ï¸</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="¶©ÔÄµØÖ·Ã÷Ï¸" >
<bsp:containbutton action="mpreceiveaddress.cmd?method=forupdate" text="ÐÞ¸Ä" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="mpreceiveaddressquery_page_init.cmd" text="·µ»Ø" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$receiveAddressId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.RECEIVE_ADDRESS_ID")%>£º</td>
      <td class="tdRight"><html:hidden name="receiveAddressId" property="receiveAddressId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.SUBSCR_TYPE_CODE")%>£º</td>
      <td class="tdRight">
      	<html:label name="subscrTypeCode" property="subscrTypeCode" collection="mpSubscriberType" labelProperty="SUBSCR_TYPE_NAME" labelKey="SUBSCR_TYPE_CODE" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.RECEIVE_MANNER_CODE")%>£º</td>
      <td class="tdRight">
      	<html:label name="receiveMannerCode" property="receiveMannerCode" collection="mpInceptManner" labelProperty="RECEIVE_MANNER_NAME" labelKey="RECEIVE_MANNER_CODE" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.OBJECT_TABLE_NAME")%>£º</td>
      <td class="tdRight"><html:hidden name="objectTableName" property="objectTableName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.SUBSCRIBERID_FIELD")%>£º</td>
      <td class="tdRight"><html:hidden name="subscriberidField" property="subscriberidField" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.SUBSCRIBERID_FIELD_TYPE")%>£º</td>
      <td class="tdRight"><html:hidden name="subscriberidFieldType" property="subscriberidFieldType" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.ADDRESS_FIELD")%>£º</td>
      <td class="tdRight"><html:hidden name="addressField" property="addressField" write="true"/></td>
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
  document.forms[0].action ="mpreceiveaddress.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpreceiveaddressquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>