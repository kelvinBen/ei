<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("COMBOBOX_TEST.DETAIL.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title='<%=ResourcesFactory.getString("COMBOBOX_TEST.DETAIL.TITLE")%>' >
<bsp:containbutton action="comboboxtest.cmd?method=forupdate" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>' onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="comboboxtestquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$comboBoxId" write="false"/>
    <tr>
      <td class="tdTitle" style="display:none"><%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_ID")%>:</td>
      <td class="tdRight"><html:hidden name="comboBoxId" property="comboBoxId"  style="display:none"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_NAME")%>:</td>
      <td class="tdRight"><html:hidden name="comboBoxName" property="comboBoxName" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_SEX")%>:</td>
      <td class="tdRight">
      	<html:label name="comboBoxSex" property="comboBoxSex" collection="COMBOBOXTEST_COMBOBOXSEX_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_NATION")%>:</td>
      <td class="tdRight"><html:multiLabel name="comboBoxNation" property="comboBoxNation" collection="collection" labelProperty="CheckData" labelKey="nodeId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_ADDRESS")%>:</td>
      <td class="tdRight"><html:multiLabel name="comboBoxAddress" property="comboBoxAddress" collection="COMBOBOXTEST_COMBOBOXADDRESS_COLLECTION" labelProperty="COMBO_NAME" labelKey="COMBO_ID" write="true"/></td>
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
  document.forms[0].action ="comboboxtest.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="comboboxtestquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>