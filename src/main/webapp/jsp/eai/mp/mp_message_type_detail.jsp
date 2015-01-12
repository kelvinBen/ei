<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>消息类型明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="消息类型明细" >
<bsp:containbutton action="mpmessagetype.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="mpmessagetypequery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$msgTypeCode" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_TYPE.MSG_TYPE_CODE")%>：</td>
      <td class="tdRight"><html:hidden name="msgTypeCode" property="msgTypeCode" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_TYPE.MSG_TYPE_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="msgTypeName" property="msgTypeName" write="true"/></td>
    </tr>
    <tr style="display:none">
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_TYPE.IS_COMMON_MSG")%>：</td>
      <td class="tdRight">
      	<html:label name="isCommonMsg" property="isCommonMsg" collection="MP_MESSAGE_TYPE_IS_COMMON_MSG" labelProperty="value" labelKey="key" />
      </td>
    </tr>
    <tr style="display:none">
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_TYPE.OBJECT_TABLE_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="objectTableName" property="objectTableName" write="true"/></td>
    </tr>
    <tr style="display:none">
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_TYPE.SUBSCR_LIMIT")%>：</td>
      <td class="tdRight"><html:hidden name="subscrLimit" property="subscrLimit" write="true"/></td>
    </tr>
    <tr style="display:none">
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_TYPE.MANNER_LIMIT")%>：</td>
      <td class="tdRight"><html:hidden name="mannerLimit" property="mannerLimit" write="true"/></td>
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
  document.forms[0].action ="mpmessagetype.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpmessagetypequery_page_init.cmd";
  document.forms[0].submit();	
}
</script>