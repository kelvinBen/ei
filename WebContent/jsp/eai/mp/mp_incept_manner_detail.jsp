<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>����/���շ�ʽ��ϸ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="����/���շ�ʽ��ϸ" >
<bsp:containbutton action="mpinceptmannerquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$receiveMannerCode" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_INCEPT_MANNER.RECEIVE_MANNER_CODE")%>��</td>
      <td class="tdRight"><html:hidden name="receiveMannerCode" property="receiveMannerCode" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_INCEPT_MANNER.RECEIVE_MANNER_NAME")%>��</td>
      <td class="tdRight"><html:hidden name="receiveMannerName" property="receiveMannerName" write="true"/></td>
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
  document.forms[0].action ="mpinceptmanner.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpinceptmannerquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>