<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>类别管理修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkMofCategory(){
	var type = document.forms[0].type;
	if (trim(type.value)=="")
	{
	  alert("请输入类型！");    
	  return false;
	}
	if ( byteLength(trim(type.value))>10 ) 
    {
  	  alert("输入的类型太长，不得超过10个字节!");
  	  type.focus();
	  return false;
    }
    type.value = trim(type.value) ;
	  var categoryName = document.forms[0].categoryName;
	if (trim(categoryName.value)=="")
	{
	  alert("请输入名称！");    
	  return false;
	}
	if ( byteLength(trim(categoryName.value))>60 ) 
    {
  	  alert("输入的名称太长，不得超过60个字节!");
  	  categoryName.focus();
	  return false;
    }
	categoryName.value = trim(categoryName.value) ;
	  var parent = document.forms[0].parent;
	if (trim(parent.value)=="")
	{
	  alert("请输入上级内码！");    
	  return false;
	}
	if ( byteLength(trim(parent.value))>40 ) 
    {
  	  alert("输入的上级内码太长，不得超过40个字节!");
  	  note.focus();
	  return false;
    }
	  parent.value = trim(parent.value) ;
	  var note = document.forms[0].note;
	  if ( byteLength(trim(note.value))>255 ) 
    {
  	  alert("输入的备注太长，不得超过255个字节!");
  	  note.focus();
	  return false;
    }
	
	return true;
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<widgets:container title="类别管理修改" >
<widgets:containbutton text="保存" onclick="forSave()"></widgets:containbutton>
<widgets:containbutton text="恢复" onclick="forReset()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
			<html:hidden name="categoryId" property="categoryId" write="false" />                                   
					                 
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_CATEGORY.NAME")%>：</td>
                    <td class="tdRight"><html:text name="categoryName" property="categoryName" size="32" maxlength="60" /><font color="#FF0000"> *</font></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_CATEGORY.PARENT")%>：</td>
                    <td class="tdRight"><html:text name="parent" property="parent" size="32" readonly="true" maxlength="40" /><font color="#FF0000"> *</font></td>
                    </tr>  
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_CATEGORY.TYPE")%>：</td>
                    <td class="tdRight"><html:text name="type" property="type" size="32" maxlength="10" /><font color="#FF0000"> *</font></td>
                    </tr>   
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_CATEGORY.NOTE")%>：</td>
                    <td class="tdRight"><html:text name="note" property="note" size="32" maxlength="255" /></td>
                    </tr>                    
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMofCategory()) return;	
  document.forms[0].action ="mofcategory.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mofcategoryquery.cmd?clear=true";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>