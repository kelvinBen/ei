<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="org.sotower.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>
<HEAD>
<TITLE>字段模型增加</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<sotower:ui css='date.css'/>">
<script language="javascript" src="<sotower:ui js='calendar.js'/>"></script>
<script language="javascript" src="<sotower:ui js='sotowerfunction.js'/>"></script>
<script language="javascript">
function checkSoaField(){
	  var categoryId = document.forms[0].categoryId;
  	  if ( __isQuoteIn(categoryId.value) )
	  {
	    alert("标识不能含有引号或单引号!");
	    categoryId.select();
	    categoryId.focus();
	    return false;
	  }
      if (trim(categoryId.value)=="")
	{
	  alert("请输入标识！");    
	  categoryId.focus();
	  return false;
	}
    categoryId.value = trim(categoryId.value) ;
	  var name = document.forms[0].name;
      if (trim(name.value)=="")
	{
	  alert("请输入模块名称！");    
	  name.focus();
	  return false;
	}
    name.value = trim(name.value) ;
	  var desc = document.forms[0].desc;
      if (trim(desc.value)=="")
	{
	  alert("请输入模块描述！");    
	  desc.focus();
	  return false;
	}
    desc.value = trim(desc.value) ;
	  var columnId = document.forms[0].columnId;
	  var fieldType = document.forms[0].fieldType;
	  var refValue = document.forms[0].refValue;
	  var fieldIndex = document.forms[0].fieldIndex;
      if (trim(fieldIndex.value)=="")
	{
	  alert("请输入序号！");    
	  fieldIndex.focus();
	  return false;
	}
    fieldIndex.value = trim(fieldIndex.value) ;
	  var fieldLength = document.forms[0].fieldLength;
      if (trim(fieldLength.value)=="")
	{
	  alert("请输入域长度！");    
	  fieldLength.focus();
	  return false;
	}
    fieldLength.value = trim(fieldLength.value) ;
	  var isNotNull = document.forms[0].isNotNull;
	  var isSameLine = document.forms[0].isSameLine;
	  var rowSpan = document.forms[0].rowSpan;
	  var disCtrl = document.forms[0].disCtrl;
	  var readOnlyCtrl = document.forms[0].readOnlyCtrl;
	  var isSearch = document.forms[0].isSearch;
	  var creTime = document.forms[0].creTime;
      if (trim(creTime.value)=="")
	{
	  alert("请输入创建时间！");    
	  creTime.focus();
	  return false;
	}
    creTime.value = trim(creTime.value) ;
	  var parent = document.forms[0].parent;
      if (trim(parent.value)=="")
	{
	  alert("请输入上级模块！");    
	  parent.focus();
	  return false;
	}
    parent.value = trim(parent.value) ;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="字段模型增加" >
<bsp:containbutton action="soafield.cmd?method=insert" text="保存" onclick="forSave()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
					<html:hidden name="categoryId" property="categoryId" write="false" />                   
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.CATEGORY_NAME")%>：</td>
                    <td class="tdRight"><html:text name="name" property="name" size="32" maxlength="255" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.CATEGORY_DESC")%>：</td>
                    <td class="tdRight"><html:text name="desc" property="desc" size="32" maxlength="255" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.COLUMN_ID")%>：</td>
                    <td class="tdRight"><html:text name="columnId" property="columnId" size="32" maxlength="32" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.FIELD_TYPE")%>：</td>
                    <td class="tdRight">
                    	<html:select name="fieldType" property="fieldType" >
	                        <html:options collection="SOAFIELD_FIELDTYPE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.REFERENCE_VALUE")%>：</td>
                    <td class="tdRight"><html:text name="refValue" property="refValue" size="32" maxlength="32" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.FIELD_INDEX")%>：</td>
                    <td class="tdRight"><html:text name="fieldIndex" property="fieldIndex" size="32" maxlength="32" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.FIELDLENGTH")%>：</td>
                    <td class="tdRight"><html:text name="fieldLength" property="fieldLength" size="32" maxlength="32" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.IS_NOTNULL")%>：</td>
                    <td class="tdRight">
                    	<html:select name="isNotNull" property="isNotNull" >
	                        <html:options collection="SOAFIELD_ISNOTNULL_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.IS_SAMELINE")%>：</td>
                    <td class="tdRight">
                    	<html:select name="isSameLine" property="isSameLine" >
	                        <html:options collection="SOAFIELD_ISSAMELINE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    </tr>
					<html:hidden name="format" property="format" write="false"/>                                      
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.ROWSPAN")%>：</td>
                    <td class="tdRight"><html:text name="rowSpan" property="rowSpan"size="32" maxlength="32" /></td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.DISPLAY_CONTROL")%>：</td>
                    <td class="tdRight">
                    	<html:checkboxGroup name="disCtrl" property="disCtrl" collection="SOAFIELD_DISCTRL_COLLECTION" labelProperty="value" labelKey="key"/>
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.READONLY_CONTROL")%>：</td>
                    <td class="tdRight">
                    	<html:checkboxGroup name="readOnlyCtrl" property="readOnlyCtrl" collection="SOAFIELD_READONLYCTRL_COLLECTION" labelProperty="value" labelKey="key"/>
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.IS_SEARCH")%>：</td>
                    <td class="tdRight">
                    	<html:select name="isSearch" property="isSearch" >
	                        <html:options collection="SOAFIELD_ISSEARCH_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    </tr>
					<html:hidden name="jsEvent" property="jsEvent" write="false"/>                                      
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_FIELD.CRE_TIME")%>：</td>
                    <td>
						<date:date name="creTime" property="creTime" divname="creTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd">
						</date:date>
					</td>
					</tr>
					<html:hidden name="parent" property="parent" write="false"/>                    
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkSoaField()) return;	
  document.forms[0].action ="soafield.cmd?method=insert";
  document.forms[0].submit();	
}
</script>