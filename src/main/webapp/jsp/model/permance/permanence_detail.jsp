<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="org.sotower.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<HTML>
<HEAD>
<TITLE>持久模型明细</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="持久模型明细" >
<bsp:containbutton action="permanence.cmd?method=generatorColumn" text="生成字段" onclick="generatorColumn()"></bsp:containbutton>
<bsp:containbutton action="permanence.cmd?method=generatorModel" text="生成代码" onclick="generator()"></bsp:containbutton>
<bsp:containbutton action="permanence.cmd?method=multideal" text="批量修改" onclick="forMulUpdate()"></bsp:containbutton>
<bsp:containbutton action="permanence.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$categoryId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.CATEGORY_ID")%>：</td>
      <td class="tdRight"><html:hidden name="categoryId" property="categoryId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.CATEGORY_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="name" property="name" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.CATEGORY_DESC")%>：</td>
      <td class="tdRight"><html:hidden name="desc" property="desc" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.PM_JAVANAME")%>：</td>
      <td class="tdRight"><html:hidden name="javaName" property="javaName" write="true"/></td>
    </tr>
	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.JAVAPACKAGE")%>：</td>
      <td class="tdRight"><html:hidden name="javaPackage" property="javaPackage" write="true"/></td>
    </tr>      
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.ASSOCIATE")%>：</td>
      <td class="tdRight"><html:hidden name="associate" property="associate" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.PM_ISCACHE")%>：</td>
      <td class="tdRight">
      	<html:label name="isCache" property="isCache" collection="PERMANENCE_ISCACHE_COLLECTION" labelProperty="value" labelKey="key" /> <FONT COLOR=#ff0000>缓存与单独方法同时使用会出现不一致的情况</FONT>
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.PM_DS")%>：</td>
      <td class="tdRight"><html:hidden name="dataSouce" property="dataSouce" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.PM_TEMPLATE")%>：</td>
      <td class="tdRight"><html:hidden name="template" property="template" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.PM_WEBROOT")%>：</td>
      <td class="tdRight"><html:hidden name="webRoot" property="webRoot" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.CATEGORY_PARENT")%>：</td>
      <td class="tdRight"><html:hidden name="parent" property="parent" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.CRE_TIME")%>：</td>
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
  document.forms[0].action ="permanence.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forMulUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="permanence.cmd?method=forMultiUpdate";
  document.forms[0].submit();	
}
function generator(){ 	
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="permanence.cmd?method=generatorModel";
  document.forms[0].submit();   
}
function generatorColumn(){ 	
  document.all("primaryKey").value=document.all("pk").value;
  if (confirm("是否需要删除已有模型!")) {
  	document.forms[0].action ="permanence.cmd?method=generatorColumn&isDelete=true";
  }  else {
  	document.forms[0].action ="permanence.cmd?method=generatorColumn&isDelete=false";
  } 
  document.forms[0].submit();   
}
</script>