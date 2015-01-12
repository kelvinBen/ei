<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="org.sotower.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<HTML>
<HEAD>
<TITLE>属性域明细</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="属性域明细" >
<bsp:containbutton action="soacolumn.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$categoryId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.CATEGORY_ID")%>：</td>
      <td class="tdRight"><html:hidden name="categoryId" property="categoryId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.CATEGORY_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="name" property="name" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.CATEGORY_DESC")%>：</td>
      <td class="tdRight"><html:hidden name="desc" property="desc" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.IS_NOTNULL")%>：</td>
      <td class="tdRight">
      	<html:label name="isNotNull" property="isNotNull" collection="SOACOLUMN_ISNOTNULL_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.COLUMN_KEYTYPE")%>：</td>
      <td class="tdRight">
      	<html:label name="keyType" property="keyType" collection="SOACOLUMN_KEYTYPE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.COLUMN_ASSOCIATE")%>：</td>
      <td class="tdRight"><html:hidden name="associate" property="associate" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.COLUMN_TYPE")%>：</td>
      <td class="tdRight"><html:hidden name="columnType" property="columnType" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.COLUMN_COLUMNSIZE")%>：</td>
      <td class="tdRight"><html:hidden name="columnSize" property="columnSize" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.COLUMN_DEFAULT")%>：</td>
      <td class="tdRight"><html:hidden name="defaultValue" property="defaultValue" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.COLUMN_SORTED")%>：</td>
      <td class="tdRight">
      	<html:label name="sortedType" property="sortedType" collection="SOACOLUMN_SORTEDTYPE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.COLUMN_JAVANAME")%>：</td>
      <td class="tdRight"><html:hidden name="javaName" property="javaName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.JAVA_TYPE")%>：</td>
      <td class="tdRight"><html:hidden name="javaType" property="javaType" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.KEY_GENERATOR")%>：</td>
      <td class="tdRight">
      	<html:label name="keyGenerator" property="keyGenerator" collection="SOACOLUMN_KEYGENERATOR_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.ISSEARCH")%>：</td>
      <td class="tdRight">
      	<html:label  name="isSearch" property="isSearch" collection="SOACOLUMN_ISSEARCH_COLLECTION" labelProperty="value" labelKey="key"/>
      </td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.METHOD_SINGLE")%>：</td>
      <td class="tdRight">
      	<html:multiLabel name="methodSingle" property="methodSingle" collection="SOACOLUMN_METHODSINGLE_COLLECTION" labelProperty="value" labelKey="key" write="true" delimiter=","/>
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.CRE_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="creTime" property="creTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.CATEGORY_PARENT")%>：</td>
      <td class="tdRight"><html:hidden name="parent" property="parent" write="true"/></td>
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
  document.forms[0].action ="soacolumn.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="soacolumnquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>