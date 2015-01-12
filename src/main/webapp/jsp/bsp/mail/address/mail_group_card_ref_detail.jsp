<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>邮件地址分组卡片关联表明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="邮件地址分组卡片关联表明细" >
	<bsp:containbutton onclick="forUpdate()" name="btn_update" text="修改" ></bsp:containbutton>
	<bsp:containbutton onclick="forReturn()" name="btn_delete" text="返回" ></bsp:containbutton>

  <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="TdLeft"><%=ResourcesFactory.getString("MAIL_GROUP_CARD_REF.ID")%>：</td>
      <td class="TdRight"><html:hidden name="id" property="id" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft"><%=ResourcesFactory.getString("MAIL_GROUP_CARD_REF.GROUP_ID")%>：</td>
      <td class="TdRight"><html:hidden name="groupId" property="groupId" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft"><%=ResourcesFactory.getString("MAIL_GROUP_CARD_REF.CARD_ID")%>：</td>
      <td class="TdRight"><html:hidden name="cardId" property="cardId" write="true"/></td>
    </tr>
  </table>

</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("id").value;
  document.forms[0].action ="mailgroupcardref.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mailgroupcardrefquery.cmd";
  document.forms[0].submit();	
}
</script>