<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<% 
    String superCode = request.getParameter("superCode");
    String country = request.getParameter("country");	
        if(country==null || country.equals("")){
		country="CN";
      }
      if(superCode==null || superCode.equals("")){
		superCode=country;
      }
%> 

<HTML>
<HEAD>
<TITLE>行政区划明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="行政区划明细" >
<bsp:containbutton text="修改" onclick="forUpdate()" action="cant.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action="cantquery.cmd?method=query"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CANT.CANT_CODE")%>：</td>
      <td class="tdRight"><html:hidden name="cantCode" property="cantCode" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CANT.CANT_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="cantName" property="cantName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CANT.SHORT_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="shortName" property="shortName" write="true"/></td>
    </tr>
    <tr>
      <html:hidden name="cantType" property="cantType" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CANT.CANT_NOTE")%>：</td>
      <td class="tdRight"><html:hidden name="cantNote" property="cantNote" write="true"/></td>
    </tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("cantCode").value;
  document.forms[0].action ="cant.cmd?method=forupdate&country=<%=country%>&superCode=<%=superCode%>"; 
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="cantquery.cmd?method=query&country=<%=country%>&superCode="+"<%=superCode%>";     
  document.forms[0].submit();
}
</script>