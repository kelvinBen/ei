<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="org.sotower.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<HTML>
<HEAD>
<TITLE>关联模型明细</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="关联模型明细" >
<bsp:containbutton action="soareference.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="soareferencequery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$categoryId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_REFERENCE.CATEGORY_ID")%>：</td>
      <td class="tdRight"><html:hidden name="categoryId" property="categoryId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_REFERENCE.CATEGORY_DESC")%>：</td>
      <td class="tdRight"><html:hidden name="desc" property="desc" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_REFERENCE.COLUMN_ID")%>：</td>
      <td class="tdRight"><html:hidden name="columnId" property="columnId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_REFERENCE.PERMANENCE_ID")%>：</td>
      <td class="tdRight"><html:hidden name="permanenceId" property="permanenceId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_REFERENCE.REF_COLUMN")%>：</td>
      <td class="tdRight"><html:hidden name="refColumn" property="refColumn" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_REFERENCE.REF_PERMANENCE")%>：</td>
      <td class="tdRight"><html:hidden name="refPm" property="refPm" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_REFERENCE.CRE_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="creTime" property="creTime" write="true"/></td>
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
  document.forms[0].action ="soareference.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="soareferencequery_page_init.cmd";
  document.forms[0].submit();	
}
</script>