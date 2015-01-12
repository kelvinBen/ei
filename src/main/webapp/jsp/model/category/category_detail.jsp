<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="org.sotower.waf.ResourcesFactory"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<HTML>
<HEAD>
<TITLE>模块划分明细</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="模块划分明细" >
<bsp:containbutton action="soacategory.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
<%request.setAttribute("hello","isayhello"); %>
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$categoryId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("CATEGORY.CATEGORY_ID")%>：</td>
      <td class="tdRight"><html:hidden name="categoryId" property="categoryId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("CATEGORY.CATEGORY_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="name" property="name" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("CATEGORY.CATEGORY_DESC")%>：</td>
      <td class="tdRight"><html:hidden name="desc" property="desc" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("CATEGORY.CRE_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="creTime" property="creTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("CATEGORY.CATEGORY_PARENT")%>：</td>
      <td class="tdRight"><html:hidden name="parent" property="parent" write="true"/></td>
    </tr>
    <tr>
    <td>${hello}</td>
    <td><html:button name="hello" onclick="alert(1111)">你好<%out.println(111);%></html:button></td>
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
  document.forms[0].action ="soacategory.cmd?method=forupdate";
  document.forms[0].submit();	
}
</script>