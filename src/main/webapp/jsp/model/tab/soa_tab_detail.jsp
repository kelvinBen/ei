<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="org.sotower.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<HTML>
<HEAD>
<TITLE>tab模型明细</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="tab模型明细" >
<bsp:containbutton action="soatab.cmd?method=generatorField" text="生成字段" onclick="forGenerator()"></bsp:containbutton>
<bsp:containbutton action="soatab.cmd?method=batchUpdate" text="批量修改" onclick="batchUpdate()"></bsp:containbutton>
<bsp:containbutton action="soatab.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$categoryId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.CATEGORY_ID")%>：</td>
      <td class="tdRight"><html:hidden name="categoryId" property="categoryId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.CATEGORY_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="name" property="name" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.CATEGORY_DESC")%>：</td>
      <td class="tdRight"><html:hidden name="desc" property="desc" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.PERMANENCE_ID")%>：</td>
      <td class="tdRight"><html:hidden name="pmId" property="pmId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.REF_ID")%>：</td>
      <td class="tdRight"><html:hidden name="refId" property="refId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.TAB_INDEX")%>：</td>
      <td class="tdRight"><html:hidden name="index" property="index" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.IS_MAIN")%>：</td>
      <td class="tdRight">
      	<html:label name="isMain" property="isMain" collection="SOATAB_ISMAIN_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.IS_DETAIL")%>：</td>
      <td class="tdRight">
      	<html:label name="isDetail" property="isDetail" collection="SOATAB_ISDETAIL_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.IS_SAMETAB")%>：</td>
      <td class="tdRight">
      	<html:label name="isSameTab" property="isSameTab" collection="SOATAB_ISSAMETAB_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.IS_READONLY")%>：</td>
      <td class="tdRight">
      	<html:label name="isReadOnly" property="isReadOnly" collection="SOATAB_ISREADONLY_COLLECTION" labelProperty="value" labelKey="key"/>
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.CRE_TIME")%>：</td>
      <td class="tdRight"><html:hidden name="creTime" property="creTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.CATEGORY_PARENT")%>：</td>
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
  document.forms[0].action ="soatab.cmd?method=forupdate";
  document.forms[0].submit();	
}
function batchUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="soatab.cmd?method=batchUpdate";
  document.forms[0].submit();	
}
function forGenerator(){
  var pmid = document.forms[0].pmId;
  if(pmid==null||pmid==""||pmid=="undefined")
  {
  	alert("生成域tab对应的持久模型不能为空!");
  	return ;s
  }
  document.all("primaryKey").value=document.all("pk").value;
  if (confirm("是否需要删除已有模型!")) {
  	document.forms[0].action ="soatab.cmd?method=generatorField&isDelete=true";
  }  else {
  	document.forms[0].action ="soatab.cmd?method=generatorField&isDelete=false";
  } 
  document.forms[0].submit();	
}
</script>