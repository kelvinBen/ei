<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%
    String organId = request.getParameter("organId");
%>
<HTML>
<HEAD>
<TITLE>机构参数表明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="机构参数表明细" >
<bsp:containbutton text="返回" onclick="forReturn()" action ="organparmsquery.cmd?method=query"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">

    <html:hidden name="organId" property="organId" write="false"/>

    <tr>
      <td class="tdTitle">参数名称：</td>
      <td class="tdRight"><html:hidden name="parmsName" property="parmsName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">参数值：</td>
      <td class="tdRight"><html:hidden name="parmsValue" property="parmsValue" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">描述：</td>
      <td class="tdRight"><html:hidden name="note" property="note" write="true"/></td>
    </tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">

function forReturn(){
  document.forms[0].action ="organparmsquery.cmd?method=query&organId="+"<%=organId%>";
  document.forms[0].submit();	
}
</script>