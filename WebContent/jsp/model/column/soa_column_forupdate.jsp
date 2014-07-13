<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="org.sotower.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>
<HEAD>
<TITLE>属性域修改</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<sotower:ui css='date.css'/>">
<script language="javascript" src="<sotower:ui js='sotowerfunction.js'/>"></script>
<script language="javascript" src="<sotower:ui js='calendar.js'/>"></script>
<script language="javascript" src="<sotower:ui js='sotowerfunction.js'/>"></script>
<script language="javascript">
function checkSoaColumn(){
	  var categoryId = document.forms[0].categoryId;
  	  if ( __isQuoteIn(categoryId.value) )
	  {
	    alert("编码不能含有引号或单引号!");
	    categoryId.select();
	    categoryId.focus();
	    return false;
	  }
      if (trim(categoryId.value)=="")
	{
	  alert("请输入编码！");    
	  categoryId.focus();
	  return false;
	}
    categoryId.value = trim(categoryId.value) ;
	  var name = document.forms[0].name;
      if (trim(name.value)=="")
	{
	  alert("请输入表字段名！");    
	  name.focus();
	  return false;
	}
    name.value = trim(name.value) ;
	  var desc = document.forms[0].desc;
      if (trim(desc.value)=="")
	{
	  desc.value=name.value;
	}
    desc.value = trim(desc.value) ;
	  var isNotNull = document.forms[0].isNotNull;
      if (trim(isNotNull.value)=="")
	{
	  alert("请输入是否必须！");    
	  isNotNull.focus();
	  return false;
	}
    isNotNull.value = trim(isNotNull.value) ;
	  var javaName = document.forms[0].javaName;
      if (trim(javaName.value)=="")
	{   
	  javaName.value=name.value;
	}
    javaName.value = trim(javaName.value) ;
	  var keyGenerator = document.forms[0].keyGenerator;
	  var isSearch = document.forms[0].isSearch;
	  var methodSingle = document.forms[0].methodSingle;
	  var creTime = document.forms[0].creTime;
	var columnType = document.forms[0].columnType;
	if(trim(columnType.value)==""){
	    columnType.value ="VARCHAR";
	}
	columnType.value = trim(columnType.value.toUpperCase());
	var columnSize = document.forms[0].columnSize;
	if(trim(columnSize.value)==""){
	    columnSize.value ="32";
	}
	columnSize.value=trim(columnSize.value);
	var javaType = document.forms[0].javaType;
	javaType.value=trim(javaType.value);
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
	  alert("请输入所属模型！");    
	  parent.focus();
	  return false;
	}
    parent.value = trim(parent.value) ;
    switch(columnType.value){
    	case "CHAR":
    	case "VARCHAR":
    	case "VARCHAR2":
    		if(javaType.value!="String"
    			&&javaType.value!="String[]"
    			&&javaType.value!="java.lang.String"
    			&&javaType.value!="java.lang.String[]"){
    				javaType.value="java.lang.String" ;
    			};
    		
    		break;
    	case "BIGINT":
    		javaType.value="long";
    		break;
    	case "BINARY":
    		javaType.value="byte[]";
    		break;
    	case "BLOB":
    		javaType.value="byte[]";
    		break;
    	case "CLOB":
    		javaType.value="byte[]";
    		break;
    	case "DATE":
    		javaType.value="java.sql.Date";
    		break;
    	case "DECIMAL":
    		javaType.value="java.math.BigDecimal";
    		break;
    	case "DOUBLE":
    		javaType.value="dobule";
    		break;
    	case "FLOAT":
    		javaType.value="float";
    		break;
    	case "INTEGER":
    		javaType.value="int";
    		break;
    	case "NUMERIC":
    		javaType.value="float";
    		break;
    	case "REAL":
    		javaType.value="float";
    		break;
    	case "SMALLINT":
    		javaType.value="short";
    		break;
    	case "TIME":
    		javaType.value="java.sql.Time";
    		break;
    	case "TIMESTAMP":
    		javaType.value="java.sql.Timestamp";
    		break;
    	case "TINYINT":
    		javaType.value="short";
    		break;
    	default:
    		alert("请输入正确的数据库字段类型!");
    		return false;
    }
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="属性域修改" >
<bsp:containbutton action="soacolumn.cmd?method=update" text="保存" onclick="forSave()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
					<html:hidden name="categoryId" property="categoryId" write="false"/>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.CATEGORY_NAME")%>：</td>
                    <td class="tdRight"><html:text name="name" property="name" size="32" maxlength="32" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.CATEGORY_DESC")%>：</td>
                    <td class="tdRight"><html:text name="desc" property="desc" size="32" maxlength="255" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.COLUMN_ASSOCIATE")%>：</td>
                    <td class="tdRight"><html:text name="associate" property="associate" size="32" maxlength="32" />
                    <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectColumn()"></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.COLUMN_TYPE")%>：</td>
                    <td class="tdRight"><html:text name="columnType" property="columnType" size="32" maxlength="10" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.COLUMN_COLUMNSIZE")%>：</td>
                    <td class="tdRight"><html:text name="columnSize" property="columnSize" size="32" maxlength="32" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.COLUMN_DEFAULT")%>：</td>
                    <td class="tdRight"><html:text name="defaultValue" property="defaultValue" size="32" maxlength="255" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.COLUMN_JAVANAME")%>：</td>
                    <td class="tdRight"><html:text name="javaName" property="javaName" size="32" maxlength="32" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.JAVA_TYPE")%>：</td>
                    <td class="tdRight"><html:text name="javaType" property="javaType" size="32" maxlength="255" /></td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.IS_NOTNULL")%>：</td>
                    <td class="tdRight">
                    	<html:select name="isNotNull" property="isNotNull">
	                        <html:options collection="SOACOLUMN_ISNOTNULL_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.COLUMN_KEYTYPE")%>：</td>
                    <td class="tdRight">
                    	<html:select name="keyType" property="keyType">
	                        <html:options collection="SOACOLUMN_KEYTYPE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.KEY_GENERATOR")%>：</td>
                    <td class="tdRight">
                    	<html:select name="keyGenerator" property="keyGenerator">
	                        <html:options collection="SOACOLUMN_KEYGENERATOR_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.COLUMN_SORTED")%>：</td>
                    <td class="tdRight">
                    	<html:select name="sortedType" property="sortedType" value="OTHER">
	                        <html:options collection="SOACOLUMN_SORTEDTYPE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.ISSEARCH")%>：</td>
                    <td class="tdRight">
                    	<html:select name="isSearch" property="isSearch">
	                        <html:options collection="SOACOLUMN_ISSEARCH_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.METHOD_SINGLE")%>：</td>
                    <td class="tdRight">
                    	<html:checkboxGroup name="methodSingle" property="methodSingle" collection="SOACOLUMN_METHODSINGLE_COLLECTION" labelProperty="value" labelKey="key">
	                    </html:checkboxGroup>
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_COLUMN.CRE_TIME")%>：</td>
                    <td class="tdRight"><date:date name="creTime" property="creTime" divname="creTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd">
						</date:date></td>
                    </tr>                    
					<tr>
					
                    <html:hidden name="parent" property="parent" write="false" />                     
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkSoaColumn()) return;	
  document.forms[0].action ="soacolumn.cmd?method=update";
  document.forms[0].submit();	
}
function selectColumn(){
  var url ="soacategory.cmd?method=getModel&parentid=-1&rtnpath=columnhelproot&modelType=1";
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
	  return;
  } else {
	  document.forms[0].associate.value= win[0];
	  document.forms[0].associate.text= win[1];
  }
}
</script>