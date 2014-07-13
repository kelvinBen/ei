<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui css='flexgrid.js'/>"></script>
<html:form action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="组织类型明细" >
<bsp:containbutton text="修改" onclick="forUpdate()" action="organtype.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action="organtypequery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_TYPE.ORGAN_TYPE")%>：</td>
      <td class="tdRight"><html:hidden name="organType" property="organType" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_TYPE.TYPE_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="typeName" property="typeName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_TYPE.PARENT_TYPE")%>：</td>
      <td class="tdRight"><html:hidden name="parentType" property="parentType" write="true"/></td>
    </tr>
    
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("organType").value;
  document.forms[0].action ="organtype.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="organtypequery.cmd";
  document.forms[0].submit();	
}
</script>