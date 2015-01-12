<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="org.sotower.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<HTML>
<HEAD>
<TITLE>窗口模型明细</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="窗口模型明细" >
<bsp:containbutton action="soawindow.cmd?method=generatorModel" text="生成代码" onclick="generator()"></bsp:containbutton>
<bsp:containbutton action="soawindow.cmd?method=multideal" text="批量修改" onclick="forMulUpdate()"></bsp:containbutton>
<bsp:containbutton action="soawindow.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$categoryId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_WINDOW.CATEGORY_ID")%>：</td>
      <td class="tdRight"><html:hidden name="categoryId" property="categoryId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_WINDOW.CATEGORY_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="name" property="name" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_WINDOW.CATEGORY_DESC")%>：</td>
      <td class="tdRight"><html:hidden name="desc" property="desc" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_WINDOW.JSP_PATH")%>：</td>
      <td class="tdRight"><html:hidden name="jspPath" property="jspPath" write="true"/></td>
    </tr>
	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_WINDOW.JAVAPACKAGE")%>：</td>
      <td class="tdRight"><html:hidden name="javaPackage" property="javaPackage" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_WINDOW.PAGE_SIZE")%>：</td>
      <td class="tdRight"><html:hidden name="pageSize" property="pageSize" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle" style="display:none"><%=ResourcesFactory.getString("SOA_WINDOW.WINDOW_TEMPLATE")%>：</td>
      <td class="tdRight"><html:hidden name="winTemplate" property="winTemplate"  style="display:none"/></td>
    </tr>
    <tr>
      <td class="tdTitle" style="display:none"><%=ResourcesFactory.getString("SOA_WINDOW.WINDOW_WEBROOT")%>：</td>
      <td class="tdRight"><html:hidden name="winWebroot" property="winWebroot"  style="display:none"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_WINDOW.CATEGORY_PARENT")%>：</td>
      <td class="tdRight"><html:hidden name="parent" property="parent" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_WINDOW.CRE_TIME")%>：</td>
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
  document.forms[0].action ="soawindow.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forMulUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="soawindow.cmd?method=forMultiUpdate";
  document.forms[0].submit();	
}
function generator(){ 	
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="soawindow.cmd?method=generatorModel";
  document.forms[0].submit();   
}
</script>