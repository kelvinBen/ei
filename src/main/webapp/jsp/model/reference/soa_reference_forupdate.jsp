<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="org.sotower.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>
<HEAD>
<TITLE>关联模型修改</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<sotower:ui css='date.css'/>">
<script language="javascript" src="<sotower:ui js='calendar.js'/>"></script>
<script language="javascript" src="<sotower:ui js='sotowerfunction.js'/>"></script>
<script language="javascript">
function checkSoaReference(){
	var categoryId = document.forms[0].categoryId;
      if ( __isQuoteIn(categoryId.value) )
    {
      alert("关联标识不能含有引号或单引号!"); 
      categoryId.focus();     
      return false;
    }
  	if (trim(categoryId.value)=="")
	{
	  alert("请输入关联标识！");   
	  categoryId.focus(); 
	  return false;
	}
    categoryId.value = trim(categoryId.value) ;
	var desc = document.forms[0].desc;
  	if (trim(desc.value)=="")
	{
	  alert("请输入关联描述！");   
	  desc.focus(); 
	  return false;
	}
    desc.value = trim(desc.value) ;
	var columnId = document.forms[0].columnId;
  	if (trim(columnId.value)=="")
	{
	  alert("请输入字段模型！");   
	  columnId.focus(); 
	  return false;
	}
    columnId.value = trim(columnId.value) ;
	var permanenceId = document.forms[0].permanenceId;
  	if (trim(permanenceId.value)=="")
	{
	  alert("请输入持久模型！");   
	  permanenceId.focus(); 
	  return false;
	}
    permanenceId.value = trim(permanenceId.value) ;
	var refColumn = document.forms[0].refColumn;
  	if (trim(refColumn.value)=="")
	{
	  alert("请输入关联字段！");   
	  refColumn.focus(); 
	  return false;
	}
    refColumn.value = trim(refColumn.value) ;
	var refPm = document.forms[0].refPm;
  	if (trim(refPm.value)=="")
	{
	  alert("请输入关联持久模型！");   
	  refPm.focus(); 
	  return false;
	}
    refPm.value = trim(refPm.value) ;
	var creTime = document.forms[0].creTime;
  	if (trim(creTime.value)=="")
	{
	  alert("请输入创建时间！");   
	  creTime.focus(); 
	  return false;
	}
    creTime.value = trim(creTime.value) ;
	if( !__checkStdDate(creTime))
	{
		alert("创建时间"+sError);
     creTime.focus();
     return false;
    } 
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="关联模型修改" >
<bsp:containbutton action="soareference.cmd?method=update" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="soareferencequery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_REFERENCE.CATEGORY_ID")%>：</td>
                    <td class="tdRight"><html:text name="categoryId" property="categoryId" size="32" maxlength="32" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_REFERENCE.CATEGORY_DESC")%>：</td>
                    <td class="tdRight"><html:text name="desc" property="desc" size="32" maxlength="255" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_REFERENCE.COLUMN_ID")%>：</td>
                    <td class="tdRight"><html:text name="columnId" property="columnId" size="32" maxlength="32" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_REFERENCE.PERMANENCE_ID")%>：</td>
                    <td class="tdRight"><html:text name="permanenceId" property="permanenceId" size="32" maxlength="32" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_REFERENCE.REF_COLUMN")%>：</td>
                    <td class="tdRight"><html:text name="refColumn" property="refColumn" size="32" maxlength="32" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_REFERENCE.REF_PERMANENCE")%>：</td>
                    <td class="tdRight"><html:text name="refPm" property="refPm" size="32" maxlength="32" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_REFERENCE.CRE_TIME")%>：</td>
                    <td>
						<date:date name="creTime" property="creTime" divname="creTimedd" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">
						</date:date>
					</td>
					</tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkSoaReference()) return;	
  document.forms[0].action ="soareference.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="soareferencequery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>