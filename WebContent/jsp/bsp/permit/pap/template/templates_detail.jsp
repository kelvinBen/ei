<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<% String refreshId = (String)request.getAttribute("refreshId");
     if(refreshId==null)
        refreshId="root";
%>

<HTML>
<HEAD>
<TITLE>角色模板明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="角色模板明细" >
<bsp:containbutton text="修改" onclick="forUpdate()" action ="templates.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action =""></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$templateId" write="false"/>
    <tr style="display:none">
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_TEMPLATES.TEMPLATE_ID")%>：</td>
      <td class="tdRight"><html:hidden name="templateId" property="templateId" write="false"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_TEMPLATES.TEMPLATE_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="templateName" property="templateName" write="true"/></td>
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
  document.forms[0].action ="templates.cmd?method=forupdate_info";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="trolesquery.cmd?";
  document.forms[0].submit();	
}
function init(){
   //getTreeFrame().location.reload();
     var refreshId = "<%=refreshId%>";
     if(getTreeFrame().seltree!=null)
          getTreeFrame().seltree.refreshNodeById(refreshId);
}
init();
</script>