<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<TITLE>工作地点明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="工作地点明细" >
<bsp:containbutton text="修改" onclick="forUpdate()" action="workplace.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action="workplacequery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
    <html:hidden name="workplaceId" property="workplaceId" write="false"/>  
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.WORKPLACE_CODE")%>：</td>
      <td class="tdRight"><html:hidden name="workplaceCode" property="workplaceCode" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.WORKPLACE_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="workplaceName" property="workplaceName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.SHORT_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="shortName" property="shortName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.CANT_CODE")%>：</td>
      <td class="tdRight"><html:hidden name="cantName" property="cantName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.LINKMAN")%>：</td>
      <td class="tdRight"><html:hidden name="linkman" property="linkman" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.TEL")%>：</td>
      <td class="tdRight"><html:hidden name="tel" property="tel" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.FAX")%>：</td>
      <td class="tdRight"><html:hidden name="fax" property="fax" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.E_MAIL")%>：</td>
      <td class="tdRight"><html:hidden name="email" property="email" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.WWW")%>：</td>
      <td class="tdRight"><html:hidden name="www" property="www" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.POST_CODE")%>：</td>
      <td class="tdRight"><html:hidden name="postCode" property="postCode" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.POST_ADDRESS")%>：</td>
      <td class="tdRight"><html:hidden name="postAddress" property="postAddress" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.ENGLISH_ADDRESS")%>：</td>
      <td class="tdRight"><html:hidden name="englishAddress" property="englishAddress" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.AM_START_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="amStartTime" property="amStartTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.AM_END_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="amEndTime" property="amEndTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.PM_START_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="pmStartTime" property="pmStartTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.PM_END_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="pmEndTime" property="pmEndTime" write="true"/></td>
    </tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("workplaceId").value;
  document.forms[0].action ="workplace.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="workplacequery.cmd";
  document.forms[0].submit();	
}
</script>