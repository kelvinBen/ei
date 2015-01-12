<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="org.sotower.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<HTML>
<HEAD>
<TITLE>字段模型明细</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="字段模型明细" >
<bsp:containbutton action="soafield.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$categoryId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.CATEGORY_ID")%>：</td>
      <td class="tdRight"><html:hidden name="categoryId" property="categoryId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.CATEGORY_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="name" property="name" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.CATEGORY_DESC")%>：</td>
      <td class="tdRight"><html:hidden name="desc" property="desc" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.COLUMN_ID")%>：</td>
      <td class="tdRight"><html:hidden name="columnId" property="columnId" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.FIELD_TYPE")%>：</td>
      <td class="tdRight">
      	<html:label name="fieldType" property="fieldType" collection="SOAFIELD_FIELDTYPE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.REFERENCE_VALUE")%>：</td>
      <td class="tdRight"><html:hidden name="refValue" property="refValue" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.FIELD_INDEX")%>：</td>
      <td class="tdRight"><html:hidden name="fieldIndex" property="fieldIndex" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.FIELDLENGTH")%>：</td>
      <td class="tdRight"><html:hidden name="fieldLength" property="fieldLength" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.IS_NOTNULL")%>：</td>
      <td class="tdRight">
      	<html:label name="isNotNull" property="isNotNull" collection="SOAFIELD_ISNOTNULL_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.IS_SAMELINE")%>：</td>
      <td class="tdRight">
      	<html:label name="isSameLine" property="isSameLine" collection="SOAFIELD_ISSAMELINE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle" style="display:none"><%=ResourcesFactory.getString("SOA_FIELD.ValueFORMAT")%>：</td>
      <td class="tdRight"><html:hidden name="format" property="format"  style="display:none"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.ROWSPAN")%>：</td>
      <td class="tdRight"><html:hidden name="rowSpan" property="rowSpan" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.DISPLAY_CONTROL")%>：</td>
      <td class="tdRight">
      	<html:multiLabel name="disCtrl" property="disCtrl" collection="SOAFIELD_DISCTRL_COLLECTION" labelProperty="value" labelKey="key" write="true" delimiter="."/>
      </td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.READONLY_CONTROL")%>：</td>
      <td class="tdRight">
      	<html:multiLabel name="readOnlyCtrl" property="readOnlyCtrl" collection="SOAFIELD_READONLYCTRL_COLLECTION" labelProperty="value" labelKey="key" write="true" delimiter="."/>
      </td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.IS_SEARCH")%>：</td>
      <td class="tdRight">
      	<html:label name="isSearch" property="isSearch" collection="SOAFIELD_ISSEARCH_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle" style="display:none"><%=ResourcesFactory.getString("SOA_FIELD.JSEVENT")%>：</td>
      <td class="tdRight"><html:hidden name="jsEvent" property="jsEvent"  style="display:none"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.CRE_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="creTime" property="creTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.CATEGORY_PARENT")%>：</td>
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
  document.forms[0].action ="soafield.cmd?method=forupdate";
  document.forms[0].submit();	
}
</script>