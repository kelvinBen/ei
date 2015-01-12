<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<link rel="stylesheet" type="text/css"
	href="<mast:ui css='skin.css'/>">
<script language="javascript"
	src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkOrganType(){

 var typeName = document.all.typeName;
  if ( __isQuoteIn(typeName.value) )
    {
      alert("组织类型名称不能含有特殊字符！"); 
      typeName.value="";
      typeName.select();
      typeName.focus();     
      return false;
    }
  if (trim(typeName.value)=="")
  {
    alert("请输入组织类型名称！");    
    return false;
  }
  typeName.value = trim(typeName.value) ;
 
 if(!stringLengthCheck(typeName,60,"组织类型名称长度不能超过60个字符！")){
     typeName.value="";
  	 typeName.select();
  	 typeName.focus();
     return false;
  }
  return true
}


</script>
</HEAD>
<BODY topmargin="10px"">
<form action="organtype.cmd?method=update" method="post" name="tt">
<bsp:container title="组织类型修改">
	<bsp:containbutton text="保存" onclick="forSave()"
		action="organtype.cmd?method=update"></bsp:containbutton>
	<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
	<bsp:containbutton text="返回" onclick="forReturn()" action="organtypequery.cmd"></bsp:containbutton>
	<div align="center">
	<table width="100%" cellpadding="0" class="tblContent">


		<tr>
			<td class="tdTitle">组织类型代码：</td>
			<td class="tdRight"><html:hidden name="organType"
				property="organType" write="true" /></td>
		</tr>

		<tr>
			<td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_TYPE.TYPE_NAME")%>：</td>
			<td class="tdRight"><html:text name="typeName"
				property="typeName" size="36" maxlength="60" /><FONT COLOR=#ff0000>*</FONT></td>
		</tr>


		<tr>
			<td class="tdTitle">上级组织类型代码：</td>
			<td class="tdRight"><html:hidden name="parentType"
				property="parentType" write="true" /></td>
		</tr>


		<html:hidden name="inUse" property="inUse" write="false" />
	</table>
	</div>
</bsp:container>
</form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkOrganType()) return;	
  document.all.tt.action ="organtype.cmd?method=update";
  document.all.tt.submit();	
}
function forReturn(){
  document.forms[0].action ="organtypequery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.all.tt.reset();	
}
 
</script>
