<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("COMBO_COLLECTION.DETAIL.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title='<%=ResourcesFactory.getString("COMBO_COLLECTION.DETAIL.TITLE")%>' >
<bsp:containbutton action="combocollection.cmd?method=forupdate" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>' onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="combocollectionquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$comboId" write="false"/>
    <tr>
      <td class="tdTitle" style="display:none"><%=ResourcesFactory.getString("COMBO_COLLECTION.COMBO_ID")%>:</td>
      <td class="tdRight"><html:hidden name="comboId" property="comboId"  style="display:none"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("COMBO_COLLECTION.COMBO_NAME")%>:</td>
      <td class="tdRight"><html:hidden name="comboName" property="comboName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("COMBO_COLLECTION.COMBO_HELP")%>:</td>
      <td class="tdRight"><html:hidden name="comboHelp" property="comboHelp" write="true"/></td>
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
  document.forms[0].action ="combocollection.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="combocollectionquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>